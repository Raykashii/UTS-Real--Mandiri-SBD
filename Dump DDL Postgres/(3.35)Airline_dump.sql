--
-- PostgreSQL database dump
--

\restrict iZd0Mn7ERFZEMFxkO20oAGSdlqsI32kvXLxIdn9tYnmqT5rueeir4XhHx0Vrbjp

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: airplane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airplane (
    airplane_id integer NOT NULL,
    total_no_of_seats integer NOT NULL,
    type_name character varying(30),
    type_name_1 character varying(30) NOT NULL
);


ALTER TABLE public.airplane OWNER TO postgres;

--
-- Name: airplane_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airplane_type (
    type_name character varying(30) NOT NULL,
    max_seats integer NOT NULL,
    company character varying(50)
);


ALTER TABLE public.airplane_type OWNER TO postgres;

--
-- Name: airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airport (
    airport_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL
);


ALTER TABLE public.airport OWNER TO postgres;

--
-- Name: can_land; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.can_land (
    airport_code character varying(10) NOT NULL,
    type_name character varying(30) NOT NULL
);


ALTER TABLE public.can_land OWNER TO postgres;

--
-- Name: fare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fare (
    fare_code character varying(10) NOT NULL,
    amount numeric(8,2),
    restrictions character varying(200),
    flight_number character varying(10) NOT NULL
);


ALTER TABLE public.fare OWNER TO postgres;

--
-- Name: flight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight (
    flight_number character varying(10) NOT NULL,
    airline character varying(50) NOT NULL,
    weekdays character varying(50) NOT NULL
);


ALTER TABLE public.flight OWNER TO postgres;

--
-- Name: flight_leg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight_leg (
    leg_no integer NOT NULL,
    scheduled_dep_time date,
    scheduled_arr_time date,
    flight_number character varying(10) NOT NULL,
    arr_airport_code character varying(10) NOT NULL,
    dep_airport_code character varying(10) NOT NULL
);


ALTER TABLE public.flight_leg OWNER TO postgres;

--
-- Name: leg_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leg_instance (
    leg_date date NOT NULL,
    no_of_avail_seats integer,
    dep_time date,
    dep_time_1 date,
    arr_time date,
    leg_no integer NOT NULL,
    flight_number character varying(10) NOT NULL,
    airplane_id integer NOT NULL,
    arr_airport_code character varying(10) NOT NULL,
    dep_airport_code character varying(10) NOT NULL
);


ALTER TABLE public.leg_instance OWNER TO postgres;

--
-- Name: seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seat (
    seat_no character varying(5) NOT NULL,
    customer_name character varying(100),
    cphone character varying(20),
    leg_date date NOT NULL,
    leg_no integer NOT NULL,
    flight_number character varying(10) NOT NULL
);


ALTER TABLE public.seat OWNER TO postgres;

--
-- Data for Name: airplane; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airplane (airplane_id, total_no_of_seats, type_name, type_name_1) FROM stdin;
\.


--
-- Data for Name: airplane_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airplane_type (type_name, max_seats, company) FROM stdin;
\.


--
-- Data for Name: airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airport (airport_code, name, city, state) FROM stdin;
\.


--
-- Data for Name: can_land; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.can_land (airport_code, type_name) FROM stdin;
\.


--
-- Data for Name: fare; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fare (fare_code, amount, restrictions, flight_number) FROM stdin;
\.


--
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight (flight_number, airline, weekdays) FROM stdin;
\.


--
-- Data for Name: flight_leg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_leg (leg_no, scheduled_dep_time, scheduled_arr_time, flight_number, arr_airport_code, dep_airport_code) FROM stdin;
\.


--
-- Data for Name: leg_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leg_instance (leg_date, no_of_avail_seats, dep_time, dep_time_1, arr_time, leg_no, flight_number, airplane_id, arr_airport_code, dep_airport_code) FROM stdin;
\.


--
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seat (seat_no, customer_name, cphone, leg_date, leg_no, flight_number) FROM stdin;
\.


