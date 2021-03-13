create or replace function trg_mascotas_function()
returns trigger as
$BODY$
BEGIN   
UPDATE cliente SET num_mascotas_ll = num_mascotas_ll +1 
WHERE ci_cliente = NEW.ci_cliente;
RETURN NEW;
END;
$BODY$ language plpgsql;

CREATE TRIGGER trg_mascotas
AFTER INSERT ON mascotas
FOR EACH ROW
execute procedure trg_mascotas_function();



select ci_cliente, nombres_c, apellidos_c, num_mascota_ll from cliente;

INSERT INTO public.mascotas(
	id_mascotas, ci_cliente, nombre, fecha_nac, genero_masc, color, esterilizado, tipo)
	VALUES (11126, 1317706123, 'nube', '22/03/2018', 'masculino', 'cafe', 'no', 'perro');