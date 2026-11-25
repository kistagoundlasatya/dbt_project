{{
    config(
        materialized='table',
        database ='satya1',
        schema ='rani2'
    )
}}

with ctee as(

select trim(CUST_ID) as customer_id,
regexp_replace(ORD_ID,'[^0-9]') as order_id,

initcap(trim(F_NAME)) as f_name,
initcap(trim(M_NAME)) as m_name,
initcap(trim(L_NAME)) as l_name,
trim(upper(L_NAME||' '||F_NAME||' '||nvl(M_NAME,''))) as full_name,
case when upper(GENDER) = 'M' then 'Male'
     when upper(GENDER) ='F'  then 'Female'
     when GENDER is null then 'Not Specified'
      end GENDER,
 
to_char(to_date(DOB),'DD-MON-YYYY'), 
to_char(DOB,'YYYY') year_of_birth,
to_char(DOB,'MON') month_of_birth,
datediff(YEAR,DOB,Current_date) age,

EMAIL,
split_part(split_part(upper(EMAIL),'@',2),'.',1) as domain,
'Rs '|| cast(ORDER_AMOUNT as decimal(10,2)) as ORDER_AMOUNT_1,
QUANTITY,

coalesce(DISCOUNT,0) as DISCOUNT 
,ORDER_DATE,CREATED_AT,

upper(COUNTRY) as COUNTRY ,
decode(IS_ACTIVE,1,'Active',0,'In-Active') as status,
row_number() over(partition by customer_id,order_id,ORDER_DATE order by 1,2) k 

from {{ source('snowflake_data', 'orders_data') }}
)
select *from ctee  
qualify k=1