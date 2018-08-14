--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dbx; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbx;


ALTER SCHEMA dbx OWNER TO postgres;

SET search_path = dbx, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pessoas; Type: TABLE; Schema: dbx; Owner: postgres
--

CREATE TABLE pessoas (
    pessoa_id integer NOT NULL,
    nome character varying(100) NOT NULL,
    telefone character varying(20),
    email character varying(255)
);


ALTER TABLE pessoas OWNER TO postgres;

--
-- Name: pessoas_id_seq; Type: SEQUENCE; Schema: dbx; Owner: postgres
--

CREATE SEQUENCE pessoas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pessoas_id_seq OWNER TO postgres;

--
-- Name: pessoas_id_seq; Type: SEQUENCE OWNED BY; Schema: dbx; Owner: postgres
--

ALTER SEQUENCE pessoas_id_seq OWNED BY pessoas.pessoa_id;


--
-- Name: pessoas pessoa_id; Type: DEFAULT; Schema: dbx; Owner: postgres
--

ALTER TABLE ONLY pessoas ALTER COLUMN pessoa_id SET DEFAULT nextval('pessoas_id_seq'::regclass);


--
-- Name: pessoas pessoas_pkey; Type: CONSTRAINT; Schema: dbx; Owner: postgres
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (pessoa_id);


--
-- PostgreSQL database dump complete
--

