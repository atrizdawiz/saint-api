--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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

--
-- Name: ReligiousOrderType; Type: TYPE; Schema: public; Owner: anos
--

CREATE TYPE public."ReligiousOrderType" AS ENUM (
    'CANONS_REGULAR',
    'MONASTIC',
    'MENIDICANT',
    'CLERIC'
);


ALTER TYPE public."ReligiousOrderType" OWNER TO anos;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Quote; Type: TABLE; Schema: public; Owner: anos
--

CREATE TABLE public."Quote" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    "authorId" integer NOT NULL
);


ALTER TABLE public."Quote" OWNER TO anos;

--
-- Name: Quote_id_seq; Type: SEQUENCE; Schema: public; Owner: anos
--

CREATE SEQUENCE public."Quote_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Quote_id_seq" OWNER TO anos;

--
-- Name: Quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anos
--

ALTER SEQUENCE public."Quote_id_seq" OWNED BY public."Quote".id;


--
-- Name: ReligiousOrder; Type: TABLE; Schema: public; Owner: anos
--

CREATE TABLE public."ReligiousOrder" (
    id integer NOT NULL,
    description text,
    type public."ReligiousOrderType" NOT NULL,
    "foundedIn" date,
    acronym text,
    name text,
    "officialName" text NOT NULL
);


ALTER TABLE public."ReligiousOrder" OWNER TO anos;

--
-- Name: ReligiousOrder_id_seq; Type: SEQUENCE; Schema: public; Owner: anos
--

CREATE SEQUENCE public."ReligiousOrder_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReligiousOrder_id_seq" OWNER TO anos;

--
-- Name: ReligiousOrder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anos
--

ALTER SEQUENCE public."ReligiousOrder_id_seq" OWNED BY public."ReligiousOrder".id;


--
-- Name: Saint; Type: TABLE; Schema: public; Owner: anos
--

CREATE TABLE public."Saint" (
    id integer NOT NULL,
    name text NOT NULL,
    "religiousOrderId" integer,
    alias text,
    "dateOfBirth" date,
    "dateOfHeavenlyBirth" date,
    "foundedReligiousOrderId" integer,
    nationality text,
    "wasMartyred" boolean,
    "ambigousDateOfBirth" text,
    "ambigousDateOfHeavenlyBirth" text,
    "dateOfCanonization" date,
    "latinFeastDay" date,
    notes text,
    "wikiLink" text,
    "ambigousDateOfCanonization" text,
    "countryCode" text
);


ALTER TABLE public."Saint" OWNER TO anos;

--
-- Name: Saint_id_seq; Type: SEQUENCE; Schema: public; Owner: anos
--

CREATE SEQUENCE public."Saint_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Saint_id_seq" OWNER TO anos;

--
-- Name: Saint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anos
--

ALTER SEQUENCE public."Saint_id_seq" OWNED BY public."Saint".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: anos
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO anos;

--
-- Name: Quote id; Type: DEFAULT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Quote" ALTER COLUMN id SET DEFAULT nextval('public."Quote_id_seq"'::regclass);


--
-- Name: ReligiousOrder id; Type: DEFAULT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."ReligiousOrder" ALTER COLUMN id SET DEFAULT nextval('public."ReligiousOrder_id_seq"'::regclass);


--
-- Name: Saint id; Type: DEFAULT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Saint" ALTER COLUMN id SET DEFAULT nextval('public."Saint_id_seq"'::regclass);


--
-- Data for Name: Quote; Type: TABLE DATA; Schema: public; Owner: anos
--

COPY public."Quote" (id, "createdAt", title, content, "authorId") FROM stdin;
\.


--
-- Data for Name: ReligiousOrder; Type: TABLE DATA; Schema: public; Owner: anos
--

COPY public."ReligiousOrder" (id, description, type, "foundedIn", acronym, name, "officialName") FROM stdin;
8	\N	CANONS_REGULAR	\N	C.R.S.A.	Canon Regulars	Sacer et Apostolicus Ordo Canonicorum Regularium S. Augustini
15	\N	CLERIC	\N	C.R.	Theatines	Ordo Clericorum Regularium vulgo Theatinorum
17	\N	CLERIC	\N	Sch. P.	Piarists	Ordo Clericorum Regularium Pauperum Matris Dei Scholarum Piarum
18	\N	CLERIC	\N	B.	Barnabites	Congregatio Clericorum Regularium S. Pauli
19	\N	CLERIC	\N	M.I.	Camilians	Ordo Clericorum Regularium Ministrantium Infirmis
20	\N	CLERIC	\N	S.J.	Jesuits	Societas Jesu
22	\N	MENIDICANT	\N	O.M.	Minims	Ordo Minimorum
24	\N	MENIDICANT	\N	O.C.D.	Discalced Carmelites	Ordo Fratrum Discalceatorum B. Mariae V. de Monte Carmelo
23	\N	MENIDICANT	\N	O.S.A.	Augustinians	Ordo Fratrum Sancti Augustini
25	\N	MENIDICANT	\N	O.F.M.	Franciscans	Ordo Fratrum Minorum
26	\N	MENIDICANT	\N	O.F.M. Cap.	Capuchin Franciscans	Ordo Fratrum Minorum Capuccinorum
27	\N	MENIDICANT	\N	O.SS.T.	Trinitarians	Ordo Ssmae Trinitatis
28	\N	MENIDICANT	\N	O. Carm.	Carmelites	Ordo Fratrum Beatissimae Mariae Virginis de Monte Carmelo
29	\N	MENIDICANT	\N	O.F.M. Conv.	Conventual Franciscans	Ordo Fratrum Minorum Conventualium
30	\N	MENIDICANT	\N	O.S.M.	Servites	Ordo Servorum Mariae
31	\N	MENIDICANT	\N	O.A.R.	Augustinians Recollects	Ordo Augustinianorum Recollectorum
32	\N	MENIDICANT	\N	O.P.	Dominicans	Ordo Fratrum Praedicatorum
33	\N	MENIDICANT	\N	O.A.D.	Discalced Augustinians	Ordo Augustiniensium Discalceatorum
34	\N	MENIDICANT	\N	O. de M.	Mercedarians	Ordo B. Mariae Virginis de Mercede
35	\N	MENIDICANT	\N	T.O.R.	Brothers of Penance	Tertius Ordo Regularis S. Francisci
36	\N	MONASTIC	\N	O.S.H.	Hieronymites	Ordo Sancti Hieronymi
37	\N	MONASTIC	\N	Cart.	Carthusians	Ordo Cartusiensis
40	\N	MONASTIC	\N	O.S.P.P.E.	Pauline Fathers	Ordo Fratrum S. Pauli Primi Eremitae
41	\N	MONASTIC	\N	O.C.S.O.	Trappist	Ordo Cisterciensis Strictioris Observantiae
42	\N	MONASTIC	\N	O.S.B.M.	Basilians	Ordo Basilianus S. Iosaphat
44	\N	MONASTIC	\N	O. Cist.	Cistercians	Ordo Cisterciensis
45	\N	MONASTIC	\N	O.L.M.	Baladites	Ordo Libanensis Maronitarum
46	\N	MONASTIC	\N	O.S.B.	Benedictines	Ordo S. Benedicti
9	\N	CANONS_REGULAR	\N	C.R.A	\N	Congregatio Helvetica o Sancto Mauritio Agaunensis
10	\N	CANONS_REGULAR	\N	C.R.L.	\N	Congregatio Ssmi Salvatoris Lateranensis
16	\N	CLERIC	\N	O. M. D.	\N	Ordo Clericorum Regularium Matris Dei
21	\N	CLERIC	\N	C.R.S.	\N	Ordo Clericorum Regularium a Somascha
38	\N	MONASTIC	\N	O.M.M.	\N	Ordo Maronita Beatae Mariae Virginis
39	\N	MONASTIC	\N	B.C.	\N	Ordo Basilianus S. Iohannis Baptistae, Soaritarum Melkitarum
43	\N	MONASTIC	\N	B.S.	\N	Ordo Basilianus Ssmi Salvatoris Melkitarum
12	\N	CANONS_REGULAR	1131-01-01	O.R.C.	\N	Ordo Canonicorum Regularium Sancae Crucis
13	\N	CANONS_REGULAR	1120-01-01	O. Praem.	Norbertines or Premonstratensians	Candidus et Canonicus Ordo Praemonstratensis
14	\N	CANONS_REGULAR	1190-01-01	O.T.	\N	Ordo Fratrum Domus Hospitalis Sanctae Mariae Teutonicorum in Jerusalem
11	\N	CANONS_REGULAR	1211-01-01	O.S.C.	Holy Cross	Canonici Regulares Ordinis S. Crucis
\.


--
-- Data for Name: Saint; Type: TABLE DATA; Schema: public; Owner: anos
--

