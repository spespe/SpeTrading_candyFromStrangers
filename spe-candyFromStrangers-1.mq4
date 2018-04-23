

//+------------------------------------------------------------------+
//|                 spe-candyFromStrangers-1.mq4                     |
//+------------------------------------------------------------------+

#property copyright "Pietro" //here we go.. mamma mia!!

extern double LotSize = 1;
extern double StopLoss = 50;
extern double TakeProfit = 0;
extern double TrailingStopLimit = 10;
extern double TrailingStopStop = 10;
extern int MagicNumber = 23310;


int LongTicket;
int ShortTicket;
double RealPoint;



int init()
	{
      RealPoint = RealPipPoint(Symbol());
     
	}

int start()
	{
   		
		OrderSelect(LongTicket,SELECT_BY_TICKET);
		if(OrderCloseTime() != 0 || LongTicket == 0)
		{
                
                    
bool buy_condition_1 = iMA(NULL, 0, 12, 0, MODE_SMA, PRICE_CLOSE, 0)  > Ask + 0.0005 ;


                                 
		if( buy_condition_1   )
			{
				
				OrderSelect(ShortTicket,SELECT_BY_TICKET);
				
				if(OrderCloseTime() == 0 && ShortTicket > 0)
					{
											
						bool Closed = OrderClose(ShortTicket,OrderLots(),Ask,0,Red);
					}				

				
				LongTicket = OrderSend(Symbol(),OP_BUY,LotSize,Ask,0,0,0,"Buy Order",MagicNumber,0,Green);
				
				
				OrderSelect(LongTicket,SELECT_BY_TICKET); 
				double OpenPrice = OrderOpenPrice();
				         
            if(StopLoss > 0) double LongStopLoss = OpenPrice - (StopLoss * RealPoint);
            if(TakeProfit > 0) double LongTakeProfit = OpenPrice + (TakeProfit * RealPoint);
                    
				if(LongStopLoss > 0 || LongTakeProfit > 0) 
				{
               bool LongMod = OrderModify(LongTicket,OpenPrice,LongStopLoss, LongTakeProfit,0);
				}
				
				ShortTicket = 0;
			}
		
		}		
		            
                
if (TrailingStopLimit > 0 && TrailingStopStop > 0)
	 {
                     double TrailingStopLimitReal = TrailingStopLimit * RealPoint;
                     double TrailingStopStopReal = TrailingStopStop * RealPoint;
                     
                     OrderSelect(LongTicket, SELECT_BY_TICKET);             
                     if (OrderType() == OP_BUY && OrderCloseTime() == 0)
                        {
                           
                           if(Bid - OrderOpenPrice() > TrailingStopLimitReal) 
                              {

                                 if(OrderStopLoss() < Bid - (TrailingStopLimitReal * 2)) 
                                    {
                                       double LongTrailingStopLoss = OrderStopLoss() + TrailingStopStopReal;
                                       OrderModify(OrderTicket(), OrderOpenPrice(), LongTrailingStopLoss, OrderTakeProfit(), 0, MediumSeaGreen);	
                                    }
                              }
                        }
                        
                     OrderSelect(ShortTicket, SELECT_BY_TICKET);   
                     if (OrderType() == OP_SELL && OrderCloseTime() == 0)
                         {
                           
                           if(OrderOpenPrice()- Ask > TrailingStopLimitReal) 
                              {

                                 if(OrderStopLoss() > Ask + (TrailingStopLimitReal * 2)) 
                                    {
                                       double ShortTrailingStopLoss = OrderStopLoss() - TrailingStopStopReal;
                                       OrderModify(OrderTicket(), OrderOpenPrice(), ShortTrailingStopLoss, OrderTakeProfit(), 0, MediumSeaGreen);	
                                    }
                              }
                          }	
	              	
		
		}		
				return(0);
	}

double RealPipPoint(string Currency)
	{
		int CalcDigits = MarketInfo(Currency,MODE_DIGITS);
		if(CalcDigits == 2 || CalcDigits == 3) double CalcPoint = 0.01;
		else if(CalcDigits == 4 || CalcDigits == 5) CalcPoint = 0.0001;
		return(CalcPoint);
	}    

