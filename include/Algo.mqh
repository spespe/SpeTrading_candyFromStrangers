class MSeries
  {
public:
   void              MALengthCheck(string LengthName,int    ExternLength);
   void              MALengthCheck(string LengthName,double ExternLength);

protected:
   bool              BarCheck1(int begin,int bar,bool Set);
   bool              BarCheck2(int begin,int bar,bool Set,int Length);
   bool              BarCheck3(int begin,int bar,bool Set,int Length);

   bool              BarCheck4(int rates_total,int bar,bool Set);
   bool              BarCheck5(int rates_total,int bar,bool Set);
   bool              BarCheck6(int rates_total,int bar,bool Set);

   void              LengthCheck(int    &ExternLength);
   void              LengthCheck(double &ExternLength);

   void              Recount_ArrayZeroPos(int &count,
                                          int Length,
                                          uint prev_calculated,
                                          uint rates_total,
                                          double series,
                                          int bar,
                                          double &Array[],
                                          bool set
                                          );

   int               Recount_ArrayNumber(int count,int Length,int Number);

   bool              SeriesArrayResize(string FunctionsName,
                                       int Length,
                                       double &Array[],
                                       int &Size_
                                       );

   bool              ArrayResizeErrorPrint(string FunctionsName,int &Size_);
  };

  
class MaClass : public MSeries
  {
public:
   double            MASeries(uint begin,               
                              uint prev_calculated,     
                              uint rates_total,         
                              int Length,               
                              ENUM_MA_METHOD MA_Method, 
                              double series,            
                              uint bar,                 
                              bool set                  
                              );

   double            SMASeries(uint begin,              
                               uint prev_calculated,    
                               uint rates_total,        
                               int Length,              
                               double series,           
                               uint bar,                
                               bool set                 
                               );

   double            EMASeries(uint begin,              
                               uint prev_calculated,    
                               uint rates_total,        
                               double Length,           
                               double series,           
                               uint bar,                
                               bool set                 
                               );

   double            SMMASeries(uint begin,             
                                uint prev_calculated,   
                                uint rates_total,       
                                int Length,             
                                double series,          
                                uint bar,               
                                bool set                
                                );

   double            LWMASeries(uint begin,             
                                uint prev_calculated,   
                                uint rates_total,       
                                int Length,             
                                double series,          
                                uint bar,               
                                bool set                
                                );

protected:
   double            m_SeriesArray[];
   int               m_Size_,m_count,m_weight;
   double            m_Moving,m_MOVING,m_Pr;
   double            m_sum,m_SUM,m_lsum,m_LSUM;
  };

  
class CDev : public MSeries
  {
public:
   double            StdDevSeries(uint begin,             
                                  uint prev_calculated,   
                                  uint rates_total,       
                                  int Length,             
                                  double deviation,       
                                  double series,          
                                  double MovSeries,       
                                  uint bar,               
                                  bool set                
                                  );
protected:
   int               m_Size_,m_count;
   double            m_Sum,m_SUM,m_Sum2,m_SUM2;
   double            m_SeriesArray[];
  };

  
class CJJMA : public MSeries
  {
public:
   double            JJMASeries(uint begin,              
                                uint prev_calculated,    
                                uint rates_total,        
                                int  Din,                
                                double Phase,            
                                double Length,           
                                double series,           
                                uint bar,                
                                bool set                 
                                );

   void              JJMALengthCheck(string LengthName,int ExternLength);
   void              JJMAPhaseCheck(string PhaseName,int ExternPhase);

protected:
   void              JJMAInit(uint begin,int Din,double Phase,double Length,double series,uint bar);

   bool              m_start;
   double            m_array[62];
   double            m_degree,m_Phase,m_sense;
   double            m_Krx,m_Kfd,m_Krj,m_Kct;
   double            m_var1,m_var2;
   int               m_pos2,m_pos1;
   int               m_Loop1,m_Loop2;
   int               m_midd1,m_midd2;
   int               m_count1,m_count2,m_count3;
   double            m_ser1,m_ser2;
   double            m_Sum1,m_Sum2,m_JMA;
   double            m_storage1,m_storage2,m_djma;
   double            m_hoop1[128],m_hoop2[11],m_data[128];

   int               m_pos2_,m_pos1_;
   int               m_Loop1_,m_Loop2_;
   int               m_midd1_,m_midd2_;
   int               m_count1_,m_count2_,m_count3_;
   double            m_ser1_,m_ser2_;
   double            m_Sum1_,m_Sum2_,m_JMA_;
   double            m_storage1_,m_storage2_,m_djma_;
   double            m_hoop1_[128],m_hoop2_[11],m_data_[128];
   bool              m_bhoop1[128],m_bhoop2[11],m_bdata[128];
  };

class CAMA : public MSeries
  {
public:
   double            AMASeries(uint begin,               
                               uint prev_calculated,     
                               uint rates_total,         
                               int Length,               
                               int Fast_Length,          
                               int Slow_Length,          
                               double Rate,              
                               double series,            
                               uint bar,                 
                               bool set                  
                               );
protected:
   double            m_SeriesArray[];
   double            m_dSeriesArray[];
   double            m_NOISE,m_noise;
   double            m_Ama,m_AMA_,m_slowSC,m_fastSC,m_dSC;
   int               m_Size_1,m_Size_2,m_count;
  };
  
class CParMA : public MSeries
  {
public:
   double            ParMASeries(uint begin,             
                                 uint prev_calculated,   
                                 uint rates_total,       
                                 int Length,             
                                 double series,          
                                 uint bar,               
                                 bool set                
                                 );
protected:
   void              ParMAInit(double Length);

   double            m_SeriesArray[];
   int               m_Size_,m_count;
   int               m_sum_x,m_sum_x2,m_sum_x3,m_sum_x4;
  };

class CT3 : public CSeries
  {
public:
   double            T3Series(uint begin,                
                              uint prev_calculated,      
                              uint rates_total,          
                              int  Din,                  
                              double Curvature,          
                              double Length,             
                              double series,             
                              uint bar,                  
                              bool set                   
                              );
protected:
   void              T3Init(uint begin,
                            int Din,
                            double Curvature,
                            double Length,
                            double series,
                            uint bar
                            );
   double            m_b2,m_b3;
   double            m_e1,m_e2,m_e3,m_e4,m_e5,m_e6;
   double            m_E1,m_E2,m_E3,m_E4,m_E5,m_E6;
   double            m_c1,m_c2,m_c3,m_c4,m_w1,m_w2;
  };

class CJurX : public MSeries
  {
public:
   double            JurXSeries(uint begin,              
                                uint prev_calculated,    
                                uint rates_total,        
                                int  Din,                
                                double Length,           
                                double series,           
                                uint bar,                
                                bool set                 
                                );
protected:
   void              JurXInit(uint begin,
                              int Din,
                              double Length,
                              double series,
                              uint bar
                              );

   double            m_AB,m_AC;
   double            m_f1,m_f2,m_f3,m_f4,m_f5;
   double            m_f6,m_Kg,m_Hg,m_F1,m_F2;
   double            m_F3,m_F4,m_F5,m_F6,m_w;
  };
  
  class CCMO : public CSeries
  {
public:

   double            VIDYASeries(uint begin,             
                                 uint prev_calculated,   
                                 uint rates_total,       
                                 int CMO_Length,         
                                 double EMA_Length,
                                 double series,          
                                 uint bar,               
                                 bool set                
                                 );

   double            CMOSeries(uint begin,               
                               uint prev_calculated,     
                               uint rates_total,         
                               int CMO_Length,           
                               double series,
                               uint bar,                 
                               bool set                  
                               );

protected:
   double            m_dSeriesArray[];
   int               m_Size_,m_count;
   double            m_UpSum_,m_UpSum,m_DnSum_,m_DnSum,m_Vidya,m_Vidya_;
   double            m_AbsCMO_,m_AbsCMO,m_series1,m_series1_,m_SmoothFactor;
  };
  
