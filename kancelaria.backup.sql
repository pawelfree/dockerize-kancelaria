--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

--
-- Name: czyn_dict_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.czyn_dict_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.czyn_dict_seq OWNER TO kancelaria;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: czynnosci_dict; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.czynnosci_dict (
    id bigint DEFAULT nextval('public.czyn_dict_seq'::regclass) NOT NULL,
    nazwa character varying(255) NOT NULL
);


ALTER TABLE public.czynnosci_dict OWNER TO kancelaria;

--
-- Name: dokumenty; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.dokumenty (
    id bigint NOT NULL,
    lokalizacja character varying NOT NULL,
    nazwa character varying NOT NULL,
    rozmiar numeric,
    typ character varying
);


ALTER TABLE public.dokumenty OWNER TO kancelaria;

--
-- Name: dokumenty_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.dokumenty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dokumenty_id_seq OWNER TO kancelaria;

--
-- Name: dokumenty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.dokumenty_id_seq OWNED BY public.dokumenty.id;


--
-- Name: podmioty_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.podmioty_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podmioty_seq OWNER TO kancelaria;

--
-- Name: podmioty; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.podmioty (
    id bigint DEFAULT nextval('public.podmioty_seq'::regclass) NOT NULL,
    nazwa character varying(255) NOT NULL,
    ulica_nazwa character varying(255),
    ulica_nr character varying(10),
    miejscowosc character varying(255),
    kod_pocztowy character varying(6),
    kontakt_tel character varying(255),
    kontakt_email character varying(255),
    podmioty_dict_id bigint,
    koresp_miejscowosc character varying(255),
    koresp_kod_pocztowy character varying(6),
    koresp_ulica_nazwa character varying(255),
    koresp_ulica_nr character varying(10)
);


ALTER TABLE public.podmioty OWNER TO kancelaria;

--
-- Name: COLUMN podmioty.podmioty_dict_id; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.podmioty.podmioty_dict_id IS 'Referncja do typu podmiotu';


--
-- Name: podmioty_dict_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.podmioty_dict_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podmioty_dict_seq OWNER TO kancelaria;

--
-- Name: podmioty_dict; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.podmioty_dict (
    id bigint DEFAULT nextval('public.podmioty_dict_seq'::regclass) NOT NULL,
    nazwa character varying(255) NOT NULL
);


ALTER TABLE public.podmioty_dict OWNER TO kancelaria;

--
-- Name: podmioty_osoby_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.podmioty_osoby_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podmioty_osoby_seq OWNER TO kancelaria;

--
-- Name: podmioty_osoby; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.podmioty_osoby (
    id bigint DEFAULT nextval('public.podmioty_osoby_seq'::regclass) NOT NULL,
    klient_id bigint,
    nazwa character varying(255),
    tel character varying(255),
    email character varying(255),
    miejscowosc character varying(255),
    uwagi text,
    kod_pocztowy character varying(6),
    ulica_nazwa character varying(255),
    ulica_nr character varying(10),
    koresp_miejscowosc character varying(255),
    koresp_kod_pocztowy character varying(6),
    koresp_ulica_nazwa character varying(255),
    koresp_ulica_nr character varying(10)
);


ALTER TABLE public.podmioty_osoby OWNER TO kancelaria;

--
-- Name: roleUzytkownikow; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public."roleUzytkownikow" (
    id bigint NOT NULL,
    uzytkownik_id bigint NOT NULL,
    rola character varying(50)
);


ALTER TABLE public."roleUzytkownikow" OWNER TO kancelaria;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO kancelaria;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.role_id_seq OWNED BY public."roleUzytkownikow".id;


--
-- Name: rozliczenia; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.rozliczenia (
    id bigint NOT NULL,
    sprawa_id bigint NOT NULL,
    kwota numeric(15,2) NOT NULL,
    uwagi character varying(255)
);


ALTER TABLE public.rozliczenia OWNER TO kancelaria;

--
-- Name: rozliczenia_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.rozliczenia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rozliczenia_id_seq OWNER TO kancelaria;

--
-- Name: rozliczenia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.rozliczenia_id_seq OWNED BY public.rozliczenia.id;


--
-- Name: sady; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sady (
    id bigint NOT NULL,
    nazwa character varying,
    ulica character varying,
    miejscowosc character varying,
    kod_pocztowy character varying,
    email character varying,
    tel character varying,
    fax character varying,
    www character varying
);


ALTER TABLE public.sady OWNER TO kancelaria;

--
-- Name: sady_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sady_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sady_id_seq OWNER TO kancelaria;

--
-- Name: sady_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.sady_id_seq OWNED BY public.sady.id;


--
-- Name: sady_wydzialy; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sady_wydzialy (
    id integer NOT NULL,
    sad_id bigint NOT NULL,
    nazwa character varying(255) NOT NULL,
    ulica_nr character varying(255),
    kod_pocztowy character varying(10),
    miejscowosc character varying(255),
    email character varying(255),
    tel character varying(255),
    fax character varying(255)
);


ALTER TABLE public.sady_wydzialy OWNER TO kancelaria;

--
-- Name: sady_wydzialy_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sady_wydzialy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sady_wydzialy_id_seq OWNER TO kancelaria;

--
-- Name: sady_wydzialy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.sady_wydzialy_id_seq OWNED BY public.sady_wydzialy.id;


--
-- Name: sequence; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);


ALTER TABLE public.sequence OWNER TO kancelaria;

--
-- Name: sprawy_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_seq OWNER TO kancelaria;

--
-- Name: sprawy; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy (
    id bigint DEFAULT nextval('public.sprawy_seq'::regclass) NOT NULL,
    sygnatura_akt character varying,
    wps numeric(15,2),
    procent numeric(5,2),
    sprawa_rodzaj_id bigint,
    klient_kontakt_id bigint,
    sad_id bigint,
    nr_szkody character varying(100),
    data_szkody timestamp without time zone,
    nr_rej_pojazdu character varying(50),
    data_wezwania_zgloszenia timestamp without time zone,
    data_wyslania_pozwu timestamp without time zone,
    data_przedawnienia timestamp without time zone,
    osoba_prowadzaca_id bigint,
    wydzial_sadu_adres character varying(255),
    sprawa_status_id bigint,
    sad_wydzial_id bigint,
    data_wplywu timestamp without time zone,
    kzp numeric(15,2),
    success_fee numeric(15,2),
    sprawa_wynik_id bigint,
    data_zakonczenia timestamp without time zone,
    created_at timestamp without time zone,
    created_by bigint,
    modified_at timestamp without time zone,
    modified_by bigint,
    uwagi text
);


ALTER TABLE public.sprawy OWNER TO kancelaria;

--
-- Name: COLUMN sprawy.sygnatura_akt; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.sprawy.sygnatura_akt IS 'Sygnatura akt';


--
-- Name: COLUMN sprawy.wps; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.sprawy.wps IS 'Wartość przedmiotu sporu';


--
-- Name: COLUMN sprawy.procent; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.sprawy.procent IS 'Procent wynagrodzenia dla kancelarii';


--
-- Name: COLUMN sprawy.kzp; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.sprawy.kzp IS 'koszty zastepstwa procesowego';


--
-- Name: COLUMN sprawy.success_fee; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.sprawy.success_fee IS 'success_fee';


--
-- Name: sprawy_dokumenty_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_dokumenty_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_dokumenty_seq OWNER TO kancelaria;

