-- 1. Crear la base de datos.
-- Este paso ya lo ejecutaste en psql.
CREATE DATABASE school;

-- 2. Seleccionar la base school en la conexión de VS Code.
-- A partir de aquí, las instrucciones se ejecutan dentro de school.

-- 3. Crear la tabla de estudiantes.
CREATE TABLE public.students (
    sid integer PRIMARY KEY,
    fname varchar(20) NOT NULL,
    lname varchar(20) NOT NULL,
    comment text
);

-- 4. Agregar tres estudiantes.
INSERT INTO public.students (sid, fname, lname, comment)
VALUES
    (1, 'Emma', 'Brown', 'Learning SQL'),
    (2, 'James', 'Wilson', NULL),
    (3, 'Olivia', 'Taylor', 'Learning C#');

-- 5. Mostrar los estudiantes guardados.
SELECT sid, fname, lname, comment
FROM public.students
ORDER BY sid;