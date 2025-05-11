{% set s3_bucket = 's3://berka-phoenixnguyen/' %}
{% set processed_file_path = params["processed_file_path"] %}
{% set table_name = processed_file_path.split('/')[-1].split('.')[0] %}
{% set full_s3_path = s3_bucket ~ processed_file_path %}

COPY INTO {{ table_name }}
FROM {{ full_s3_path }}
FILE_FORMAT = (TYPE = 'PARQUET')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
STORAGE_INTEGRATION = s3_berka;