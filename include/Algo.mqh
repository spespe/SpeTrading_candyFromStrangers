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