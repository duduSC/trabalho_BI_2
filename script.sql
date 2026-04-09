
DROP TABLE IF EXISTS dim_categoria CASCADE;
CREATE TABLE dim_categoria(
	sk_categoria integer PRIMARY KEY,
	tipo varchar(200)
);

DROP TABLE IF EXISTS dim_titular CASCADE;
CREATE TABLE dim_titular(
	sk_titular integer PRIMARY KEY,
	nome varchar(200)
);

DROP TABLE IF EXISTS dim_data CASCADE;
CREATE TABLE dim_data(
	sk_data integeR PRIMARY KEY,
	ano integer,
	mes integer,
	dia integer,
	semestre integer,
	dia_da_semana integer check(dia_da_semana >=0 and dia_da_semana<=6)
);

DROP TABLE IF EXISTS fato_fatura CASCADE;
CREATE TABLE fato_fatura(
	sk_titular integer,
	sk_categoria integer,
	sk_data integer,
	valor_brl numeric(100,2),
	valor_usd numeric(100,2),
	cotacao_usd numeric(100,2),
	parcela_atual integer,
	parcelas_totais integer,
	FOREIGN KEY (sk_titular) REFERENCES dim_titular,
	FOREIGN KEY (sk_categoria) REFERENCES dim_categoria,
	FOREIGN KEY (sk_data) REFERENCES dim_data
);