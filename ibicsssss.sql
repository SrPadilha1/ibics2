--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-18 18:55:18 BRST

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
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 51239)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 51245)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    comentario character varying NOT NULL,
    titulo character varying,
    data_hora timestamp with time zone,
    id_postagem integer,
    id_comentario integer NOT NULL,
    id_usuario integer
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 51251)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    usuario integer,
    titulo character varying,
    data_hora timestamp with time zone,
    conteudod character varying,
    id_denuncia integer NOT NULL,
    postagem integer
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 51312)
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE denuncia_id_postagem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE denuncia_id_postagem_seq OWNER TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 190
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE denuncia_id_postagem_seq OWNED BY denuncia.id_denuncia;


--
-- TOC entry 184 (class 1259 OID 51257)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    conteudo character varying NOT NULL,
    titulo character varying,
    data_hora timestamp with time zone,
    id_usuario integer NOT NULL,
    id_postagem integer NOT NULL,
    foto bytea,
    extensao character varying
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 51263)
-- Name: sq_comentario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_comentario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_comentario OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 51265)
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
-- TOC entry 187 (class 1259 OID 51267)
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
-- TOC entry 188 (class 1259 OID 51269)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 51275)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying NOT NULL,
    nm_nome character varying,
    ds_senha character varying,
    nr_cpf numeric(11,0),
    id_usuario numeric NOT NULL,
    admin boolean
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2051 (class 2604 OID 51314)
-- Name: id_denuncia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncia_id_postagem_seq'::regclass);


--
-- TOC entry 2188 (class 0 OID 51239)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2189 (class 0 OID 51245)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2190 (class 0 OID 51251)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--





--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 190
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('denuncia_id_postagem_seq', 1, true);


--
-- TOC entry 2191 (class 0 OID 51257)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_comentario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_comentario', 1, false);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_postagem', 11, true);


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 14, true);


--
-- TOC entry 2195 (class 0 OID 51269)
-- Dependencies: 188
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2196 (class 0 OID 51275)
-- Dependencies: 189
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2055 (class 2606 OID 51282)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2068 (class 2606 OID 51286)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- TOC entry 2059 (class 2606 OID 51288)
-- Name: pk_id_comentario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_id_comentario PRIMARY KEY (id_comentario);


--
-- TOC entry 2063 (class 2606 OID 51322)
-- Name: pk_id_denuncia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_id_denuncia PRIMARY KEY (id_denuncia);


--
-- TOC entry 2066 (class 2606 OID 51290)
-- Name: pk_id_postagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_id_postagem PRIMARY KEY (id_postagem);


--
-- TOC entry 2052 (class 1259 OID 51291)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2053 (class 1259 OID 51292)
-- Name: fki_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2056 (class 1259 OID 51293)
-- Name: fki_id_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_postagem ON comentario USING btree (id_postagem);


--
-- TOC entry 2064 (class 1259 OID 51294)
-- Name: fki_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario ON postagem USING btree (id_usuario);


--
-- TOC entry 2057 (class 1259 OID 51295)
-- Name: fki_id_usuario_comentario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario_comentario ON comentario USING btree (id_usuario);


--
-- TOC entry 2060 (class 1259 OID 51334)
-- Name: fki_pk_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_usuario ON denuncia USING btree (usuario);


--
-- TOC entry 2061 (class 1259 OID 51328)
-- Name: fki_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_postagem ON denuncia USING btree (postagem);


--
-- TOC entry 2069 (class 2606 OID 51296)
-- Name: fk_id_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_postagem FOREIGN KEY (id_postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2073 (class 2606 OID 51301)
-- Name: fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2070 (class 2606 OID 51306)
-- Name: fk_id_usuario_comentario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_usuario_comentario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2071 (class 2606 OID 51323)
-- Name: fk_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT fk_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2072 (class 2606 OID 51329)
-- Name: pk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-18 18:55:18 BRST

--
-- PostgreSQL database dump complete
--

