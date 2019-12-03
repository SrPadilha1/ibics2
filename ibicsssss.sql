--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-12-03 15:47:04 BRST

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
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 92344)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    postagem integer,
    usuario integer,
    id integer NOT NULL
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 92251)
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
-- TOC entry 182 (class 1259 OID 92257)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    usuario integer,
    data_hora timestamp with time zone,
    descricao character varying,
    id integer NOT NULL,
    postagem integer
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 92263)
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
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 183
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE denuncia_id_postagem_seq OWNED BY denuncia.id;


--
-- TOC entry 184 (class 1259 OID 92265)
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
-- TOC entry 185 (class 1259 OID 92271)
-- Name: sq_avaliacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_avaliacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_avaliacao OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 92273)
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
-- TOC entry 187 (class 1259 OID 92275)
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
-- TOC entry 188 (class 1259 OID 92277)
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
-- TOC entry 189 (class 1259 OID 92279)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 92285)
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
-- TOC entry 2052 (class 2604 OID 92291)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia ALTER COLUMN id SET DEFAULT nextval('denuncia_id_postagem_seq'::regclass);


--
-- TOC entry 2201 (class 0 OID 92344)
-- Dependencies: 191
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (postagem, usuario, id) FROM stdin;
750	12	400
750	12	401
\.


--
-- TOC entry 2191 (class 0 OID 92251)
-- Dependencies: 181
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (comentario, titulo, data_hora, id_postagem, id_comentario, id_usuario) FROM stdin;
\.


--
-- TOC entry 2192 (class 0 OID 92257)
-- Dependencies: 182
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denuncia (usuario, data_hora, descricao, id, postagem) FROM stdin;
\.


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 183
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('denuncia_id_postagem_seq', 1, true);


--
-- TOC entry 2194 (class 0 OID 92265)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (conteudo, titulo, data_hora, id_usuario, id_postagem, foto, extensao) FROM stdin;
laksdfl	titulo	2019-12-03 15:40:13.894-02	12	750	\\x	application/octet-stream
\.


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_avaliacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_avaliacao', 8, true);


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_comentario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_comentario', 1, true);


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_postagem', 15, true);


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 188
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 14, true);


--
-- TOC entry 2199 (class 0 OID 92279)
-- Dependencies: 189
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tema (cod_tema, cod_subtema, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2200 (class 0 OID 92285)
-- Dependencies: 190
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_email, nm_nome, ds_senha, nr_cpf, id_usuario, admin) FROM stdin;
maria@gmail.com	maria	000	11111111111	12	t
\.


--
-- TOC entry 2065 (class 2606 OID 92293)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- TOC entry 2069 (class 2606 OID 92348)
-- Name: pk_id_avaliacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_id_avaliacao PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 92297)
-- Name: pk_id_comentario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_id_comentario PRIMARY KEY (id_comentario);


--
-- TOC entry 2060 (class 2606 OID 92299)
-- Name: pk_id_denuncia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_id_denuncia PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 92301)
-- Name: pk_id_postagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_id_postagem PRIMARY KEY (id_postagem);


--
-- TOC entry 2053 (class 1259 OID 92304)
-- Name: fki_id_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_postagem ON comentario USING btree (id_postagem);


--
-- TOC entry 2061 (class 1259 OID 92305)
-- Name: fki_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario ON postagem USING btree (id_usuario);


--
-- TOC entry 2054 (class 1259 OID 92306)
-- Name: fki_id_usuario_comentario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario_comentario ON comentario USING btree (id_usuario);


--
-- TOC entry 2057 (class 1259 OID 92307)
-- Name: fki_pk_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_usuario ON denuncia USING btree (usuario);


--
-- TOC entry 2058 (class 1259 OID 92308)
-- Name: fki_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_postagem ON denuncia USING btree (postagem);


--
-- TOC entry 2066 (class 1259 OID 92359)
-- Name: fki_postagem_avaliacao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_postagem_avaliacao ON avaliacao USING btree (postagem);


--
-- TOC entry 2067 (class 1259 OID 92365)
-- Name: fki_usuario_avaliacao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario_avaliacao ON avaliacao USING btree (usuario);


--
-- TOC entry 2070 (class 2606 OID 92319)
-- Name: fk_id_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_postagem FOREIGN KEY (id_postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2074 (class 2606 OID 92324)
-- Name: fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2071 (class 2606 OID 92329)
-- Name: fk_id_usuario_comentario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_usuario_comentario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2072 (class 2606 OID 92334)
-- Name: fk_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT fk_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2075 (class 2606 OID 92354)
-- Name: fk_postagem_avaliacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT fk_postagem_avaliacao FOREIGN KEY (postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2076 (class 2606 OID 92360)
-- Name: fk_usuario_avaliacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT fk_usuario_avaliacao FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2073 (class 2606 OID 92339)
-- Name: pk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-12-03 15:47:05 BRST

--
-- PostgreSQL database dump complete
--

