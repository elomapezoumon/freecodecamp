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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(50) NOT NULL,
    area numeric(4,1),
    population integer,
    countries integer
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    code character varying(10),
    shape character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    habitable boolean,
    planet_id integer NOT NULL,
    description text,
    code character varying(10)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    weight numeric(4,1),
    population integer,
    habitable boolean,
    star_id integer NOT NULL,
    description text,
    code character varying(10)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    weight integer,
    galaxy_id integer NOT NULL,
    description text,
    code character varying(10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 'Afrique', 550.0, 1000000, 56);
INSERT INTO public.continent VALUES (2, 'Afrique2', 550.0, 1000000, 56);
INSERT INTO public.continent VALUES (3, 'Afrique3', 550.0, 1000000, 56);
INSERT INTO public.continent VALUES (4, 'Afrique4', 550.0, 1000000, 56);
INSERT INTO public.continent VALUES (5, 'Afrique5', 550.0, 1000000, 56);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Tucana III', 'unknow', 'C2', 'unknow');
INSERT INTO public.galaxy VALUES (1, 'Draco II', 'unknow', 'C1', 'unknow');
INSERT INTO public.galaxy VALUES (4, 'Voie Lactée', 'unknow', 'C3', 'unknow');
INSERT INTO public.galaxy VALUES (5, 'Tucana1', 'tucana1', 'T1', 'unknow');
INSERT INTO public.galaxy VALUES (6, 'Tucana2', 'tucana2', 'T2', 'unknow');
INSERT INTO public.galaxy VALUES (7, 'Tucana3', 'tucana3', 'T3', 'unknow');
INSERT INTO public.galaxy VALUES (8, 'Tucana4', 'tucana4', 'T4', 'unknow');
INSERT INTO public.galaxy VALUES (9, 'Tucana5', 'tucana5', 'T5', 'unknow');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Sun', false, 1, '', 'SUN');
INSERT INTO public.moon VALUES (2, 'Sun2', false, 1, '', 'SUN2');
INSERT INTO public.moon VALUES (3, 'Sun3', false, 1, '', 'SUN3');
INSERT INTO public.moon VALUES (4, 'Sun4', false, 1, '', 'SUN4');
INSERT INTO public.moon VALUES (5, 'Sun5', false, 1, '', 'SUN5');
INSERT INTO public.moon VALUES (6, 'Sun6', false, 1, '', 'SUN6');
INSERT INTO public.moon VALUES (7, 'Sun7', false, 1, '', 'SUN7');
INSERT INTO public.moon VALUES (8, 'Sun8', false, 1, '', 'SUN8');
INSERT INTO public.moon VALUES (9, 'Sun9', false, 1, '', 'SUN9');
INSERT INTO public.moon VALUES (10, 'Sun10', false, 1, '', 'SUN10');
INSERT INTO public.moon VALUES (11, 'Sun11', false, 1, '', 'SUN11');
INSERT INTO public.moon VALUES (12, 'Sun12', false, 1, '', 'SUN12');
INSERT INTO public.moon VALUES (13, 'Sun13', false, 1, '', 'SUN13');
INSERT INTO public.moon VALUES (14, 'Sun14', false, 1, '', 'SUN14');
INSERT INTO public.moon VALUES (15, 'Sun15', false, 1, '', 'SUN15');
INSERT INTO public.moon VALUES (16, 'Sun16', false, 1, '', 'SUN16');
INSERT INTO public.moon VALUES (17, 'Sun17', false, 1, '', 'SUN17');
INSERT INTO public.moon VALUES (18, 'Sun18', false, 1, '', 'SUN18');
INSERT INTO public.moon VALUES (19, 'Sun19', false, 1, '', 'SUN19');
INSERT INTO public.moon VALUES (20, 'Sun20', false, 1, '', 'SUN20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terre', 100.0, 70000000, true, 1, '', 'TERRA');
INSERT INTO public.planet VALUES (2, 'Saturne', 100.0, 70000000, false, 1, '', 'SATUR');
INSERT INTO public.planet VALUES (3, 'Jupiter', 100.0, 70000000, false, 1, '', 'JUPIT');
INSERT INTO public.planet VALUES (4, 'Mercure', 100.0, 70000000, false, 1, '', 'MERCUR');
INSERT INTO public.planet VALUES (5, 'Venus', 100.0, 70000000, false, 1, '', 'VENUS');
INSERT INTO public.planet VALUES (6, 'Venus1', 100.0, 70000000, false, 1, '', 'VENUS1');
INSERT INTO public.planet VALUES (7, 'Venus2', 100.0, 70000000, false, 1, '', 'VENUS2');
INSERT INTO public.planet VALUES (8, 'Venus3', 100.0, 70000000, false, 1, '', 'VENUS3');
INSERT INTO public.planet VALUES (9, 'Venus4', 100.0, 70000000, false, 1, '', 'VENUS4');
INSERT INTO public.planet VALUES (10, 'Venus5', 100.0, 70000000, false, 1, '', 'VENUS5');
INSERT INTO public.planet VALUES (11, 'Venus6', 100.0, 70000000, false, 1, '', 'VENUS6');
INSERT INTO public.planet VALUES (12, 'Venus7', 100.0, 70000000, false, 1, '', 'VENUS7');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 100000000, 4, 'unknow', 'C1');
INSERT INTO public.star VALUES (2, 'Sun2', 1000000, 4, 'unkonw', 'C2');
INSERT INTO public.star VALUES (3, 'Sun3', 1000000, 4, 'unkonw', 'C3');
INSERT INTO public.star VALUES (4, 'Sun3', 100040, 4, 'unkonw', 'C4');
INSERT INTO public.star VALUES (5, 'Sun5', 100040, 4, 'unkonw', 'C5');
INSERT INTO public.star VALUES (6, 'Sun6', 100040, 4, 'unkonw', 'C6');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_code_key UNIQUE (code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_code_key UNIQUE (code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_code_key UNIQUE (code);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_code_key UNIQUE (code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