class Momntm : public MSeries
  {
public:
   double            nMomentumSeries(uint begin,          
                                     uint prev_calculated,
                                     uint rates_total,    
                                     int Length,          
                                     double series,       
                                     uint bar,            
                                     bool set             
                                     );
protected:

   double            m_SeriesArray[];
   int               m_Size_,m_count;
  };

class CR : public MSeries
  {
public:
   double            ROCSeries(uint begin,               
                               uint prev_calculated,     
                               uint rates_total,         
                               int Length,               
                               double series,            
                               uint bar,                 
                               bool set                  
                               );
protected:

   double            m_SeriesArray[];
   int               m_Size_,m_count;
  };
  
  class CMomentum : public CSeries  {
public:
   double            MomentumSeries(uint begin,          
                                    uint prev_calculated,
                                    uint rates_total,    
                                    int Length,          
                                    double series,       
                                    uint bar,            
                                    bool set             
                                    );
protected:

   double            m_SeriesArray[];
   int               m_Size_,m_count;
  };
  
  class CFL : public CSeries
  {
public:
   double            FATLSeries(uint begin,             
                                uint prev_calculated,   
                                uint rates_total,       
                                double series,          
                                uint bar,               
                                bool set                
                                );
                     CFATL();
protected:
   double            m_SeriesArray[39];
   int               m_Size_,m_count;
   double            m_FATL;

   double            m_FATLTable[39];
  };
  
  
  class CSATL : public CSeries
  {
public:
   double            SATLSeries(uint begin,            
                                uint prev_calculated,  
                                uint rates_total,      
                                double series,         
                                uint bar,              
                                bool set               
                                );
                     CSATL();
protected:
   double            m_SeriesArray[65];
   int               m_Size_,m_count;
   double            m_SATL;

   double            m_SATLTable[65];
  };
  class CRFTL : public CMovSeriesTools
  {
public:
   double            RFTLSeries(uint begin,           
                                uint prev_calculated, 
                                uint rates_total,     
                                double series,        
                                uint bar,             
                                bool set              
                                );
                     CRFTL();
protected:
   double            m_SeriesArray[44];
   int               m_Size_,m_count;
   double            m_RFTL;

   double            m_RFTLTable[44];
  };

  class CRSTL : public CSeries
  {
public:
   double            RSTLSeries(uint begin,           
                                uint prev_calculated, 
                                uint rates_total,     
                                double series,        
                                uint bar,             
                                bool set              
                                );
                     CRSTL();
protected:
   double            m_SeriesArray[99];
   int               m_Size_,m_count;
   double            m_RSTL;

   double            m_RSTLTable[99];
  };

  
  class CXMA_SM
  {
public:
   enum Smooth_Method
     {
      MODE_SMA_,  MODE_EMA_,MODE_SMMA_,  MODE_LWMA_,       MODE_JJMA,        MODE_JurX,        MODE_ParMA,       MODE_T3,          MODE_VIDYA,       MODE_AMA    
     };

   double            XMASeries(uint begin,                                          uint prev_calculated,                                uint rates_total,                                    Smooth_Method Method,                                int Phase,                                int Length,                                          double series,                                       uint bar,                                            bool set              
                               );

   int               GetStartBars(Smooth_Method Method,int Length,int Phase);
   string            GetString_MA_Method(Smooth_Method Method);
   void              XMAPhaseCheck(string PhaseName,int ExternPhase,Smooth_Method Method);
   void              XMALengthCheck(string LengthName,int ExternLength);
   void              XMAInit(Smooth_Method Method);
                     CXMA(){m_init=false;};
                    ~CXMA();

protected:

   CMoving_Average *SMA;
   CMoving_Average *EMA;
   CMoving_Average *SMMA;
   CMoving_Average *LWMA;
   CJJMA            *JJMA;
   CJurX            *JurX;
   CParMA           *ParMA;
   CT3              *T3;
   CCMO             *VIDYA;
   CAMA             *AMA;

   bool              m_init;
   Smooth_Method     m_Method;
  };

int StartingBarFind(Smooth_Method Method,int Length,int Phase)
  {
   switch(Method)
     {
      case MODE_SMA_:  return(Length);
      case MODE_EMA_:  return(0);
      case MODE_SMMA_: return(Length+1);
      case MODE_LWMA_: return(Length);
      case MODE_JJMA:  return(30);
      case MODE_JurX:  return(0);
      case MODE_ParMA: return(Length);
      case MODE_T3:    return(0);
      case MODE_VIDYA: return(Phase+2);
      case MODE_AMA:   return(Length+2);
     }
   return(0);
  }
  
  double PSeries(uint applied_price,  
                   uint   bar,          
                   const double &Open[],
                   const double &Low[],
                   const double &High[],
                   const double &Close[]
                   )
  {
   switch(applied_price)
     {
      case  PRICE_CLOSE: return(Close[bar]);
      case  PRICE_OPEN: return(Open [bar]);
      case  PRICE_HIGH: return(High [bar]);
      case  PRICE_LOW: return(Low[bar]);
      case  PRICE_MEDIAN: return((High[bar]+Low[bar])/2.0);
      case  PRICE_TYPICAL: return((Close[bar]+High[bar]+Low[bar])/3.0);
      case  PRICE_WEIGHTED: return((2*Close[bar]+High[bar]+Low[bar])/4.0);

      case  8: return((Open[bar] + Close[bar])/2.0);
      case  9: return((Open[bar] + Close[bar] + High[bar] + Low[bar])/4.0);
      case 10:
        {
         if(Close[bar]>Open[bar]) return(High[bar]);
         else
           {
            if(Close[bar]<Open[bar]) return(Low[bar]);
            else return(Close[bar]);
           }
        }
      case 11:
        {
         if(Close[bar]>Open[bar])return((High[bar]+Close[bar])/2.0);
         else
           {
            if(Close[bar]<Open[bar]) return((Low[bar]+Close[bar])/2.0);
            else return(Close[bar]);
           }
        }
      case 12:
        {
         double res=High[bar]+Low[bar]+Close[bar];

         if(Close[bar]<Open[bar]) res=(res+Low[bar])/2;
         if(Close[bar]>Open[bar]) res=(res+High[bar])/2;
         if(Close[bar]==Open[bar]) res=(res+Close[bar])/2;
         return(((res-Low[bar])+(res-High[bar]))/2);
        }
      default: return(Close[bar]);
     }
  }

