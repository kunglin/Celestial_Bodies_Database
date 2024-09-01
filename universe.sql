--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    type character varying(20),
    size integer,
    has_supermassive_black_hole boolean,
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    name character varying(255) NOT NULL,
    galaxy_types_id integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer,
    orbit_period numeric(10,2),
    distance_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    orbit_distance numeric(10,2),
    radius integer,
    mass numeric(10,2),
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    mass numeric(10,2),
    luminosity numeric(10,2),
    age numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing billions of stars.', 'Spiral', 100000, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way, on a collision course with it.', 'Spiral', 220000, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A bright galaxy with a large central bulge, resembling a sombrero.', 'Elliptical', 50000, true, 2);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A stunning spiral galaxy interacting with a smaller galaxy.', 'Barred Spiral', 60000, true, 3);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A small, spiral galaxy and part of the Local Group.', 'Spiral', 60000, false, 1);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, irregular in shape.', 'Irregular', 14000, false, 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES ('Spiral', 1, 'Features a flat, rotating disk with spiral arms.');
INSERT INTO public.galaxy_types VALUES ('Elliptical', 2, 'Shaped like an ellipse, with little to no rotation.');
INSERT INTO public.galaxy_types VALUES ('Barred Spiral', 3, 'Similar to spiral galaxies but with a central bar structure.');
INSERT INTO public.galaxy_types VALUES ('Irregular', 4, 'No distinct shape, often chaotic in appearance.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.30, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.30, 9378);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.30, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3642, 1.80, 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, 3.50, 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.20, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.70, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 15.90, 1222000);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, 4.50, 527040);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 1.40, 237948);
INSERT INTO public.moon VALUES (11, 'Titania', 7, 1578, 8.70, 436300);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 1522, 13.50, 583500);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 2706, 5.90, 354800);
INSERT INTO public.moon VALUES (14, 'Nereid', 8, 340, 360.10, 5513400);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 471, 1.40, 129800);
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 396, 0.90, 185520);
INSERT INTO public.moon VALUES (17, 'Iapetus', 6, 1469, 79.30, 3561300);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1169, 4.10, 265970);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 2.50, 190900);
INSERT INTO public.moon VALUES (20, 'Oberon1', 7, 1522, 13.50, 583500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.39, 2440, 0.06, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.72, 6052, 0.82, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.00, 6371, 1.00, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 1.52, 3390, 0.11, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 5.20, 69911, 317.80, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 9.58, 58232, 95.20, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 19.22, 25362, 14.50, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 30.05, 24622, 17.10, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 3, 'Terrestrial', 0.05, 6980, 1.17, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 3, 'Terrestrial', 1.49, 6890, 7.00, false);
INSERT INTO public.planet VALUES (11, 'Sirius b', 5, 'Terrestrial', 3.49, 1180, 1.02, false);
INSERT INTO public.planet VALUES (12, 'Vega b', 6, 'Terrestrial', 0.32, 9100, 2.90, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.00, 1.00, 4.60);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'Red Supergiant', 18.00, 120000.00, 8.00);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 'G-type', 1.10, 1.52, 5.00);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'Blue Supergiant', 21.00, 85000.00, 8.00);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 'A-type', 2.06, 25.40, 0.20);
INSERT INTO public.star VALUES (6, 'Vega', 2, 'A-type', 2.14, 40.12, 0.50);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 4, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_types_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