COPY public."Saint" (id, name, "religiousOrderId", alias, "dateOfBirth", "dateOfHeavenlyBirth", "foundedReligiousOrderId", nationality, "wasMartyred", "ambigousDateOfBirth", "ambigousDateOfHeavenlyBirth", "dateOfCanonization", "latinFeastDay", notes, "wikiLink", "ambigousDateOfCanonization", "countryCode") FROM stdin;
1	Aaron of Aleth	\N	\N	\N	\N	\N	\N	\N	unknown	after 552	\N	\N	Hermit	/wiki/Aaron_of_Aleth	\N	\N
2	Abraham Kidunaia	\N	\N	\N	\N	\N	\N	\N	unknown	c. 360	\N	\N	\N	/wiki/Abraham_Kidunaia	\N	\N
3	Abrosima	\N	\N	\N	\N	\N	\N	\N	200s	341	\N	\N	\N	/wiki/Abrosima	\N	\N
5	Abercius of Hieropolis	\N	\N	\N	\N	\N	\N	\N	unknown	c. 167	\N	\N	\N	/wiki/Abercius_of_Hieropolis	found in Roman Martyrology	\N
6	Abundius	\N	\N	\N	\N	\N	\N	\N	400s	469	\N	\N	\N	/wiki/Abundius	found in Roman Martyrology	\N
7	Abadiu of Antinoe	\N	\N	\N	\N	\N	\N	\N	300s	300s	\N	\N	\N	/wiki/Abadiu_of_Antinoe	\N	\N
8	Absadah	\N	\N	\N	\N	\N	\N	\N	200s	c. 300	\N	\N	\N	/wiki/Absadah	\N	\N
9	Abanoub	\N	\N	\N	\N	\N	\N	t	300s	300s	\N	\N	Coptic child martyr.	/wiki/Abanoub	\N	\N
10	Abdon	\N	\N	\N	\N	\N	\N	\N	100s	c. 250	\N	\N	\N	/wiki/Abdon_and_Sennen	found in Roman Martyrology	\N
11	Abamun of Tarnut	\N	\N	\N	\N	\N	\N	t	300s	372	\N	\N	Martyr	/wiki/Abamun_of_Tarnut	\N	\N
12	Abraham of Rostov	\N	\N	\N	\N	\N	\N	\N	900s	1045-1074	\N	\N	\N	/wiki/Abraham_of_Rostov	\N	\N
13	Achilleus	\N	\N	\N	\N	\N	\N	\N	0's	c. 100 AD	\N	\N	\N	/wiki/Saints_Nereus_and_Achilleus	found in Roman Martyrology	\N
20	Adalgott II of Disentis	\N	\N	\N	\N	\N	\N	\N	1100s	1165	\N	\N	Bishop of Chur	/wiki/Adalgott	\N	\N
15	Abraham of Smolensk	\N	\N	\N	\N	\N	\N	\N	1150 or 1172	c. 1222	\N	\N	\N	/wiki/Abraham_of_Smolensk	1549 by Pope Paul III	\N
22	Achillius of Larissa	\N	\N	\N	\N	\N	\N	\N	200s	330	\N	\N	\N	/wiki/Achillius_of_Larissa	\N	\N
21	Adamo Abate	\N	\N	\N	\N	\N	\N	\N	c. 990	3 May 1060–1070	\N	\N	Professed religious of the Benedictines	/wiki/Adamo_Abate	\N	\N
25	Adolf of Osnabrück	\N	\N	\N	\N	\N	\N	\N	c. 1185	30 June 1222 or 1224	\N	\N	\N	/wiki/Adolf_of_Osnabr%C3%BCck	1625 by Pope Urban VIII	\N
26	Abachum	\N	\N	\N	\N	\N	\N	\N	200s	270	\N	\N	\N	/wiki/Marius,_Martha,_Audifax,_and_Abachum	found in Roman Martyrology	\N
27	Adomnán	\N	\N	\N	\N	\N	\N	\N	c. 624	704	\N	\N	\N	/wiki/Adomn%C3%A1n	\N	\N
29	Agatha of Sicily	\N	\N	\N	\N	\N	\N	t	c. 231	c. 251	\N	\N	martyr; patron saint of breast cancer patients, martyrs, wet nurses, bell-founders, bakers, fire, earthquakes, and eruptions of Mount Etna	/wiki/Agatha_of_Sicily	found in Roman Martyrology	\N
32	Afra	\N	\N	\N	\N	\N	\N	t	291	304	\N	\N	virgin, martyr	/wiki/Afra	found in Roman Martyrology	\N
34	Agathopodes	\N	\N	\N	\N	\N	\N	\N	unknown	150	\N	\N	\N	/wiki/Philo_and_Agathopodes	found in Roman Martyrology	\N
35	Agathius	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Agathius	found in Roman Martyrology	\N
37	Agathangelus of Rome	\N	\N	\N	\N	\N	\N	\N	200s	c. 312	\N	\N	\N	/wiki/Agathangelus_of_Rome	found in Roman Martyrology	\N
41	Agnes of Rome	\N	\N	\N	\N	\N	\N	t	unknown	304	\N	\N	virgin, martyr	/wiki/Agnes_of_Rome	found in Roman Martyrology	\N
40	Abudimus	\N	\N	\N	\N	\N	\N	\N	200s	305	\N	\N	\N	/wiki/Abudimus	found in Roman Martyrology	\N
44	Agricius of Trier	\N	\N	\N	\N	\N	\N	\N	c. 260	329, 333 or 335	\N	\N	\N	/wiki/Agricius_of_Trier	found in Roman Martyrology	\N
46	Ailbe of Emly	\N	\N	\N	\N	\N	\N	\N	400s	528	\N	\N	\N	/wiki/Ailbe_of_Emly	\N	\N
47	Agricola	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Saints_Vitalis_and_Agricola	found in Roman Martyrology	\N
49	Alban	\N	\N	\N	\N	\N	\N	\N	unknown	22 June 209, 251, or 304	\N	\N	\N	/wiki/Saint_Alban	found in Roman Martyrology	\N
59	Alexander	\N	\N	\N	\N	\N	\N	\N	100s	177	\N	\N	\N	/wiki/Alexander_(martyr)	found in Roman Martyrology	\N
60	Alexander of Constantinople	\N	\N	\N	\N	\N	\N	\N	237–245	337	\N	\N	archbishop of Constantinople	/wiki/Alexander_of_Constantinople	found in Roman Martyrology	\N
63	Alexander of Jerusalem	\N	\N	\N	\N	\N	\N	\N	100s	251	\N	\N	\N	/wiki/Alexander_of_Jerusalem	found in Roman Martyrology	\N
65	Alexius of Rome	\N	\N	\N	\N	\N	\N	\N	300s	400s	\N	\N	\N	/wiki/Alexius_of_Rome	found in Roman Martyrology	\N
58	Alcuin	\N	\N	\N	0804-05-19	\N	\N	\N	c. 735	\N	\N	\N	played an important role in the development of the Carolingian minuscule	/wiki/Alcuin	\N	\N
57	Albertus Magnus	\N	\N	\N	1280-11-15	\N	\N	\N	before 1200	\N	1931-12-16	\N	\N	/wiki/Albertus_Magnus	\N	\N
56	Alberto Hurtado Cruchaga	\N	\N	1901-01-22	1952-08-18	\N	\N	\N	\N	\N	2005-10-23	\N	\N	/wiki/Alberto_Hurtado	\N	\N
55	Albert of Vercelli	\N	\N	\N	1214-09-14	\N	\N	\N	1100s	\N	\N	\N	also known as Albert of Jerusalem	/wiki/Albert_of_Vercelli	\N	\N
53	Albert of Trapani	\N	\N	\N	1307-08-07	\N	\N	\N	c. 1240	\N	1476-05-31	\N	\N	/wiki/Albert_of_Trapani	\N	\N
52	Albert Chmielowski	\N	\N	1845-08-20	1916-12-25	\N	\N	\N	\N	\N	1989-11-12	\N	\N	/wiki/Albert_Chmielowski	\N	\N
48	Alberic of Cîteaux	\N	\N	\N	1109-01-26	\N	\N	\N	1000s	\N	\N	\N	\N	/wiki/Alberic_of_C%C3%AEteaux	\N	\N
45	Alban Roe	\N	\N	1583-07-20	1642-01-21	\N	\N	t	\N	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Alban_Roe	\N	\N
51	Agustín Caloca Cortés	\N	\N	1898-05-05	1927-05-25	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Agust%C3%ADn_Caloca_Cort%C3%A9s	\N	\N
42	Agostino Roscelli	\N	\N	1818-07-27	1902-05-07	\N	\N	\N	\N	\N	2001-06-10	\N	\N	/wiki/Agostino_Roscelli	\N	\N
43	Agostina Livia Pietrantoni	\N	\N	1864-03-27	1894-11-13	\N	\N	\N	\N	\N	1999-04-18	\N	She was killed by a patient she was taking care of	/wiki/Agostina_Livia_Pietrantoni	\N	\N
39	Agnes of Montepulciano	\N	\N	1268-01-28	1317-04-20	\N	\N	\N	\N	\N	1726-12-10	\N	\N	/wiki/Agnes_of_Montepulciano	\N	\N
38	Agnes of Bohemia	\N	\N	1211-06-20	1282-03-02	\N	\N	\N	\N	\N	1989-11-12	\N	\N	/wiki/Agnes_of_Bohemia	\N	\N
36	Agapitus	\N	\N	\N	0258-08-06	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Felicissimus_and_Agapitus	found in Roman Martyrology	\N
30	Ælfheah of Canterbury	\N	\N	\N	1012-04-19	\N	\N	\N	c. 953	\N	\N	\N	Archbishop of Canterbury, Bishop of Winchester	/wiki/%C3%86lfheah_of_Canterbury	1078 by Pope Gregory VII	\N
31	Aedesius of Alexandria	\N	\N	\N	0306-04-08	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Aedesius_of_Alexandria	found in Roman Martyrology	\N
28	Adrian van Hilvarenbeek	\N	\N	\N	1572-07-09	\N	\N	t	1528	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Adrian_van_Hilvarenbeek	\N	\N
24	Adolphus Ludigo-Mkasa	\N	\N	\N	1886-06-03	\N	\N	t	c. 1861	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Adolphus_Ludigo-Mkasa	\N	\N
23	Adjutor	\N	\N	1073-06-24	1131-04-30	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Adjutor	\N	\N
19	Adelaide, Abbess of Vilich	\N	\N	\N	1015-02-05	\N	\N	\N	c. 970	\N	\N	\N	professed religious of the Benedictine nuns	/wiki/Adelaide,_Abbess_of_Vilich	\N	\N
18	Adelaide of Italy	\N	\N	\N	0999-12-16	\N	\N	\N	931	\N	\N	\N	married layperson of the Archdiocese of Burgundy, queen of Italy and Burgundy, empress	/wiki/Adelaide_of_Italy	1097 by Pope Urban II	\N
16	Adalbert of Prague	\N	\N	\N	0997-04-23	\N	\N	\N	956	\N	0999-02-03	\N	His skull is preserved and kept in the St. Vitus cathedral	/wiki/Adalbert_of_Prague	\N	\N
17	Adalard of Corbie	\N	\N	\N	0827-01-02	\N	\N	\N	751	\N	\N	\N	\N	/wiki/Adalard_of_Corbie	1026 by Pope John XIX	\N
4	Achilleus Kewanuka	\N	\N	\N	1886-06-03	\N	\N	t	1869	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Achilleus_Kewanuka	\N	\N
14	Acepsimas of Hnaita	\N	\N	\N	0376-10-10	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Acepsimas_of_Hnaita	found in Roman Martyrology	\N
33	Abra of Poitiers	\N	\N	0339-12-12	\N	\N	\N	\N	\N	c. 360	\N	\N	\N	/wiki/Abra_of_Poitiers	\N	\N
50	Abbo of Fleury	\N	\N	\N	1004-11-13	\N	\N	\N	945	\N	\N	\N	Assisted Archbishop of Oswald	/wiki/Abbo_of_Fleury	\N	\N
62	Alexander Sauli	\N	\N	1534-02-15	1592-10-11	\N	\N	\N	\N	\N	1904-12-11	\N	\N	/wiki/Alexander_Sauli	\N	\N
61	Alexander Briant	\N	\N	1556-08-17	1581-12-01	\N	\N	t	\N	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Alexander_Briant	\N	\N
75	Amandus	\N	\N	\N	\N	\N	\N	\N	584	679	\N	\N	\N	/wiki/Amandus	1584 by Pope Gregory XIII	\N
83	Ampelus	\N	\N	\N	\N	\N	\N	\N	200s	302	\N	\N	\N	/wiki/Ampelus	found in Roman Martyrology	\N
91	Anastasius of Suppentonia	\N	\N	\N	\N	\N	\N	\N	500s	570	\N	\N	\N	/wiki/Anastasius_of_Suppentonia	found in Roman Martyrology	\N
116	Anna the Prophetess	\N	\N	\N	\N	\N	\N	\N	1st century BC	0's	\N	\N	\N	/wiki/Anna_the_Prophetess	found in Roman Martyrology	\N
131	Anthony of Antioch	\N	\N	\N	\N	\N	\N	\N	266	302	\N	\N	\N	/wiki/Anthony_of_Antioch	found in Roman Martyrology	\N
142	Antoninus of Florence	\N	\N	\N	\N	\N	\N	\N	c. 983	c. 1073	\N	\N	\N	/wiki/Antoninus_of_Florence	31 May 1532 by Pope Gregory IX	\N
159	Aquilinus of Fossombrone	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/w/index.php?title=Aquilinus_of_Fossombrone&action=edit&redlink=1	found in Roman Martyrology	\N
160	Arcadius of Mauretania	\N	\N	\N	\N	\N	\N	\N	200s	c. 302	\N	\N	\N	/wiki/Arcadius_of_Mauretania	found in Roman Martyrology	\N
177	Audax	\N	\N	\N	\N	\N	\N	\N	200s	250	\N	\N	\N	/wiki/Victoria,_Anatolia,_and_Audax	found in Roman Martyrology	\N
190	Barnabas	\N	\N	\N	\N	\N	\N	\N	unknown	61 AD	\N	\N	\N	/wiki/Barnabas	found in Roman Martyrology	\N
240	Blaise	\N	\N	\N	\N	\N	\N	\N	200s	316	\N	\N	\N	/wiki/Saint_Blaise	found in Roman Martyrology	\N
279	Castor of Karden	\N	\N	\N	\N	\N	\N	\N	300s	c. 400	\N	\N	\N	/wiki/Castor_of_Karden	\N	\N
293	Chad of Mercia	\N	\N	\N	\N	\N	\N	\N	c. 634	March 2, 672	\N	\N	\N	/wiki/Chad_of_Mercia	found in Roman Martyrology	\N
327	Clotilde	\N	\N	\N	\N	\N	\N	\N	c. 474	545	\N	\N	\N	/wiki/Clotilde	\N	\N
350	Cunibert	\N	\N	\N	\N	\N	\N	\N	c. 600	12 November c. 663	\N	\N	\N	/wiki/Cunibert	found in Roman Martyrology	\N
359	Cyril of Alexandria	\N	\N	\N	\N	\N	\N	\N	c. 376	444	\N	\N	\N	/wiki/Cyril_of_Alexandria	found in Roman Martyrology	\N
368	Darius	\N	\N	\N	\N	\N	\N	\N	unknown	early 300s	\N	\N	\N	/wiki/Saint_Darius	found in Roman Martyrology	\N
387	Diomedes of Tarsus	\N	\N	\N	\N	\N	\N	\N	200s	298-311	\N	\N	\N	/wiki/Diomedes_of_Tarsus	\N	\N
405	Dubricius	\N	\N	\N	\N	\N	\N	\N	c. 465	550	\N	\N	\N	/wiki/Dubricius	\N	\N
469	Felicitas of Rome	\N	\N	\N	\N	\N	\N	\N	c. 101	c. 165	\N	\N	\N	/wiki/Felicitas_of_Rome	found in Roman Martyrology	\N
486	Firminus of Satala	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
489	Flavia Domitilla	\N	\N	\N	\N	\N	\N	\N	0's	c. 96 AD	\N	\N	\N	/wiki/Flavia_Domitilla_(Catholic_saint)	found in Roman Martyrology	\N
520	Fulgentius of Cartagena	\N	\N	\N	\N	\N	\N	\N	500s	c. 630	\N	\N	\N	/wiki/Fulgentius_of_Cartagena	\N	\N
522	Frumentius	\N	\N	\N	\N	\N	\N	\N	300s	c. 383	\N	\N	\N	/wiki/Frumentius	found in Roman Martyrology	\N
536	Gaucherius	\N	\N	\N	\N	\N	\N	\N	1060	1140	\N	\N	\N	/wiki/Gaucherius	1194 by Pope Clement III	\N
539	Gelasius of Fossombrone	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/w/index.php?title=Gelasius_of_Fossombrone&action=edit&redlink=1	found in Roman Martyrology	\N
571	Gilbert of Sempringham	\N	\N	\N	\N	\N	\N	\N	c. 1085	4 February 1189 or 1190	\N	\N	\N	/wiki/Gilbert_of_Sempringham	1202 by Pope Innocent III	\N
505	Francis Kichi	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Francis_Kichi&action=edit&redlink=1	\N	\N
503	Francis Fasani	\N	\N	1681-08-06	1742-11-29	\N	\N	\N	\N	\N	1986-04-13	\N	professed priest of the Franciscan Conventuals	/wiki/Francis_Fasani	\N	\N
472	Felix of Cantalice	\N	\N	1515-05-18	1587-05-18	\N	\N	\N	\N	\N	1712-05-22	\N	\N	/wiki/Felix_of_Cantalice	\N	\N
455	Eutropius of Orange	\N	\N	\N	0475-05-27	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Eutropius_of_Orange	found in Roman Martyrology	\N
451	Eustace White	\N	\N	\N	1591-12-10	\N	\N	t	1559	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Eustace_White	\N	\N
438	Eric IX of Sweden	\N	\N	\N	1160-05-18	\N	\N	\N	c. 1120-25	\N	\N	\N	\N	/wiki/Eric_IX_of_Sweden	found in Roman Martyrology	\N
431	Enrique de Ossó i Cervelló	\N	\N	1840-10-16	1896-01-27	\N	\N	\N	\N	\N	1993-06-16	\N	\N	/wiki/Enrique_de_Oss%C3%B3_i_Cervell%C3%B3	\N	\N
421	Elizabeth of the Trinity	\N	\N	1880-07-18	1906-11-09	\N	\N	\N	\N	\N	2016-10-16	\N	\N	/wiki/Elizabeth_of_the_Trinity	\N	\N
409	Edward the Confessor	\N	\N	\N	1066-01-05	\N	\N	\N	c. 1003–1005	\N	1161-02-07	\N	\N	/wiki/Edward_the_Confessor	\N	\N
393	Dominic de Guzmán	\N	\N	1170-08-08	1221-08-06	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Saint_Dominic	13 July 1234 by Pope Gregory IX	\N
374	David Roldán Lara	\N	\N	1907-03-02	1926-08-15	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/David_Rold%C3%A1n_Lara	\N	\N
341	Cosmas Takeya	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Cosmas_Takeya&action=edit&redlink=1	\N	\N
333	Conrad of Constance	\N	\N	\N	0975-11-26	\N	\N	\N	c. 900	\N	\N	\N	\N	/wiki/Conrad_of_Constance	1123 by Pope Callixtus II	\N
318	Claude de la Colombière	\N	\N	1641-02-02	1682-02-15	\N	\N	\N	\N	\N	1992-05-31	\N	\N	/wiki/Claude_de_la_Colombi%C3%A8re	\N	\N
308	Chelidonia	\N	\N	\N	1152-10-13	\N	\N	\N	c. 1 October 1077	\N	\N	\N	\N	/wiki/Chelidonia	found in Roman Martyrology	\N
303	Charles of Mount Argus	\N	\N	1821-12-11	1893-01-05	\N	\N	\N	\N	\N	2007-06-03	\N	\N	/wiki/Charles_of_Mount_Argus	\N	\N
290	Catherine of Siena	\N	\N	1347-03-25	1380-04-29	\N	\N	\N	\N	\N	1461-06-29	\N	\N	/wiki/Catherine_of_Siena	\N	\N
274	Canute Lavard	\N	\N	\N	1131-01-07	\N	\N	\N	1096	\N	\N	\N	\N	/wiki/Canute_Lavard	1169 by Pope Alexander III	\N
258	Bruno Sserunkuuma	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Bruno_Sserunkuuma&action=edit&redlink=1	\N	\N
256	Bruno of Cologne	\N	\N	\N	1101-10-06	\N	\N	\N	c. 1030	\N	\N	\N	\N	/wiki/Bruno_of_Cologne	17 February 1623 by Pope Gregory XV	\N
239	Boniface of Brussels	\N	\N	\N	1260-02-19	\N	\N	\N	1183	\N	\N	\N	\N	/wiki/Boniface_of_Brussels	1702 by Pope Clement XI	\N
226	Bernardino of Siena	\N	\N	1380-09-08	1444-05-20	\N	\N	\N	\N	\N	1450-05-24	\N	\N	/wiki/Bernardino_of_Siena	\N	\N
228	Bernard of Corleone	\N	\N	1605-02-06	1667-01-12	\N	\N	\N	\N	\N	2001-06-10	\N	\N	/wiki/Bernard_of_Corleone	\N	\N
209	Benedict Joseph Labre	\N	\N	1748-03-25	1783-04-16	\N	\N	\N	\N	\N	1881-12-08	\N	\N	/wiki/Benedict_Joseph_Labre	\N	\N
211	Benedetta Cambiagio Frassinello	\N	\N	1791-10-02	1858-03-21	\N	\N	\N	\N	\N	2002-05-19	\N	Founder of the Benedictine Sisters of Providence	/wiki/Benedetta_Cambiagio_Frassinello	\N	\N
194	Bartolomea Capitanio	\N	\N	1807-01-13	1833-07-26	\N	\N	\N	\N	\N	1950-05-18	\N	Cofounder of the Sisters of Charity of Saints Bartolomea Capitanio and Vincenzo Gerosa (Sisters of the Holy Child Mary)	/wiki/Bartolomea_Capitanio	\N	\N
176	Atilano Cruz Alvarado	\N	\N	1901-10-05	1928-07-01	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Atilano_Cruz_Alvarado	\N	\N
143	Antonio Gonzalez	\N	\N	\N	1637-09-24	\N	\N	t	1593	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Antonio_Gonz%C3%A1lez_(martyr)	\N	\N
129	Anthony Dainan	\N	\N	\N	1597-02-05	\N	\N	t	1584	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Anthony_Dainan	\N	\N
108	Angela of Foligno	\N	\N	\N	1309-01-03	\N	\N	\N	1248	\N	2013-10-09	\N	Her canonization was an "equivalent canonization" (without executing the ordinary judicial process of canonization).	/wiki/Angela_of_Foligno	\N	\N
99	Andrew Avellino	\N	\N	\N	1608-11-10	\N	\N	\N	1521	\N	1712-05-22	\N	\N	/wiki/Andrew_Avellino	\N	\N
66	Alfonso Maria Fusco	\N	\N	1839-03-23	1910-02-06	\N	\N	\N	\N	\N	2016-10-16	\N	\N	/wiki/Alfonso_Maria_Fusco	\N	\N
555	Germain of Paris	\N	\N	\N	0576-05-28	\N	\N	\N	c. 496	\N	\N	\N	Bishop of Paris	/wiki/Germain_of_Paris	found in Roman Martyrology	\N
552	Gerard of Csanád	\N	\N	0977-04-23	1046-08-29	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Gerard_of_Csan%C3%A1d	1083 by Pope Gregory VII	\N
93	Anastasius the Fuller	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Anastasius_the_Fuller	found in Roman Martyrology	\N
70	Alkmund of Derby	\N	\N	\N	\N	\N	\N	\N	c. 770	800	\N	\N	Killed by Eardwulf of Northumbria	/wiki/Alkmund_of_Derby	\N	\N
138	Antia of Illyria	\N	\N	\N	\N	\N	\N	\N	unknown	c. 138	\N	\N	\N	/wiki/Eleutherius_and_Antia	found in Roman Martyrology	\N
155	Apollonia	\N	\N	\N	\N	\N	\N	\N	100s	249	\N	\N	\N	/wiki/Saint_Apollonia	found in Roman Martyrology	\N
172	Asteria of Bergamo	\N	\N	\N	\N	\N	\N	\N	200s	307	\N	\N	\N	/wiki/Asteria_of_Bergamo	found in Roman Martyrology	\N
187	Bacchus	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Sergius_and_Bacchus	found in Roman Martyrology	\N
205	Bavo of Ghent	\N	\N	\N	\N	\N	\N	\N	622	653	\N	\N	\N	/wiki/Bavo_of_Ghent	found in Roman Martyrology	\N
238	Birillus	\N	\N	\N	\N	\N	\N	\N	unknown	90 AD	\N	\N	\N	/wiki/Birillus	found in Roman Martyrology	\N
254	Britto of Trier	\N	\N	\N	\N	\N	\N	\N	374	386	\N	\N	\N	/wiki/Britto_of_Trier	\N	\N
273	Caprasius of Agen	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Caprasius_of_Agen	found in Roman Martyrology	\N
294	Cermanus	\N	\N	\N	\N	\N	\N	\N	200s	c. 305	\N	\N	\N	/wiki/Servandus_and_Cermanus	found in Roman Martyrology	\N
310	Chrysogonus	\N	\N	\N	\N	\N	\N	\N	200s	300s	\N	\N	\N	/wiki/Saint_Chrysogonus	found in Roman Martyrology	\N
313	Ciarán of Saigir	\N	\N	\N	\N	\N	\N	\N	400s	c. 530	\N	\N	\N	/wiki/Ciar%C3%A1n_of_Saigir	\N	\N
325	Cleopatra	\N	\N	\N	\N	\N	\N	\N	200s	319 or 327	\N	\N	\N	/wiki/Saint_Cleopatra	\N	\N
342	Crescentian	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Crescentian	found in Roman Martyrology	\N
344	Crescentius of Rome	\N	\N	\N	\N	\N	\N	\N	c. 292	c. 303	\N	\N	\N	/wiki/Crescentius_of_Rome	found in Roman Martyrology	\N
360	Cyrinus of Rome	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Basilides,_Cyrinus,_Nabor_and_Nazarius	found in Roman Martyrology	\N
399	Domitian of Carantania	\N	\N	\N	\N	\N	\N	\N	700s	802	\N	\N	Duke of Carantania	/wiki/Domitian_of_Carantania	\N	\N
417	Eleutherius of Illyria	\N	\N	\N	\N	\N	\N	\N	c. 100	c. 138	\N	\N	\N	/wiki/Eleutherius_and_Antia	found in Roman Martyrology	\N
433	Epitacius	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/w/index.php?title=Epitacius&action=edit&redlink=1	found in Roman Martyrology	\N
450	Euphrosyne of Alexandria	\N	\N	\N	\N	\N	\N	\N	unknown	400's	\N	\N	\N	/wiki/Euphrosyne_of_Alexandria	found in Roman Martyrology	\N
485	Firmina	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/wiki/Firmina	found in Roman Martyrology	\N
496	Fortunatus of Spoleto	\N	\N	\N	\N	\N	\N	\N	300s	c. 400	\N	\N	\N	/wiki/Fortunatus_of_Spoleto	found in Roman Martyrology	\N
540	Geminianus	\N	\N	\N	\N	\N	\N	\N	300s	300s	\N	\N	bishop of Modena	/wiki/Geminianus	found in Roman Martyrology	\N
556	Getulius	\N	\N	\N	\N	\N	\N	\N	unknown	120	\N	\N	\N	/wiki/Getulius	found in Roman Martyrology	\N
619	Hermes	\N	\N	\N	\N	\N	\N	\N	unknown	120	\N	\N	\N	/wiki/Saint_Hermes	found in Roman Martyrology	\N
569	Giovanni Calabria	\N	\N	1873-10-08	1954-12-04	\N	\N	\N	\N	\N	1999-04-18	\N	\N	/wiki/Giovanni_Calabria	\N	\N
566	Giovanni Battista Scalabrini	\N	\N	1839-07-08	1905-06-01	\N	\N	\N	\N	\N	2022-10-09	\N	\N	/wiki/Giovanni_Battista_Scalabrini	\N	\N
549	Genoveva Torres Morales	\N	\N	1870-01-03	1956-01-05	\N	\N	\N	\N	\N	2003-05-04	\N	\N	/wiki/Genoveva_Torres_Morales	\N	\N
532	Gaspare Bertoni	\N	\N	1777-10-09	1853-06-12	\N	\N	\N	\N	\N	1989-11-01	\N	priest of the Diocese of Verona; founder of the Congregation of the Holy Stigmata (Stigmatines)	/wiki/Gaspare_Bertoni	\N	\N
528	Gaetano Catanoso	\N	\N	1879-02-14	1963-04-04	\N	\N	\N	\N	\N	2005-10-23	\N	\N	/wiki/Gaetano_Catanoso	\N	\N
512	Francisco Blanco	\N	\N	\N	1597-02-05	\N	\N	t	c. 1570	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Francisco_Blanco_(martyr)	\N	\N
513	Francis Xavier	\N	\N	1506-04-07	1552-12-02	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Francis_Xavier	12 March 1622 by Pope Gregory XV	\N
497	Francis Caracciolo	\N	\N	1563-10-13	1608-06-04	\N	\N	\N	\N	\N	1807-05-24	\N	\N	/wiki/Francis_Caracciolo	\N	\N
476	Felix of Valois	\N	\N	1127-04-16	1212-11-04	\N	\N	\N	\N	\N	1262-05-01	\N	\N	/wiki/Felix_of_Valois	\N	\N
470	Felicity	\N	\N	\N	0203-03-07	\N	\N	\N	100s	\N	\N	\N	See also Passion of Saint Perpetua, Saint Felicitas, and their Companions	/wiki/Perpetua_and_Felicity	found in Roman Martyrology	\N
459	Ezequiél Moreno y Díaz	\N	\N	1848-04-09	1906-08-19	\N	\N	\N	\N	\N	1992-10-11	\N	\N	/wiki/Ezequi%C3%A9l_Moreno_y_D%C3%ADaz	\N	\N
445	Eugène de Mazenod	\N	\N	1782-08-01	1861-05-21	\N	\N	\N	\N	\N	1995-12-03	\N	\N	/wiki/Eug%C3%A8ne_de_Mazenod	\N	\N
425	Emily de Vialar	\N	\N	1797-09-12	1856-08-24	\N	\N	\N	\N	\N	1951-06-24	\N	\N	/wiki/Emily_de_Vialar	\N	\N
403	Dorothea of Montau	\N	\N	1347-02-06	1394-06-25	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Dorothea_of_Montau	1976 (cultus confirmed) by Pope Paul VI	\N
384	Didacus of Alcalá	\N	\N	\N	1463-11-12	\N	\N	\N	c. 1400	\N	\N	\N	\N	/wiki/Didacus_of_Alcal%C3%A1	1588 by Pope Sixtus V	\N
380	Denis Ssebuggwawo Wasswa	\N	\N	\N	1886-05-25	\N	\N	t	1870	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Denis_Ssebuggwawo_Wasswa	\N	\N
367	Daniel and Companions	\N	\N	\N	1227-10-10	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Daniel_and_Companions	1516 by Pope Leo X	\N
330	Columban	\N	\N	\N	0615-11-23	\N	\N	\N	540	\N	\N	\N	\N	/wiki/Columbanus	\N	\N
291	Catherine of Vadstena	\N	\N	1538-10-02	1381-03-24	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Catherine_of_Vadstena	1484 (cultus confirmed) by Innocent VIII	\N
272	Canute IV of Denmark	\N	\N	\N	1086-07-10	\N	\N	\N	c. 1042	\N	1101-04-19	\N	\N	/wiki/Canute_IV_of_Denmark	\N	\N
257	Bruno of Segni	\N	\N	\N	1123-07-18	\N	\N	\N	c. 1045	\N	1181-09-05	\N	\N	/wiki/Bruno_(bishop_of_Segni)	\N	\N
246	Bonaventure	\N	\N	\N	1274-07-15	\N	\N	\N	1221	\N	1482-04-14	\N	\N	/wiki/Bonaventure	\N	\N
224	Bernadette Soubirous	\N	\N	1844-01-07	1879-04-16	\N	\N	\N	\N	\N	1933-12-08	\N	\N	/wiki/Bernadette_Soubirous	\N	\N
223	Berard of Carbio	\N	\N	\N	1220-01-16	\N	\N	\N	1100s	\N	1481-08-07	\N	\N	/wiki/Berard_of_Carbio	\N	\N
203	Beatrice of Silva	\N	\N	\N	1492-08-16	\N	\N	\N	c. 1424	\N	1976-10-03	\N	\N	/wiki/Beatrice_of_Silva	\N	\N
189	Bademus	\N	\N	\N	0376-04-10	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Bademus	\N	\N
169	Athanasius of Alexandria	\N	\N	\N	0373-05-02	\N	\N	\N	296–298	\N	\N	\N	\N	/wiki/Athanasius_of_Alexandria	found in Roman Martyrology	\N
158	Apollonius the Apologist	\N	\N	\N	0185-04-21	\N	\N	\N	100s	\N	\N	\N	\N	/wiki/Apollonius_the_Apologist	found in Roman Martyrology	\N
137	Anthony the Great	\N	\N	0251-01-12	0356-01-17	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Anthony_the_Great	found in Roman Martyrology	\N
123	Anselm of Canterbury	\N	\N	\N	1109-04-21	\N	\N	\N	c. 1033	\N	\N	\N	\N	/wiki/Anselm_of_Canterbury	1163 by Pope Alexander III	\N
119	Annibale Maria di Francia	\N	\N	1851-07-05	1927-06-01	\N	\N	\N	\N	\N	2004-05-16	\N	\N	/wiki/Annibale_Maria_di_Francia	\N	\N
104	Andrew Wouters	\N	\N	\N	1572-07-09	\N	\N	t	1542	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Andrew_Wouters	\N	\N
102	Andrew Kaggwa	\N	\N	\N	1886-05-26	\N	\N	t	1856	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Andrew_Kaggwa	\N	\N
84	Amphibalus	\N	\N	\N	0304-06-25	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Amphibalus	\N	\N
76	Amantius of Como	\N	\N	\N	0448-04-08	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Amantius_of_Como	found in Roman Martyrology	\N
602	Guarinus of Palestrina	\N	\N	\N	1158-02-06	\N	\N	\N	c. 1080	\N	\N	\N	\N	/wiki/Guarinus_of_Palestrina	1159 by Pope Alexander III	\N
584	Godfried Coart	\N	\N	\N	1572-07-09	\N	\N	t	1512	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Godfried_Coart	\N	\N
85	Amun	\N	\N	\N	\N	\N	\N	\N	200s	300s	\N	\N	\N	/wiki/Saint_Amun	\N	\N
92	Anastasius Sinaita	\N	\N	\N	\N	\N	\N	\N	600s	700s	\N	\N	\N	/wiki/Anastasius_Sinaita	found in Roman Martyrology	\N
106	Andrew of Crete	\N	\N	\N	\N	\N	\N	\N	c. 650	4 July 712 or 726 or 740	\N	\N	\N	/wiki/Andrew_of_Crete	\N	\N
117	Anne	\N	\N	\N	\N	\N	\N	\N	c. 50 BC	12 AD	\N	\N	\N	/wiki/Saint_Anne	found in Roman Martyrology	\N
125	Anthimus of Nicomedia	\N	\N	\N	\N	\N	\N	\N	200s	303, 311, or 312	\N	\N	\N	/wiki/Anthimus_of_Nicomedia	found in Roman Martyrology	\N
147	Antipas of Pergamum	\N	\N	\N	\N	\N	\N	\N	unknown	0s	\N	\N	\N	/wiki/Antipas_of_Pergamum	found in Roman Martyrology	\N
150	Aphrahat	\N	\N	\N	\N	\N	\N	\N	c. 280	c. 345	\N	\N	\N	/wiki/Aphrahat	found in Roman Martyrology	\N
165	Ariadne of Phrygia	\N	\N	\N	\N	\N	\N	\N	unknown	130	\N	\N	\N	/wiki/Ariadne_of_Phrygia	found in Roman Martyrology	\N
178	Attilanus	\N	\N	\N	\N	\N	\N	\N	937	1007	\N	\N	\N	/wiki/Attilanus	1095 by Pope Urban II	\N
185	Auspicius of Trier	\N	\N	\N	\N	\N	\N	\N	unknown	c. 130	\N	\N	\N	/wiki/Auspicius_of_Trier	found in Roman Martyrology	\N
195	Bartholomew the Apostle	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Bartholomew_the_Apostle	found in Roman Martyrology	\N
206	Beatrix	\N	\N	\N	\N	\N	\N	\N	200s	302 or 303	\N	\N	\N	/wiki/Simplicius,_Faustinus_and_Beatrix	found in Roman Martyrology	\N
227	Bernard of Menthon	\N	\N	\N	\N	\N	\N	\N	c. 1020	June 1081	\N	\N	professed religious of the Canons Regular of Saint Augustine	/wiki/Bernard_of_Menthon	1681 by Pope Innocent XI	\N
241	Blandina	\N	\N	\N	\N	\N	\N	\N	c. 162	177	\N	\N	\N	/wiki/Blandina	found in Roman Martyrology	\N
244	Boethius	\N	\N	\N	\N	\N	\N	\N	c. 477	524	\N	\N	\N	/wiki/Boethius	\N	\N
259	Caesarius of Nazianzus	\N	\N	\N	\N	\N	\N	\N	c. 331	c. 368	\N	\N	\N	/wiki/Caesarius_of_Nazianzus	found in Roman Martyrology	\N
261	Cainnech of Aghaboe	\N	\N	\N	\N	\N	\N	\N	c. 515	600	\N	\N	\N	/wiki/Cainnech_of_Aghaboe	found in Roman Martyrology	\N
292	Cedd	\N	\N	\N	\N	\N	\N	\N	c. 620	October 26, 664	\N	\N	\N	/wiki/Cedd	\N	\N
298	Celsus	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Nazarius_and_Celsus	found in Roman Martyrology	\N
311	Christina of Bolsena	\N	\N	\N	\N	\N	\N	\N	200s	200s	\N	\N	\N	/wiki/Christina_of_Bolsena	found in Roman Martyrology	\N
347	Crescentinus	\N	\N	\N	\N	\N	\N	\N	c. 292	c. 303	\N	\N	\N	/wiki/Crescentinus	found in Roman Martyrology	\N
362	Damian	\N	\N	\N	\N	\N	\N	\N	200s	c. 287	\N	\N	\N	/wiki/Saints_Cosmas_and_Damian	found in Roman Martyrology	\N
378	Demetrius of Thessaloniki	\N	\N	\N	\N	\N	\N	\N	280	305 or 306	\N	\N	\N	/wiki/Demetrius_of_Thessaloniki	found in Roman Martyrology	\N
390	Dionysius of Vienne	\N	\N	\N	\N	\N	\N	\N	100s	193	\N	\N	\N	/wiki/Dionysius_of_Vienne	found in Roman Martyrology	\N
398	Donatus of Euroea	\N	\N	\N	\N	\N	\N	\N	300s	387	\N	\N	\N	/wiki/Donatus_of_Euroea	found in Roman Martyrology	\N
415	Elias of Palestine	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Elias_of_Palestine	found in Roman Martyrology	\N
423	Emerentiana	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Emerentiana	found in Roman Martyrology	\N
439	Eucherius of Lyon	\N	\N	\N	\N	\N	\N	\N	c. 380	c. 449	\N	\N	\N	/wiki/Eucherius_of_Lyon	\N	\N
456	Evellius	\N	\N	\N	\N	\N	\N	\N	unknown	66 AD	\N	\N	\N	/wiki/Evellius	found in Roman Martyrology	\N
467	Felician	\N	\N	\N	\N	\N	\N	\N	200s	c. 297	\N	\N	\N	/wiki/Primus_and_Felician	found in Roman Martyrology	\N
473	Felix	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Nabor_and_Felix	found in Roman Martyrology	\N
490	Florentius of Vienne	\N	\N	\N	\N	\N	\N	\N	unknown	c. 377	\N	\N	Bishop of Vienne	/wiki/Florentius_of_Vienne	found in Roman Martyrology	\N
545	Genevieve	\N	\N	\N	\N	\N	\N	\N	419-422	502-512	\N	\N	\N	/wiki/Genevieve	found in Roman Martyrology	\N
581	Gobnait	\N	\N	\N	\N	\N	\N	\N	400s to 500s	400s to 500s	\N	\N	\N	/wiki/Gobnait	\N	\N
592	Gregory of Langres	\N	\N	\N	\N	\N	\N	\N	c. 446	539	\N	\N	\N	/wiki/Gregory_of_Langres	found in Roman Martyrology	\N
596	Gregory of Nyssa	\N	\N	\N	\N	\N	\N	\N	c. 335	c. 395	\N	\N	\N	/wiki/Gregory_of_Nyssa	found in Roman Martyrology	\N
609	Helena of Constantinople	\N	\N	\N	\N	\N	\N	\N	c. 246 or 248	c. 330	\N	\N	\N	/wiki/Helena_(empress)	found in Roman Martyrology	\N
611	Heliodorus of Altino	\N	\N	\N	\N	\N	\N	\N	300s	c. 390	\N	\N	\N	/wiki/Heliodorus_of_Altino	found in Roman Martyrology	\N
623	Hermias	\N	\N	\N	\N	\N	\N	\N	100s	160	\N	\N	\N	/wiki/Saint_Hermias	found in Roman Martyrology	\N
530	Gaetano Errico	\N	\N	1791-10-19	1860-10-29	\N	\N	\N	\N	\N	2008-10-12	\N	\N	/wiki/Gaetano_Errico	\N	\N
515	Francisco Coll Guitart	\N	\N	1812-05-18	1875-04-02	\N	\N	\N	\N	\N	2009-10-11	\N	\N	/wiki/Francisco_Coll_Guitart	\N	\N
507	Francis of Paola	\N	\N	1416-03-27	1507-04-02	\N	\N	\N	\N	\N	1519-05-01	\N	\N	/wiki/Francis_of_Paola	\N	\N
498	Francis de Sales	\N	\N	1567-08-21	1622-12-28	\N	\N	\N	\N	\N	1665-04-08	\N	\N	/wiki/Francis_de_Sales	\N	\N
483	Filippo Smaldone	\N	\N	1848-07-27	1923-06-04	\N	\N	\N	\N	\N	2006-10-15	\N	\N	/wiki/Filippo_Smaldone	\N	\N
449	Eusebius of Vercelli	\N	\N	\N	0371-08-01	\N	\N	\N	c. 2 March 283	\N	\N	\N	\N	/wiki/Eusebius_of_Vercelli	found in Roman Martyrology	\N
432	Ephrem the Syrian	\N	\N	\N	0373-06-09	\N	\N	\N	c. 306	\N	\N	\N	\N	/wiki/Ephrem_the_Syrian	found in Roman Martyrology	\N
408	Edmund Campion	\N	\N	1540-01-24	1581-12-01	\N	\N	t	\N	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Edmund_Campion	\N	\N
382	Devasahayam Pillai	\N	\N	1712-04-23	1752-01-14	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Devasahayam_Pillai	\N	\N
346	Crispin of Viterbo	\N	\N	1668-11-13	1750-05-19	\N	\N	\N	\N	\N	1982-06-20	\N	professed priest of the Franciscan Capuchins	/wiki/Crispin_of_Viterbo	\N	\N
332	Coloman of Stockerau	\N	\N	\N	1012-10-18	\N	\N	\N	900s	\N	\N	\N	\N	/wiki/Coloman_of_Stockerau	found in Roman Martyrology	\N
326	Colette of Corbie	\N	\N	1381-01-13	1447-03-06	\N	\N	\N	\N	\N	1807-05-24	\N	\N	/wiki/Colette_of_Corbie	\N	\N
315	Cirilo Bertrán	\N	\N	1888-03-20	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Cirilo_Bertr%C3%A1n&action=edit&redlink=1	\N	\N
280	Cassian of Imola	\N	\N	\N	0363-08-13	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Cassian_of_Imola	found in Roman Martyrology	\N
275	Carmen Salles y Barangueras	\N	\N	1848-04-09	1911-07-25	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Carmen_Salles_y_Barangueras	\N	\N
222	Benno	\N	\N	\N	1106-06-16	\N	\N	\N	c. 1010	\N	1523-05-31	\N	\N	/wiki/Benno_of_Meissen	\N	\N
213	Benedict Menni	\N	\N	1841-03-11	1914-04-24	\N	\N	\N	\N	\N	1999-11-21	\N	\N	/wiki/Benedict_Menni	\N	\N
168	Artémides Zatti	\N	\N	1880-10-12	1951-03-15	\N	\N	\N	\N	\N	2022-10-09	\N	\N	/wiki/Art%C3%A9mides_Zatti	\N	\N
133	Anthony of Kiev	\N	\N	1195-08-15	1231-06-13	\N	\N	\N	\N	\N	\N	\N	Russian Orthodox saint, founder of the Kiev Pechersk Lavra.	/wiki/Anthony_of_Kiev	found in Roman Martyrology	\N
100	Andrew Bobola	\N	\N	\N	1657-05-16	\N	\N	t	1591	\N	1938-04-17	\N	professed priest of the Jesuits; Martyr	/wiki/Andrew_Bobola	\N	\N
77	Amato Ronconi	\N	\N	\N	1292-05-08	\N	\N	\N	1225	\N	2014-11-23	\N	\N	/wiki/Amato_Ronconi	\N	\N
71	Alphonsa	\N	\N	1910-08-19	1946-07-28	\N	\N	\N	\N	\N	2008-10-12	\N	She was the first woman of Indian origin to be canonised as a saint by the Catholic Church	/wiki/Saint_Alphonsa	\N	\N
565	Giordano Ansaloni	\N	\N	1598-11-01	1634-11-17	\N	\N	t	\N	\N	1987-10-18	\N	one of the 16 Martyrs of Japan	/wiki/Giordano_Ansaloni	\N	\N
547	Gerald of Sauve-Majeure	\N	\N	\N	\N	\N	\N	\N	1025	1095	1197-04-27	\N	\N	/wiki/Gerald_of_Sauve-Majeure	\N	\N
526	Galgano Guidotti	\N	\N	\N	1181-12-03	\N	\N	\N	1148	\N	\N	\N	\N	/wiki/Galgano_Guidotti	1185 by Pope Lucius III	\N
87	Anastasia	\N	\N	\N	\N	\N	\N	\N	0's	68 AD	\N	\N	\N	/wiki/Basilissa_and_Anastasia	found in Roman Martyrology	\N
95	Anatolia	\N	\N	\N	\N	\N	\N	\N	200s	250	\N	\N	\N	/wiki/Victoria,_Anatolia,_and_Audax	found in Roman Martyrology	\N
157	Aquilinus of Évreux	\N	\N	\N	\N	\N	\N	\N	c. 620	695	\N	\N	\N	/wiki/Aquilinus_of_%C3%89vreux	found in Roman Martyrology	\N
162	Argeus of Tomi	\N	\N	\N	\N	\N	\N	\N	200s	c. 320	\N	\N	\N	/wiki/Narcissus,_Argeus,_and_Marcellinus	found in Roman Martyrology	\N
171	Aspren	\N	\N	\N	\N	\N	\N	\N	0's	100s	\N	\N	\N	/wiki/Aspren	found in Roman Martyrology	\N
188	Autonomus	\N	\N	\N	\N	\N	\N	\N	200s	c. 313	\N	\N	\N	/wiki/Autonomus	found in Roman Martyrology	\N
196	Barulas	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Barulas	found in Roman Martyrology	\N
237	Bibiana	\N	\N	\N	\N	\N	\N	\N	300s	300s	\N	\N	\N	/wiki/Saint_Bibiana	found in Roman Martyrology	\N
247	Boris	\N	\N	\N	\N	\N	\N	\N	986	1015	\N	\N	\N	/wiki/Boris_and_Gleb	\N	\N
282	Castulus	\N	\N	\N	\N	\N	\N	\N	200s	286	\N	\N	\N	/wiki/Castulus	found in Roman Martyrology	\N
316	Clateus	\N	\N	\N	\N	\N	\N	\N	unknown	64 AD	\N	\N	\N	/wiki/Clateus	found in Roman Martyrology	\N
338	Corebus	\N	\N	\N	\N	\N	\N	\N	unknown	138	\N	\N	\N	/wiki/Corebus	found in Roman Martyrology	\N
355	Cyriacus	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Cyriacus	found in Roman Martyrology	\N
369	Dathus	\N	\N	\N	\N	\N	\N	\N	100s	190	\N	\N	bishop of Ravenna	/wiki/Dathus	found in Roman Martyrology	\N
373	David the Dendrite	\N	\N	\N	\N	\N	\N	\N	c. 450	540	\N	\N	\N	/wiki/David_the_Dendrite	\N	\N
385	Diodorus of Tarsus	\N	\N	\N	\N	\N	\N	\N	300s	390	\N	\N	\N	/wiki/Diodorus_of_Tarsus	\N	\N
391	Dionysius the Areopagite	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Dionysius_the_Areopagite	found in Roman Martyrology	\N
400	Donatus of Fossombrone	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/w/index.php?title=Donatus_of_Fossombrone&action=edit&redlink=1	found in Roman Martyrology	\N
413	Eleuchadius	\N	\N	\N	\N	\N	\N	\N	0's	112	\N	\N	bishop of Ravenna	/wiki/Eleuchadius	found in Roman Martyrology	\N
441	Eudokia of Heliopolis	\N	\N	\N	\N	\N	\N	\N	0's	107	\N	\N	\N	/wiki/Eudokia_of_Heliopolis	found in Roman Martyrology	\N
463	Fanchea	\N	\N	\N	\N	\N	\N	\N	500s	c. 585	\N	\N	\N	/wiki/Fanchea	\N	\N
494	Franca Visalta	\N	\N	\N	\N	\N	\N	\N	1170	1218	\N	\N	\N	/wiki/Franca_Visalta	September 1273 by Pope Gregory X	\N
542	Genesius of Rome	\N	\N	\N	\N	\N	\N	\N	200's	303	\N	\N	\N	/wiki/Genesius_of_Rome	found in Roman Martyrology	\N
544	Genesius of Arles	\N	\N	\N	\N	\N	\N	\N	200s	303 or 308	\N	\N	\N	/wiki/Genesius_of_Arles	found in Roman Martyrology	\N
614	Henry II	\N	\N	0973-05-06	1024-07-13	\N	\N	\N	\N	\N	\N	\N	emperor of Burgundy and Bavaria	/wiki/Henry_II,_Holy_Roman_Emperor	July 1147 by Pope Eugene III	\N
595	Gregory of Narek	\N	\N	\N	\N	\N	\N	\N	945–951	1003–1011	2015-04-12	\N	\N	/wiki/Gregory_of_Narek	\N	\N
576	Giustino Russolillo	\N	\N	1891-01-18	1955-08-02	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Giustino_Russolillo	\N	\N
577	Giuseppe Moscati	\N	\N	1880-07-25	1927-04-12	\N	\N	\N	\N	\N	1987-10-25	\N	\N	/wiki/Giuseppe_Moscati	\N	\N
563	Gianna Beretta Molla	\N	\N	1922-10-04	1962-04-28	\N	\N	\N	\N	\N	2004-05-16	\N	\N	/wiki/Gianna_Beretta_Molla	\N	\N
560	Gertrude the Great	\N	\N	1256-01-06	\N	\N	\N	\N	\N	c. 1302	\N	\N	\N	/wiki/Gertrude_the_Great	1677 (equipollent) by Pope Clement XII	\N
525	Gabriel Lalemant	\N	\N	1610-10-03	1649-03-17	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Gabriel_Lalemant	\N	\N
508	Francis of Roye	\N	\N	\N	1572-07-09	\N	\N	t	1549	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Francis_of_Roye&action=edit&redlink=1	\N	\N
493	Francesco Maria da Camporosso	\N	\N	1804-12-27	1866-09-17	\N	\N	\N	\N	\N	1962-12-09	\N	\N	/wiki/Francesco_Maria_da_Camporosso	\N	\N
480	Finnian of Clonard	\N	\N	\N	0549-12-12	\N	\N	\N	470	\N	\N	\N	\N	/wiki/Finnian_of_Clonard	\N	\N
482	Ferdinand III of Castile	\N	\N	\N	1252-05-30	\N	\N	\N	1199 or 1201	\N	\N	\N	\N	/wiki/Ferdinand_III_of_Castile	1671 by Pope Clement X	\N
461	Faustina Kowalska	\N	\N	1905-08-25	1938-10-05	\N	\N	\N	\N	\N	2000-04-30	\N	\N	/wiki/Faustina_Kowalska	\N	\N
444	Eugenius II of Toledo	\N	\N	\N	0657-11-13	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Eugenius_II_of_Toledo	found in Roman Martyrology	\N
427	Emma of Lesum	\N	\N	\N	1038-12-03	\N	\N	\N	1000s	\N	\N	\N	\N	/wiki/Emma_of_Lesum	\N	\N
424	Emeric of Hungary	\N	\N	\N	1031-09-02	\N	\N	\N	c. 1006	\N	\N	\N	\N	/wiki/Saint_Emeric_of_Hungary	5 November 1083 by Pope Gregory VII	\N
404	Drogo	\N	\N	1105-03-14	\N	\N	\N	\N	\N	c. 16 April 1186	\N	\N	\N	/wiki/Saint_Drogo	found in Roman Martyrology	\N
352	Cunigunde of Luxembourg	\N	\N	\N	1040-03-03	\N	\N	\N	975	\N	1200-03-29	\N	empress	/wiki/Cunigunde_of_Luxembourg	\N	\N
334	Conrad of Parzham	\N	\N	1818-12-22	1894-04-21	\N	\N	\N	\N	\N	1934-05-20	\N	\N	/wiki/Conrad_of_Parzham	\N	\N
320	Clelia Barbieri	\N	\N	1847-02-13	1870-07-13	\N	\N	\N	\N	\N	1989-04-09	\N	\N	/wiki/Clelia_Barbieri	\N	\N
299	Charles Borromeo	\N	\N	1538-10-02	1584-11-03	\N	\N	\N	\N	\N	1610-11-01	\N	\N	/wiki/Charles_Borromeo	\N	\N
301	Charbel Makhlouf	\N	\N	1828-05-08	1898-12-24	\N	\N	\N	\N	\N	1977-10-09	\N	\N	/wiki/Charbel_Makhlouf	\N	\N
285	Catherine Labouré	\N	\N	1806-05-02	1876-12-31	\N	\N	\N	\N	\N	1947-07-27	\N	\N	/wiki/Catherine_Labour%C3%A9	\N	\N
268	Camilla Battista da Varano	\N	\N	1458-04-09	1524-05-31	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Camilla_Battista_da_Varano	\N	\N
265	Cajetan	\N	\N	1480-10-01	1547-08-07	\N	\N	\N	\N	\N	1671-04-12	\N	\N	/wiki/Saint_Cajetan	\N	\N
253	Brinolfo Algotsson	\N	\N	\N	1317-02-06	\N	\N	\N	1240-1248	\N	1391-10-07	\N	\N	/wiki/Brinolfo_Algotsson	\N	\N
230	Bernardino Realino	\N	\N	1530-12-01	1616-07-02	\N	\N	\N	\N	\N	1947-06-22	\N	professed priest of the Jesuits	/wiki/Bernardino_Realino	\N	\N
219	Benvenutus Scotivoli	\N	\N	\N	1282-03-22	\N	\N	\N	1200s	\N	\N	\N	\N	/wiki/Benvenutus_Scotivoli	1284 by Pope Martin IV	\N
212	Benedict of Aniane	\N	\N	\N	0821-02-12	\N	\N	\N	747	\N	\N	\N	\N	/wiki/Benedict_of_Aniane	\N	\N
207	Bede	\N	\N	\N	0735-05-26	\N	\N	\N	c. 673	\N	\N	\N	also known as the Venerable Bede	/wiki/Bede	found in Roman Martyrology	\N
180	Augustine of Canterbury	\N	\N	\N	0604-05-26	\N	\N	\N	500s	\N	\N	\N	Founder of the English church.	/wiki/Augustine_of_Canterbury	found in Roman Martyrology	\N
141	Antonio Maria Pucci	\N	\N	1819-04-16	1892-01-12	\N	\N	\N	\N	\N	1962-12-09	\N	\N	/wiki/Antonio_Maria_Pucci	\N	\N
145	Antoine Daniel	\N	\N	1601-05-27	1648-07-04	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Antoine_Daniel	\N	\N
130	Anthony Mary Claret	\N	\N	1807-12-23	1870-10-24	\N	\N	\N	\N	\N	1950-05-07	\N	\N	/wiki/Anthony_Mary_Claret	\N	\N
122	Anno II	\N	\N	\N	1075-12-04	\N	\N	\N	c. 1010	\N	1183-04-29	\N	\N	/wiki/Anno_II	\N	\N
113	Aniceto Adolfo	\N	\N	1912-10-04	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Aniceto_Adolfo&action=edit&redlink=1	\N	\N
107	Angela of the Cross	\N	\N	1846-01-30	1932-03-02	\N	\N	\N	\N	\N	2003-05-04	\N	Founder of the Institute of the Sisters of the Company of the Cross.	/wiki/Angela_of_the_Cross	\N	\N
78	Amator	\N	\N	\N	0418-05-01	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Amator	found in Roman Martyrology	\N
68	Alfonso Rodríguez Olmedo	\N	\N	1598-03-10	1628-11-15	\N	\N	\N	\N	\N	1988-05-16	\N	\N	/wiki/Alfonso_Rodr%C3%ADguez_Olmedo	\N	\N
629	Honorius of Canterbury	\N	\N	\N	0653-09-30	\N	\N	\N	500s	\N	\N	\N	\N	/wiki/Honorius_of_Canterbury	found in Roman Martyrology	\N
612	Henry Morse	\N	\N	\N	1645-02-01	\N	\N	t	1595	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Henry_Morse	\N	\N
594	Gregorio Barbarigo	\N	\N	1625-09-16	1697-06-18	\N	\N	\N	\N	\N	1960-05-26	\N	Bishop of Padua; cardinal	/wiki/Gregorio_Barbarigo	\N	\N
149	Anysia of Salonika	\N	\N	\N	\N	\N	\N	\N	284	304	\N	\N	\N	/wiki/Anysia_of_Salonika	found in Roman Martyrology	\N
153	Apollinaris Claudius	\N	\N	\N	\N	\N	\N	\N	0's	100s	\N	\N	\N	/wiki/Apollinaris_Claudius	found in Roman Martyrology	\N
170	Asterius of Amasea	\N	\N	\N	\N	\N	\N	\N	c. 350	c. 410	\N	\N	\N	/wiki/Asterius_of_Amasea	\N	\N
184	Balbina of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	c. 130	\N	\N	\N	/wiki/Balbina_of_Rome	found in Roman Martyrology	\N
200	Basil the Elder	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Basil_the_Elder	found in Roman Martyrology	\N
204	Basilissa	\N	\N	\N	\N	\N	\N	\N	0's	68 AD	\N	\N	\N	/wiki/Basilissa_and_Anastasia	found in Roman Martyrology	\N
245	Boniface of Tarsus	\N	\N	\N	\N	\N	\N	\N	200s	307	\N	\N	\N	/wiki/Boniface_of_Tarsus	found in Roman Martyrology	\N
249	Brice of Tours	\N	\N	\N	\N	\N	\N	\N	c. 370	444	\N	\N	\N	/wiki/Brice_of_Tours	found in Roman Martyrology	\N
262	Caius of Milan	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/wiki/Caius_(bishop_of_Milan)	found in Roman Martyrology	\N
309	Christopher	\N	\N	\N	\N	\N	\N	\N	unknown	c. 251	\N	\N	\N	/wiki/Saint_Christopher	found in Roman Martyrology	\N
324	Claudius of Besançon	\N	\N	\N	\N	\N	\N	\N	c. 607	6 June 696 or 699	\N	\N	\N	/wiki/Claudius_of_Besan%C3%A7on	\N	\N
337	Constantius of Perugia	\N	\N	\N	\N	\N	\N	\N	unknown	c. 170	\N	\N	\N	/wiki/Constantius_of_Perugia	found in Roman Martyrology	\N
343	Cosmas	\N	\N	\N	\N	\N	\N	\N	200s	c. 287	\N	\N	\N	/wiki/Saints_Cosmas_and_Damian	found in Roman Martyrology	\N
358	Cyril of Jerusalem	\N	\N	\N	\N	\N	\N	\N	c. 313	386	\N	\N	\N	/wiki/Cyril_of_Jerusalem	found in Roman Martyrology	\N
388	Dionysius of Corinth	\N	\N	\N	\N	\N	\N	\N	unknown	100s	\N	\N	\N	/wiki/Dionysius,_Bishop_of_Corinth	found in Roman Martyrology	\N
392	Dismas	\N	\N	\N	\N	\N	\N	\N	unknown	30-33 AD	\N	\N	\N	/wiki/Penitent_thief	found in Roman Martyrology	\N
462	Fabius	\N	\N	\N	\N	\N	\N	\N	200s	303 or 304	\N	\N	\N	/wiki/Saint_Fabius	\N	\N
468	Faustus of Milan	\N	\N	\N	\N	\N	\N	\N	100s	190	\N	\N	\N	/wiki/Faustus_of_Milan	found in Roman Martyrology	\N
479	Fintan of Clonenagh	\N	\N	\N	\N	\N	\N	t	c. 526	603	\N	\N	found in Roman Martyrology	/wiki/Fintan_of_Clonenagh	\N	\N
487	Firmus of Satala	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
521	Fulgentius of Ruspe	\N	\N	\N	\N	\N	\N	\N	c. 465	1 January 527 or 533	\N	\N	\N	/wiki/Fulgentius_of_Ruspe	found in Roman Martyrology	\N
531	Gamaliel	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Gamaliel	found in Roman Martyrology	\N
538	Gaudiosus of Tarazona	\N	\N	\N	\N	\N	\N	\N	400s	c. 540	\N	\N	\N	/wiki/Gaudiosus_of_Tarazona	\N	\N
557	Germanicus of Smyrna	\N	\N	\N	\N	\N	\N	t	100s	155	\N	\N	martyr	/wiki/Germanicus_of_Smyrna	found in Roman Martyrology	\N
579	Gleb	\N	\N	\N	\N	\N	\N	\N	987	1015	\N	\N	\N	/wiki/Boris_and_Gleb	\N	\N
597	Gregory of Nazianzus	\N	\N	\N	0390-01-25	\N	\N	\N	329	\N	\N	\N	\N	/wiki/Gregory_of_Nazianzus	found in Roman Martyrology	\N
590	Gotthard of Hildesheim	\N	\N	\N	1038-05-04	\N	\N	\N	960	\N	\N	\N	\N	/wiki/Gotthard_of_Hildesheim	1131 by Pope Innocent II	\N
572	Giovanni Leonardi	\N	\N	\N	1609-10-09	\N	\N	\N	1541	\N	1938-04-17	\N	priest and founder of the Clerics Regular of the Mother of God	/wiki/St._Giovanni_Leonardi	\N	\N
561	Giovanni Battista de' Rossi	\N	\N	1698-02-22	1764-05-23	\N	\N	\N	\N	\N	1881-12-08	\N	\N	/wiki/Giovanni_Battista_de%27_Rossi	\N	\N
548	Gerard Majella	\N	\N	1726-04-06	1755-10-16	\N	\N	\N	\N	\N	1904-12-11	\N	\N	/wiki/Gerard_Majella	\N	\N
504	Francis of Nagasaki	\N	\N	\N	1597-02-05	\N	\N	t	1548	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Francis_of_Nagasaki&action=edit&redlink=1	\N	\N
502	Frances of Rome	\N	\N	\N	1440-03-09	\N	\N	\N	1384	\N	1608-05-09	\N	married layperson of the Vicariate of Rome	/wiki/Frances_of_Rome	\N	\N
448	Eulalia of Mérida	\N	\N	\N	0304-12-10	\N	\N	\N	c. 290	\N	\N	\N	\N	/wiki/Eulalia_of_M%C3%A9rida	\N	\N
447	Eugendus	\N	\N	\N	0510-01-01	\N	\N	\N	c. 449	\N	\N	\N	\N	/wiki/Eugendus	found in Roman Martyrology	\N
426	Émilie de Villeneuve	\N	\N	1811-03-09	1854-10-02	\N	\N	\N	\N	\N	2015-05-17	\N	\N	/wiki/%C3%89milie_de_Villeneuve	\N	\N
428	Émilie de Rodat	\N	\N	1787-09-06	1852-09-19	\N	\N	\N	\N	\N	1950-04-23	\N	founder of the Sisters of the Holy Family of Villefranche	/wiki/%C3%89milie_de_Rodat	\N	\N
410	Edmund of Abingdon	\N	\N	\N	1240-11-16	\N	\N	\N	20 November c. 1175	\N	1246-12-16	\N	\N	/wiki/Edmund_of_Abingdon	\N	\N
407	Edmund Arrowsmith	\N	\N	\N	1628-08-28	\N	\N	t	1585	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Edmund_Arrowsmith	\N	\N
375	David Lewis	\N	\N	\N	1679-08-27	\N	\N	t	1616	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/David_Lewis_(Jesuit_priest)	\N	\N
372	David	\N	\N	\N	0589-03-01	\N	\N	\N	c. 500	\N	\N	\N	\N	/wiki/Saint_David	\N	\N
354	Cyprian	\N	\N	\N	0258-09-14	\N	\N	\N	c. 200	\N	\N	\N	\N	/wiki/Cyprian	found in Roman Martyrology	\N
323	Clement of Ohrid	\N	\N	\N	0916-07-27	\N	\N	\N	830–840	\N	\N	\N	\N	/wiki/Clement_of_Ohrid	\N	\N
305	Charles Lwanga	\N	\N	1860-01-01	1886-06-03	\N	\N	t	\N	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Charles_Lwanga	\N	\N
286	Catherine of Palma	\N	\N	1533-05-01	1574-04-05	\N	\N	\N	\N	\N	1930-06-22	\N	\N	/wiki/Catherine_of_Palma	\N	\N
287	Catherine of Bologna	\N	\N	1413-09-08	1463-03-09	\N	\N	\N	\N	\N	1712-05-22	\N	\N	/wiki/Catherine_of_Bologna	\N	\N
276	Carolina Santocanale	\N	\N	1852-10-02	1923-01-27	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Carolina_Santocanale	\N	\N
267	Camillus de Lellis	\N	\N	1550-05-25	1614-07-14	\N	\N	\N	\N	\N	1746-06-29	\N	\N	/wiki/Camillus_de_Lellis	\N	\N
232	Bernward of Hildesheim	\N	\N	\N	1022-11-20	\N	\N	\N	960	\N	1193-01-08	\N	\N	/wiki/Bernward_of_Hildesheim	\N	\N
220	Benjamín Julián	\N	\N	1908-10-27	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Benjam%C3%ADn_Juli%C3%A1n&action=edit&redlink=1	\N	\N
216	Benedict the Moor	\N	\N	\N	1589-04-04	\N	\N	\N	1526	\N	1807-05-24	\N	\N	/wiki/Benedict_the_Moor	\N	\N
183	Augusto Andrés	\N	\N	1910-05-06	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Augusto_Andr%C3%A9s&action=edit&redlink=1	\N	\N
167	Arnold Janssen	\N	\N	1837-11-05	1909-01-15	\N	\N	\N	\N	\N	2003-10-05	\N	\N	/wiki/Arnold_Janssen	\N	\N
136	Anthony of Weert	\N	\N	\N	1572-07-09	\N	\N	t	1523	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Anthony_of_Weert	\N	\N
132	Anthony of Hoornaar	\N	\N	\N	1572-07-09	\N	\N	t	1500s	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Anthony_of_Hoornaar&action=edit&redlink=1	\N	\N
118	Anne Line	\N	\N	\N	1601-02-27	\N	\N	t	c. 1563	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Anne_Line	\N	\N
114	Anna Maria Rubatto	\N	\N	1844-02-14	1904-08-06	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Anna_Maria_Rubatto	\N	\N
101	Andrew Corsini	\N	\N	1302-11-30	1374-01-06	\N	\N	\N	\N	\N	1629-04-22	\N	\N	/wiki/Andrew_Corsini	\N	\N
94	Anatoli Kiriggwajjo	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Anatoli_Kiriggwajjo&action=edit&redlink=1	\N	\N
86	Anastasia of Sirmium	\N	\N	\N	0304-12-25	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Anastasia_of_Sirmium	found in Roman Martyrology	\N
79	Amatus	\N	\N	\N	\N	\N	\N	\N	unknown	627	1049-12-03	\N	\N	/wiki/Saint_Ame	\N	\N
615	Henry Walpole	\N	\N	\N	1595-04-07	\N	\N	t	1558	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Henry_Walpole	\N	\N
607	Hegesippus	\N	\N	\N	0180-04-07	\N	\N	\N	110	\N	\N	\N	\N	/wiki/Hegesippus_(chronicler)	found in Roman Martyrology	\N
72	Alphonsus Rodriguez	\N	\N	1532-07-25	1617-10-31	\N	\N	\N	\N	\N	1888-01-15	\N	\N	/wiki/Alphonsus_Rodriguez	\N	\N
89	Anastasius of Pavia	\N	\N	\N	\N	\N	\N	\N	600s	680	\N	\N	\N	/wiki/Anastasius_of_Pavia	found in Roman Martyrology	\N
103	Andrew the Apostle	\N	\N	\N	\N	\N	\N	\N	c. 5 BC	62 AD	\N	\N	\N	/wiki/Andrew_the_Apostle	found in Roman Martyrology	\N
121	Ansanus	\N	\N	\N	\N	\N	\N	\N	c. 285	c. 304	\N	\N	\N	/wiki/Ansanus	found in Roman Martyrology	\N
126	Anthimus of Rome	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Anthimus_of_Rome	found in Roman Martyrology	\N
139	Anthony the Hermit	\N	\N	\N	\N	\N	\N	\N	c. 468	c. 520	\N	\N	\N	/wiki/Anthony_the_Hermit	1584 by Pope Gregory XIII	\N
154	Apollinaris of Ravenna	\N	\N	\N	\N	\N	\N	\N	unknown	c.79 AD	\N	\N	\N	/wiki/Apollinaris_of_Ravenna	found in Roman Martyrology	\N
163	Archippus	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Archippus	found in Roman Martyrology	\N
199	Basil of Caesarea	\N	\N	\N	\N	\N	\N	\N	329 or 330	1 or 2 January 379	\N	\N	\N	/wiki/Basil_of_Caesarea	found in Roman Martyrology	\N
218	Benignus of Todi	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Benignus_of_Todi	found in Roman Martyrology	\N
234	Bertha of Bingen	\N	\N	\N	\N	\N	\N	\N	unknown	757	\N	\N	\N	/wiki/Bertha_of_Bingen	\N	\N
281	Castritian	\N	\N	\N	\N	\N	\N	\N	unknown	137	\N	\N	bishop of Milan	/wiki/Castritian	found in Roman Martyrology	\N
284	Catherine of Alexandria	\N	\N	\N	\N	\N	\N	\N	c. 287	c. 305	\N	\N	\N	/wiki/Catherine_of_Alexandria	found in Roman Martyrology	\N
297	Cessianus	\N	\N	\N	\N	\N	\N	\N	c. 295	303	\N	\N	\N	/wiki/Saint_Cessianus	\N	\N
304	Charbel	\N	\N	\N	\N	\N	\N	\N	0's	107	\N	\N	\N	/wiki/Charbel_(martyr)	\N	\N
312	Ciarán of Clonmacnoise	\N	\N	\N	\N	\N	\N	\N	c. 516	549	\N	\N	\N	/wiki/Ciar%C3%A1n_of_Clonmacnoise	\N	\N
356	Cyriacus of Satala	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
371	David of Munktorp	\N	\N	\N	\N	\N	\N	\N	1000s	1082	\N	\N	\N	/wiki/David_of_Munktorp	\N	\N
430	Engratia	\N	\N	\N	\N	\N	\N	\N	200's	c. 303	\N	\N	\N	/wiki/Engratia	found in Roman Martyrology	\N
446	Euprepius of Verona	\N	\N	\N	\N	\N	\N	\N	0s	unknown	\N	\N	\N	/wiki/Euprepius_of_Verona	found in Roman Martyrology	\N
457	Evodius	\N	\N	\N	\N	\N	\N	\N	unknown	c. 66 AD	\N	\N	\N	/wiki/Evodius	found in Roman Martyrology	\N
464	Faustinus of Rome	\N	\N	\N	\N	\N	\N	\N	200s	302 or 303	\N	\N	\N	/wiki/Simplicius,_Faustinus_and_Beatrix	found in Roman Martyrology	\N
481	Felix of Nola	\N	\N	\N	\N	\N	\N	\N	200s	c. 250	\N	\N	\N	/wiki/Felix_of_Nola	found in Roman Martyrology	\N
518	Fructuosus	\N	\N	\N	\N	\N	\N	\N	unknown	259	\N	\N	\N	/wiki/Fructuosus	found in Roman Martyrology	\N
535	Gebhard of Constance	\N	\N	\N	\N	\N	\N	\N	949	995	\N	\N	\N	/wiki/Gebhard_of_Constance	\N	\N
587	Gordius of Caesarea	\N	\N	\N	\N	\N	\N	\N	200s	c. 310	\N	\N	\N	/w/index.php?title=Gordius_of_Caesarea&action=edit&redlink=1	found in Roman Martyrology	\N
568	Giovanni Battista Piamarta	\N	\N	1841-11-26	1913-04-25	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Giovanni_Battista_Piamarta	\N	\N
567	Giovanni Antonio Farina	\N	\N	1803-01-11	1888-03-04	\N	\N	\N	\N	\N	2014-11-23	\N	\N	/wiki/Giovanni_Antonio_Farina	\N	\N
551	Gerard of Potenza	\N	\N	\N	1119-10-30	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Gerard_of_Potenza	1119 by Pope Callixtus II	\N
550	George Preca	\N	\N	1880-02-12	1962-07-26	\N	\N	\N	\N	\N	2007-06-03	\N	\N	/wiki/George_Preca	\N	\N
533	Gaspar del Bufalo	\N	\N	1786-01-06	1837-12-28	\N	\N	\N	\N	\N	1954-06-12	\N	priest of the Vicariate of Rome; founder of the Missionaries of the Precious Blood	/wiki/Gaspar_del_Bufalo	\N	\N
514	Francis Xavier Bianchi	\N	\N	1743-12-02	1815-01-31	\N	\N	\N	\N	\N	1951-10-21	\N	professed priest of the Barnabites	/wiki/Francis_Xavier_Bianchi	\N	\N
501	Francis de Geronimo	\N	\N	1642-12-17	1716-05-11	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Francis_de_Geronimo	26 May 1839 by Pope Gregory XVI	\N
499	Frances Xavier Cabrini	\N	\N	1850-07-15	1917-12-22	\N	\N	\N	\N	\N	1946-07-07	\N	First U.S. citizen to be canonized	/wiki/Frances_Xavier_Cabrini	\N	\N
478	Fidelis of Sigmaringen	\N	\N	\N	1622-04-24	\N	\N	\N	1577	\N	1746-06-29	\N	\N	/wiki/Fidelis_of_Sigmaringen	\N	\N
440	Erlembald	\N	\N	\N	1075-04-15	\N	\N	\N	1000s	\N	\N	\N	\N	/wiki/Erlembald	\N	\N
422	Elzéar of Sabran	\N	\N	\N	1323-09-27	\N	\N	\N	1285	\N	\N	\N	\N	/wiki/Elz%C3%A9ar_of_Sabran	1369 by Pope Urban V	\N
414	Egidio Maria of Saint Joseph	\N	\N	1729-11-16	1812-02-07	\N	\N	\N	\N	\N	1996-06-02	\N	professed priest of the Franciscan Friars Minor (Alcantarines)	/wiki/Egidio_Maria_of_Saint_Joseph	\N	\N
406	Edith Stein	\N	\N	1891-10-12	1942-08-09	\N	\N	\N	\N	\N	1998-10-11	\N	also known as Teresa Benedicta of the Cross	/wiki/Edith_Stein	\N	\N
396	Dominic of Silos	\N	\N	\N	1073-12-20	\N	\N	\N	1000	\N	\N	\N	\N	/wiki/Dominic_of_Silos	found in Roman Martyrology	\N
389	Dionysius of Alexandria	\N	\N	\N	0264-03-22	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Dionysius_of_Alexandria	found in Roman Martyrology	\N
381	Deodatus of Nevers	\N	\N	\N	\N	\N	\N	\N	unknown	679	1049-12-03	\N	\N	/wiki/Deodatus_of_Nevers	\N	\N
348	Cristóbal Magallanes Jara	\N	\N	1869-07-30	1927-05-25	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Crist%C3%B3bal_Magallanes_Jara	\N	\N
328	Colman mac Duagh	\N	\N	\N	0632-10-29	\N	\N	\N	560	\N	\N	\N	\N	/wiki/Colman_mac_Duagh	\N	\N
319	Claudine Thévenet	\N	\N	1774-03-30	1837-02-03	\N	\N	\N	\N	\N	1993-03-21	\N	founder of the Religious of Jesus and Mary	/wiki/Claudine_Th%C3%A9venet	\N	\N
269	Candida Maria of Jesus	\N	\N	1845-05-31	1912-08-09	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Candida_Maria_of_Jesus	\N	\N
264	Bruno of Querfurt	\N	\N	\N	1009-02-14	\N	\N	\N	c. 974	\N	\N	\N	\N	/wiki/Bruno_of_Querfurt	found in Roman Martyrology	\N
243	Bonaventure of Miyako	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Bonaventure_of_Miyako&action=edit&redlink=1	\N	\N
229	Bernard of Clairvaux	\N	\N	\N	1153-08-20	\N	\N	\N	1090	\N	1174-01-18	\N	Reformer of the Cistercian Order	/wiki/Bernard_of_Clairvaux	\N	\N
210	Benedict dell’Antella	\N	\N	\N	1268-08-20	\N	\N	\N	1200s	\N	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/w/index.php?title=Benedict_dell%E2%80%99Antella&action=edit&redlink=1	\N	\N
193	Bartholomew of Braga	\N	\N	1514-05-03	1590-07-16	\N	\N	\N	\N	\N	2019-07-05	\N	\N	/wiki/Bartholomew_of_Braga	\N	\N
182	Augustine Webster	\N	\N	\N	1535-05-04	\N	\N	t	1400s	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Augustine_Webster	\N	\N
173	Asaph	\N	\N	\N	0596-05-01	\N	\N	\N	500s	\N	\N	\N	\N	/wiki/Saint_Asaph	found in Roman Martyrology	\N
148	Antonio of Tlaxcala	\N	\N	\N	\N	\N	\N	t	c. 1516	1529	2017-10-15	\N	one of the Child Martyrs of Tlaxcala	/wiki/Child_Martyrs_of_Tlaxcala	\N	\N
97	André Bessette	\N	\N	1845-08-09	1937-01-06	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Andr%C3%A9_Bessette	\N	\N
80	Ambrose Barlow	\N	\N	\N	1641-09-10	\N	\N	t	1585	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Ambrose_Barlow	\N	\N
73	Alphonsus Liguori	\N	\N	1696-09-27	1787-08-01	\N	\N	\N	\N	\N	\N	\N	Doctor of Church	/wiki/Alphonsus_Liguori	26 May 1839 by Pope Gregory XVI	\N
601	Gyavira Musoke	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	one of the Uganda Martyrs	/w/index.php?title=Gyavira_Musoke&action=edit&redlink=1	\N	\N
585	Gonsalo Garcia	\N	\N	1557-02-06	1597-02-05	\N	\N	t	\N	\N	1862-06-08	\N	One of the 26 Martyrs of Japan, first Indian to become a saint	/wiki/Gonsalo_Garcia	\N	\N
365	Daniele Comboni	\N	\N	1831-03-15	1881-10-10	\N	\N	\N	\N	\N	2003-10-05	\N	\N	/wiki/Daniele_Comboni	\N	\N
112	Angelus of Jerusalem	\N	\N	\N	1220-05-05	\N	\N	\N	1185	\N	\N	\N	\N	/wiki/Angelus_of_Jerusalem	c. 1459 by Pope Pius II	\N
88	Anastasius of Antioch	\N	\N	\N	\N	\N	\N	\N	200s	302	\N	\N	\N	/wiki/Anastasius_of_Antioch_(martyr)	found in Roman Martyrology	\N
105	Andrew Zorard	\N	\N	\N	\N	\N	\N	\N	c. 980	c. 1009	\N	\N	\N	/wiki/Andrew_Zorard	July 1083 by Pope Gregory VII	\N
144	Antoninus of Rome	\N	\N	\N	\N	\N	\N	\N	100s	186	\N	\N	\N	/wiki/Antoninus_of_Rome	found in Roman Martyrology	\N
198	Basil of Ancyra	\N	\N	\N	\N	\N	\N	\N	unknown	28 or 29 June 362	\N	\N	\N	/wiki/Basil_of_Ancyra	found in Roman Martyrology	\N
201	Basilides	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Basilides,_Cyrinus,_Nabor_and_Nazarius	found in Roman Martyrology	\N
217	Bénézet	\N	\N	\N	\N	\N	\N	\N	1163	1184	\N	\N	Patron saint of Avignon, bachelors, and bridge-builders; constructed the Pont Saint-Bénézet bridge	/wiki/B%C3%A9n%C3%A9zet	13th century	\N
236	Bertrand of Comminges	\N	\N	\N	\N	\N	\N	\N	c.1050	1126	\N	\N	\N	/wiki/Bertrand_of_Comminges	1309 by Pope Clement V	\N
255	Britta	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Maura_and_Britta	\N	\N
266	Calocerus	\N	\N	\N	\N	\N	\N	\N	unknown	130	\N	\N	\N	/wiki/Calocerus	found in Roman Martyrology	\N
270	Candida the Elder	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Candida_the_Elder	found in Roman Martyrology	\N
321	Clement of Ancyra	\N	\N	\N	\N	\N	\N	\N	c. 258	312	\N	\N	\N	/wiki/Clement_of_Ancyra	\N	\N
339	Corbinian	\N	\N	\N	\N	\N	\N	\N	c. 670	8 September c. 730	\N	\N	\N	/wiki/Corbinian	\N	\N
366	Darerca of Ireland	\N	\N	\N	\N	\N	\N	\N	300s	400s	\N	\N	\N	/wiki/Darerca_of_Ireland	\N	\N
386	Didymus of Alexandria	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Theodora_and_Didymus	found in Roman Martyrology	\N
402	Dorothea of Alexandria	\N	\N	\N	\N	\N	\N	\N	unknown	c. 320	\N	\N	\N	/wiki/Dorothea_of_Alexandria	\N	\N
436	Epimachus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 250	\N	\N	\N	/wiki/Saint_Epimachus	found in Roman Martyrology	\N
452	Eustathius of Antioch	\N	\N	\N	\N	\N	\N	\N	200s	c. 360	\N	\N	\N	/wiki/Eustathius_of_Antioch	found in Roman Martyrology	\N
471	Felicula	\N	\N	\N	\N	\N	\N	\N	0's	90 AD	\N	\N	\N	/wiki/Felicula	found in Roman Martyrology	\N
477	Finbarr of Cork	\N	\N	\N	\N	\N	\N	\N	550	623	\N	\N	\N	/wiki/Finbarr_of_Cork	\N	\N
488	Flavius Latinus of Brescia	\N	\N	\N	\N	\N	\N	\N	0's	115	\N	\N	\N	/wiki/Flavius_Latinus_of_Brescia	found in Roman Martyrology	\N
492	Fortunatus of Naples	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Fortunatus_of_Naples	\N	\N
523	Fursey	\N	\N	\N	\N	\N	\N	\N	c. 597	650	\N	\N	\N	/wiki/Saint_Fursey	\N	\N
541	Geminus of Fossombrone	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/w/index.php?title=Geminus_of_Fossombrone&action=edit&redlink=1	found in Roman Martyrology	\N
591	Gorgonius of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Gorgonius#Gorgonius_of_Rome	found in Roman Martyrology	\N
608	Helena of Skövde	\N	\N	\N	\N	\N	\N	\N	c. 1101	1160	\N	\N	\N	/wiki/Helena_of_Sk%C3%B6vde	1164 by Pope Alexander III	\N
625	Hilary of Poitiers	\N	\N	\N	\N	\N	\N	\N	c. 310	c. 367	\N	\N	\N	/wiki/Hilary_of_Poitiers	found in Roman Martyrology	\N
628	Honorina	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Honorina	\N	\N
574	Giulia Salzano	\N	\N	1846-10-13	1929-05-17	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Giulia_Salzano	\N	\N
558	Gerolamo Emiliani	\N	\N	\N	1537-02-08	\N	\N	\N	1486	\N	1767-07-16	\N	\N	/wiki/Gerolamo_Emiliani	\N	\N
554	Germaine Cousin	\N	\N	\N	\N	\N	\N	\N	1579	1601	1867-06-29	\N	\N	/wiki/Germaine_Cousin	\N	\N
516	Francisco Marto	\N	\N	1908-06-11	1919-04-04	\N	\N	\N	\N	\N	2017-05-13	\N	\N	/wiki/Francisco_and_Jacinta_Marto	\N	\N
506	Francis of Assisi	\N	\N	\N	1226-10-03	\N	\N	\N	1181 or 1182	\N	\N	\N	Italian Roman Catholic friar and preacher	/wiki/Francis_of_Assisi	16 July 1228 by Pope Gregory IX	\N
466	Felicissimus	\N	\N	\N	0258-08-06	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Felicissimus_and_Agapitus	found in Roman Martyrology	\N
454	Eustochia Smeralda Calafato	\N	\N	1434-03-25	1485-01-20	\N	\N	\N	\N	\N	1988-06-11	\N	\N	/wiki/Eustochia_Smeralda_Calafato	\N	\N
437	Erhard of Regensburg	\N	\N	\N	\N	\N	\N	\N	unknown	600s	1052-10-08	\N	\N	/wiki/Erhard_of_Regensburg	\N	\N
394	Dominic de la Calzada	\N	\N	\N	1109-05-12	\N	\N	\N	1019	\N	\N	\N	\N	/wiki/Dominic_de_la_Calzada	found in Roman Martyrology	\N
379	Deodat of Rodez	\N	\N	\N	1391-11-14	\N	\N	\N	c. 1340	\N	1970-06-21	\N	Companion of Nicholas Tavelic	/w/index.php?title=Deodat_of_Rodez&action=edit&redlink=1	\N	\N
370	David Galván Bermúdez	\N	\N	1881-01-29	1915-01-30	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/David_Galv%C3%A1n_Berm%C3%BAdez	\N	\N
353	Cuthbert Mayne	\N	\N	\N	1577-11-29	\N	\N	t	c. 1543	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Cuthbert_Mayne	\N	\N
351	Cuthbert	\N	\N	\N	0687-03-20	\N	\N	\N	c. 634	\N	\N	\N	\N	/wiki/Cuthbert	found in Roman Martyrology	\N
335	Conrad of Piacenza	\N	\N	\N	1351-02-19	\N	\N	\N	1290	\N	1625-06-02	\N	\N	/wiki/Conrad_of_Piacenza	\N	\N
317	Clare of Montefalco	\N	\N	\N	1308-08-18	\N	\N	\N	1268	\N	1881-12-08	\N	\N	/wiki/Clare_of_Montefalco	\N	\N
306	Charles of Sezze	\N	\N	1613-10-19	1670-01-06	\N	\N	\N	\N	\N	1959-04-12	\N	professed priest of the Franciscan Friars Minor	/wiki/Charles_of_Sezze	\N	\N
300	Charles de Foucauld	\N	\N	1858-09-15	1916-12-01	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Charles_de_Foucauld	\N	\N
289	Catherine of Ricci	\N	\N	1522-04-23	1590-02-02	\N	\N	\N	\N	\N	1746-06-29	\N	\N	/wiki/Catherine_of_Ricci	\N	\N
283	Caterina Volpicelli	\N	\N	1839-01-21	1894-12-28	\N	\N	\N	\N	\N	2009-04-26	\N	\N	/wiki/Caterina_Volpicelli	\N	\N
250	Bononio	\N	\N	\N	1026-08-30	\N	\N	\N	900s	\N	\N	\N	\N	/wiki/Bononio	1026 by Pope John XIX	\N
231	Bernardo Tolomei	\N	\N	1272-05-10	1348-08-20	\N	\N	\N	\N	\N	2009-04-26	\N	\N	/wiki/Bernardo_Tolomei	\N	\N
215	Benedict of Nursia	\N	\N	0480-03-02	0547-03-21	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Benedict_of_Nursia	1220 by Pope Honorius III	\N
186	Áurea of San Millán	\N	\N	\N	1070-03-11	\N	\N	\N	1043	\N	\N	\N	\N	/wiki/%C3%81urea_of_San_Mill%C3%A1n	\N	\N
179	Augustine of Hippo	\N	\N	0354-11-13	0430-08-28	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Augustine_of_Hippo	found in Roman Martyrology	\N
166	Arnold of Soissons	\N	\N	\N	\N	\N	\N	\N	1040	1087	1120-01-06	\N	\N	/wiki/Arnold_of_Soissons	\N	\N
135	Anthony of St. Ann Galvão	\N	\N	\N	1822-12-23	\N	\N	\N	1739	\N	2007-05-11	\N	First Brazilian saint.	/wiki/Frei_Galv%C3%A3o	\N	\N
128	Antanansio Bazzekuketta	\N	\N	\N	1886-05-27	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Antanansio_Bazzekuketta&action=edit&redlink=1	\N	\N
120	Anne-Marie Rivier	\N	\N	1768-12-19	1838-02-03	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Anne-Marie_Rivier	\N	\N
110	Angilbert	\N	\N	\N	0814-02-18	\N	\N	\N	760	\N	\N	\N	\N	/wiki/Angilbert	1100 by Pope Urban II	\N
96	Anatolius of Laodicea	\N	\N	\N	0283-07-03	\N	\N	\N	200s	\N	\N	\N	Invented the very first Metonic 19-year lunar cycle	/wiki/Anatolius_of_Laodicea	found in Roman Martyrology	\N
81	Ambrose of Milan	\N	\N	\N	0397-04-04	\N	\N	\N	c. 340	\N	\N	\N	\N	/wiki/Ambrose	found in Roman Martyrology	\N
69	Aloysius Gonzaga	\N	\N	1568-03-09	1591-06-21	\N	\N	\N	\N	\N	1726-12-31	\N	\N	/wiki/Aloysius_Gonzaga	\N	\N
610	Hemma of Gurk	\N	\N	\N	1045-06-27	\N	\N	\N	c. 995	\N	1938-01-05	\N	\N	/wiki/Hemma_of_Gurk	\N	\N
593	Greca	\N	\N	0284-10-12	0304-01-21	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Saint_Greca	\N	\N
534	Gaudentius of Rimini	\N	\N	\N	0360-10-14	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Gaudentius_of_Rimini	found in Roman Martyrology	\N
412	Edmund Gennings	\N	\N	\N	1591-12-10	\N	\N	t	1567	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Edmund_Gennings	\N	\N
161	Arcangelo Tadini	\N	\N	1846-12-12	1912-05-20	\N	\N	\N	\N	\N	2009-04-26	\N	\N	/wiki/Arcangelo_Tadini	\N	\N
74	Alypius of Thagaste	\N	\N	\N	\N	\N	\N	\N	400s	500s	\N	\N	\N	/wiki/Alypius_of_Thagaste	1584 by Pope Gregory XIII	\N
140	Antiochus of Sulcis	\N	\N	\N	\N	\N	\N	\N	0s	c. 110 AD	\N	\N	\N	/wiki/Antiochus_of_Sulcis	found in Roman Martyrology	\N
156	Apphia	\N	\N	\N	\N	\N	\N	\N	unknown	68 AD	\N	\N	\N	/wiki/Philemon_(biblical_figure)	found in Roman Martyrology	\N
174	Asterius of Petra	\N	\N	\N	\N	\N	\N	\N	unknown	365	\N	\N	\N	/wiki/Asterius_of_Petra	found in Roman Martyrology	\N
175	Astius	\N	\N	\N	\N	\N	\N	\N	0's	117 AD	\N	\N	bishop of Dyrrachium	/wiki/Astius	found in Roman Martyrology	\N
192	Barbara	\N	\N	\N	\N	\N	\N	\N	200s	200s - 300s	\N	\N	\N	/wiki/Saint_Barbara	found in Roman Martyrology	\N
202	Belina	\N	\N	\N	\N	\N	\N	\N	unknown	1153	\N	\N	\N	/wiki/Belina_(virgin)	1203 by Pope Innocent III	\N
252	Brigid of Kildare	\N	\N	\N	\N	\N	\N	\N	c. 451	c. 525	\N	\N	\N	/wiki/Brigid_of_Kildare	found in Roman Martyrology	\N
263	Caius of Saragossa	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Martyrs_of_Zaragoza	found in Roman Martyrology	\N
271	Canius	\N	\N	\N	\N	\N	\N	\N	200s	200s	\N	\N	\N	/wiki/Saint_Canius	\N	\N
295	Cecilia	\N	\N	\N	\N	\N	\N	\N	100s	222–235	\N	\N	\N	/wiki/Saint_Cecilia	found in Roman Martyrology	\N
307	Christian of Clogher	\N	\N	\N	\N	\N	\N	\N	1000s	1138	\N	\N	\N	/wiki/Christian_of_Clogher	\N	\N
331	Concordius of Spoleto	\N	\N	\N	\N	\N	\N	\N	100s	c.175	\N	\N	\N	/wiki/Concordius_of_Spoleto	found in Roman Martyrology	\N
364	Daniel of Padua	\N	\N	\N	\N	\N	\N	\N	unknown	168	\N	\N	\N	/wiki/Daniel_of_Padua	found in Roman Martyrology	\N
383	Devota	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Devota	\N	\N
401	Dorothea of Caesarea	\N	\N	\N	\N	\N	\N	\N	279–290	c. 311	\N	\N	\N	/wiki/Dorothea_of_Caesarea	found in Roman Martyrology	\N
429	Emygdius	\N	\N	\N	\N	\N	\N	\N	279	309	\N	\N	\N	/wiki/Emygdius	\N	\N
434	Erasmus of Formia	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Erasmus_of_Formia	found in Roman Martyrology	\N
442	Euphemia	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Euphemia	\N	\N
458	Exuperius	\N	\N	\N	\N	\N	\N	\N	unknown	127	\N	\N	\N	/wiki/Exuperius_and_Zoe	found in Roman Martyrology	\N
484	Fintán of Taghmon	\N	\N	\N	\N	\N	\N	\N	unknown	635	\N	\N	bishop and hermit	/wiki/Fint%C3%A1n_of_Taghmon	\N	\N
491	Florian	\N	\N	\N	\N	\N	\N	\N	250	c. 304	\N	\N	\N	/wiki/Saint_Florian	\N	\N
519	Fridolin of Säckingen	\N	\N	\N	\N	\N	\N	\N	500s	600s	\N	\N	\N	/wiki/Fridolin_of_S%C3%A4ckingen	\N	\N
562	Giles	\N	\N	\N	\N	\N	\N	\N	c. 650	c. 710	\N	\N	\N	/wiki/Saint_Giles	found in Roman Martyrology	\N
588	Gordianus	\N	\N	\N	\N	\N	\N	\N	unknown	362	\N	\N	\N	/wiki/Saint_Gordianus	found in Roman Martyrology	\N
599	Gregory Thaumaturgus	\N	\N	\N	\N	\N	\N	\N	c. 213	c. 270	\N	\N	\N	/wiki/Gregory_Thaumaturgus	found in Roman Martyrology	\N
604	Gummarus	\N	\N	\N	\N	\N	\N	\N	c. 717	774	\N	\N	Saint of the Belgian town Lier	/wiki/Gummarus	\N	\N
620	Hermione of Ephesus	\N	\N	\N	\N	\N	\N	\N	unknown	117	\N	\N	\N	/wiki/Hermione_of_Ephesus	\N	\N
553	Gerard of Toul	\N	\N	\N	0994-04-23	\N	\N	\N	935	\N	1050-10-21	\N	\N	/wiki/Gerard_of_Toul	\N	\N
546	George	\N	\N	\N	0303-04-23	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Saint_George	found in Roman Martyrology	\N
537	Geltrude Comensoli	\N	\N	1847-01-18	1903-02-18	\N	\N	\N	\N	\N	2009-04-26	\N	\N	/wiki/Geltrude_Comensoli	\N	\N
527	Gabriel of Our Lady of Sorrows	\N	\N	1838-03-01	1862-02-27	\N	\N	\N	\N	\N	1920-05-13	\N	\N	/wiki/Gabriel_of_Our_Lady_of_Sorrows	\N	\N
500	Francis Borgia	\N	\N	1510-10-28	1572-09-30	\N	\N	\N	\N	\N	1670-06-20	\N	\N	/wiki/Francis_Borgia,_4th_Duke_of_Gand%C3%ADa	\N	\N
474	Felix II	\N	\N	\N	0365-11-22	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Antipope_Felix_II	found in Roman Martyrology	\N
460	Fabiola	\N	\N	\N	0399-12-27	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Saint_Fabiola	\N	\N
443	Euphrasia Eluvathingal	\N	\N	1877-10-17	1952-08-29	\N	\N	\N	\N	\N	2014-11-23	\N	\N	/wiki/Euphrasia_Eluvathingal	\N	\N
420	Elizabeth of Portugal	\N	\N	\N	1336-07-04	\N	\N	\N	c. 1271	\N	2001-05-25	\N	\N	/wiki/Elizabeth_of_Portugal	\N	\N
397	Dominic Savio	\N	\N	1842-04-02	1857-03-09	\N	\N	\N	\N	\N	1954-06-12	\N	\N	/wiki/Dominic_Savio	\N	\N
376	David Uribe Velasco	\N	\N	1889-12-29	1927-04-12	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=David_Uribe_Velasco&action=edit&redlink=1	\N	\N
357	Cyril	\N	\N	\N	0869-02-14	\N	\N	\N	826-827	\N	\N	\N	\N	/wiki/Saints_Cyril_and_Methodius	found in Roman Martyrology	\N
349	Cristobal of Tlaxcala	\N	\N	\N	\N	\N	\N	t	c. 1514	1527	2017-10-15	\N	one of the Child Martyrs of Tlaxcala	/wiki/Child_Martyrs_of_Tlaxcala	\N	\N
322	Clement Mary Hofbauer	\N	\N	1751-12-26	1820-03-15	\N	\N	\N	\N	\N	1909-05-20	\N	professed priest of the Redemptorists	/wiki/Clement_Mary_Hofbauer	\N	\N
302	Charles Garnier	\N	\N	1606-05-25	1649-12-07	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Charles_Garnier_(missionary)	\N	\N
288	Catherine of Genoa	\N	\N	\N	\N	\N	\N	\N	1447	1510	1737-06-16	\N	\N	/wiki/Catherine_of_Genoa	\N	\N
242	Bonifacia Rodríguez y Castro	\N	\N	1837-06-06	1905-08-08	\N	\N	\N	\N	\N	2011-10-23	\N	\N	/wiki/Bonifacia_Rodr%C3%ADguez_y_Castro	\N	\N
235	Beuno	\N	\N	\N	0640-04-21	\N	\N	\N	500s	\N	\N	\N	also known as Bono	/wiki/Beuno	\N	\N
225	Bernard degli Uberti	\N	\N	\N	1133-12-04	\N	\N	\N	c. 1060	\N	1139-12-03	\N	\N	/wiki/Bernard_degli_Uberti	\N	\N
221	Benildus Romançon	\N	\N	1805-06-14	1862-08-13	\N	\N	\N	\N	\N	1967-10-29	\N	\N	/wiki/Benildus_Roman%C3%A7on	\N	\N
208	Bellinus of Padua	\N	\N	\N	1145-11-26	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Bellinus_of_Padua	1431-1447 by Pope Eugene IV	\N
191	Amadio degli Amidei	\N	\N	\N	\N	\N	\N	\N	1200s	1266	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/wiki/Amadio_degli_Amidei	\N	\N
134	Anthony of Padua	\N	\N	1389-03-01	1459-05-02	\N	\N	\N	\N	\N	1523-05-31	\N	\N	/wiki/Anthony_of_Padua	\N	\N
124	Ansgar	\N	\N	0801-09-08	0865-02-03	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Ansgar	1584 by Pope Gregory XIII	\N
115	Anna Schäffer	\N	\N	1882-02-18	1925-10-05	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Anna_Sch%C3%A4ffer	\N	\N
111	Anianus of Alexandria	\N	\N	\N	1983-11-29	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Anianus_of_Alexandria	found in Roman Martyrology l	\N
98	André-Hubert Fournet	\N	\N	1752-12-06	1834-05-13	\N	\N	\N	\N	\N	1933-06-04	\N	priest of the Diocese of Poitiers; founder of the Sisters of the Cross	/wiki/Andr%C3%A9-Hubert_Fournet	\N	\N
90	Anastasius of Persia	\N	\N	\N	0628-01-22	\N	\N	\N	500s	\N	\N	\N	\N	/wiki/Anastasius_of_Persia	found in Roman Martyrology	\N
82	Ambrosio Kibuuka	\N	\N	\N	1886-06-03	\N	\N	t	1868	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Ambrosio_Kibuuka	\N	\N
582	Godelieve of Gistel	\N	\N	\N	1070-07-06	\N	\N	\N	c. 1049	\N	\N	\N	\N	/wiki/Godelieve	1084 by Pope Urban II	\N
570	Giuditta Vannini	\N	\N	1859-07-07	1911-02-23	\N	\N	\N	\N	\N	2019-10-13	\N	\N	/wiki/Giuditta_Vannini	\N	\N
340	Cornelius of Wijk bij Duurstede	\N	\N	\N	1572-07-09	\N	\N	t	1548	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Cornelius_of_Wijk_bij_Duurstede&action=edit&redlink=1	\N	\N
278	Casimir	\N	\N	1458-10-03	1484-03-04	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Saint_Casimir	1521 by Pope Leo X or 1602 by Pope Clement VIII	\N
151	Aphrodisius	\N	\N	2025-05-07	1965-04-28	\N	\N	t	\N	\N	\N	\N	priest of the Diocese of Béziers, martyr	/wiki/Aphrodisius	found in Roman Martyrology	\N
668	Jacob of Nisibis	\N	\N	\N	\N	\N	\N	\N	200s	337 or 338	\N	\N	\N	/wiki/Jacob_of_Nisibis	\N	\N
800	Julius of Novara	\N	\N	\N	\N	\N	\N	\N	300s	401	\N	\N	\N	/wiki/Julius_of_Novara	found in Roman Martyrology	\N
846	Liborius of Le Mans	\N	\N	\N	\N	\N	\N	\N	300s	396	\N	\N	bishop of Le Mans	/wiki/Liborius_of_Le_Mans	found in Roman Martyrology	\N
879	Luxorius	\N	\N	\N	\N	\N	\N	\N	200s	21 August c. 304	\N	\N	\N	/wiki/Luxorius_(saint)	found in Roman Martyrology	\N
965	Mary of Bethany	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	identified as Mary of Magdalene historically	/wiki/Mary_of_Bethany	found in Roman Martyrology	\N
985	Maximus of Naples	\N	\N	\N	\N	\N	\N	\N	unknown	361	\N	\N	\N	/wiki/Maximus_of_Naples	found in Roman Martyrology	\N
1010	Mirocles	\N	\N	\N	\N	\N	\N	\N	200s	30 November c. 316	\N	\N	\N	/wiki/Mirocles_(bishop_of_Milan)	\N	\N
1027	Nerses I	\N	\N	\N	\N	\N	\N	\N	300s	373	\N	\N	\N	/wiki/St._Nerses_I	\N	\N
1039	Nectarius of Auvergne	\N	\N	\N	\N	\N	\N	\N	200s	c. 300	\N	\N	\N	/wiki/Nectarius_of_Auvergne	\N	\N
1090	Paphnutius of Thebes	\N	\N	\N	\N	\N	\N	\N	200s	300s	\N	\N	\N	/wiki/Paphnutius_of_Thebes	found in Roman Martyrology	\N
1124	Peregrinus	\N	\N	\N	\N	\N	\N	\N	0s	138	\N	\N	\N	/wiki/Peregrinus,_Bishop_of_Terni	\N	\N
1176	Polycarp	\N	\N	\N	\N	\N	\N	\N	69 AD	156	\N	\N	\N	/wiki/Polycarp	found in Roman Martyrology	\N
1283	Pusai	\N	\N	\N	\N	\N	\N	\N	unknown	344	\N	\N	\N	/wiki/Pusai	\N	\N
1351	Secunda	\N	\N	\N	\N	\N	\N	\N	200s	257	\N	\N	\N	/wiki/Rufina_and_Secunda	found in Roman Martyrology	\N
1404	Syagrius of Nice	\N	\N	\N	\N	\N	\N	\N	unknown	787 or 788	\N	\N	\N	/wiki/Syagrius_of_Nice	\N	\N
1440	Theoktiste of Lesbos	\N	\N	\N	\N	\N	\N	\N	800s	800s	\N	\N	\N	/wiki/Theoktiste_of_Lesbos	found in Roman Martyrology	\N
1539	Zacharias of Vienne	\N	\N	\N	\N	\N	\N	\N	0's	106	\N	\N	\N	/wiki/Zacharias_of_Vienne	found in Roman Martyrology	\N
1489	Verdiana	\N	\N	\N	1242-02-10	\N	\N	\N	1182	\N	\N	\N	\N	/wiki/Verdiana	found in Roman Martyrology	\N
1470	Toribio Romo González	\N	\N	1900-04-16	1928-02-25	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Toribio_Romo_Gonz%C3%A1lez	\N	\N
1455	Thomas Becket	\N	\N	\N	1170-12-29	\N	\N	\N	21 December c. 1119	\N	1173-02-21	\N	Archbishop of Canterbury	/wiki/Thomas_Becket	\N	\N
1422	Teresa of the Andes	\N	\N	1900-07-13	1920-04-12	\N	\N	\N	\N	\N	1993-03-21	\N	\N	/wiki/Teresa_of_the_Andes	\N	\N
1386	Sossius	\N	\N	\N	0305-09-19	\N	\N	\N	275	\N	\N	\N	\N	/wiki/Sossius	found in Roman Martyrology	\N
1369	Severinus of Noricum	\N	\N	\N	0482-01-08	\N	\N	\N	c. 410	\N	\N	\N	\N	/wiki/Severinus_of_Noricum	\N	\N
1335	Sabbas the Sanctified	\N	\N	\N	0532-12-05	\N	\N	\N	439	\N	\N	\N	\N	/wiki/Sabbas_the_Sanctified	found in Roman Martyrology	\N
1317	Rögnvald Kali Kolsson	\N	\N	\N	1158-08-20	\N	\N	\N	c. 1103	\N	\N	\N	layperson of the Diocese of Caithness	/wiki/R%C3%B6gnvald_Kali_Kolsson	1192 by Pope Celestine III	\N
1300	Remigius	\N	\N	\N	0533-01-13	\N	\N	\N	c. 437	\N	\N	\N	\N	/wiki/Saint_Remigius	found in Roman Martyrology	\N
1265	Pope Vitalian	\N	\N	\N	0672-01-27	\N	\N	\N	600	\N	\N	\N	\N	/wiki/Pope_Vitalian	found in Roman Martyrology	\N
1245	Pope Pius V	\N	\N	1504-01-17	1572-05-01	\N	\N	\N	\N	\N	1712-05-22	\N	\N	/wiki/Pope_Pius_V	\N	\N
1229	Pope Leo IV	\N	\N	\N	0855-07-17	\N	\N	\N	790	\N	\N	\N	\N	/wiki/Pope_Leo_IV	found in Roman Martyrology	\N
1211	Pope Felix I	\N	\N	\N	0274-12-30	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Felix_I	found in Roman Martyrology	\N
1194	Pope Boniface I	\N	\N	\N	0422-09-04	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Pope_Boniface_I	found in Roman Martyrology	\N
1164	Philip of Jesus	\N	\N	\N	1597-02-05	\N	\N	t	1572	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Philip_of_Jesus	\N	\N
1143	Peter of Alexandria	\N	\N	\N	0311-11-25	\N	\N	\N	200s	\N	\N	\N	Pope of Alexandria	/wiki/Pope_Peter_I_of_Alexandria	\N	\N
1108	Pauline of the Agonizing Heart of Jesus	\N	\N	1865-12-16	1942-07-09	\N	\N	\N	\N	\N	2002-05-19	\N	\N	/wiki/Pauline_of_the_Agonizing_Heart_of_Jesus	\N	\N
1075	Osmund	\N	\N	\N	\N	\N	\N	\N	1000s	3 or 4 December 1099	1457-01-01	\N	\N	/wiki/Saint_Osmund	\N	\N
949	Marolus	\N	\N	\N	0423-04-23	\N	\N	\N	300's	\N	\N	\N	\N	/wiki/Marolus	found in Roman Martyrology	\N
936	Marie of the Incarnation	\N	\N	1599-10-28	1672-04-30	\N	\N	\N	\N	\N	2014-04-03	\N	Canonized by equivalent canonization and founder of the Ursulines of Quebec convent.	/wiki/Marie_of_the_Incarnation_(Ursuline)	\N	\N
917	Marguerite Bourgeoys	\N	\N	1620-04-17	1700-01-12	\N	\N	\N	\N	\N	1982-10-31	\N	Founder of the Sisters of the Congregation of Notre Dame of Montreal	/wiki/Marguerite_Bourgeoys	\N	\N
894	Manuel Míguez González	\N	\N	1831-03-24	1925-03-08	\N	\N	\N	\N	\N	2017-10-15	\N	\N	/wiki/Manuel_M%C3%ADguez_Gonz%C3%A1lez	\N	\N
863	Lucy Filippini	\N	\N	1672-01-16	1732-03-25	\N	\N	\N	\N	\N	1930-06-22	\N	founder of the Religious Teachers Filippini (Filippini Sisters)	/wiki/Lucy_Filippini	\N	\N
828	Lazarus of Kyoto	\N	\N	\N	1637-09-29	\N	\N	t	1500s or 1600s	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Lazarus_of_Kyoto&action=edit&redlink=1	\N	\N
816	Kizito	\N	\N	\N	1886-06-03	\N	\N	t	1872	\N	1964-10-18	\N	one of the Uganda Martyrs	/wiki/Saint_Kizito	\N	\N
784	Juan Grande Román	\N	\N	1546-03-06	1600-06-03	\N	\N	\N	\N	\N	1996-06-02	\N	\N	/wiki/Juan_Grande_Rom%C3%A1n	\N	\N
767	Joseph Marello	\N	\N	1844-12-26	1895-05-30	\N	\N	\N	\N	\N	2001-11-25	\N	\N	/wiki/Joseph_Marello	\N	\N
748	John Stone	\N	\N	\N	\N	\N	\N	t	1400s	c. December 1539	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Stone_(martyr)	\N	\N
710	John Fisher	\N	\N	\N	1535-06-22	\N	\N	\N	c. 19 October 1469	\N	1935-05-19	\N	\N	/wiki/John_Fisher	\N	\N
686	Jeanne de Lestonnac	\N	\N	1556-12-27	1640-02-02	\N	\N	\N	\N	\N	1949-05-15	\N	widow; founder of the Sisters of the Company of Mary	/wiki/Jeanne_de_Lestonnac	\N	\N
650	Inocencio of Mary Immaculate	\N	\N	1887-03-10	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/wiki/Inocencio_of_Mary_Immaculate	\N	\N
631	Hugh dei Lippi Uggucioni	\N	\N	\N	1282-05-03	\N	\N	\N	1200s	\N	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/wiki/Hugh_dei_Lippi_Uggucioni	\N	\N
613	Henry of Uppsala	\N	\N	\N	1156-01-20	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Henry_(bishop_of_Finland)	\N	\N
598	Guido Maria Conforti	\N	\N	1865-03-30	1931-11-05	\N	\N	\N	\N	\N	2011-10-23	\N	\N	/wiki/Guido_Maria_Conforti	\N	\N
583	Godfried van Duynen	\N	\N	\N	1572-07-09	\N	\N	t	1502	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Godfried_van_Duynen&action=edit&redlink=1	\N	\N
251	Bridget of Sweden	\N	\N	\N	1373-07-23	\N	\N	\N	c. 1303	\N	1391-10-07	\N	\N	/wiki/Bridget_of_Sweden	\N	SWE
418	Elizabeth Hesselblad	\N	\N	1870-06-04	1957-04-24	\N	\N	\N	\N	\N	2016-06-05	\N	\N	/wiki/Elizabeth_Hesselblad	\N	SWE
1525	Willehad	\N	\N	\N	0789-11-08	\N	\N	\N	c. 735	\N	\N	\N	\N	/wiki/Willehad	\N	\N
1507	Vincent Romano	\N	\N	1751-06-03	1831-12-20	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Vincent_Romano	\N	\N
1058	Nuno Álvares Pereira	\N	\N	1360-06-24	1431-04-01	\N	\N	\N	\N	\N	2009-04-26	\N	\N	/wiki/Nuno_%C3%81lvares_Pereira	\N	\N
726	John of Beverley	\N	\N	\N	0721-05-07	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/John_of_Beverley	1037 by Pope Benedict IX	\N
637	Hyacinth of Caesarea	\N	\N	\N	\N	\N	\N	\N	96 AD	108	\N	\N	\N	/wiki/Hyacinth_of_Caesarea	found in Roman Martyrology	\N
657	Isaac of Armenia	\N	\N	\N	\N	\N	\N	\N	354	439–441	\N	\N	\N	/wiki/Isaac_of_Armenia	\N	\N
777	Jovita	\N	\N	\N	\N	\N	\N	\N	unknown	120	\N	\N	\N	/wiki/Faustinus_and_Jovita	found in Roman Martyrology	\N
887	Máel Ruba	\N	\N	\N	\N	\N	\N	\N	642	722	\N	\N	\N	/wiki/M%C3%A1el_Ruba	\N	\N
904	Marcianus	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/John_and_Marcianus	found in Roman Martyrology	\N
944	Marina of Aguas Santas	\N	\N	\N	\N	\N	\N	\N	119	139	\N	\N	\N	/wiki/Marina_of_Aguas_Santas	found in Roman Martyrology	\N
961	Martinian	\N	\N	\N	\N	\N	\N	\N	c. 30 AD	c. 67 AD	\N	\N	\N	/wiki/Martinian_and_Processus	found in Roman Martyrology	\N
1029	Nicanor the Deacon	\N	\N	\N	\N	\N	\N	\N	unknown	76 AD	\N	\N	\N	/wiki/Nicanor_the_Deacon	found in Roman Martyrology	\N
1093	Paschasius Radbertus	\N	\N	\N	\N	\N	\N	\N	785	865	\N	\N	\N	/wiki/Paschasius_Radbertus	1073 by Pope Gregory VII	\N
1123	Peregrine of Auxerre	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Peregrine_of_Auxerre	found in Roman Martyrology	\N
1191	Pope Anicetus	\N	\N	\N	\N	\N	\N	\N	0's	c. 20 April 168	\N	\N	\N	/wiki/Pope_Anicetus	found in Roman Martyrology	\N
1242	Pope Pius I	\N	\N	\N	\N	\N	\N	\N	late 1st century	c. 155	\N	\N	\N	/wiki/Pope_Pius_I	found in Roman Martyrology	\N
1259	Pope Telesphorus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 137	\N	\N	\N	/wiki/Pope_Telesphorus	found in Roman Martyrology	\N
1275	Proculus of Pozzuoli	\N	\N	\N	\N	\N	\N	\N	200s	c. 305	\N	\N	\N	/wiki/Proculus_of_Pozzuoli	\N	\N
1292	Rainerius	\N	\N	\N	\N	\N	\N	\N	c. 1115 or 1117	c. 1160	\N	\N	\N	/wiki/Rainerius	found in Roman Martyrology	\N
1344	Saturnin	\N	\N	\N	\N	\N	\N	\N	200s	c. 257	\N	\N	\N	/wiki/Saturnin	found in Roman Martyrology	\N
1378	Simeon of Jerusalem	\N	\N	\N	\N	\N	\N	\N	unknown	c. 107 or 117	\N	\N	\N	/wiki/Simeon_of_Jerusalem	found in Roman Martyrology	\N
1412	Teilo	\N	\N	\N	\N	\N	\N	\N	c. 500	c. 560	\N	\N	\N	/wiki/Saint_Teilo	\N	\N
1428	Theodora of Alexandria	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Theodora_and_Didymus	found in Roman Martyrology	\N
1443	Papias of Hierapolis	\N	\N	\N	\N	\N	\N	\N	unknown	100s	\N	\N	\N	/wiki/Papias_of_Hierapolis	found in Roman Martyrology	\N
1505	Vincent of Saragossa	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Vincent_of_Saragossa	found in Roman Martyrology	\N
1523	Wilfrid II	\N	\N	\N	\N	\N	\N	\N	unknown	29 April 745 or 746	\N	\N	\N	/wiki/Wilfrid_II_(bishop_of_York)	\N	\N
1459	Thomas More	\N	\N	1478-02-07	1535-07-06	\N	\N	\N	\N	\N	1935-05-19	\N	\N	/wiki/Thomas_More	\N	\N
1396	Stephen Harding	\N	\N	\N	1134-03-28	\N	\N	\N	ca. 1050	\N	\N	\N	\N	/wiki/Stephen_Harding	\N	\N
1360	Serenus the Gardener	\N	\N	\N	0307-02-23	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Serenus_the_Gardener	found in Roman Martyrology	\N
1327	Rose Philippine Duchesne	\N	\N	1769-08-29	1852-11-18	\N	\N	\N	\N	\N	1988-07-03	\N	Professed religious of the Society of the Religious of the Sacred Heart of Jesus	/wiki/Rose_Philippine_Duchesne	\N	\N
1309	Rita of Cascia	\N	\N	\N	1457-05-22	\N	\N	\N	c. 1381	\N	1900-05-24	\N	\N	/wiki/Rita_of_Cascia	\N	\N
1225	Pope John I	\N	\N	\N	0526-05-18	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_John_I	found in Roman Martyrology	\N
1216	Pope Gregory I	\N	\N	\N	0604-03-12	\N	\N	\N	c. 540	\N	\N	\N	\N	/wiki/Pope_Gregory_I	found in Roman Martyrology	\N
1208	Pope Evaristus	\N	\N	2044-04-17	\N	\N	\N	\N	\N	c. 107	\N	\N	\N	/wiki/Pope_Evaristus	found in Roman Martyrology	\N
1159	Philip Howard	\N	\N	1557-06-28	1595-10-19	\N	\N	t	\N	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Philip_Howard,_20th_Earl_of_Arundel	\N	\N
1142	Peter of Anagni	\N	\N	\N	\N	\N	\N	\N	1000s	1105	1109-06-04	\N	\N	/wiki/Peter_of_Anagni	\N	\N
1079	Otto of Bamberg	\N	\N	\N	1139-06-30	\N	\N	\N	c. 1060	\N	\N	\N	\N	/wiki/Otto_of_Bamberg	1189 by Pope Clement III	\N
1062	Olaf II of Norway	\N	\N	\N	1030-07-29	\N	\N	\N	995	\N	\N	\N	\N	/wiki/Olaf_II_of_Norway	found in Roman Martyrology	\N
1046	Nimatullah Kassab	\N	\N	\N	1858-12-14	\N	\N	\N	1808	\N	2004-05-16	\N	\N	/wiki/Nimatullah_Kassab	\N	\N
1012	Mugagga Lubowa	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Mugagga_Lubowa&action=edit&redlink=1	\N	\N
995	Methodius	\N	\N	\N	0885-04-06	\N	\N	\N	815	\N	\N	\N	\N	/wiki/Saints_Cyril_and_Methodius	found in Roman Martyrology	\N
978	Mateo Correa Magallanes	\N	\N	1866-07-23	1927-02-06	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Mateo_Correa_Magallanes	\N	\N
942	Marie-Marguerite d'Youville	\N	\N	1701-10-15	1771-12-23	\N	\N	\N	\N	\N	1990-12-09	\N	widow; founder of the Sisters of Charity of Montreal (Gray Sisters)	/wiki/Marie-Marguerite_d%27Youville	\N	\N
927	Mariam Baouardy	\N	\N	1846-01-05	1878-08-26	\N	\N	\N	\N	\N	2015-05-17	\N	\N	/wiki/Mariam_Baouardy	\N	\N
870	Luigi Guanella	\N	\N	1842-12-19	1915-10-24	\N	\N	\N	\N	\N	2011-10-23	\N	\N	/wiki/Luigi_Guanella	\N	\N
852	Lorenzo Ruiz	\N	\N	\N	1637-09-29	\N	\N	t	c. 1600	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Lorenzo_Ruiz	\N	\N
834	Leonard of Port Maurice	\N	\N	1676-12-20	1751-11-26	\N	\N	\N	\N	\N	1867-06-29	\N	\N	/wiki/Leonard_of_Port_Maurice	\N	\N
813	Kinga of Poland	\N	\N	1234-03-05	1292-07-24	\N	\N	\N	\N	\N	1999-06-16	\N	\N	/wiki/Kinga_of_Poland	\N	\N
794	Juliana of Liège	\N	\N	\N	1258-04-05	\N	\N	\N	1192–1193	\N	\N	\N	\N	/wiki/Juliana_of_Li%C3%A8ge	1869 by Pope Pius IX	\N
759	José Maria de Yermo y Parres	\N	\N	1851-11-10	1904-09-20	\N	\N	\N	\N	\N	2000-05-21	\N	\N	/wiki/Jos%C3%A9_Maria_de_Yermo_y_Parres	\N	\N
739	John Ogilvie	\N	\N	\N	1615-03-10	\N	\N	\N	1579	\N	1976-10-17	\N	\N	/wiki/John_Ogilvie_(saint)	\N	\N
720	John Lloyd	\N	\N	\N	1679-07-22	\N	\N	t	1500s	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Saint_John_Lloyd	\N	\N
705	John Cantius	\N	\N	1390-06-23	1473-12-24	\N	\N	\N	\N	\N	1767-07-16	\N	\N	/wiki/John_Cantius	\N	\N
693	Jenaro Sánchez Delgadillo	\N	\N	1886-09-19	1927-01-17	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Jenaro_S%C3%A1nchez_Delgadillo	\N	\N
674	James Kisai	\N	\N	\N	1597-02-05	\N	\N	t	1533	\N	1862-06-08	\N	One of the 26 Martyrs of Japan	/wiki/James_Kisai	\N	\N
633	Hugh of Châteauneuf	\N	\N	\N	1132-04-01	\N	\N	\N	1053	\N	1134-04-22	\N	\N	/wiki/Hugh_of_Ch%C3%A2teauneuf	\N	\N
626	Hildegard of Bingen	\N	\N	\N	1179-09-17	\N	\N	\N	1098	\N	2012-05-10	\N	professed religious of the Benedictine Nuns, Doctor of the Church in 2012	/wiki/Hildegard_of_Bingen	\N	\N
605	Hedwig of Silesia	\N	\N	\N	1243-10-15	\N	\N	\N	1174	\N	1267-03-26	\N	\N	/wiki/Hedwig_of_Silesia	\N	\N
589	Gorgonia	\N	\N	\N	0375-02-23	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Saint_Gorgonia	found in Roman Martyrology	\N
1541	Wulfstan	\N	\N	\N	\N	\N	\N	\N	1008	January 1095	1203-05-14	\N	\N	/wiki/Wulfstan_(died_1095)	\N	\N
1179	Pontianus of Spoleto	\N	\N	\N	0175-01-14	\N	\N	\N	c. 156	\N	\N	\N	\N	/wiki/Pontianus_of_Spoleto	found in Roman Martyrology	\N
912	Margaret of Cortona	\N	\N	\N	1297-02-22	\N	\N	\N	1247	\N	1728-05-16	\N	\N	/wiki/Margaret_of_Cortona	\N	\N
621	Hermenegild	\N	\N	\N	0585-04-13	\N	\N	\N	500s	\N	\N	\N	\N	/wiki/Hermenegild	found in Roman Martyrology	\N
616	Heribert of Cologne	\N	\N	\N	1021-03-16	\N	\N	\N	c. 970	\N	\N	\N	\N	/wiki/Heribert_of_Cologne	c. 1075 by Pope Gregory VII	\N
606	Héctor Valdivielso Sáez	\N	\N	1910-10-31	1934-10-09	\N	\N	\N	\N	\N	1999-11-21	\N	First Argentine saint.	/w/index.php?title=H%C3%A9ctor_Valdivielso_S%C3%A1ez&action=edit&redlink=1	\N	\N
1487	Thomas Xico	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Thomas_Xico&action=edit&redlink=1	\N	\N
1107	Paula Frassinetti	\N	\N	1809-03-03	1882-06-11	\N	\N	\N	\N	\N	1984-03-11	\N	\N	/wiki/Paula_Frassinetti	\N	\N
617	Herculanils	\N	\N	\N	\N	\N	\N	\N	100s	180	\N	\N	\N	/wiki/Herculanils	\N	\N
680	James the Less	\N	\N	\N	\N	\N	\N	\N	1st century BC	c. 62 AD	\N	\N	\N	/wiki/James,_son_of_Alphaeus	found in Roman Martyrology	\N
841	Leutfridus	\N	\N	\N	\N	\N	\N	\N	600s	738	\N	\N	\N	/wiki/Leutfridus	found in Roman Martyrology	\N
952	Maron	\N	\N	\N	\N	\N	\N	\N	300s	410	\N	\N	\N	/wiki/Maron	\N	\N
971	Matthias	\N	\N	\N	\N	\N	\N	\N	0's	c. 80 AD	\N	\N	\N	/wiki/Saint_Matthias	found in Roman Martyrology	\N
1022	Narnus	\N	\N	\N	\N	\N	\N	\N	unknown	345	\N	\N	\N	/wiki/Narnus	found in Roman Martyrology	\N
1068	Onesiphorus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 81 AD	\N	\N	\N	/wiki/Onesiphorus	found in Roman Martyrology f	\N
1083	Pancras of Rome	\N	\N	\N	\N	\N	\N	\N	c. 289	12 May 303 or 304	\N	\N	\N	/wiki/Pancras_of_Rome	found in Roman Martyrology	\N
1168	Philomena	\N	\N	\N	\N	\N	\N	t	c. 10 January 291	c. 10 August 304	\N	\N	Virgin, Martyr	/wiki/Philomena	13 January 1837 by Pope Gregory XVI	\N
1238	Pope Miltiades	\N	\N	\N	\N	\N	\N	\N	200s	10 or 11 January 314	\N	\N	\N	/wiki/Pope_Miltiades	found in Roman Martyrology	\N
1273	Prisca	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Saint_Prisca	found in Roman Martyrology	\N
1339	Sagar of Laodicea	\N	\N	\N	\N	\N	\N	\N	unknown	175	\N	\N	\N	/wiki/Sagar_of_Laodicea	found in Roman Martyrology	\N
1353	Sennen	\N	\N	\N	\N	\N	\N	\N	100s	c. 250	\N	\N	\N	/wiki/Abdon_and_Sennen	found in Roman Martyrology	\N
1375	Silvia	\N	\N	\N	\N	\N	\N	\N	c. 515	c. 592	\N	\N	mother of Pope Gregory I	/wiki/Saint_Silvia	found in Roman Martyrology	\N
1407	Tarcisius	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/wiki/Tarcisius	found in Roman Martyrology	\N
1427	Theodora	\N	\N	\N	\N	\N	\N	\N	unknown	120	\N	\N	\N	/wiki/Theodora_(Roman_martyr)	found in Roman Martyrology	\N
1445	Theopista	\N	\N	\N	\N	\N	\N	\N	0's	118	\N	\N	\N	/wiki/Saint_Eustace	found in Roman Martyrology	\N
1467	Titus	\N	\N	\N	\N	\N	\N	\N	0's	96 or 107 AD	\N	\N	\N	/wiki/Saint_Titus	found in Roman Martyrology	\N
1477	Urban of Langres	\N	\N	\N	\N	\N	\N	\N	327	c. 390	\N	\N	\N	/wiki/Urban_of_Langres	found in Roman Martyrology	\N
1490	Veronica	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Saint_Veronica	\N	\N
1389	Stanislaus Kostka	\N	\N	1550-10-28	1568-08-15	\N	\N	\N	\N	\N	1726-12-31	\N	\N	/wiki/Stanislaus_Kostka	\N	\N
1322	Roque González y de Santa Cruz	\N	\N	1576-11-17	1628-11-15	\N	\N	\N	\N	\N	1988-05-16	\N	\N	/wiki/Roque_Gonz%C3%A1lez_y_de_Santa_Cruz	\N	\N
1305	Richard Pampuri	\N	\N	1897-08-02	1930-03-01	\N	\N	\N	\N	\N	1989-11-01	\N	\N	/wiki/Richard_Pampuri	\N	\N
1288	Rafael Arnáiz Barón	\N	\N	1911-04-09	1938-04-26	\N	\N	\N	\N	\N	2009-10-11	\N	\N	/wiki/Rafael_Arn%C3%A1iz_Bar%C3%B3n	\N	\N
1254	Pope Stephen I	\N	\N	\N	0257-08-02	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Stephen_I	found in Roman Martyrology	\N
1223	Pope John XXIII	\N	\N	1881-11-25	1963-06-03	\N	\N	\N	\N	\N	2014-04-27	\N	\N	/wiki/Pope_John_XXIII	\N	\N
1206	Pope Eugene II	\N	\N	\N	0827-08-27	\N	\N	\N	700s	\N	\N	\N	\N	/wiki/Pope_Eugene_II	(cultus confirmed) by Pope Pius IX	\N
1186	Pope Adrian III	\N	\N	\N	0885-07-08	\N	\N	\N	unknown	\N	1891-06-02	\N	\N	/wiki/Pope_Adrian_III	\N	\N
1149	Peter of Tarentaise	\N	\N	\N	1174-09-14	\N	\N	\N	1102	\N	1191-05-10	\N	\N	/wiki/Peter_II_of_Tarentaise	\N	\N
1117	Pedro de Arbués	\N	\N	\N	1485-09-17	\N	\N	\N	c. 1441	\N	1867-06-29	\N	\N	/wiki/Pedro_de_Arbu%C3%A9s	\N	\N
1101	Paul of the Cross	\N	\N	1694-01-03	1775-10-18	\N	\N	\N	\N	\N	1867-06-29	\N	\N	/wiki/Paul_of_the_Cross	\N	\N
1132	Pacificus of San Severino	\N	\N	1653-03-01	1721-09-24	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Pacificus_of_San_Severino	26 May 1839 by Pope Gregory XVI	\N
1052	Nothhelm	\N	\N	\N	0739-10-17	\N	\N	\N	600s	\N	\N	\N	\N	/wiki/Nothhelm	\N	\N
1034	Nicholas Poppel	\N	\N	\N	1572-07-09	\N	\N	t	1532	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Nicholas_Poppel&action=edit&redlink=1	\N	\N
1007	Miguel Febres Cordero	\N	\N	1854-11-07	1910-02-09	\N	\N	\N	\N	\N	1984-10-21	\N	\N	/wiki/Miguel_Febres_Cordero	\N	\N
986	Meinrad of Einsiedeln	\N	\N	\N	0861-01-21	\N	\N	\N	c. 797	\N	\N	\N	\N	/wiki/Meinrad_of_Einsiedeln	found in Roman Martyrology	\N
933	Maria Goretti	\N	\N	1890-10-16	1902-07-06	\N	\N	\N	\N	\N	1950-06-24	\N	\N	/wiki/Maria_Goretti	\N	\N
910	Margaret of Hungary	\N	\N	1242-01-27	1270-01-18	\N	\N	\N	\N	\N	1943-11-19	\N	\N	/wiki/Margaret_of_Hungary_(saint)	\N	\N
895	Manuel González García	\N	\N	1877-02-25	1940-01-04	\N	\N	\N	\N	\N	2016-10-16	\N	\N	/wiki/Manuel_Gonz%C3%A1lez_Garc%C3%ADa_(bishop)	\N	\N
875	Luke Kirby	\N	\N	\N	1582-05-30	\N	\N	t	c. 1549	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Luke_Kirby_(priest)	\N	\N
858	Louis Martin	\N	\N	1823-08-22	1894-07-29	\N	\N	\N	\N	\N	2015-10-18	\N	\N	/wiki/Louis_Martin_and_Marie-Az%C3%A9lie_Gu%C3%A9rin	\N	\N
825	Lawrence of Rome	\N	\N	0225-12-31	0258-08-10	\N	\N	t	\N	\N	\N	\N	martyr of Rome	/wiki/Saint_Lawrence	found in Roman Martyrology	\N
808	Katharine Drexel	\N	\N	1858-11-26	1955-03-03	\N	\N	\N	\N	\N	2000-10-01	\N	\N	/wiki/Katharine_Drexel	\N	\N
793	Julian of Cuenca	\N	\N	\N	1208-01-28	\N	\N	\N	c. 1127	\N	1594-10-18	\N	\N	/wiki/Julian_of_Cuenca	\N	\N
781	Juan Diego	\N	\N	\N	\N	\N	\N	\N	1474	1548	2002-07-31	\N	first Roman Catholic indigenous American saint	/wiki/Juan_Diego	\N	\N
749	John Southworth	\N	\N	\N	1654-06-28	\N	\N	t	1592	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Southworth_(martyr)	\N	\N
733	John of Damascus	\N	\N	\N	0749-12-04	\N	\N	\N	675 or 676	\N	\N	\N	\N	/wiki/John_of_Damascus	found in Roman Martyrology	\N
712	John Francis Regis	\N	\N	1597-01-31	1640-12-31	\N	\N	\N	\N	\N	1737-04-05	\N	\N	/wiki/John_Francis_Regis	\N	\N
694	Jesús Méndez Montoya	\N	\N	1880-06-10	1928-02-05	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Jes%C3%BAs_M%C3%A9ndez_Montoya&action=edit&redlink=1	\N	\N
663	Íte of Killeedy	\N	\N	\N	0570-01-15	\N	\N	\N	c. 480	\N	\N	\N	\N	/wiki/%C3%8Dte_of_Killeedy	\N	\N
647	Ingrid of Skänninge	\N	\N	\N	1282-09-09	\N	\N	\N	1200s	\N	\N	\N	\N	/wiki/Saint_Ingrid_of_Sk%C3%A4nninge	\N	\N
632	Humilis of Bisignano	\N	\N	1582-08-26	1637-11-26	\N	\N	\N	\N	\N	2002-05-19	\N	\N	/wiki/Humilis_of_Bisignano	\N	\N
603	Guillaume Courtet	\N	\N	\N	1637-09-29	\N	\N	t	c. 1590	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Guillaume_Courtet	\N	\N
586	Gonzaga Gonza	\N	\N	\N	1886-05-27	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Gonzaga_Gonza&action=edit&redlink=1	\N	\N
578	Giustino de Jacobis	\N	\N	1800-10-09	1860-07-31	\N	\N	\N	\N	\N	1975-10-26	\N	\N	/wiki/Giustino_de_Jacobis	\N	\N
1529	William of Maleval	\N	\N	\N	1157-02-10	\N	\N	\N	unknown	\N	1202-05-08	\N	\N	/wiki/William_of_Maleval	\N	\N
575	Giuseppe Maria Tomasi	\N	\N	1649-09-12	1713-01-01	\N	\N	\N	\N	\N	1986-10-12	\N	professed priest of the Theatines; cardinal	/wiki/Giuseppe_Maria_Tomasi	\N	\N
559	Gertrude of Nivelles	\N	\N	\N	0659-03-17	\N	\N	\N	c. 628	\N	\N	\N	\N	/wiki/Gertrude_of_Nivelles	1677 (informally) by Pope Clement XII	\N
524	Gabriel de Duisco	\N	\N	\N	1597-02-05	\N	\N	t	c. 1578	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Gabriel_de_Duisco&action=edit&redlink=1	\N	\N
1544	Zeno of Verona	\N	\N	\N	0371-04-12	\N	\N	\N	300	\N	\N	\N	\N	/wiki/Zeno_of_Verona	found in Roman Martyrology	\N
765	Joseph Calasanz	\N	\N	1557-09-11	1648-08-25	\N	\N	\N	\N	\N	1767-07-16	\N	\N	/wiki/Joseph_Calasanz	\N	\N
622	Hilarion	\N	\N	\N	\N	\N	\N	\N	291	371	\N	\N	\N	/wiki/Hilarion	found in Roman Martyrology	\N
659	Isaac of Nineveh	\N	\N	\N	\N	\N	\N	\N	c. 613	c. 700	\N	\N	\N	/wiki/Isaac_of_Nineveh	\N	\N
698	Joachim	\N	\N	\N	\N	\N	\N	\N	c. 50 BC	15 AD	\N	\N	\N	/wiki/Joachim	found in Roman Martyrology	\N
803	Justin of Siponto	\N	\N	\N	\N	\N	\N	\N	200s	c. 310	\N	\N	\N	/wiki/Justin_of_Siponto	\N	\N
820	Largus	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Cyriacus	found in Roman Martyrology	\N
903	Marcellinus of Tomi	\N	\N	\N	\N	\N	\N	\N	200s	c. 320	\N	\N	\N	/wiki/Narcissus,_Argeus,_and_Marcellinus	found in Roman Martyrology	\N
974	Matthew the Apostle	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Matthew_the_Apostle	found in Roman Martyrology	\N
1024	Nazarius	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Nazarius_and_Celsus	found in Roman Martyrology	\N
1054	Nymphodora	\N	\N	\N	\N	\N	\N	\N	200s	305-311	\N	\N	\N	/wiki/Menodora,_Metrodora,_and_Nymphodora	found in Roman Martyrology	\N
1074	Orientius	\N	\N	\N	\N	\N	\N	\N	unknown	400s	\N	\N	\N	/wiki/Orientius	found in Roman Martyrology	\N
1106	Paul the Simple	\N	\N	\N	\N	\N	\N	\N	c. 225	c. 339	\N	\N	\N	/wiki/Paul_the_Simple	found in Roman Martyrology	\N
1120	Pelagia of Tarsus	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Pelagia_of_Tarsus	found in Roman Martyrology	\N
1155	Petronilla	\N	\N	\N	\N	\N	\N	\N	unknown	c. 90 AD	\N	\N	\N	/wiki/Saint_Petronilla	found in Roman Martyrology	\N
1276	Proculus of Bologna	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Proculus_of_Bologna	found in Roman Martyrology	\N
1306	Richard the Pilgrim	\N	\N	\N	\N	\N	\N	\N	600s	722	\N	\N	\N	/wiki/Richard_the_Pilgrim	\N	\N
1323	Romulus	\N	\N	\N	\N	\N	\N	t	0's	117	\N	\N	martyr	/wiki/Romulus_(martyr)	found in Roman Martyrology	\N
1357	Septimius of Iesi	\N	\N	\N	\N	\N	\N	\N	200s	307	\N	\N	\N	/wiki/Septimius_of_Iesi	\N	\N
1370	Shemon Bar Sabbae	\N	\N	\N	\N	\N	\N	\N	200s	345	\N	\N	\N	/wiki/Shemon_Bar_Sabbae	found in Roman Martyrology	\N
1385	Smaragdus	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Cyriacus	found in Roman Martyrology	\N
1401	Stephen the Younger	\N	\N	\N	\N	\N	\N	\N	713 or 715	28 November 764 or 765	\N	\N	\N	/wiki/Stephen_the_Younger	found in Roman Martyrology	\N
1434	Theodore Stratelates	\N	\N	\N	\N	\N	\N	\N	281	319	\N	\N	\N	/wiki/Theodore_Stratelates	found in Roman Martyrology	\N
1485	Venantius of Camerino	\N	\N	\N	\N	\N	\N	\N	200s	c. 250	\N	\N	\N	/wiki/Venantius_of_Camerino	found in Roman Martyrology	\N
1502	Vincent of Lérins	\N	\N	\N	\N	\N	\N	\N	300s	c. 445	\N	\N	\N	/wiki/Vincent_of_L%C3%A9rins	found in Roman Martyrology	\N
1530	William of Perth	\N	\N	\N	\N	\N	\N	\N	1100s	c. 1201	\N	\N	\N	/wiki/William_of_Perth	1256 by Pope Alexander IV	\N
1546	Zoilus	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Saint_Zoilus	found in Roman Martyrology	\N
1341	Salvador Lara Puente	\N	\N	1905-08-13	1926-08-15	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Salvador_Lara_Puente&action=edit&redlink=1	\N	\N
1289	Rafael Guízar y Valencia	\N	\N	1878-04-26	1938-06-06	\N	\N	\N	\N	\N	2006-10-15	\N	\N	/wiki/Rafael_Gu%C3%ADzar_y_Valencia	\N	\N
1258	Pope Symmachus	\N	\N	\N	0514-07-19	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_Symmachus	found in Roman Martyrology	\N
1236	Pope Nicholas I	\N	\N	\N	0867-11-13	\N	\N	\N	800	\N	0868-05-08	\N	\N	/wiki/Pope_Nicholas_I	\N	\N
1220	Pope Innocent I	\N	\N	\N	0417-03-12	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Pope_Innocent_I	found in Roman Martyrology	\N
1204	Pope Eugene I	\N	\N	\N	0657-06-02	\N	\N	\N	615	\N	\N	\N	\N	/wiki/Pope_Eugene_I	found in Roman Martyrology	\N
1189	Pope Anacletus	\N	\N	\N	1992-04-26	\N	\N	\N	c. 25	\N	\N	\N	\N	/wiki/Pope_Anacletus	found in Roman Martyrology	\N
1172	Pio of Pietrelcina	\N	\N	1887-05-25	1968-09-23	\N	\N	\N	\N	\N	2002-06-16	\N	\N	/wiki/Padre_Pio	\N	\N
1138	Peter González	\N	\N	\N	1246-04-15	\N	\N	\N	1190	\N	1741-12-13	\N	\N	/wiki/Peter_Gonz%C3%A1lez	\N	\N
1088	Paola Elisabetta Cerioli	\N	\N	1816-01-28	1865-12-24	\N	\N	\N	\N	\N	2004-05-16	\N	\N	/wiki/Paola_Elisabetta_Cerioli	\N	\N
1040	Nicholas the Pilgrim	\N	\N	\N	1094-06-02	\N	\N	\N	1075	\N	\N	\N	\N	/wiki/Nicholas_the_Pilgrim	1098 by Pope Urban II	\N
1008	Miguel de la Mora	\N	\N	1874-06-19	1927-08-07	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Miguel_de_la_Mora&action=edit&redlink=1	\N	\N
990	Melania the Younger	\N	\N	\N	0439-12-31	\N	\N	\N	c. 383	\N	\N	\N	\N	/wiki/Melania_the_Younger	found in Roman Martyrology	\N
955	Martin of Leon	\N	\N	\N	1203-01-12	\N	\N	\N	c. 1130	\N	\N	\N	\N	/wiki/Martin_of_Leon	\N	\N
938	Mariam Thresia Chiramel	\N	\N	1876-04-26	1926-06-08	\N	\N	\N	\N	\N	2019-10-13	\N	Syro-Malabar Catholic nun and the founder of the Congregation of the Holy Family	/wiki/Mariam_Thresia_Chiramel	\N	\N
915	Marguerite Bays	\N	\N	1815-09-08	1879-06-27	\N	\N	\N	\N	\N	2019-10-13	\N	\N	/wiki/Marguerite_Bays	\N	\N
884	Máedóc of Ferns	\N	\N	\N	0632-01-31	\N	\N	\N	c. 558	\N	\N	\N	\N	/wiki/M%C3%A1ed%C3%B3c_of_Ferns	\N	\N
867	Ludmila of Bohemia	\N	\N	\N	0921-09-15	\N	\N	\N	c. 860	\N	\N	\N	\N	/wiki/Ludmila_of_Bohemia	\N	\N
853	Louis Bertrand	\N	\N	1526-01-01	1581-10-09	\N	\N	\N	\N	\N	1671-04-12	\N	\N	/wiki/Louis_Bertrand_(saint)	\N	\N
836	Leonardo Murialdo	\N	\N	1828-10-26	1900-03-30	\N	\N	\N	\N	\N	1970-05-03	\N	\N	/wiki/Leonardo_Murialdo	\N	\N
785	Juan of Tlaxcala	\N	\N	\N	\N	\N	\N	t	c. 1516	1529	2017-10-15	\N	one of the Child Martyrs of Tlaxcala	/wiki/Child_Martyrs_of_Tlaxcala	\N	\N
750	John Vianney	\N	\N	1786-05-08	1859-08-04	\N	\N	\N	\N	\N	1925-05-31	\N	\N	/wiki/John_Vianney	\N	\N
734	John of God	\N	\N	1495-03-08	1550-03-08	\N	\N	\N	\N	\N	1690-10-16	\N	\N	/wiki/John_of_God	\N	\N
714	John Gabriel Perboyre	\N	\N	1802-01-06	1840-09-11	\N	\N	\N	\N	\N	1996-06-02	\N	\N	/wiki/John_Gabriel_Perboyre	\N	\N
677	James of the Marches	\N	\N	\N	1476-11-28	\N	\N	\N	c. 1391	\N	1726-12-10	\N	\N	/wiki/James_of_the_Marches	\N	\N
642	Ignatius of Laconi	\N	\N	1701-12-10	1781-05-11	\N	\N	\N	\N	\N	1951-10-21	\N	professed religious of the Franciscan Capuchins	/wiki/Ignatius_of_Laconi	\N	\N
517	François de Laval	\N	\N	1623-04-30	1708-05-06	\N	\N	\N	\N	\N	2014-04-03	\N	Canonized by equivalent canonization, first Bishop of Quebec. Professed priest of the Paris Foreign Mission Society.	/wiki/Fran%C3%A7ois_de_Laval	\N	\N
509	Francis of Saint Michael	\N	\N	\N	1597-02-05	\N	\N	t	c. 1544	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Francis_of_Saint_Michael&action=edit&redlink=1	\N	\N
419	Elizabeth of Hungary	\N	\N	1207-07-07	1231-11-17	\N	\N	\N	\N	\N	\N	\N	patron saint of the homeless, blessed by St. Francis of Assisi, associated with the Third Order of St. Francis, first saint associated with roses through the miracle of the roses	/wiki/Elizabeth_of_Hungary	27 May 1235 by Pope Gregory IX	\N
152	Antonio Maria Gianelli	\N	\N	1789-04-12	1846-06-07	\N	\N	\N	\N	\N	1951-10-21	\N	bishop of Bobbio; founder of the Daughters of Our Lady of the Garden	/wiki/Antonio_Maria_Gianelli	\N	\N
1518	Wiborada	\N	\N	\N	\N	\N	\N	\N	800s	926	1047-01-05	\N	\N	/wiki/Wiborada	\N	\N
1451	Thérèse of Lisieux	\N	\N	1873-01-02	1897-09-30	\N	\N	\N	\N	\N	1925-05-17	\N	\N	/wiki/Th%C3%A9r%C3%A8se_of_Lisieux	\N	\N
766	Joseph Freinademetz	\N	\N	1852-04-15	1908-01-28	\N	\N	\N	\N	\N	2003-10-05	\N	\N	/wiki/Joseph_Freinademetz	\N	\N
624	Hippolytus of Rome	\N	\N	\N	\N	\N	\N	\N	c. 170	c. 235	\N	\N	\N	/wiki/Hippolytus_of_Rome	found in Roman Martyrology	\N
640	Ia of Cornwall	\N	\N	\N	\N	\N	\N	\N	unknown	450	\N	\N	\N	/wiki/Ia_of_Cornwall	\N	\N
655	Irene of Rome	\N	\N	\N	\N	\N	\N	\N	200s	288	\N	\N	\N	/wiki/Irene_of_Rome	\N	\N
706	John Cassian	\N	\N	\N	\N	\N	\N	\N	c. 360	c. 435	\N	\N	\N	/wiki/John_Cassian	\N	\N
827	Lazarus of Bethany	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Lazarus_of_Bethany	found in Roman Martyrology	\N
844	Liberius of Ravenna	\N	\N	\N	\N	\N	\N	\N	100s	c. 200	\N	\N	bishop of Ravenna	/wiki/Liberius_of_Ravenna	found in Roman Martyrology	\N
901	Marcian of Tortona	\N	\N	\N	\N	\N	\N	\N	0's	c. 120	\N	\N	\N	/wiki/Marcian_of_Tortona	found in Roman Martyrology	\N
968	Mary	\N	\N	\N	\N	\N	\N	\N	c. 8 September 18 BC	0's	\N	\N	mother of Jesus Christ	/wiki/Mary,_mother_of_Jesus	found in Roman Martyrology	\N
1018	Nazarius of Rome	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Basilides,_Cyrinus,_Nabor_and_Nazarius	found in Roman Martyrology	\N
1036	Nicetas the Goth	\N	\N	\N	\N	\N	\N	\N	300s	372	\N	\N	\N	/wiki/Nicetas_the_Goth	found in Roman Martyrology	\N
1053	Novatus	\N	\N	\N	\N	\N	\N	\N	unknown	151	\N	\N	\N	/wiki/Novatus	found in Roman Martyrology	\N
1071	Orentius	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
1091	Parthenius	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/wiki/Saint_Parthenius	found in Roman Martyrology	\N
1126	Peter	\N	\N	\N	\N	\N	\N	\N	c. 1 AD	64-68 AD	\N	\N	\N	/wiki/Saint_Peter	found in Roman Martyrology	\N
1177	Plautilla	\N	\N	\N	\N	\N	\N	\N	unknown	67 AD	\N	\N	\N	/wiki/Plautilla	found in Roman Martyrology	\N
1281	Ptolemaeus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 165	\N	\N	\N	/wiki/Ptolemaeus_and_Lucius	found in Roman Martyrology	\N
1333	Rupert of Bingen	\N	\N	\N	\N	\N	\N	\N	712	732	\N	\N	\N	/wiki/Bertha_of_Bingen#Rupert_of_Bingen	\N	\N
1384	Simplicius	\N	\N	\N	\N	\N	\N	\N	200s	302 or 303	\N	\N	\N	/wiki/Simplicius,_Faustinus_and_Beatrix	found in Roman Martyrology	\N
1469	Tryphon	\N	\N	\N	\N	\N	\N	\N	unknown	c. 250	\N	\N	\N	/wiki/Tryphon,_Respicius,_and_Nympha	found in Roman Martyrology	\N
1438	Theodosius of Kiev	\N	\N	\N	1074-05-03	\N	\N	\N	1029	\N	\N	\N	\N	/wiki/Theodosius_of_Kiev	found in Roman Martyrology	\N
1486	Szymon of Lipnica	\N	\N	\N	1482-07-18	\N	\N	\N	c. 1437	\N	2007-06-03	\N	\N	/wiki/Szymon_of_Lipnica	\N	\N
1402	Sturm	\N	\N	\N	0779-12-17	\N	\N	\N	705	\N	\N	\N	\N	/wiki/Saint_Sturm	1139 by Pope Innocent II	\N
1368	Seraphim of Sarov	\N	\N	1754-07-30	1833-01-15	\N	\N	\N	\N	\N	1903-07-19	\N	\N	/wiki/Seraphim_of_Sarov	\N	\N
1349	Scholastica	\N	\N	\N	0543-02-10	\N	\N	\N	c. 480	\N	\N	\N	\N	/wiki/Scholastica	found in Roman Martyrology	\N
1313	Román Adame Rosales	\N	\N	1859-02-27	1927-04-21	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Rom%C3%A1n_Adame_Rosales&action=edit&redlink=1	\N	\N
1297	Raymond of Penyafort	\N	\N	\N	1275-01-06	\N	\N	\N	c. 1175	\N	1601-04-29	\N	Spanish Dominican friar	/wiki/Raymond_of_Penyafort	\N	\N
1261	Pope Zachary	\N	\N	\N	0752-03-15	\N	\N	\N	679	\N	\N	\N	\N	/wiki/Pope_Zachary	found in Roman Martyrology	\N
1244	Pope Pius X	\N	\N	1835-06-02	1914-08-20	\N	\N	\N	\N	\N	1954-05-29	\N	\N	/wiki/Pope_Pius_X	\N	\N
1227	Pope Leo I	\N	\N	\N	0461-11-10	\N	\N	\N	c. 400	\N	\N	\N	also known as Leo the Great, Doctor of the Church	/wiki/Pope_Leo_I	found in Roman Martyrology	\N
1209	Pope Eutychian	\N	\N	\N	0283-12-07	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Eutychian	found in Roman Martyrology	\N
1193	Pope Benedict II	\N	\N	\N	0685-05-08	\N	\N	\N	600s	\N	\N	\N	\N	/wiki/Pope_Benedict_II	found in Roman Martyrology	\N
1161	Philip Evans	\N	\N	\N	1679-07-22	\N	\N	t	1645	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Saint_Philip_Evans	\N	\N
1144	Peter of Assche	\N	\N	\N	1572-07-09	\N	\N	t	1530	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Peter_of_Assche&action=edit&redlink=1	\N	\N
1110	Paulinus of Nola	\N	\N	\N	0431-06-22	\N	\N	\N	354	\N	\N	\N	\N	/wiki/Paulinus_of_Nola	\N	\N
1004	Miguel de Aozaraza	\N	\N	1598-02-07	1637-09-29	\N	\N	t	\N	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Miguel_de_Aozaraza	\N	\N
984	Maximus the Confessor	\N	\N	\N	0662-08-13	\N	\N	\N	c. 580	\N	\N	\N	\N	/wiki/Maximus_the_Confessor	found in Roman Martyrology	\N
945	Marina of Omura	\N	\N	\N	1634-11-11	\N	\N	t	1500s or 1600s	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Marina_of_Omura&action=edit&redlink=1	\N	\N
929	María Guadalupe García Zavala	\N	\N	1878-04-27	1963-06-24	\N	\N	\N	\N	\N	2013-05-12	\N	\N	/wiki/Mar%C3%ADa_Guadalupe_Garc%C3%ADa_Zavala	\N	\N
918	Maria Cristina of the Immaculate Conception Brando	\N	\N	1856-05-01	1906-01-20	\N	\N	\N	\N	\N	2015-05-17	\N	\N	/wiki/Maria_Cristina_of_the_Immaculate_Conception_Brando	\N	\N
885	Macrina the Younger	\N	\N	\N	0379-07-19	\N	\N	\N	c. 330	\N	\N	\N	\N	/wiki/Macrina_the_Younger	found in Roman Martyrology	\N
866	Lucian of Antioch	\N	\N	\N	0312-01-07	\N	\N	\N	c. 240	\N	\N	\N	\N	/wiki/Lucian_of_Antioch	found in Roman Martyrology	\N
812	Kateri Tekakwitha	\N	\N	\N	1680-04-17	\N	\N	\N	1656	\N	2012-10-21	\N	First Native American to become a saint	/wiki/Kateri_Tekakwitha	\N	\N
792	Juliana Falconieri	\N	\N	\N	1341-06-19	\N	\N	\N	1270	\N	1737-06-16	\N	\N	/wiki/Juliana_Falconieri	\N	\N
776	Józef Bilczewski	\N	\N	1860-04-26	1923-03-20	\N	\N	\N	\N	\N	2005-10-23	\N	\N	/wiki/J%C3%B3zef_Bilczewski	\N	\N
762	Josep Manyanet i Vives	\N	\N	1833-01-07	1901-12-17	\N	\N	\N	\N	\N	2004-05-16	\N	\N	/wiki/Josep_Manyanet_i_Vives	\N	\N
744	John Rigby	\N	\N	\N	1600-06-21	\N	\N	t	c. 1570	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Rigby_(martyr)	\N	\N
727	John of Ávila	\N	\N	1499-01-06	1569-05-10	\N	\N	\N	\N	\N	1970-05-31	\N	\N	/wiki/John_of_%C3%81vila	\N	\N
691	Jerome of Weert	\N	\N	\N	1572-07-09	\N	\N	t	1522	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Jerome_of_Weert&action=edit&redlink=1	\N	\N
671	Jaime Hilario Barbal	\N	\N	1898-01-02	1937-01-18	\N	\N	\N	\N	\N	1999-11-21	\N	\N	/wiki/Jaime_Hilario_Barbal	\N	\N
64	Alexis Falconieri	\N	\N	\N	1310-02-17	\N	\N	\N	1200s	\N	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/wiki/Alexis_Falconieri	\N	\N
54	Albert of Louvain	\N	\N	\N	1192-11-24	\N	\N	t	c. 1166	\N	1613-08-09	\N	Murdered by three German knights shortly after becoming Bishop of Liège and regarded as a martyr afterwards.	/wiki/Albert_of_Louvain	\N	\N
1506	Vincent Strambi	\N	\N	1745-01-01	1824-01-01	\N	\N	\N	\N	\N	1950-06-11	\N	professed priest of the Passionists; Bishop of Macerata	/wiki/Vincent_Strambi	\N	\N
1418	Teresa of Calcutta	\N	\N	1910-08-26	1997-09-05	\N	\N	\N	\N	\N	2016-09-04	\N	\N	/wiki/Mother_Teresa	\N	\N
1542	Zdislava Berka	\N	\N	\N	\N	\N	\N	\N	c. 1220	1252	1995-05-21	\N	\N	/wiki/Zdislava_Berka	\N	\N
1524	Willehad of Denmark	\N	\N	\N	1572-07-09	\N	\N	t	1482	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Willehad_of_Denmark	\N	\N
1458	Thomas Kozaki	\N	\N	\N	1597-02-05	\N	\N	t	1582	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Thomas_Kozaki	\N	\N
795	Julian of Sora	\N	\N	\N	\N	\N	\N	\N	unknown	150	\N	\N	\N	/wiki/Julian_of_Sora	found in Roman Martyrology	\N
815	Kunigunde of Rapperswil	\N	\N	\N	\N	\N	\N	\N	unknown	early 300s	\N	\N	\N	/wiki/Kunigunde_of_Rapperswil	\N	\N
831	Leo of Montefeltro	\N	\N	\N	\N	\N	\N	\N	c. 275	366	\N	\N	\N	/wiki/Leo_of_Montefeltro	\N	\N
845	Libert of Saint-Trond	\N	\N	\N	\N	\N	\N	\N	unknown	783	\N	\N	\N	/wiki/Libert_of_Saint-Trond	\N	\N
861	Lucius	\N	\N	\N	\N	\N	\N	\N	unknown	c. 165	\N	\N	\N	/wiki/Ptolemaeus_and_Lucius	found in Roman Martyrology	\N
882	Lydia of Thyatira	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Lydia_of_Thyatira	found in Roman Martyrology	\N
902	Marcellus of Capua	\N	\N	\N	\N	\N	\N	\N	300s or 400s	300s or 400s	\N	\N	\N	/wiki/Marcellus_of_Capua	found in Roman Martyrology	\N
998	Metrodora	\N	\N	\N	\N	\N	\N	\N	200s	305-311	\N	\N	\N	/wiki/Menodora,_Metrodora,_and_Nymphodora	found in Roman Martyrology	\N
1086	Pantaenus	\N	\N	\N	\N	\N	\N	\N	100s	c. 200	\N	\N	\N	/wiki/Pantaenus	found in Roman Martyrology	\N
1157	Philemon	\N	\N	\N	\N	\N	\N	\N	unknown	68 AD	\N	\N	\N	/wiki/Philemon_(biblical_figure)	found in Roman Martyrology	\N
1175	Plechelm	\N	\N	\N	\N	\N	\N	\N	600s	730	\N	\N	\N	/wiki/Plechelm	c. 950 by Pope Agapetus II	\N
1228	Pope Leo II	\N	\N	\N	\N	\N	\N	\N	611	July 683	\N	\N	\N	/wiki/Pope_Leo_II	found in Roman Martyrology	\N
1260	Pope Victor I	\N	\N	\N	\N	\N	\N	\N	100s	199	\N	\N	\N	/wiki/Pope_Victor_I	found in Roman Martyrology	\N
1278	Prosdocimus	\N	\N	\N	\N	\N	\N	\N	0s	c. 7 November 100 AD	\N	\N	\N	/wiki/Prosdocimus	found in Roman Martyrology	\N
1314	Roch	\N	\N	\N	\N	\N	\N	\N	c. 1348	15 or 16 August 1376 or 1379	\N	\N	\N	/wiki/Saint_Roch	added to the Roman Martyrology by Pope Gregory XIV (1590-1591)	\N
1348	Savinian	\N	\N	\N	\N	\N	\N	\N	300s	390	\N	\N	\N	/wiki/Savinian_and_Potentian	found in Roman Martyrology	\N
1380	Simeon of Mantua	\N	\N	\N	\N	\N	\N	\N	900s	1016	\N	\N	\N	/wiki/Simeon_of_Mantua	1049 by Pope Leo IX	\N
1415	Terentian	\N	\N	\N	\N	\N	\N	\N	0's	118	\N	\N	bishop of Todi	/wiki/Terentian	found in Roman Martyrology	\N
1464	Tiburtius of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	c. 260	\N	\N	\N	/wiki/Tiburtius,_Valerian,_and_Maximus	found in Roman Martyrology	\N
1510	Vincenzo Grossi	\N	\N	1845-03-09	1917-11-07	\N	\N	\N	\N	\N	2015-10-18	\N	Priest of the Vicariate of Rome; founder of the Society of the Catholic Apostolate (Pallottines), the Pallottine Missionary Sisters and the Pallottine Sisters of the Catholic Apostolate	/wiki/Vincenzo_Grossi	\N	\N
1432	Theodore of der Eem	\N	\N	\N	1572-07-09	\N	\N	t	1499–1502	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Theodore_of_der_Eem&action=edit&redlink=1	\N	\N
1419	Teresa Margaret of the Sacred Heart	\N	\N	1747-07-15	1770-03-07	\N	\N	\N	\N	\N	1934-03-19	\N	professed religious of the Discalced Carmelite Nuns	/wiki/Teresa_Margaret_of_the_Sacred_Heart	\N	\N
1329	Rudesind	\N	\N	0907-11-26	0977-03-01	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Rudesind	1195 by Pope Celestine III	\N
1298	Raymond Nonnatus	\N	\N	\N	1240-08-31	\N	\N	\N	1204	\N	\N	\N	\N	/wiki/Raymond_Nonnatus	1657 by Pope Alexander VII	\N
1243	Pope Paul VI	\N	\N	1897-09-26	1978-08-06	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Pope_Paul_VI	\N	\N
1212	Pope Felix III	\N	\N	\N	0492-03-01	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_Felix_III	found in Roman Martyrology	\N
1192	Pope Anterus	\N	\N	\N	0236-01-03	\N	\N	\N	100s	\N	\N	\N	\N	/wiki/Pope_Anterus	found in Roman Martyrology	\N
1140	Peter Julian Eymard	\N	\N	1811-02-04	1868-08-01	\N	\N	\N	\N	\N	1962-12-09	\N	\N	/wiki/Peter_Julian_Eymard	\N	\N
1122	Peregrine Laziosi	\N	\N	\N	1345-05-01	\N	\N	\N	c. 1260	\N	1726-12-27	\N	\N	/wiki/Peregrine_Laziosi	\N	\N
1104	Paul Suzuki	\N	\N	\N	1597-02-05	\N	\N	t	1563	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Paul_Suzuki&action=edit&redlink=1	\N	\N
1067	Oliver Plunkett	\N	\N	1625-11-01	1681-07-01	\N	\N	\N	\N	\N	1975-10-12	\N	\N	/wiki/Oliver_Plunkett	\N	\N
1050	Noël Chabanel	\N	\N	1613-02-02	1649-12-08	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/No%C3%ABl_Chabanel	\N	\N
1033	Nicasius of Heeze	\N	\N	\N	1572-07-09	\N	\N	t	1522	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Nicasius_of_Heeze&action=edit&redlink=1	\N	\N
1016	Mungo	\N	\N	\N	0614-01-13	\N	\N	\N	518	\N	\N	\N	\N	/wiki/Saint_Mungo	\N	\N
981	Maximilian Kolbe	\N	\N	1894-01-08	1941-08-14	\N	\N	\N	\N	\N	1982-10-10	\N	\N	/wiki/Maximilian_Kolbe	\N	\N
966	Matilda of Ringelheim	\N	\N	\N	0968-03-14	\N	\N	\N	c. 894 or 897	\N	\N	\N	\N	/wiki/Matilda_of_Ringelheim	found in Roman Martyrology	\N
954	Martin de Porres	\N	\N	1579-12-09	1639-11-03	\N	\N	\N	\N	\N	1962-05-06	\N	professed religious of the Dominicans	/wiki/Martin_de_Porres	\N	\N
935	Mariana de Jesús de Paredes	\N	\N	1618-10-31	1645-05-26	\N	\N	\N	\N	\N	1950-07-09	\N	layperson of the Archdiocese of Quito, member of the Secular Franciscans	/wiki/Mariana_de_Jes%C3%BAs_de_Paredes	\N	\N
921	Maria Bernarda Bütler	\N	\N	1848-05-28	1924-05-19	\N	\N	\N	\N	\N	2008-10-12	\N	\N	/wiki/Maria_Bernarda_B%C3%BCtler	\N	\N
775	Joseph Vaz	\N	\N	1651-04-21	1711-01-16	\N	\N	\N	\N	\N	2015-01-14	\N	priest of the Oratorians	/wiki/Joseph_Vaz	\N	\N
761	José Sánchez del Río	\N	\N	1913-03-28	1928-02-10	\N	\N	\N	\N	\N	2016-10-16	\N	one of the Saints of the Cristero War	/wiki/Jos%C3%A9_S%C3%A1nchez_del_R%C3%ADo	\N	\N
745	John Soan de Goto	\N	\N	\N	1597-02-05	\N	\N	t	c. 1578	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/John_Soan_de_Goto	\N	\N
731	John of Cologne	\N	\N	\N	1572-07-09	\N	\N	t	1500s	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/John_of_Cologne	\N	\N
713	John Houghton	\N	\N	\N	1535-05-04	\N	\N	t	c. 1487	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Houghton_(martyr)	\N	\N
696	Joachim Sakakibara	\N	\N	\N	1597-02-05	\N	\N	t	1556	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Joachim_Sakakibara&action=edit&redlink=1	\N	\N
678	Jan of Oisterwijk	\N	\N	\N	1572-07-09	\N	\N	t	1504	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Jan_of_Oisterwijk&action=edit&redlink=1	\N	\N
662	Isidore the Laborer	\N	\N	\N	1130-05-15	\N	\N	\N	c. 1070	\N	\N	\N	\N	/wiki/Isidore_the_Laborer	12 March 1622 by Pope Gregory XV	\N
644	Ignatius of Santhià	\N	\N	1686-06-05	1770-09-22	\N	\N	\N	\N	\N	2002-05-19	\N	professed priest of the Franciscan Capuchins	/wiki/Ignatius_of_Santhi%C3%A0	\N	\N
627	Homobonus	\N	\N	\N	1197-11-13	\N	\N	\N	1100s	\N	1199-01-12	\N	\N	/wiki/Saint_Homobonus	\N	\N
510	Francis Shoyemon	\N	\N	\N	1633-08-14	\N	\N	t	1500s or 1600s	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Francis_Shoyemon&action=edit&redlink=1	\N	\N
1519	Wihtberht	\N	\N	0675-05-07	0747-08-13	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Wihtberht	\N	\N
1481	Ursula	\N	\N	\N	0383-10-21	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Saint_Ursula	found in Roman Martyrology	\N
1471	Tranquilino Ubiarco Robles	\N	\N	1899-07-08	1928-10-05	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Tranquilino_Ubiarco_Robles&action=edit&redlink=1	\N	\N
1365	Serapion of Algiers	\N	\N	\N	1240-11-14	\N	\N	\N	1179	\N	1728-04-14	\N	\N	/wiki/Serapion_of_Algiers	\N	\N
1536	Wolfgang of Regensburg	\N	\N	\N	0994-10-31	\N	\N	\N	934	\N	1051-10-08	\N	\N	/wiki/Wolfgang_of_Regensburg	\N	\N
1501	Vincent Ferrer	\N	\N	1350-01-23	1419-04-05	\N	\N	\N	\N	\N	1455-06-03	\N	\N	/wiki/Vincent_Ferrer	\N	\N
1468	Tommaso da Cori	\N	\N	1655-06-04	1729-01-11	\N	\N	\N	\N	\N	1999-11-21	\N	professed priest of the Franciscan Friars Minor	/wiki/Tommaso_da_Cori	\N	\N
1449	Thérèse Couderc	\N	\N	1805-02-01	1885-09-26	\N	\N	\N	\N	\N	1970-05-10	\N	\N	/wiki/Th%C3%A9r%C3%A8se_Couderc	\N	\N
1395	Stephen I of Hungary	\N	\N	\N	1038-08-15	\N	\N	\N	c. 975	\N	\N	\N	married layperson of the Archdiocese of Esztergom, king of Hungary	/wiki/Stephen_I_of_Hungary	20 August 1083 by Pope Gregory VII	\N
833	Leonard of Noblac	\N	\N	\N	\N	\N	\N	\N	400s - 500s	559	\N	\N	\N	/wiki/Leonard_of_Noblac	found in Roman Martyrology	\N
883	Macarius of Egypt	\N	\N	\N	\N	\N	\N	\N	c. 300	391	\N	\N	\N	/wiki/Macarius_of_Egypt	found in Roman Martyrology	\N
919	Margaret the Virgin	\N	\N	\N	\N	\N	\N	\N	289	304	\N	\N	\N	/wiki/Margaret_the_Virgin	found in Roman Martyrology	\N
953	Martha of Persia	\N	\N	\N	\N	\N	\N	\N	200s	270	\N	\N	\N	/wiki/Marius,_Martha,_Audifax,_and_Abachum	found in Roman Martyrology	\N
1043	Nilus of Palestine	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Nilus_of_Palestine	found in Roman Martyrology	\N
1059	Oda	\N	\N	\N	\N	\N	\N	\N	c. 680	c. 726	\N	\N	\N	/wiki/Saint_Oda	\N	\N
1171	Phocas	\N	\N	\N	\N	\N	\N	\N	0's	102	\N	\N	\N	/wiki/Phocas,_Bishop_of_Sinope	found in Roman Martyrology	\N
1205	Pope Eleutherius	\N	\N	\N	\N	\N	\N	\N	100s	189	\N	\N	\N	/wiki/Pope_Eleutherius	found in Roman Martyrology	\N
1221	Pope Hyginus	\N	\N	\N	\N	\N	\N	\N	unknown	142	\N	\N	\N	/wiki/Pope_Hyginus	found in Roman Martyrology	\N
1255	Pope Soter	\N	\N	\N	\N	\N	\N	\N	unknown	c. 174	\N	\N	\N	/wiki/Pope_Soter	found in Roman Martyrology	\N
1270	Primus	\N	\N	\N	\N	\N	\N	\N	200s	c. 297	\N	\N	\N	/wiki/Primus_and_Felician	found in Roman Martyrology	\N
1284	Quadratus of Africa	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Quadratus_(martyr)#Quadratus_of_Africa	found in Roman Martyrology	\N
1302	Respicius	\N	\N	\N	\N	\N	\N	\N	unknown	c. 250	\N	\N	\N	/wiki/Tryphon,_Respicius,_and_Nympha	found in Roman Martyrology	\N
1356	Secundus of Asti	\N	\N	\N	\N	\N	\N	\N	0's	c. 119	\N	\N	\N	/wiki/Secundus_of_Asti	found in Roman Martyrology	\N
1373	Silvin of Auchy	\N	\N	\N	\N	\N	\N	\N	c. 650	15 February 717 or 718	\N	\N	\N	/wiki/Silvin_of_Auchy	found in Roman Martyrology	\N
1393	Stephen	\N	\N	\N	\N	\N	\N	\N	5 AD	34 AD	\N	\N	\N	/wiki/Stephen	found in Roman Martyrology	\N
1479	Ursicinus of Ravenna	\N	\N	\N	\N	\N	\N	\N	unknown	c. 67 AD	\N	\N	\N	/wiki/Ursicinus_of_Ravenna	found in Roman Martyrology	\N
1497	Victorinus of Pettau	\N	\N	\N	\N	\N	\N	\N	200s	303-304	\N	\N	\N	/wiki/Victorinus_of_Pettau	found in Roman Martyrology	\N
1512	Walpurga	\N	\N	\N	\N	\N	\N	\N	c. 710	25 February 777 or 779	\N	\N	\N	/wiki/Saint_Walpurga	\N	\N
1548	Zosimus	\N	\N	\N	\N	\N	\N	\N	93 AD	110	\N	\N	\N	/wiki/Zosimus_(martyr)	found in Roman Martyrology	\N
1133	Peter Claver	\N	\N	1580-06-26	1654-09-08	\N	\N	\N	\N	\N	1888-01-15	\N	\N	/wiki/Peter_Claver	\N	\N
1115	Pedro Calungsod	\N	\N	1654-07-21	1672-04-02	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Pedro_Calungsod	\N	\N
1096	Patiens	\N	\N	\N	0150-11-12	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Patiens	\N	\N
1080	Óscar Romero	\N	\N	1917-08-15	1980-03-24	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/%C3%93scar_Romero	\N	\N
1020	Narcisa de Jesús	\N	\N	1832-10-29	1869-12-08	\N	\N	\N	\N	\N	2008-10-12	\N	\N	/wiki/Narcisa_de_Jes%C3%BAs	\N	\N
1002	Michel Garicoïts	\N	\N	1797-04-15	1863-05-14	\N	\N	\N	\N	\N	1947-07-06	\N	\N	/wiki/Michel_Garico%C3%AFts	\N	\N
988	Mechtilde	\N	\N	\N	1298-11-19	\N	\N	\N	c.1241	\N	\N	\N	\N	/wiki/Mechtilde	\N	\N
970	Matiya Mulumba	\N	\N	\N	1886-05-30	\N	\N	t	1836	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Matiya_Mulumba	\N	\N
869	Luigi Maria Palazzolo	\N	\N	1827-12-10	1886-06-15	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Luigi_Maria_Palazzolo	\N	\N
851	Livinus	\N	\N	\N	0657-11-12	\N	\N	\N	c. 580	\N	\N	\N	\N	/wiki/Livinus	found in Roman Martyrology	\N
817	Ladislaus I of Hungary	\N	\N	\N	1095-07-29	\N	\N	\N	c. 1040	\N	1192-06-27	\N	\N	/wiki/Ladislaus_I_of_Hungary	\N	\N
798	Julie Billiart	\N	\N	1751-07-12	1816-04-08	\N	\N	\N	\N	\N	1969-06-22	\N	Founder of the Sisters of Notre Dame de Namur.	/wiki/Julie_Billiart	\N	\N
779	Juan de Ribera	\N	\N	1532-03-20	1611-01-06	\N	\N	\N	\N	\N	1960-06-12	\N	Archbishop of Valencia	/wiki/Juan_de_Ribera	\N	\N
760	Josemaría Escrivá	\N	\N	1902-01-09	1975-06-26	\N	\N	\N	\N	\N	2002-10-06	\N	\N	/wiki/Josemar%C3%ADa_Escriv%C3%A1	\N	\N
743	John Roberts	\N	\N	\N	1610-12-10	\N	\N	t	c. 1577	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Roberts_(martyr)	\N	\N
729	John of Dukla	\N	\N	\N	\N	\N	\N	\N	1414	1484	1997-06-10	\N	\N	/wiki/John_of_Dukla	\N	\N
695	Joan of France	\N	\N	1464-04-23	1505-02-04	\N	\N	\N	\N	\N	1950-05-28	\N	\N	/wiki/Joan_of_France,_Duchess_of_Berry	\N	\N
681	Jane Frances de Chantal	\N	\N	1572-01-28	1641-12-13	\N	\N	\N	\N	\N	1767-07-16	\N	\N	/wiki/Jane_Frances_de_Chantal	\N	\N
666	Jacinta Marto	\N	\N	1910-03-11	1920-02-20	\N	\N	\N	\N	\N	2017-05-13	\N	\N	/wiki/Francisco_and_Jacinta_Marto	\N	\N
649	Ildefonsus	\N	\N	\N	0667-01-23	\N	\N	\N	607	\N	\N	\N	\N	/wiki/Ildefonsus	\N	\N
630	Hubertus	\N	\N	\N	0727-05-30	\N	\N	\N	656–658	\N	\N	\N	\N	/wiki/Hubertus	\N	\N
416	Elizabeth Ann Seton	\N	\N	1774-08-28	1821-01-04	\N	\N	\N	\N	\N	1975-09-14	\N	First citizen born in the US to be declared a saint. Widow; Founder of the Daughters of Charity of Saint Vincent de Paul in the United States, the Sisters of Charity of Cincinnati, the Sisters of Charity of Seton Hill, the Sisters of Charity of Saint Vincent de Paul of Halifax, the Sisters of Charity of Saint Vincent de Paul of New York, and the Sisters of Charity of Saint Elizabeth of New Jersey	/wiki/Elizabeth_Ann_Seton	\N	\N
1534	Willibrord	\N	\N	\N	0739-11-07	\N	\N	\N	c. 658	\N	\N	\N	\N	/wiki/Willibrord	\N	\N
1453	Thomas Aquinas	\N	\N	\N	1274-03-07	\N	\N	\N	1225	\N	1323-07-18	\N	\N	/wiki/Thomas_Aquinas	\N	\N
1436	Theodosia of Tyre	\N	\N	\N	0307-04-02	\N	\N	\N	290	\N	\N	\N	\N	/wiki/Theodosia_of_Tyre	found in Roman Martyrology	\N
1424	Theobald of Provins	\N	\N	\N	1066-06-30	\N	\N	\N	1033	\N	\N	\N	\N	/wiki/Theobald_of_Provins	1073 by Pope Alexander II	\N
1410	Swithun Wells	\N	\N	\N	1591-12-10	\N	\N	t	c. 1536	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Swithun_Wells	\N	\N
1334	Sabás Reyes Salazar	\N	\N	1883-12-05	1927-04-13	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Sab%C3%A1s_Reyes_Salazar&action=edit&redlink=1	\N	\N
1321	Romaric	\N	\N	\N	\N	\N	\N	\N	unknown	653	1049-12-03	\N	\N	/wiki/Romaric	\N	\N
1239	Pope Mark	\N	\N	\N	0336-10-07	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Mark	found in Roman Martyrology	\N
1188	Pope Alexander I	\N	\N	1975-01-10	\N	\N	\N	\N	\N	c. 115	\N	\N	\N	/wiki/Pope_Alexander_I	found in Roman Martyrology	\N
1154	Peter of Verona	\N	\N	\N	1252-04-06	\N	\N	\N	1205	\N	1253-03-09	\N	\N	/wiki/Peter_of_Verona	\N	\N
932	Maria Crescentia Höss	\N	\N	1682-10-20	1744-04-05	\N	\N	\N	\N	\N	2001-11-25	\N	Professed religious of the Franciscan Nuns of the Third Order Regular	/wiki/Maria_Crescentia_H%C3%B6ss	\N	\N
898	María de las Maravillas de Jesús	\N	\N	1891-11-04	1974-12-11	\N	\N	\N	\N	\N	2003-05-04	\N	\N	/wiki/Mar%C3%ADa_de_las_Maravillas_de_Jes%C3%BAs	\N	\N
715	John Gualbert	\N	\N	\N	1073-07-12	\N	\N	\N	c. 985	\N	1193-10-24	\N	\N	/wiki/John_Gualbert	\N	\N
363	Damien of Molokai	\N	\N	1840-01-03	1889-04-15	\N	\N	\N	\N	\N	2009-10-11	\N	Known for his work with people with leprosy in a settlement on the Kalaupapa Peninsula of Molokaʻi.	/wiki/Father_Damien	\N	\N
336	Constantine the Great	\N	\N	\N	0337-05-22	\N	\N	\N	27 February c. 272	\N	\N	\N	Constantine is not recognized as a canonized saint by the Roman Catholic Church, although he is in many other churches.	/wiki/Constantine_the_Great	\N	\N
819	Lambert of Maastricht	\N	\N	\N	\N	\N	\N	\N	636	c. 705	\N	\N	\N	/wiki/Lambert_of_Maastricht	\N	\N
838	Leocadia	\N	\N	\N	\N	\N	\N	\N	200s	9 December c. 304	\N	\N	\N	/wiki/Leocadia	found in Roman Martyrology	\N
888	Magnus of Anagni	\N	\N	\N	\N	\N	\N	\N	unknown	100's	\N	\N	\N	/wiki/Magnus_of_Anagni	found in Roman Martyrology	\N
972	Matthias of Jerusalem	\N	\N	\N	\N	\N	\N	\N	0's	120	\N	\N	\N	/wiki/Matthias_of_Jerusalem	found in Roman Martyrology	\N
1009	Mildrith	\N	\N	\N	\N	\N	\N	\N	c. 660	c. 730	\N	\N	\N	/wiki/Mildrith	\N	\N
1026	Nereus	\N	\N	\N	\N	\N	\N	\N	0's	c. 100	\N	\N	\N	/wiki/Saints_Nereus_and_Achilleus	found in Roman Martyrology	\N
1097	Paternus of Auch	\N	\N	\N	\N	\N	\N	\N	unknown	150	\N	\N	\N	/wiki/Paternus_of_Auch	\N	\N
1113	Pausilippus	\N	\N	\N	\N	\N	\N	\N	unknown	130	\N	\N	\N	/wiki/Theodore_and_Pausilippus	found in Roman Martyrology	\N
1166	Philo	\N	\N	\N	\N	\N	\N	\N	unknown	150	\N	\N	\N	/wiki/Philo_and_Agathopodes	found in Roman Martyrology	\N
1201	Pope Cornelius	\N	\N	\N	\N	\N	\N	\N	unknown	June 253	\N	\N	\N	/wiki/Pope_Cornelius	found in Roman Martyrology	\N
1277	Publius	\N	\N	\N	\N	\N	\N	\N	33 AD	c. 125	\N	\N	\N	/wiki/Saint_Publius	found in Roman Martyrology	\N
1331	Rufina	\N	\N	\N	\N	\N	\N	\N	200s	257	\N	\N	\N	/wiki/Rufina_and_Secunda	found in Roman Martyrology	\N
1347	Savina of Milan	\N	\N	\N	\N	\N	\N	\N	200s	311	\N	\N	\N	/wiki/Savina_of_Milan	found in Roman Martyrology	\N
1383	Simon the Zealot	\N	\N	\N	\N	\N	\N	\N	unknown	c. 65 or 107	\N	\N	\N	/wiki/Simon_the_Zealot	found in Roman Martyrology	\N
1472	Torpes of Pisa	\N	\N	\N	\N	\N	\N	\N	unknown	c. 65 AD	\N	\N	\N	/wiki/Torpes_of_Pisa	found in Roman Martyrology	\N
1522	Wilgils	\N	\N	\N	\N	\N	\N	\N	c. 630	600s	\N	\N	\N	/wiki/Wilgils	\N	\N
1456	Thomas Garnet	\N	\N	\N	1608-06-23	\N	\N	t	c. 1575	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Thomas_Garnet	\N	\N
1362	Servatius of Tongeren	\N	\N	\N	0384-05-13	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Servatius_of_Tongeren	found in Roman Martyrology	\N
1315	Roderick	\N	\N	\N	0837-03-13	\N	\N	\N	700s	\N	\N	\N	\N	/wiki/Saint_Roderick	\N	\N
1234	Pope Martin I	\N	\N	0598-06-21	0655-09-16	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Pope_Martin_I	found in Roman Martyrology	\N
1222	Pope Hilarius	\N	\N	\N	0468-02-29	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Hilarius	found in Roman Martyrology	\N
1184	Pope Agapetus I	\N	\N	\N	0536-04-22	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Agapetus_I	found in Roman Martyrology	\N
1148	Peter of Narbonne	\N	\N	\N	1391-11-14	\N	\N	\N	1300s	\N	1970-06-21	\N	Companion of Nicholas Tavelic	/w/index.php?title=Peter_of_Narbonne_(saint)&action=edit&redlink=1	\N	\N
1128	Peter Chanel	\N	\N	1803-07-12	1841-04-28	\N	\N	t	\N	\N	1954-06-12	\N	professed priest of the Society of Mary, Marist Missionaries; martyr	/wiki/Peter_Chanel	\N	\N
1078	Pachomius the Great	\N	\N	\N	0348-05-09	\N	\N	\N	292	\N	\N	\N	\N	/wiki/Pachomius_the_Great	found in Roman Martyrology	\N
1063	Odilo of Cluny	\N	\N	\N	1049-01-01	\N	\N	\N	c. 962	\N	\N	\N	\N	/wiki/Odilo_of_Cluny	found in Roman Martyrology	\N
1045	Nicola Saggio	\N	\N	1650-01-06	1709-02-03	\N	\N	\N	\N	\N	2014-11-23	\N	professed Oblate of the Minims	/wiki/Nicola_Saggio	\N	\N
991	Melchior Grodziecki	\N	\N	\N	1619-09-07	\N	\N	\N	c. 1582	\N	1995-07-02	\N	\N	/wiki/Melchior_Grodziecki	\N	\N
957	Martin of the Ascension	\N	\N	\N	1597-02-05	\N	\N	t	c. 1567	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Martin_of_the_Ascension&action=edit&redlink=1	\N	\N
939	Marie-Alphonsine Danil Ghattas	\N	\N	1843-10-04	1927-03-25	\N	\N	\N	\N	\N	2015-05-17	\N	\N	/wiki/Marie-Alphonsine_Danil_Ghattas	\N	\N
922	María de la Purísima Salvat Romero	\N	\N	1926-02-20	1998-10-31	\N	\N	\N	\N	\N	2015-10-18	\N	\N	/wiki/Mar%C3%ADa_de_la_Pur%C3%ADsima_Salvat_Romero	\N	\N
905	Margaret Clitherow	\N	\N	\N	1586-03-25	\N	\N	t	1556	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Margaret_Clitherow	\N	\N
872	Luigi Scrosoppi	\N	\N	1804-08-04	1884-04-03	\N	\N	\N	\N	\N	2001-06-10	\N	\N	/wiki/Luigi_Scrosoppi	\N	\N
855	Louis de Montfort	\N	\N	1673-01-31	1716-04-28	\N	\N	\N	\N	\N	1947-07-20	\N	priest of the Archdiocese of Rennes; founder of the Company of Mary (Montfort Missionaries), the Daughters of Wisdom, and the Brothers of Saint Gabriel	/wiki/Louis_de_Montfort	\N	\N
801	Junípero Serra	\N	\N	1713-11-24	1784-08-28	\N	\N	\N	\N	\N	2015-09-23	\N	professed priest of the Franciscan Friars Minor	/wiki/Jun%C3%ADpero_Serra	\N	\N
783	Józef Sebastian Pelczar	\N	\N	1842-01-17	1924-03-28	\N	\N	\N	\N	\N	2003-05-18	\N	\N	/wiki/J%C3%B3zef_Sebastian_Pelczar	\N	\N
768	Joseph Mukasa Balikuddembe	\N	\N	\N	1885-11-15	\N	\N	t	1860	\N	1964-10-18	\N	One of the Uganda Martyrs	/wiki/Joseph_Mukasa_Balikuddembe	\N	\N
751	Jón Ögmundsson	\N	\N	\N	1121-04-23	\N	\N	\N	1052	\N	\N	\N	\N	/wiki/J%C3%B3n_%C3%96gmundsson	1201 by Pope Innocent III	\N
732	John of Matha	\N	\N	1160-06-23	1213-12-17	\N	\N	\N	\N	\N	1666-10-21	\N	\N	/wiki/John_of_Matha	\N	\N
717	John Jones	\N	\N	\N	1598-07-12	\N	\N	t	1559	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Jones_(martyr)	\N	\N
701	Joaquina Vedruna de Mas	\N	\N	1783-04-16	1854-08-28	\N	\N	\N	\N	\N	1959-04-12	\N	\N	/wiki/Joaquina_Vedruna_de_Mas	\N	\N
685	Jean-Baptiste de La Salle	\N	\N	1651-04-30	1719-04-07	\N	\N	\N	\N	\N	1900-05-24	\N	\N	/wiki/Jean-Baptiste_de_La_Salle	\N	\N
651	Íñigo of Oña	\N	\N	\N	1057-06-01	\N	\N	\N	unknown	\N	1259-06-18	\N	\N	/wiki/%C3%8D%C3%B1igo_of_O%C3%B1a	\N	\N
635	Hugh of Cluny	\N	\N	\N	1109-04-28	\N	\N	\N	1024	\N	1120-01-06	\N	\N	/wiki/Hugh_of_Cluny	\N	\N
573	Giuseppe Benedetto Cottolengo	\N	\N	1786-05-03	1842-04-30	\N	\N	\N	\N	\N	1934-03-19	\N	Founder of the little House of Divine Providence. Priest of the Archdiocese of Turin; founder of the Sisters of Saint Joseph Benedict Cottolengo, the Brothers of Saint Joseph Benedict Cottolengo and the Society of Priests of Saint Joseph Benedict Cottolengo	/wiki/Giuseppe_Benedetto_Cottolengo	\N	\N
1540	Wulfram of Sens	\N	\N	\N	0703-03-20	\N	\N	\N	c. 640	\N	\N	\N	\N	/wiki/Wulfram_of_Sens	\N	\N
1504	Vincent Shiwozuka	\N	\N	\N	1637-09-29	\N	\N	t	c.1576	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Vincent_Shiwozuka&action=edit&redlink=1	\N	\N
1491	Veronica Giuliani	\N	\N	1660-12-27	1727-07-09	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Veronica_Giuliani	26 May 1839 by Pope Gregory XVI	\N
1439	Theodoret of Antioch	\N	\N	\N	0362-10-22	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Theodoret_(martyr)	found in Roman Martyrology	\N
1417	Teresa of Ávila	\N	\N	1515-03-28	1582-10-04	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Teresa_of_%C3%81vila	12 March 1622 by Pope Gregory XV	\N
1400	Stephen Pongracz	\N	\N	\N	1619-09-07	\N	\N	\N	c. 1583	\N	1995-07-02	\N	\N	/wiki/Stephen_Pongracz	\N	\N
1293	Ralph Sherwin	\N	\N	1550-10-25	1581-12-01	\N	\N	t	\N	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Ralph_Sherwin	\N	\N
1262	Pope Zephyrinus	\N	\N	\N	0217-12-20	\N	\N	\N	100s	\N	\N	\N	\N	/wiki/Pope_Zephyrinus	found in Roman Martyrology	\N
1248	Pope Simplicius	\N	\N	\N	0483-03-10	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_Simplicius	found in Roman Martyrology	\N
672	Jacques Berthieu	\N	\N	1838-11-27	1896-06-08	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Jacques_Berthieu	\N	\N
653	Irene of Tomar	\N	\N	\N	\N	\N	\N	\N	c. 635	c. 653	\N	\N	\N	/wiki/Irene_of_Tomar	\N	\N
788	Julia of Corsica	\N	\N	\N	\N	\N	\N	\N	unknown	c. 439	\N	\N	\N	/wiki/Julia_of_Corsica	\N	\N
822	Laurentia	\N	\N	\N	\N	\N	\N	\N	200s	302	\N	\N	\N	/wiki/Palatias_and_Laurentia	found in Roman Martyrology	\N
890	Magnus of Fossombrone	\N	\N	\N	\N	\N	\N	\N	unknown	200s	\N	\N	\N	/w/index.php?title=Magnus_of_Fossombrone&action=edit&redlink=1	found in Roman Martyrology	\N
906	Marciana of Mauretania	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Marciana_of_Mauretania	found in Roman Martyrology	\N
977	Mary Magdalene	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Mary_Magdalene	found in Roman Martyrology	\N
1017	Nabor of Milan	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Nabor_and_Felix	found in Roman Martyrology	\N
1069	Onesimus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 68 AD	\N	\N	\N	/wiki/Onesimus	found in Roman Martyrology	\N
1100	Paul of Thebes	\N	\N	\N	\N	\N	\N	\N	c. 227	c. 342	\N	\N	\N	/wiki/Paul_of_Thebes	\N	\N
1167	Phocas the Gardener	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Saint_Phocas	\N	\N
1235	Pope Marcellinus	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Pope_Marcellinus	found in Roman Martyrology	\N
1263	Possidius	\N	\N	\N	\N	\N	\N	\N	300s	400s	\N	\N	\N	/wiki/Possidius	found in Roman Martyrology	\N
1280	Pudens	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Saint_Pudens	found in Roman Martyrology	\N
1296	Relindis of Maaseik	\N	\N	\N	\N	\N	\N	\N	unknown	750	\N	\N	\N	/wiki/Relindis_of_Maaseik	\N	\N
1340	Salonius	\N	\N	\N	\N	\N	\N	\N	400	400s	\N	\N	\N	/wiki/Salonius	\N	\N
1358	Serapion of Macedonia	\N	\N	\N	\N	\N	\N	\N	100s	195	\N	\N	\N	/wiki/Serapion_of_Macedonia	found in Roman Martyrology	\N
1376	Silas	\N	\N	\N	\N	\N	\N	\N	0's	65–100	\N	\N	\N	/wiki/Silas	found in Roman Martyrology	\N
1408	Taurinus	\N	\N	\N	\N	\N	\N	\N	300s	c. 410	\N	\N	\N	/wiki/Saint_Taurinus	found in Roman Martyrology	\N
1426	Thecla of Kitzingen	\N	\N	\N	\N	\N	\N	\N	700s	c. 790 AD	\N	\N	\N	/wiki/Thecla_of_Kitzingen	found in Roman Martyrology	\N
1444	Theodotus of Ancyra	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Theodotus_of_Ancyra_(martyr)	found in Roman Martyrology	\N
1463	Thraseas	\N	\N	\N	\N	\N	\N	\N	unknown	170	\N	\N	bishop of Eumania	/wiki/Thraseas	found in Roman Martyrology	\N
1476	Ubaldesca Taccini	\N	\N	\N	\N	\N	\N	\N	1136	1205	\N	\N	\N	/wiki/Saint_Ubaldesca_Taccini	\N	\N
1492	Viator of Bergamo	\N	\N	\N	\N	\N	\N	\N	unknown	370	\N	\N	\N	/wiki/Viator_of_Bergamo	\N	\N
1513	Vitus	\N	\N	\N	\N	\N	\N	\N	c. 290	c. 303	\N	\N	\N	/wiki/Saint_Vitus	found in Roman Martyrology	\N
1527	William of Breteuil	\N	\N	\N	\N	\N	\N	\N	1000s	1130	\N	\N	\N	/wiki/William_of_Breteuil	\N	\N
1325	Rosa Francisca Dolors Molas Vallvé	\N	\N	1854-11-07	1910-02-09	\N	\N	\N	\N	\N	1988-12-11	\N	\N	/wiki/Rosa_Francisca_Dolors_Molas_Vallv%C3%A9	\N	\N
1199	Pope Caius	\N	\N	\N	0296-04-22	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Caius	found in Roman Martyrology	\N
1085	Pamphilus of Caesarea	\N	\N	\N	0309-02-16	\N	\N	\N	late 200s	\N	\N	\N	\N	/wiki/Pamphilus_of_Caesarea	\N	\N
1051	Norbert of Xanten	\N	\N	\N	1134-06-06	\N	\N	\N	c. 1075	\N	\N	\N	\N	/wiki/Norbert_of_Xanten	1582 by Pope Gregory XIII	\N
1037	Nicholas of Tolentino	\N	\N	\N	1305-09-10	\N	\N	\N	c. 1246	\N	1446-06-05	\N	\N	/wiki/Nicholas_of_Tolentino	\N	\N
1000	Michael Kurobioye	\N	\N	\N	1633-08-17	\N	\N	t	1500s or 1600s	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Michael_Kurobioye&action=edit&redlink=1	\N	\N
989	Meinhard	\N	\N	\N	\N	\N	\N	\N	1334 or 1336	1196	1993-09-08	\N	professed priest of the Canons Regular of Saint Augustine, Bishop of Latvia	/wiki/Saint_Meinhard	\N	\N
940	Marie-Madeleine Postel	\N	\N	1756-11-28	1846-07-16	\N	\N	\N	\N	\N	1925-05-24	\N	founder of the Sisters of the Christian Schools of Saint Julie Postel	/wiki/Marie-Madeleine_Postel	\N	\N
956	Maria Katharina Kasper	\N	\N	1820-05-26	1898-02-02	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Maria_Katharina_Kasper	\N	\N
923	Maria De Mattias	\N	\N	1805-02-04	1866-08-20	\N	\N	\N	\N	\N	2003-05-18	\N	\N	/wiki/Maria_De_Mattias	\N	\N
873	Luis Batis Sáinz	\N	\N	1870-09-13	1926-08-15	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Luis_Batis_S%C3%A1inz&action=edit&redlink=1	\N	\N
856	Louis IX of France	\N	\N	1214-04-25	1270-08-25	\N	\N	\N	\N	\N	1297-07-11	\N	\N	/wiki/Louis_IX_of_France	\N	\N
839	Leopold Mandić	\N	\N	1866-05-12	1942-07-30	\N	\N	\N	\N	\N	1983-10-16	\N	\N	/wiki/Leopold_Mandi%C4%87	\N	\N
771	Joseph of Leonessa	\N	\N	\N	1612-02-04	\N	\N	\N	1556	\N	1746-06-29	\N	\N	/wiki/Joseph_of_Leonessa	\N	\N
753	John Wall	\N	\N	\N	1679-08-22	\N	\N	t	1620	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Wall_(priest_and_martyr)	\N	\N
736	John of Sahagún	\N	\N	1419-06-24	1479-06-11	\N	\N	\N	\N	\N	1690-10-16	\N	\N	/wiki/John_of_Sahag%C3%BAn	\N	\N
721	John Kisaka	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=John_Kisaka&action=edit&redlink=1	\N	\N
704	John Chrysostom	\N	\N	\N	0407-09-14	\N	\N	\N	c. 349	\N	\N	\N	\N	/wiki/John_Chrysostom	found in Roman Martyrology	\N
687	Jean de Lalande	\N	\N	\N	1646-10-19	\N	\N	t	unknown	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Jean_de_Lalande	\N	\N
670	Jacobo Kyushei Tomonaga	\N	\N	\N	1633-08-17	\N	\N	t	c.1582	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Jacobo_Kyushei_Tomonaga	\N	\N
636	Humility	\N	\N	\N	1310-05-22	\N	\N	\N	c. 1226	\N	1720-01-27	\N	\N	/wiki/Saint_Humility	\N	\N
1545	Zita	\N	\N	\N	1272-04-27	\N	\N	\N	c. 1212	\N	1696-09-05	\N	\N	/wiki/Zita	\N	\N
1392	Stanislaus Papczyński	\N	\N	1631-05-18	1701-09-17	\N	\N	\N	\N	\N	2016-06-05	\N	professed priest and founder of the Marians of the Immaculate Conception	/wiki/Stanislaus_Papczy%C5%84ski	\N	\N
1307	Robert Bellarmine	\N	\N	1542-10-04	1621-09-17	\N	\N	\N	\N	\N	1930-06-29	\N	Doctor of the church	/wiki/Robert_Bellarmine	\N	\N
1250	Pope Siricius	\N	\N	\N	0399-11-26	\N	\N	\N	334	\N	\N	\N	\N	/wiki/Pope_Siricius	found in Roman Martyrology	\N
1219	Pope Gregory II	\N	\N	\N	0731-02-11	\N	\N	\N	669	\N	\N	\N	\N	/wiki/Pope_Gregory_II	found in Roman Martyrology	\N
1183	Pope Adeodatus I	\N	\N	\N	0618-11-08	\N	\N	\N	570	\N	\N	\N	\N	/wiki/Pope_Adeodatus_I	found in Roman Martyrology	\N
1152	Petronax of Monte Cassino	\N	\N	0670-05-01	0747-05-06	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Petronax_of_Monte_Cassino	\N	\N
1135	Peter de Regalado	\N	\N	\N	1456-03-30	\N	\N	\N	1390	\N	1746-06-29	\N	\N	/wiki/Peter_de_Regalado	\N	\N
1118	Pedro Poveda Castroverde	\N	\N	1874-12-03	1936-07-28	\N	\N	\N	\N	\N	2003-05-04	\N	\N	/wiki/Pedro_Poveda_Castroverde	\N	\N
805	Justino Orona Madrigal	\N	\N	1877-04-14	1928-07-01	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Justino_Orona_Madrigal	\N	\N
864	Lucy	\N	\N	\N	\N	\N	\N	\N	c. 283	304	\N	\N	\N	/wiki/Saint_Lucy	found in Roman Martyrology	\N
948	Marinus	\N	\N	\N	\N	\N	\N	\N	200s	366	\N	\N	\N	/wiki/Saint_Marinus	found in Roman Martyrology	\N
983	Maximus of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	c. 260	\N	\N	\N	/wiki/Tiburtius,_Valerian,_and_Maximus	found in Roman Martyrology	\N
1001	Mercurialis of Forlì	\N	\N	\N	\N	\N	\N	\N	300s	406	\N	\N	\N	/wiki/Mercurialis_of_Forl%C3%AC	found in Roman Martyrology	\N
1049	Nino	\N	\N	\N	\N	\N	\N	\N	c. 280	c. 332	\N	\N	\N	/wiki/Saint_Nino	\N	\N
1065	Olga of Kiev	\N	\N	\N	\N	\N	\N	\N	890-925	969	\N	\N	Also known as Elena	/wiki/Olga_of_Kiev	\N	\N
1081	Pacian	\N	\N	\N	\N	\N	\N	\N	c. 310	c. 391	\N	\N	\N	/wiki/Pacian	found in Roman Martyrology	\N
1098	Patrick	\N	\N	\N	\N	\N	\N	\N	unknown	400s	\N	\N	\N	/wiki/Saint_Patrick	found in Roman Martyrology	\N
1146	Peter of Canterbury	\N	\N	\N	\N	\N	\N	\N	500s	c. 607	\N	\N	\N	/wiki/Peter_of_Canterbury	1915 (cultus confirmed) by Pope Benedict XV	\N
1180	Podius of Florence	\N	\N	\N	\N	\N	\N	\N	900s	1002	\N	\N	Bishop of Florence	/w/index.php?title=Podius_of_Florence&action=edit&redlink=1	found in Roman Martyrology	\N
1285	Quirinus of Sescia	\N	\N	\N	\N	\N	\N	\N	200s	309	\N	\N	\N	/wiki/Quirinus_of_Sescia	\N	\N
1316	Romanus of Caesarea	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Romanus_of_Caesarea	found in Roman Martyrology	\N
1366	Severus of Barcelona	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Severus_of_Barcelona	found in Roman Martyrology	\N
1414	Symphorosa	\N	\N	\N	\N	\N	\N	\N	unknown	c. 138	\N	\N	\N	/wiki/Symphorosa	found in Roman Martyrology	\N
1478	Ursmar	\N	\N	\N	\N	\N	\N	\N	600s	713	\N	\N	\N	/wiki/Ursmar	found in Roman Martyrology	\N
1496	Victoria of Albitina	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Victoria_of_Albitina	\N	\N
1537	Wolfhelm of Brauweiler	\N	\N	\N	\N	\N	\N	\N	1000s	1091	\N	\N	professed priest of the Benedictines	/wiki/Wolfhelm_of_Brauweiler	\N	\N
1332	Rupert of Salzburg	\N	\N	\N	0710-03-27	\N	\N	\N	c. 660	\N	\N	\N	\N	/wiki/Rupert_of_Salzburg	found in Roman Martyrology	\N
1301	Richard Gwyn	\N	\N	\N	1584-10-15	\N	\N	t	c. 1537	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Richard_Gwyn	\N	\N
1264	Pope Zosimus	\N	\N	\N	0418-12-26	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Pope_Zosimus	found in Roman Martyrology	\N
1196	Pope Celestine I	\N	\N	\N	0432-08-01	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Pope_Celestine_I	found in Roman Martyrology	\N
1160	Philip Neri	\N	\N	1515-07-21	1595-05-25	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Philip_Neri	12 March 1622 by Pope Gregory XV	\N
1130	Peter Canisius	\N	\N	1521-05-08	1597-12-21	\N	\N	\N	\N	\N	1925-05-21	\N	\N	/wiki/Peter_Canisius	\N	\N
1112	Pedro Armengol	\N	\N	\N	1304-04-27	\N	\N	\N	c. 1238	\N	1687-04-08	\N	\N	/wiki/Pedro_Armengol	\N	\N
963	Mary Euphrasia Pelletier	\N	\N	1796-07-31	1868-04-24	\N	\N	\N	\N	\N	1940-05-02	\N	\N	/wiki/Mary_Euphrasia_Pelletier	\N	\N
928	María Josefa Sancho de Guerra	\N	\N	1842-09-07	1912-03-20	\N	\N	\N	\N	\N	2000-10-01	\N	\N	/wiki/Mar%C3%ADa_Josefa_Sancho_de_Guerra	\N	\N
916	Maria Bertilla Boscardin	\N	\N	1888-10-06	1922-10-20	\N	\N	\N	\N	\N	1961-05-11	\N	\N	/wiki/Maria_Bertilla_Boscardin	\N	\N
899	Manuel Moralez	\N	\N	1898-02-08	1926-08-15	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Manuel_Moralez	\N	\N
878	Lutgardis	\N	\N	\N	1246-06-16	\N	\N	\N	1182	\N	\N	\N	\N	/wiki/Lutgardis	found in Roman Martyrology	\N
847	Lorcán Ua Tuathail	\N	\N	\N	1180-11-14	\N	\N	\N	1128	\N	\N	\N	\N	/wiki/Lorc%C3%A1n_Ua_Tuathail	11 December 1225 by Pope Honorius III	\N
832	Leoba	\N	\N	\N	0782-09-28	\N	\N	\N	c. 710	\N	\N	\N	\N	/wiki/Leoba	found in Roman Martyrology	\N
814	Kuriakose Elias Chavara	\N	\N	1805-02-05	1871-01-03	\N	\N	\N	\N	\N	2014-11-23	\N	\N	/wiki/Kuriakose_Elias_Chavara	\N	\N
799	Julio Álvarez Mendoza	\N	\N	1866-12-20	1927-03-30	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Julio_%C3%81lvarez_Mendoza&action=edit&redlink=1	\N	\N
778	Josephine Bakhita	\N	\N	\N	1947-02-08	\N	\N	\N	c. 1869	\N	2000-10-01	\N	\N	/wiki/Josephine_Bakhita	\N	\N
757	José María Robles Hurtado	\N	\N	1888-05-03	1927-06-26	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Jos%C3%A9_Mar%C3%ADa_Robles_Hurtado	\N	\N
741	John Payne	\N	\N	\N	1582-04-02	\N	\N	t	1532	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Payne_(martyr)	\N	\N
723	John Macias	\N	\N	1585-03-02	1645-09-16	\N	\N	\N	\N	\N	1975-09-28	\N	professed religious of the Dominicans	/wiki/John_Macias	\N	\N
708	John Buonagiunta Monetti	\N	\N	\N	\N	\N	\N	\N	1200s	1256	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/w/index.php?title=John_Buonagiunta_Monetti&action=edit&redlink=1	\N	\N
689	Jeanne Delanoue	\N	\N	1666-06-18	1736-08-17	\N	\N	\N	\N	\N	1982-10-31	\N	founder of the Servants of the Poor	/wiki/Jeanne_Delanoue	\N	\N
669	Jadwiga of Poland	\N	\N	\N	1399-07-17	\N	\N	\N	3 October 1373 - 18 February 1374	\N	1997-06-08	\N	\N	/wiki/Jadwiga_of_Poland	\N	\N
654	Isaac Jogues	\N	\N	1607-01-10	1646-10-18	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Isaac_Jogues	\N	\N
638	Hyacinth of Poland	\N	\N	\N	1257-08-15	\N	\N	\N	c. 1185	\N	1594-04-17	\N	\N	/wiki/Hyacinth_of_Poland	\N	\N
1520	Wihtburh	\N	\N	\N	0743-03-17	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Wihtburh	\N	\N
1511	Vladimir the Great	\N	\N	\N	1015-07-15	\N	\N	\N	c. 958	\N	\N	\N	Grand Prince of Kiev	/wiki/Vladimir_the_Great	\N	\N
1457	Thomas of Villanova	\N	\N	\N	1555-09-08	\N	\N	\N	1488	\N	1658-11-01	\N	\N	/wiki/Thomas_of_Villanova	\N	\N
1446	Theophilus of Corte	\N	\N	1676-10-30	1740-06-17	\N	\N	\N	\N	\N	1930-06-29	\N	\N	/wiki/Saint_Theophilus_of_Corte	\N	\N
1431	Théodore Guérin	\N	\N	1798-10-02	1856-05-14	\N	\N	\N	\N	\N	2006-10-15	\N	\N	/wiki/Th%C3%A9odore_Gu%C3%A9rin	\N	\N
1397	Stephen of Perm	\N	\N	\N	1396-04-26	\N	\N	\N	1340	\N	\N	\N	Russian Orthodox saint	/wiki/Stephen_of_Perm	found in Roman Martyrology	\N
1382	Simpert	\N	\N	\N	0807-10-13	\N	\N	\N	700s	\N	\N	\N	\N	/wiki/Simpert	\N	\N
1350	Sebaldus	\N	\N	\N	\N	\N	\N	\N	700s	c. 770	1425-03-26	\N	\N	/wiki/Sebaldus	\N	\N
1249	Pope Sergius I	\N	\N	\N	0701-09-08	\N	\N	\N	650	\N	\N	\N	\N	/wiki/Pope_Sergius_I	found in Roman Martyrology	\N
1226	Pope John Paul II	\N	\N	1920-05-18	2005-04-02	\N	\N	\N	\N	\N	2014-04-27	\N	\N	/wiki/Pope_John_Paul_II	\N	\N
1032	Nicholas of Myra	\N	\N	0270-03-15	0342-12-06	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Saint_Nicholas	found in Roman Martyrology	\N
1015	Mutien-Marie Wiaux	\N	\N	1841-03-20	1917-01-30	\N	\N	\N	\N	\N	1989-12-10	\N	\N	/wiki/Mutien-Marie_Wiaux	\N	\N
1210	Pope Fabian	\N	\N	\N	0250-01-20	\N	\N	\N	c. 200	\N	\N	\N	\N	/wiki/Pope_Fabian	found in Roman Martyrology	\N
639	Hyacinth of Rome	\N	\N	\N	\N	\N	\N	\N	200s	c. 257-259	\N	\N	\N	/wiki/Protus_and_Hyacinth	found in Roman Martyrology	\N
786	Judas Cyriacus	\N	\N	\N	\N	\N	\N	\N	0's	133	\N	\N	\N	/wiki/Judas_Cyriacus	found in Roman Martyrology	\N
802	Justin Martyr	\N	\N	\N	\N	\N	\N	\N	100	165	\N	\N	\N	/wiki/Justin_Martyr	found in Roman Martyrology	\N
818	Lambert of Saragossa	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/w/index.php?title=Lambert_of_Saragossa&action=edit&redlink=1	found in Roman Martyrology	\N
900	Malchus of Syria	\N	\N	\N	\N	\N	\N	\N	300s	c. 390	\N	\N	\N	/wiki/Malchus_of_Syria	found in Roman Martyrology	\N
946	Marius	\N	\N	\N	\N	\N	\N	\N	200s	270	\N	\N	\N	/wiki/Marius,_Martha,_Audifax,_and_Abachum	found in Roman Martyrology	\N
979	Maurice	\N	\N	\N	\N	\N	\N	\N	200s	287	\N	\N	\N	/wiki/Saint_Maurice	found in Roman Martyrology	\N
997	Methodius of Olympus	\N	\N	\N	\N	\N	\N	\N	200s	c. 311	\N	\N	\N	/wiki/Methodius_of_Olympus	\N	\N
1030	Nicasius of Die	\N	\N	\N	\N	\N	\N	\N	200s	300s	\N	\N	\N	/wiki/Nicasius_of_Die	\N	\N
1061	Odilia of Cologne	\N	\N	\N	\N	\N	\N	\N	300s	300s	\N	\N	\N	/wiki/Odilia_of_Cologne	found in Roman Martyrology	\N
1077	Othmar	\N	\N	\N	\N	\N	\N	\N	c. 689	c. 759	\N	\N	\N	/wiki/Saint_Othmar	\N	\N
1094	Onuphrius	\N	\N	\N	\N	\N	\N	\N	unknown	300s or 400s	\N	\N	\N	/wiki/Onuphrius	found in Roman Martyrology	\N
1111	Paulinus of Antioch	\N	\N	\N	\N	\N	\N	\N	unknown	67 AD	\N	\N	\N	/wiki/Paulinus_of_Antioch	found in Roman Martyrology	\N
1127	Peter Balsam	\N	\N	\N	\N	\N	\N	\N	200s	311	\N	\N	crucified at Aulane during the Maximinian persecution	/w/index.php?title=Peter_Balsam&action=edit&redlink=1	found in Roman Martyrology	\N
1197	Pope Callixtus I	\N	\N	\N	\N	\N	\N	\N	100s	222	\N	\N	\N	/wiki/Pope_Callixtus_I	found in Roman Martyrology	\N
1253	Pope Sixtus I	\N	\N	\N	\N	\N	\N	\N	42 AD	125	\N	\N	\N	/wiki/Pope_Sixtus_I	found in Roman Martyrology	\N
1274	Processus	\N	\N	\N	\N	\N	\N	\N	c. 30 AD	c. 67 AD	\N	\N	\N	/wiki/Martinian_and_Processus	found in Roman Martyrology	\N
1294	Rais	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Saint_Rais	\N	\N
1346	Satyrus of Milan	\N	\N	\N	\N	\N	\N	\N	c. 331	378	\N	\N	\N	/wiki/Satyrus_of_Milan	found in Roman Martyrology	\N
1364	Servandus	\N	\N	\N	\N	\N	\N	\N	200s	c. 305	\N	\N	\N	/wiki/Servandus_and_Cermanus	found in Roman Martyrology	\N
1433	Theodore of Pavia	\N	\N	\N	\N	\N	\N	\N	unknown	778	\N	\N	\N	/wiki/Theodore_of_Pavia	found in Roman Martyrology	\N
1465	Tola of Clonard	\N	\N	\N	\N	\N	\N	\N	600s	700s	\N	\N	\N	/wiki/Tola_of_Clonard	\N	\N
1499	Viktor of Xanten	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Viktor_of_Xanten	found in Roman Martyrology	\N
1516	Wendelin of Trier	\N	\N	\N	\N	\N	\N	\N	c. 554	c. 617	\N	\N	\N	/wiki/Wendelin_of_Trier	\N	\N
1535	Willibald	\N	\N	\N	\N	\N	\N	\N	c. 700	c. 787	\N	\N	\N	/wiki/Willibald	\N	\N
1217	Pope Gregory VII	\N	\N	\N	1085-05-25	\N	\N	\N	1015	\N	1728-05-24	\N	\N	/wiki/Pope_Gregory_VII	\N	\N
1178	Pompilio Maria Pirrotti	\N	\N	1710-09-29	1766-07-15	\N	\N	\N	\N	\N	1934-03-19	\N	professed priest of the Piarists	/wiki/Pompilio_Maria_Pirrotti	\N	\N
1013	Mukasa Kiriwawanvu	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Mukasa_Kiriwawanvu&action=edit&redlink=1	\N	\N
962	Martin of Tours	\N	\N	\N	0397-11-08	\N	\N	\N	316 or 336	\N	\N	\N	\N	/wiki/Martin_of_Tours	found in Roman Martyrology	\N
937	Marianne Cope	\N	\N	1838-01-23	1918-08-09	\N	\N	\N	\N	\N	2012-10-21	\N	\N	/wiki/Marianne_Cope	\N	\N
911	Margaret of Scotland	\N	\N	\N	1093-11-16	\N	\N	\N	c. 1045	\N	\N	\N	married layperson and queen of Scotland	/wiki/Saint_Margaret_of_Scotland	1250 by Pope Innocent IV	\N
886	Magdalene of Canossa	\N	\N	1774-03-01	1835-04-10	\N	\N	\N	\N	\N	1988-10-02	\N	Founder of the Canossian Daughters of Charity and the Canossian Sons of Charity	/wiki/Magdalene_of_Canossa	\N	\N
868	Ludovico of Casoria	\N	\N	1814-03-11	1885-03-30	\N	\N	\N	\N	\N	2014-11-23	\N	\N	/wiki/Ludovico_of_Casoria	\N	\N
848	Lodovico Pavoni	\N	\N	1784-09-11	1849-04-01	\N	\N	\N	\N	\N	2016-10-16	\N	priest and founder of the Sons of Mary Immaculate (Pavonians)	/wiki/Lodovico_Pavoni	\N	\N
835	Leonard van Veghel	\N	\N	\N	1572-07-09	\N	\N	t	1527	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=Leonard_van_Veghel&action=edit&redlink=1	\N	\N
769	Joseph of Cupertino	\N	\N	1603-06-17	1663-09-18	\N	\N	\N	\N	\N	1767-07-16	\N	\N	/wiki/Joseph_of_Cupertino	\N	\N
752	Jose Gabriel del Rosario Brochero	\N	\N	1840-03-16	1914-01-26	\N	\N	\N	\N	\N	2016-10-16	\N	\N	/wiki/Jose_Gabriel_del_Rosario_Brochero	\N	\N
735	John of Nepomuk	\N	\N	\N	1393-03-20	\N	\N	\N	c. 1345	\N	1729-03-19	\N	\N	/wiki/John_of_Nepomuk	\N	\N
719	John Kemble	\N	\N	\N	1679-08-22	\N	\N	t	1599	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Kemble_(martyr)	\N	\N
703	John Bosco	\N	\N	1815-08-16	1888-01-31	\N	\N	\N	\N	\N	1934-04-01	\N	\N	/wiki/John_Bosco	\N	\N
688	Jeanne Jugan	\N	\N	1792-10-25	1879-08-29	\N	\N	\N	\N	\N	2009-10-11	\N	\N	/wiki/Jeanne_Jugan	\N	\N
673	James Buuzaabalyaawo	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=James_Buuzaabalyaawo&action=edit&redlink=1	\N	\N
656	Irmã Dulce Pontes	\N	\N	1914-05-26	1992-03-13	\N	\N	\N	\N	\N	2019-10-13	\N	also known as Dulce of the Poor and first Brazilian woman saint	/wiki/Irm%C3%A3_Dulce_Pontes	\N	\N
1480	Ursula Ledóchowska	\N	\N	1865-04-17	1939-05-29	\N	\N	\N	\N	\N	2003-05-18	\N	\N	/wiki/Ursula_Led%C3%B3chowska	\N	\N
1450	Theotonius of Coimbra	\N	\N	\N	1162-02-18	\N	\N	\N	c.1082	\N	\N	\N	\N	/wiki/Theotonius_of_Coimbra	1758 (cultus confirmed) by Pope Benedict XIV	\N
1399	Stephen of Muret	\N	\N	\N	1124-02-08	\N	\N	\N	c. 1340	\N	\N	\N	\N	/wiki/Stephen_of_Muret	1189 by Pope Clement III	\N
1381	Simón de Rojas	\N	\N	1552-10-28	1624-09-29	\N	\N	\N	\N	\N	1988-07-03	\N	\N	/wiki/Sim%C3%B3n_de_Rojas	\N	\N
1326	Rose of Viterbo	\N	\N	\N	1251-03-06	\N	\N	\N	c. 1233	\N	\N	\N	\N	/wiki/Rose_of_Viterbo	1457 by Pope Callistus III	\N
1312	Robert Southwell	\N	\N	\N	1595-02-21	\N	\N	t	c. 1561	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Robert_Southwell_(Jesuit)	\N	\N
1237	Pope Marcellus I	\N	\N	0255-01-06	0309-01-16	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Pope_Marcellus_I	found in Roman Martyrology	\N
1163	Philip Benizi de Damiani	\N	\N	1233-08-15	1285-08-22	\N	\N	\N	\N	\N	1671-04-12	\N	\N	/wiki/Philip_Benizi_de_Damiani	\N	\N
1141	Peter Nolasco	\N	\N	\N	1256-05-06	\N	\N	\N	1189	\N	1628-09-30	\N	\N	/wiki/Peter_Nolasco	\N	\N
1416	Paschal Baylon	\N	\N	1540-05-16	1592-05-17	\N	\N	\N	\N	\N	1690-10-16	\N	\N	/wiki/Paschal_Baylon	\N	\N
1047	Nicholas Tavelic	\N	\N	\N	1391-11-14	\N	\N	\N	c. 1340	\N	1970-06-21	\N	\N	/wiki/Nicholas_Tavelic	\N	\N
724	John Maron	\N	\N	\N	\N	\N	\N	\N	628	707	\N	\N	first Maronite patriarch	/wiki/John_Maron	\N	\N
789	Julian of Antioch	\N	\N	\N	\N	\N	\N	\N	200s	c. 305 AD	\N	\N	\N	/wiki/Julian_of_Antioch	found in Roman Martyrology	\N
807	Justus of Urgell	\N	\N	\N	\N	\N	\N	\N	400s	c. 527	\N	\N	\N	/wiki/Justus_of_Urgell	found in Roman Martyrology	\N
860	Lubentius	\N	\N	\N	\N	\N	\N	\N	c. 300	c. 370	\N	\N	\N	/wiki/Lubentius	\N	\N
993	Melito of Sardis	\N	\N	\N	\N	\N	\N	\N	100s	180	\N	\N	\N	/wiki/Melito_of_Sardis	\N	\N
1005	Moninne	\N	\N	\N	\N	\N	\N	\N	c. 435	c. 517	\N	\N	\N	/wiki/Moninne	\N	\N
1042	Nicodemus	\N	\N	\N	\N	\N	\N	\N	c. 1 BC	0's	\N	\N	\N	/wiki/Nicodemus	found in Roman Martyrology	\N
1056	Nympha	\N	\N	\N	\N	\N	\N	\N	unknown	c. 250	\N	\N	\N	/wiki/Tryphon,_Respicius,_and_Nympha	found in Roman Martyrology	\N
1072	Osana	\N	\N	\N	\N	\N	\N	\N	698	750	\N	\N	\N	/wiki/Osana	\N	\N
1156	Pharnacius of Satala	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
1174	Placidus of Messina	\N	\N	\N	\N	\N	\N	\N	unknown	500s	\N	\N	\N	/wiki/Saint_Placidus	\N	\N
1246	Pope Pontian	\N	\N	\N	\N	\N	\N	\N	200s	October 235	\N	\N	\N	/wiki/Pope_Pontian	found in Roman Martyrology	\N
1286	Quadratus of Athens	\N	\N	\N	\N	\N	\N	\N	unknown	129	\N	\N	\N	/wiki/Quadratus_of_Athens	found in Roman Martyrology	\N
1318	Romanus Ostiarius	\N	\N	\N	\N	\N	\N	\N	unknown	c. 258	\N	\N	\N	/wiki/Romanus_Ostiarius	found in Roman Martyrology	\N
1337	Sabina	\N	\N	\N	\N	\N	\N	\N	unknown	c. 126 AD	\N	\N	\N	/wiki/Saint_Sabina	found in Roman Martyrology	\N
1371	Sigfrid of Sweden	\N	\N	\N	\N	\N	\N	\N	1000s	1100s	\N	\N	\N	/wiki/Sigfrid_of_Sweden	c. 1158 by Pope Hadrian IV	\N
1423	Thecla	\N	\N	\N	\N	\N	\N	\N	30 AD	0's	\N	\N	\N	/wiki/Thecla	found in Roman Martyrology	\N
1442	Theopemptus of Nicomedia	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Theopemptus_of_Nicomedia	found in Roman Martyrology	\N
1521	Wilfrid	\N	\N	\N	\N	\N	\N	\N	c. 633	709 or 710	\N	\N	\N	/wiki/Wilfrid	\N	\N
1538	Zacchaeus of Jerusalem	\N	\N	\N	\N	\N	\N	\N	0's	116	\N	\N	\N	/wiki/Zacchaeus_of_Jerusalem	found in Roman Martyrology	\N
1303	Richard of Chichester	\N	\N	\N	1253-04-03	\N	\N	\N	c. 1197	\N	1262-01-25	\N	\N	/wiki/Richard_of_Chichester	\N	\N
1267	Pope Urban I	\N	\N	\N	0230-05-23	\N	\N	\N	100s	\N	\N	\N	\N	/wiki/Pope_Urban_I	found in Roman Martyrology f	\N
1105	Paula Montal Fornés	\N	\N	1799-10-11	1889-02-26	\N	\N	\N	\N	\N	2001-11-25	\N	\N	/wiki/Paula_Montal_Forn%C3%A9s	\N	\N
1089	Pantagathus	\N	\N	\N	0541-04-17	\N	\N	\N	unknown	\N	\N	\N	\N	/w/index.php?title=Pantagathus&action=edit&redlink=1	found in Roman Martyrology	\N
1025	Nazaria Ignacia March Mesa	\N	\N	1889-01-10	1943-07-06	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Nazaria_Ignacia_March_Mesa	\N	\N
975	Matthias of Miyako	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Matthias_of_Miyako&action=edit&redlink=1	\N	\N
925	Maria Domenica Mazzarello	\N	\N	1837-05-09	1881-05-14	\N	\N	\N	\N	\N	1951-06-24	\N	\N	/wiki/Maria_Domenica_Mazzarello	\N	\N
909	Marciano José	\N	\N	1900-11-15	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/wiki/Marciano_Jos%C3%A9	\N	\N
892	Majolus of Cluny	\N	\N	\N	0994-05-11	\N	\N	\N	c. 906	\N	\N	\N	\N	/wiki/Majolus_of_Cluny	found in Roman Martyrology	\N
874	Luke Alonso Gorda	\N	\N	1594-10-18	1633-10-19	\N	\N	t	\N	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Luke_Alonso_Gorda&action=edit&redlink=1	\N	\N
842	Leonie Aviat	\N	\N	1844-09-16	1914-01-10	\N	\N	\N	\N	\N	2001-11-25	\N	\N	/wiki/Leonie_Aviat	\N	\N
824	Lawrence of Brindisi	\N	\N	1559-07-22	1619-07-22	\N	\N	\N	\N	\N	1881-12-08	\N	\N	/wiki/Lawrence_of_Brindisi	\N	\N
773	Joseph Pignatelli	\N	\N	1737-12-27	1811-11-15	\N	\N	\N	\N	\N	1954-06-12	\N	professed priest of the Jesuits	/wiki/Joseph_Pignatelli	\N	\N
756	José Isabel Flores Varela	\N	\N	1866-11-28	1927-06-21	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Jos%C3%A9_Isabel_Flores_Varela&action=edit&redlink=1	\N	\N
738	John of Tufara	\N	\N	\N	1170-11-14	\N	\N	\N	1084	\N	\N	\N	\N	/wiki/John_of_Tufara	28 August 1221 by elevatio et translatio corporis officiato	\N
709	John de Britto	\N	\N	1647-03-01	1693-02-04	\N	\N	\N	\N	\N	1947-06-22	\N	\N	/wiki/John_de_Britto	\N	\N
692	Jerome	\N	\N	\N	0420-09-30	\N	\N	\N	c. 347	\N	\N	\N	translated the Vulgate	/wiki/Jerome	found in Roman Martyrology	\N
675	James Lacobs	\N	\N	\N	1572-07-09	\N	\N	t	1541	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/w/index.php?title=James_Lacobs&action=edit&redlink=1	\N	\N
658	Isaac of Dalmatia	\N	\N	\N	0383-05-30	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Isaac_of_Dalmatia	\N	\N
641	Hyacintha Mariscotti	\N	\N	1585-03-16	1640-01-30	\N	\N	\N	\N	\N	1807-05-14	\N	\N	/wiki/Hyacintha_Mariscotti	\N	\N
1503	Vincent Pallotti	\N	\N	1795-04-21	1850-01-22	\N	\N	\N	\N	\N	1963-01-20	\N	\N	/wiki/Vincent_Pallotti	\N	\N
1488	Vergilius of Salzburg	\N	\N	\N	0784-11-27	\N	\N	\N	700	\N	\N	\N	\N	/wiki/Vergilius_of_Salzburg	1233 by Pope Gregory IX	\N
1474	Ubald	\N	\N	\N	\N	\N	\N	\N	c. 1084	1160	1192-03-04	\N	Bishop of Gubbio	/wiki/Ubald	\N	\N
1454	Thomas de Cantilupe	\N	\N	\N	1282-08-25	\N	\N	\N	c. 1218	\N	1320-04-17	\N	\N	/wiki/Thomas_de_Cantilupe	\N	\N
1409	Symeon the New Theologian	\N	\N	\N	1022-03-12	\N	\N	\N	949	\N	\N	\N	theologian	/wiki/Symeon_the_New_Theologian	\N	\N
1390	Stanislaus of Szczepanów	\N	\N	1030-07-26	1079-04-11	\N	\N	\N	\N	\N	1253-09-17	\N	\N	/wiki/Stanislaus_of_Szczepan%C3%B3w	\N	\N
1354	Senator of Milan	\N	\N	\N	0475-05-29	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Senator_(bishop_of_Milan)	found in Roman Martyrology	\N
1232	Pope Lucius I	\N	\N	\N	0254-03-05	\N	\N	\N	c. 200	\N	\N	\N	\N	/wiki/Pope_Lucius_I	found in Roman Martyrology	\N
1213	Pope Felix IV	\N	\N	\N	0530-09-22	\N	\N	\N	490	\N	\N	\N	\N	/wiki/Pope_Felix_IV	found in Roman Martyrology	\N
1195	Pope Boniface IV	\N	\N	\N	0615-05-08	\N	\N	\N	550	\N	\N	\N	\N	/wiki/Pope_Boniface_IV	found in Roman Martyrology	\N
1139	Peter of Alcantara	\N	\N	\N	1562-10-18	\N	\N	\N	1499	\N	1669-04-28	\N	\N	/wiki/Peter_of_Alcantara	\N	\N
960	Martinianus	\N	\N	\N	0435-12-29	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Martinianus_(bishop_of_Milan)	found in Roman Martyrology	\N
943	Marie-Eugénie de Jésus	\N	\N	1817-08-25	1898-03-10	\N	\N	\N	\N	\N	2007-06-03	\N	\N	/wiki/Marie-Eug%C3%A9nie_de_J%C3%A9sus	\N	\N
1125	Perpetua	\N	\N	\N	0203-03-07	\N	\N	\N	182	\N	\N	\N	See also Passion of Saint Perpetua, Saint Felicitas, and their Companions	/wiki/Perpetua_and_Felicity	found in Roman Martyrology	\N
643	Hypatius of Gangra	\N	\N	\N	\N	\N	\N	\N	200s	c. 325	\N	\N	\N	/wiki/Hypatius_of_Gangra	\N	\N
660	Isidora	\N	\N	\N	\N	\N	\N	\N	300s	before 365	\N	\N	\N	/wiki/Saint_Isidora	\N	\N
676	James the Greater	\N	\N	\N	\N	\N	\N	\N	c. 3 AD	44 AD	\N	\N	\N	/wiki/James,_son_of_Zebedee	found in Roman Martyrology	\N
806	Juvenal of Benevento	\N	\N	\N	\N	\N	\N	\N	unknown	132	\N	\N	\N	/wiki/Juvenal_of_Benevento	found in Roman Martyrology	\N
840	Leucius of Brindisi	\N	\N	\N	\N	\N	\N	\N	100s	180	\N	\N	\N	/wiki/Leucius_of_Brindisi	found in Roman Martyrology	\N
880	Macarius of Alexandria	\N	\N	\N	\N	\N	\N	\N	c. 300	395	\N	\N	\N	/wiki/Macarius_of_Alexandria	found in Roman Martyrology	\N
897	Marcellinus	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Marcellinus_and_Peter	found in Roman Martyrology	\N
951	Martha of Bethany	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Martha	found in Roman Martyrology	\N
982	Maximus of Évreux	\N	\N	\N	\N	\N	\N	\N	300s	c. 384	\N	\N	\N	/wiki/Maximus_of_%C3%89vreux	\N	\N
1023	Narcissus	\N	\N	\N	\N	\N	\N	\N	200s	c. 320	\N	\N	\N	/wiki/Narcissus,_Argeus,_and_Marcellinus	found in Roman Martyrology	\N
1066	Oliva of Brescia	\N	\N	\N	\N	\N	\N	\N	unknown	138	\N	\N	\N	/wiki/Oliva_of_Brescia	\N	\N
1082	Pancras of Taormina	\N	\N	\N	\N	\N	\N	\N	unknown	c. 40 AD	\N	\N	\N	/wiki/Pancras_of_Taormina	found in Roman Martyrology	\N
1153	Peter Thomas	\N	\N	\N	\N	\N	\N	\N	1305	1366	\N	\N	\N	/wiki/Peter_Thomas_(saint)	1628 (cultus confirmed) by Pope Urban VIII	\N
1170	Pinytus	\N	\N	\N	\N	\N	\N	\N	100s	180	\N	\N	\N	/wiki/Pinytus	found in Roman Martyrology	\N
1308	Rigobert	\N	\N	\N	\N	\N	\N	\N	600s	c. 743	\N	\N	\N	/wiki/Rigobert	found in Roman Martyrology	\N
1355	Senán mac Geirrcinn	\N	\N	\N	\N	\N	\N	\N	488	500s	\N	\N	\N	/wiki/Sen%C3%A1n_mac_Geirrcinn	\N	\N
1372	Sigismund of Burgundy	\N	\N	\N	\N	\N	\N	\N	400s	524	\N	\N	\N	/wiki/Sigismund_of_Burgundy	found in Roman Martyrology	\N
1435	Theodore the Studite	\N	\N	\N	\N	\N	\N	\N	759	826	\N	\N	\N	/wiki/Theodore_the_Studite	found in Roman Martyrology	\N
1484	Valerian of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	c. 260	\N	\N	\N	/wiki/Tiburtius,_Valerian,_and_Maximus	found in Roman Martyrology	\N
1515	Walter of Pontoise	\N	\N	\N	\N	\N	\N	\N	c. 1030	c. 1099	\N	\N	\N	/wiki/Walter_of_Pontoise	\N	\N
1452	Theresa of Portugal	\N	\N	1178-10-04	1250-06-18	\N	\N	\N	\N	\N	1705-12-13	\N	\N	/wiki/Theresa_of_Portugal,_Queen_of_Le%C3%B3n	\N	\N
1240	Pope Paschal I	\N	\N	\N	0767-06-28	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Paschal_I	found in Roman Martyrology	\N
1218	Pope Hormisdas	\N	\N	\N	0523-08-06	\N	\N	\N	450	\N	\N	\N	\N	/wiki/Pope_Hormisdas	found in Roman Martyrology	\N
999	Michael Kozaki	\N	\N	\N	1597-02-05	\N	\N	t	c. 1551	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Michael_Kozaki	\N	\N
967	Mary Frances of the Five Wounds	\N	\N	1715-03-25	1791-10-07	\N	\N	\N	\N	\N	1867-06-29	\N	\N	/wiki/Mary_Frances_of_the_Five_Wounds	\N	\N
930	Maria Micaela Desmaisieres	\N	\N	1809-01-01	1865-08-24	\N	\N	\N	\N	\N	1934-03-04	\N	\N	/wiki/Maria_Micaela_Desmaisieres	\N	\N
920	Maria Crocifissa di Rosa	\N	\N	1813-11-06	1855-12-15	\N	\N	\N	\N	\N	1954-06-12	\N	\N	/wiki/Maria_Crocifissa_di_Rosa	\N	\N
857	Louise de Marillac	\N	\N	1591-08-12	1660-03-15	\N	\N	\N	\N	\N	1934-03-11	\N	\N	/wiki/Louise_de_Marillac	\N	\N
823	Lawrence Giustiniani	\N	\N	1381-07-01	1456-01-08	\N	\N	\N	\N	\N	1690-10-16	\N	\N	/wiki/Lawrence_Giustiniani	\N	\N
790	Julián Alfredo	\N	\N	1903-12-24	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Juli%C3%A1n_Alfredo&action=edit&redlink=1	\N	\N
772	Joseph Oriol	\N	\N	1650-11-23	1702-03-23	\N	\N	\N	\N	\N	1909-05-20	\N	\N	/wiki/Joseph_Oriol	\N	\N
755	John Twenge	\N	\N	\N	1379-10-10	\N	\N	\N	1320	\N	\N	\N	\N	/wiki/John_Twenge	1401 by Pope Boniface IX	\N
740	John of the Cross	\N	\N	\N	1591-12-14	\N	\N	\N	1542	\N	1726-12-27	\N	\N	/wiki/John_of_the_Cross	\N	\N
722	John Maria Muzeeyi	\N	\N	\N	1887-01-27	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=John_Maria_Muzeeyi&action=edit&redlink=1	\N	\N
707	John Boste	\N	\N	\N	1594-07-24	\N	\N	t	1544	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Boste	\N	\N
690	Jeanne-Antide Thouret	\N	\N	1765-11-27	1826-08-24	\N	\N	\N	\N	\N	1934-01-14	\N	founder of the Sisters of Charity of Saint Joan Antida Thouret	/wiki/Jeanne-Antide_Thouret	\N	\N
1549	Zygmunt Gorazdowski	\N	\N	1845-11-01	1920-01-01	\N	\N	\N	\N	\N	2005-10-23	\N	\N	/wiki/Zygmunt_Gorazdowski	\N	\N
1528	William of Donjeon	\N	\N	\N	1209-01-10	\N	\N	\N	c. 1140	\N	\N	\N	\N	/wiki/William_of_Donjeon	17 May 1218 by Pope Honorius III	\N
1500	Vincent de Paul	\N	\N	1581-04-24	1660-09-27	\N	\N	\N	\N	\N	1737-06-16	\N	\N	/wiki/Vincent_de_Paul	\N	\N
1420	Teresa Jornet Ibars	\N	\N	1843-01-09	1897-08-26	\N	\N	\N	\N	\N	1974-01-27	\N	\N	/wiki/Teresa_Jornet_Ibars	\N	\N
1403	Sylvester Gozzolini	\N	\N	\N	1267-11-26	\N	\N	\N	1177	\N	\N	\N	\N	/wiki/Sylvester_Gozzolini	1598 by Pope Clement VIII	\N
1391	Stanisław Kazimierczyk	\N	\N	1433-09-27	1489-05-03	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Stanis%C5%82aw_Kazimierczyk	\N	\N
1342	Salvador of Horta	\N	\N	\N	1567-03-18	\N	\N	\N	December 1520	\N	1938-04-17	\N	\N	/wiki/Salvador_of_Horta	\N	\N
1324	Rose of Lima	\N	\N	1586-04-20	1617-08-24	\N	\N	\N	\N	\N	1671-04-12	\N	\N	/wiki/Rose_of_Lima	\N	\N
1291	Rafaela Porras Ayllón	\N	\N	1850-03-01	1925-01-06	\N	\N	\N	\N	\N	1977-01-23	\N	\N	/wiki/Rafaela_Porras_Ayll%C3%B3n	\N	\N
1203	Pope Dionysius	\N	\N	\N	0268-12-26	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Dionysius	found in Roman Martyrology	\N
1272	Procopius of Sázava	\N	\N	\N	1053-03-25	\N	\N	\N	c. 970	\N	1204-06-02	\N	\N	/wiki/Procopius_of_S%C3%A1zava	\N	\N
1257	Pope Stephen IV	\N	\N	\N	0817-01-24	\N	\N	\N	c. 770	\N	\N	\N	\N	/wiki/Pope_Stephen_IV	\N	\N
1187	Pope Agatho	\N	\N	\N	0681-01-10	\N	\N	\N	600s	\N	\N	\N	\N	/wiki/Pope_Agatho	found in Roman Martyrology	\N
1136	Peter Faber	\N	\N	1506-04-14	1545-08-01	\N	\N	\N	\N	\N	2013-12-17	\N	\N	/wiki/Peter_Faber	\N	\N
1116	Pedro Esqueda Ramirez	\N	\N	1887-04-29	1927-11-22	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Pedro_Esqueda_Ramirez&action=edit&redlink=1	\N	\N
1099	Paul Miki	\N	\N	\N	1597-02-05	\N	\N	t	c. 1562	\N	1862-06-08	\N	One of the 26 Martyrs of Japan	/wiki/Paulo_Miki	\N	\N
1038	Nicholas Pieck	\N	\N	1534-08-29	1572-07-09	\N	\N	t	\N	\N	1867-06-29	\N	one of the Martyrs of Gorkum	/wiki/Nicholas_Pieck	\N	\N
645	Ignatius of Antioch	\N	\N	\N	\N	\N	\N	\N	c. 50 AD	c. 108 AD	\N	\N	\N	/wiki/Ignatius_of_Antioch	found in Roman Martyrology	\N
679	James the Just	\N	\N	\N	\N	\N	\N	\N	unknown	62 or 69 AD	\N	\N	\N	/wiki/James,_brother_of_Jesus	found in Roman Martyrology	\N
746	John the Apostle	\N	\N	\N	\N	\N	\N	\N	c. 6 AD	c. 100 AD	\N	\N	\N	/wiki/John_the_Apostle	found in Roman Martyrology	\N
764	Joseph	\N	\N	\N	\N	\N	\N	\N	1st century BC	0's	\N	\N	husband of the Blessed Virgin Mary	/wiki/Saint_Joseph	found in Roman Martyrology	\N
797	Julius of Rome	\N	\N	\N	\N	\N	\N	\N	100s	190	\N	\N	\N	/wiki/Julius_of_Rome	found in Roman Martyrology	\N
809	Juvenal of Narni	\N	\N	\N	\N	\N	\N	\N	unknown	3 May 369 or 377	\N	\N	\N	/wiki/Juvenal_of_Narni	found in Roman Martyrology	\N
843	Liberalis of Treviso	\N	\N	\N	\N	\N	\N	\N	300s	400	\N	\N	\N	/wiki/Liberalis_of_Treviso	\N	\N
959	Maruthas of Martyropolis	\N	\N	\N	\N	\N	\N	\N	300s	c. 420	\N	\N	\N	/wiki/Maruthas_of_Martyropolis	found in Roman Martyrology	\N
976	Maura	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Maura_and_Britta	\N	\N
994	Menodora	\N	\N	\N	\N	\N	\N	\N	200s	305-311	\N	\N	\N	/wiki/Menodora,_Metrodora,_and_Nymphodora	found in Roman Martyrology	\N
1011	Monica	\N	\N	\N	\N	\N	\N	\N	332	387	\N	\N	\N	/wiki/Saint_Monica	found in Roman Martyrology	\N
1041	Nicomedes	\N	\N	\N	\N	\N	\N	\N	unknown	0's	\N	\N	\N	/wiki/Saint_Nicomedes	found in Roman Martyrology	\N
1073	Oran of Iona	\N	\N	\N	\N	\N	\N	\N	400s	500s	\N	\N	\N	/wiki/Oran_of_Iona	\N	\N
1092	Parmenas	\N	\N	\N	\N	\N	\N	\N	0's	98 AD	\N	\N	one of the Seven Deacons	/wiki/Parmenas	found in Roman Martyrology	\N
1109	Paulinus II of Aquileia	\N	\N	\N	\N	\N	\N	\N	c. 726	802 or 804	\N	\N	\N	/wiki/Paulinus_II_of_Aquileia	\N	\N
1158	Philetus	\N	\N	\N	\N	\N	\N	\N	unknown	c. 121	\N	\N	Roman senator	/wiki/Philetus_(martyr)	found in Roman Martyrology	\N
1241	Pope Paul I	\N	\N	\N	\N	\N	\N	\N	700s	824	\N	\N	\N	/wiki/Pope_Paul_I	found in Roman Martyrology	\N
1268	Pothinus	\N	\N	\N	\N	\N	\N	\N	c. 87 AD	177	\N	\N	bishop of Lyon	/wiki/Saint_Pothinus	found in Roman Martyrology	\N
1336	Sabbas the Goth	\N	\N	\N	\N	\N	\N	\N	334	372	\N	\N	\N	/wiki/Sabbas_the_Goth	found in Roman Martyrology	\N
1352	Sebastian	\N	\N	\N	\N	\N	\N	\N	c. 256	c. 288	\N	\N	\N	/wiki/Saint_Sebastian	found in Roman Martyrology	\N
1374	Simeon	\N	\N	\N	\N	\N	\N	\N	1st century BC	unknown	\N	\N	\N	/wiki/Simeon_(Gospel_of_Luke)	found in Roman Martyrology	\N
1388	Stachys the Apostle	\N	\N	\N	\N	\N	\N	\N	unknown	c. 54 AD	\N	\N	\N	/wiki/Stachys_the_Apostle	found in Roman Martyrology	\N
1425	Thamel	\N	\N	\N	\N	\N	\N	\N	unknown	125	\N	\N	\N	/wiki/Thamel_(martyr)	found in Roman Martyrology	\N
1482	Ursus of Auxerre	\N	\N	\N	\N	\N	\N	\N	400s	508	\N	\N	\N	/wiki/Ursus_of_Auxerre	found in Roman Martyrology	\N
1514	Vitalis	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Saints_Vitalis_and_Agricola	found in Roman Martyrology	\N
1526	William of Gellone	\N	\N	\N	\N	\N	\N	\N	755	28 May 812 or 814	\N	\N	\N	/wiki/William_of_Gellone	1066 by Pope Alexander II	\N
1405	Symeon of Trier	\N	\N	\N	\N	\N	\N	\N	980s	1035	1047-01-05	\N	\N	/wiki/Symeon_of_Trier	\N	\N
1256	Pope Sylvester I	\N	\N	\N	0335-12-31	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Sylvester_I	found in Roman Martyrology	\N
1224	Pope Julius I	\N	\N	\N	0352-04-12	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Julius_I	found in Roman Martyrology	\N
1145	Peter of Jesus Maldonado	\N	\N	1892-06-15	1937-02-11	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Peter_of_Jesus_Maldonado	\N	\N
1129	Peter Baptist	\N	\N	1542-06-24	1597-02-05	\N	\N	t	\N	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Peter_Baptist	\N	\N
1057	Nunzio Sulprizio	\N	\N	1817-04-13	1836-05-05	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Nunzio_Sulprizio	\N	\N
1021	Naum	\N	\N	\N	0910-12-23	\N	\N	\N	c. 830	\N	\N	\N	\N	/wiki/Saint_Naum	\N	\N
926	Maria Giuseppa Rossello	\N	\N	1811-05-27	1880-12-07	\N	\N	\N	\N	\N	1949-06-12	\N	\N	/wiki/Maria_Giuseppa_Rossello	\N	\N
908	Margaret of Castello	\N	\N	\N	1320-04-12	\N	\N	\N	1287	\N	2021-04-24	\N	\N	/wiki/Margaret_of_Castello	\N	\N
891	Magdalene of Nagasaki	\N	\N	\N	1634-10-15	\N	\N	t	1611	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Magdalene_of_Nagasaki	\N	\N
877	Lukka Baanabakintu	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Lukka_Baanabakintu&action=edit&redlink=1	\N	\N
859	Luca Antonio Falcone	\N	\N	1669-10-19	1739-10-30	\N	\N	\N	\N	\N	2017-10-15	\N	\N	/wiki/Luca_Antonio_Falcone	\N	\N
826	Lazarus of Bardiaboch	\N	\N	\N	0326-03-27	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Zanitas_and_Lazarus_of_Persia	\N	\N
782	Juan García López-Rico	\N	\N	1561-07-10	1613-02-14	\N	\N	\N	\N	\N	1975-05-25	\N	\N	/wiki/Juan_Garc%C3%ADa_L%C3%B3pez-Rico	\N	\N
728	John of Capistrano	\N	\N	1386-06-24	1456-10-23	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/John_of_Capistrano	16 October 1690 by Pope Alexander VIII or 1724 by Pope Benedict XIII	\N
702	John Berchmans	\N	\N	1599-03-13	1621-08-13	\N	\N	\N	\N	\N	1888-01-15	\N	\N	/wiki/John_Berchmans	\N	\N
661	Isidore of Seville	\N	\N	\N	0636-04-04	\N	\N	\N	c. 556	\N	\N	\N	archbishop of Seville, Doctor of the Church	/wiki/Isidore_of_Seville	found in Roman Martyrology	\N
1543	Zanitas of Bardiaboch	\N	\N	\N	0326-03-27	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Zanitas_and_Lazarus_of_Persia	\N	\N
1495	Victoriano Pío	\N	\N	1905-07-07	1934-10-09	\N	\N	t	\N	\N	1999-11-21	\N	One of the Martyrs of Turon	/w/index.php?title=Victoriano_P%C3%ADo&action=edit&redlink=1	\N	\N
1462	Thomas the Apostle	\N	\N	\N	1972-07-03	\N	\N	\N	0's	\N	\N	\N	\N	/wiki/Thomas_the_Apostle	found in Roman Martyrology	\N
1441	Theophanes the Confessor	\N	\N	\N	0817-03-12	\N	\N	\N	758–760	\N	\N	\N	\N	/wiki/Theophanes_the_Confessor	found in Roman Martyrology	\N
1320	Rodrigo Aguilar Alemán	\N	\N	1875-03-13	1927-10-28	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/w/index.php?title=Rodrigo_Aguilar_Alem%C3%A1n&action=edit&redlink=1	\N	\N
1304	Richard Reynolds	\N	\N	\N	1535-05-04	\N	\N	t	c. 1492	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Richard_Reynolds_(martyr)	\N	\N
1287	Quirinus of Neuss	\N	\N	\N	0116-03-30	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Quirinus_of_Neuss	found in Roman Martyrology	\N
1207	Pope Eusebius	\N	\N	\N	0310-08-17	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Pope_Eusebius	found in Roman Martyrology	\N
1190	Pope Anastasius I	\N	\N	\N	0401-12-19	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Pope_Anastasius_I	found in Roman Martyrology	\N
941	Marie-Azélie Guérin	\N	\N	1831-12-23	1877-08-28	\N	\N	\N	\N	\N	2015-10-18	\N	\N	/wiki/Louis_Martin_and_Marie-Az%C3%A9lie_Gu%C3%A9rin	\N	\N
1173	Pirmin	\N	\N	\N	0753-11-03	\N	\N	\N	700	\N	\N	\N	\N	/wiki/Saint_Pirmin	\N	\N
683	Januarius	\N	\N	\N	\N	\N	\N	\N	200s	c. 305	\N	\N	bishop of Benevento	/wiki/Januarius	found in Roman Martyrology	\N
747	John the Baptist	\N	\N	\N	\N	\N	\N	\N	1st century BC	28–36 AD	\N	\N	\N	/wiki/John_the_Baptist	found in Roman Martyrology	\N
796	Juliana of Nicomedia	\N	\N	\N	\N	\N	\N	\N	c. 286	c. 304	\N	\N	\N	/wiki/Juliana_of_Nicomedia	found in Roman Martyrology	\N
850	Longinus of Satala	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/Orentius_(martyr)	found in Roman Martyrology	\N
996	Menas	\N	\N	\N	\N	\N	\N	\N	285	c. 309	\N	\N	\N	/wiki/Saint_Menas	found in Roman Martyrology	\N
1014	Munditia	\N	\N	\N	\N	\N	\N	\N	200s	c. 310	\N	\N	\N	/wiki/Munditia	\N	\N
1048	Ninian	\N	\N	\N	\N	\N	\N	\N	300s	c. 432	\N	\N	\N	/wiki/Ninian	\N	\N
1084	Palatias	\N	\N	\N	\N	\N	\N	\N	200s	302	\N	\N	\N	/wiki/Palatias_and_Laurentia	found in Roman Martyrology	\N
1121	Peleus	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Saint_Peleus	found in Roman Martyrology	\N
1165	Philip the Apostle	\N	\N	\N	\N	\N	\N	\N	unknown	80 AD	\N	\N	\N	/wiki/Philip_the_Apostle	found in Roman Martyrology	\N
1185	Placidus	\N	\N	\N	\N	\N	\N	\N	200s	300s	\N	\N	\N	/wiki/Placidus_(martyr)	found in Roman Martyrology	\N
1271	Priscus of Auxerre	\N	\N	\N	\N	\N	\N	\N	unknown	c.272	\N	\N	\N	/w/index.php?title=Priscus_of_Auxerre&action=edit&redlink=1	found in Roman Martyrology	\N
1330	Rufus of Metz	\N	\N	\N	\N	\N	\N	\N	300s	400	\N	\N	\N	/wiki/Rufus_of_Metz	found in Roman Martyrology	\N
1345	Saturninus of Cagliari	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Saturninus_of_Cagliari	found in Roman Martyrology	\N
1363	Sergius	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Sergius_and_Bacchus	found in Roman Martyrology	\N
1413	Telemachus	\N	\N	\N	\N	\N	\N	\N	300s	1 January 404 or 391	\N	\N	\N	/wiki/Saint_Telemachus	found in Roman Martyrology	\N
1448	Theonas	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Theopemptus_of_Nicomedia	found in Roman Martyrology	\N
1498	Villanus	\N	\N	\N	\N	\N	\N	\N	1100s	1237	\N	\N	\N	/wiki/Villanus	\N	\N
1533	William of Roskilde	\N	\N	\N	\N	\N	\N	\N	unknown	1073 or 1074	\N	\N	\N	/wiki/William_of_Roskilde	21 January 1224 by Pope Honorius III	\N
1231	Pope Leo III	\N	\N	\N	0816-06-12	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Leo_III	1673 by Pope Clement X	\N
1215	Pope Gelasius I	\N	\N	\N	0496-11-19	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_Gelasius_I	found in Roman Martyrology	\N
1198	Pope Celestine V	\N	\N	\N	1296-05-19	\N	\N	\N	1215	\N	1313-05-05	\N	\N	/wiki/Pope_Celestine_V	\N	\N
1150	Peter Sukejiro	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/wiki/Peter_Sukejiro	\N	\N
1031	Nicholas of Flüe	\N	\N	\N	1487-03-21	\N	\N	\N	1417	\N	1947-05-15	\N	\N	/wiki/Nicholas_of_Fl%C3%BCe	\N	\N
980	Maurus	\N	\N	0512-01-01	0584-01-15	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Saint_Maurus	found in Roman Martyrology	\N
964	Mary MacKillop	\N	\N	1842-01-15	1909-08-08	\N	\N	\N	\N	\N	2010-10-17	\N	\N	/wiki/Mary_MacKillop	\N	\N
947	Marko Krizin	\N	\N	\N	1619-09-07	\N	\N	\N	1589	\N	1995-07-02	\N	\N	/wiki/Marko_Krizin	\N	\N
934	María Natividad Venegas de la Torre	\N	\N	1868-09-08	1959-07-30	\N	\N	\N	\N	\N	2000-05-21	\N	\N	/wiki/Mar%C3%ADa_Natividad_Venegas_de_la_Torre	\N	\N
914	Margarito Flores García	\N	\N	1899-02-22	1927-11-12	\N	\N	\N	\N	\N	2000-05-21	\N	one of the Saints of the Cristero War	/wiki/Margarito_Flores_Garc%C3%ADa	\N	\N
881	Madeleine Sophie Barat	\N	\N	1779-12-12	1865-05-25	\N	\N	\N	\N	\N	1925-05-24	\N	\N	/wiki/Madeleine_Sophie_Barat	\N	\N
865	Ludger	\N	\N	\N	0809-03-26	\N	\N	\N	742	\N	\N	\N	\N	/wiki/Ludger	found in Roman Martyrology	\N
830	Leo Karasumaru	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Leo_Karasumaru&action=edit&redlink=1	\N	\N
810	Kilian	\N	\N	\N	0689-07-08	\N	\N	\N	640	\N	\N	\N	\N	/wiki/Saint_Kilian	found in Roman Martyrology	\N
780	Juan del Castillo	\N	\N	1595-09-14	1628-11-17	\N	\N	\N	\N	\N	1988-05-16	\N	\N	/wiki/Juan_de_Castillo_(Jesuit)	\N	\N
763	Joseph Cafasso	\N	\N	1811-01-15	1860-06-23	\N	\N	\N	\N	\N	1947-06-22	\N	\N	/wiki/Joseph_Cafasso	\N	\N
730	John of Meda	\N	\N	\N	1159-09-26	\N	\N	\N	1100	\N	\N	\N	\N	/wiki/John_of_Meda	c. 1170 by Pope Alexander III	\N
716	John Henry Newman	\N	\N	1801-02-21	1890-08-11	\N	\N	\N	\N	\N	2019-10-13	\N	\N	/wiki/John_Henry_Newman	\N	\N
699	Joan of Arc	\N	\N	\N	1431-05-30	\N	\N	t	1412	\N	1920-05-16	\N	French heroine and martyr	/wiki/Joan_of_Arc	\N	\N
664	Ivo of Chartres	\N	\N	\N	1115-12-23	\N	\N	\N	1040	\N	\N	\N	\N	/wiki/Ivo_of_Chartres	\N	\N
646	Ignatius of Loyola	\N	\N	\N	1556-07-31	\N	\N	\N	c. 23 October 1491	\N	\N	\N	Founded the Society of Jesus (Jesuits)	/wiki/Ignatius_of_Loyola	12 March 1622 by Pope Gregory XV	\N
1550	Zygmunt Szczęsny Feliński	\N	\N	1822-11-01	1895-09-17	\N	\N	\N	\N	\N	2009-10-11	\N	\N	/wiki/Zygmunt_Szcz%C4%99sny_Feli%C5%84ski	\N	\N
1517	Wenceslaus	\N	\N	\N	0935-09-28	\N	\N	\N	c. 911	\N	\N	\N	\N	/wiki/Wenceslaus_I,_Duke_of_Bohemia	found in Roman Martyrology	\N
1483	Valentine	\N	\N	\N	0269-02-14	\N	\N	\N	226	\N	\N	\N	\N	/wiki/Saint_Valentine	found in Roman Martyrology	\N
1466	Titus Brandsma	\N	\N	1881-02-23	1942-07-26	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Titus_Brandsma	\N	\N
1430	Theodore of Amasea	\N	\N	\N	0306-02-17	\N	\N	\N	200s	\N	\N	\N	\N	/wiki/Theodore_of_Amasea	found in Roman Martyrology	\N
1398	Stephen of Obazine	\N	\N	\N	1154-03-08	\N	\N	\N	1085	\N	\N	\N	\N	/wiki/Stephen_of_Obazine	1701 by Pope Clement XI	\N
1379	Simon Stock	\N	\N	\N	1265-05-16	\N	\N	\N	c. 1165	\N	\N	\N	\N	/wiki/Simon_Stock	\N	\N
1310	Robert of Molesme	\N	\N	\N	1111-04-17	\N	\N	\N	1028	\N	\N	\N	\N	/wiki/Robert_of_Molesme	1222 by Pope Honorius III	\N
1290	Rafqa Pietra Choboq Ar-Rayès	\N	\N	1832-06-29	1914-03-23	\N	\N	\N	\N	\N	2001-06-10	\N	\N	/wiki/Rafqa_Pietra_Choboq_Ar-Ray%C3%A8s	\N	\N
1252	Pope Sixtus II	\N	\N	\N	0258-08-06	\N	\N	\N	unknown	\N	\N	\N	\N	/wiki/Pope_Sixtus_II	found in Roman Martyrology	\N
1137	Peter Fourier	\N	\N	1565-11-30	1640-12-09	\N	\N	\N	\N	\N	1897-05-27	\N	\N	/wiki/Peter_Fourier	\N	\N
1103	Paul Ibaraki	\N	\N	\N	1597-02-05	\N	\N	t	1500s	\N	1862-06-08	\N	One of the 26 Martyrs of Japan	/w/index.php?title=Paul_Ibaraki&action=edit&redlink=1	\N	\N
1064	Odo of Cluny	\N	\N	\N	0942-11-18	\N	\N	\N	c. 880	\N	\N	\N	\N	/wiki/Odo_of_Cluny	found in Roman Martyrology	\N
896	Marcellin Champagnat	\N	\N	1789-05-20	1840-06-06	\N	\N	\N	\N	\N	1999-04-18	\N	Professed priest of the Society of Mary, Marist Missionaries; founder of the Marist Brothers of the Schools	/wiki/Marcellin_Champagnat	\N	\N
791	Julian of Mesopotamia	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Julian_of_Mesopotamia	found in Roman Martyrology	\N
811	Justin of Chieti	\N	\N	\N	\N	\N	\N	\N	unknown	200s, 300s, or 500s	\N	\N	\N	/wiki/Justin_of_Chieti	found in Roman Martyrology	\N
829	Leander of Seville	\N	\N	\N	\N	\N	\N	\N	c. 534	13 March 600 or 601	\N	\N	\N	/wiki/Leander_of_Seville	\N	\N
849	Longinus	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	\N	/wiki/Longinus	found in Roman Martyrology	\N
862	Lucius of Britain	\N	\N	\N	\N	\N	\N	\N	unknown	100s	\N	\N	\N	/wiki/Lucius_of_Britain	found in Roman Martyrology	\N
876	Luke the Evangelist	\N	\N	\N	\N	\N	\N	\N	unknown	March 84 AD	\N	\N	\N	/wiki/Luke_the_Evangelist	found in Roman Martyrology	\N
1019	Nabor of Rome	\N	\N	\N	\N	\N	\N	\N	200s	c. 303	\N	\N	\N	/wiki/Basilides,_Cyrinus,_Nabor_and_Nazarius	found in Roman Martyrology	\N
1070	Optatus	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Optatus	found in Roman Martyrology	\N
1087	Pantaleon	\N	\N	\N	\N	\N	\N	\N	c. 275	305	\N	\N	\N	/wiki/Saint_Pantaleon	found in Roman Martyrology	\N
1102	Paul the Apostle	\N	\N	\N	\N	\N	\N	\N	c. 5 AD	c. 64 or 67 AD	\N	\N	\N	/wiki/Paul_the_Apostle	found in Roman Martyrology	\N
1119	Pega	\N	\N	\N	\N	\N	\N	\N	c. 673	c.719	\N	\N	\N	/wiki/Pega	\N	\N
1134	Peter Damian	\N	\N	\N	\N	\N	\N	\N	c. 988	22 February 1072 or 1073	\N	\N	Doctor of the Church	/wiki/Peter_Damian	found in Roman Martyrology	\N
1151	Peter the Exorcist	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Marcellinus_and_Peter	found in Roman Martyrology	\N
1233	Pope Linus	\N	\N	\N	\N	\N	\N	\N	c. 10 AD	c. 76 AD	\N	\N	\N	/wiki/Pope_Linus	found in Roman Martyrology	\N
1266	Potentian	\N	\N	\N	\N	\N	\N	\N	300s	390	\N	\N	\N	/wiki/Savinian_and_Potentian	found in Roman Martyrology	\N
1279	Protus	\N	\N	\N	\N	\N	\N	\N	200s	c. 257-259	\N	\N	\N	/wiki/Protus_and_Hyacinth	found in Roman Martyrology	\N
1367	Sidonius Apollinaris	\N	\N	\N	\N	\N	\N	\N	c. 430	481/490	\N	\N	\N	/wiki/Sidonius_Apollinaris	\N	\N
1387	Spyridon	\N	\N	\N	\N	\N	\N	\N	c. 270	348	\N	\N	\N	/wiki/Saint_Spyridon	found in Roman Martyrology	\N
1437	Theodosia of Constantinople	\N	\N	\N	\N	\N	\N	\N	600s	700s	\N	\N	\N	/wiki/Theodosia_of_Constantinople	\N	\N
1494	Victoria	\N	\N	\N	\N	\N	\N	\N	200s	250	\N	\N	\N	/wiki/Victoria,_Anatolia,_and_Audax	found in Roman Martyrology	\N
1460	Thomas Rokuzayemon	\N	\N	\N	1634-11-17	\N	\N	t	1590	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Thomas_Rokuzayemon&action=edit&redlink=1	\N	\N
1328	Rose Venerini	\N	\N	1655-02-09	1728-05-07	\N	\N	\N	\N	\N	2006-10-15	\N	founder of the Religious Teachers Venerini (Venerini Sisters)	/wiki/Rose_Venerini	\N	\N
1311	Robert Lawrence	\N	\N	\N	1535-05-04	\N	\N	t	c. 1485	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Robert_Lawrence_(martyr)	\N	\N
1295	Raphael Kalinowski	\N	\N	1835-09-01	1907-11-15	\N	\N	\N	\N	\N	1991-11-17	\N	\N	/wiki/Raphael_Kalinowski	\N	\N
1214	Pope Gregory III	\N	\N	\N	0741-11-28	\N	\N	\N	600s	\N	\N	\N	\N	/wiki/Pope_Gregory_III	found in Roman Martyrology	\N
1202	Pope Damasus I	\N	\N	\N	0384-12-11	\N	\N	\N	c. 305	\N	\N	\N	\N	/wiki/Pope_Damasus_I	found in Roman Martyrology	\N
1182	Ponsiano Ngondwe	\N	\N	\N	1886-05-26	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Ponsiano_Ngondwe&action=edit&redlink=1	\N	\N
1169	Pietro I Orseolo	\N	\N	\N	0987-01-10	\N	\N	\N	928	\N	1731-04-18	\N	\N	/wiki/Pietro_I_Orseolo	\N	\N
1055	Nowa Mawaggali	\N	\N	\N	1886-05-31	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Nowa_Mawaggali&action=edit&redlink=1	\N	\N
1035	Nicholas Owen	\N	\N	\N	\N	\N	\N	t	c. 1562	1 or 2 March 1606	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Nicholas_Owen_(Jesuit)	\N	\N
1003	Michael de Sanctis	\N	\N	1591-09-29	1625-04-10	\N	\N	\N	\N	\N	1862-06-08	\N	\N	/wiki/Michael_de_Sanctis	\N	\N
969	Mary Magdalene de' Pazzi	\N	\N	1566-04-02	1607-05-25	\N	\N	\N	\N	\N	1669-04-28	\N	\N	/wiki/Mary_Magdalene_de%27_Pazzi	\N	\N
950	Mark the Evangelist	\N	\N	\N	1968-04-25	\N	\N	\N	5 AD	\N	\N	\N	\N	/wiki/Mark_the_Evangelist	found in Roman Martyrology	\N
931	Maria Soledad Torres y Acosta	\N	\N	1826-12-02	1887-10-11	\N	\N	\N	\N	\N	1970-01-25	\N	\N	/wiki/Maria_Soledad_Torres_y_Acosta	\N	\N
893	Malachy	\N	\N	\N	1148-11-02	\N	\N	\N	1094	\N	\N	\N	\N	/wiki/Saint_Malachy	1190 by Pope Clement III	\N
774	Joseph Volotsky	\N	\N	\N	1515-09-09	\N	\N	\N	1439 or 1440	\N	\N	\N	\N	/wiki/Joseph_Volotsky	1578 by Pope Gregory XIII	\N
758	José María Rubio	\N	\N	1864-07-22	1929-05-02	\N	\N	\N	\N	\N	2003-05-04	\N	\N	/wiki/Jos%C3%A9_Mar%C3%ADa_Rubio	\N	\N
742	John Plessington	\N	\N	\N	1679-07-19	\N	\N	t	c. 1637	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Plessington	\N	\N
725	John Neumann	\N	\N	1811-03-28	1860-01-05	\N	\N	\N	\N	\N	1977-06-19	\N	\N	/wiki/John_Neumann	\N	\N
711	John Eudes	\N	\N	1601-11-14	1680-08-19	\N	\N	\N	\N	\N	1925-05-31	\N	\N	/wiki/John_Eudes	\N	\N
697	Joan Elizabeth Bichier des Âges	\N	\N	1773-07-05	1838-08-26	\N	\N	\N	\N	\N	1947-07-06	\N	cofounder of the Sisters of the Cross	/wiki/Joan_Elizabeth_Bichier_des_%C3%82ges	\N	\N
682	Jan Sarkander	\N	\N	1576-12-20	1620-03-17	\N	\N	\N	\N	\N	1995-05-21	\N	\N	/wiki/Jan_Sarkander	\N	\N
648	Ignazia Verzeri	\N	\N	1801-07-31	1852-03-03	\N	\N	\N	\N	\N	2001-06-10	\N	founder of the Daughters of the Sacred Heart of Jesus	/wiki/Ignazia_Verzeri	\N	\N
1531	William Pinchon	\N	\N	\N	1234-07-29	\N	\N	\N	c. 1175	\N	1247-03-24	\N	\N	/wiki/William_Pinchon	\N	\N
1509	Virginia Centurione Bracelli	\N	\N	1587-04-02	1651-12-15	\N	\N	\N	\N	\N	2003-05-18	\N	\N	/wiki/Virginia_Centurione_Bracelli	\N	\N
1473	Ulrich of Augsburg	\N	\N	\N	0973-07-04	\N	\N	\N	893	\N	0993-07-04	\N	The first saint to be canonized not by a local authority but by the Pope.	/wiki/Ulrich_of_Augsburg	\N	\N
1421	Theobald of Marly	\N	\N	\N	1247-12-08	\N	\N	\N	1100s	\N	\N	\N	\N	/wiki/Theobald_of_Marly	\N	\N
1406	Tatwine	\N	\N	\N	0734-07-30	\N	\N	\N	c. 670	\N	\N	\N	\N	/wiki/Tatwine	\N	\N
1359	Seraphin of Montegranaro	\N	\N	\N	1604-10-12	\N	\N	\N	1540	\N	1767-07-16	\N	\N	/wiki/Seraphin_of_Montegranaro	\N	\N
1343	Sancha of Portugal	\N	\N	1264-02-02	\N	\N	\N	\N	\N	c. 1302	1705-05-10	\N	\N	/wiki/Sancha_of_Portugal_(born_1264)	\N	\N
1247	Pope Silverius	\N	\N	\N	0538-12-02	\N	\N	\N	400s	\N	\N	\N	\N	/wiki/Pope_Silverius	found in Roman Martyrology	\N
987	Mbaga Tuzinde	\N	\N	\N	1886-06-03	\N	\N	t	1800s	\N	1964-10-18	\N	One of the Uganda Martyrs	/w/index.php?title=Mbaga_Tuzinde&action=edit&redlink=1	\N	\N
913	Margaret Ward	\N	\N	\N	1588-08-30	\N	\N	t	c. 1550	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Margaret_Ward	\N	\N
665	Ivo of Kermartin	\N	\N	1253-10-17	1303-05-19	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Ivo_of_Kermartin	June 1347 by Pope Clement VI	\N
1269	Praxedes	\N	\N	\N	\N	\N	\N	\N	unknown	165	\N	\N	\N	/wiki/Praxedes	found in Roman Martyrology	\N
1282	Pudentiana	\N	\N	\N	\N	\N	\N	\N	unknown	100s	\N	\N	\N	/wiki/Pudentiana	found in Roman Martyrology	\N
1361	Serapia	\N	\N	\N	\N	\N	\N	\N	0's	c. 119	\N	\N	\N	/wiki/Saint_Serapia	found in Roman Martyrology	\N
1429	Theodore	\N	\N	\N	\N	\N	\N	\N	unknown	130	\N	\N	\N	/wiki/Theodore_and_Pausilippus	found in Roman Martyrology	\N
1447	Theophilus of Antioch	\N	\N	\N	\N	\N	\N	\N	100s	183-185	\N	\N	\N	/wiki/Theophilus_of_Antioch	found in Roman Martyrology	\N
1461	Timothy	\N	\N	\N	\N	\N	\N	\N	c. 17 AD	c. 97 AD	\N	\N	\N	/wiki/Saint_Timothy	found in Roman Martyrology	\N
1547	Zoe	\N	\N	\N	\N	\N	\N	\N	unknown	127	\N	\N	\N	/wiki/Exuperius_and_Zoe	found in Roman Martyrology	\N
1532	William of York	\N	\N	\N	1154-06-08	\N	\N	\N	1000s	\N	\N	\N	\N	/wiki/William_of_York	1227 by Pope Honorius III	\N
1508	Vincenza Gerosa	\N	\N	1784-10-29	1847-06-29	\N	\N	\N	\N	\N	1950-05-18	\N	Cofounder of the Sisters of Charity of Saint Bartolomea Capitanio and Vincenza Gerosa (Sisters of Holy Child Mary)	/wiki/Vincenza_Gerosa	\N	\N
1493	Vicenta María López i Vicuña	\N	\N	1847-03-24	1890-12-26	\N	\N	\N	\N	\N	1975-05-25	\N	\N	/wiki/Vicenta_Mar%C3%ADa_L%C3%B3pez_i_Vicu%C3%B1a	\N	\N
1475	Turibius of Mogrovejo	\N	\N	1538-11-16	1606-03-23	\N	\N	\N	\N	\N	1726-12-10	\N	archbishop of Lima	/wiki/Turibius_of_Mogrovejo	\N	\N
1411	Talarican	\N	\N	\N	\N	\N	\N	\N	700s	800s	1898-07-11	\N	\N	/wiki/Talarican	\N	\N
1394	Stephen of Cuneo	\N	\N	\N	1391-11-14	\N	\N	\N	1045	\N	1970-06-21	\N	Companion of Nicholas Tavelic	/w/index.php?title=Stephen_of_Cuneo&action=edit&redlink=1	\N	\N
1377	Simeon Stylites	\N	\N	\N	0459-09-02	\N	\N	\N	c. 390	\N	\N	\N	\N	/wiki/Simeon_Stylites	found in Roman Martyrology	\N
1338	Salomone Leclercq	\N	\N	1745-11-15	1792-09-02	\N	\N	\N	\N	\N	2016-10-16	\N	\N	/wiki/Salomone_Leclercq	\N	\N
1319	Romuald	\N	\N	\N	1027-06-19	\N	\N	\N	c. 951	\N	\N	\N	\N	/wiki/Romuald	1582 by Pope Gregory XIII	\N
1299	René Goupil	\N	\N	1608-05-15	1642-09-29	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Ren%C3%A9_Goupil	\N	\N
1251	Pope Sixtus III	\N	\N	\N	0440-08-18	\N	\N	\N	c. 390	\N	\N	\N	\N	/wiki/Pope_Sixtus_III	found in Roman Martyrology	\N
1230	Pope Leo IX	\N	\N	1002-06-21	1054-04-19	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Pope_Leo_IX	1082 by Pope Gregory VII	\N
146	Antoninus of Piacenza	\N	\N	\N	\N	\N	\N	\N	200s	303	\N	\N	\N	/wiki/Antoninus_of_Piacenza	found in Roman Martyrology	\N
164	Aredius	\N	\N	\N	\N	\N	\N	\N	c. 510	591	\N	\N	\N	/wiki/Aredius	\N	\N
181	Audifax	\N	\N	\N	\N	\N	\N	\N	200s	270	\N	\N	\N	/wiki/Marius,_Martha,_Audifax,_and_Abachum	found in Roman Martyrology	\N
197	Basil of Amasea	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Basil_of_Amasea	found in Roman Martyrology	\N
214	Benedict of Szkalka	\N	\N	\N	\N	\N	\N	\N	900s	1012	\N	\N	\N	/wiki/Benedict_of_Szkalka	1083 or 1085 by Pope Gregory VII	\N
248	Bretannio	\N	\N	\N	\N	\N	\N	\N	300s	380	\N	\N	\N	/wiki/Bretannio	found in Roman Martyrology	\N
277	Carpus of Beroea	\N	\N	\N	\N	\N	\N	\N	unknown	0s	\N	\N	\N	/wiki/Carpus_of_Beroea	found in Roman Martyrology	\N
345	Crescentius of Saragossa	\N	\N	\N	\N	\N	\N	\N	unknown	unknown	\N	\N	\N	/wiki/Martyrs_of_Zaragoza	found in Roman Martyrology	\N
361	Dalmatius of Pavia	\N	\N	\N	\N	\N	\N	\N	200s	254 or 304	\N	\N	\N	/wiki/Dalmatius_of_Pavia	found in Roman Martyrology	\N
377	Denis	\N	\N	\N	\N	\N	\N	\N	200s	250, 258, or 270	\N	\N	bishop of Paris	/wiki/Saint_Denis_of_Paris	found in Roman Martyrology	\N
435	Epiphanius of Salamis	\N	\N	\N	\N	\N	\N	\N	310–320	403	\N	\N	\N	/wiki/Epiphanius_of_Salamis	\N	\N
453	Eustace	\N	\N	\N	\N	\N	\N	t	0's	118	\N	\N	martyr and soldier	/wiki/Saint_Eustace	found in Roman Martyrology	\N
465	Faustinus	\N	\N	\N	\N	\N	\N	\N	unknown	120	\N	\N	\N	/wiki/Faustinus_and_Jovita	found in Roman Martyrology	\N
529	Gall	\N	\N	\N	\N	\N	\N	\N	550	646	\N	\N	\N	/wiki/Saint_Gall	\N	\N
580	Glyceria	\N	\N	\N	\N	\N	\N	\N	100s	177	\N	\N	\N	/wiki/Saint_Glyceria	found in Roman Martyrology	\N
600	Gregory the Illuminator	\N	\N	\N	\N	\N	\N	\N	c. 257	c. 331	\N	\N	\N	/wiki/Gregory_the_Illuminator	found in Roman Martyrology	\N
652	Irenaeus	\N	\N	\N	\N	\N	\N	\N	c. 130	c. 202	\N	\N	\N	/wiki/Irenaeus	found in Roman Martyrology	\N
737	John of Rome	\N	\N	\N	\N	\N	\N	\N	200s	304	\N	\N	\N	/wiki/John_and_Marcianus	found in Roman Martyrology	\N
787	Jude the Apostle	\N	\N	\N	\N	\N	\N	\N	0's	0's	\N	\N	also known as Jude Thaddeus	/wiki/Jude_the_Apostle	found in Roman Martyrology	\N
804	Justina of Padua	\N	\N	\N	\N	\N	\N	\N	200s	c. 304	\N	\N	\N	/wiki/Justina_of_Padua	found in Roman Martyrology	\N
889	Magnus of Cuneo	\N	\N	\N	\N	\N	\N	\N	unknown	200's	\N	\N	\N	/wiki/Magnus_of_Cuneo	found in Roman Martyrology	\N
958	Martina of Rome	\N	\N	\N	\N	\N	\N	\N	unknown	228	\N	\N	\N	/wiki/Martina_of_Rome	found in Roman Martyrology	\N
992	Meletius of Antioch	\N	\N	\N	\N	\N	\N	\N	300s	381	\N	\N	\N	/wiki/Meletius_of_Antioch	found in Roman Martyrology	\N
1006	Moses the Black	\N	\N	\N	\N	\N	\N	\N	330	405	\N	\N	\N	/wiki/Moses_the_Black	found in Roman Martyrology	\N
1028	Natalis	\N	\N	\N	\N	\N	\N	\N	unknown	700s	\N	\N	\N	/wiki/Natalis_(bishop_of_Milan)	\N	\N
1060	Odile of Alsace	\N	\N	\N	\N	\N	\N	\N	660	0720	\N	\N	\N	/wiki/Odile_of_Alsace	\N	\N
1076	Ovidius	\N	\N	\N	\N	\N	\N	\N	unknown	c. 135	\N	\N	\N	/wiki/Saint_Ovidius	\N	\N
1095	Patermutius	\N	\N	\N	\N	\N	\N	\N	unknown	300s	\N	\N	\N	/wiki/Patermutius	\N	\N
1114	Paulinus of Trier	\N	\N	\N	\N	\N	\N	\N	unknown	358	\N	\N	\N	/wiki/Paulinus_of_Trier	found in Roman Martyrology	\N
1162	Philip of Gortyna	\N	\N	\N	\N	\N	\N	\N	100s	180	\N	\N	\N	/wiki/Philip_of_Gortyna	found in Roman Martyrology	\N
1200	Pope Clement I	\N	\N	\N	\N	\N	\N	\N	c. 35 AD	99 AD	\N	\N	\N	/wiki/Pope_Clement_I	found in Roman Martyrology	\N
1131	Peter Chrysologus	\N	\N	\N	0450-07-31	\N	\N	\N	c. 380	\N	\N	\N	\N	/wiki/Peter_Chrysologus	found in Roman Martyrology	\N
1044	Nilus of Sinai	\N	\N	\N	0430-11-12	\N	\N	\N	300s	\N	\N	\N	\N	/wiki/Nilus_of_Sinai	found in Roman Martyrology	\N
973	Matthew Kohioye	\N	\N	\N	1633-10-19	\N	\N	t	1615	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/w/index.php?title=Matthew_Kohioye&action=edit&redlink=1	\N	\N
924	Maria Domenica Mantovani	\N	\N	1862-11-12	1934-02-02	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/Maria_Domenica_Mantovani	\N	\N
907	Margaret Mary Alacoque	\N	\N	1647-07-22	1690-10-17	\N	\N	\N	\N	\N	1920-05-13	\N	professed religious of the Visitation Nuns	/wiki/Margaret_Mary_Alacoque	\N	\N
871	Luigi Orione	\N	\N	1872-06-23	1940-03-12	\N	\N	\N	\N	\N	2004-05-16	\N	\N	/wiki/Luigi_Orione	\N	\N
854	Louis Ibaraki	\N	\N	\N	1597-02-05	\N	\N	t	c. 1585	\N	1862-06-08	\N	one of the 26 Martyrs of Japan	/w/index.php?title=Louis_Ibaraki&action=edit&redlink=1	\N	\N
837	Leopold III	\N	\N	\N	1136-11-15	\N	\N	\N	1073	\N	1485-01-06	\N	\N	/wiki/Leopold_III,_Margrave_of_Austria	\N	\N
821	Laura Montoya	\N	\N	1874-05-26	1949-10-21	\N	\N	\N	\N	\N	2013-05-12	\N	\N	/wiki/Laura_Montoya	\N	\N
770	Joseph of Anchieta, S.J.	\N	\N	1534-03-19	1597-06-09	\N	\N	\N	\N	\N	2014-04-03	\N	\N	/wiki/Joseph_of_Anchieta	\N	\N
754	Josaphat Kuntsevych	\N	\N	\N	1623-11-12	\N	\N	\N	c. 1580	\N	1867-06-29	\N	\N	/wiki/Josaphat_Kuntsevych	\N	\N
718	John Joseph of the Cross	\N	\N	1654-08-15	1739-03-05	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/John_Joseph_of_the_Cross	26 May 1839 by Pope Gregory XVI	\N
700	John Almond	\N	\N	\N	1612-12-05	\N	\N	t	c. 1577	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/John_Almond_(martyr)	\N	\N
684	Jean de Brébeuf	\N	\N	1593-03-25	1649-03-16	\N	\N	t	\N	\N	1930-06-29	\N	One of the Canadian Martyrs	/wiki/Jean_de_Br%C3%A9beuf	\N	\N
667	Jacob of Serugh	\N	\N	\N	0521-11-29	\N	\N	\N	c. 451	\N	\N	\N	\N	/wiki/Jacob_of_Serugh	\N	\N
634	Hugh of Lincoln	\N	\N	\N	1200-11-16	\N	\N	\N	1135-1140	\N	\N	\N	\N	/wiki/Hugh_of_Lincoln	17 February 1220 by Pope Honorius III	\N
618	Hermann Joseph	\N	\N	\N	1241-04-07	\N	\N	\N	c. 1150	\N	1958-08-11	\N	\N	/wiki/Hermann_Joseph	\N	\N
564	Gherardino Sostegni	\N	\N	\N	\N	\N	\N	\N	1200s	1200s	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/w/index.php?title=Gherardino_Sostegni&action=edit&redlink=1	\N	\N
511	Francis Solanus	\N	\N	1549-03-10	1610-07-14	\N	\N	\N	\N	\N	1726-12-27	\N	\N	/wiki/Francis_Solanus	\N	\N
495	Francesco Spinelli	\N	\N	1853-04-14	1913-02-06	\N	\N	\N	\N	\N	2018-10-14	\N	\N	/wiki/Francesco_Spinelli	\N	\N
475	Felix of Nicosia	\N	\N	1715-11-05	1787-05-31	\N	\N	\N	\N	\N	2005-10-23	\N	professed religious of the Franciscan Capuchins	/wiki/Felix_of_Nicosia	\N	\N
411	Edward the Martyr	\N	\N	\N	0978-03-18	\N	\N	\N	c. 962	\N	\N	\N	\N	/wiki/Edward_the_Martyr	found in Roman Martyrology	\N
395	Domingo Ibáñez de Erquicia	\N	\N	\N	1633-08-14	\N	\N	t	c.1589	\N	1987-10-18	\N	One of the 16 Martyrs of Japan	/wiki/Domingo_Ib%C3%A1%C3%B1ez_de_Erquicia	\N	\N
329	Colmán of Cloyne	\N	\N	0522-10-15	0600-11-24	\N	\N	\N	\N	\N	\N	\N	\N	/wiki/Colm%C3%A1n_of_Cloyne	\N	\N
314	Clare of Assisi	\N	\N	1194-07-16	1253-08-11	\N	\N	\N	\N	\N	1255-09-26	\N	\N	/wiki/Clare_of_Assisi	\N	\N
296	César de Bus	\N	\N	1544-02-03	1607-04-15	\N	\N	\N	\N	\N	2022-05-15	\N	\N	/wiki/C%C3%A9sar_de_Bus	\N	\N
260	Buonfiglio Monaldi	\N	\N	\N	1261-01-01	\N	\N	\N	1200s	\N	1888-01-15	\N	one of the Seven Holy Founders of the Servite Order	/w/index.php?title=Buonfiglio_Monaldi&action=edit&redlink=1	\N	\N
233	Bernat Calbó	\N	\N	\N	1243-10-26	\N	\N	\N	c. 1180	\N	1710-09-26	\N	\N	/wiki/Bernat_Calb%C3%B3	\N	\N
127	Anthony Maria Zaccaria	\N	\N	\N	1539-07-05	\N	\N	\N	1502	\N	1897-05-27	\N	\N	/wiki/Anthony_Maria_Zaccaria	\N	\N
109	Angela Merici	\N	\N	1474-03-21	1540-01-27	\N	\N	\N	\N	\N	1807-05-24	\N	\N	/wiki/Angela_Merici	\N	\N
67	Alonso de Orozco Mena	\N	\N	1500-10-17	1591-09-19	\N	\N	\N	\N	\N	2002-05-19	\N	\N	/wiki/Alonso_de_Orozco_Mena	\N	\N
1181	Polydore Plasden	\N	\N	\N	1591-12-10	\N	\N	t	1563	\N	1970-10-25	\N	one of the Forty Martyrs of England and Wales	/wiki/Polydore_Plasden	\N	\N
1147	Peter of Saint Joseph de Betancur	\N	\N	1626-03-21	1667-04-25	\N	\N	\N	\N	\N	2002-07-30	\N	\N	/wiki/Peter_of_Saint_Joseph_de_Betancur	\N	\N
543	Gemma Galgani	\N	\N	1878-03-12	1903-04-11	\N	\N	\N	\N	\N	1940-05-02	\N	\N	/wiki/Gemma_Galgani	\N	\N
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: anos
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
72c057a5-2ccb-472f-b970-f56a79b739b1	d7d4a9bb3fc52bad476345fa95afd47eb7ba7d6d4e190b601948867f953ddfc2	2023-02-10 12:18:50.231755+01	20230210103600_init	\N	\N	2023-02-10 12:18:50.217965+01	1
32ebb494-ff8f-48d0-bbad-251fa57b1cfc	cbec0f82120639a0d05dff36148673d913121c30f57a2734f8f3ee673108ce19	2023-02-10 22:32:52.460913+01	20230210213252_add_ambigious_date_of_canonization	\N	\N	2023-02-10 22:32:52.455797+01	1
075bd8f2-38f6-4009-9e04-4a6a5165400d	2ff9fa8d95a03b63dc84f11fb20ea1c36a0609d377e6d09d058f707e6def0aa4	2023-02-10 12:18:50.235407+01	20230210105634_add_saints_quotes_religiousorder	\N	\N	2023-02-10 12:18:50.23228+01	1
b9c0086f-23ff-4eaf-8bd0-ffa069b6e912	ec3476ee31a5e0f9d49f82357c4b8e712591ecb2f2d55a9fa7b933e47e8039f1	2023-02-10 12:18:50.238432+01	20230210110122_add_religious_order_type	\N	\N	2023-02-10 12:18:50.235992+01	1
a8f3815e-864b-477f-851e-deee94ca1d34	571a230e49966046fc8e1fffec445362940648a9564a7498fa666010d32f349c	2023-02-10 12:18:50.892708+01	20230210111850_handle_founding_saints_in_model	\N	\N	2023-02-10 12:18:50.887393+01	1
eed76a33-52b3-40d2-aab4-caa66a8ce3d6	d1984737ae6170cc64503677f465f356e338f005943bf689ba6065222566c8dd	2023-02-10 22:36:40.094826+01	20230210213640_make_religious_order_relation_and_was_martyred_optional	\N	\N	2023-02-10 22:36:40.088479+01	1
5c04a97d-19e9-434a-8e14-258580258590	fcd12aab0ca287e3bd41c49690b86e89fedfcce0bdc0883b5a3c6591fbeae6f5	2023-02-10 12:25:39.223666+01	20230210112539_add_saints_fields_neater_relation_names	\N	\N	2023-02-10 12:25:39.212782+01	1
fd004f17-be52-4f62-91e6-3160975d653f	7f19cb9fb6f0a065e9607b4b5a29f89883ff8ce43320977194f44da0d1ad00aa	2023-02-10 12:31:16.312262+01	20230210113116_add_canonization_date_and_ambigious_birth_dates	\N	\N	2023-02-10 12:31:16.308053+01	1
4df76392-c2bb-4b17-bbdc-ad858e67d9f4	dae12a1b12e247dd20a96e9024c441c631db1349ae28be58243a27247a2d756e	2023-02-10 12:32:48.889012+01	20230210113248_add_latin_feast_day	\N	\N	2023-02-10 12:32:48.88505+01	1
9e45befb-7364-4fe6-a414-1fe4e5b1f39f	82bc198cbcb80c0bb84507dc2853a129f22cfdd23c80108c20d454a4a38ca15b	2023-02-24 10:19:55.51832+01	20230224091955_add_country_code_to_saints_model	\N	\N	2023-02-24 10:19:55.512747+01	1
c3375351-cdb3-4c48-9139-31df2764358d	7a54abfb1ac9f7c289dc1878f86c58ef7d55e5d36dcb1abe31b8f2439ba8833c	2023-02-10 13:22:00.920196+01	20230210122200_add_notes_to_saint_model	\N	\N	2023-02-10 13:22:00.834339+01	1
5f45dc6b-7e4f-4995-9988-1c032783fbf5	75887762e74b489bf972693ff816a0b0df1f9118c0cbf84a81c09c50d755bb15	2023-02-10 13:30:33.201479+01	20230210123033_add_name_official_name_and_acronym_to_religious_order	\N	\N	2023-02-10 13:30:33.197379+01	1
027c5074-d775-453d-827b-9729e0d0a2bf	069cb006f8962b931ce467eb00eb0d7c564c9e1b4b97877557f1a9e22c5723cc	2023-02-10 15:40:27.294289+01	20230210144027_make_name_optional_official_name_required_on_religious_order	\N	\N	2023-02-10 15:40:27.272399+01	1
ca5dec77-e8cd-494f-a08c-659353928486	52762582a1e2c7b85eebf552213a2f888a4bf7b457e86d4a778e47bb26d255f4	2023-02-10 15:49:32.53287+01	20230210144932_make_founded_in_optional	\N	\N	2023-02-10 15:49:32.511828+01	1
9ab9bd57-4c3e-4525-8a2d-a052a39ceb56	74706bd5dae3a646219ce0fae4a417a2f59eb51cd3c5f0a95d20e93add560f57	2023-02-10 16:21:53.663366+01	20230210152153_add_wiki_link_field_on_saint_table	\N	\N	2023-02-10 16:21:53.659447+01	1
\.