double iPriceSeries(string          symbol,        
                    ENUM_TIMEFRAMES timeframe,     
                    uint            applied_price, 
                    uint            bar,           
                    bool            set            
                    )
  {
   uint Bar;
   double diPriceSeries,price[1];
   if(!set)
      Bar=Bars(symbol,timeframe)-1-bar;
   else Bar=bar;
   switch(applied_price)
     {
      case  1: CopyClose(symbol, timeframe, Bar, 1, price); diPriceSeries = price[0]; break;
      case  2: CopyOpen (symbol, timeframe, Bar, 1, price); diPriceSeries = price[0]; break;
      case  3: CopyHigh (symbol, timeframe, Bar, 1, price); diPriceSeries = price[0]; break;
      case  4: CopyLow  (symbol, timeframe, Bar, 1, price); diPriceSeries = price[0]; break;
      case  5: CopyHigh(symbol,timeframe,Bar,1,price); diPriceSeries=price[0];
      CopyLow(symbol,timeframe,Bar,1,price); diPriceSeries+=price[0];
      diPriceSeries/=2.0;
      break;
      case  6: CopyClose(symbol,timeframe,Bar,1,price); diPriceSeries=price[0];
      CopyHigh (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      CopyLow  (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      diPriceSeries/=3.0;
      break;
      case  7: CopyClose(symbol,timeframe,Bar,1,price); diPriceSeries=price[0]*2;
      CopyHigh (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      CopyLow  (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      diPriceSeries/=4.0;
      break;

      case  8: CopyClose(symbol,timeframe,Bar,1,price); diPriceSeries=price[0];
      CopyOpen(symbol,timeframe,Bar,1,price); diPriceSeries+=price[0];
      diPriceSeries/=2.0;
      break;
      case  9: CopyClose(symbol,timeframe,Bar,1,price); diPriceSeries=price[0];
      CopyOpen (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      CopyHigh (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      CopyLow  (symbol, timeframe, Bar, 1, price); diPriceSeries += price[0];
      diPriceSeries/=4.0;
      break;
      case 10:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         CopyClose(symbol,timeframe,Bar,1,Close_);
         CopyOpen(symbol,timeframe,Bar,1,Open_);
         CopyHigh(symbol,timeframe,Bar,1,High_);
         CopyLow(symbol,timeframe,Bar,1,Low_);
         if(Close_[0]>Open_[0])diPriceSeries=High_[0];
         else
           {
            if(Close_[0]<Open_[0])
               diPriceSeries=Low_[0];
            else diPriceSeries=Close_[0];
           }
         break;
        }
      case 11:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         CopyClose(symbol,timeframe,Bar,1,Close_);
         CopyOpen(symbol,timeframe,Bar,1,Open_);
         CopyHigh(symbol,timeframe,Bar,1,High_);
         CopyLow(symbol,timeframe,Bar,1,Low_);
         if(Close_[0]>Open_[0])diPriceSeries=(High_[0]+Close_[0])/2.0;
         else
           {
            if(Close_[0]<Open_[0])
               diPriceSeries=(Low_[0]+Close_[0])/2.0;
            else diPriceSeries=Close_[0];
           }
         break;
        }
      case 12:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         CopyClose(symbol,timeframe,Bar,1,Close_);
         CopyOpen(symbol,timeframe,Bar,1,Open_);
         CopyHigh(symbol,timeframe,Bar,1,High_);
         CopyLow(symbol,timeframe,Bar,1,Low_);
         double res=High_[0]+Low_[0]+Close_[0];

         if(Close_[0]<Open_[0]) res=(res+Low_[0])/2;
         if(Close_[0]>Open_[0]) res=(res+High_[0])/2;
         if(Close_[0]==Open_[0]) res=(res+Close_[0])/2;
         diPriceSeries=((res-Low_[0])+(res-High_[0]))/2;
         break;
        }
      default: CopyClose(symbol,timeframe,Bar,1,price); diPriceSeries=price[0]; break;
     }
   return(diPriceSeries);
  }
  
  
  void iAlert(uchar price)
  {
   if(price<1)
      Alert("The applied_price parameter must not be less than 1. You have specified incorrect value",
            price," value 1 will be used");                    
   if(price>11)
      Alert("The parameter applied_price must not exceed 11. You have specified incorrect value",
            price," value 1 will be used");
  }
  
  double CM_A::MSeries(uint begin,             
                                 uint prev_calculated,     
                                 uint rates_total,         
                                 int Length,               
                                 ENUM_MA_METHOD MA_Method, 
                                 double series,            
                                 uint bar,                 
                                 bool set                  
                                 )
  {

   switch(MA_Method)
     {
      case MODE_SMA:  return(SMASeries (begin, prev_calculated, rates_total, Length, series, bar, set));
      case MODE_EMA:  return(EMASeries (begin, prev_calculated, rates_total, Length, series, bar, set));
      case MODE_SMMA: return(SMMASeries(begin, prev_calculated, rates_total, Length, series, bar, set));
      case MODE_LWMA: return(LWMASeries(begin, prev_calculated, rates_total, Length, series, bar, set));
      default:
        {
         if(bar==begin)
           {
            string word;
            StringConcatenate(word,__FUNCTION__,"():",
                              " The value should be between MODE_SMA to MODE_LWMA.",
                              " The value it is not accepte;d ",MA_Method," value MODE_SMA used!");
            Print(word);
           }
         return(SMASeries(begin,prev_calculated,rates_total,Length,series,bar,set));
        }
     }
  
double CMA::SMASeries(uint begin,           
                                  uint prev_calculated, 
                                  uint rates_total,     
                                  int Length,           
                                  double series,        
                                  uint bar,             
                                  bool set              
                                  )
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   int iii,kkk;
   double sma;
   LengthCheck(Length);
   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);
   Recount_ArrayZeroPos(m_count,Length,prev_calculated,rates_total,series,bar,m_SeriesArray,set);
   if(BarCheck2(begin,bar,set,Length))
     {
      m_sum=0.0;

      for(iii=1; iii<Length; iii++)
        {
         kkk=Recount_ArrayNumber(m_count,Length,iii);
         m_sum+=m_SeriesArray[kkk];
        }
     }
   else if(BarCheck3(begin,bar,set,Length)) return(EMPTY_VALUE);
   m_sum+=series;
   sma = m_sum / Length;
   kkk = Recount_ArrayNumber(m_count, Length, Length - 1);
   m_sum-=m_SeriesArray[kkk];
   if(BarCheck4(rates_total,bar,set))
     {
      m_SUM=m_sum;
     }
   if(BarCheck5(rates_total,bar,set))
     {
      m_sum=m_SUM;
     }
return(sma);
  }
  
  
  
  double CMA::EMA(uint begin,         
                                  uint prev_calculated, 
                                  uint rates_total,     
                                  double Length,        
                                  double series,        
                                  uint bar,             
                                  bool set              
                                  )
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   double ema;
   LengthCheck(Length);
   if(bar==begin)
     {
      m_Pr=2.0/(Length+1.0);
      m_Moving=series;
     }
   m_Moving=series*m_Pr+m_Moving *(1-m_Pr);
   ema=m_Moving;
   if(BarCheck4(rates_total,bar,set))
     {
      m_MOVING=m_Moving;
     }
   if(BarCheck5(rates_total,bar,set))
     {
      m_Moving=m_MOVING;
     }
   return(ema);
  }

  
double CMA::SMMA(uint begin,           
                                   uint prev_calculated, 
                                   uint rates_total,     
                                   int Length,           
                                   double series,        
                                   uint bar,             
                                   bool set              
                                   )
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);

   int iii;
   double smma;

   LengthCheck(Length);

   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,Length,prev_calculated,rates_total,series,bar,m_SeriesArray,set);

   if(BarCheck2(begin,bar,set,Length))
     {
      m_sum=0.0;
      for(iii=0; iii<Length; iii++)
         m_sum+=m_SeriesArray[iii];

      m_Moving=(m_sum-series)/(Length-1);
     }
   else if(BarCheck3(begin,bar,set,Length)) return(EMPTY_VALUE);

   m_sum=m_Moving *(Length-1)+series;
   m_Moving=m_sum/Length;
   smma=m_Moving;

   if(BarCheck4(rates_total,bar,set))
     {
      m_SUM=m_sum;
      m_MOVING=m_Moving;
     }

   if(BarCheck5(rates_total,bar,set))
     {
      m_sum=m_SUM;
      m_Moving=m_MOVING;
     }
   return(smma);
  }
  
  
double CMA::LWMA(uint begin,uint prev_calculated,uint rates_total,int Length,double series,uint bar, bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   double lwma;
   int iii,kkk,Length_=Length+1;
   LengthCheck(Length);
   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length_,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);
   Recount_ArrayZeroPos(m_count,Length_,prev_calculated,rates_total,series,bar,m_SeriesArray,set);
   if(BarCheck2(begin,bar,set,Length_))
     {
      m_sum=0.0;
      m_lsum=0.0;
      m_weight=0;
      int rrr=Length;

      for(iii=1; iii<=Length; iii++,rrr--)
        {
         kkk=Recount_ArrayNumber(m_count,Length_,iii);
         m_sum+=m_SeriesArray[kkk]*rrr;
         m_lsum+=m_SeriesArray[kkk];
         m_weight+=iii;
        }
     }
   else if(BarCheck3(begin,bar,set,Length_)) return(EMPTY_VALUE);
   m_sum+=series*Length-m_lsum;
   kkk=Recount_ArrayNumber(m_count,Length_,Length);
   m_lsum+=series-m_SeriesArray[kkk];
   lwma=m_sum/m_weight;
   if(BarCheck4(rates_total,bar,set))
     {
      m_SUM  = m_sum;
      m_LSUM = m_lsum;
     }
   if(BarCheck5(rates_total,bar,set))
     {
      m_sum=m_SUM;
      m_lsum=m_LSUM;
     }
