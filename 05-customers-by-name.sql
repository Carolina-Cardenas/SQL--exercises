-- 1. Crear la tabla de clientes si todavía no existe.
CREATE TABLE IF NOT EXISTS public.customers (
    customer_id int PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

-- 2. Agregar clientes ficticios para probar el filtro.
INSERT INTO public.customers (customer_id, first_name, last_name)
VALUES
    (1, 'Astrid', 'Parker'),
    (2, 'Mark', 'Wilson'),
    (3, 'Emma', 'Brown'),
    (4, 'Mark', 'Taylor')
ON CONFLICT (customer_id) DO NOTHING;

-- 3. Crear el procedimiento que busca a Mark y Astrid.
CREATE OR REPLACE PROCEDURE public.get_customers_by_name(
    INOUT customer_rows refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN customer_rows FOR
        SELECT customer_id, first_name, last_name
        FROM public.customers
        WHERE first_name IN ('Mark', 'Astrid')
        ORDER BY first_name DESC, customer_id ASC;
END;
$$;

-- 4. Llamar al procedimiento y mostrar las filas encontradas.
BEGIN;
CALL public.get_customers_by_name('matching_customers');
FETCH ALL FROM matching_customers;
COMMIT;