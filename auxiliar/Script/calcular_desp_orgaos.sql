CREATE OR REPLACE FUNCTION public.calcular_desp_orgaos(ano_desp text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE 
  c CURSOR is select distinct orgao_codigo from desp d where d.ano_mov = ano_desp;  
  rec RECORD;
begin
	
  --update desp set modalidade_licitacao_codigo = trim(modalidade_licitacao_codigo);	
  perform public.calcular_desp(ano_desp,'0');
 
  OPEN c;
  LOOP
    FETCH c INTO rec;
    IF NOT FOUND 
        THEN EXIT; 
    END IF;
   
   perform public.calcular_desp(ano_desp, rec.orgao_codigo);
   
   
   
    
  END LOOP;
  CLOSE c;
END;
$function$
;
