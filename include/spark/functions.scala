package pdp.spark

import java.util.Date
import java.util.concurrent.TimeUnit
import org.apache.spark.sql.functions._
import org.apache.spark.sql.{DataFrame, SQLContext}

/**
  * Created by Pietro.Speri.
  */
trait functions {
  //Method used to retrieve the time spent
  def getDateDiff(date1:Date,date2:Date,timeUnit:TimeUnit)= {
    val diffInMillies = date2.getTime() - date1.getTime()
    timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS)
  }

  //Method used to drop the tables from Hive
  def dropTable(tablename: => String, SQLContext: SQLContext): Unit ={
    SQLContext.sql("drop table "+tablename+" purge")
  }

  //Method used to profile the tables we have, creating multiple tables with the profiled data
  def profiler(tablename: => String, dataFrame: => DataFrame)={
    dataFrame.schema.fieldNames.foreach( f => {
      val table = "profiling_"+tablename+f
      dataFrame.groupBy(f).count.sort(desc("count")).limit(10).saveAsTable(table)
    })
  }
}

