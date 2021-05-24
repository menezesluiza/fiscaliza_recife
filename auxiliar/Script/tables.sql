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
	categoria_receita_codigo varchar NULL,
	categoria_receita_nome varchar NULL,
	fonte_origem_receita_codigo varchar NULL,
	fonte_origem_receita_nome varchar NULL,
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