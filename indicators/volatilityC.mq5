#property version   "1.00"
#property indicator_separate_window 
#property indicator_buffers 2 
#property indicator_plots   1

#property indicator_type1 DRAW_COLOR_HISTOGRAM
#property indicator_color1 Gray,Purple,Red,Gold
#property indicator_style1 STYLE_SOLID
#property indicator_width1 2
#property indicator_label1 "Change of Volatility"
#define RESET 0 
input uint MPeriod=1;            // Momentum period
input uint Short=6;
input uint Long=100;
input uint MaxTrendLevel=80;     // Maximum trend level
input uint MiddLeTrendLevel=50;  // Middle trend level
input uint FlatLevel=30;         // Flat level

//Buffers
double StdDevBuffer[],ColorBuffer[];
int min_rates_total;
//Including Algo
#include <Algo.mqh> 

//OnInit
void OnInit()
  {
   min_rates_total=int(MPeriod+MathMax(Short,Long));
   SetIndexBuffer(0,StdDevBuffer,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,min_rates_total);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   SetIndexBuffer(1,ColorBuffer,INDICATOR_COLOR_INDEX);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,min_rates_total);
   string shortname;
   StringConcatenate(shortname,"Change of Volatility( ",MPeriod,", ",Short,", ",Long," )");
   IndicatorSetString(INDICATOR_SHORTNAME,shortname);
   IndicatorSetInteger(INDICATOR_DIGITS,0);
   IndicatorSetInteger(INDICATOR_LEVELS,3);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,MaxTrendLevel);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,MiddLeTrendLevel);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,2,FlatLevel);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,0,Magenta);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,1,Blue);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,2,Gray);
   IndicatorSetInteger(INDICATOR_LEVELSTYLE,0,STYLE_DASHDOTDOT);
   IndicatorSetInteger(INDICATOR_LEVELSTYLE,1,STYLE_DASHDOTDOT);
   IndicatorSetInteger(INDICATOR_LEVELSTYLE,2,STYLE_DASHDOTDOT);
  }

//OnCalculate
int OnCalculate(const int rates_total,    
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   if(rates_total<min_rates_total) return(RESET); //To verify that we actually have anough bars
   int first,bar;
   double stdl,stds,smal,smas,momentum;
   if(prev_calculated==0) // checking for the first start of the indicator calculation
      first=0;                   // starting index for calculation of all bars
   else first=prev_calculated-1; // starting index for calculation of new bars
   static CMomentum Mom;
   static CStdDeviation STDL,STDS;
   static CMoving_Average SMAL,SMAS;

   //Looping
   for(bar=first; bar<rates_total && !IsStopped(); bar++)
     {
      momentum=Mom.MomentumSeries(0,prev_calculated,rates_total,MPeriod,close[bar],bar,false);
      momentum/=_Point;

      smal=SMAL.SMASeries(MPeriod,prev_calculated,rates_total,Long,momentum,bar,false);
      stdl=STDL.StdDevSeries(MPeriod,prev_calculated,rates_total,Long,2,momentum,smal,bar,false);
      smas=SMAS.SMASeries(MPeriod,prev_calculated,rates_total,Short,momentum,bar,false);
      stds=STDS.StdDevSeries(MPeriod,prev_calculated,rates_total,Short,2,momentum,smas,bar,false);

      if(stdl) StdDevBuffer[bar]=100*stds/stdl;
      else StdDevBuffer[bar]=0.0;
      ColorBuffer[bar]=0;
      if(StdDevBuffer[bar]>MaxTrendLevel) ColorBuffer[bar]=3;
      else if(StdDevBuffer[bar]>MiddLeTrendLevel) ColorBuffer[bar]=2;
      else if(StdDevBuffer[bar]>FlatLevel) ColorBuffer[bar]=1;
     }
   return(rates_total);
  }
