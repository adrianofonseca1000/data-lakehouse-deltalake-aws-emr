from pyspark.sql import SparkSession
from pyspark.sql.functions import col, min, max

# Importa o modulo das tabelas delta
from delta import *
from delta.tables import *

# Cria objeto da Spark Session
spark = (SparkSession.builder.appName("DeltaExercise")
    .config("spark.jars.packages", "io.delta:delta-core_2.12:2.1.1")
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
    .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
    .getOrCreate()
)

# Leitura de dados
enem = (
    spark.read.format("csv")
    .option("inferSchema", True)
    .option("header", True)
    .option("delimiter", ";")
    .load("s3://datalake-adriano-523003372975/raw-data/data")
)

# Escreve a tabela em staging em formato delta
print("Writing delta table...")
(
    enem
    .write
    .mode("overwrite")
    .format("delta")
    .partitionBy("year")
    .save("s3://datalake-adriano-tf/staging-zone/enem")
)
