drop table if exists tb1_temp_temp cascade;
create  temp table tb1_temp(
col_tinyint tinyint not null default '3',
col_smallint smallint not null default '7',
col_integer integer,
col_int int,
col_binary_integer binary_integer,
col_bigint bigint primary key,
col_numeric numeric,
col_numeric1 numeric(38),
col_numeric2 numeric(38,7),
col_decimal decimal,
col_decimal1 decimal(38),
col_decimal2 decimal(38,7),
col_number1 number,
col_number2 number(38),
col_number5 number(38,7),
col_real real,
col_float4 float4,
col_double_precision double precision,
col_float8 float8,
col_float float,
col_float1 float(38),
col_binary_double binary_double,
col_dec dec,
col_dec1 dec(38),
col_dec2 dec(38,7),
col_integer1 integer(38),
col_integer2 integer(38,7),
col_money money,
col_boolean boolean,
col_char char,
col_char1 char(200),
col_character character,
col_character1 character(200),
col_nchar nchar,
col_nchar1 nchar(200),
col_varchar varchar(200),
col_character_varying character varying(200),
col_varchar2 varchar2(200) default 'aaaabbbb',
col_narchar2 nvarchar2(200) not null default 'aaaabbbb',
col_clob clob,
col_text text,
col_name1 name,
col_char2 "char",
col_blob blob,
col_raw raw,
col_bytea bytea,
col_date date not null default '2018-01-07 08:08:08',
col_time time,
col_time1 time(6),
col_time2 time without time zone,
col_time3 time(6) without time zone,
col_time4 time with time zone,
col_time5 time(6) with time zone,
col_timestamp timestamp,
col_timestamp1 timestamp(6),
col_timestamp2 timestamp without time zone,
col_timestamp3 timestamp(6) without time zone,
col_timestamp4 timestamp with time zone,
col_timestamp5 timestamp(6) with time zone,
col_smalldatetime smalldatetime,
col_interval interval day (1) to second (6),
col_interval1 interval,
col_interval2 interval year,
col_interval3 interval second (6),
col_interval4 interval hour to second (6),
col_cidr cidr,
col_inet inet,
col_macaddr macaddr,
col_bitn bit(10),
col_bit_varying bit varying(10)
) TABLESPACE tbs_user_default;

--增加唯一约束
alter table tb1_temp add constraint tb1_temp_uk1 unique(col_int,col_bigint);
--全局索引
create index idx_tbl_temp_global_01 on tb1_temp(col_tinyint,col_smallint desc,col_numeric,col_decimal) tablespace tbs_user_default;
create index idx_tbl_temp_global_02 on tb1_temp(col_integer asc,col_date,col_interval1,col_bitn) tablespace tbs_user_default;
create index idx_tbl_temp_global_03 on tb1_temp(col_bigint desc,col_varchar asc,col_timestamp2 desc) tablespace tbs_user_default;
--函数索引目前支持to_char、upper
create index idx_tbl_temp_fun_01 on tb1_temp(upper(col_number1) desc) tablespace tbs_user_default;
create index idx_tbl_temp_fun_02 on tb1_temp(upper(col_timestamp3) desc) tablespace tbs_user_default;
--创建comment
comment on column tb1_temp.col_tinyint IS 'I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!I am ok!!';