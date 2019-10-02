--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-02 17:32:19 BRT

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
-- TOC entry 181 (class 1259 OID 49593)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 49599)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    comentario character varying NOT NULL
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 49605)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    conteudod character varying NOT NULL
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 49674)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    conteudo character varying NOT NULL
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 49686)
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
-- TOC entry 184 (class 1259 OID 49617)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 49623)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying NOT NULL,
    nm_nome character varying,
    ds_senha character varying,
    nr_cpf numeric(11,0),
    id integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 49593)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (cod_aval, ds_email_aval, cod_post) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 49599)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (comentario) FROM stdin;
Muito bom esse livro
Dom Casmurro melhor livro
\.


--
-- TOC entry 2173 (class 0 OID 49605)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denuncia (conteudod) FROM stdin;
site feio
NÃ£o tem conteudo
\.


--
-- TOC entry 2176 (class 0 OID 49674)
-- Dependencies: 186
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (conteudo) FROM stdin;
Leia um livro: Dom Casmurro, de Machado de Assis Considerada a obra-prima de Machado de Assis, o escritor brasileiro mais respeitado da literatura mundial, este livro narra a vida de Bento Escobar e ate hoje e motivo para uma das perguntas mais polemicas da literatura brasileiro: tera Capitu traido Bentinho?
\.


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 9, true);


--
-- TOC entry 2174 (class 0 OID 49617)
-- Dependencies: 184
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tema (cod_tema, cod_subtema, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 49623)
-- Dependencies: 185
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_email, nm_nome, ds_senha, nr_cpf, id) FROM stdin;
malu@gmail.com	malu	123	12111111111	250
miguel@gmail.com	miguel 	123	11111111111	350
aaa@gmail.com	adsd	123	12345678999	351
ibe@gmail.com	igor eduardo	123	11111111111	400
igor@gmail.com	igor	123	11111111111	450
\.


--
-- TOC entry 2048 (class 2606 OID 49632)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2056 (class 2606 OID 49681)
-- Name: pk_conteudo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_conteudo PRIMARY KEY (conteudo);


--
-- TOC entry 2050 (class 2606 OID 49683)
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
-- TOC entry 2052 (class 2606 OID 49689)
-- Name: pk_conteudod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_conteudod PRIMARY KEY (conteudod);


--
-- TOC entry 2054 (class 2606 OID 49685)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2045 (class 1259 OID 49640)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2046 (class 1259 OID 49643)
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


-- Completed on 2019-10-02 17:32:20 BRT

--
-- PostgreSQL database dump complete
--

