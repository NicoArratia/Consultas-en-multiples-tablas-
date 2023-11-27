-- iniciar postgresql

psql -U postgres

-- Creacion de Base de datos

CREATE DATABASE desafio3_nico_cosultas_multiples;

-- ingresar a Base

\c desafio3_nico_consultas_multiples

-- Crear tabla usuarios

CREATE TABLE usuarios (
  id serial PRIMARY KEY,
  email varchar,
  nombre varchar,
  apellido varchar,
  rol varchar);

-- Insertar usuarios

INSERT INTO usuarios (email, nombre, apellido, rol)
VALUES 
  ('jn@gmail.com', 'Jorge', 'Nitales', 'usuario'),
  ('eb@gmail.com', 'Elba', 'Boza', 'usuario'),
  ('sp@gmail.com', 'Sevelinda', 'Parada', 'administrador'),
  ('tl@gmail.com', 'Tekuro', 'Latos', 'usuario'),
  ('ap@gmail.com', 'Aquiles', 'Pinto', 'usuario');



-- Resultado








-- Crear tabla posts

CREATE TABLE posts (
  id serial PRIMARY KEY,
  titulo varchar,
  contenido text,
  fecha_creacion timestamp DEFAULT CURRENT_TIMESTAMP,
  fecha_actualizacion timestamp DEFAULT CURRENT_TIMESTAMP,
  destacado boolean,
  usuario_id bigint);

-- Insertar posts

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id)
VALUES
  ('Viaje a la montaña', 'Hoy subí a la montaña más alta de la región. Las vistas desde la cima eran impresionantes.', '2023-11-27 10:00:00', NOW(), true, 1),
  ('Receta de pastel de chocolate', '¡Descubre cómo hacer un delicioso pastel de chocolate en casa con esta receta fácil!', '2023-11-25 15:30:00', '2023-11-26 09:45:00', false, 1),
  ('Consejos para viajar ligero', 'Viajar ligero puede hacer tus aventuras mucho más fáciles. Aquí te doy algunos consejos para lograrlo.', '2023-11-24 08:00:00', '2023-11-24 08:00:00', true, 2),
  ('Resumen de la conferencia de tecnología', 'La última conferencia de tecnología presentó avances emocionantes en inteligencia artificial y robótica.', '2023-11-22 11:20:00', '2023-11-23 14:10:00', true, 3),
  ('Consejos para mantenerse enfocado en el trabajo remoto', 'El trabajo remoto tiene sus desafíos. Aquí te comparto algunos consejos para mantener la concentración.', '2023-11-20 09:45:00', '2023-11-21 11:00:00', false, null);


-- Resultado
















-- Crear tabla comentarios

CREATE TABLE comentarios (
  id serial PRIMARY KEY,
  contenido text,
  fecha_creacion timestamp,
  usuario_id bigint,
  post_id bigint);

-- Insertar comentarios

INSERT INTO comentarios (contenido, fecha_creacion, usuario_id, post_id)
VALUES
  ('Gran vista desde la cima. ¡Increíble experiencia!', '2023-11-28 12:00:00', 1, 1),
  ('¡Me encantaría visitar esa montaña algún día!', '2023-11-28 13:30:00', 2, 1),
  ('Las fotos que tomaste son asombrosas. ¡Quiero ir!', '2023-11-28 15:45:00', 3, 1),
  ('Gracias por compartir esta receta. ¡Voy a probarla!', '2023-11-26 16:20:00', 1, 2),
  ('El pastel se ve delicioso. ¡Gracias por los consejos!', '2023-11-27 09:00:00', 2, 2);


-- Resultado