return(lwma);
  }
  
  
  double CStdDeviation::StdD(uint begin,uint prev_calculated, uint rates_total, int Length,double deviation,double series,double MovSeries,uint bar, bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   int iii,kkk;
   double StdDev,m_SumX2;
   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);
   LengthCheck(Length);
   Recount_ArrayZeroPos(m_count,Length,prev_calculated,rates_total,series,bar,m_SeriesArray,set);
   if(BarCheck2(begin,bar,set,Length))
     {
      m_Sum=0.0;
      m_Sum2=0.0;
      for(iii=1; iii<Length; iii++)
        {
         kkk=Recount_ArrayNumber(m_count,Length,iii);
         m_Sum+=m_SeriesArray[kkk];
         m_Sum2+=MathPow(m_SeriesArray[kkk],2);
        }
     }
   else if(BarCheck3(begin,bar,set,Length)) return(EMPTY_VALUE);
   m_Sum+=series;
   m_Sum2 += MathPow(series, 2);
   m_SumX2 = Length * MathPow(MovSeries, 2) - 2 * MovSeries * m_Sum + m_Sum2;

   kkk=Recount_ArrayNumber(m_count,Length,Length-1);
   m_Sum2-=MathPow(m_SeriesArray[kkk],2);
   m_Sum -=m_SeriesArray[kkk];

   StdDev=deviation*MathSqrt(m_SumX2/Length);
   if(BarCheck5(rates_total,bar,set))
     {
      m_Sum=m_SUM;
      m_Sum2=m_SUM2;
     }
   if(BarCheck4(rates_total,bar,set))
     {
      m_SUM=m_Sum;
      m_SUM2=m_Sum2;
     }
   return(StdDev);
  }
  
  void CJJMA::JJMAInit(uint begin,
                     int  Din,
                     double Phase,
                     double Length,
                     double series,
                     uint bar)
  {

  if(bar==begin || Din!=0)
     {
      if(bar==begin)
        {
         m_midd1 = 63;
         m_midd2 = 64;
         m_start = false;

         for(int numb = 0;       numb <= m_midd1; numb++) m_data[numb] = -1000000.0;
         for(int numb = m_midd2; numb <= 127;     numb++) m_data[numb] = +1000000.0;

         ArrayInitialize(m_bhoop1,true);
         ArrayInitialize(m_bhoop2,true);
         ArrayInitialize(m_bdata,true);
         ArrayInitialize(m_hoop1_, 0.0);
         ArrayInitialize(m_hoop2_, 0.0);
         ArrayInitialize(m_hoop1,  0.0);
         ArrayInitialize(m_hoop2,  0.0);
         ArrayInitialize(m_array,  0.0);

         m_djma = 0.0;
         m_Sum1 = 0.0;
         m_Sum2 = 0.0;
         m_ser1 = 0.0;
         m_ser2 = 0.0;
         m_pos1 = 0.0;
         m_pos2 = 0.0;
         m_Loop1 = 0.0;
         m_Loop2 = 0.0;
         m_count1 = 0.0;
         m_count2 = 0.0;
         m_count3 = 0.0;
         m_storage1 = 0.0;
         m_storage2 = 0.0;
         m_JMA=series;
        }

      if(Phase>=-100 && Phase<=100)
         m_Phase=Phase/100.0+1.5;
      if(Phase > +100) m_Phase = 2.5;
      if(Phase < -100) m_Phase = 0.5;
      double velA,velB,velC,velD;
      if(Length>=1.0000000002)
         velA=(Length-1.0)/2.0;
      else velA=0.0000000001;
      velA *= 0.9;
      m_Krj = velA / (velA + 2.0);
      velC = MathSqrt(velA);
      velD = MathLog(velC);
      m_var1= velD;
      m_var2= m_var1;
	  //Adding if cycle for sensitivity
      velB=MathLog(2.0);
      m_sense=(m_var2/velB)+2.0;
      if(m_sense<0.0) m_sense=0.0;
      m_Kfd=m_sense;
	  // checking Kfd
      if(m_Kfd>=2.5)
         m_degree=m_Kfd-2.0;
      else m_degree=0.5;
	  //Setting here Krc
      m_Krx = velC * m_Kfd;
      m_Kct = m_Krx / (m_Krx + 1.0);
     }
  }
  
void CJJMA::JJMACheck(string Length,int ExternLength)
  {
//Checking input params
  if(ExternLength<1)
     {
      string word;
      StringConcatenate(word,__FUNCTION__," (): Parameter ",Length,
                        " The input specified it is incorrect",
                        ExternLength," Using value 1 by default");
      Print(word);
      return;
     }
  }
  
//Checking parameters  
void CJJMA::JJMACheck2(string Phase,int ExternPhase)
  {
   if(ExternPhase<-100)
     {
      string word;
      StringConcatenate
      (word,__FUNCTION__," (): param ",Phase,
       " must be no less than -100. Incorrect parameter specified.",
       ExternPhase," value  -100 will be used");
      Print(word);
      return;
     }
   if(ExternPhase>+100)
     {
      string word;
      StringConcatenate
      (word,__FUNCTION__," (): param ",Phase,
       " must not exceed +100. Incorrect parameter specified.",
       ExternPhase," value  +100 will be used");
      Print(word);
      return;
     }
}


double CT3::T3S(uint begin,uint prev_calculated,uint rates_total,int  Din,double Curvature,double Length,double series,uint bar,bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   double e0,T3_;
   LengthCheck(Length);
   T3Init(begin,Din,Curvature,Length,series,bar);

   e0=series;
   m_e1 = m_w1 * e0 + m_w2 * m_e1;
   m_e2 = m_w1 * m_e1 + m_w2 * m_e2;
   m_e3 = m_w1 * m_e2 + m_w2 * m_e3;
   m_e4 = m_w1 * m_e3 + m_w2 * m_e4;
   m_e5 = m_w1 * m_e4 + m_w2 * m_e5;
   m_e6 = m_w1 * m_e5 + m_w2 * m_e6;
   T3_=m_c1*m_e6+m_c2*m_e5+m_c3*m_e4+m_c4*m_e3;
   if(BarCheck5(rates_total,bar,set))
     {
      m_e1 = m_E1;
      m_e2 = m_E2;
      m_e3 = m_E3;
      m_e4 = m_E4;
      m_e5 = m_E5;
      m_e6 = m_E6;
     }
   if(BarCheck4(rates_total,bar,set))
     {
      m_E1 = m_e1;
      m_E2 = m_e2;
      m_E3 = m_e3;
      m_E4 = m_e4;
      m_E5 = m_e5;
      m_E6 = m_e6;
     }
return(T3_);
  }

void CT3::T3In(uint begin,int Din,double Curvature,double Length,double series,uint bar)
  {
  //Checking coeff
  if(bar==begin || Din!=0)
     {
      double b=Curvature/100.0;
      m_b2 = b * b;
      m_b3 = m_b2 * b;
      m_c1 = -m_b3;
      m_c2 = (3 * (m_b2 + m_b3));
      m_c3 = -3 * (2 * m_b2 + b + m_b3);
      m_c4 = (1 + 3 * b + m_b3 + 3 * m_b2);
      double n=1+0.5 *(Length-1);
      m_w1 = 2 / (n + 1);
      m_w2 = 1 - m_w1;

      if(bar==begin)
        {
         m_e1 = series;
         m_e2 = series;
         m_e3 = series;
         m_e4 = series;
         m_e5 = series;
         m_e6 = series;
        }
     }
}

void CJX::JXI(uint begin,int Din,double Length,double series,uint bar)
  {

  if(bar==begin || Din!=0)
     {
      if(Length>=6)
         m_w=Length-1;
      else m_w=5;

      m_Kg = 3 / (Length + 2.0);
      m_Hg = 1.0 - m_Kg;

      if(bar==begin)
        {
         m_f1 = series;
         m_f2 = series;
         m_f3 = series;
         m_f4 = series;
         m_f5 = series;
         m_f6 = series;

         m_AB = 0.5;
         m_AC = 1.5;
        }
     }

}

