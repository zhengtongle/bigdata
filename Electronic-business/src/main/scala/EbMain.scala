import org.apache.spark.sql.{DataFrame, Row, SparkSession}

object EbMain {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession
      .builder()
      .appName("Electronic-Business")
//      .master("local[*]")
      .enableHiveSupport()
      .getOrCreate()

    println("=================================数据清洗=================================")
    val sku: DataFrame = spark
      .read
      .format("csv")
      .option("header", "true")
      .option("delimiter", ",")
      .option("multiLine", "true")
      .load("file:/home/kazoto/data/sku.csv")
    val user_act: DataFrame = spark
      .read
      .format("csv")
      .option("header", "true")
      .option("delimiter", ",")
      .option("multiLine", "true")
      .load("file:/home/kazoto/data/user_act.csv")
    val user: DataFrame = spark
      .read
      .format("csv")
      .option("header", "true")
      .option("delimiter", ",")
      .option("multiLine", "true")
      .load("file:/home/kazoto/data/user.csv")


    println("=================================数据分析=================================")
    sku.createOrReplaceTempView("sku")
    user_act.createOrReplaceTempView("user_act")
    user.createOrReplaceTempView("user")

    // 全部访问量与用户量
    /*
    hive (hive)> select s.id,s.name,t.pid,t.title from
               > (select id,name from user) s
               > join
               > (select uid,pid,title from post) t
               > on s.id=t.uid;
     */
    spark.sql(
      """ create table new_user_act as
        | select *
        |      from user_act join user
        |      on user.id = user_act.user
        |""".stripMargin)

    // 总访问量
    spark.sql(
      """
        |create total_pv as
        | select count(distinct user) as uv,
        |        sum(case when act_type = 1 then 1 else 0 end) as pv,
        | from new_user_act
        |
        |""".stripMargin)

    // 日均访问量
    spark.sql(
      """
        |create table day_pv as
        |select cast(act_date as date) as day,
        |       sum(case when act_type = 1 then 1 else 0 end) as pv,
        |       count(distinct user) as uv
        |from new_user_act
        |group by cast(datetime as date)
        |order by day
        |""".stripMargin)

    println(spark.sql(
      """
        |select * from day_pv
        |""".stripMargin).show())

    println(spark.sql(
      """
        |select * from total_pv
        |""".stripMargin).show())

  }
}
