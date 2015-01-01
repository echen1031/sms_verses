--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bible_verses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bible_verses (
    id integer NOT NULL,
    book character varying(255),
    book_num integer,
    chapter_num integer,
    verse_num integer,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    testament character varying(255),
    selected boolean,
    version character varying(255),
    char_count integer,
    language character varying(255) DEFAULT 'en'::character varying
);


--
-- Name: bible_verses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bible_verses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bible_verses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bible_verses_id_seq OWNED BY bible_verses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    phone character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    remind_hour integer,
    send_day_1 boolean DEFAULT false NOT NULL,
    send_day_2 boolean DEFAULT false NOT NULL,
    send_day_3 boolean DEFAULT false NOT NULL,
    send_day_4 boolean DEFAULT false NOT NULL,
    send_day_5 boolean DEFAULT false NOT NULL,
    send_day_6 boolean DEFAULT false NOT NULL,
    send_day_7 boolean DEFAULT false NOT NULL,
    phone_carrier character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phone character varying(255),
    time_zone character varying(255),
    latitude double precision,
    longitude double precision
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bible_verses ALTER COLUMN id SET DEFAULT nextval('bible_verses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: bible_verses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bible_verses
    ADD CONSTRAINT bible_verses_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20131126173351');

INSERT INTO schema_migrations (version) VALUES ('20131126173639');

INSERT INTO schema_migrations (version) VALUES ('20131126174758');

INSERT INTO schema_migrations (version) VALUES ('20131126175446');

INSERT INTO schema_migrations (version) VALUES ('20131127060120');

INSERT INTO schema_migrations (version) VALUES ('20131128185316');

INSERT INTO schema_migrations (version) VALUES ('20131129205012');

INSERT INTO schema_migrations (version) VALUES ('20131129213412');

INSERT INTO schema_migrations (version) VALUES ('20131129224714');

INSERT INTO schema_migrations (version) VALUES ('20131201233509');

INSERT INTO schema_migrations (version) VALUES ('20131201234951');

INSERT INTO schema_migrations (version) VALUES ('20131202012136');

INSERT INTO schema_migrations (version) VALUES ('20131209050450');

INSERT INTO schema_migrations (version) VALUES ('20131211054206');

INSERT INTO schema_migrations (version) VALUES ('20131211054558');

INSERT INTO schema_migrations (version) VALUES ('20131211073622');

INSERT INTO schema_migrations (version) VALUES ('20131212035331');

INSERT INTO schema_migrations (version) VALUES ('20131213064903');

INSERT INTO schema_migrations (version) VALUES ('20131213091645');

INSERT INTO schema_migrations (version) VALUES ('20131213100524');

INSERT INTO schema_migrations (version) VALUES ('20131215224359');

INSERT INTO schema_migrations (version) VALUES ('20131221201252');

INSERT INTO schema_migrations (version) VALUES ('20131221203840');

INSERT INTO schema_migrations (version) VALUES ('20140222203048');