//For parabolic smoothing
void CParab::Parab(double Len)
  {
   int var_tmp;
   m_sum_x=0;
   m_sum_x2 = 0;
   m_sum_x3 = 0;
   m_sum_x4 = 0;

   for(int iii=1; iii<=Len; iii++)
     {
      var_tmp=iii;
      m_sum_x+=var_tmp;
      var_tmp *= iii;
      m_sum_x2+= var_tmp;
      var_tmp *= iii;
      m_sum_x3+= var_tmp;
      var_tmp *= iii;
      m_sum_x4+= var_tmp;
     }
}

double Moment::MomentS(uint begin, uint prev_calculated, uint rates_total, int Length, double series, uint bar, bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);

   int kkk,Length_=Length+1;
   double Momentum;

   LengthCheck(Length);

   //Array size change
   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length_,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);

   //Initializing the array
   Recount_ArrayZeroPos(m_count,Length_,prev_calculated,rates_total,series,bar,m_SeriesArray,set);
	
   if(BarCheck3(begin,bar,set,Length_)) return(EMPTY_VALUE);
   //Rate of changing
   kkk=Recount_ArrayNumber(m_count,Length_,Length);
   Momentum=series-m_SeriesArray[kkk];
   return(Momentum);
  }

double CnMomentum::nMomentumSeries(uint begin,uint prev_calculated,uint rates_total,int Length,double series,uint bar,bool set)
  {
   //if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   
   if(BarsCount(raw,n-1)) return(begin)
   
   int kkk,Length_=Length+1;
   double nMomentum;

   LengthCheck(Length);

   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length_,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,Length_,prev_calculated,rates_total,series,bar,m_SeriesArray,set);

   if(BarCheck3(begin,bar,set,Length_)) return(EMPTY_VALUE);

   kkk=Recount_ArrayNumber(m_count,Length_,Length);
   nMomentum=(series-m_SeriesArray[kkk])/m_SeriesArray[kkk];
   return(nMomentum);
  }
  
  int FindMaxSwing(Swinging Swing,int Length,int height)
  {
   switch(Swing)
     {
      case M:  return(Length);
      case N:  return(0);
      case L1: return(Length+1);
      case L: return(Length);
      case 30:  return(30);
      case J:  return(0);
      case L2: return(Length);
      case T:    return(0);
      case P2: return(Phase+2);
      case L3:   return(Length+2);
     }
   return(0);
  }
  
//Rate of change  
  double ROC::ROCS(uint begin,uint prev_calculated,uint rates_total,int Length,double series,uint bar,bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);

   int kkk,Length_=Length+1;
   double ROC;

   LengthCheck(Length);

   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length_,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,Length_,prev_calculated,rates_total,series,bar,m_SeriesArray,set);

   if(BarCheck3(begin,bar,set,Length_)) return(EMPTY_VALUE);

   kkk = Recount_ArrayNumber(m_count, Length_, Length);
   ROC = 100 * series / m_SeriesArray[kkk];
   return
   
   
 double FATL::FATLS(uint beg,uint p_calc,uint r_tot,double s,uint b,bool set)
  {
   if(BarCheck1(beg,b,set)) return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,m_Size_,p_calc,r_tot,s,b,m_SeriesArray,set);

   if(BarCheck3(beg,b,set,m_Size_)) return(EMPTY_VALUE);

double FATL=0.0;
   if(BarCheck5(r_tot,b,set))
     {
      if(p_calc!=r_tot)
        {
         m_FATL=0.0;
         for(int iii=1; iii<m_Size_; iii++)
            m_FATL+=m_FATLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
        }
      FATL=m_FATL+m_FATLTable[0]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,0)];
     }
   else for(int iii=0; iii<m_Size_; iii++)
                    FATL+=m_FATLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
	return(FATL);
  }
  
double CATL::ATLS(uint beg,uint P_calc,uint rates_t,double s,uint bb,bool SET)
  {
   if(BarCheck1(beg,bb,SET)) return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,m_Size_,P_calc,rates_t,s,bb,m_SeriesArray,SET);
   if(BarCheck3(beg,bb,SET,m_Size_)) return(EMPTY_VALUE);
   double SATL=0.0;
   if(BarCheck5(rates_t,bb,SET))
     {
      if(P_calc!=rates_t)
        {
         m_SATL=0.0;
         for(int iii=1; iii<m_Size_; iii++)
            m_SATL+=m_SATLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
        }
      SATL=m_SATL+m_SATLTable[0]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,0)];
     }
   else for(int iii=0; iii<m_Size_; iii++)
                    SATL+=m_SATLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
   return(SATL);
  }
  
double CRSTL::RSTLS(uint beg,uint P_calc,uint rates_t,double series,uint b,bool SET)
  {
   if(BarCheck1(beg,b,SET)) return(EMPTY_VALUE);

   Recount_ArrayZeroPos(m_count,m_Size_,P_calc,rates_t,series,b,m_SeriesArray,SET);
   if(BarCheck3(beg,b,SET,m_Size_)) return(EMPTY_VALUE);
   double RSTL=0.0;
   if(BarCheck5(rates_t,b,SET))
     {
      if(P_calc!=rates_t)
        {
         m_RSTL=0.0;
         for(int iii=1; iii<m_Size_; iii++)
            m_RSTL+=m_RSTLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
        }
      RSTL=m_RSTL+m_RSTLTable[0]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,0)];
     }
   else for(int iii=0; iii<m_Size_; iii++)
                    RSTL+=m_RSTLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
   return(RSTL);
  }

double CRFTL::RFTLSeries(uint begin,uint prev_calculated,uint rates_total,double series,uint bar,bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   Recount_ArrayZeroPos(m_count,m_Size_,prev_calculated,rates_total,series,bar,m_SeriesArray,set);
   if(BarCheck3(begin,bar,set,m_Size_)) return(EMPTY_VALUE);
   double RFTL=0.0;
   if(BarCheck5(rates_total,bar,set))
     {
      if(prev_calculated!=rates_total)
        {
         m_RFTL=0.0;
         for(int iii=1; iii<m_Size_; iii++)
            m_RFTL+=m_RFTLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
        }
      RFTL=m_RFTL+m_RFTLTable[0]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,0)];
     }
   else for(int iii=0; iii<m_Size_; iii++)
                    RFTL+=m_RFTLTable[iii]*m_SeriesArray[Recount_ArrayNumber(m_count,m_Size_,iii)];
   return(RFTL);
  }

  
//BARS NUMBER CALCULATION
int CXM::GBars(Method M,int L,int P)
  {
//----+ 
   switch(M)
     {
      case MODE_SMA_:  return(L);
      case MODE_EMA_:  return(0);
      case MODE_SMMA_: return(L+1);
      case MODE_LWMA_: return(L);
      case MODE_JJMA:  return(30);
      case MODE_JurX:  return(0);
      case MODE_ParMA: return(L);
      case MODE_T3:    return(0);
      case MODE_VIDYA: return(P+2);
      case MODE_AMA:   return(L+2);
     }
//----+
   return(0);
  }

  
//CXMA
double CXMA::XMAS (uint beg,uint p_cal,uint r_tot,smet Met,int Ph,int Ln,double s,uint b,bool s)
  {
   XMAInit(Met);

   switch(Met)
     {
      case MODE_SMA_:  return(SMA.SMASeries(beg,p_cal,r_tot,Ln,s,b,s));
      case MODE_EMA_:  return(EMA.EMASeries(beg,p_cal,r_tot,Ln,s,b,s));
      case MODE_SMMA_: return(SMMA.SMMASeries(beg,p_cal,r_tot,Ln,s,b,s));
      case MODE_LWMA_: return(LWMA.LWMASeries(beg,p_cal,r_tot,Ln,s,b,s));
      case MODE_JJMA:  return(JJMA.JJMASeries(beg,p_cal,r_tot,0,Ph,Ln,s,b,s));
      case MODE_JurX:  return(JurX.JurXSeries(beg,p_cal,r_tot,0,Ln,s,b,s));
      case MODE_ParMA: return(ParMA.ParMASeries(beg,p_cal,r_tot,Ln,s,b,s));
      case MODE_T3:    return(T3.T3Series(beg,p_cal,r_tot,0,Ph,Ln,s,b,s));
      case MODE_VIDYA: return(VIDYA.VIDYASeries(beg,p_cal,r_tot,Ph,Ln,s,b,s));
      case MODE_AMA:   return(AMA.AMASeries(beg,p_cal,r_tot,Ln,2,Ph,2.0,s,b,s));
     }
return(0.0);
  }
  
  