--
-- Name: sprawy_dokumenty; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_dokumenty (
    id bigint DEFAULT nextval('public.sprawy_dokumenty_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    dokument_id bigint NOT NULL
);


ALTER TABLE public.sprawy_dokumenty OWNER TO kancelaria;

--
-- Name: sprawy_klienci_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_klienci_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_klienci_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_klienci; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_klienci (
    id bigint DEFAULT nextval('public.sprawy_klienci_id_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    podmiot_id bigint NOT NULL
);


ALTER TABLE public.sprawy_klienci OWNER TO kancelaria;

--
-- Name: sprawy_pelnomocnicy_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_pelnomocnicy_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_pelnomocnicy_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_pelnomocnicy; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_pelnomocnicy (
    id integer DEFAULT nextval('public.sprawy_pelnomocnicy_id_seq'::regclass) NOT NULL,
    sprawa_id bigint,
    podmiot_osoba_id bigint
);


ALTER TABLE public.sprawy_pelnomocnicy OWNER TO kancelaria;

--
-- Name: sprawy_podmioty_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_podmioty_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_podmioty_seq OWNER TO kancelaria;

--
-- Name: sprawy_podmioty; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_podmioty (
    id bigint DEFAULT nextval('public.sprawy_podmioty_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    podmiot_id bigint NOT NULL
);


ALTER TABLE public.sprawy_podmioty OWNER TO kancelaria;

--
-- Name: sprawy_podmioty_osoby_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_podmioty_osoby_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_podmioty_osoby_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_podmioty_osoby; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_podmioty_osoby (
    id integer DEFAULT nextval('public.sprawy_podmioty_osoby_id_seq'::regclass) NOT NULL,
    sprawa_id bigint,
    podmiot_osoba_id bigint
);


ALTER TABLE public.sprawy_podmioty_osoby OWNER TO kancelaria;

--
-- Name: sprawy_pozyskali_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_pozyskali_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_pozyskali_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_pozyskali; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_pozyskali (
    id bigint DEFAULT nextval('public.sprawy_pozyskali_id_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    podmiot_id bigint NOT NULL
);


ALTER TABLE public.sprawy_pozyskali OWNER TO kancelaria;

--
-- Name: sprawy_przeciwnicy_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_przeciwnicy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_przeciwnicy_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_przeciwnicy; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_przeciwnicy (
    id bigint DEFAULT nextval('public.sprawy_przeciwnicy_id_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    podmiot_id bigint NOT NULL
);


ALTER TABLE public.sprawy_przeciwnicy OWNER TO kancelaria;

--
-- Name: sprawy_rodzaje_czynnosc_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_rodzaje_czynnosc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_rodzaje_czynnosc_seq OWNER TO kancelaria;

--
-- Name: sprawy_rodzaje_czynnosc; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_rodzaje_czynnosc (
    id bigint DEFAULT nextval('public.sprawy_rodzaje_czynnosc_seq'::regclass) NOT NULL,
    sprawy_rodzaje_dict_id bigint NOT NULL,
    czynnosci_dict_id bigint NOT NULL,
    alert_aktywny boolean DEFAULT false,
    liczba_dni_do_alertu integer
);


ALTER TABLE public.sprawy_rodzaje_czynnosc OWNER TO kancelaria;

--
-- Name: TABLE sprawy_rodzaje_czynnosc; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON TABLE public.sprawy_rodzaje_czynnosc IS 'Każdy typ sprawy ma swje domyslne czynnosci';


--
-- Name: sprawy_rodzaje_dict_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_rodzaje_dict_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_rodzaje_dict_seq OWNER TO kancelaria;

--
-- Name: sprawy_rodzaje_dict; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_rodzaje_dict (
    id bigint DEFAULT nextval('public.sprawy_rodzaje_dict_seq'::regclass) NOT NULL,
    nazwa character varying(255) NOT NULL
);


ALTER TABLE public.sprawy_rodzaje_dict OWNER TO kancelaria;

--
-- Name: sprawy_statusy_dict; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_statusy_dict (
    id bigint NOT NULL,
    nazwa character varying(255) NOT NULL
);


ALTER TABLE public.sprawy_statusy_dict OWNER TO kancelaria;

--
-- Name: TABLE sprawy_statusy_dict; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON TABLE public.sprawy_statusy_dict IS 'Statusy sprawy: 1- w toku, 2 - Zakończona';


--
-- Name: sprawy_statusy_dict_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_statusy_dict_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_statusy_dict_seq OWNER TO kancelaria;

--
-- Name: sprawy_statusy_dict_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.sprawy_statusy_dict_seq OWNED BY public.sprawy_statusy_dict.id;


--
-- Name: sprawy_wynik_dict; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.sprawy_wynik_dict (
    id integer NOT NULL,
    nazwa character varying(255) NOT NULL
);


ALTER TABLE public.sprawy_wynik_dict OWNER TO kancelaria;

--
-- Name: sprawy_wynik_dict_id_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.sprawy_wynik_dict_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprawy_wynik_dict_id_seq OWNER TO kancelaria;

--
-- Name: sprawy_wynik_dict_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kancelaria
--

ALTER SEQUENCE public.sprawy_wynik_dict_id_seq OWNED BY public.sprawy_wynik_dict.id;


--
-- Name: uzytkownicy_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.uzytkownicy_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzytkownicy_seq OWNER TO kancelaria;

--
-- Name: uzytkownicy; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.uzytkownicy (
    id bigint DEFAULT nextval('public.uzytkownicy_seq'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    haslo character varying(255) NOT NULL,
    status character varying(25),
    typ character varying,
    ostatnie_logowanie timestamp without time zone,
    nazwa character varying(50)
);


ALTER TABLE public.uzytkownicy OWNER TO kancelaria;

--
-- Name: COLUMN uzytkownicy.nazwa; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON COLUMN public.uzytkownicy.nazwa IS 'nazwa do wyswietlania';


--
-- Name: zadania_seq; Type: SEQUENCE; Schema: public; Owner: kancelaria
--

CREATE SEQUENCE public.zadania_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zadania_seq OWNER TO kancelaria;

--
-- Name: zadania; Type: TABLE; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE TABLE public.zadania (
    id bigint DEFAULT nextval('public.zadania_seq'::regclass) NOT NULL,
    sprawa_id bigint NOT NULL,
    czynnosc_id bigint NOT NULL,
    uzytkownik_id bigint NOT NULL,
    termin_wykonania timestamp without time zone,
    data_wykonania timestamp without time zone,
    status character varying(25),
    uwagi character varying(1000),
    pokaz_w_kalendarzu boolean DEFAULT false,
    created_at timestamp without time zone,
    created_by bigint,
    modified_at timestamp without time zone,
    modified_by bigint,
    kolor character varying(25)
);


ALTER TABLE public.zadania OWNER TO kancelaria;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.dokumenty ALTER COLUMN id SET DEFAULT nextval('public.dokumenty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public."roleUzytkownikow" ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.rozliczenia ALTER COLUMN id SET DEFAULT nextval('public.rozliczenia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sady ALTER COLUMN id SET DEFAULT nextval('public.sady_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sady_wydzialy ALTER COLUMN id SET DEFAULT nextval('public.sady_wydzialy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_statusy_dict ALTER COLUMN id SET DEFAULT nextval('public.sprawy_statusy_dict_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_wynik_dict ALTER COLUMN id SET DEFAULT nextval('public.sprawy_wynik_dict_id_seq'::regclass);


--
-- Name: czyn_dict_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.czyn_dict_seq', 107, true);


--
-- Data for Name: czynnosci_dict; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (1, 'zgłoszenie szkody');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (2, 'wezwanie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (3, 'odwołanie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (4, 'pozew');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (5, 'nakaz zapłaty (alert na jego prawomocność)');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (6, 'pismo procesowe');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (7, 'pismo po opinii biegłego');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (8, 'pismo po wyroku');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (9, 'apelacja');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (10, 'ugoda');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (11, 'zażalenie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (12, 'pismo przedsądowe');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (44, 'Wysłanie wezwania');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (45, 'Wysłanie zgłoszenia szkody');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (46, 'Inna');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (47, 'Spotkanie z klientem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (48, 'ugoda przedsądowa');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (49, 'Nowa czynnosc testowa');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (51, 'Posiedzenie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (52, 'Odebranie nakazu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (53, 'Sprzeciw');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (54, 'Odpowiedź na pozew');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (55, 'pismo do klienta z pełnomocnictwem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (56, 'wezwanie koszty');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (57, 'pismo podziękowanie + faktura');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (58, 'wniosek o uzasadnienie wyroku');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (59, 'wniosek o uzupełnienie kosztów');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (60, 'zażalenie na koszty');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (61, 'pismo dot. zgody na cofnięcie pozwu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (62, 'pismo do Sądu z pełnomocnictwem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (63, 'kontakt z klientem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (64, 'zaliczka na biegłego');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (65, 'kontakt z ubezpieczycielem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (66, 'Odpowiedź na sprzeciw');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (67, 'sprawdzenie pisma');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (68, 'odpowiedź na apelację');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (69, 'mail');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (70, 'analiza sprawy');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (71, 'wniosek o przyspieszenie postępowania');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (72, 'Odpowiedź na wniosek');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (73, 'sprawdzić prawomocność orzeczenia');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (74, 'odpowiedź na zażalenie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (75, 'pismo');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (76, 'rozliczenie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (77, 'archiwizacja');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (79, 'zawezwanie do próby ugodowej');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (80, 'wniosek egzekucyjny');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (81, 'dosłanie dokumentacji');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (82, 'wysłanie pozwu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (83, 'mail z opłatami');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (84, 'pismo do Sądu o przyspieszenie sprawy');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (85, 'pismo po odpowiedzi na pozew');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (86, 'Cofnięcie pozwu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (87, 'ugoda - negocjacje');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (88, 'pismo z warunkami ugody');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (89, 'wniosek o klauzulę wykonalności');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (90, 'rozszerzenie powództwa');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (91, 'kontakt z pełnomocnikiem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (92, 'wypowiedzenie pełnomocnictwa');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (93, 'wrócić do sprawy');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (94, 'publikacja wyroku');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (95, 'zaliczka - post. egzekucyjne');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (96, 'Uzyskanie informacji');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (97, 'Wniosek do Komisji Medycznej');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (98, 'fakturowanie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (99, 'zgłoszenie wierzytelności');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (100, 'kontakt z komornikiem');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (101, 'opłata od pozwu ');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (102, 'załącznik do protokołu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (103, 'telefon do sądu');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (104, 'uzupełnienie braków ');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (105, 'wysłanie wniosku o zawezwanie');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (106, 'skarga na orzeczenie referendarza');
INSERT INTO public.czynnosci_dict (id, nazwa) VALUES (107, 'wniosek o uzasadnienie postanowienia');


--
-- Data for Name: dokumenty; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.dokumenty (id, lokalizacja, nazwa, rozmiar, typ) VALUES (8, 'c:\temp', 'test', 1, 'd');


--
-- Name: dokumenty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.dokumenty_id_seq', 1, false);


INSERT INTO public.podmioty (id, nazwa, ulica_nazwa, ulica_nr, miejscowosc, kod_pocztowy, kontakt_tel, kontakt_email, podmioty_dict_id, koresp_miejscowosc, koresp_kod_pocztowy, koresp_ulica_nazwa, koresp_ulica_nr) VALUES (1, 'Paweł Dudek Inc.', 'Modrakowa', '27/21', 'Bydgoszcz', '13-200', '', 'pawelfree@wp.pl', 1, '', '', '', '');

--
-- Data for Name: podmioty_dict; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.podmioty_dict (id, nazwa) VALUES (1, 'Osoba fizyczna');
INSERT INTO public.podmioty_dict (id, nazwa) VALUES (2, 'Firma');


--
-- Name: podmioty_dict_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.podmioty_dict_seq', 1, true);


--
-- Data for Name: podmioty_osoby; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.podmioty_osoby (id, klient_id, nazwa, tel, email, miejscowosc, uwagi, kod_pocztowy, ulica_nazwa, ulica_nr, koresp_miejscowosc, koresp_kod_pocztowy, koresp_ulica_nazwa, koresp_ulica_nr) VALUES (1, 1, 'Paweł Dudek', '616887038', 'pawelfree@wp.pl', 'Toruń', 'pełnomocnik PZU', '87-100', 'Żeglarska', '11', ' Toruń', '', '', '');


--
-- Name: podmioty_osoby_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.podmioty_osoby_seq', 1, true);


--
-- Name: podmioty_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.podmioty_seq', 2714, true);


--
-- Data for Name: roleUzytkownikow; Type: TABLE DATA; Schema: public; Owner: kancelaria
--



--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- Data for Name: rozliczenia; Type: TABLE DATA; Schema: public; Owner: kancelaria
--



--
-- Name: rozliczenia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.rozliczenia_id_seq', 1, false);


--
-- Data for Name: sady; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (1, 'Sąd Apelacyjny w Białymstoku', 'Mickiewicza 5', 'Białystok', '15-213', 'boi@bialystok.sa.gov.pl ', '(85) 743 07 27 ', '(85) 732 90 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (3, 'Sąd Rejonowy w Białymstoku', 'Mickiewicza 103', 'Białystok', '15-950', 'boi@bialystok.sr.gov.pl', '(85) 665 65 10', '(85) 665 63 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (6, 'Sąd Okręgowy w Ostrołęce', 'Gomulickiego 5', 'Ostrołęka', '07-410', 'boi@ostroleka.so.gov.pl', '(29) 765 01 28, 765 01 12', '(29) 765 01 84', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (5, 'Sąd Rejonowy w Sokółce', 'Marszałka Józefa Piłsudskiego 7', 'Sokółka', '16-100', 'boi@sokolka.sr.gopv.pl', '(85) 711 41 29', '(85) 711 41 29 wew. 305', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (7, 'Sąd Rejonowy w Ostrołęce', 'Mazowiecka 3', 'Ostrołęka', '07-410', 'boi@ostroleka.sr.gov.pl', '(29) 765 44 00, 765 44 01', '(29) 765 44 38', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (8, 'Sąd Rejonowy w Ostrowi Mazowieckiej', 'B. Prusa 2', 'Ostrowia Mazowiecka', '07-300', 'sekretariat@ostrowmaz.sr.gov.pl', '(29) 746 89 35', '(29) 746 89 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (10, 'Sąd Rejonowy w Pułtusku', 'Rynek  37', 'Pułtusk', '06-100', 'biuro.podawcze@pultusk.sr.gov.pl', '(23) 692 99 70', '(23) 692 99 18', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (11, 'Sąd Rejonowy w Wyszkowie', 'Kościuszki 50', 'Wyszków', '07-200 ', 'boi@wyszkow.sr.gov.pl', '(29) 742 38 08', '(29) 742 38 08 wew. 209', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (12, 'Sąd Okręgowy w Łomży', 'Dworna 16', 'Łomża', '18-400', 'boi@lomza.so.gov.pl', '(86) 215 42 48, 215 42 43', '(86) 216 67 53', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (13, 'Sąd Rejonowy w Łomży', 'Polowa 1', 'Łomża', '18-400', 'boi@lomza.sr.gov.pl', '(86) 215 09 22', '(86) 215 09 60', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (14, 'Sąd Rejonowy w Grajewie', 'Kolejowa 1', 'Grajewo', '19-200 ', 'bpod@grajewo.sr.gov.pl', '(86) 272 02 43', '(86) 272 02 45', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (15, 'Sąd Rejonowy w Zambrowie', 'Al. Wojska Polskiego 56', 'Zambrowo', '18-300', 'administracja@zambrow.sr.gov.pl', '(86) 271 22 40', '(86) 271 22 40', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (16, 'Sąd Rejonowy w Wysokiem Mazowieckiem', 'Ludowa 44', 'Wysokie Mazowieckie', '18-200', 'sr@wysmaz.sr.gov.pl', '(86) 477 02 30', '(86) 477 02 30 w. 48', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (18, 'Sąd Rejonowy w Bartoszycach', 'Warszawska 3', 'Bartoszyce', '11-200', 'upo.bartoszyce@olsztyn.so.gov.pl ', '(89) 762 22 96', '(89) 762 28 54', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (19, 'Sąd Rejonowy w Biskupcu', 'Sądowa 4 ', 'Biskupiec', '11-300', 'sekcja.administracyjna@biskupiec.sr.gov.pl ', '(89) 715 22 18 ', '(89) 715 46 86', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (20, 'Sąd Rejonowy w Giżycku', 'Warszawskia 28', 'Giżycko', '11-500', 'oddzial.administracyjny@gizycko.sr.gov.pl', '(87) 429 82 29', '(87) 429 82 11', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (21, 'Sąd Rejonowy w Kętrzynie', 'Sikorskiego 66', 'Kętrzyn', '11-400 ', 'poczta@ketrzyn.sr.gov.pl', '(89) 751 76 66', '(89) 751 42 10', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (23, 'Sąd Rejonowy w Mrągowie', 'Królewiecka 55', 'Mrągowo', '11-700', 'upo.mragowo@olsztyn.so.gov.pl', '(89) 741 04 31', '(89) 741 04 31 wew. 36', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (24, 'Sąd Rejonowy w Nidzicy', 'Kościuszki 15 ', 'Nidzica', '13-100', 'biuro.podawcze@nidzica.sr.gov.pl', '(89) 521 59 52', '(89) 521 59 31', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (25, 'Sąd Rejonowy w Olsztynie', 'Dąbrowszczaków 44', 'Olsztyn', '10-543', 'boi.srolsztyn@olsztyn.sr.gov.pl ', '(89) 523 02 80, 523 02 83', '(89) 523 02 41', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (26, 'Sąd Rejonowy w Piszu', 'Warszawska 47', 'Pisz', '11-200', 'sekcja.administracyjna@pisz.sr.gov.pl', '(87) 424 13 00', '(87) 424 13 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (27, 'Sąd Rejonowy w Szczytnie', 'Sienkiewicza 8', 'Szczytno', '12-100', 'sad.rejonowy@szczytno.sr.gov.pl', '(89) 624 71 13, 624 71 14', '(89) 624 71 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (28, 'Sąd Okręgowy w Suwałkach', 'Waryńskiego 45', 'Suwałki', '16-400', 'so@suwalki.so.gov.pl', '(87) 563 13 30', '(87) 563 13 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (29, 'Sąd Rejonowy w Augustowie', 'Młyńska 59 ', 'Augustów', '16-300 ', 'sekretariat@augustow.sr.gov.pl ', '(87) 643 84 30', '(87) 643 84 64 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (30, 'Sąd Rejonowy w Ełku', 'Małeckich 4', 'Ełk', '19-300', 'oddzial.administracyjny@elk.sr.gov.pl', '(87) 629 03 35', '(87) 629 03 22', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (32, 'Sąd Rejonowy w Suwałkach', 'Waryńskiego 45', 'Suwałki', '16-400', 'sr@suwalki.sr.gov.pl', '(87) 563 13 10', '(87) 563 12 69', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (33, 'Sąd Apelacyjny w Gdańsku', 'Nowe Ogrody 28/29', 'Gdańsk', '80-803', 'boi@gdansk.sa.gov.pl', '(58) 323 85 41, 323 85 24', '(58) 302 97 22', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (38, 'Sąd Rejonowy w Nakle nad Notecią', 'Sądowa 3', 'Nakło nad Notecią', '89-100', 'sad@naklo.sr.gov.pl', '(52) 386 78 00', '(52) 386 78 21', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (45, 'Sąd Rejonowy w Braniewie', 'Sądowa 1 ', 'Braniewo', '14-500', 'srbraniewo@braniewo.sr.gov.pl', '(55) 646 52 52', '(55) 646 52 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (48, 'Sąd Rejonowy w Nowym Mieście Lubawskim', 'Grunwaldzka 28', 'Nowe Miasto Lubawskie', '13-300', 'sad.rejonowy@nowemiastolubawskie.sr.gov.pl', '(56) 472 61 20', '(56) 472 61 40', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (49, 'Sąd Rejonowy w Ostródzie', 'Jana III Sobieskiego 12', 'Ostróda', '14-100', 'boi@ostroda.sr.gov.pl', '(89) 642 55 00', '(89) 642 55 35', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (50, 'Sąd Okręgowy w Gdańsku', 'Nowe Ogrody 30/34', 'Gdańsk', '80-803', 'sogdansk@gdansk.so.gov.pl', '(58) 321 31 99', '(58) 321 31 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (53, 'Sąd Rejonowy w Gdyni', 'plac Konstytucji 5', 'Gdynia', '81-354', 'administracja@gdynia.sr.gov.pl', '(58) 765 61 04', '(58) 661 21 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (54, 'Sąd Rejonowy w Kartuzach', 'Kościuszki 26', 'Kartuzy', '83-300', 'boi@kartuzy.sr.gov.pl', '(58) 694 94 09', '(58) 694 94 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (55, 'Sąd Rejonowy w Kościerzynie', 'Dworcowa  2 ', 'Kościerzyna', '83-400 ', 'administracja@koscierzyna.sr.gov.pl', '(58) 680 13 48', '(58) 680 13 48', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (56, 'Sąd Rejonowy w Kwidzynie', 'Pl. Plebiscytowy 1 ', 'Kwidzyn', '82-500', 'poi@kwidzyn.sr.gov.pl', '(55) 262 45 49', '(55) 262 45 49', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (35, 'Sąd Rejonowy w Bydgoszczy', 'Wały Jagiellońskie 4', 'Bydgoszcz', '85-128', 'boi@bydgoszcz.sr.gov.pl', '(52) 325 31 00', '(52) 348 66 88', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (34, 'Sąd Okręgowy w Bydgoszczy', 'Wały Jagiellońskie 2', 'Bydgoszcz', '85-128', 'boi@bydgoszcz.so.gov.pl', '(52) 325 31 93', '(52) 321 31 01', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (36, 'Sąd Rejonowy w Inowrocławiu', 'Narutowicza 42', 'Inowrocław', '88-100', 'poi@inowroclaw.sr.gov.pl', '(52) 359 26 20', '(52) 359 26 30', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (37, 'Sąd Rejonowy w Mogilnie', 'Sądowa 21', 'Mogilno', '88-300', 'administracja@mogilno.sr.gov.pl', '(52) 315 97 34', '(52) 315 97 09', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (39, 'Sąd Rejonowy w Szubinie ', 'Pl. Wolności 4 ', 'Szubin', '89-200', 'sad@szubin.sr.gov.pl', '(52) 391 01 30', '(52) 384 80 68', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (40, 'Sąd Rejonowy w Świeciu', 'Sądowa  12', 'Świecie', '86-100', 'sad@swiecie.sr.gov.pl', '(52) 333 28 00', '(52) 333 28 12', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (41, 'Sąd Rejonowy w Tucholi', 'Świecka 28', 'Tuchola', '89-500', 'sad@tuchola.sr.gov.pl', '(52) 336 04 00', '(52) 336 04 09', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (44, 'Sąd Rejonowy w Elblągu', 'Płk. Dąbka 8-12', 'Elbląg', '82-300', 'boi@elblag.sr.gov.pl ', '(55) 611 22 30, 611 27 00', '(55) 642 45 90', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (43, 'Sąd Okręgowy w Elblągu', 'Pl. Konstytucji 1', 'Elbląg', '82-300', 'boi@elblag.so.gov.pl', '(55) 611 24 04, 611 24 57', '(55) 611 24 96', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (46, 'Sąd Rejonowy w Działdowie', 'Jagiełły 31', 'Działdowo', '13-200', 'srdzialdowo@dzialdowo.sr.gov.pl', '(23) 697 07 60', '(23) 697 07 61', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (47, 'Sąd Rejonowy w Iławie', 'Kopernika 4B', 'Iława', '14-200', 'boi@ilawa.sr.gov.pl', '(89) 644 57 00', '(89) 644 57 55', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (58, 'Sąd Rejonowy w Sopocie', '1 Maja 10', 'Sopot', '81-828', 'boi@sopot.sr.gov.pl', '(58) 554 98 00, 554 98 01', '(58) 554 98 06', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (59, 'Sąd Rejonowy w Starogardzie Gdańskim', 'Kościuszki 30', 'Starogard Gdański', '83-200', 'boi@starogard-gd.sr.gov.pl', '(58) 777 46 20', '(58) 777 46 58', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (60, 'Sąd Rejonowy w Tczewie', 'Kołłątaja 6', 'Tczew', '83-110', 'informacja@tczew.sr.gov.pl', '(58) 530 91 07', '(58) 530 91 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (61, 'Sad Rejonowy w Wejherowie', 'Sobieskiego 302', 'Wejherowo', '84-200', 'informacja@wejherowo.sr.gov.pl', '(58) 672 89 89', '(58) 672 88 93', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (62, 'Sąd Okręgowy w Słupsku', 'Zamenhofa 7', 'Słupsk', '76-200 ', 'boi@slupsk.so.gov.pl', '(59) 846 94 28,846 95 65, 846 95 64 ', '(59) 846 95 67', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (64, 'Sąd Rejonowy w Lęborku', 'Pl. Kopernika 4', 'Lębork', '84-300', 'poczta@lebork.sr.gov.pl', '(59) 863 68 36', '(59) 863 68 35', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (63, 'Sąd Rejonowy w Słupsku', 'Sz. Szeregów 13', 'Słupsk', '76-200', 'sad.rejonowy@slupsk.sr.gov.pl', '(59) 846 92 00', '(59) 842 00 39', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (65, 'Sąd Rejonowy w Chojnicach', 'Młyńska 30', 'Chojnice', '89-600', 'boi@chojnice.sr.go.pl', '(52) 395 27 93', '(52) 395 28 00', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (66, 'Sąd Rejonowy w Miastku', 'Armii Karjowej 30', 'Miastko', '77-200', 'administracja@miastko.sr.gov.pl', '(59) 858 71 00', '(59) 858 71 14', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (67, 'Sąd Rejonowy w Bytowie', 'Zamkowa 1', 'Bytów', '77-100', 'administracja@bytow.sr.gov.pl', '(59) 822 81 99', '(59) 822 35 56', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (70, 'Sąd Rejonowy w Chełmnie', 'Toruńska 3', 'Chełmno', '86-200', 'poi@chelmno.sr.gov.pl', '(56) 677 02 00', '(56) 677 02 25', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (77, 'Sąd Rejonowy w Aleksandrowie Kujawskim', 'Narutowicza 16', 'Aleksandrów Kujawski', '87-700', 'mail@aleksandrowkuj.sr.gov.pl', '(54) 282 24 24', '(54) 282 53 69', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (79, 'Sąd Rejonowy w Radziejowie', 'Brzeska 20', 'Radziejów', '88-200', 'b.podawcze@radziejow.sr.gov.pl', '(54) 285 36 21', '(54) 285 36 23', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (82, 'Sąd Apelacyjny w Katowicach', 'Al. Korfantego 117/119', 'Katowice', '40-156', 'informacja@katowice.sa.gov.pl', '(32) 200 45 83', '(32) 200 46 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (83, 'Sąd Okręgowy w Bielsku-Białej    ', 'Cieszyńska 10 ', 'Bielsko-Biała', '43-300', 'informacja@bielsko-biala.so.gov.pl ', '(33) 499 04 80', '(33) 499 04 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (84, 'Sąd Rejonowy w Bielsku-Białej', 'Mickiewicza 22', 'Bielsko-Biała', '43-300', 'informacja@bielsko-biala.sr.gov.pl', '(33) 499 78 26', '(33) 499 78 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (85, 'Sąd Rejonowy Cieszynie', 'Garncarska 8', 'Cieszyn', '43-400', 'punkt.informacyjny@cieszyn.sr.gov.pl', '(33) 479 46 06, 479 47 06', '(33) 479 46 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (86, 'Sąd Rejonowy w Żywcu', 'Kościuszki 39', 'Żywiec', '34-300', 'bpodawcze@zywiec.sr.gov.pl', '(33) 475 12 18', '(33) 475 12 84 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (88, 'Sąd Rejonowy w Częstochowie', 'Dąbrowskiego 23/35', 'Częstochowa', '42-202', 'sad_rejonowy@czestochowa.sr.gov.pl', '(34) 364 41 00', '(34) 364 43 21', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (87, 'Sąd Okręgowy w Częstochowie', 'Dąbrowskiego 23/35', 'Częstochowa', '42-200', 'boi@czestochowa.so.gov.pl', '(34) 368 46 57', '(34) 368 46 58', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (89, 'Sąd Rejonowy w Lublińcu', 'Sądowa 3', 'Lubliniec', '42-700', 'oddzial.administracyjny@lubliniec.sr.gov.pl', '(34) 351 51 00', '(34) 351 51 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (90, 'Sąd Rejonowy w Myszkowie', 'Kwiatkowskiego 2', 'Myszków', '42-300', 'boi@myszkow.sr.gov.pl', '(34) 315 98 00, 315 98 01', '(34) 315 98 98 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (91, 'Sąd Rejonowy w Zawierciu', 'Leśna 4', 'Zawiercie', '42-400', 'boi@zawiercie.sr.gov.pl', '(32) 649 79 06', '(32) 649 79 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (92, 'Sąd Okręgowy w Gliwicach', 'Kościuszki 15', 'Gliwice', '44-100', 'boi@gliwice.so.gov.pl', '(32) 338 01 16', '(32) 338 06 85', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (94, 'Sąd Rejonowy w Jastrzębiu-Zdroju', 'Stanisława Staszica 3', 'Jastrzębie-Zdrój', '44-330', 'jastrzebie@jastrzebie.sr.gov.pl', '(32) 478 74 00', '(32) 478 74 11', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (95, 'Sąd Rejonowy w Raciborzu', 'Nowa 29', 'Racibórz', '47-400', 'administracja@raciborz.sr.gov.pl', '(32) 459 46 22', '(32) 459 46 12', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (96, 'Sąd Rejonowy w Rudzie Śląskiej', 'Bukowa 5A  ', 'Ruda Śląska', '41-700', 'boi@ruda-slaska.sr.gov.pl', '(32) 438 11 05', '(32) 438 11 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (97, 'Sąd Rejonowy w Rybniku', 'Pl. Kopernika 2', 'Rybnik', '44-200', 'biuro.podawcze@rybnik.sr.gov.pl', '(32) 439 31 07', '(32) 439 31 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (98, 'Sąd Rejonowy w Tarnowskich Górach', 'Opolska 17', 'Tarnowskie Góry', '42-600', 'boi@tgory.sr.gov.pl', '(32) 381 83 10', '(32) 381 83 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (99, 'Sąd Rejonowy w Wodzisławiu Śląskim', 'Sądowa 3', 'Wodzisław Śląski', '44-300', 'poi@wodzislaw.sr.gov.pl', '(32) 459 14 00', '(32) 459 14 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (100, 'Sąd Rejonowy w Zabrzu', '3 Maja 21', 'Zabrze', '41-800', 'informacja@poczta.zabrze.sr.gov.pl', '(32) 373 58 31', '(32) 373 58 30', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (101, 'Sąd Rejonowy w Żorach', 'Al. Jana Pawła II 15', 'Żory', '44-240', 'poi@zory.sr.gov.pl', '(32) 475 96 69 ', '(32) 475 96 20', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (103, 'Sąd Rejonowy w Będzinie', 'Sączewskiego 23 ', 'Będzin', '42-500', 'administracja@bedzin.sr.gov.pl', '(32) 368 81 88', '(32) 368 81 88', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (105, 'Sąd Rejonowy w Chorzowie', 'dr Józefa Rostka 2', 'Chorzów', '41-500', 'boi@chorzow.sr.gov.pl', '(32) 349 94 14', '(32) 349 94 15', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (106, 'Sąd Rejonowy w Dąbrowie Górniczej', 'Graniczna 23', 'Dąbrowa Górnicza', '41-300', 'sekretariat@dabrowag.sr.gov.pl', '(32) 295 94 00', '(33) 295 94 83', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (107, 'Sąd Rejonowy w Jaworznie', 'Grunaldzka 28', 'Jaworzno', '43-600', 'boi@jaworzno.sr.gov.pl', '(32) 758 62 00', '(32) 758 61 89', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (108, 'Sąd Rejonowy Katowice-Wschód w Katowicach', 'Lompy 14', 'Katowice', '40-040', 'poi@katowice-wschod.sr.gov.pl', '(32) 604 74 91', '(32) 604 74 92', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (110, 'Sąd Rejonowy w Mikołowie', 'Ks.Kard.St. Wyszyńskiego 12/14', 'Mikołów', '43-190', 'administracja@mikolow.sr.gov.pl', '(32) 784 61 02', '(32) 784 61 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (111, 'Sąd Rejonowy w Mysłowicach', 'Krakowska 2', 'Mysłowice', '41-400', 'poi@myslowice.sr.gov.pl', '(32) 317 41 29', '(32) 317 41 53', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (69, 'Sąd Okręgowy w Toruniu', 'Piekary 51', 'Toruń', '87-100', 'boi@torun.so.gov.pl', '(56) 610 55 51, 610 55 53', '(56) 655 57 06', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (74, 'Sąd Rejonowy w Brodnicy', 'Sądowa 5', 'Brodnica', '87-300', 'poi@brodnica.sr.gov.pl', '(56) 494 17 08', '(56) 494 17 58', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (71, 'Sąd Rejonowy w Golubiu Dobrzyniu', 'Kościelna 23/25', 'Golub Dobrzyń', '87-400', 'sr@golubdobrzyn.sr.gov.pl', '(56) 682 35 00', '(56) 683 52 77 ', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (75, 'Sąd Rejonowy w Grudziądzu', 'Sikorskiego 19/23', 'Grudziądz', '86-300', 'poi@grudziadz.sr.gov.pl', '(56) 450 59 87', '(56) 450 59 09', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (72, 'Sąd Rejonowy w Wąbrzeźnie ', 'Wolności 19', 'Wąbrzeźno', '87-200', 'srw@wabrzezno.sr.gov.pl', '(56) 689 06 00', '(56) 689 06 05', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (76, 'Sąd Okręgowy we Włocławku', 'Wojska Polskiego 22', 'Włocławek', '87-800', 'boi@wloclawek.so.gov.pl', '(54) 412 03 80', '(54) 411 85 75', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (78, 'Sąd Rejonowy w Lipnie', 'Piłsudskiego 15/17', 'Lipno', '87-600', 'srlipno@lipno.sr.gov.pl', '(54) 287 22 05', '(54) 287 33 19', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (80, 'Sąd Rejonowy w Rypinie', 'Warszawska 42', 'Rypin', '87-500 ', 'srrypin@rypin.sr.gov.pl', '(54) 280 24 58', '(54) 280 29 57', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (112, 'Sąd Rejonowy w Pszczynie', 'bp. Bogedaina nr 14', 'Pszczyna', '43-200', 'informacja@pszczyna.sr.gov.pl', '(32) 449 41 00', '(32) 449 41 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (113, 'Sąd Rejonowy w Siemianowicach Śląskich', 'Chorzowska 14', 'Siemianowice Sląskie', '41-106', 'poi@siemianowice.sr.gov.pl', '(32) 766 43 10   ', '(32) 766 43 11', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (114, 'Sąd Rejonowy w Sosnowcu', '1 Maja 19', 'Sosnowiec', '41-200', 'informacja@sosnowiec.sr.gov.pl', '(32) 296 62 52', '(32) 296 62 40', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (115, 'Sąd Rejonowy w Tychach', 'Budowlanych 33', 'Tychy', '43-100', 'informacja@tychy.sr.gov.pl', '(32) 323 31 05, 323 31 06', '(32) 219 28 06', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (116, 'Sąd Apelacyjny w Krakowie', 'Przy Rondzie 3', 'Kraków', '31-547', 'sa.krakow@krakow.sa.gov.pl', '(12) 417 54 00', '(12) 417 55 54', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (117, 'Sąd Okręgowy w Kielcach', 'Seminaryjska 12a', 'Kielce', '25-372', 'boi@kielce.so.gov.pl', '(41) 340 23 00', '(41) 340 23 63', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (118, 'Sąd Rejonowy w Busku-Zdroju', 'Kościuszki 5', 'Busko-Zdrój', '28-100 ', 'administracja@busko.sr.gov.pl', '(41) 370 18 15, 370 18 16, 370 18 17', '(41) 246 28 93', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (119, 'Sąd Rejonowy w Jędrzejowie', '11 Listopada 74', 'Jędrzejów', '28-300', 'administracja@jedrzejow.sr.gov.pl', '(41) 386 14 41', '(41) 386 15 56', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (120, 'Sąd Rejonowy w Kielcach', 'Warszawska 44 ', 'Kielce', '25-312', 'poi@kielce.sr.gov.pl', '(41) 349 57 85', '(41) 344 29 35 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (121, 'Sąd Rejonowy w Końskich', 'Iwo Odrowąża 5', 'Końskie', '26-200', 'boi@konskie.sr.gov.pl', '(41) 372 27 02', '(41) 372 27 02 wew. 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (123, 'Sąd Rejonowy w Ostrowcu Świętokrzyskim', 'Kościuszki 1', 'Ostrowiec Świętokrzyski', '27-400', 'poi@ostrowiec.sr.gov.pl', '(41) 246 20 94, 246 20 95, 246 20 96', '(41) 266 45 66 wew. 207', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (124, 'Sąd Rejonowy w Pińczowie', '3 Maja 12a', 'Pińczów', '28-400', 'administracja@pinczow.sr.gov.pl', '(41) 246 22 02', '(41) 24-62-212', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (125, 'Sąd Rejonowy w Sandomierzu', 'Kościuszki 2a', 'Sandomierz', '27-600', 'administracja@sandomierz.sr.gov.pl', '(15) 832 30 62, 832 30 63, 832 30 64', '(15) 832 36 12', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (126, 'Sąd Rejonowy w Skarżysku-Kamiennej', 'Krasińskiego 11', 'Skarżysko-Kamienna', '26-110', 'sad@skarzysko.sr.gov.pl', '(41) 246 24 43, 246 24 44', '(41) 252 03 69', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (127, 'Sąd Rejonowy w Starachowicach', 'Staszica 12 ', 'Starachowice', '27-200', 'administracja@starachowice.sr.gov.pl', '(41) 274 63 29', '(41) 274 63 29', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (128, 'Sąd Rejonowy w Staszowie', 'Kościuszki 2', 'Staszów', '28-200 ', 'boi@staszow.sr.gov.pl', '(15) 864 82 93', '(15) 864 82 52', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (129, 'Sąd Rejonowy we Włoszczowie', 'Kusocińskiego 11', 'Włoszczowa', '29-100', 'boi.wloszczowa@sr.gov.pl', '(41) 394 31 07', '(41) 394 31 07 wew. 317', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (130, 'Sąd Okręgowy w Krakowie', 'Przy Rondzie 7', 'Kraków', '31-547', 'prezes@krakow.so.gov.pl', '(12) 619 50 86, 619 57 70', '(12) 619 59 92', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (131, 'Sąd Rejonowy dla Krakowa-Krowodrzy w Krakowie', 'Przy Rondzie 7', 'Kraków', '31-547', 'sad@krakow-krowodrza.sr.gov.pl', '(12) 619 53 10', '(12) 619 50 30', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (133, 'Sąd Rejonowy dla Krakowa-Podgórza w Krakowie', 'Przy Rondzie 7', 'Kraków', '31-547', 'kontakt@krakow-podgorze.sr.gov.pl', '(12) 619 54 10', '(12) 619 50 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (134, 'Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie', 'Przy Rondzie 7', 'Kraków', '31-547', 'oa_srodmiescie@krakow.so.gov.pl', '(12) 619 50 40', '(12) 619 50 40', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (135, 'Sąd Rejonowy w Chrzanowie', 'Al. Henryka 23', 'Chrzanów', '32-500', 'poi@chrzanow.sr.gov.pl', '(32) 649 40 68', '(32) 649 40 91', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (136, 'Sąd Rejonowy w Miechowie', 'Pl. Kościuszki 3a', 'Miechowo', '32-200', 'boi_miechow@miechow.sr.gov.pl', '(41) 382 50 68', '(41) 382 50 68', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (137, 'Sąd Rejonowy w Myślenicach', 'Piłsudskiego 7', 'Myślenice', '32-400', 'informacja@myslenice.sr.gov.pl', '(12) 373 51 54', '(12) 272 06 15', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (139, 'Sąd Rejonowy w Oświęcimiu ', 'Rynek Gł. 14', 'Oświęcim', '32-600', 'poi@oswiecim.sr.gov.pl', '(33) 847 55 05', '(33) 847 55 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (138, 'Sąd Rejonowy w Olkuszu', 'K. K. Wielkiego 45', 'Olkusz', '32-300', 'poi@olkusz.sr.gov.pl', '(32) 626 11 55', '(32) 626 11 68', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (140, 'Sąd Rejonowy w Suchej Beskidzkiej', 'Mickiewicza 11', 'Sucha Beskidzka', '34-200', 'poi@suchab.sr.gov.pl', '(12) 619 57 70, 619 50 86', '(33) 877 05 48', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (141, 'Sąd Rejonowy w Wadowicach ', 'Żwirki i Wigury 9', 'Wadowice', '34-100', 'poi@wadowice.sr.gov.pl', '(33) 875 70 01', '(33) 823 33 45', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (142, 'Sąd Rejonowy w Wieliczce ', 'Janińska 25', 'Wieliczka', '32-020', 'informacja@wieliczka.sr.gov.pl', '(12) 347 30 10', '(12) 347 30 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (143, 'Sąd Okręgowy w Nowym Sączu', 'Pijarska 3', 'Nowy Sącz', '33-300', 'boi@nowysacz.so.gov.pl', '(18) 448 21 82', '(18) 448 21 92', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (144, 'Sąd Rejonowy w Gorlicach', 'Biecka 5', 'Gorlice', '38-300', 'boi@gorlice.sr.gov.pl', '(18) 355 11 22', '(18) 351 70 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (145, 'Sąd Rejonowy w Nowym Sączu', 'Pijarska  3', 'Nowy Sącz', '33-300', 'sekretariatprezesa@nowysacz.sr.gov.pl', '(18) 440 06 70', '(18) 443 72 10', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (146, 'Sąd Rejonowy w Limanowej', 'Józefa Marka 19', 'Limanowa', '34-600', 'boi@limanowa.sr.gov.pl', '(18) 330 05 80', '(18) 330 05 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (148, 'Sąd Rejonowy w Zakopanem ', 'Gimnazjalna 13', 'Zakopane', '34-500', 'boi@zakopane.sr.gov.pl', '(18) 202 46 85', '(18) 202 46 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (147, 'Sąd Rejonowy w Nowym Targu', 'Ludźmierska 29', 'Nowy Targ', '34-400', 'boi@nowytarg.sr.gov.pl', '(18) 261 26 86', '(18) 266 30 27', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (149, 'Sąd Okręgowy w Tarnowie', 'Dąbrowskiego 27', 'Tarnów', '33-100', 'informacja@tarnow.so.gov.pl', '(14) 688 74 44', '(14) 668 74 17', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (151, 'Sąd Rejonowy w Dąbrowie Tarnowskiej', 'J. Bojki 2', 'Dąbrowa Tarnowska', '33-200', 'informacja@dabrowatar.sr.gov.pl', '(14) 644 41 09', '(14) 644 42 22', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (152, 'Sąd Rejonowy w Bochni', 'Kościuszki 4 ', 'Bochnia', '32-700 ', 'boi@bochnia.sr.gov.pl', '(14) 615 21 00', '(14) 612 42 66', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (153, 'Sąd Rejonowy w Tarnowie', 'Dąbrowskiego 27', 'Tarnów', '33-100', 'informacja@tarnow.so.gov.pl', '(14) 688 74 47', '(14) 688 74 66', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (155, 'Sąd Okręgowy w Lublinie', 'Krakowskie Przedmieście 43', 'Lublin', '20-076', 'boi@lublin.so.gov.pl', '(81) 460 12 03, 460 12 98,460 12 06', '(81) 460 10 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (156, 'Sąd Rejonowy w Białej Podlaskiej', 'Brzeska 20-22', 'Biała Podlaska', '21-500', 'poi@bialapodlaska.sr.gov.pl', '(83) 311 10 95', '(83) 343 63 14', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (157, 'Sąd Rejonowy w Chełmie', 'Al. I Armii Wojska Polskiego 16', 'Chełm', '22-100', 'boi@chelm.sr.gov.pl', '(82) 565 37 45', '(82) 565 37 47', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (158, 'Sąd Rejonowy w Kraśniku', 'Lubelska 81', 'Kraśnik', '23-200', 'krasnik@krasnik.sr.gov.pl', '(81) 825 20 01', '(81) 825 23 78', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (162, 'Sąd Rejonowy w Łukowie', 'Staropijarska 1', 'Łuków', '21-400', 'biuropodawcze@lukow.sr.gov.pl', '(25) 798 23 51', '(25) 798 23 51 wew. 213', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (163, 'Sąd Rejonowy w Opolu Lubelskim', 'Stary Rynek 46 ', 'Opole Lubelskie', '24-300 ', 'administracyjny@opolelubelskie.sr.gov.pl', '(81) 827 28 25', '(81) 827 28 25', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (164, 'Sąd Rejonowy w Puławach', 'Lubelska 7', 'Puławy', '24-100', 'biuro@pulawy.sr.gov.pl', '(81) 886 44 77', '(81) 888 93 06', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (165, 'Sąd Rejonowy w Radzyniu Podlaskim', 'Stefana Kardynała Wyszyńskiego 5', 'Radzyń Podlaski', '21-300', 'boi@radzyn.sr.gov.pl', '(83) 313 30 01', '(83) 313 30 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (166, 'Sąd Rejonowy w Rykach', 'Kościuszki 15', 'Ryki', '08-500', 'bpod@ryki.sr.gov.pl', '(81) 865 60 51', '(81) 865 60 51 wew. 307', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (167, 'Sąd Rejonowy we Włodawie', 'Sejmowa7  ', 'Włoadawa', '22-200', 'sekretariat@wlodawa.sr.gov.pl', '(82) 572 11 15', '(82) 572 11 15', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (168, 'Sąd Okręgowy w Radomiu', 'Piłsudskiego 10', 'Radom', '26-600', 'boi@radom.so.gov.pl', '(48) 368 02 66, 368 02 67, 368 02 68', '(48) 368 02 67', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (171, 'Sąd Rejonowy w Lipsku', 'Partyzantów 1', 'Lipsk', '27-300', 'podawcze@lipsko.sr.gov.pl', '(48) 378 44 60', '(48) 366 16 39', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (170, 'Sąd Rejonowy w Kozienicach', 'Konstytucji 3 Maja 22', 'Kozienice', '26-900', 'biuro@kozienice.sr.gov.pl', '(48) 614 29 13', '(48) 614 29 88', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (169, 'Sąd Rejonowy w Grójcu', 'Sportowa 14', 'Grójec', '05-600', 'poi@grojec.sr.gov.pl', '(48) 664 83 00, 664 83 01, 664 83 02', '(48) 664 84 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (172, 'Sąd Rejonowy w Przysusze', 'Al. Jana Pawła II 11', 'Przysucha', '26-400', 'administracja@przysucha.sr.gov.pl', '(48) 675 03 71', '(48) 675 23 59', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (173, 'Sąd Rejonowy w Radomiu', 'Struga 63', 'Radom', '26-600', 'poi@radom.sr.gov.pl', '(48) 368 04 42, 368 04 44, 368 04 45', '(48) 368 04 44', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (174, 'Sąd Rejonowy w Szydłowcu', 'Pl. Marii Konopnickiej 7', 'Szydłowiec', '26-500', 'administracja@szydlowiec.sr.gov.pl', '(48) 617 87 00', '(48) 617 16 91', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (175, 'Sąd Rejonowy w Zwoleniu', 'Moniuszki 6', 'Zwoleń', '26-700', 'sr@zwolen.sr.gov.pl', '(48) 676 30 51, 676 31 32, 676 46 15', '(48) 676 30 51', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (176, 'Sąd Okręgowy w Siedlcach', 'Sądowa 2', 'Siedlce', '08-100', 'poczta@siedlce.so.gov.pl', '(25) 640 78 00', '(25) 632 68 85', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (177, 'Sąd Rejonowy w Mińsku Mazowieckim', 'Okrzei 14', 'Mińsk Mazowiecki', '05-309', 'boi@minsk-mazowiecki.sr.gov.pl', '(25) 756 49 10', '(25) 756 49 40', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (178, 'Sąd Rejonowy w Węgrowie', 'Przemysłowa 20', 'Węgrów', '07-100', 'poczta@wegrow.sr.gov.pl', '(25) 792 22 31', '(25) 792 22 31 wew. 360', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (180, 'Sąd Rejonowy w Sokołowie Podlaskim', 'ks Bosco 3', 'Sokołów Podlaski', '08-300', 'biuro.podawcze@sokolow-podlaski.sr.gov.pl', '(25) 787 23 22', '(25) 787 23 94 wew. 134', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (181, 'Sąd Rejonowy w Siedlcach', 'Bpa. I. Świrskiego 17', 'Siedlce', '08-110', 'srsiedlce@siedlce.sr.gov.pl', '(25) 632 23 27', '(25) 632 23 27', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (182, 'Sąd Okręgowy w Zamościu', 'Akademicka 1', 'Zamość', '22-400', 'biuro@zamosc.so.gov.pl', '(84) 638 78 21', '(84) 638 78 21', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (183, 'Sąd Rejonowy w Biłgoraju', 'Kościuszki  29', 'Biłgoraj', '23-400', 'adm@bilgoraj.sr.gov.pl', '(84) 685 09 01, 685 09 02 ', '(84) 685 08 08', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (184, 'Sąd Rejonowy w Hrubieszowie', 'Dobrzańskiego "Hubala" 7', 'Hrubieszów', '22-500', 'administracja@hrubieszow.sr.gov.pl', '(84) 696 40 42', '(84) 696 40 42', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (185, 'Sąd Rejonowy w Janowie Lubelskim ', 'Zamoyskiego 94', 'Janów Lubelski', '23-300', 'administracja@janowlubelski.sr.gov.pl', '(15) 872 00 50, 872 04 49', '(15) 872 04 06', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (187, 'Sąd Rejonowy w Tomaszowie Lubelskim', 'Lwowska 55', 'Tomaszów Lubelski', '22-600', 'administracja@tomaszowlub.sr.gov.pl', '(84) 665 74 31', '(84) 665 74 90', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (186, 'Sąd Rejonowy w Krasnymstawie', 'Poniatowskiego 31', 'Krasnystaw', '22-300', 'poczta@krasnystaw.sr.gov.pl', '(82) 576 28 01', '(82) 576 33 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (190, 'Sąd Okręgowy w Kaliszu', 'Al. Wolności 13', 'Kalisz', '62-800', 'biuro_obslugi@kalisz.so.gov.pl', '(62) 765 78 11', '(62) 594 45 31', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (188, 'Sąd Rejonowy w Zamosciu', 'Akademicka 1', 'Zamość', '22-400', 'biuro@zamosc.sr.gov.pl', '(84) 638 29 01', '(84) 639 29 77', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (191, 'Sąd Rejonowy w Kaliszu', 'Al. Wolności 13', 'Kalisz', '62-800', 'boi@kalisz.sr.gov.pl', '(62) 765 79 26', '(62) 597 72 81', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (192, 'Sąd Rejonowy w Ostrowie Wielkopolskim', 'Sądowa 1', 'Ostrów Wielkopolski', '63-400', 'poi@ostrow.sr.gov.pl', '(62) 592 61 79', '(62) 592 83 60', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (193, 'Sąd Rejonowy w Jarocinie', 'Al. Niepodległości 15', 'Jarocin', '63-200', 'administracja@jarocin.sr.gov.pl', '(62) 505 29 60', '(62) 594 45 60', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (194, 'Sąd Rejonowy w Pleszewie', 'Malińska 21', 'Pleszew', '63-300', 'administracja@pleszew.sr.gov.pl', '(62) 742 06 98', '(62) 594 45 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (195, 'Sąd Rejonowy w Kępnie', 'Al. Marcinkowskiego 10', 'Kępno', '63-600', 'boi@kepno.sr.gov.pl', '(62) 782 72 84', '(62) 594 45 82', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (196, 'Sąd Rejonowy w Ostrzeszowie', 'Zamkowa 9 A', 'Ostrzeszów', '63-500', 'bpodawcze@ostrzeszow.sr.gov.pl', '(62) 732 27 20', '(62) 594 45 90', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (197, 'Sąd Rejonowy w Krotoszynie', 'Sienkiewicza 11', 'Krotoszyn', '63-700', 'administracja@krotoszyn.sr.gov.pl', '(62) 725 11 00', '(62) 594 45 72', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (198, 'Sąd Okręgowy w Łodzi', 'Pl. Dąbrowskiego 5', 'Łódź', '90-921', 'boi@lodz.so.gov.pl', '(42) 677 89 00', '(42) 685 05 08', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (199, 'Sąd Rejonowy w Kutnie', 'Spokojna 2', 'Kutno', '99-300', 'boi@kutno.sr.gov.pl', '(24) 251 13 50', '(24) 387 37 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (200, 'Sąd Rejonowy w Łowiczu', 'Kaliska 1/3', 'Łowicz', '99-400', 'boi@lowicz.sr.gov.pl', '(46) 830 43 10', '(46) 811 27 90', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (202, 'Sąd Rejonowy w Pabianicach', 'Partyzancka 105/127', 'Pabianice', '95-200', 'boi@pabianice.sr.gov.pl', '(42) 225 51 83, 225 51 26', '(42) 209 11 44', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (203, 'Sąd Rejonowy w Skierniewicach', 'Reymonta 12/14', 'Skierniewice', '96-100', 'boi@skierniewice.sr.gov.pl', '(46) 834 49 40', '(46) 811 22 95', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (159, 'Sąd Rejonowy w Lubartowie', 'Lubelska 57', 'Lubartów', '21-100', 'adm@lubartow.sr.gov.pl', '(81) 852 68 00', '(81) 855 24 47', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (205, 'Sąd Rejonowy dla Łodzi-Śródmieścia w Łodzi', 'Al. Kościuszki 107/109', 'Łódź', '90-928', 'boi@lodz.sr.gov.pl', '(42) 664 09 00', '(42) 664 07 23', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (206, 'Sąd Rejonowy w Brzezinach', 'Waryńskiego 32', 'Brzeziny', '95-060', 'boi@brzeziny.sr.gov.pl', '(46) 875 51 41, 875 21 51', '(46) 811 27 80', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (207, 'Sąd Rejonowy dla Łodzi-Widzewa w Łodzi', 'Al. Piłsudskiego 143', 'Łódź', '92-332', 'prezes@widzew.sr.gov.pl', '(42) 677 47 26', '(42) 288 42 30', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (208, 'Sąd Rejonowy w Rawie Mazowieckiej ', 'Kościuszki 17', 'Rawa Mazowiecka', '96-200', 'boi@rawa.sr.gov.pl', '(46) 813 19 15', '(46) 811 22 96', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (210, 'Sąd Rejonowy w Bełchatowie', 'Okrzei 4', 'Bełchatów', '97-400', 'biuro.podawcze@belchatow.sr.gov.pl', '(44) 635 76 06 ', '(44) 741 57 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (209, 'Sąd Okręgowy w Piotrkowie Trybunalskim', 'Słowackiego 5', 'Piotrków Trybunalski', '97-300', 'boi@piotrkow-tryb.so.gov.pl', '(44) 649 41 80', '(44) 647 89 19', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (211, 'Sąd Rejonowy w Opocznie', 'Biernackiego 20', 'Opoczno', '26-300', 'informacja@opoczno.sr.gov.pl', '(44) 755 71 07 ', '(44) 741 57 00', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (213, 'Sąd Rejonowy w Radomsku ', 'Tysiaclecia 3', 'Radomsko', '97-500', 'administracja@radomsko.sr.gov.pl', '(44) 685 81 31', '(44) 685 81 77', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (214, 'Sąd Rejonowy w Tomaszowie Mazowieckim', 'Prez. I. Mościckiego 9', 'Tomaszów Mazowiecki', '97-200', 'boi@tomaszow-maz.sr.gov.pl', '(44) 725 75 08, 725 75 09', '(44) 725 75 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (215, 'Sąd Okręgowy w Płocku', 'Pl. Narutowicza 4', 'Płock', '09-404', 'sekretariat.prezesa@plock.so.gov.pl', '(24) 269 72 13', '(24) 262 25 26', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (216, 'Sąd Rejonowy w Płocku', 'Pl. Narutowicza 6', 'Płock', '09-404', 'biuropodawcze@plock.sr.gov.pl', '(24) 269 74 00', '(24) 262 63 38', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (217, 'Sąd Rejonowy w Ciechanowie ', 'Mikołajczyka 5', 'Ciechanów', '06-400', 'podawcze@ciechanow.sr.gov.pl', '(23) 674 17 70', '(23) 674 17 17', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (218, 'Sąd Rejonowy w Gostyninie', '3-go Maja 43', 'Gostynin', '09-500', 'boi@gostynin.sr.gov.plk', '(24) 236 08 56', '(24) 236 08 30', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (219, 'Sąd Rejonowy w Mławie ', 'Reymonta 3', 'Mława', '06-500', 'boi@mlawa.sr.gov.pl', '(23) 654 89 06', '(23) 654 89 06 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (220, 'Sąd Rejonowy w Sochaczewie', '1 Maja 7', 'Sochaczew', '96-500', 'biuro.podawcze@sochaczew.sr.gov.pl', '(46) 862 32 64', '(46) 862 22 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (221, 'Sąd Rejonowy w Płońsku', 'Henryka Sienkiewicz 9a', 'Płońsk', '09-100', 'boi@plonsk.sr.gov.pl', '(23) 661 37 10', '(23) 661 37 28', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (222, 'Sąd Rejonowy w Sierpcu', 'Wiosny Ludów 1', 'Sierpc', '09-200', 'administracja@sierpc.sr.gov.pl', '(24) 275 22 93', '(24) 275 22 93 wew. 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (223, 'Sąd Rejonowy w Żyrardowie', 'Al. Partyzantów 3', 'Żyrardów', '96-300', 'poi@zyrardow.sr.gov.pl ', '(46) 854 31 41', '(46) 854 31 42 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (224, 'Sąd Okręgowy w Sieradzu', 'Al. Zwycięstwa 1', 'Sieradz', '98-200', 'boi@sieradz.so.gov.pl', '(43) 826 66 09', '(43) 656 89 75', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (225, 'Sąd Rejonowy w Sieradzu ', 'Al. Zwycięstwa 1', 'Sieradz', '98-200', 'boi@sieradz.sr.gov.pl', '(43) 826 67 09', '(43) 656 96 22', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (226, 'Sąd Rejonowy w Łasku', 'Kolejowa 12', 'Łask', '98-100', 'administracja@lask.sr.gov.pl', '(43) 676 85 00', '(43) 656 89 81', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (227, 'Sąd Rejonowy w Wieluniu', 'Pl. Jagielloński 1', 'Wieluń', '98-300', 'poi@wielun.sr.gov.pl', '(43) 842 01 03', '(43) 656 89 70', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (229, 'Sąd Apelacyjny w Poznaniu', 'Trójpole 21', 'Poznań', '61-693', 'informacja@poznan.sa.gov.pl', '(61) 827 45 63', '(61) 827 45 62', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (230, 'Sąd Okręgowy w Koninie', 'Energetyka  5', 'Konin', '62-510', 'poi@konin.so.gov.pl', '(63) 242 30 22', '(63) 242 30 22 wew. 301', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (231, 'Sąd Rejonowy w Koninie', 'Fryderyka Chopina 28', 'Konin', '62-510', 'boi@konin.sr.gov.pl', '(63) 240 47 46', '(63) 270 88 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (232, 'Sąd Rejonowy w Kole', 'Włocławska 4', 'Koło', '62-600', 'bp@kolo.sr.gov.pl', '(63) 272 15 01', '(63) 272 08 52', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (233, 'Sąd Rejonowy w Słupcy', 'Armii Krajowej 2', 'Słupca', '62-400', 'biuropodawcze@slupca.sr.gov.pl', '(63) 275 21 91', '(63) 275 21 91 wew. 68', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (234, 'Sąd Rejonowy w Turku', 'Legionów Polskich 4', 'Turek', '62-700', 'bpodawcze@turek.sr.gov.pl', '(63) 278 57 60', '(63) 289 15 82', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (235, 'Sąd Okręgowy w Poznaniu', 'Hejmowskiego 2', 'Poznań', '61-736', 'informacja@poznan.so.gov.pl', '(61) 628 31 00 ', '(61) 628 30 99', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (237, 'Sąd Rejonowy w Gnieźnie ', 'Franciszkańska 9/10', 'Gniezno', '62-200 ', 'boi@gniezno.sr.gov.pl', '(61) 423 93 60, 423 93 61', '(61) 426 10 34', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (236, 'Sąd Rejonowy w Chodzieży', 'Krasińskiego 10', 'Chodzież', '64-800', 'admnistracja@chodziez.sr.gov.pl', '(67) 356 77 00', '(67) 356 77 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (238, 'Sąd Rejonowy w Gostyniu ', 'Sądowa 1', 'Gostyń', '63-800', 'biuro_podawcze@gostyn.sr.gov.pl', '(65) 521 44 08, 521 44 09', '(65) 572 71 81', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (239, 'Sąd Rejonowy w Grodzisku Wielkopolskim', 'Żwirki i Wigury nr 3', 'Grodzisk Wielkopolski', '62-065', 'poi@grodziskwlkp.sr.gov.pl', '(61) 628 48 09', '(61) 444 49 31', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (240, 'Sąd Rejonowy w Kościanie', 'Pl. Niezłomnych 2', 'Kościan', '64-000', 'biuro.podawcze@koscian.sr.gov.pl', '(65) 521 45 46', '(65) 521 45 45', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (241, 'Sąd Rejonowy w Lesznie', 'Dąbrowskiego 2', 'Leszno', '64-100', 'boi@leszno.sr.gov.pl', '(65) 529 54 03', '(65) 525 94 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (243, 'Sąd Rejonowy w Obornikach', 'Piłsudskiego 47', 'Oborniki', '64-600 ', 'adm@oborniki.sr.gov.pl', '(61) 628 48 77', '(61) 628 48 78', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (244, 'Sąd Rejonowy w Pile', 'Al. Powstańców Wlkp.  79', 'Piła', '64-920', 'info@pila.sr.gov.pl', '(67) 352 29 28', '(67) 352 29 08', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (245, 'Sąd Rejonowy Poznań-Grunwald i Jeżyce w Poznaniu', 'Kamiennogórska 26', 'Poznań', '60-179', 'prezes@poznan-grunwald.sr.gov.pl', '(61) 658 50 70', '(61) 628 97 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (246, 'Sąd Rejonowy Poznań-Nowe Miasto i Wilda w Poznaniu', 'Al. Marcinkowskiego 32', 'Poznań', '61-745', 'boi@poznan-nowemiasto.sr.gov.pl ', '(61) 640 90 00', '(61) 647 36 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (247, 'Sąd Rejonowy Poznań-Stare Miasto w Poznaniu', 'Młyńska 1a', 'Poznań', '61-729', 'informacja@poznan-staremiasto.sr.gov.pl', '(61) 666 08 50', '(61) 468 25 12', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (248, 'Sąd Rejonowy w Rawiczu', 'Ignacego Buszy nr 1', 'Rawicz', '63-900', 'biuro.podawcze@rawicz.sr. gov.pl', '(65) 521 44 51', '(65) 546 10 97', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (249, 'Sąd Rejonowy w Szamotułach', 'Al. 1 Maja 5A', 'Szamotuły', '64-500', 'poi@szamotuly.sr.gov.pl', '(61) 292 19 13', '(61) 292 00 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (250, 'Sąd Rejonowy w Śremie', 'Franciszkańska 4', 'Śrem', '63-100', 'administracja@srem.sr.gov.pl', '(61) 282 14 65', '(61) 282 14 69', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (251, 'Sąd Rejonowy w Środzie Wielkopolskiej', 'Stary Rynek 6', 'Środa Wielkopolska', '63-000', 'administracja@srodawlkp.sr.gov.pl', '(61) 629 49 10', '(61) 628 49 48', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (252, 'Sąd Rejonowy w Trzciance', 'Staszica 1', 'Trzcianka', '64-980', 'biuropodawcze@trzcianka.sr.gov.pl', '(67) 216 20 02', '(67) 216 20 02 wew. 65', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (253, 'Sąd Rejonowy w Wągrowcu ', 'Kościuszki 18 ', 'Wągrowiec', '62-100', 'poi@wagrowiec.sr.gov.pl ', '(67) 268 18 01', '(67) 268 18 08 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (255, 'Sąd Rejonowy we Wrześni', 'Jana Pawła II 10', 'Września', '62-300', 'administracja@wrzesnia.sr.gov.pl', '(61) 436 90 02', '(61) 436 90 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (256, 'Sąd Rejonowy w Złotowie ', 'Konopnickiej 15', 'Złotów', '77-400', 'biuropodawcze@zlotow.sr.gov.pl', '(67) 264 28 00', '(67) 264 28 95', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (257, 'Sąd Okręgowy w Zielonej Górze', 'Pl. Słowiański 1', 'Zielona Góra', '65-069', 'boi@zielona-gora.so.gov.pl ', '(68) 322 01 52', '(68) 322 01 52', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (259, 'Sąd Rejonowy w Nowej Soli', 'Piłsudskiego 24 ', 'Nowa Sól', '67-100 ', 'sekretariat@nowa-sol.sr.gov.pl', '(68) 356 97 00', '(68) 356 97 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (260, 'Sąd Rejonowy w Świebodzinie', 'Park Chopina 3', 'Świebodzin', '66-200', 'administracja@swiebodzin.sr.gov.pl', '(68) 381 91 21', '(68) 381 94 59', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (262, 'Sąd Rejonowy w Zielonej Górze', 'Pl. Słowiański 2', 'Zielona Góra', '65-069', 'informacja@zielona-gora.sr.gov.pl', '(68) 322 03 10, 322 03 78   ', '(68) 322 03 17', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (261, 'Sąd Rejonowy we Wschowie', 'Plac Kosynierów 1C', 'Wschowa', '67-400 ', 'podawcze@wschowa.sr.gov.pl', '(65) 540 15 01', '(65) 540 84 14', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (263, 'Sąd Rejonowy w Żaganiu', 'Szprotawska 3', 'Żagań', '68-100', 'biuro.podawcze@zagan.sr.gov.pl', '(68) 478 49 34', '(68) 478 49 34', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (264, 'Sąd Rejonowy w Żarach', 'Podwale 2', 'Żary', '68-200', 'srzary@zary.sr.gov.pl', '(68) 363 53 00', '(68) 419 83 21', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (265, 'Sąd Apelacyjny w Rzeszowie ', 'Al. Piłsudskiego 28', 'Rzeszów', '35-001', 'boi@rzeszow.sa.gov.pl ', '(17) 858 02 63', '(17) 858 02 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (266, 'Sąd Okręgowy w Przemyślu', 'Konarskiego 6', 'Przemyśl', '37-700', 'punkt@przemysl.so.gov.pl', '(16) 676 13 01, 676 13 02', '(16) 676 13 53', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (267, 'Sąd Rejonowy w Jarosławiu', 'Jana Pawła II 11', 'Jarosławiec', '37-500', 'sad@jaroslaw.sr.gov.pl', '(16) 621 40 24', '(16) 621 23 83', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (268, 'Sąd Rejonowy w Przeworsku', 'Lwowska 9', 'Przeworsk', '37-200', 'bp.przeworsk@przeworsk.sr.gov.pl', '(16) 649 08 10', '(16) 649 08 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (269, 'Sąd Rejonowy w Lubaczowie', 'Mickiewicza 24', 'Lubaczów', '37-600', 'sad@lubaczow.sr.gov.pl', '(16) 632 50 64', '(16) 632 50 64', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (270, 'Sąd Rejonowy w Przemyślu', 'Mickiewicza 14', 'Przemyśl', '37-700', 'podawcze@przemysl.sr.gov.pl', '(16) 679 45 33', '(16) 678 36 97', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (271, 'Sąd Okręgowy w Krośnie', 'Sienkiewicza 12', 'Krosno', '38-400', 'poi@krosno.so.gov.pl', '(13) 437 36 38', '(13) 432 05 70', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (272, 'Sąd Rejonowy w Brzozowie', '3-go Maja 2 a', 'Brzozów', '36-200', 'administracja@brzozow.sr.gov.pl', '(13) 434 12 67', '(13) 434 09 19', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (273, 'Sąd Rejonowy w Jaśle', 'Armii Krajowej 3', 'Jasło', '38-200', 'administracja@jaslo.sr.gov.pl', '(13) 446 20 80', '(13) 446 70 62', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (274, 'Sąd Rejonowy w Krośnie', 'Sienkiewicza  12', 'Krosno', '38-400', 'adm@krosno.sr.gov.pl ', '(13) 437 56 00', '(13) 432 13 19', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (276, 'Sąd Rejonowy w Sanoku', 'Kościuszki 5', 'Sanok', '38-500', 'poi@sanok.sr.gov.pl', '(13) 465 67 87', '(13) 465 67 22', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (277, 'Sąd Okręgowy w Rzeszowie', 'Pl. Śreniawitów 3', 'Rzeszów', '35-959', 'boi1@rzeszow.so.gov.pl', '(17) 875 62 07', '(17) 862 72 65', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (278, 'Sąd Rejonowy w Ropczycach', 'Słowackiego 7', 'Ropczyce', '39-100', 'sekretariat@ropczyce.sr.gov.pl', '(17) 222 03 00', '(17) 222 03 59', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (279, 'Sąd Rejonowy w Leżajsku', 'Mickiewicza 47 ', 'Leżajsk', '37-300', 'sekretariat@lezajsk.sr.gov.pl', '(17) 240 53 00', '(17) 240 53 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (280, 'Sąd Rejonowy w Łańcucie', 'Grunwaldzka 10 ', 'Łańcut', '37-100', 'sekretariat@lancut.sr.gov.pl', '(17) 224 23 00, 224 23 01', '(17) 224 23 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (281, 'Sąd Rejonowy w Dębicy', 'Słoneczna 3', 'Dębica', '39-200', 'boi@debica.sr.gov.pl', '(14) 680 76 70', '(14) 680 76 27', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (282, 'Sąd Rejonowy w Rzeszowie', 'gen. J. Kustronia 4', 'Rzeszów', '35-303', 'boi@rzeszow.sr.gov.pl', '(17) 715 24 00', '(17) 715 24 83', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (283, 'Sąd Rejonowy w Strzyżowie', '3 Maja 14', 'Strzyżów', '38-100', 'sekretariat@strzyzow.sr.gov.pl', '(17) 272 81 00', '(17) 276 11 70', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (284, 'Sąd Okręgowy w Tarnobrzegu', 'Sienkiewicza 27', 'Tarnobrzeg', '39-400', 'boi@tarnobrzeg.so.gov.pl', '(15) 688 25 17', '(15) 688 26 78', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (285, 'Sąd Rejonowy w Nisku', 'Pl. Wolności 14', 'Nisko', '37-400', 'boi@nisko.sr.gov.pl', '(15) 841 20 48', '(15) 841 28 45', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (286, 'Sąd Rejonowy w Mielcu', 'Kościuszki 15', 'Mielec', '39-300', 'administracja@mielec.sr.gov.pl ', '(17) 582 04 01', '(17) 582 04 30', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (288, 'Sąd Rejonowy w Tarnobrzegu', 'Sienkiewicza 27', 'Tarnobrzeg', '39-400', 'sekretariat@tarnobrzeg.sr.gov.pl', '(15) 688 25 14, 688 25 15, 688 25 16', '(15) 688 27 12', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (289, 'Sąd Rejonowy w Kolbuszowej', 'Tyszkiewiczów 4', 'Kolbuszowa', '36-100', 'boi@kolbuszowa.sr.gov.pl', '(17) 227 72 00, 227 72 17', '(17) 227-72-02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (290, 'Sąd Apelacyjny w Szczecinie ', 'Mickiewicza 163 ', 'Szczecin', '71-165', 'sekretariat@szczecin.sa.gov.pl', '(91) 484 94 87', '(91) 484 94 86', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (291, 'Sąd Okręgowy w Szczecinie', 'Kaszubska 42', 'Szczecin', '70-952', 'boi@szczecin.so.gov.pl', '(91) 448 00 02', '(91) 483 84 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (293, 'Sąd Rejonowy Szczecin-Prawobrzeże i Zachód w Szczecinie', 'Pl. Żołnierza Polskiego 16', 'Szczecin', '70-551', 'boi@szczecin-pz.sr.gov.pl', '(91) 460 35 33', '(91) 460 35 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (292, 'Sąd Rejonowy w Gryficach', 'Wysoka Brama 2', 'Gryfice', '72-300', 'mbujak@gryfice.sr.gov.pl', '(91) 386 68 01', '(91) 386 68 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (294, 'Sąd Rejonowy Szczecin-Centrum w Szczecinie', 'Kaszubska 42', 'Szczecin', '70-227', 'boi@szczecin-centrum.sr.gov.pl', '(91) 485 55 42', '(91) 485 55 20', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (295, 'Sąd Rejonowy w Świnoujściu', 'Paderewskiego 6', 'Świnoujście', '72-600', 'boi@swinoujscie.sr.gov.pl', '(91) 326 28 70', '(91) 327 98 57', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (296, 'Sąd Rejonowy w Stargardzie', 'Wojska Polskiego 17-19', 'Stargard', '73-110', 'sekretariat@stargard.sr.gov.pl', '(91) 578 74 31', '(91) 578 74 78', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (297, 'Sąd Rejonowy w Myśliborzu', 'Niedziałkowskiego 6', 'Myślibórz', '74-300', 'sr.mysliborz@mysliborz.sr.gov.pl', '(95) 747 34 46', '(95) 747 94 75', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (299, 'Sąd Rejonowy w Gryfinie', 'Grunwaldzka 2', 'Gryfino', '74-100', 'administracja@gryfino.sr.gov.pl', '(91) 420 03 07', '(91) 420 03 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (300, 'Sąd Rejonowy w Łobzie', 'Niepodległości 15', 'Łobez', '73-150', 'hbobko@lobez.sr.gov.pl', '(91) 397 06 31', '(91) 397 06 32', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (301, 'Sąd Rejonowy w Kamieniu Pomorskim', 'Kościuszki 13', 'Kamień Pomorski', '72-400', 'sekretariat@kamien.sr.gov.pl', '(91) 382 57 80', '(91) 382 57 20', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (302, 'Sąd Rejonowy w Choszcznie', 'Wolności 14', 'Choszczno', '73-200', 'sekretariat@choszczno.sr.gov.pl', '(95) 765 70 69', '(95) 765 70 69 wew.13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (303, 'Sąd Okręgowy w Koszalinie', 'Waryńskiego 7', 'Koszalin', '75-541', 'boi@koszalin.so.gov.pl', '(94) 342 88 71', '(94) 342 88 70', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (304, 'Sąd Rejonowy w Koszalinie', 'Andersa 34', 'Koszalin', '75-626', 'informacja@koszalin.sr.gov.pl', '(94) 317 02 21, 342 86 28', '(94) 317 02 62', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (306, 'Sąd Rejonowy w Wałczu', 'Sądowa 2', 'Wałcz', '78-600', 'boi@walcz.sr.gov.pl', '(67) 250 19 46', '(67) 250 19 52', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (307, 'Sąd Rejonowy w Białogardzie', 'Lipowa 1 ', 'Białogard', '78-200', 'o.administracyjny@bialogard.sr.gov.pl', '(94) 312 01 10', '(94) 312 01 80', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (308, 'Sąd Rejonowy w Drawsku Pomorskim', 'Jasna 3', 'Drawsko Pomorskie', '78-500', 'poi@drawsko-pom.sr.gov.pl', '(94) 363 64 86, 363 64 60', '(94) 363 64 61', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (309, 'Sąd Rejonowy w Szczecinku', 'Bohaterów Warszawy 42', 'Szczecinek', '78-400', 'boi@szczecinek.sr.gov.pl', '(94) 373 08 00', '(94) 373 08 05', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (311, 'Sąd Okręgowy w Gorzowie Wielkopolskim', 'Mieszka I 33', 'Gorzów Wielkopolski', '66-400', 'sekretariat@gorzow-wlkp.so.gov.pl', '(95) 725 67 00', '(95) 725 67 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (312, 'Sąd Rejonowy w Gorzowie Wielkopolskim', 'Chopina 52 blok 10', 'Gorzów Wielkopolski', '66-400', 'boi@gorzow-wlkp.sr.gov.pl', '(95) 725 65 84', '(95) 725 65 82', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (313, 'Sąd Rejonowy w Słubicach', 'Bohaterów Warszawy 3B', 'Słubice', '69-100', 'sekretariat@slubice.sr.gov.pl', '(95) 750 70 03', '(95) 750 01 35', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (314, 'Sąd Rejonowy w Strzelcach Krajeńskich', 'Rynek 2-3', 'Strzelce Krajeńskie', '66-500', 'informacja@strzelce-kraj.sr.gov.pl', '(95) 763 09 30', '(95) 715 16 06', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (315, 'Sąd Rejonowy w Sulęcinie', 'Kościuszki 30', 'Sulęciin', '69-200', 'boi@sulecin.sr.gov.pl', '(95) 755 48 24, 755 48 25, 755 48 26', '(95) 755 07 60', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (316, 'Sąd Rejonowy w Międzyrzeczu', 'Wojska Polskiego 1', 'Międzyrzecz', '66-300', 'info@miedzyrzecz.sr.gov.pl', '(95) 742 40 09', '(95) 742 40 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (317, 'Sąd Apelacyjny w Warszawie', 'Pl.Krasińskich 2/4/6', 'Warszawa', '00-207', 'boi@waw.sa.gov.pl', '(22) 530 88 88', '(22) 530 90 57', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (318, 'Sąd Okręgowy w Warszawie', 'Al. Solidarności 127', 'Warszawa', '00-898', 'boi@warszawa.so.gov.pl', '(22) 440 80 00', '(22) 440 10 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (319, 'Sąd Rejonowy dla m.st. Warszawy w Warszawie', 'Marszałkowska 82', 'Warszawa', '00-517', 'srmstwar@warszawa.so.gov.pl', '(22) 553 97 80', '(22) 553 97 83', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (321, 'Sąd Rejonowy dla Warszawy-Żoliborza w Warszawie', 'Kocjana 3', 'Warszawa', '01-473', 'boi@srzoliborz.pl', '(22) 328 60 30, 328 60 31, 328 60 32', '(22) 328 62 29', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (322, 'Sąd Rejonowy dla Warszawy-Mokotowa w Warszawie', 'Ogrodowa 51a', 'Warszawa', '00-873', 'boi@mokotow.sr.gov.pl', '(22) 501 97 20, 501 97 21, 501 97 22', '(22) 620 34 45', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (323, 'Sąd Rejonowy dla Warszawy-Woli w Warszawie', 'Kocjana 3 ', 'Warszawa', '01-473 ', 'boi@warszawa-wola.sr.gov.pl', '(22) 328 60 20, 328 60 21, 328 60 22', '(22) 328 62 28', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (327, 'Sąd Okręgowy Warszawa-Praga w Warszawie', 'Al. Solidarności 127', 'Warszawa', '00-898', 'sekr.prezesa@warszawapraga.so.gov.pl', '(22) 440 70 53', '(22) 440 31 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (331, 'Sąd Rejonowy dla Warszawy Pragi-Południe w Warszawie ', 'Terespolska 15a', 'Warszawa', '03-813', 'adm_srppd@warszawapraga.so.gov.pl', '(22) 509 16 74, 509 18 08', '(22) 509 11 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (332, 'Sąd Rejonowy dla Warszawy Pragi-Północ w Warszawie', 'Terespolska 15a', 'Warszawa', '03-813', 'sekretariat.prezesa@srpragapolnoc.pl ', '(22) 509 15 01', '(22) 509 11 60', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (325, 'Sąd Rejonowy w Piasecznie', 'Kościuszki 14', 'Piaseczno', '05-500', 'boi@piaseczno.sr.gov.pl', '(22) 703 78 97, 703 79 04', '(22) 703 79 07', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (324, 'Sąd Rejonowy w Grodzisku Mazowieckim', 'Bartniaka 21/23', 'Grodzisk Mazowiecki', '05-825', 'boi@grodzisk.sr.gov.pl', '(22) 770 92 31', '(22) 770 92 58', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (326, 'Sąd Rejonowy w Pruszkowie', 'Kraszewskiego 22', 'Pruszków', '05-800', 'boi@warszawa.so.gov.pl', '(22) 733 41 00', '(22) 733 41 69', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (328, 'Sąd Rejonowy w Legionowie', 'Sobieskiego 47', 'Legionowo', '05-118', 'administracja@legionowo.sr.gov.pl', '(22) 782 36 01', '(22) 782 36 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (329, 'Sąd Rejonowy w Nowym Dworze Mazowieckim', 'Słowackiego 19', 'Dwór Mazowiecki', '05-100 ', 'srndwormaz@warszawapraga.sr.gov.pl', '(22)  732 50 04', '(22) 732 50 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (330, 'Sąd Rejonowy w Otwocku', 'Armii Krajowej 2', 'Otwock', '05-400', 'boi@otwock.sr.gov.pl', '(22) 778 20 50', '(22) 778 20 51', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (334, 'Sąd Apelacyjny we Wrocławiu', 'Energetyczna 4', 'Wrocław', '53-330 ', 'boi@wroclaw.sa.gov.pl', '(71) 798 77 99 ', '(71) 798 77 14 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (335, 'Sąd Okręgowy w Jeleniej Górze', 'Wojska Polskiego 56', 'Jelenia Góra', '58-500', 'p.informacyjny@jelenia-gora.so.gov.pl ', '(75) 641 52 51, 641 52 52', '(75) 641 52 53', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (337, 'Sąd Rejonowy w Lubaniu', 'Pl. 3-go Maja 12', 'Lubań', '59-800', 'p.informacyjny@luban.sr.gov.pl', '(75) 646 46 21', '(75) 646 46 11', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (336, 'Sąd Rejonowy w Jeleniej Górze', 'Mickiewicza 21', 'Jelenia Góra', '58-500', 'poi@jelenia-gora.sr.gov.pl', '(75) 671 28 30', '(75) 671 28 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (338, 'Sąd Rejonowy w Lwówku Śląskim', 'Jaśkiewicza 12', 'Lwówek Śląski', '59-600', 'biuro.podawcze@lwowekslaski.sr.gov.pl', '(75) 646 94 50', '(75) 646 94 80', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (339, 'Sąd Rejonowy w Zgorzelcu', 'Poniatowskiego 2', 'Zgorzelec', '59-900', 'poi@zgorzelec.sr.gov.pl', '(75) 645 69 31', '(75) 645 69 62', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (340, 'Sąd Rejonowy w Kamiennej Górze', 'Wojska Polskiego', 'Kamienna Góra', '58-400', 'srkg@kamienna-gora.sr.gov.pl', '(75) 671 24 01', '(75) 671 24 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (341, 'Sąd Rejonowy w Bolesławcu', 'Sądowa 1', 'Bolesławiec', '59-700', 'poi@boleslawiec.sr.gov.pl', '(75) 646 95 50', '(75) 646 95 34', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (342, 'Sąd Okręgowy w Legnicy', 'Złotoryjska 40', 'Legnica', '59-220', 'boi@legnica.so.gov.pl', '(76) 754 51 60, 754 51 62', '(76) 754 50 99', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (343, 'Sąd Rejonowy w Legnicy', 'Złotoryjska 19', 'Legnica', '59-220', 'oddzial.administracyjny@legnica.sr.gov.pl', '(76) 754 47 40', '(76) 754 47 41', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (344, 'Sąd Rejonowy w Głogowie', 'St. Kutrzeby 2', 'Głogów', '67-200', 'boi@glogow.sr.gov.pl', '(76) 754 52 40', '(76) 754 52 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (345, 'Sąd Rejonowy w Jaworze', 'Klasztorna 5', 'Jawor', '59-400', 'sr.jawor@jawor.gov.pl', '(76) 754 40 01', '(76) 870 28 85', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (346, 'Sąd Rejonowy w Lubinie', 'Wrocławska 3', 'Lubin', '59-300', 'boi@lubin.sr.gov.pl', '(76) 754 42 10', '(76) 754 42 11', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (348, 'Sąd Okręgowy w Opolu', 'Pl. Daszyńskiego 1', 'Opole', '45-064', 'boi@opole.so.gov.pl', '(77) 541 81 05, 541 81 90', '(77) 541 81 09', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (349, 'Sąd Rejonowy w Strzelcach Opolskich ', 'Opolska 11', 'Strzelce Opolskie', '47-100', 'boi@strzelce.sr.gov.pl', '(77) 463 11 87, 463 11 77, 463 11 88', '(77) 463 11 95', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (350, 'Sąd Rejonowy w Kędzierzynie-Koźlu', 'Żeromskiego 5', 'Kędzierzyn-Koźle', '47-200', 'podawcze@kozle.sr.gov.pl', '(77) 405 30 01, 405 31 99', '(77) 405 30 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (351, 'Sąd Rejonowy w Opolu', 'Ozimska 60a ', 'Opole', '45-368 ', 'sr@opole.sr.gov.pl', '(77) 541 54 01, 541 54 08, 541 54 07', '(77) 453 19 17', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (352, 'Sąd Rejonowy w Oleśnie ', 'Sądowa 3', 'Oleśno', '46-300', 'boi@olesno.sr.gov.pl', '(34) 359 69 01', '(34) 359 69 26', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (353, 'Sąd Rejonowy w Kluczborku', 'Katowicka 2', 'Kluczbork', '46-200 ', 'administracja@kluczbork.sr.gov.pl', '(77) 447 16 69', '(77) 447 16 69 wew. 9', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (9, 'Sąd Rejonowy w Przasnyszu', 'Świerkowa 7', 'Przasnysz', '06-300', 'srprzasnysz@data.pl', '(29) 752 13 12', '(29) 752 13 02', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (4, 'Sąd Rejonowy w Bielsku Podlaskim', '3 Maja  7', 'Bielsk Podlaski', '17-100', 'boi@bielsk-podlaski.sr.gov.pl', '(85) 731 21 65, 731 21 67', '(85) 731 21 68', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (17, 'Sąd Okręgowy w Olsztynie', 'Dąbrowszczaków 44A', 'Olsztyn', '10-543', 'boi@olsztyn.so.gov.pl', '(89) 521 61 84, 521 60 26   ', '(89) 521 60 14', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (31, 'Sąd Rejonowy w Olecku', 'Osiedle Siejnik I 18', 'Olecko', '19-400', 'olecko@olecko.sr.gov.pl', '(87) 523 06 00', '(87) 523 05 99', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (51, 'Sąd Rejonowy Gdańsk-Południe w Gdańsku', '3 Maja 9a', 'Gdańsk', '80-802', 'punktinformacyjny@gdansk-poludnie.sr.gov.pl', '(58) 324 25 24, 324 25 48, 324 25 59', '(58) 324 25 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (52, 'Sąd Rejonowy Gdańsk-Północ w Gdańsku', 'Piekarnicza 10', 'Gdańsk', '80-126', 'informacja.srgdapn@gdansk-polnoc.sr.gov.pl', '(58) 321 37 00, 321 38 00, 321 38 51', '(58) 321 38 53', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (57, 'Sąd Rejonowy w Malborku', '17 Marca 3', 'Malbork', '82-200', 'poi@malbork.sr.gov.pl', '(55) 647 07 00', '(55) 647 07 04', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (68, 'Sąd Rejonowy w Człuchowie', 'Szczecińska 1', 'Człuchów', '77-300', 'boi@czluchow.sr.gov.pl', '(59) 834 69 94, 834 69 93', '(59) 834 69 80', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (93, 'Sąd Rejonowy w Gliwicach', 'Powstańców Warszawy 23', 'Gliwice', '44-101', 'boi@gliwice.sr.gov.pl', '(32) 338 77 95', '(32) 338 77 59', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (102, 'Sąd Okręgowy w Katowicach', 'Francuska 38', 'Katowice', '40-028', 'informacja@katowice.so.gov.pl', '(32) 607 06 60', '(32) 607 01 99', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (104, 'Sąd Rejonowy w Bytomiu ', 'Piekarska  1', 'Bytom', '41-902', 'informacja@bytom.sr.gov.pl', '(32) 388 91 01', '(32) 396 69 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (109, 'Sąd Rejonowy Katowice-Zachód w Katowicach ', 'Pl. Wolności 10', 'Katowice', '40-078', 'administracja@katowice-zachod.sr.gov.pl', '(32) 604 77 00,604 77 04,604 77 13', '(32) 604 77 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (122, 'Sąd Rejonowy w Opatowie', 'Pl. Obrońców Pokoju 18', 'Opatowo', '27-500 ', 'boi@opatow.sr.gov.pl     ', '(15) 868 27 99, 868 27 98, 868 27 88', '(15) 868 26 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (132, 'Sąd Rejonowy dla Krakowa-Nowej Huty w Krakowie', 'Przy Rondzie 7', 'Kraków', '31-547', 'kontakt@krakow-nowahuta.sr.gov.pl', '(12) 619 50 86, 619 57 70', '(12) 619 50 37', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (81, 'Sąd Rejonowy we Włocławku', 'Kilińskiego 20', 'Włocławek', '87-800', 'srwloclawek@wloclawek.sr.gov.pl', '(54) 422 26 82, 422 27 52', '(54) 411 68 00', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (150, 'Sąd Rejonowy w Brzesku', 'Kościuszki 20', 'Brzesko', '32-800', 'boi@brzesko.sr.gov.pl', '(14) 664 61 01', '(14) 664 61 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (154, 'Sąd Apelacyjny w Lublinie', 'Obrońców Pokoju 1', 'Lublin', '20-950', 'boi@lublin.sa.gov.pl', '(81) 452 33 70', '(81) 452 34 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (160, 'Sąd Rejonowy Lublin-Wschód w Lublinie z siedzibą w Świdniku', 'Kardynała Stefana Wyszyńskiego 18', 'Świdnik', '21-040', 'boi@lublin-wschod.sr.gov.pl', '(81) 464 89 38, 464 89 37, 464 89 35', '(81) 464 88 33', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (179, 'Sąd Rejonowy w Garwolinie', 'Al. Legionów 46', 'Gawrolin', '08-400', 'podawcze@garwolin.sr.gov.pl', '(25) 682 30 41', '(25) 684 30 13', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (189, 'Sąd Apelacyjny w Łodzi', 'Narutowicza 64', 'Łódź', '90-136', 'administracja@lodz.sa.gov.pl', '(42) 685 06 96', '(42) 209 11 72', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (201, 'Sąd Rejonowy w Łęczycy', 'Konopnickiej 16', 'Łęczyca', '99-100', 'administracja@leczyca.sr.gov.pl', '(24) 721 12 82', '(24) 721 12 68', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (204, 'Sąd Rejonowy w Zgierzu', 'Sokołowska 6', 'Zgierz', '95-100', 'boi@zgierz.sr.gov.pl', '(42) 715 76 06', '(42) 209 11 50', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (212, 'Sąd Rejonowy w Piotrkowie Trybunalskim ', 'Słowackiego 5', 'Piotrków Trybunalski', '97-300', 'biuro.podawcze@piotrkow-tryb.sr.gov.pl', '(44) 649 41 36', '(44) 649 64 35', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (228, 'Sąd Rejonowy w Zduńskiej Woli', 'Żeromskiego 19', 'Zduńska Wola', '98-220', 'poi@zdwola.sr.gov.pl', '(43) 824 18 18', '(43) 656 89 79', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (242, 'Sąd Rejonowy w Nowym Tomyślu', 'Pl. Niepodległości 31', 'Nowy Tomyśl', '64-300', 'administracja@nowytomysl.sr.gov.pl', '(61) 628 49 60', '(61) 628 49 90', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (355, 'Sąd Rejonowy w Nysie', 'Plac Kościelny 6', 'Nysa', '48-300', 'boi@nysa.sr.gov.pl ', '(77) 448 35 16', '(77) 448 35 99', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (356, 'Sąd Rejonowy w Prudniku ', 'Kościuszki 5', 'Prudnik', '48-200 ', 'boi@prudnik.sr.gov.pl', '(77) 443 86 00', '(77) 443 86 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (357, 'Sąd Rejonowy w Brzegu', 'B. Chrobrego 31', 'Brzeg', '49-300 ', 'boi@brzeg.sr.gov.pl', '(77) 444 23 31, 444 23 32', '(77) 444 23 92', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (358, 'Sąd Okręgowy w Świdnicy', 'Pl. Grunwaldzki 14', 'Świdnica', '58-100', 'boi@swidnica.so.gov.pl', '(74) 851 83 50', '(74) 851 82 70', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (359, 'Sąd Rejonowy w Dzierżoniowie', 'Świdnicka 51', 'Dzierżoniów', '58-200', 'informacja@dzierzoniow.sr.gov.pl', '(74) 633 41 00', '(74) 633 41 88', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (361, 'Sąd Rejonowy w Kłodzku', 'Bohaterów Getta 15', 'Kłodzko', '57-300', 'punktinformacyjny@klodzko.sr.gov.pl', '(74) 865 13 17', '(74) 865 13 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (360, 'Sąd Rejonowy w Świdnicy ', 'Okulickiego 2-4', 'Świdnica', '58-100', 'srs@swidnica.sr.gov.pl', '(74) 851 84 60', '(74) 853 40 98', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (362, 'Sąd Rejonowy w Wałbrzychu', 'Słowackiego 10', 'Wałbrzych', '58-300', 'informacja@walbrzych.sr.gov.pl', '(74) 843 03 00', '(74) 842 30 25', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (364, 'Sąd Okręgowy we Wrocławiu', 'Sądowa 1', 'Wrocław', '50-046', 'punkt.informacyjny@wroclaw.so.gov.pl', '(71) 370 42 01', '(71) 344 49 59', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (365, 'Sąd Rejonowy w Wołowie', 'M.Reja 11', 'Wołów', '56-100', 'biuro.podawcze@wolow.sr.gov.pl', '(71) 756 61 49', '(71) 756 61 37', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (366, 'Sąd Rejonowy w Miliczu', 'Piłsudskiego 10', 'Milicz', '56-300', 'biuro.podawcze@milicz.sr.gov.pl', '(71) 749 90 00', '(71) 749 90 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (367, 'Sąd Rejonowy w Strzelinie', 'Bolka I Świdnickiego 7', 'Strzelin', '57-100', 'biuro.podawcze@strzelin.sr.gov.pl', '(71) 749 91 00', '(71) 749 91 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (368, 'Sąd Rejonowy dla Wrocławia-Fabrycznej we Wrocławiu', 'Świebodzka 5', 'Wrocław', '50-046', 'biuro.podawcze@wroclaw-fabryczna.sr.gov.pl', '(71) 748 90 48', '(71) 748 90 49', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (369, 'Sąd Rejonowy dla Wrocława-Krzyków we Wrocławiu', 'Podwale 30', 'Wrocław', '50-040', 'administracyjny@wroclaw-krzyki.sr.gov.pl', '(71) 749 63 15', '(71) 749 63 16', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (370, 'Sąd Rejonowy dla Wrocławia-Śródmieścia we Wrocławiu', 'Podwale 30 ', 'Wrocław', '50-040', 'biuro.podawcze@wroclaw-srodmiescie.sr.gov.pl', '(71) 748 11 40', '(71) 748 11 29', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (371, 'Sąd Rejonowy w Oławie', '11 Listopada 12', 'Oława', '55-200', 'punkt.informacyjny@olawa.sr.gov.pl', '(71) 749 92 00', '(71) 749 92 01', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (372, 'Sąd Rejonowy w Oleśnicy', '3 Maja 48/49', 'Olesnica', '56-400', 'biuro.podawcze@olesnica.sr.gov.pl', '(71) 756 63 20', '(74) 756 63 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (373, 'Sąd Rejonowy w Trzebnicy', 'Parkowa  4', 'Trzebnica', '55-100', 'administracyjny@trzebnica.sr.gov.pl', '(71) 756 62 04', '(71) 756 62 00', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (374, 'Sąd Rejonowy w Środzie Śląskiej', 'św. Andrzeja 3', 'Środa Śląska', '55-300', 'boi@srodaslaska.sr.gov.pl', '(71) 396 02 48', '(71) 317 51 17', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (254, 'Sąd Rejonowy w Wolsztynie', 'Mickiewicza 2', 'Wolsztyn', '64-200', 'administracja@wolsztyn.sr.gov.pl', '(68) 420 23 05', '(68) 347 36 08', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (258, 'Sąd Rejonowy w Krośnie Odrzańskim', 'Piastów 10 L', 'Krosno Odrzańskie', '66-600', 'biuro.podawcze@krosno-odrz.sr.gov.pl', '(68) 383 99 10, 383 99 16', '(68) 383 04 55', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (275, 'Sąd Rejonowy w Lesku', 'Pl. Konstytucji 3 Maja 9', 'Lesko', '38-600', 'administracja@lesko.sr.gov.pl', '(13) 468 98 00', '(13) 468 98 03', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (287, 'Sąd Rejonowy w Stalowej Woli', 'Ks. J. Popiełuszki 16', 'Stalowa Wola', '37-450', 'boi@stalowawola.sr.gov.pl', '(15) 643 45 50, 643 45 51', '(15) 643 46 76', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (298, 'Sąd Rejonowy w Goleniowie', 'Konstytucji 3-go Maja 45 ', 'Goleniów', '72-100', 'boi@goleniow.sr.gov.pl', '(91) 466 74 46', '(91) 466 74 47', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (305, 'Sąd Rejonowy w Kołobrzegu', 'Katedralna 13', 'Kołobrzeg', '78-100', 'poi@kolobrzeg.sr.gov.pl', '(34) 957 51 42', '(94) 352 26 20', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (310, 'Sąd Rejonowy w Sławnie', 'I Pułku Ułanów 20', 'Sławno', '76-100 ', 'biuropodawcze@slawno.sr.gov.pl', '(59) 810 67 46', '(59) 810 67 46', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (320, 'Sąd Rejonowy dla Warszawy-Śródmieścia w Warszawie', 'Marszałkowska 82', 'Warszawa', '00-517', 'poi@warszawa-srodmiescie.sr.gov.pl', '(22) 553 97 06', '(22) 553 96 84', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (333, 'Sąd Rejonowy w Wołominie', 'Prądzyńskiego 3A', 'Wołomin', '05-200 ', 'boi@wolomin.sr.gov.pl', '(22) 776 21 44, 776 28 15, 787 28 49', '(22) 776 23 13 ', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (347, 'Sąd Rejonowy w Złotoryi', 'Kolejowa 3', 'Złotoryja', '59-500', 'k.kocuj@zlotoryja.sr.gov.pl', '(76) 745 90 14', '(76) 745 90 02', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (354, 'Sąd Rejonowy w Głubczycach', 'Kochanowskiego 1', 'Głubczyce', '48-100', 'administracja@glubczyce.sr.gov.pl', '(77) 471 06 00', '(77) 471 06 27', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (363, 'Sąd Rejonowy w Ząbkowicach Śląskich', 'Świerkowa 1', 'Ząbkowice Śląskie', '57-200', 'poi@zabkowice.sr.gov.pl', '(74) 816 51 00', '(74) 816 51 31', NULL);
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (2, 'Sąd Okręgowy w Białymstoku', 'M. Skłodowskiej-Curie 1', 'Białystok', '15-950', 'boi@bialystok.so.gov.pl', '(85) 742 23 46', '(85) 742 46 40', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (73, 'Sąd Rejonowy w Toruniu', 'Fosa Staromiejska12/14', 'Toruń', '87-100', 'boi@torun.sr.gov.pl', '(56) 610 57 95', '(56) 610 57 90', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (22, 'Sąd Rejonowy w Lidzbarku Warmińskim', 'Bartoszycka 4a', 'Lidzbark Warmiński', '11-100', 'sekcja.administracyjna@lidzbarkwarminski.sr.gov.pl', '(89) 767 83 00', '(89) 767 83 01', 'http://lidzbarkwarminski.sr.gov.pl');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (42, 'Sąd Rejonowy w Żninie', 'Pl. Wolności 17', 'Żnin', '88-400', 'administracja@znin.sr.gov.pl', '(52) 303 37 12', '(52) 303 37 20', '');
INSERT INTO public.sady (id, nazwa, ulica, miejscowosc, kod_pocztowy, email, tel, fax, www) VALUES (161, 'Sąd Rejonowy Lublin-Zachód w Lublinie', 'Boczny Lubomelskiej 13', 'Lublin', '20-070', 'sek@lublin-zachod.sr.gov.pl ', '(81) 535 07 45,46,47,48,49', '(81) 478 16 03', '');


--
-- Name: sady_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sady_id_seq', 374, true);


--
-- Data for Name: sady_wydzialy; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (58, 161, 'VI Cywilny', 'Boczna Lubomelskiej 13', '20-070', 'Lublin', '', '81 535 07 45', '');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (2, 22, 'I Wydział Cywilny', 'Bartoszycka 4a', '11-100', 'Lidzbark Warmiński', 'cywilny@lidzbarkwarminski.sr.gov.pl', '(89) 767 83 10', '(89) 767 83 11');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (6, 73, 'V wydział Gospodarczy', 'Mickiewicza 10/16', '87-100', 'Toruń', 'gospodarczy5@torun.sr.gov.pl', ' 56 61-05-944, 56 61-05-766', '56 61-05-943');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (9, 73, 'XI Wydział Cywilny ', 'Mickiewicza 10/16', '87-100', 'Toruń', ' cywilny11@torun.sr.gov.pl', '56 61-05-717', '56 61-05-945');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (5, 73, 'IV Wydział Pracy i Ubezpieczeń Społecznych', 'Piastowska 7', '87-100', 'Toruń', 'pracy4@torun.sr.gov.pl', '56 61-05-950', '56 61-05-975');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (7, 73, 'VIII Wydział Karny', 'Fosa Staromiejska 12/14', '87-100', 'Toruń', 'karny8@torun.sr.gov.pl', '56 61 05 729', '56 61 05 776');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (4, 73, 'II Wydział Karny', 'Fosa Staromiejska 12/14', '87-100', 'Toruń', 'karny2@torun.sr.gov.pl', '56  61-05-728', '56 61-05-777');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (8, 73, 'X Wydział Cywilny ', 'Młodzieżowa 31', '87-100', 'Toruń', ' cywilny10@torun.sr.gov.pl', '56 61-05-819', '056 61-05-804');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (14, 69, 'VIII Wydział Cywilny Odwoławczy', 'Piekary 51', '87-100', 'Toruń', 'cywilny_odwolawczy@torun.so.gov.pl', '56 61 05 664', '56 65 55 706');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (12, 69, 'IV Wydział Pracy i Ubezpieczeń Społecznych', 'Piekary 51', '87-100', 'Toruń', 'pius@torun.so.gov.pl', '56 61 05 650', '56 65 55 706');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (15, 69, 'IX Wydział Karny Odwoławczy', 'Piekary 51', '87-100', 'Toruń', 'karny_odwolawczy@torun.so.gov.pl', '56 61 05 607', ' 56 65 55 705');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (13, 69, 'VI Wydział Gospodarczy', 'Piekary 51', '87-100', 'Toruń', 'gospodarczy_wydzial@torun.so.gov.pl', '56 61 05 531', '56) 61 05 546');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (10, 69, 'I Wydział Cywilny', 'Piekary 49', '87-100', 'Toruń', 'cywilny@torun.so.gov.pl', '56 61 05 626', '56 61 05 672');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (11, 69, 'II Wydział Karny', 'Piekary 51', '87-100', 'Toruń', ' karny@torun.so.gov.pl', '56 61 05 636', '56 65 55 707');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (22, 35, 'VIII Wydział Gospodarczy', 'Grudziądzka 45', '85-130', 'Bydgoszcz', 'viiigospodarczy@bydgoszcz.sr.gov.pl', '52 587 85 00', '52 587 88 11');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (21, 35, 'II Wydział Cywilny ', 'Toruńska 64A', '85-023', 'Bydgoszcz', '	iicywilny@bydgoszcz.sr.gov.pl', '52 58 78 500', '52 58 78 691');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (20, 35, 'I Wydział Cywilny ', 'Toruńska 64A', '85-023', 'Bydgoszcz', '	icywilny@bydgoszcz.sr.gov.pl', '52 58 78 500', '52 58 78 711');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (25, 34, 'VIII Wydział Gospodarczy', 'Toruńska 64A', '85-023', 'Bydgoszcz', '8.gospodarczy@bydgoszcz.so.gov.pl', '52 32 62 761', ' 52 32 62 763');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (23, 34, 'I Wydział Cywilny', 'Wały Jagiellońskie 2', '85-128', 'Bydgoszcz', '1.cywilny@bydgoszcz.so.gov.pl', '52 32 53 106', '52 32 53 158');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (24, 34, 'II Wydział Cywilny Odwoławczy', 'Wały Jagiellońskie 2', '85-128', 'Bydgoszcz', '2.cywilny.odwolawczy@bydgoszcz.so.gov.pl', '52 32 53 158', '52 32 53 158');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (26, 74, 'I Wydział Cywilny', 'Sądowa 5', '87-300', 'Brodnica', 'cywilny@brodnica.sr.gov.pl', '056 / 49 41 743', '056 / 49 82 336');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (33, 71, 'I Wydział Cywilny', 'Kościelna 23/25', '87-400', 'Golub Dobrzyń', 'cywilny@golubdobrzyn.sr.gov.pl', '56 682 35 16, 56 682 35 18', '56) 682 35 61');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (34, 75, 'I Wydział Cywilny ', 'Sikorskiego 19/23', '86-300', 'Grudziądz', 'cywilny@grudziadz.sr.gov.pl', '056 45 05 915 lub 0564505940', '056 45 05 928');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (35, 72, 'I Wydział Cywilny', 'Wolności 19', '87-200', 'Wąbrzeźno', 'cywilny@wabrzezno.sr.gov.pl', '56 689 06 02', '056) 689-06-29');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (36, 36, 'I Wydział Cywilny', 'Narutowicza 42', '88-100', 'Inowrocław', 'cywilny@inowroclaw.sr.gov.pl', '52 359-26-14', '52 359-26-31  ');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (37, 37, 'I Wydział Cywilny', 'Sądowa 21', '88-300', 'Mogilno', 'administracja@mogilno.sr.gov.pl', '52 315 97 08', '52 315 97 09');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (38, 39, 'I Wydział Cywilny', 'Plac Wolności 4', '89-200', 'Szubin', '1wydzialcywilny@szubin.sr.gov.pl', ' 52 39 10 142', ' 52 39 10 142');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (39, 40, 'I Wydział Cywilny', 'Sądowa 12', '86-100', 'Świecie', ' k.zielinska@swiecie.sr.gov.pl', '(52) 333 28 08, (52) 333 28 37, (52) 333 28 50', '(52) 333 28 21');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (40, 41, 'I Wydział Cywilny ', 'Świecka 28', '89-500', 'Tuchola', 'cywilny@tuchola.sr.gov.pl', '52 33 60 438', '52 336 04 09');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (41, 42, 'I Wydział Cywilny ', 'Plac Wolności 17', '88-400', 'Żnin', 'malgorzata.sosnowska@znin.sr.gov.pl', ' 52 30 33 736', ' 52 30 33 727');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (43, 81, 'IV Wydział Pracy i Ubezpieczeń Społecznych', 'Kilińskiego 20', '87-800', 'Włocławek', 'sadpracy@wloclawek.sr.gov.pl', '54 42 22 735', '54 411 68 00 ');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (42, 81, 'I Wydział Cywilny ', 'Kilińskiego 20', '87-800', 'Włocławek', 'cywilny@wloclawek.sr.gov.pl', '54 42 22 694', '54 411 68 00');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (44, 81, 'V Wydział Gospodarczy', 'Kilińskiego 20', '87-800', 'Włocławek', 'gospodarczy@wloclawek.sr.gov.pl', '54 42 22 677', '54 411 68 00');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (46, 76, 'I Wydział Cywilny ', 'Wojska Polskiego 22', '87-800', 'Włocławek', 'w.cywilny@wloclawek.so.gov.pl', 'BOI: 54 41 20 380, 54 42 22 515', 'BOI: 54 41 18 575');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (47, 76, 'IV Wydział Pracy i Ubezpieczeń Społecznych', 'Długa 65', '87-800', 'Włocławek', 'w.pracyius@wloclawek.so.gov.pl    ', 'BOI: 54 41 20 380, 54 41 20 368 ', '54 411 85 75');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (48, 78, 'I Wydział Cywilny ', 'ul. Piłsudskiego 15/17', '87-600', 'Lipno', '', '54 287 22 05', 'Główny: 54 287 33 19');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (49, 80, 'I Wydział Cywilny ', 'Warszawska 42', '87-500 ', 'Rypin', '', '', '');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (51, 44, 'V Wydział Gospodarczy', 'Płk Dąbka 8-12', '82-300', 'Elbląg', 'wydzial.gospodarczy@elblag.sr.gov.pl', 'BOI: 55 611 27 60, 55 611 27 76 lub 55 611 27 80 W: 55 611 27 30', '55 611 22 41');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (50, 44, 'I Wydział Cywilny ', 'Płk Dąbka 8-12', '82-300', 'Elbląg', 'wydzial.cywilny@elblag.sr.gov.pl', 'BOI: 55 611 27 60,  55 611 27 76 lub 55 611 27 80 W: 55 611 27 06', '55 611 22 40');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (52, 44, 'IX Wydział Cywilny ', 'Płk Dąbka 8-12', '82-300', 'Elbląg', 'wydzial.cywilny9@elblag.sr.gov.pl', 'BOI: 55 611 27 60, 55 611 27 76 lub 55 611 27 80 W: 55 611 27 47', '55 611 27 4');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (53, 43, 'I Wydział Cywilny ', 'Pl. Konstytucji 1', '82-300', 'Elbląg', 'wydzial.cywilny@elblag.so.gov.pl', 'BOI: 55 611 24 04 W: 55 611 24 58', '055 611 24 36');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (55, 46, 'III Wydział Rodzinny i Niletnich', 'Jagiełły 31', '13-200', 'Działdowo', 'wydzial.rodzinny@dzialdowo.sr.gov.pl', '23 697 07 98', '23 697 07 78');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (54, 46, 'I Wydział Cywilny ', 'Jagiełły 31', '13-200', 'Działdowo', 'wydzial.cywilny@dzialdowo.sr.gov.pl', '23 697 07 76', ' 023 697 07 92');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (56, 47, 'I Wydział Cywilny ', 'Mikołaja Kopernika 4B', '14-200', 'Iława', 'sekretariat@ilawa.sr.gov.pl', 'BOI: 89 644 57 00', 'BOI:  89 644 57 55');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (57, 47, 'II Wydział Karny', 'Mikołaja Kopernika 4B', '14-200', 'Iława', 'sekretariat@ilawa.sr.gov.pl', '.pl BOI: 89 644 57 00', 'BOI: 89 644 57 55');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (1, 73, 'I Wydział Cywilny', 'Młodzieżowa 31', '87-100', 'Toruń', 'cywilny1@torun.sr.gov.pl', '56 6105960', '56 6105974');
INSERT INTO public.sady_wydzialy (id, sad_id, nazwa, ulica_nr, kod_pocztowy, miejscowosc, email, tel, fax) VALUES (3, 73, 'III Wydział Rodzinny i Nieletnich ', 'Piastowska 7', '87-100', 'Toruń', ' rodzinny3@torun.sr.gov.pl', '56 61-05-815', '56 61-05-803');


--
-- Name: sady_wydzialy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sady_wydzialy_id_seq', 58, true);


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sequence (seq_name, seq_count) VALUES ('roliczenia_seq', 0);


--
-- Data for Name: sprawy; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_dokumenty_seq', 1, true);


--
-- Name: sprawy_klienci_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_klienci_id_seq', 1, true);


--
-- Name: sprawy_pelnomocnicy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_pelnomocnicy_id_seq', 1, true);


--
-- Name: sprawy_podmioty_osoby_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_podmioty_osoby_id_seq', 1, true);


--
-- Name: sprawy_podmioty_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_podmioty_seq', 1, true);

--
-- Name: sprawy_pozyskali_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_pozyskali_id_seq', 1, true);


--
-- Name: sprawy_przeciwnicy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_przeciwnicy_id_seq', 1, true);

--
-- Data for Name: sprawy_rodzaje_czynnosc; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (1, 1, 1, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (2, 1, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (3, 1, 3, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (4, 1, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (5, 1, 5, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (6, 1, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (7, 1, 7, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (8, 1, 8, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (9, 1, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (10, 2, 1, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (11, 2, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (12, 2, 3, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (13, 2, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (14, 2, 5, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (15, 2, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (16, 2, 7, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (17, 2, 8, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (18, 2, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (19, 2, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (20, 3, 1, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (21, 3, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (22, 3, 3, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (23, 3, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (24, 3, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (25, 3, 7, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (26, 3, 8, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (27, 3, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (28, 3, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (29, 4, 1, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (30, 4, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (31, 4, 3, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (32, 4, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (33, 4, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (34, 4, 7, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (35, 4, 8, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (36, 4, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (37, 4, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (38, 5, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (39, 5, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (40, 5, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (41, 5, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (42, 5, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (43, 6, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (44, 6, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (45, 6, 9, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (46, 6, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (47, 6, 11, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (48, 7, 2, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (49, 7, 4, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (50, 7, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (51, 7, 10, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (52, 7, 12, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (56, 4, 49, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (57, 45, 52, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (58, 45, 55, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (59, 45, 53, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (60, 45, 54, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (61, 45, 59, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (62, 45, 58, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (63, 45, 57, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (64, 45, 60, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (65, 45, 56, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (66, 45, 61, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (67, 45, 6, false, NULL);
INSERT INTO public.sprawy_rodzaje_czynnosc (id, sprawy_rodzaje_dict_id, czynnosci_dict_id, alert_aktywny, liczba_dni_do_alertu) VALUES (68, 45, 62, false, NULL);


--
-- Name: sprawy_rodzaje_czynnosc_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_rodzaje_czynnosc_seq', 68, true);


--
-- Data for Name: sprawy_rodzaje_dict; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (1, 'Ubezpieczeniowa - blachy');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (2, 'Ubezpieczeniowa - najem');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (3, 'Ubezpieczeniowa - szkoda śmiertelna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (4, 'Ubezpieczeniowa - szkoda na osobie');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (5, 'Gospodarcza o zapłatę');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (6, 'Rodzinna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (7, 'Inna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (45, 'Fundusze');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (46, 'Ubezpieczeniowa - szkoda w mieniu');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (47, 'Egzekucyjna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (48, 'Upadłość konsumencka');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (49, 'Medyczna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (50, 'Karna');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (51, 'Spadkowa');
INSERT INTO public.sprawy_rodzaje_dict (id, nazwa) VALUES (52, 'Ubezpieczeniowa - holowanie');


--
-- Name: sprawy_rodzaje_dict_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_rodzaje_dict_seq', 52, true);


--
-- Name: sprawy_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_seq', 3613, true);


--
-- Data for Name: sprawy_statusy_dict; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sprawy_statusy_dict (id, nazwa) VALUES (1, 'W toku');
INSERT INTO public.sprawy_statusy_dict (id, nazwa) VALUES (2, 'Zakończona');


--
-- Name: sprawy_statusy_dict_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_statusy_dict_seq', 2, true);


--
-- Data for Name: sprawy_wynik_dict; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (1, 'wygrana w całości');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (2, 'wygrana w części');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (3, 'oddalenie');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (4, 'wygrana – oddalenie');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (5, 'wygrana – umorzenie');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (6, 'przegrana – zasądzenie');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (7, 'wypowiedzenie pełnomocncitwa');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (8, 'Ugoda');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (9, 'zapłacone po wezwaniu');
INSERT INTO public.sprawy_wynik_dict (id, nazwa) VALUES (10, 'rezygnacja klienta');


--
-- Name: sprawy_wynik_dict_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.sprawy_wynik_dict_id_seq', 10, true);


--
-- Data for Name: uzytkownicy; Type: TABLE DATA; Schema: public; Owner: kancelaria
--

INSERT INTO public.uzytkownicy (id, login, haslo, status, typ, ostatnie_logowanie, nazwa) VALUES (1, 'maciej', '4aa3910a8fc41d0831620a1e1243c548', 'AKTYWNY', 'ADMIN', '2020-02-22 12:04:23.188', 'skorzynski');

--
-- Name: uzytkownicy_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.uzytkownicy_seq', 2, true);

--
-- Name: zadania_seq; Type: SEQUENCE SET; Schema: public; Owner: kancelaria
--

SELECT pg_catalog.setval('public.zadania_seq', 1, true);


--
-- Name: PK_sprawy_osoby; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_podmioty_osoby
    ADD CONSTRAINT "PK_sprawy_osoby" PRIMARY KEY (id);


--
-- Name: PK_sprawy_pelnomocnincy; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_pelnomocnicy
    ADD CONSTRAINT "PK_sprawy_pelnomocnincy" PRIMARY KEY (id);


--
-- Name: czynnosci_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.czynnosci_dict
    ADD CONSTRAINT czynnosci_dict_pkey PRIMARY KEY (id);


--
-- Name: dokumenty_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.dokumenty
    ADD CONSTRAINT dokumenty_pkey PRIMARY KEY (id);


--
-- Name: pkey_statusyspraw; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_statusy_dict
    ADD CONSTRAINT pkey_statusyspraw PRIMARY KEY (id);


--
-- Name: podmioty_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.podmioty_dict
    ADD CONSTRAINT podmioty_dict_pkey PRIMARY KEY (id);


--
-- Name: podmioty_osoby_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.podmioty_osoby
    ADD CONSTRAINT podmioty_osoby_pkey PRIMARY KEY (id);


--
-- Name: podmioty_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.podmioty
    ADD CONSTRAINT podmioty_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public."roleUzytkownikow"
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: rozliczenia_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.rozliczenia
    ADD CONSTRAINT rozliczenia_pkey PRIMARY KEY (id);


--
-- Name: sady_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sady
    ADD CONSTRAINT sady_pkey PRIMARY KEY (id);


--
-- Name: sady_wydzialy_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sady_wydzialy
    ADD CONSTRAINT sady_wydzialy_pkey PRIMARY KEY (id);


--
-- Name: sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


--
-- Name: sprawy_dokumenty_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_dokumenty
    ADD CONSTRAINT sprawy_dokumenty_pkey PRIMARY KEY (id);


--
-- Name: sprawy_klienci_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_klienci
    ADD CONSTRAINT sprawy_klienci_pkey PRIMARY KEY (id);


--
-- Name: sprawy_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT sprawy_pkey PRIMARY KEY (id);


--
-- Name: sprawy_podmioty_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_podmioty
    ADD CONSTRAINT sprawy_podmioty_pkey PRIMARY KEY (id);


--
-- Name: sprawy_pozyskali_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_pozyskali
    ADD CONSTRAINT sprawy_pozyskali_pkey PRIMARY KEY (id);


--
-- Name: sprawy_przeciwnicy_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_przeciwnicy
    ADD CONSTRAINT sprawy_przeciwnicy_pkey PRIMARY KEY (id);


--
-- Name: sprawy_rodzaje_czynnosc_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_rodzaje_czynnosc
    ADD CONSTRAINT sprawy_rodzaje_czynnosc_pkey PRIMARY KEY (id);


--
-- Name: sprawy_rodzaje_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_rodzaje_dict
    ADD CONSTRAINT sprawy_rodzaje_dict_pkey PRIMARY KEY (id);


--
-- Name: sprawy_wynik_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.sprawy_wynik_dict
    ADD CONSTRAINT sprawy_wynik_dict_pkey PRIMARY KEY (id);


--
-- Name: uzytkownicy_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.uzytkownicy
    ADD CONSTRAINT uzytkownicy_pkey PRIMARY KEY (id);


--
-- Name: zadania_pkey; Type: CONSTRAINT; Schema: public; Owner: kancelaria; Tablespace: 
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT zadania_pkey PRIMARY KEY (id);


--
-- Name: fki_FK_podmiot_typ; Type: INDEX; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE INDEX "fki_FK_podmiot_typ" ON public.podmioty USING btree (podmioty_dict_id);


--
-- Name: fki_FK_sprawa_rodzaj; Type: INDEX; Schema: public; Owner: kancelaria; Tablespace: 
--

CREATE INDEX "fki_FK_sprawa_rodzaj" ON public.sprawy USING btree (sprawa_rodzaj_id);


--
-- Name: FK_createdBy; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT "FK_createdBy" FOREIGN KEY (created_by) REFERENCES public.uzytkownicy(id);


--
-- Name: FK_createdBy; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_createdBy" FOREIGN KEY (created_by) REFERENCES public.uzytkownicy(id);


--
-- Name: FK_modifiedBy; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_modifiedBy" FOREIGN KEY (modified_by) REFERENCES public.uzytkownicy(id);


--
-- Name: FK_podmiot_osoba_klient; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.podmioty_osoby
    ADD CONSTRAINT "FK_podmiot_osoba_klient" FOREIGN KEY (klient_id) REFERENCES public.podmioty(id);


--
-- Name: FK_podmiot_typ; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.podmioty
    ADD CONSTRAINT "FK_podmiot_typ" FOREIGN KEY (podmioty_dict_id) REFERENCES public.podmioty_dict(id);


--
-- Name: FK_role_uzytkownik_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public."roleUzytkownikow"
    ADD CONSTRAINT "FK_role_uzytkownik_id" FOREIGN KEY (uzytkownik_id) REFERENCES public.uzytkownicy(id);


--
-- Name: FK_rozliczenia_sprawa_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.rozliczenia
    ADD CONSTRAINT "FK_rozliczenia_sprawa_id" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawa_klient_kontakt; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_klient_kontakt" FOREIGN KEY (klient_kontakt_id) REFERENCES public.podmioty_osoby(id);


--
-- Name: FK_sprawa_osoba_prowadzaca; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_osoba_prowadzaca" FOREIGN KEY (osoba_prowadzaca_id) REFERENCES public.uzytkownicy(id);


--
-- Name: CONSTRAINT "FK_sprawa_osoba_prowadzaca" ON sprawy; Type: COMMENT; Schema: public; Owner: kancelaria
--

COMMENT ON CONSTRAINT "FK_sprawa_osoba_prowadzaca" ON public.sprawy IS 'Osoba prowadząca sprawę - użytkownik systemu';


--
-- Name: FK_sprawa_rodzaj; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_rodzaj" FOREIGN KEY (sprawa_rodzaj_id) REFERENCES public.sprawy_rodzaje_dict(id);


--
-- Name: FK_sprawa_sad; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_sad" FOREIGN KEY (sad_id) REFERENCES public.sady(id);


--
-- Name: FK_sprawa_sad_wydzial; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_sad_wydzial" FOREIGN KEY (sad_wydzial_id) REFERENCES public.sady_wydzialy(id);


--
-- Name: FK_sprawa_status; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_status" FOREIGN KEY (sprawa_status_id) REFERENCES public.sprawy_statusy_dict(id);


--
-- Name: FK_sprawa_wynik; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy
    ADD CONSTRAINT "FK_sprawa_wynik" FOREIGN KEY (sprawa_wynik_id) REFERENCES public.sprawy_wynik_dict(id);


--
-- Name: FK_sprawy_dokumenty_dokument_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_dokumenty
    ADD CONSTRAINT "FK_sprawy_dokumenty_dokument_id" FOREIGN KEY (dokument_id) REFERENCES public.dokumenty(id);


--
-- Name: FK_sprawy_dokumenty_sprawa_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_dokumenty
    ADD CONSTRAINT "FK_sprawy_dokumenty_sprawa_id" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawy_osoby_podmiot_osoba; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_podmioty_osoby
    ADD CONSTRAINT "FK_sprawy_osoby_podmiot_osoba" FOREIGN KEY (podmiot_osoba_id) REFERENCES public.podmioty_osoby(id);


--
-- Name: FK_sprawy_osoby_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_podmioty_osoby
    ADD CONSTRAINT "FK_sprawy_osoby_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawy_pelnocnicy_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_pelnomocnicy
    ADD CONSTRAINT "FK_sprawy_pelnocnicy_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawy_pelnomocnicy_podmiot_osoba; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_pelnomocnicy
    ADD CONSTRAINT "FK_sprawy_pelnomocnicy_podmiot_osoba" FOREIGN KEY (podmiot_osoba_id) REFERENCES public.podmioty_osoby(id);


--
-- Name: FK_sprawyklienci_podmiot; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_klienci
    ADD CONSTRAINT "FK_sprawyklienci_podmiot" FOREIGN KEY (podmiot_id) REFERENCES public.podmioty(id);


--
-- Name: FK_sprawyklienci_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_klienci
    ADD CONSTRAINT "FK_sprawyklienci_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawypodmioty_podmiot; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_podmioty
    ADD CONSTRAINT "FK_sprawypodmioty_podmiot" FOREIGN KEY (podmiot_id) REFERENCES public.podmioty(id);


--
-- Name: FK_sprawypodmioty_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_podmioty
    ADD CONSTRAINT "FK_sprawypodmioty_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawypozyskali_podmiot; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_pozyskali
    ADD CONSTRAINT "FK_sprawypozyskali_podmiot" FOREIGN KEY (podmiot_id) REFERENCES public.podmioty(id);


--
-- Name: FK_sprawypozyskali_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_pozyskali
    ADD CONSTRAINT "FK_sprawypozyskali_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_sprawyprzeciwnicy_podmiot; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_przeciwnicy
    ADD CONSTRAINT "FK_sprawyprzeciwnicy_podmiot" FOREIGN KEY (podmiot_id) REFERENCES public.podmioty(id);


--
-- Name: FK_sprawyprzeciwnicy_sprawa; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_przeciwnicy
    ADD CONSTRAINT "FK_sprawyprzeciwnicy_sprawa" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_src_czynnosc_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_rodzaje_czynnosc
    ADD CONSTRAINT "FK_src_czynnosc_id" FOREIGN KEY (czynnosci_dict_id) REFERENCES public.czynnosci_dict(id);


--
-- Name: FK_src_rodzaj_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sprawy_rodzaje_czynnosc
    ADD CONSTRAINT "FK_src_rodzaj_id" FOREIGN KEY (sprawy_rodzaje_dict_id) REFERENCES public.sprawy_rodzaje_dict(id);


--
-- Name: FK_zadanie_czynnosc_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT "FK_zadanie_czynnosc_id" FOREIGN KEY (czynnosc_id) REFERENCES public.czynnosci_dict(id);


--
-- Name: FK_zadanie_sprawa_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT "FK_zadanie_sprawa_id" FOREIGN KEY (sprawa_id) REFERENCES public.sprawy(id);


--
-- Name: FK_zadanie_uzytkownik_id; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT "FK_zadanie_uzytkownik_id" FOREIGN KEY (uzytkownik_id) REFERENCES public.uzytkownicy(id);


--
-- Name: fk_sady; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.sady_wydzialy
    ADD CONSTRAINT fk_sady FOREIGN KEY (sad_id) REFERENCES public.sady(id);


--
-- Name: modifiedBy; Type: FK CONSTRAINT; Schema: public; Owner: kancelaria
--

ALTER TABLE ONLY public.zadania
    ADD CONSTRAINT "modifiedBy" FOREIGN KEY (modified_by) REFERENCES public.uzytkownicy(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

