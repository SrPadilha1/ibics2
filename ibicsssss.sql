--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-25 16:12:09 BRST

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
-- TOC entry 181 (class 1259 OID 58538)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 58544)
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
-- TOC entry 183 (class 1259 OID 58550)
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
-- TOC entry 184 (class 1259 OID 58556)
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
-- Dependencies: 184
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE denuncia_id_postagem_seq OWNED BY denuncia.id;


--
-- TOC entry 185 (class 1259 OID 58558)
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
-- TOC entry 186 (class 1259 OID 58564)
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
-- TOC entry 187 (class 1259 OID 58566)
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
-- TOC entry 188 (class 1259 OID 58568)
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
-- TOC entry 189 (class 1259 OID 58570)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 58576)
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
-- TOC entry 2051 (class 2604 OID 58582)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia ALTER COLUMN id SET DEFAULT nextval('denuncia_id_postagem_seq'::regclass);


--
-- TOC entry 2188 (class 0 OID 58538)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (cod_aval, ds_email_aval, cod_post) FROM stdin;
\.


--
-- TOC entry 2189 (class 0 OID 58544)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (comentario, titulo, data_hora, id_postagem, id_comentario, id_usuario) FROM stdin;