--
-- Name: airplane airplane_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airplane
    ADD CONSTRAINT airplane_pk PRIMARY KEY (airplane_id);


--
-- Name: airplane_type airplane_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airplane_type
    ADD CONSTRAINT airplane_type_pk PRIMARY KEY (type_name);


--
-- Name: airport airport_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_pk PRIMARY KEY (airport_code);


--
-- Name: can_land can_land_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.can_land
    ADD CONSTRAINT can_land_pk PRIMARY KEY (airport_code, type_name);


--
-- Name: fare fare_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fare
    ADD CONSTRAINT fare_pk PRIMARY KEY (fare_code, flight_number);


--
-- Name: flight_leg flight_leg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_leg
    ADD CONSTRAINT flight_leg_pk PRIMARY KEY (leg_no, flight_number);


--
-- Name: flight flight_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_pk PRIMARY KEY (flight_number);


--
-- Name: leg_instance leg_instance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leg_instance
    ADD CONSTRAINT leg_instance_pk PRIMARY KEY (leg_date, leg_no, flight_number);


--
-- Name: seat seat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pk PRIMARY KEY (seat_no, leg_date, leg_no, flight_number);


--
-- Name: airplane airplane_airplane_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airplane
    ADD CONSTRAINT airplane_airplane_type_fk FOREIGN KEY (type_name_1) REFERENCES public.airplane_type(type_name);


--
-- Name: can_land can_land_airplane_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.can_land
    ADD CONSTRAINT can_land_airplane_type_fk FOREIGN KEY (type_name) REFERENCES public.airplane_type(type_name);


--
-- Name: can_land can_land_airport_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.can_land
    ADD CONSTRAINT can_land_airport_fk FOREIGN KEY (airport_code) REFERENCES public.airport(airport_code);


--
-- Name: fare fare_flight_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fare
    ADD CONSTRAINT fare_flight_fk FOREIGN KEY (flight_number) REFERENCES public.flight(flight_number);


--
-- Name: flight_leg flight_leg_airport_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_leg
    ADD CONSTRAINT flight_leg_airport_fk FOREIGN KEY (dep_airport_code) REFERENCES public.airport(airport_code);


--
-- Name: flight_leg flight_leg_airport_fkv2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_leg
    ADD CONSTRAINT flight_leg_airport_fkv2 FOREIGN KEY (arr_airport_code) REFERENCES public.airport(airport_code);


--
-- Name: flight_leg flight_leg_flight_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_leg
    ADD CONSTRAINT flight_leg_flight_fk FOREIGN KEY (flight_number) REFERENCES public.flight(flight_number);


--
-- Name: leg_instance leg_instance_airplane_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leg_instance
    ADD CONSTRAINT leg_instance_airplane_fk FOREIGN KEY (airplane_id) REFERENCES public.airplane(airplane_id);


--
-- Name: leg_instance leg_instance_airport_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leg_instance
    ADD CONSTRAINT leg_instance_airport_fk FOREIGN KEY (dep_airport_code) REFERENCES public.airport(airport_code);


--
-- Name: leg_instance leg_instance_airport_fkv2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leg_instance
    ADD CONSTRAINT leg_instance_airport_fkv2 FOREIGN KEY (arr_airport_code) REFERENCES public.airport(airport_code);


--
-- Name: leg_instance leg_instance_flight_leg_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leg_instance
    ADD CONSTRAINT leg_instance_flight_leg_fk FOREIGN KEY (leg_no, flight_number) REFERENCES public.flight_leg(leg_no, flight_number);


--
-- Name: seat seat_leg_instance_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_leg_instance_fk FOREIGN KEY (leg_date, leg_no, flight_number) REFERENCES public.leg_instance(leg_date, leg_no, flight_number);


--
-- PostgreSQL database dump complete
--

\unrestrict iZd0Mn7ERFZEMFxkO20oAGSdlqsI32kvXLxIdn9tYnmqT5rueeir4XhHx0Vrbjp

