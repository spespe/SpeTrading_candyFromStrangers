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