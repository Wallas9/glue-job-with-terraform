import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)
job.commit()

from pyspark.sql.session import SparkSession
import pyspark.sql.functions as f

spark = (
        SparkSession 
       .builder 
       .appName("read_data") 
       .getOrCreate()
    )

df = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('delimiter', ',')
    .load('s3://datalake-tf-wallas/landing-zone/enem/data')
)

(
    df
    .write
    .format('parquet')
    .mode('overwrite')
    .partitionBy('TP_SEXO')
    .save('s3://datalake-tf-wallas/processing-zone/enem')
)