//Check for depth of length
void CXMA::XMALCheck(string LName,int ExtLen)
  {
   if(ExtLen<1)
     {
      string w;
      StringConcatenate
      (w,__FUNCTION__," (): Par ",LName,
       " should not be less than 1.",
       ExtLen," 1 will be used by default.");
      Print(w);
      return;
     }
  }
//Check smooth period
void CMovST::MALenCheck(string LName,int ExtLen)
{
if(ExtLen<1)
 {
  string w;
  StringConcatenate
  (w,__FUNCTION__," (): Par ",LName,
   " should not be no less than 1.",
   ExtLen," 1 will be used by default.");
  Print(w);
  return;
 }
}

//recalculatio of position of elem in the array
void CMovST::R_ArrZP(int &cc,int L,uint p_calc,uint r_tot,double s,int bb,double &Array[],bool s)
  {
   if(s)
     {
      if(bb!=r_tot-p_calc)
        {
         cc--;
         if(cc<0) cc=L-1;
        }
     }
   else
     {
      if(bb!=p_calc-1)
        {
         cc--;
         if(cc<0) cc=L-1;
        }
     }
   Array[cc]=s;
  }

//Changing the size of the array
bool CMST::ArraySizeChange(string FName,int Len,double &Array[],int &Sz_)
  {
   if(Len>Sz_)
     {
      int Size=Len+1;

      if(ArrayResize(Array,Size)==-1)
        {
         ArrayResizeErrorPrint(FName,Sz_);
         return(false);
        }

      Sz_=Sz;
     }
   return(true);
  }
  
  
bool CMST::ArrResError(string FName,int &S_)
  {
   string lable,word;
   StringConcatenate(lable,FName,"():");
   StringConcatenate(word,lable," Error!!!"," the size of the array of variables of the function ",FName,"()!");
   Print(word);
   int error=GetLastError();
   ResetLastError();
   if(error>4000)
     {
      StringConcatenate(word,lable,"(): Error code ",error);
      Print(word);
     }

   S_=-2;
   return(false);
   return(true);
  }

//Transforming time series into array
int CMST::Recount_ArrayNumber(int count,int Length,int Number){
	int ArrNumber=Number+count;
	if(ArrNumber>Length-1) ArrNumber-=Length;
	return(ArrNumber);
}

// Starting calculation bar check                     |
bool CMST::BC2(int b,int bb,bool Set,int Length)
  {
   if((!Set && bb==b+Length-1) || (Set && bb==b-Length+1))
      return(true);
   return(false);
  }

// bar smoothing check            |
bool CMST::BC3(int b,int bb,bool Set,int Length)
  {
   if((!Set && bb<b+Length-1) || (Set && bb>b-Length+1))
      return(true);
   return(false);
  }
  
// XMA smoothing get string
string CXMA::GetString(SM Method)
  {
   switch(Method)
     {
      case MODE_SMA_:  return("SMA");
      case MODE_EMA_:  return("EMA");
      case MODE_SMMA_: return("SMMA");
      case MODE_LWMA_: return("LWMA");
      case MODE_JJMA:  return("JJMA");
      case MODE_JurX:  return("JurX");
      case MODE_ParMA: return("ParMA");
      case MODE_T3:    return("T3");
      case MODE_VIDYA: return(" VIDYA");
      case MODE_AMA:   return("AMA");
     }
return("");
  }
  
void CXMA::XMAPhC(string Pn,int ExtP,Smooth_Method Met)
  {
   switch(Met)
     {
      case MODE_SMA_:  break;
      case MODE_EMA_:  break;
      case MODE_SMMA_: break;
      case MODE_LWMA_: break;
      case MODE_JJMA:
         if(ExtP<-100)
           {
            string word;
            StringConcatenate(word,__FUNCTION__," (): Parameter ",Pn," cannot be less than -100.",ExtP," default -100 will be used.");
            Print(word);
            break;
           }
         if(ExtP>+100)
           {
            string word;
            StringConcatenate(word,__FUNCTION__," (): Parameter ",Pn," cannot be less than +100.",ExtP," default +100 will be used.");
            Print(word);
            break;;
           }
         break;
      case MODE_JurX:  break;
      case MODE_ParMA: break;
      case MODE_T3:    break;
      if(ExtP<1)
        {
         string word;
         StringConcatenate(word,__FUNCTION__," (): Parameter ",Pn," cannot be less than -1.",ExtP," default -1 will be used.");
         Print(word);
         break;
        }
      case MODE_VIDYA:
         if(ExtP<1)
           {
            string word;
            StringConcatenate(word,__FUNCTION__," (): Parameter ",Pn," cannot be less than 1.",ExtP," default 1 will be used.");
            Print(word);
            break;
           }
      case MODE_AMA:
         if(ExtP<1)
           {
            string word;
            StringConcatenate(word,__FUNCTION__," (): Parameter ",Pn," cannot be less than 1.",ExtP," default 1 will be used.");
            Print(word);
            break;
           }
     }
  }

  bool CMovS::BC4(int RTot,int b,bool Set)
  {
   if((!Set && b==RTot-2) || (Set && b==1)) return(true);
   return(false);
  }

  bool CMovST::BC1(int B,int bar,bool Set)
  {
   if((!Set && bar<B) || (Set && bar>B)) return(true);
   return(false);
  }

//Non linear smooth
double CJX::JXS(uint b,uint p_calc,uint r_tot,int  Din,double Length,double series,uint bar,bool set)
  {
   if(BarCheck1(b,bar,set)) return(EMPTY_VALUE);
   double V1,V2,JurX_;
   LengthCheck(Length);
   JurXInit(b,Din,Length,series,bar);

   m_f1   =  m_Hg * m_f1 + m_Kg * series;
   m_f2   =  m_Kg * m_f1 + m_Hg * m_f2;
   V1     =  m_AC * m_f1 - m_AB * m_f2;
   m_f3   =  m_Hg * m_f3 + m_Kg * V1;
   m_f4   =  m_Kg * m_f3 + m_Hg * m_f4;
   V2     =  m_AC * m_f3 - m_AB * m_f4;
   m_f5   =  m_Hg * m_f5 + m_Kg * V2;
   m_f6   =  m_Kg * m_f5 + m_Hg * m_f6;
   JurX_  =  m_AC * m_f5 - m_AB * m_f6;

   if(BarCheck5(r_tot,bar,set))
     {
      m_f1 = m_F1;
      m_f2 = m_F2;
      m_f3 = m_F3;
      m_f4 = m_F4;
      m_f5 = m_F5;
      m_f6 = m_F6;
     }

   if(BarCheck4(r_tot,bar,set))
     {
      m_F1 = m_f1;
      m_F2 = m_f2;
      m_F3 = m_f3;
      m_F4 = m_f4;
      m_F5 = m_f5;
      m_F6 = m_f6;
     }

   return(JurX_);

  }
  
  
double CCMO::VID(uint beg,uint p_calc,uint r_tot,int CMO_Length,double EMA_Length,double series,uint bar,bool set)
  {
   double vid,CMO_=CMOSeries(beg,p_calc,r_tot,CMO_Length,series,bar,set);
   if(BarCheck2(beg,bar,set,CMO_Length+3))
     {
      m_Vid=series;
      m_SmoothFactor=2.0/(EMA_Length+1.0);
     }
   else if(BarCheck3(beg,bar,set,CMO_Length+3)) return(EMPTY_VALUE);
   CMO_*=m_SmoothFactor;
   m_Vid=CMO_*series+(1-CMO_)*m_Vid;
   vid=m_Vid;
   if(BarCheck5(r_tot,bar,set))
     {
      m_Vid=m_Vid_;
     }
   if(BarCheck4(r_tot,bar,set))
     {
      m_Vid_=m_Vid;
     }
   return(vid);
  }

  
