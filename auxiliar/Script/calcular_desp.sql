CREATE OR REPLACE FUNCTION public.calcular_desp(ano_update text, orgao_update text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE 
	nomeo text;
begin  
	--update desp set modalidade_licitacao_codigo = trim(modalidade_licitacao_codigo);
	--update desp set funcao_codigo = trim(funcao_codigo);
	--update desp set mes = trim(mes);

	if (orgao_update = '0') 
		then nomeo = 'TODOS OS ÓRGÃOS' ;
	else nomeo = (select distinct d.orgao_nome from desp d 
					where d.orgao_codigo= orgao_update and d.ano_mov = ano_update limit 1);
	end if;
	
	insert into public.totais_despesas (ano_mov, orgao_codigo, orgao_nome) values (ano_update,orgao_update, nomeo);
	
if (orgao_update = '0') then
		update public.totais_despesas set desp = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update)
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		--MENSAL
		update public.totais_despesas set despJan = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='1')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despFev = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='2')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despMar = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='3')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despAbr = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='4')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despMai = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='5')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despJun = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='6')
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		update public.totais_despesas set despJul = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='7')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despAgo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='8')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despSet = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='9')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despOut = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='10')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despNov = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='11')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despDez = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.mes='12')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		--FUNCAO
		update public.totais_despesas set desporlaz = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='27')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set dircid = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='14')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set adminis = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo in('4','04'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set assSocial = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo in('8','08'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set cieTec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='19')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set comServ = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='23')
				where ano_mov=ano_update and orgao_codigo =orgao_update;				
		update public.totais_despesas set cultura = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='13')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set educ = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='12')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set encarg = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='28')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set essJustica = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo in('3','03'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;				
		update public.totais_despesas set gestAmb = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='18')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set habit = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='16')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set prevSocial = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo in('9','09'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set sane = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='17')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set saude = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='10')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set segPub = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo in('6','06'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set trab = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='11')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set urbanismo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.funcao_codigo='15')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
			
	--MODAL
		update public.totais_despesas set naoInfo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('0'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set dispensa = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('1','10','11','13','14','15','16','17','18','2','21','23',
													'24','3','4','40','5','56','57',
													'58','6','7','9','91','92','94','95','97','98','99'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;

		update public.totais_despesas set selecaoPub = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('26'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concurso = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('34'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set pregRegPrec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('36','37'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concRegPrec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('53','96'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		
		update public.totais_despesas set pregElet = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('38','27'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set inexig = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('60','61','62','66','67','90'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		
		update public.totais_despesas set credenc = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('63'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set pregao = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('81'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		
		update public.totais_despesas set convite = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('83'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set tomadaPreco = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('84','85','86'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concorrencia = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('87','88','89'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set convenio = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update
				and d.modalidade_licitacao_codigo in ('93'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
	
	else 
		update public.totais_despesas set desp = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update)
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
--MENSAL
		update public.totais_despesas set despJan = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='1')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despFev = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='2')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despMar = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='3')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despAbr = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='4')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despMai = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='5')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despJun = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='6')
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		update public.totais_despesas set despJul = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='7')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despAgo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='8')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despSet = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='9')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despOut = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='10')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despNov = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='11')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set despDez = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.mes='12')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
						
		--FUNCAO
		update public.totais_despesas set desporlaz = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='27')
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set dircid = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='14')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set adminis = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo in ('4','04'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set assSocial = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo in ('8','08'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set cieTec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='19')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set comServ = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='23')
				where ano_mov=ano_update and orgao_codigo =orgao_update;				
		update public.totais_despesas set cultura = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='13')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set educ = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='12')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set encarg = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='28')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set essJustica = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo in ('3','03'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;				
		update public.totais_despesas set gestAmb = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='18')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set habit = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='16')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set prevSocial = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo in ('9','09'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set sane = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='17')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set saude = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='10')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set segPub = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo in ('6','06'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set trab = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='11')
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
		update public.totais_despesas set urbanismo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.funcao_codigo='15')
				where ano_mov=ano_update and orgao_codigo =orgao_update;				
			
		--MODAL
				update public.totais_despesas set naoInfo = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update			
				and d.modalidade_licitacao_codigo in ('0'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set dispensa = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('1','10','11','13','14','15','16','17','18','2','21','23',
													'24','3','4','40','5','56','57',
													'58','6','7','9','91','92','94','95','97','98','99'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set selecaoPub = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('26'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concurso = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('34'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set pregRegPrec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('36','37'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concRegPrec = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('53','96'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		update public.totais_despesas set pregElet = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('38','27'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set inexig = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('60','61','62','66','67','90'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		update public.totais_despesas set credenc = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('63'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set pregao = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('81'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;		
		update public.totais_despesas set convite = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('83'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set tomadaPreco = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('84','85','86'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set concorrencia = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('87','88','89'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;
		update public.totais_despesas set convenio = 
				(select sum(d.valor_pago)
				from desp d 
				where d.ano_mov=ano_update and d.orgao_codigo =orgao_update
				and d.modalidade_licitacao_codigo in ('93'))
				where ano_mov=ano_update and orgao_codigo =orgao_update;	
	end if;		
	
	
END;
$function$
;
