--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE guesses;
--
-- Name: guesses; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guesses WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guesses OWNER TO freecodecamp;

\connect guesses

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
-- Name: score; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.score (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.score OWNER TO freecodecamp;

--
-- Name: score_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.score_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_user_id_seq OWNER TO freecodecamp;

--
-- Name: score_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.score_user_id_seq OWNED BY public.score.user_id;


--
-- Name: score user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score ALTER COLUMN user_id SET DEFAULT nextval('public.score_user_id_seq'::regclass);


--
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.score VALUES (68, 'user_1692096813088', 2, 208);
INSERT INTO public.score VALUES (67, 'user_1692096813089', 5, 125);
INSERT INTO public.score VALUES (70, 'user_1692096854240', 2, 50);
INSERT INTO public.score VALUES (69, 'user_1692096854241', 5, 376);
INSERT INTO public.score VALUES (58, 'user_1692096747105', 2, 563);
INSERT INTO public.score VALUES (57, 'user_1692096747106', 5, 357);
INSERT INTO public.score VALUES (60, 'user_1692096756144', 2, 274);
INSERT INTO public.score VALUES (59, 'user_1692096756145', 5, 225);
INSERT INTO public.score VALUES (62, 'user_1692096764938', 2, 797);
INSERT INTO public.score VALUES (61, 'user_1692096764939', 5, 434);
INSERT INTO public.score VALUES (64, 'user_1692096797743', 2, 519);
INSERT INTO public.score VALUES (63, 'user_1692096797744', 5, 222);
INSERT INTO public.score VALUES (66, 'user_1692096803090', 2, 257);
INSERT INTO public.score VALUES (65, 'user_1692096803091', 5, 161);


--
-- Name: score_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.score_user_id_seq', 70, true);


--
-- Name: score score_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

