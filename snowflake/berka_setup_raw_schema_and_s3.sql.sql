CREATE DATABASE berka;
CREATE SCHEMA raw;

select * from account;
select * from card;


CREATE STORAGE INTEGRATION s3_berka
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = "arn:aws:iam::869935110009:role/snowflake_berka" --save in .env
    STORAGE_ALLOWED_LOCATIONS = ('s3://berka-phoenixnguyen/'); --save in .env

DESC INTEGRATION s3_berka