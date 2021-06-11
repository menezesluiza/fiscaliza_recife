-- public.orgaos_receitas definition

-- Drop table

-- DROP TABLE public.orgaos_receitas;

CREATE TABLE public.orgaos_receitas (
	ano varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	id numeric NULL
);

-- public.receitas definition

-- Drop table

-- DROP TABLE public.receitas;

CREATE TABLE public.receitas (
	ano varchar NULL,
	mes varchar NULL,
	mes_nome varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	unidade_codigo varchar NULL,
	unidade_nome varchar NULL,
	fonte_recurso_codigo varchar NULL,
	fonte_recurso_nome varchar NULL,
	categoria_receita_codigo varchar NULL,
	categoria_receita_nome varchar NULL,
	fonte_origem_receita_codigo varchar NULL,
	fonte_origem_receita_nome varchar NULL,
	subfonte_receita_codigo varchar NULL,
	subfonte_receita_nome varchar NULL,
	rubrica_receita_codigo varchar NULL,
	rubrica_receita_nome varchar NULL,
	alinea_receita_codigo varchar NULL,
	alinea_receita_nome varchar NULL,
	subalinea_receita_codigo varchar NULL,
	subalinea_receita_nome varchar NULL,
	receita_local_codigo varchar NULL,
	receita_local_nome varchar NULL,
	receita_prevista numeric NULL,
	receita_prevista_acrescimo numeric NULL,
	receita_prevista_atualizada numeric NULL,
	receita_arrecadada numeric NULL
);

-- public.totais_receitas definition

-- Drop table

-- DROP TABLE public.totais_receitas;

CREATE TABLE public.totais_receitas (
	ano varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	recprev numeric NULL,
	recarrec numeric NULL,
	recarrecjan numeric NULL,
	recarrecfev numeric NULL,
	recarrecmar numeric NULL,
	recarrecabr numeric NULL,
	recarrecmai numeric NULL,
	recarrecjun numeric NULL,
	recarrecjul numeric NULL,
	recarrecago numeric NULL,
	recarrecset numeric NULL,
	recarrecout numeric NULL,
	recarrecnov numeric NULL,
	recarrecdez numeric NULL,
	reccorrente numeric NULL,
	reccapital numeric NULL,
	reccorrenteinfra numeric NULL,
	transfcorr numeric NULL,
	impostos numeric NULL,
	outrascred numeric NULL,
	opcredito numeric NULL,
	outrascap numeric NULL,
	recpatri numeric NULL,
	recserv numeric NULL,
	transfcap numeric NULL,
	contri numeric NULL,
	alien numeric NULL,
	amort numeric NULL
);

-- public.desp definition

-- Drop table

-- DROP TABLE public.desp;

CREATE TABLE public.desp (
	ano_mov varchar NULL,
	mes varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	unidade_codigo varchar NULL,
	unidade_nome varchar NULL,
	categoria_economica_codigo varchar NULL,
	categoria_economica_nome varchar NULL,
	grupo_despesa_codigo varchar NULL,
	grupo_despesa_nome varchar NULL,
	modalidade_aplicacao_codigo varchar NULL,
	modalidade_aplicacao_nome varchar NULL,
	elemento_codigo varchar NULL,
	elemento_nome varchar NULL,
	subelemento_codigo varchar NULL,
	subelemento_nome varchar NULL,
	funcao_codigo varchar NULL,
	funcao_nome varchar NULL,
	subfuncao_codigo varchar NULL,
	subfuncao_nome varchar NULL,
	programa_codigo varchar NULL,
	programa_nome varchar NULL,
	acao_codigo varchar NULL,
	acao_nome varchar NULL,
	fonte_recurso_codigo varchar NULL,
	fonte_recurso_nome varchar NULL,
	empenho_ano varchar NULL,
	empenho_modalidade_nome varchar NULL,
	empenho_modalidade_codigo varchar NULL,
	empenho_numero varchar NULL,
	subempenho varchar NULL,
	indicador_subempenho varchar NULL,
	credor_codigo varchar NULL,
	credor_nome varchar NULL,
	modalidade_licitacao_codigo varchar NULL,
	modalidade_licitacao_nome varchar NULL,
	valor_empenhado numeric NULL,
	valor_liquidado numeric NULL,
	valor_pago numeric NULL
);

-- public.totais_despesas definition

-- Drop table

-- DROP TABLE public.totais_despesas;

CREATE TABLE public.totais_despesas (
	ano_mov varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	desp numeric NULL,
	despjan numeric NULL,
	despfev numeric NULL,
	despmar numeric NULL,
	despabr numeric NULL,
	despmai numeric NULL,
	despjun numeric NULL,
	despjul numeric NULL,
	despago numeric NULL,
	despset numeric NULL,
	despout numeric NULL,
	despnov numeric NULL,
	despdez numeric NULL,
	adminis numeric NULL,
	asssocial numeric NULL,
	cietec numeric NULL,
	comserv numeric NULL,
	cultura numeric NULL,
	desporlaz numeric NULL,
	educ numeric NULL,
	encarg numeric NULL,
	essjustica numeric NULL,
	gestamb numeric NULL,
	habit numeric NULL,
	prevsocial numeric NULL,
	sane numeric NULL,
	saude numeric NULL,
	segpub numeric NULL,
	trab numeric NULL,
	urbanismo numeric NULL,
	dircid numeric NULL,
	naoinfo numeric NULL,
	dispensa numeric NULL,
	selecaopub numeric NULL,
	concurso numeric NULL,
	pregregprec numeric NULL,
	concregprec numeric NULL,
	pregelet numeric NULL,
	inexig numeric NULL,
	credenc numeric NULL,
	pregao numeric NULL,
	convite numeric NULL,
	tomadapreco numeric NULL,
	concorrencia numeric NULL,
	convenio numeric NULL
);

-- public.orgaos_despesas definition

-- Drop table

-- DROP TABLE public.orgaos_despesas;

CREATE TABLE public.orgaos_despesas (
	ano varchar NULL,
	orgao_codigo varchar NULL,
	orgao_nome varchar NULL,
	id int4 NULL
);