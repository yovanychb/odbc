CREATE TABLE public.extension (
    extension integer NOT NULL,
    id_troncal integer NOT NULL,
    fecha_registro timestamp without time zone NOT NULL
);

ALTER TABLE public.extension OWNER TO asterisk;

CREATE TABLE public.peers_quesitos (
    id integer NOT NULL,
    defaultuser character varying(32),
    host character varying(32),
    type character varying(16),
    secret character varying(16),
    fullname character varying(64),
    name character varying(16)
);

ALTER TABLE public.peers_quesitos OWNER TO asterisk;

CREATE SEQUENCE public.peers_quesitos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.peers_quesitos_id_seq OWNER TO asterisk;

ALTER SEQUENCE public.peers_quesitos_id_seq OWNED BY public.peers_quesitos.id;

CREATE TABLE public.troncal (
    id_troncal integer NOT NULL,
    nombre text NOT NULL,
    password text NOT NULL
);

ALTER TABLE public.troncal OWNER TO asterisk;

CREATE SEQUENCE public.troncal_id_troncal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.troncal_id_troncal_seq OWNER TO asterisk;

ALTER SEQUENCE public.troncal_id_troncal_seq OWNED BY public.troncal.id_troncal;

ALTER TABLE ONLY public.peers_quesitos ALTER COLUMN id SET DEFAULT nextval('public.peers_quesitos_id_seq'::regclass);

ALTER TABLE ONLY public.troncal ALTER COLUMN id_troncal SET DEFAULT nextval('public.troncal_id_troncal_seq'::regclass);

SELECT pg_catalog.setval('public.peers_quesitos_id_seq', 1, false);

SELECT pg_catalog.setval('public.troncal_id_troncal_seq', 1, false);

ALTER TABLE ONLY public.extension
    ADD CONSTRAINT id_extension PRIMARY KEY (extension);

ALTER TABLE ONLY public.troncal
    ADD CONSTRAINT id_troncal PRIMARY KEY (id_troncal);

ALTER TABLE ONLY public.peers_quesitos
    ADD CONSTRAINT peers_quesitos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.extension
    ADD CONSTRAINT id_troncal FOREIGN KEY (id_troncal) REFERENCES public.troncal(id_troncal) ON UPDATE CASCADE ON DELETE CASCADE;


INSERT INTO public.extension VALUES (2001, 2, '2019-01-19 10:23:51');
INSERT INTO public.extension VALUES (2002, 2, '2019-01-19 09:12:20');
INSERT INTO public.extension VALUES (3001, 2, '2018-03-19 10:23:54');
INSERT INTO public.extension VALUES (3002, 2, '2019-02-19 09:12:02');
INSERT INTO public.extension VALUES (4001, 1, '2019-03-19 09:12:25');
INSERT INTO public.extension VALUES (4002, 1, '2019-10-21 13:57:45');
INSERT INTO public.extension VALUES (5001, 1, '2017-10-11 19:12:52');
INSERT INTO public.extension VALUES (5002, 1, '2018-05-19 21:05:02');
INSERT INTO public.extension VALUES (6001, 3, '2019-01-19 15:56:28');
INSERT INTO public.extension VALUES (6002, 3, '2016-12-30 19:12:53');
INSERT INTO public.extension VALUES (7001, 3, '2017-07-09 16:17:45');
INSERT INTO public.extension VALUES (7002, 3, '2015-01-23 09:12:02');

INSERT INTO public.peers_quesitos VALUES (1, '7001', 'dynamic', 'friend', '123', 'Yovany Chavez', '7001');

INSERT INTO public.troncal VALUES (1, 'troncal-rancheritos', '1234');
INSERT INTO public.troncal VALUES (2, 'troncal-toztecas', '345y');
INSERT INTO public.troncal VALUES (3, 'troncal-quesitos', 'quesitos');