--
-- Name: Quote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anos
--

SELECT pg_catalog.setval('public."Quote_id_seq"', 1, false);


--
-- Name: ReligiousOrder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anos
--

SELECT pg_catalog.setval('public."ReligiousOrder_id_seq"', 46, true);


--
-- Name: Saint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anos
--

SELECT pg_catalog.setval('public."Saint_id_seq"', 1550, true);


--
-- Name: Quote Quote_pkey; Type: CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Quote"
    ADD CONSTRAINT "Quote_pkey" PRIMARY KEY (id);


--
-- Name: ReligiousOrder ReligiousOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."ReligiousOrder"
    ADD CONSTRAINT "ReligiousOrder_pkey" PRIMARY KEY (id);


--
-- Name: Saint Saint_pkey; Type: CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Saint"
    ADD CONSTRAINT "Saint_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Quote Quote_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Quote"
    ADD CONSTRAINT "Quote_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."Saint"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Saint Saint_foundedReligiousOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Saint"
    ADD CONSTRAINT "Saint_foundedReligiousOrderId_fkey" FOREIGN KEY ("foundedReligiousOrderId") REFERENCES public."ReligiousOrder"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Saint Saint_religiousOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anos
--

ALTER TABLE ONLY public."Saint"
    ADD CONSTRAINT "Saint_religiousOrderId_fkey" FOREIGN KEY ("religiousOrderId") REFERENCES public."ReligiousOrder"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

