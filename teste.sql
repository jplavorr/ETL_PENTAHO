-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Programa              : teste.sql
-- Descricao             : Queries para verificar se as tabelas foram populadas s
--
-- Data        Tipo             Autor                                                               
-- -- -- --    --  --           -- --- -- -- -- -- -- -- -- -- -- --       
-- 15/10/2020  Criação          Vinícius Augusto Galvão da Silva                                      
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- VERIFICA SE AS TABELAS DA STAGE AREA FOI POPULADA

-- Verifica se a tabela pedidos foi populada 

SELECT * 
FROM st_area.st_pedidos
LIMIT 5;

-- Verifica se a tabela clientes foi populada 

SELECT * 
FROM st_area.st_clientes
LIMIT 5;

-- Verifica se a tabela repvendas foi populada 

SELECT * 
FROM st_area.st_repvendas
LIMIT 5;

-- Verifica se a tabela produtos foi populada 

SELECT * 
FROM st_area.st_produtos
LIMIT 5;

-- Verifica se a tabela promocoes foi populada 

SELECT * 
FROM st_area.st_promocoes
LIMIT 5;



-- VERIFICA SE AS TABELAS DO DATA WAREHOUSE FORAM POPULADAS

-- Verifica se a tabela fato_vendas foi populada 

SELECT * 
FROM dw.fato_vendas
LIMIT 5
;

-- Verifica se a tabela dim_clientes foi populada 

SELECT * 
FROM dw.dim_clientes
LIMIT 5
;

-- Verifica se a tabela dim_repvendas foi populada 

SELECT * 
FROM dw.dim_repvendas
LIMIT 5
;

-- Verifica se a tabela dim_produtos foi populada 

SELECT * 
FROM dw.dim_produtos
LIMIT 5
;

-- Verifica se a tabela dim_promocoes foi populada 

SELECT * 
FROM dw.dim_promocoes
LIMIT 5
;