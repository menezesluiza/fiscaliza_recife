CREATE OR REPLACE FUNCTION public.calcular_rec_orgaos(ano_rec text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE 
  c CURSOR is select distinct orgao_codigo from receitas where ano = ano_rec;  
  rec RECORD;
begin
	
  perform public.calcular_rec(ano_rec,'0');
 
  OPEN c;
  LOOP
    FETCH c INTO rec;
    IF NOT FOUND 
        THEN EXIT; 
    END IF;
   
   perform public.calcular_rec(ano_rec, rec.orgao_codigo);
   
   
   
    
  END LOOP;
  CLOSE c;
END;
$function$
;
