-- iniciar postgresql

psql -U postgres

-- Creacion de Base de datos

CREATE DATABASE mydatabase;

-- ingresar a Base
\c  mydatabase;

-- Crear tabla usuarios

CREATE TABLE usuarios (id serial PRIMARY KEY, email varchar, nombre varchar, apellido varchar, rol varchar);

-- Insertar usuarios

INSERT INTO usuarios (email, nombre, apellido, rol) VALUES ('jn@gmail.com', 'Jorge', 'Nitales', 'usuario'),('eb@gmail.com', 'Elba', 'Boza', 'usuario'),('sp@gmail.com', 'Sevelinda', 'Parada', 'administrador'),('tl@gmail.com', 'Tekuro', 'Latos', 'usuario'), ('ap@gmail.com', 'Aquiles', 'Pinto', 'usuario');


-- Resultado
mydatabase=# SELECT*FROM usuarios;
 id |    email     |  nombre   | apellido |      rol      
----+--------------+-----------+----------+---------------
  1 | jn@gmail.com | Jorge     | Nitales  | usuario
  2 | eb@gmail.com | Elba      | Boza     | usuario
  3 | sp@gmail.com | Sevelinda | Parada   | administrador
  4 | tl@gmail.com | Tekuro    | Latos    | usuario
  5 | ap@gmail.com | Aquiles   | Pinto    | usuario
(5 rows)



-- Crear tabla posts

CREATE TABLE posts (id serial PRIMARY KEY, titulo varchar, contenido text, fecha_creacion timestamp DEFAULT CURRENT_TIMESTAMP, fecha_actualizacion timestamp DEFAULT CURRENT_TIMESTAMP, destacado boolean, usuario_id bigint);

-- Insertar posts

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id)VALUES('Viaje a la montaña', 'Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes.', '2023-11-27 10:00:00', NOW(), true, 1),('Receta de pastel de chocolate', '¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!', '2023-11-25 15:30:00', '2023-11-26 09:45:00', false, 1),('Consejos para viajar ligero', 'Viajar ligero puede hacer tus aventuras mucho más fáciles. Aquí te doy algunos consejos para lograrlo.', '2023-11-24 08:00:00', '2023-11-24 08:00:00', true, 2),('Resumen de la conferencia de tecnología', 'La última conferencia de tecnología presentó avances emocionantes en inteligencia artificial y robótica.', '2023-11-22 11:20:00', '2023-11-23 14:10:00', true, 3),('Consejos para mantenerse enfocado en el trabajo remoto', 'El trabajo remoto tiene sus desafíos. Aquí te comparto algunos consejos para mantener la concentración.', '2023-11-20 09:45:00', '2023-11-21 11:00:00', false, null);


-- Resultado
mydatabase=# SELECT*FROM posts;
 id |                         titulo                         |                                                contenido                                                 |   fecha_creacion    |    fecha_actualizacion    | destacado | usuario_id 
----+--------------------------------------------------------+----------------------------------------------------------------------------------------------------------+---------------------+---------------------------+-----------+------------
  1 | Viaje a la montaña                                     | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes.               | 2023-11-27 10:00:00 | 2023-11-28 01:36:14.35834 | t         |          1
  2 | Receta de pastel de chocolate                          | ¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!                     | 2023-11-25 15:30:00 | 2023-11-26 09:45:00       | f         |          1
  3 | Consejos para viajar ligero                            | Viajar ligero puede hacer tus aventuras mucho más fáciles. Aquí te doy algunos consejos para lograrlo.   | 2023-11-24 08:00:00 | 2023-11-24 08:00:00       | t         |          2
  4 | Resumen de la conferencia de tecnología                | La última conferencia de tecnología presentó avances emocionantes en inteligencia artificial y robótica. | 2023-11-22 11:20:00 | 2023-11-23 14:10:00       | t         |         :




-- Crear tabla comentarios

CREATE TABLE comentarios (id serial PRIMARY KEY,contenido text,fecha_creacion timestamp,usuario_id bigint,post_id bigint);

-- Insertar comentarios

