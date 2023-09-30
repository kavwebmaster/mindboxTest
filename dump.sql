--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: habrpguser
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO habrpguser;

--
-- Name: products; Type: TABLE; Schema: public; Owner: habrpguser
--

CREATE TABLE public.products (
    uuid uuid NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.products OWNER TO habrpguser;

--
-- Name: products_categories; Type: TABLE; Schema: public; Owner: habrpguser
--

CREATE TABLE public.products_categories (
    product_id uuid NOT NULL,
    category_id uuid NOT NULL
);


ALTER TABLE public.products_categories OWNER TO habrpguser;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: habrpguser
--

COPY public.categories (id, name) FROM stdin;
8e9588cd-8d50-4845-bec8-69bae6812f77	Apple
a48f279b-2cf4-4cb5-9ae1-fc69b628dcdc	Samsung
02722db7-5fc5-4eb1-98f8-d313c6b5e70c	SmartPhones
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: habrpguser
--

COPY public.products (uuid, name) FROM stdin;
99bdb708-810d-421c-bb79-c9de6879380b	IPhone13
cc317314-1649-4340-bc6f-b9e22fd784ba	IPhone14
c8c48841-654a-4d9b-8c9b-77226963b15a	IPhone15
3c42b81c-01da-4271-9a21-ace656de4b2f	GalaxyS21
2c391f3e-9d7c-43df-afe9-ffc348455d29	GalaxyS22
98642b7f-7a7c-42cc-982b-d78fdf6112e8	YaPhone
\.


--
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: habrpguser
--

COPY public.products_categories (product_id, category_id) FROM stdin;
99bdb708-810d-421c-bb79-c9de6879380b	02722db7-5fc5-4eb1-98f8-d313c6b5e70c
cc317314-1649-4340-bc6f-b9e22fd784ba	02722db7-5fc5-4eb1-98f8-d313c6b5e70c
c8c48841-654a-4d9b-8c9b-77226963b15a	02722db7-5fc5-4eb1-98f8-d313c6b5e70c
3c42b81c-01da-4271-9a21-ace656de4b2f	02722db7-5fc5-4eb1-98f8-d313c6b5e70c
2c391f3e-9d7c-43df-afe9-ffc348455d29	02722db7-5fc5-4eb1-98f8-d313c6b5e70c
99bdb708-810d-421c-bb79-c9de6879380b	8e9588cd-8d50-4845-bec8-69bae6812f77
cc317314-1649-4340-bc6f-b9e22fd784ba	8e9588cd-8d50-4845-bec8-69bae6812f77
c8c48841-654a-4d9b-8c9b-77226963b15a	8e9588cd-8d50-4845-bec8-69bae6812f77
3c42b81c-01da-4271-9a21-ace656de4b2f	a48f279b-2cf4-4cb5-9ae1-fc69b628dcdc
2c391f3e-9d7c-43df-afe9-ffc348455d29	a48f279b-2cf4-4cb5-9ae1-fc69b628dcdc
\.


--
-- Name: categories categories_pk; Type: CONSTRAINT; Schema: public; Owner: habrpguser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- Name: products product_pk; Type: CONSTRAINT; Schema: public; Owner: habrpguser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_pk PRIMARY KEY (uuid);


--
-- Name: products_categories products_categories_pk; Type: CONSTRAINT; Schema: public; Owner: habrpguser
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pk PRIMARY KEY (category_id, product_id);


--
-- Name: products_categories products_categories_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: habrpguser
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products_categories products_categories_products_uuid_fk; Type: FK CONSTRAINT; Schema: public; Owner: habrpguser
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_products_uuid_fk FOREIGN KEY (product_id) REFERENCES public.products(uuid);


--
-- PostgreSQL database dump complete
--

