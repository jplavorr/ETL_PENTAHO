-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Programa              : criar_tabelas.sql
-- Descricao             : Comandos DLL para criação das bases de dados e tabelas
--
-- Data        Tipo             Autor                                                               
-- -- -- --    --  --           -- --- -- -- -- -- -- -- -- -- -- --       
-- 15/10/2020  Criação          Vinícius Augusto Galvão da Silva                                      
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Cria databases st_area e dw

DROP DATABASE IF EXISTS st_area;
CREATE DATABASE st_area;

DROP DATABASE IF EXISTS dw;
CREATE DATABASE IF EXISTS dw;


-- CRIA AS TABELAS DA STAGE AREA

-- Cria tabela de pedidos
DROP TABLE IF EXISTS st_area.st_pedidos;
CREATE TABLE st_area.st_pedidos
(
  ORDER_ID BIGINT
, ORDER_DATE DATETIME
, CUSTOMER_ID BIGINT
, ORDER_STATUS BIGINT
, ORDER_TOTAL DOUBLE
, SALES_REP_ID BIGINT
, PROMO_ID BIGINT
, LINE_ITEM_ID BIGINT
, PRODUCT_ID BIGINT
, UNIT_PRICE DOUBLE
, QUANTITY BIGINT
)
;

-- Cria tabela de clientes
DROP TABLE IF EXISTS st_area.st_clientes;
CREATE TABLE st_area.st_clientes
(
  CUSTOMER_ID BIGINT
, CUST_FIRST_NAME VARCHAR(40)
, CUST_LAST_NAME VARCHAR(50)
, STREET_ADDRESS VARCHAR(50)
, POSTAL_CODE BIGINT
, CITY VARCHAR(30)
, STATE_PROVINCE VARCHAR(3)
, COUNTRY_ID VARCHAR(2)
, COUNTRY_NAME VARCHAR(30)
, REGION_ID BIGINT
, NLS_LANGUAGE VARCHAR(3)
, NLS_TERRITORY VARCHAR(11)
, CREDIT_LIMIT BIGINT
, CUST_EMAIL VARCHAR(50)
, PRIMARY_PHONE_NUMBER VARCHAR(30)
, PHONE_NUMBER_2 VARCHAR(30)
, ACCOUNT_MGR_ID BIGINT
, LOCATION_GTYPE BIGINT
, LOCATION_SRID BIGINT
, LOCATION_X DOUBLE
, LOCATION_Y DOUBLE
)
;

-- Cria tabela de representante de vendas
DROP TABLE IF EXISTS st_area.st_repvendas;
CREATE TABLE st_area.st_repvendas
(
  EMPLOYEE_ID BIGINT
, FIRST_NAME VARCHAR(30)
, LAST_NAME VARCHAR(50)
, EMAIL VARCHAR(50)
, PHONE_NUMBER VARCHAR(22)
, HIRE_DATE DATETIME
, JOB_ID VARCHAR(6)
, SALARY BIGINT
, COMMISSION_PCT INT
, MANAGER_ID BIGINT
, DEPARTMENT_ID BIGINT
)
;

-- Cria tabela de produtos
DROP TABLE IF EXISTS st_area.st_produtos;
CREATE TABLE st_area.st_produtos
(
  PRODUCT_ID BIGINT
, PRODUCT_NAME VARCHAR(40)
, LANGUAGE_ID VARCHAR(2)
, MIN_PRICE BIGINT
, LIST_PRICE BIGINT
, PRODUCT_STATUS VARCHAR(17)
, SUPPLIER_ID BIGINT
, WARRANTY_PERIOD INT
, WEIGHT_CLASS BIGINT
, PRODUCT_DESCRIPTION VARCHAR(1000)
, CATEGORY_ID BIGINT
, CATALOG_URL VARCHAR(80)
, SUB_CATEGORY_NAME VARCHAR(30)
, SUB_CATEGORY_DESCRIPTION VARCHAR(100)
, PARENT_CATEGORY_ID BIGINT
, CATEGORY_NAME VARCHAR(30)
)
;


