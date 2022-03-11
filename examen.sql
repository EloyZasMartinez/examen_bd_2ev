-- SE DEBE EDITAR ESTE FICHERO Y AÑADIR LAS CONSULTAS SQL QUE RESUELVAN LA PREGUNTA
-- <= Estos guiones son comentarios en el fichero, para que se pueda ejecutar directamente
-- tambien se usan para que los editores de texto como sublimeText reconozcan la sintaxis SQL


-- Se debe poner tambien el resultado que devuelva la consulta (usar los guiones para no estropear el fichero)
-- En caso que sea un listado, vale con el primer resultado y el numero de elementos que devuelve la consulta

-- EJEMPLO

-- ¿Cuantos capitulos hay?
SELECT COUNT(*) FROM capitulos;
-- 6


-- CONSULTAS DEL EXAMEN:

-- 1.- ID de los personajes que hayan estado en el lugar 'Taberna 7ºCielo'
SELECT DISTINCT pj.id, pj.nombre FROM personaje pj
JOIN mn_personaje_anectdota mnpa ON mnpa.id_personaje=pj.id
WHERE mnpa.id_anecdota IN (SELECT a.id FROM anecdotas a
JOIN mn_lugares_anecdota mnla ON mnla.id_anecdota = a.id
WHERE(SELECT id FROM lugares WHERE nombre = "Taberna 7ºCielo"));

--sin resultado

-- 2.- ID, y Nombre de las personas con personajes que tuvieran la habilidad 'Bola de Fuego'

SELECT id, nombre FROM persona WHERE persona.id IN 
    (SELECT id_persona FROM personaje WHERE id IN 
        (SELECT id_personaje FROM mn_habilidad_personaje WHERE id_habilidad= 
            (SELECT id FROM habilidades WHERE nombre='Bola de Fuego')));

-- id 16 nombre marcos 1fila


-- 3.- ¿Que habilidades tienen los personajes casados?

SELECT nombre FROM habilidades WHERE id IN 
    (SELECT id_habilidad FROM mn_habilidad_personaje WHERE id_personaje IN 
        (SELECT id_personaje FROM relacion WHERE id_tipo_relacion= 
            (SELECT id FROM tipo_relacion WHERE nombre='casado')));

--9 filas nombre bola de fuego

-- 4.- ¿Que personaje tiene la fuerza más baja y quien lo interpreta?




-- 5.- Capitulos con más de una anecdota relacionada

-- 6.- Todas las relaciones de los personajes del capitulo 1

-- 7.- ¿Cual es la media de carisma de los Humanos?

-- 8.- ¿Cual es la media de los personajes de una persona?

-- 9.- ¿Cual es la raza habitual de 'Pablo Rodriguez'?

-- 10.- Habilidades que no estuvieran en ninguna anecdota

-- 11.- ¿Cuantos personajes hubo en cada anecdota?

SELECT COUNT(id_persona) FROM anecdotas GROUP BY(titulo);
--14 filas 171 personajes en la primera anecdota


-- 12.- Listado de Personajes de cada capitulo

-- 13.- Lugares más repetidos en las anecdotas

-- 14.- ¿Que raza tiene la constitución más baja?

-- 15.- ¿Que raza de personaje es más bajo de media?