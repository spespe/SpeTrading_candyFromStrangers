package pdp.spark

import java.util.Date
import java.util.concurrent.TimeUnit
import com.typesafe.scalalogging.LazyLogging
import org.apache.spark.SparkContext
import org.apache.spark.sql.{DataFrame, SQLContext}
import org.apache.spark.storage.StorageLevel

/**
  * Created by Pietro.Speri.
  */

object profilerSpark extends LazyLogging with functions{
  def main(args: Array[String]) {
    //Start time
    val startTime= new Date

    //Inputs
    val table1=args(0).trim
    val table2=args(1).trim
    logger.info("[ARGUMENTS PASSED: ]"+args.foreach(println))

    //Spark configuration
    logger.info("[CONFIGURING SPARK CONTEXT AND SQL CONTEXT]")
    val conf = new org.apache.spark.SparkConf().setAppName("Profiler "+table1+" "+table2)
    val sc = new SparkContext(conf)
    val sqlContext = new org.apache.spark.sql.hive.HiveContext(sc)

    //Caching into memory
    logger.info("[CACHING TABLES INTO MEMORY]")
    val cache1=sqlContext.sql("select * from "+table1).persist(StorageLevel.MEMORY_AND_DISK)
    val cache2=sqlContext.sql("select * from "+table2).persist(StorageLevel.MEMORY_AND_DISK)

    //Deleting tables
    logger.info("[DELETING TABLES FROM HIVE]")
    dropTable(table1,sqlContext)
    dropTable(table2,sqlContext)

    //Profiling
    logger.info("[LAUNCHING THE PROFILER]")
    profiler(table1,cache1)
    profiler(table2,cache2)

    //Taking the time
    val endTime= new Date
    val units=TimeUnit.MILLISECONDS
    val timeTaken=getDateDiff(startTime,endTime,units)
    logger.info("[FINISHED][TIME TAKEN: " + timeTaken + "]")

    //Stopping the spark-context
    sc.stop
  }
}


