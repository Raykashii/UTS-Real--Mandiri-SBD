--
-- PostgreSQL database dump
--

\restrict wbGtLZxW3AVSzT8XCYiMdTuxpTxRHLap0PVwl0jFATGkk1DEgxuQ612nZbIEBF2

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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_email character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: paper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paper (
    paper_id integer NOT NULL,
    title character varying(200) NOT NULL,
    abstract text,
    file_name character varying(255) NOT NULL,
    contact_author_email character varying(100) NOT NULL
);


ALTER TABLE public.paper OWNER TO postgres;

--
-- Name: paper_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paper_author (
    author_email character varying(100) NOT NULL,
    paper_id integer NOT NULL
);


ALTER TABLE public.paper_author OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    technical_merit smallint NOT NULL,
    readability smallint NOT NULL,
    originality smallint NOT NULL,
    relevance smallint NOT NULL,
    recommendation character varying(6) NOT NULL,
    comment_committee text,
    comment_author text,
    reviewer_email character varying(100) NOT NULL,
    paper_id integer NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: reviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewer (
    reviewer_email character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(20),
    affiliation character varying(150)
);


ALTER TABLE public.reviewer OWNER TO postgres;

--
-- Name: reviewer_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewer_topic (
    topic character varying(100) NOT NULL,
    reviewer_email character varying(100) NOT NULL
);


ALTER TABLE public.reviewer_topic OWNER TO postgres;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_email, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: paper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paper (paper_id, title, abstract, file_name, contact_author_email) FROM stdin;
\.


--
-- Data for Name: paper_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paper_author (author_email, paper_id) FROM stdin;
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (technical_merit, readability, originality, relevance, recommendation, comment_committee, comment_author, reviewer_email, paper_id) FROM stdin;
\.


--
-- Data for Name: reviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviewer (reviewer_email, first_name, last_name, phone, affiliation) FROM stdin;
\.


--
-- Data for Name: reviewer_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviewer_topic (topic, reviewer_email) FROM stdin;
\.


--
-- Name: author author_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pk PRIMARY KEY (author_email);


--
-- Name: paper_author paper_author_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_author
    ADD CONSTRAINT paper_author_pk PRIMARY KEY (author_email, paper_id);


--
-- Name: paper paper_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper
    ADD CONSTRAINT paper_pk PRIMARY KEY (paper_id);


--
-- Name: review review_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pk PRIMARY KEY (paper_id, reviewer_email);


--
-- Name: reviewer reviewer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewer
    ADD CONSTRAINT reviewer_pk PRIMARY KEY (reviewer_email);


--
-- Name: reviewer_topic reviewer_topic_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewer_topic
    ADD CONSTRAINT reviewer_topic_pk PRIMARY KEY (topic, reviewer_email);


--
-- Name: paper_author paper_author_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_author
    ADD CONSTRAINT paper_author_author_fk FOREIGN KEY (author_email) REFERENCES public.author(author_email);


--
-- Name: paper_author paper_author_paper_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_author
    ADD CONSTRAINT paper_author_paper_fk FOREIGN KEY (paper_id) REFERENCES public.paper(paper_id);


--
-- Name: paper paper_contact_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper
    ADD CONSTRAINT paper_contact_author_fk FOREIGN KEY (contact_author_email) REFERENCES public.author(author_email);


--
-- Name: review review_paper_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_paper_fk FOREIGN KEY (paper_id) REFERENCES public.paper(paper_id);


--
-- Name: review review_reviewer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_reviewer_fk FOREIGN KEY (reviewer_email) REFERENCES public.reviewer(reviewer_email);


--
-- Name: reviewer_topic reviewer_topic_reviewer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewer_topic
    ADD CONSTRAINT reviewer_topic_reviewer_fk FOREIGN KEY (reviewer_email) REFERENCES public.reviewer(reviewer_email);


--
-- PostgreSQL database dump complete
--

\unrestrict wbGtLZxW3AVSzT8XCYiMdTuxpTxRHLap0PVwl0jFATGkk1DEgxuQ612nZbIEBF2

