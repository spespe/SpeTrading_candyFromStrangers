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
