-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Libro"
(
    id serial,
    titulo character varying,
    autor character varying,
    ejemplares numeric,
    tema serial,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Tema"
(
    id serial,
    nombre character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Socio"
(
    id serial,
    nombre character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Libro_Socio"
(
    "Libro_id" serial,
    "Socio_id" serial,
    fecha_prestamo date,
    fecha_devolucio date,
    PRIMARY KEY (fecha_prestamo)
);

ALTER TABLE IF EXISTS public."Libro"
    ADD FOREIGN KEY (tema)
    REFERENCES public."Tema" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Libro_Socio"
    ADD FOREIGN KEY ("Libro_id")
    REFERENCES public."Libro" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Libro_Socio"
    ADD FOREIGN KEY ("Socio_id")
    REFERENCES public."Socio" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;