-- Cria tabela de promoções
DROP TABLE IF EXISTS st_area.st_promocoes;
CREATE TABLE st_area.st_promocoes
(
  PROMO_ID BIGINT
, PROMO_NAME VARCHAR(30)
)
;


-- CRIA AS TABELAS DO DATA WAREHOUSE

-- Cria tabela de clientes
DROP TABLE IF EXISTS dw.dim_clientes;
CREATE TABLE dw.dim_clientes
(
  CLIENTE_DIM_ID BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, CUSTOMER_ID BIGINT
, CUST_FIRST_NAME VARCHAR(40)
, CUST_LAST_NAME VARCHAR(50)
, STREET_ADDRESS VARCHAR(50)
, POSTAL_CODE BIGINT
, CITY VARCHAR(30)
, STATE_PROVINCE VARCHAR(3)
, COUNTRY_ID VARCHAR(2)
, COUNTRY_NAME VARCHAR(30)
, CREDIT_LIMIT BIGINT
, CUST_EMAIL VARCHAR(50)
, PRIMARY_PHONE_NUMBER VARCHAR(30)
, LOCATION_X DOUBLE
, LOCATION_Y DOUBLE
)
;

-- Cria tabela de representante de vendas
DROP TABLE IF EXISTS dw.dim_repvendas;
CREATE TABLE dw.dim_repvendas
(
  REPRESENTANTE_DIM_ID BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, SALESREP_ID BIGINT
, FIRST_NAME VARCHAR(30)
, LAST_NAME VARCHAR(50)
, EMAIL VARCHAR(50)
, PHONE_NUMBER VARCHAR(22)
, HIRE_DATE DATETIME
, JOB_ID VARCHAR(6)
, SALARY BIGINT
, COMMISSION_PCT INT
, MANAGER_ID BIGINT
, DEPARTMENT_ID BIGINT
)
;

-- Cria tabela de produtos
DROP TABLE IF EXISTS dw.dim_produtos;
CREATE TABLE dw.dim_produtos
(
  PRODUTOS_DIM_ID BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, PRODUCT_ID BIGINT
, PRODUCT_NAME VARCHAR(40)
, LANGUAGE_ID VARCHAR(2)
, MIN_PRICE BIGINT
, LIST_PRICE BIGINT
, PRODUCT_STATUS VARCHAR(17)
, SUPPLIER_ID BIGINT
, WARRANTY_PERIOD INT
, WEIGHT_CLASS BIGINT
, PRODUCT_DESCRIPTION TEXT
, CATEGORY_ID BIGINT
, SUB_CATEGORY_NAME VARCHAR(30)
, SUB_CATEGORY_DESCRIPTION VARCHAR(100)
, PARENT_CATEGORY_ID BIGINT
, CATEGORY_NAME VARCHAR(30)
)
;


-- Cria tabela de promoções
DROP TABLE IF EXISTS dw.dim_promocoes;
CREATE TABLE dw.dim_promocoes
(
  PROMO_DIM_ID BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, PROMO_ID BIGINT
, PROMO_NAME VARCHAR(30)
)
;

-- Cria tabela de datas
DROP TABLE IF EXISTS dw.dim_data;
CREATE TABLE dw.dim_data
(
  data_dim_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, dia_pedido DATETIME
, dia_do_ano INT
, mes INT
, ano INT
, quartil INT
, nome_mes VARCHAR(24)
, mes_ano DATETIME
)
;

-- Cria tabela de vendas
DROP TABLE IF EXISTS dw.fato_vendas;
CREATE TABLE dw.fato_vendas
(
  ORDER_ID BIGINT
, ORDER_TOTAL DOUBLE
, UNIT_PRICE DOUBLE
, QUANTITY BIGINT
, CLIENTE_DIM_ID INT
, REPRESENTANTE_DIM_ID INT
, PRODUTOS_DIM_ID INT
, PROMO_DIM_ID INT
, data_dim_id INT
, GASTO_POR_ITEM DOUBLE
, REPRESENTACAO_ITEM DOUBLE
)
;