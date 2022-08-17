CREATE TABLE tb_departamento(

siglaDepto char(3),
nomeDepto varchar,

CONSTRAINT pk_tbDpto_siglaDepto PRIMARY KEY(siglaDepto)
);


CREATE TABLE tb_setor(
siglaSetor char(3),
siglaDepto char(3) CONSTRAINT nn_tb_setor_siglaDpeto NOT NULL ,
nomeSetor varchar,

CONSTRAINT pk_tb_setor_siglaSetor PRIMARY KEY(siglaSetor),
CONSTRAINT fk_tb_setor_siglaDepto FOREIGN KEY(siglaDepto)
	REFERENCES tb_departamento(siglaDepto)

);

CREATE TABLE tb_bem_movel(
codBem integer,
siglaSetor char(3) CONSTRAINT nn_TbBemMovel_siglaSetor NOT NULL ,
descricaoBem varchar,
dataCompraBem date,
vlrCompraBem numeric,

CONSTRAINT pk_tbBemMovel_codBem PRIMARY KEY(codBem),
CONSTRAINT fk_tbBemMovel_siglaSetor FOREIGN KEY(siglaSetor)
	REFERENCES tb_setor(siglaSetor)
);

CREATE TABLE tb_tipo_dano(
idTipo integer,
descTipo varchar,

CONSTRAINT pk_tbTipodano_idTipo PRIMARY KEY (idTipo)


)


CREATE TABLE tb_Ocorrencias(
nroOcorrencia integer,
siglaSetor char(3) CONSTRAINT nn_tbOcorrencias_siglaSetor NOT NULL,
idTipo integer CONSTRAINT nn_tbOcorrencias_IdTipo NOT NULL,
codBem integer CONSTRAINT nn_tbOcorrencias_CodBem NOT NULL,
dataOcorrencia date,

CONSTRAINT pk_tbOcorrencia_nroOcorrencia PRIMARY KEY(nroOcorrencia),
CONSTRAINT fk_tbOcorrencia_siglaSetor FOREIGN KEY(siglaSetor)
	REFERENCES tb_setor(siglaSetor),
CONSTRAINT fk_tbOCorrencia_idTipo FOREIGN KEY(idTipo)
	REFERENCES tb_tipo_dano(idTipo),
CONSTRAINT fk_tbOcorrenciaCodBem FOREIGN KEY(codBem)
	REFERENCES tb_bem_movel(codBem)
);