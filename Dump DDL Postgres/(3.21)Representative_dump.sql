--
-- PostgreSQL database dump
--

\restrict RFoefqYwE9vtKmRuOwpGPmFbx5FPOVW7iZI68fFS1TWZOOEjoFQdl7cj5L6gEza

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
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    bill_id integer NOT NULL,
    bill_name character varying(200),
    date_of_vote date,
    passed_or_failed character varying(5),
    CONSTRAINT bill_passed_or_failed_check CHECK (((passed_or_failed)::text = ANY ((ARRAY['No'::character varying, 'Yes'::character varying])::text[])))
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- Name: bill_sponsor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_sponsor (
    congress_person_cperson_id integer NOT NULL,
    bill_bill_id integer NOT NULL
);


ALTER TABLE public.bill_sponsor OWNER TO postgres;

--
-- Name: congress_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.congress_person (
    cperson_id integer NOT NULL,
    name character varying(100),
    district integer,
    start_date date,
    party character varying(20),
    state_state_name character varying(50) NOT NULL,
    CONSTRAINT congress_person_party_check CHECK (((party)::text = ANY ((ARRAY['Democrat'::character varying, 'Independent'::character varying, 'Other'::character varying, 'Republican'::character varying])::text[])))
);


ALTER TABLE public.congress_person OWNER TO postgres;

--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    state_name character varying(50) NOT NULL,
    region character varying(20),
    CONSTRAINT state_region_check CHECK (((region)::text = ANY ((ARRAY['Midwest'::character varying, 'Northeast'::character varying, 'SouthEast'::character varying, 'SouthWest'::character varying])::text[])))
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: vote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vote (
    vote character varying(10),
    congress_person_cperson_id integer NOT NULL,
    bill_bill_id integer NOT NULL,
    CONSTRAINT vote_vote_check CHECK (((vote)::text = ANY ((ARRAY['Absent'::character varying, 'Abstain'::character varying, 'No'::character varying, 'Yes'::character varying])::text[])))
);


ALTER TABLE public.vote OWNER TO postgres;

--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (bill_id, bill_name, date_of_vote, passed_or_failed) FROM stdin;
\.


--
-- Data for Name: bill_sponsor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_sponsor (congress_person_cperson_id, bill_bill_id) FROM stdin;
\.


--
-- Data for Name: congress_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.congress_person (cperson_id, name, district, start_date, party, state_state_name) FROM stdin;
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state (state_name, region) FROM stdin;
\.


--
-- Data for Name: vote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vote (vote, congress_person_cperson_id, bill_bill_id) FROM stdin;
\.


--
-- Name: bill bill_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pk PRIMARY KEY (bill_id);


--
-- Name: bill_sponsor bill_sponsor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_sponsor
    ADD CONSTRAINT bill_sponsor_pk PRIMARY KEY (congress_person_cperson_id, bill_bill_id);


--
-- Name: congress_person congress_person_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.congress_person
    ADD CONSTRAINT congress_person_pk PRIMARY KEY (cperson_id);


--
-- Name: state state_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pk PRIMARY KEY (state_name);


--
-- Name: vote vote_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vote
    ADD CONSTRAINT vote_pk PRIMARY KEY (congress_person_cperson_id, bill_bill_id);


--
-- Name: bill_sponsor bill_sponsor_bill_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_sponsor
    ADD CONSTRAINT bill_sponsor_bill_fk FOREIGN KEY (bill_bill_id) REFERENCES public.bill(bill_id);


--
-- Name: bill_sponsor bill_sponsor_congress_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_sponsor
    ADD CONSTRAINT bill_sponsor_congress_person_fk FOREIGN KEY (congress_person_cperson_id) REFERENCES public.congress_person(cperson_id);


--
-- Name: congress_person congress_person_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.congress_person
    ADD CONSTRAINT congress_person_state_fk FOREIGN KEY (state_state_name) REFERENCES public.state(state_name);


--
-- Name: vote vote_bill_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vote
    ADD CONSTRAINT vote_bill_fk FOREIGN KEY (bill_bill_id) REFERENCES public.bill(bill_id);


--
-- Name: vote vote_congress_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vote
    ADD CONSTRAINT vote_congress_person_fk FOREIGN KEY (congress_person_cperson_id) REFERENCES public.congress_person(cperson_id);


--
-- PostgreSQL database dump complete
--

\unrestrict RFoefqYwE9vtKmRuOwpGPmFbx5FPOVW7iZI68fFS1TWZOOEjoFQdl7cj5L6gEza

