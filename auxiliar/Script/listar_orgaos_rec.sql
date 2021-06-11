CREATE OR REPLACE FUNCTION public.listar_orgaos_rec(ano_rec text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE 
  c CURSOR is  select distinct orgao_codigo from totais_receitas where ano = ano_rec;  
  rec RECORD;
  id int = 0;
  nome text;
begin
	--insert into public.orgaos_despesas values (ano_desp, '0', 'TODOS OS ÓRGÃOS', id); 
  OPEN c;
  LOOP
    FETCH c INTO rec;
    IF NOT FOUND 
        THEN EXIT; 
    END IF;
   id = id + 1;
   nome = (select orgao_nome from totais_receitas where orgao_codigo = rec.orgao_codigo and ano=ano_rec limit 1);
   insert into public.orgaos_receitas values (ano_rec, rec.orgao_codigo, nome, id);
   
    
  END LOOP;
  CLOSE c;
END;
$function$
;
