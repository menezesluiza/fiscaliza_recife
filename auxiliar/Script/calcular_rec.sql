CREATE OR REPLACE FUNCTION public.calcular_rec(ano_update text, orgao_update text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE 
	nomeo text;
begin   
	if (orgao_update = '0') 
		then nomeo = 'TODOS OS ÓRGÃOS' ;
	else nomeo = (select distinct orgao_nome from receitas where orgao_codigo= orgao_update and ano=ano_update);
	end if;
	
	insert into public.totais_receitas (ano, orgao_codigo, orgao_nome) values (ano_update,orgao_update, nomeo);
	if (orgao_update = '0') then
		update public.totais_receitas set recarrec = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update)
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recprev = 
				(select sum(receita_prevista_atualizada)
				from receitas 
				where ano=ano_update			)
				where ano=ano_update and orgao_codigo =orgao_update;
		--MENSAL
		update public.totais_receitas set recArrecJan = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='1')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecFev = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='2')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecMar = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='3')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecAbr = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='4')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecMai = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='5')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecJun = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='6')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set recArrecJul = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='7')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecAgo = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='8')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecSet = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='9')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecOut = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='10')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecNov = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='11')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecDez = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and mes='12')
				where ano=ano_update and orgao_codigo =orgao_update;	
			
		--CATEGORIA
		update public.totais_receitas set recCorrente = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and categoria_receita_codigo = '1')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recCapital = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and categoria_receita_codigo = '2')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recCorrenteInfra = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and categoria_receita_codigo = '7')
				where ano=ano_update and orgao_codigo =orgao_update;	
		--FONTE
		update public.totais_receitas set alien = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'ALIENAÇÃO DE BENS')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set amort = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'AMORTIZAÇÃO DE EMPRÉSTIMOS')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set contri = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'CONTRIBUIÇÕES')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set impostos = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'IMPOSTOS, TAXAS E CONTRIBUIÇÕES DE MELHORIA')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set opCredito = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'OPERAÇÕES DE CRÉDITO')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set  outrasCred = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'OUTRAS RECEITAS CORRENTES')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set outrasCap = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'OUTRAS RECEITAS DE CAPITAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recServ = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'RECEITA DE SERVIÇOS')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recPatri = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'RECEITA PATRIMONIAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set transfCorr = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'TRANSFERÊNCIAS CORRENTES')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set transfCap = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update
				and fonte_origem_receita_nome = 'TRANSFERÊNCIAS DE CAPITAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
	else 
	
			update public.totais_receitas set recarrec = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update)
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recprev = 
				(select sum(receita_prevista_atualizada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update)
				where ano=ano_update and orgao_codigo =orgao_update;
		--MENSAL
		update public.totais_receitas set recArrecJan = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='1')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecFev = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='2')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecMar = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='3')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecAbr = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='4')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecMai = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='5')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecJun = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='6')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set recArrecJul = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='7')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecAgo = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='8')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecSet = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='9')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecOut = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='10')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecNov = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='11')
				where ano=ano_update and orgao_codigo =orgao_update;
		update public.totais_receitas set recArrecDez = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and mes='12')
				where ano=ano_update and orgao_codigo =orgao_update;	
			
		--CATEGORIA
		update public.totais_receitas set recCorrente = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and categoria_receita_codigo = '1')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recCapital = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and categoria_receita_codigo = '2')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recCorrenteInfra = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and categoria_receita_codigo = '7')
				where ano=ano_update and orgao_codigo =orgao_update;	
		--FONTE
		update public.totais_receitas set alien = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'ALIENAÇÃO DE BENS')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set amort = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'AMORTIZAÇÃO DE EMPRÉSTIMOS')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set contri = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'CONTRIBUIÇÕES')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set impostos = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'IMPOSTOS, TAXAS E CONTRIBUIÇÕES DE MELHORIA')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set opCredito = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'OPERAÇÕES DE CRÉDITO')
				where ano=ano_update and orgao_codigo =orgao_update;		
		update public.totais_receitas set  outrasCred = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'OUTRAS RECEITAS CORRENTES')
				where ano=ano_update and orgao_codigo =orgao_update;			
		update public.totais_receitas set outrasCap = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'OUTRAS RECEITAS DE CAPITAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recServ = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'RECEITA DE SERVIÇOS')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set recPatri = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'RECEITA PATRIMONIAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set transfCorr = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'TRANSFERÊNCIAS CORRENTES')
				where ano=ano_update and orgao_codigo =orgao_update;	
		update public.totais_receitas set transfCap = 
				(select sum(receita_arrecadada)
				from receitas 
				where ano=ano_update and orgao_codigo =orgao_update
				and fonte_origem_receita_nome = 'TRANSFERÊNCIAS DE CAPITAL')
				where ano=ano_update and orgao_codigo =orgao_update;	
	
	end if;

	update totais_receitas set recarrec = 0 where recarrec is null;
	update totais_receitas set recprev = 0 where recprev is null;
	update totais_receitas set recarrecjan = 0 where recarrecjan is null;
	update totais_receitas set recarrecfev = 0 where recarrecfev is null;
	update totais_receitas set recarrecmar = 0 where recarrecmar is null;
	update totais_receitas set recarrecabr = 0 where recarrecabr is null;
	update totais_receitas set recarrecmar = 0 where recarrecmar is null;
	update totais_receitas set recarrecmai = 0 where recarrecmai is null;
	update totais_receitas set recarrecjul = 0 where recarrecjul is null;
	update totais_receitas set recarrecago = 0 where recarrecago is null;
	update totais_receitas set recarrecset = 0 where recarrecset is null;
	update totais_receitas set recarrecout = 0 where recarrecout is null;
	update totais_receitas set recarrecnov = 0 where recarrecnov is null;
	update totais_receitas set recarrecdez = 0 where recarrecdez is null;
	update totais_receitas set reccapital = 0 where reccapital is null;
	update totais_receitas set reccorrente = 0 where reccorrente is null;
	update totais_receitas set reccorrenteinfra = 0 where reccorrenteinfra is null;
	update totais_receitas set transfcorr = 0 where transfcorr is null;
	update totais_receitas set impostos = 0 where impostos is null;
	update totais_receitas set outrascred = 0 where outrascred is null;
	update totais_receitas set opcredito = 0 where opcredito is null;
	update totais_receitas set outrascap = 0 where outrascap is null;
	update totais_receitas set recpatri = 0 where recpatri is null;
	update totais_receitas set recserv = 0 where recserv is null;
	update totais_receitas set transfcap = 0 where transfcap is null;
	update totais_receitas set contri = 0 where contri is null;
	update totais_receitas set alien = 0 where alien is null;
	update totais_receitas set amort = 0 where amort is null;

	
	
	
END;
$function$
;
