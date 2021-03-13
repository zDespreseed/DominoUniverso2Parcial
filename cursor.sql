do $$
declare
        registro record;
        mascotas_a cursor for SELECT 
			veterinario.nombre_v,
			veterinario.apellido_v,
			mascotas.nombre,
			consulta.fecha_consulta
            from consulta
			INNER JOIN mascotas on consulta.id_mascotas = mascotas.id_mascotas
			INNER JOIN veterinario on consulta.ci_veterinario = veterinario.ci_veterinario;
begin
for registro in mascotas_a loop
Raise notice 'Nombre: %, Apellido: %, Nombre Mascota: %, Fecha Atencion: %',
			registro.nombre_v,registro.apellido_v, registro.nombre, registro.fecha_consulta;
end loop;
end $$
language 'plpgsql';