double C_A_MA::AMAS(uint begin,uint p_calc,uint r_tot,int Length,int F_length,int S_Length,double Rate,double s,uint bar,bool set)
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   double signal,ER,ERSC,SSC,dprice,ama;
   int iii,kkk,rrr,size=Length+1;

   if(bar==begin)
      if(!SeriesArrayResize(__FUNCTION__,size,m_SeriesArray,m_Size_1)
         || !SeriesArrayResize(__FUNCTION__,size,m_dSeriesArray,m_Size_2))
         return(EMPTY_VALUE);
   LengthCheck(Length);

   Recount_ArrayZeroPos(m_count,size,prev_calculated,rates_total,series,bar,m_SeriesArray,set);

   if(BarCheck1(begin+1,bar,set)) return(EMPTY_VALUE);

   kkk=Recount_ArrayNumber(m_count,size,1);
   dprice=series-m_SeriesArray[kkk];
   m_dSeriesArray[m_count]=dprice;

   if(BarCheck2(begin,bar,set,Length+3))
     {
      rrr=Recount_ArrayNumber(m_count,size,1);
      m_Ama=m_SeriesArray[rrr];
      m_slowSC = (2.0 / (Slow_Length + 1));
      m_fastSC = (2.0 / (Fast_Length + 1));
      m_dSC=m_fastSC-m_slowSC;
      m_noise=0.000000001;

      for(iii=1; iii<Length; iii++)
        {
         rrr=Recount_ArrayNumber(m_count,size,iii);
         m_noise+=MathAbs(m_dSeriesArray[rrr]);
        }
     }
   else if(BarCheck3(begin,bar,set,Length+3)) return(EMPTY_VALUE);

   m_noise+=MathAbs(dprice);
   rrr=Recount_ArrayNumber(m_count,size,Length);
   signal=MathAbs(series-m_SeriesArray[rrr]);
   ER=signal/m_noise;
   ERSC= ER *  m_dSC;
   SSC = ERSC+m_slowSC;
   m_Ama=m_Ama+(MathPow(SSC,Rate) *(series-m_Ama));
   ama =  m_Ama;
   kkk = Recount_ArrayNumber( m_count, size, Length - 1);
   m_noise-=MathAbs(m_dSeriesArray[kkk]);
   if(BarCheck5(rates_total,bar,set))
     {
      m_noise=m_NOISE;
      m_Ama=m_AMA_;
     }
   if(BarCheck4(rates_total,bar,set))
     {
      m_AMA_=m_Ama;
      m_NOISE=m_noise;
     }
	return(ama);
  }
  
  
double C_C_M_O::CMOS(uint b,uint p_calc, uint rates_total,int CMO_l,double s,uint b,bool s)
{
 if(BarCheck1(b,b,s)) return(EMPTY_VALUE);
 double dseries,abcmo;
 int iii,rrr,size=CMO_l+1;
 if(b==b && !SeriesArrayResize(__FUNCTION__,size,m_dSeriesArray,m_Size_))
    return(EMPTY_VALUE);
 LengthCheck(CMO_l);
 if(BarCheck1(b+1,b,s)) return(EMPTY_VALUE);
 Recount_ArrayZeroPos(m_count,size,p_calc,rates_total,s-m_series1,b,m_dSeriesArray,s);
 if(BarCheck2(b,b,s,CMO_l+3))
   {
    m_UpSum = 0.0;
    m_DnSum = 0.0;

    for(iii=1; iii<CMO_l; iii++)
      {
       rrr=Recount_ArrayNumber(m_count,size,iii);
       dseries=m_dSeriesArray[rrr];

       if(dseries > 0) m_UpSum += dseries;
       if(dseries < 0) m_DnSum -= dseries;
      }

    m_AbsCMO=0.000000001;
   }
 else if(BarCheck3(b,b,s,CMO_l+3))
   {
    m_series1=s;
    return(EMPTY_VALUE);
   }

 dseries=m_dSeriesArray[m_count];
 if(dseries > 0) m_UpSum += dseries;
 if(dseries < 0) m_DnSum -= dseries;
 if(m_UpSum+m_DnSum>0)
    m_AbsCMO=MathAbs((m_UpSum-m_DnSum)/(m_UpSum+m_DnSum));
 abcmo=m_AbsCMO;
 rrr=Recount_ArrayNumber(m_count,size,CMO_l-1);
 dseries=m_dSeriesArray[rrr];
 if(dseries > 0) m_UpSum -= dseries;
 if(dseries < 0) m_DnSum += dseries;
 if(BarCheck5(rates_total,b,s))
   {
    m_AbsCMO= m_AbsCMO_;
    m_UpSum = m_UpSum_;
    m_DnSum = m_DnSum_;
    m_series1=m_series1_;
   }
 else m_series1=s;
 if(BarCheck4(rates_total,b,s))
   {
    m_AbsCMO_=m_AbsCMO;
    m_UpSum_ = m_UpSum;
    m_DnSum_ = m_DnSum;
    m_series1_=m_series1;
   }
 return(abcmo);
}

CFAL::CFAL()
  {
   m_Size_=39;
   double FALTable[]=
     {
      +0.4360409450, +0.3658689069, +0.2460452079, +0.1104506886, -0.0054034585, -0.0760367731,
      -0.0933058722, -0.0670110374, -0.0190795053, +0.0259609206, +0.0502044896, +0.0477818607,
      +0.0249252327, -0.0047706151, -0.0272432537, -0.0338917071, -0.0244141482, -0.0055774838,
      +0.0128149838, +0.0226522218, +0.0208778257, +0.0100299086, -0.0036771622, -0.0136744850,
      -0.0160483392, -0.0108597376, -0.0016060704, +0.0069480557, +0.0110573605, +0.0095711419,
      +0.0040444064, -0.0023824623, -0.0067093714, -0.0072003400, -0.0047717710, +0.0005541115,
      +0.0007860160, +0.0130129076, +0.0040364019
     };

   ArrayCopy(m_FALTable,FALTable,0,0,WHOLE_ARRAY);
}


ValTL::ValTL()
  {
   m_Size_=65;
   double ValLTable[]=
     {
      +0.0982862174,+0.0975682269,+0.0961401078,+0.0940230544,+0.0912437090,+0.0878391006,
      +0.0838544303,+0.0793406350,+0.0743569346,+0.0689666682,+0.0632381578,+0.0572428925,
      +0.0510534242,+0.0447468229,+0.0383959950,+0.0320735368,+0.0258537721,+0.0198005183,
      +0.0139807863,+0.0084512448,+0.0032639979,-0.0015350359,-0.0059060082,-0.0098190256,
      -0.0132507215,-0.0161875265,-0.0186164872,-0.0205446727,-0.0219739146,-0.0229204861,
      -0.0234080863,-0.0234566315,-0.0231017777,-0.0223796900,-0.0213300463,-0.0199924534,
      -0.0184126992,-0.0166377699,-0.0147139428,-0.0126796776,-0.0105938331,-0.0084736770,
      -0.0063841850,-0.0043466731,-0.0023956944,-0.0005535180,+0.0011421469,+0.0026845693,
      +0.0040471369,+0.0052380201,+0.0062194591,+0.0070340085,+0.0076266453,+0.0080376628,
      +0.0083037666,+0.0083694798,+0.0082901022,+0.0080741359,+0.0077543820,+0.0073260526,
      +0.0068163569,+0.0062325477,+0.0056078229,+0.0049516078,+0.0161380976
     };

   ArrayCopy(m_ValLTable,ValLTable,0,0,WHOLE_ARRAY);
  }

