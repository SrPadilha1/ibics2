--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-05 12:55:57 BRST

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
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 58226)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 58232)
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
-- TOC entry 183 (class 1259 OID 58238)
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
-- TOC entry 184 (class 1259 OID 58244)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    conteudo character varying NOT NULL,
    titulo character varying,
    data_hora timestamp with time zone,
    id_usuario integer NOT NULL,
    id_postagem integer NOT NULL
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 58286)
-- Name: sq_postagem; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_postagem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_postagem OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 58250)
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
-- TOC entry 186 (class 1259 OID 58252)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 58258)
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
-- TOC entry 2175 (class 0 OID 58226)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (cod_aval, ds_email_aval, cod_post) FROM stdin;
\.


--
-- TOC entry 2176 (class 0 OID 58232)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (comentario, id_postagem, id_usuario, titulo, data_hora) FROM stdin;
\.


--
-- TOC entry 2177 (class 0 OID 58238)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denuncia (conteudod, id_usuario, titulo, data_hora, id_postagem) FROM stdin;
dswds	\N	\N	\N	\N
\.


--
-- TOC entry 2178 (class 0 OID 58244)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (conteudo, titulo, data_hora, id_usuario, id_postagem) FROM stdin;
Vamos programar!	Linguagem Java	2019-11-05 11:56:32.907-02	500	451
\.


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 188
-- Name: sq_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_postagem', 9, true);


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 11, true);


--
-- TOC entry 2180 (class 0 OID 58252)
-- Dependencies: 186
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tema (cod_tema, cod_subtema, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2181 (class 0 OID 58258)
-- Dependencies: 187
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_email, nm_nome, ds_senha, nr_cpf, id_usuario) FROM stdin;
miguel@gmail.com	miguel 	000	0	500
malu@gmail.com	malu	123	0	550
\.


--
-- TOC entry 2050 (class 2606 OID 58265)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2052 (class 2606 OID 58269)
-- Name: pk_conteudoc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_conteudoc PRIMARY KEY (comentario);


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 2052
-- Name: CONSTRAINT pk_conteudoc ON comentario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_conteudoc ON comentario IS '	';


--
-- TOC entry 2054 (class 2606 OID 58271)
-- Name: pk_conteudod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_conteudod PRIMARY KEY (conteudod);


--
-- TOC entry 2059 (class 2606 OID 58273)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- TOC entry 2057 (class 2606 OID 58289)
-- Name: pk_id_postagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_id_postagem PRIMARY KEY (id_postagem);


--
-- TOC entry 2047 (class 1259 OID 58274)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2048 (class 1259 OID 58275)
-- Name: fki_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2055 (class 1259 OID 58281)
-- Name: fki_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario ON postagem USING btree (id_usuario);


--
-- TOC entry 2060 (class 2606 OID 58276)
-- Name: fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-05 12:55:57 BRST

--
-- PostgreSQL database dump complete
--

