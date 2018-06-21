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

