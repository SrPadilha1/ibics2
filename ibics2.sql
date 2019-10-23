--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-16 12:22:57 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 49761)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 49767)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    comentario character varying NOT NULL,
    id_postagem character varying,
    id_usuario character varying,
    titulo character varying,
    data_hora timestamp with time zone
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 49773)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    conteudod character varying NOT NULL,
    id_usuario integer,
    titulo character varying,
    data_hora timestamp with time zone,
    id_postagem character varying
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 49779)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    conteudo character varying NOT NULL,
    id_postagem character varying,
    titulo character varying,
    data_hora timestamp with time zone,
    id_usuario character varying
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 49785)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuario OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 49787)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 49793)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying NOT NULL,
    nm_nome character varying,
    ds_senha character varying,
    nr_cpf numeric(11,0),
    id_usuario integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 49761)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2172 (class 0 OID 49767)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2173 (class 0 OID 49773)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2174 (class 0 OID 49779)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 9, true);


--
-- TOC entry 2176 (class 0 OID 49787)
-- Dependencies: 186
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2177 (class 0 OID 49793)
-- Dependencies: 187
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2048 (class 2606 OID 49800)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2054 (class 2606 OID 49802)
-- Name: pk_conteudo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_conteudo PRIMARY KEY (conteudo);


--
-- TOC entry 2050 (class 2606 OID 49804)
-- Name: pk_conteudoc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_conteudoc PRIMARY KEY (comentario);


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 2050
-- Name: CONSTRAINT pk_conteudoc ON comentario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_conteudoc ON comentario IS '	';


--
-- TOC entry 2052 (class 2606 OID 49806)
-- Name: pk_conteudod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_conteudod PRIMARY KEY (conteudod);


--
-- TOC entry 2056 (class 2606 OID 49808)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- TOC entry 2045 (class 1259 OID 49809)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2046 (class 1259 OID 49810)
-- Name: fki_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-16 12:22:57 BRT

--
-- PostgreSQL database dump complete
--

