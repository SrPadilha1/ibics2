--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-09-16 17:42:02 BRT

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
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 25442)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25448)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    cod_coment character varying NOT NULL,
    ds_email_autor character varying,
    cd_post character varying,
    dt_data_hora timestamp with time zone,
    cd_conteudo character varying
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 25454)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    cod_denuncia character varying NOT NULL,
    ds_email_autor character varying,
    cd_post character varying,
    dt_data_hora timestamp with time zone,
    cod_tipo character varying,
    nm_descricao character varying
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25460)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    cd_post character varying NOT NULL,
    ds_email_autor character varying,
    dt_data_hora timestamp with time zone,
    nm_titulo character varying,
    cd_conteudo character varying,
    cd_recomendado character varying,
    cd_bloqueada integer
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25466)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25472)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying NOT NULL,
    nm_nome character varying,
    ds_senha character varying,
    nr_cpf numeric(11,0),
    cd_adm integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 25442)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (cod_aval, ds_email_aval, cod_post) FROM stdin;
\.


--
-- TOC entry 2179 (class 0 OID 25448)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (cod_coment, ds_email_autor, cd_post, dt_data_hora, cd_conteudo) FROM stdin;
\.


--
-- TOC entry 2180 (class 0 OID 25454)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denuncia (cod_denuncia, ds_email_autor, cd_post, dt_data_hora, cod_tipo, nm_descricao) FROM stdin;
\.


--
-- TOC entry 2181 (class 0 OID 25460)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (cd_post, ds_email_autor, dt_data_hora, nm_titulo, cd_conteudo, cd_recomendado, cd_bloqueada) FROM stdin;
\.


--
-- TOC entry 2182 (class 0 OID 25466)
-- Dependencies: 185
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tema (cod_tema, cod_subtema, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2183 (class 0 OID 25472)
-- Dependencies: 186
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_email, nm_nome, ds_senha, nr_cpf, cd_adm) FROM stdin;
zxcz	sdfx	cczcz	\N	\N
\.


--
-- TOC entry 2055 (class 2606 OID 25479)
-- Name: pk_cd_post; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_cd_post PRIMARY KEY (cd_post);


--
-- TOC entry 2046 (class 2606 OID 25481)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2053 (class 2606 OID 25483)
-- Name: pk_cod_denuncia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_cod_denuncia PRIMARY KEY (cod_denuncia);


--
-- TOC entry 2049 (class 2606 OID 25485)
-- Name: pk_coment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_coment PRIMARY KEY (cod_coment);


--
-- TOC entry 2057 (class 2606 OID 25487)
-- Name: pk_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_email PRIMARY KEY (ds_email);


--
-- TOC entry 2050 (class 1259 OID 25488)
-- Name: fk_cd_post; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_cd_post ON denuncia USING btree (cd_post);


--
-- TOC entry 2043 (class 1259 OID 25489)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2047 (class 1259 OID 25490)
-- Name: fki_cd_post; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cd_post ON comentario USING btree (cd_post);


--
-- TOC entry 2051 (class 1259 OID 25491)
-- Name: fki_email_autor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_autor ON denuncia USING btree (ds_email_autor);


--
-- TOC entry 2044 (class 1259 OID 25492)
-- Name: fki_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2059 (class 2606 OID 25493)
-- Name: fk_cd_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_cd_post FOREIGN KEY (cd_post) REFERENCES postagem(cd_post);


--
-- TOC entry 2061 (class 2606 OID 25498)
-- Name: fk_cd_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT fk_cd_post FOREIGN KEY (cd_post) REFERENCES postagem(cd_post);


--
-- TOC entry 2060 (class 2606 OID 25503)
-- Name: fk_email_autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_email_autor FOREIGN KEY (ds_email_autor) REFERENCES usuario(ds_email);


--
-- TOC entry 2063 (class 2606 OID 25508)
-- Name: fk_email_autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_email_autor FOREIGN KEY (ds_email_autor) REFERENCES usuario(ds_email);


--
-- TOC entry 2062 (class 2606 OID 25513)
-- Name: fk_email_autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT fk_email_autor FOREIGN KEY (ds_email_autor) REFERENCES usuario(ds_email);


--
-- TOC entry 2058 (class 2606 OID 25518)
-- Name: fk_email_aval; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT fk_email_aval FOREIGN KEY (ds_email_aval) REFERENCES postagem(cd_post);


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-09-16 17:42:03 BRT

--
-- PostgreSQL database dump complete
--

