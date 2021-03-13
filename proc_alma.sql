create or replace function consulta_function()
RETURNS SETOF consulta AS
$BODY$
			
BEGIN   
RETURN query
SELECT *
            from consulta
		where consulta.fecha_consulta > CURRENT_DATE;
END;
$BODY$ 
language plpgsql;


select * FROM consulta_function();