INSERT INTO comentarios (contenido, fecha_creacion, usuario_id, post_id)VALUES('Gran vista desde la cima. ¡Increíble experiencia!', '2023-11-28 12:00:00', 1, 1),('¡Me encantaría visitar esa montaña algún día!', '2023-11-28 13:30:00', 2, 1),('Las fotos que tomaste son asombrosas. ¡Quiero ir!', '2023-11-28 15:45:00', 3, 1),('Gracias por compartir esta receta. ¡Voy a probarla!', '2023-11-26 16:20:00', 1, 2),('El pastel se ve delicioso. ¡Gracias por los consejos!', '2023-11-27 09:00:00', 2, 2);


-- Resultado
mydatabase=# SELECT*FROM comentarios;
 id |                       contenido                       |   fecha_creacion    | usuario_id | post_id 
----+-------------------------------------------------------+---------------------+------------+---------
  1 | Gran vista desde la cima. ¡Increíble experiencia!     | 2023-11-28 12:00:00 |          1 |       1
  2 | ¡Me encantaría visitar esa montaña algún día!         | 2023-11-28 13:30:00 |          2 |       1
  3 | Las fotos que tomaste son asombrosas. ¡Quiero ir!     | 2023-11-28 15:45:00 |          3 |       1
  4 | Gracias por compartir esta receta. ¡Voy a probarla!   | 2023-11-26 16:20:00 |          1 |       2
  5 | El pastel se ve delicioso. ¡Gracias por los consejos! | 2023-11-27 09:00:00 |          2 |       2
(5 rows)



-- 2) Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas. nombre e email del usuario junto al título y contenido del posts. 

SELECT a.nombre, a.email, b.titulo, b.contenido  FROM usuarios as a INNER JOIN posts as b ON a.id = b.usuario_id;


-- Respuesta

 mydatabase=# SELECT a.nombre, a.email, b.titulo, b.contenido  FROM usuarios as a INNER JOIN posts as b ON a.id = b.usuario_id;
  nombre   |    email     |                 titulo                  |                                                contenido                                                 
-----------+--------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------
 Jorge     | jn@gmail.com | Viaje a la montaña                      | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes.
 Jorge     | jn@gmail.com | Receta de pastel de chocolate           | ¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!
 Elba      | eb@gmail.com | Consejos para viajar ligero             | Viajar ligero puede hacer tus aventuras mucho más fáciles. Aquí te doy algunos consejos para lograrlo.
 Sevelinda | sp@gmail.com | Resumen de la conferencia de tecnología | La última conferencia de tecnología presentó avances emocionantes en inteligencia artificial y robótica.
(4 rows)


-- 3) Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id.

SELECT p.id,titulo,contenido FROM posts p INNER JOIN usuarios u ON u.id=p.usuario_id WHERE u.rol = 'administrador';

-- Respuesta

mydatabase=# SELECT p.id,titulo,contenido FROM posts p INNER JOIN usuarios u ON u.id=p.usuario_id WHERE u.rol = 'administrador';
 id |                 titulo                  |                                                contenido                                                 
----+-----------------------------------------+----------------------------------------------------------------------------------------------------------
  4 | Resumen de la conferencia de tecnología | La última conferencia de tecnología presentó avances emocionantes en inteligencia artificial y robótica.
(1 row)



-- 4) Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de post de cada usuario.

SELECT a.id, a.email, COUNT(b.id) AS cantidad_posts FROM usuarios as  a LEFT JOIN posts b ON a.id = b.usuario_id GROUP BY a.id, a.email;

-- Respuesta

mydatabase=# SELECT a.id, a.email, COUNT(b.id) AS cantidad_posts FROM usuarios as  a LEFT JOIN posts b ON a.id = b.usuario_id GROUP BY a.id, a.email;
 id |    email     | cantidad_posts 
----+--------------+----------------
  4 | tl@gmail.com |              0
  2 | eb@gmail.com |              1
  3 | sp@gmail.com |              1
  5 | ap@gmail.com |              0
  1 | jn@gmail.com |              2
(5 rows)




-- 5) Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email.

