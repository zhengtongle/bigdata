import org.apache.spark.sql.SparkSession

object SparkSQLDemo {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession
      .builder()
      .appName("Electronic-Business")
      .master("spark://debian:7077")
      .enableHiveSupport()
      .getOrCreate()

    spark.sql("show databases").show()
  }
}
