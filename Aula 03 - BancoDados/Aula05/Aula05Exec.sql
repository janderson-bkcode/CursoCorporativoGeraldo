
--Case 01 

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

--Case02
 
 CREATE TABLE tb_funcionario(
	matriculaFunc integer,
	nomeFunc varchar,
	endFunc varchar,
	celularFunc varchar,
	FoneFunc varchar,

	CONSTRAINT pk_tbFuncionario_matriculaFunc PRIMARY KEY(matriculaFunc)
 
 );
 CREATE TABLE tb_medico(
 
 matriculaFunc integer,
 crm integer,

 CONSTRAINT pk_tbMedico_matriculaFunc PRIMARY KEY(matriculaFunc),
 CONSTRAINT fk_tbMedico_matriculaFunc FOREIGN KEY(matriculaFunc)
	REFERENCES tb_funcionario(matriculaFunc)
 );

  CREATE TABLE tb_enfermeiro(
 
 matriculaFunc integer,
 coren integer,

 CONSTRAINT pk_tbEnfermeiro_matriculaFunc PRIMARY KEY(matriculaFunc),
 CONSTRAINT fk_tbEnfermeiro_matriculaFunc FOREIGN KEY(matriculaFunc)
	REFERENCES tb_funcionario(matriculaFunc)
 );


 CREATE TABLE tb_tipo_comodo(
 idTipo integer,
 descricaoTipo varchar,
 CONSTRAINT pk_tbTipoComodoIdTipo PRIMARY KEY(idTipo)
 );

 CREATE TABLE tb_comodo(
 nroComodo integer,
 idTipo integer CONSTRAINT nn_tbcomodoIdTipo NOT NULL,
 situacaoComodo bit,
 CONSTRAINT tb_comodo_nroComodo PRIMARY KEY(nroComodo),
 CONSTRAINT tb_comodo_IdTipo FOREIGN KEY(idTipo)
	REFERENCES tb_tipo_comodo(idTipo)
 );

 CREATE TABLE tb_leito(
 nroLeito integer,
 nroComodo integer CONSTRAINT nn_tbLeitoNroComodo NOT NULL,
 situacaoLeito bit,

 CONSTRAINT pk_tbLeito_nroLeito PRIMARY KEY(nroLeito),
 CONSTRAINT fk_tbLeitoNroComodo FOREIGN KEY(nroComodo)
	REFERENCES tb_comodo(nroComodo)
 );

 CREATE TABLE tb_alocacao_comodo_enfermeiro(
 nroComodo integer,
 matriculaFunc integer,
 CONSTRAINT pk_tbAlocEnfNroCMatricF PRIMARY KEY(nroComodo,matriculaFunc),
 CONSTRAINT fk_tbAlocEnfNroComodo FOREIGN KEY(nroComodo)
	REFERENCES tb_comodo(nroComodo),
 CONSTRAINT fk_tb_AlocEnfConfMatric FOREIGN KEY(matriculaFunc)
	REFERENCES tb_enfermeiro(matriculaFunc)
 );

 CREATE TABLE tb_plano_conveniado(
 codPlano integer,
 nomePlano varchar,

 CONSTRAINT tb_planoConvCodPlano PRIMARY KEY(codPlano)
 
 );

 CREATE TABLE tb_paciente(
 codpac integer,
 nroLeito integer CONSTRAINT nn_tbPacienteNroLeito not null,
 codPlano integer,
 matriculaFunc integer CONSTRAINT nn_TbPacienteMF not null,
 nomePac varchar,
 sexoPac char(1),
 dataInternamentoPac date,
 dataProvavelSaidaPac date,

 CONSTRAINT pk_tbpaciente_codpac PRIMARY KEY(codpac),
 CONSTRAINT fk_tbPaciente_nroLeito FOREIGN KEY(nroLeito)
	REFERENCES tb_leito(nroLeito),
 CONSTRAINT fk_tb_pacienteCodPlano FOREIGN KEY(codPlano)
	REFERENCES tb_plano_conveniado(codPlano),
CONSTRAINT fk_tbPaciente_matricFunc FOREIGN KEY(matriculaFunc)
   REFERENCES tb_medico(matriculaFunc) 
 );