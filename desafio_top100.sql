# 1. Crear database
CREATE DATABASE peliculas
# cambia a database "peliculas"
\c peliculas
# Crea las tablas
CREATE TABLE peliculas(id_peliculas INT,pelicula VARCHAR(100),ano_de_estreno INT,director VARCHAR(50),PRIMARY KEY (id_peliculas));

CREATE TABLE reparto(id_reparto INT, actor VARCHAR);

# 2.Copia el contenido de los archivos a sus tablas
\copy peliculas FROM '/tmp/peliculas_db/peliculas.csv'  csv header;

\copy reparto FROM '/tmp/peliculas_db/reparto.csv' csv; 

# 3. ID pelicula Titanic
SELECT id_peliculas WHERE pelicula='Titanic';SELECT id_peliculas FROM peliculas WHERE pelicula='Titanic';

# 4. Listar actores de Titanic
SELECT actor FROM reparto WHERE reparto.id_peliculas=(SELECT id_peliculas FROM peliculas WHERE pelicula='Titanic');

# 5. Cuantas peliculas participa Harrison Ford
SELECT COUNT(id_peliculas) FROM reparto WHERE actor='Harrison Ford';

# 6. Peliculas entre 1990 y 1999 en orden titulo ascendente
SELECT * FROM peliculas WHERE ano_de_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

# 7. Consulta SQL que muestre longitud del titulo,  la longitud debe ser nombrada como "longitud_titulo"
SELECT length(pelicula) as longitud_titulo FROM peliculas;

# 8. Consultar cual es la longitud más larga de los titulos
SELECT MAX(length(pelicula))  FROM peliculas;