SELECT a.email FROM usuarios a INNER JOIN ( SELECT usuario_id, COUNT(*) as num_posts FROM posts GROUP BY usuario_id ORDER BY num_posts DESC LIMIT 1) as b ON a.id = b.usuario_id;

-- Respuesta

mydatabase=# SELECT a.email FROM usuarios a INNER JOIN ( SELECT usuario_id, COUNT(*) as num_posts FROM posts GROUP BY usuario_id ORDER BY num_posts DESC LIMIT 1) as b ON a.id = b.usuario_id;
    email     
--------------
 jn@gmail.com
(1 row)




-- 6) Muestra la fecha del último posts de cada usuario. 

SELECT a.nombre, a.apellido, a.email, TO_CHAR(max(b.fecha_creacion), 'DD-MM-YYYY') AS fecha_ultimo_post FROM usuarios a inner JOIN posts as b ON a.id = b.usuario_id GROUP BY a.nombre, a.apellido, a.email order by a.apellido;

-- Respuesta

mydatabase=# SELECT a.nombre, a.apellido, a.email, TO_CHAR(max(b.fecha_creacion), 'DD-MM-YYYY') AS fecha_ultimo_post FROM usuarios a inner JOIN posts as b ON a.id = b.usuario_id GROUP BY a.nombre, a.apellido, a.email order by a.apellido;
  nombre   | apellido |    email     | fecha_ultimo_post 
-----------+----------+--------------+-------------------
 Elba      | Boza     | eb@gmail.com | 24-11-2023
 Jorge     | Nitales  | jn@gmail.com | 27-11-2023
 Sevelinda | Parada   | sp@gmail.com | 22-11-2023
(3 rows)




-- 7) Muestra el título y contenido del posts (artículo) con más comentarios. 

SELECT p.titulo, p.contenido, c.num_comentarios FROM posts AS p INNER JOIN (SELECT post_id, COUNT(*) as num_comentarios FROM comentarios GROUP BY post_id ORDER BY num_comentarios DESC LIMIT 1) AS c ON p.id = c.post_id;

-- Respuesta

mydatabase=# SELECT p.titulo, p.contenido, c.num_comentarios FROM posts AS p INNER JOIN (SELECT post_id, COUNT(*) as num_comentarios FROM comentarios GROUP BY post_id ORDER BY num_comentarios DESC LIMIT 1) AS c ON p.id = c.post_id;
       titulo       |                                         contenido                                          | num_comentarios 
--------------------+--------------------------------------------------------------------------------------------+-----------------
 Viaje a la montaña | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes. |               3
(1 row)





-- 8) Muestra en una tabla el título de cada posts, el contenido de cada posts y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió. 

SELECT p.titulo as post_titulo, p.contenido as post_contenido, c.contenido as comentario_contenido, u.email from posts as p inner join comentarios as c on p.id=c.post_id INNER JOIN usuarios AS u ON u.id=c.usuario_id;

-- Respuesta

mydatabase=# SELECT p.titulo as post_titulo, p.contenido as post_contenido, c.contenido as comentario_contenido, u.email from posts as p inner join comentarios as c on p.id=c.post_id INNER JOIN usuarios AS u ON u.id=c.usuario_id;
          post_titulo          |                                       post_contenido                                       |                 comentario_contenido                  |    email     
-------------------------------+--------------------------------------------------------------------------------------------+-------------------------------------------------------+--------------
 Viaje a la montaña            | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes. | Gran vista desde la cima. ¡Increíble experiencia!     | jn@gmail.com
 Viaje a la montaña            | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes. | ¡Me encantaría visitar esa montaña algún día!         | eb@gmail.com
 Viaje a la montaña            | Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes. | Las fotos que tomaste son asombrosas. ¡Quiero ir!     | sp@gmail.com
 Receta de pastel de chocolate | ¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!       | Gracias por compartir esta receta. ¡Voy a probarla!   | jn@gmail.com
 Receta de pastel de chocolate | ¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!       | El pastel se ve delicioso. ¡Gracias por los consejos! | eb@gmail.com
(5 rows)







