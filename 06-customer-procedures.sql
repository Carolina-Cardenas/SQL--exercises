-- A. Buscar clientes por nombre. Si se omite el nombre, buscar Mark.
CREATE OR REPLACE PROCEDURE public.find_customers_by_first_name(
    IN search_name text DEFAULT 'Mark',
    INOUT customer_rows refcursor DEFAULT 'customers_by_first_name'
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN customer_rows FOR
        SELECT customer_id, first_name, last_name
        FROM public.customers
        WHERE first_name = search_name
        ORDER BY customer_id;
END;
$$;

-- B. Buscar clientes cuyo apellido empieza por P.
CREATE OR REPLACE PROCEDURE public.find_customers_with_p_last_name(
    INOUT customer_rows refcursor
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN customer_rows FOR
        SELECT customer_id, first_name, last_name
        FROM public.customers
        WHERE last_name LIKE 'P%'
        ORDER BY last_name, customer_id;
END;
$$;

-- Prueba A1. Usar el nombre predeterminado: Mark.
BEGIN;
CALL public.find_customers_by_first_name();
FETCH ALL FROM customers_by_first_name;
COMMIT;

-- Prueba A2. Pasar un nombre: Astrid.
BEGIN;
CALL public.find_customers_by_first_name('Astrid');
FETCH ALL FROM customers_by_first_name;
COMMIT;

-- Prueba B. Buscar apellidos que empiezan por P.
BEGIN;
CALL public.find_customers_with_p_last_name('customers_with_p');
FETCH ALL FROM customers_with_p;
COMMIT;