void C__XMA::XMAI(Smooth_Method M)
{
if(m_init)return;
else
 {
  m_init=true;
  m_Method=M;
 }

switch(M)
 {
  case MODE_SMA_:  SMA   = new CMoving_Average; break;
  case MODE_EMA_:  EMA   = new CMoving_Average; break;
  case MODE_SMMA_: SMMA  = new CMoving_Average; break;
  case MODE_LWMA_: LWMA  = new CMoving_Average; break;
  case MODE_JJMA:  JJMA  = new CJJMA;           break;
  case MODE_JurX:  JurX  = new CJurX;           break;
  case MODE_ParMA: ParMA = new CParMA;          break;
  case MODE_T3:    T3    = new CT3;             break;
  case MODE_VIDYA: VIDYA = new CCMO;            break;
  case MODE_AMA:   AMA   = new CAMA;            break;
  default:                                      break;
 }
}


//deinitialization
void C__XMA::~XMAI()
  {
   switch(m_Method)
     {
      case MODE_SMA_:  delete SMA;   break;
      case MODE_EMA_:  delete EMA;   break;
      case MODE_SMMA_: delete SMMA;  break;
      case MODE_LWMA_: delete LWMA;  break;
      case MODE_JJMA:  delete JJMA;  break;
      case MODE_JurX:  delete JurX;  break;
      case MODE_ParMA: delete ParMA; break;
      case MODE_T3:    delete T3;    break;
      case MODE_VIDYA: delete VIDYA; break;
      case MODE_AMA:   delete AMA;   break;
      default:                       break;
     }
}


double par_MovA::par_MovASeries(uint begin,           
                           uint prev_calculated, 
                           uint rates_total,     
                           int Length,           
                           double series,        
                           uint bar,             
                           bool set              
                           )
  {
   if(BarCheck1(begin,bar,set)) return(EMPTY_VALUE);
   
   int iii,kkk;
   double S,B0,B1,B2,parma;
   double A,B,C,D,E,F;
   double K,L,M,P,Q,R;
   double sum_y,sum_xy,sum_x2y,var_tmp;

   if(bar==begin && !SeriesArrayResize(__FUNCTION__,Length,m_SeriesArray,m_Size_))
      return(EMPTY_VALUE);
   LengthCheck(Length);
   Recount_ArrayZeroPos(m_count,Length,prev_calculated,rates_total,series,bar,m_SeriesArray,set);

   if(BarCheck2(begin,bar,set,Length)) ParMAInit(Length);
   else if(BarCheck3(begin,bar,set,Length)) return(EMPTY_VALUE);

   sum_y   = 0.0;
   sum_xy  = 0.0;
   sum_x2y = 0.0;
   for(iii=1; iii<=Length; iii++)
     {
      kkk=Recount_ArrayNumber(m_count,Length,Length-iii);
      var_tmp  = m_SeriesArray[kkk];
      sum_y   += var_tmp;
      sum_xy  += iii * var_tmp;
      parma += iii * iii * var_tmp;
     }

return(parma);
  }

bool CMS::BC5(int r_tot,int bar,bool Set)
 {
  if((!Set && bar==r_tot-1) || (Set && bar==0)) return(true);
  return(false);
 }

double CMAvg::EMAS(uint b,uint p_calc,uint r_tot,double Length,double s,uint bar,bool set)
  {
   if(BarCheck1(b,bar,set)) return(EMPTY_VALUE);
   double ema;
   LengthCheck(Length);
   if(bar==b)
     {
      m_Pr=2.0/(Length+1.0);
      m_Moving=s;
     }
   m_Moving=s*m_Pr+m_Moving *(1-m_Pr);
   ema=m_Moving;
   if(BarCheck4(r_tot,bar,set))
     {
      m_MOVING=m_Moving;
     }

   if(BarCheck5(r_tot,bar,set))
     {
      m_Moving=m_MOVING;
     }
   return(ema);
  }

  //Enum
  enum Prices_ 
{
  PRICE_CLOSE_ = 1,     
  PRICE_OPEN_,          
  PRICE_HIGH_,          
  PRICE_LOW_,           
  PRICE_MEDIAN_,        
  PRICE_TYPICAL_,       
  PRICE_WEIGHTED_,      
  PRICE_SIMPLE,         
  PRICE_QUARTER_,       
  PRICE_TRENDFOLLOW0_,  
  PRICE_TRENDFOLLOW1_   
};

//bPrc series
bool bPriceSeries(stringsymbol,ENUM_TIMEFRAMEStimeframe,intrates_total,uintapplied_price,uintbar,boolset,double&Price_)
  {
   uint Bar;
   double series[];
   ArraySetAsSeries(series,true);
   if(!set)
      Bar=rates_total-1-bar;
   else Bar=bar;

   switch(applied_price)
     {
      case  1: if(CopyClose(symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ = series[0]; break;
      case  2: if(CopyOpen (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ = series[0]; break;
      case  3: if(CopyHigh (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ = series[0]; break;
      case  4: if(CopyLow  (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ = series[0]; break;
 
      case  5: if(CopyHigh(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0];
      if(CopyLow(symbol,timeframe,Bar,1,series)<0) return(false); Price_+=series[0];
      Price_/=2.0;
      break;

      case  6: if(CopyClose(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0];
      if(CopyHigh (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      if(CopyLow  (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      Price_/=3.0;
      break;
                                                                 
      case  7: if(CopyClose(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0]*2;
      if(CopyHigh (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      if(CopyLow  (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      Price_/=4.0;
      break;

                                
      case  8: if(CopyClose(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0];
      if(CopyOpen(symbol,timeframe,Bar,1,series)<0) return(false); Price_+=series[0];
      Price_/=2.0;
      break;

      case  9: if(CopyClose(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0];
      if(CopyOpen (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      if(CopyHigh (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      if(CopyLow  (symbol, timeframe, Bar, 1, series) < 0) return(false); Price_ += series[0];
      Price_/=4.0;
      break;
                              
      case 10:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         
         if(CopyClose(symbol, timeframe, Bar, 1, Close_) < 0) return(false);
         if(CopyOpen (symbol, timeframe, Bar, 1, Open_ ) < 0) return(false);
         if(CopyHigh (symbol, timeframe, Bar, 1, High_ ) < 0) return(false);
         if(CopyLow  (symbol, timeframe, Bar, 1, Low_  ) < 0) return(false);
         
         if(Close_[0]>Open_[0])Price_=High_[0];
         else
           {
            if(Close_[0]<Open_[0])
               Price_=Low_[0];
            else Price_=Close_[0];
           }
         break;
        }
               
      case 11:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         
         if(CopyClose(symbol, timeframe, Bar, 1, Close_) < 0) return(false);
         if(CopyOpen (symbol, timeframe, Bar, 1, Open_ ) < 0) return(false);
         if(CopyHigh (symbol, timeframe, Bar, 1, High_ ) < 0) return(false);
         if(CopyLow  (symbol, timeframe, Bar, 1, Low_  ) < 0) return(false);
         
         if(Close_[0]>Open_[0])Price_=(High_[0]+Close_[0])/2.0;
         else
           {
            if(Close_[0]<Open_[0])
               Price_=(Low_[0]+Close_[0])/2.0;
            else Price_=Close_[0];
           }
         break;
        }
              
      case 12:
        {
         double Open_[1],Low_[1],High_[1],Close_[1];
         
         if(CopyClose(symbol, timeframe, Bar, 1, Close_) < 0) return(false);
         if(CopyOpen (symbol, timeframe, Bar, 1, Open_ ) < 0) return(false);
         if(CopyHigh (symbol, timeframe, Bar, 1, High_ ) < 0) return(false);
         if(CopyLow  (symbol, timeframe, Bar, 1, Low_  ) < 0) return(false);
         
         double res=High_[0]+Low_[0]+Close_[0];

         if(Close_[0]<Open_[0]) res=(res+Low_[0])/2;
         if(Close_[0]>Open_[0]) res=(res+High_[0])/2;
         if(Close_[0]==Open_[0]) res=(res+Close_[0])/2;
         Price_=((res-Low_[0])+(res-High_[0]))/2;
         break;
        }
      
      default: if(CopyClose(symbol,timeframe,Bar,1,series)<0) return(false); Price_=series[0]; break;
     }

   return(true);
  }
  