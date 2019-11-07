--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO aftech;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    user_id bigint,
    room_id bigint,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO aftech;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO aftech;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    lastname character varying,
    firstname character varying,
    zipcode character varying,
    area character varying,
    pref character varying,
    city character varying,
    street character varying,
    building character varying,
    phone character varying,
    quantity integer,
    shipment_complete boolean DEFAULT false,
    trailing_id character varying,
    user_id bigint,
    stock_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO aftech;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO aftech;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: postages; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.postages (
    id bigint NOT NULL,
    item_type character varying,
    company character varying,
    hokkaido integer,
    touhoku integer,
    kitatouhoku integer,
    minamitouhoku integer,
    hokuriku integer,
    shinetsu integer,
    kantou integer,
    tokyo integer,
    chubu integer,
    kansai integer,
    chugoku integer,
    shikoku integer,
    kyushu integer,
    kitakyushu integer,
    minamikyushu integer,
    okinawa integer,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    area character varying
);


ALTER TABLE public.postages OWNER TO aftech;

--
-- Name: postages_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.postages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.postages_id_seq OWNER TO aftech;

--
-- Name: postages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.postages_id_seq OWNED BY public.postages.id;


--
-- Name: product_items; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.product_items (
    id bigint NOT NULL,
    user_id bigint,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_items OWNER TO aftech;

--
-- Name: product_items_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.product_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_items_id_seq OWNER TO aftech;

--
-- Name: product_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.product_items_id_seq OWNED BY public.product_items.id;


--
-- Name: room_managers; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.room_managers (
    id bigint NOT NULL,
    user_id bigint,
    room_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    accessed_at timestamp without time zone
);


ALTER TABLE public.room_managers OWNER TO aftech;

--
-- Name: room_managers_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.room_managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_managers_id_seq OWNER TO aftech;

--
-- Name: room_managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.room_managers_id_seq OWNED BY public.room_managers.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    order_product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    posted_at timestamp without time zone
);


ALTER TABLE public.rooms OWNER TO aftech;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO aftech;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO aftech;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    quantity integer,
    shipment_week integer,
    remark text,
    salable timestamp without time zone,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    accept_order_count integer DEFAULT 0,
    pref character varying,
    area character varying,
    product_id bigint
);


ALTER TABLE public.stocks OWNER TO aftech;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO aftech;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: transport_companies; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.transport_companies (
    id bigint NOT NULL,
    user_id bigint,
    name integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.transport_companies OWNER TO aftech;

--
-- Name: transport_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.transport_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transport_companies_id_seq OWNER TO aftech;

--
-- Name: transport_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.transport_companies_id_seq OWNED BY public.transport_companies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: aftech
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    corporate_name character varying,
    lastname character varying,
    firstname character varying,
    lastname_phonetic character varying,
    firstname_phonetic character varying,
    email character varying,
    phone character varying,
    zipcode character varying,
    pref character varying,
    area character varying,
    city character varying,
    street character varying,
    building character varying,
    password_digest character varying,
    remember_digest character varying,
    activation_digest character varying,
    activated_at timestamp without time zone,
    activated boolean DEFAULT false,
    reset_digest character varying,
    reset_sent_at timestamp without time zone,
    admin boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO aftech;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: aftech
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO aftech;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aftech
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: postages id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.postages ALTER COLUMN id SET DEFAULT nextval('public.postages_id_seq'::regclass);


--
-- Name: product_items id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.product_items ALTER COLUMN id SET DEFAULT nextval('public.product_items_id_seq'::regclass);


--
-- Name: room_managers id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.room_managers ALTER COLUMN id SET DEFAULT nextval('public.room_managers_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: transport_companies id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.transport_companies ALTER COLUMN id SET DEFAULT nextval('public.transport_companies_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-08-02 01:39:25.6553	2018-08-02 01:39:25.6553
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.messages (id, user_id, room_id, content, created_at, updated_at) FROM stdin;
1	9	2	お世話になっております。\r\n収穫配送作業いつもありがとうございます。\r\n\r\n一件新規のご注文がありまして、\r\n11月29日指定で配送お願いできますでしょうか？\r\n\r\nどうぞよろしくお願いいたします。	2018-11-26 11:03:56.988906	2018-11-26 11:03:56.988906
2	9	4	いつも収穫、発送ありがとうございます！\r\n\r\n12/7 12:20\r\nお客様の要望により数量を「１」から「２」に変更しております。\r\n\r\nお手数ですが、ご対応宜しくお願い致します。\r\n\r\n小幡	2018-12-07 12:22:09.445795	2018-12-07 12:22:09.445795
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.messages_id_seq', 2, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.orders (id, lastname, firstname, zipcode, area, pref, city, street, building, phone, quantity, shipment_complete, trailing_id, user_id, stock_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Data for Name: postages; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.postages (id, item_type, company, hokkaido, touhoku, kitatouhoku, minamitouhoku, hokuriku, shinetsu, kantou, tokyo, chubu, kansai, chugoku, shikoku, kyushu, kitakyushu, minamikyushu, okinawa, user_id, created_at, updated_at, area) FROM stdin;
26	2	Jp	2000	1500	1500	1500	1400	1400	1500	1500	1400	1400	1400	1400	1400	\N	\N	1900	12	2018-09-17 13:40:28.249816	2018-09-17 13:40:28.249816	Kansai
27	20	Yamato	1800	\N	1400	1300	1100	1200	1200	\N	1100	1100	1100	1200	1200	\N	\N	1700	9	2018-10-16 17:27:07.33395	2018-10-16 17:27:07.33395	Kantou
28	21	Yamato	1000	\N	1000	1000	1000	1000	1000	\N	1000	1000	1000	1000	1000	\N	\N	1000	9	2018-10-17 17:09:00.125567	2018-10-17 17:09:00.125567	Kantou
29	1	Yamato	2110	\N	1610	1610	1210	1410	1140	\N	1210	1110	1010	1110	800	\N	\N	2010	14	2018-11-01 01:05:24.527018	2018-11-01 01:05:24.527018	Kyushu
30	22	Yamato	1800	\N	1800	1800	1800	1800	1800	\N	1800	1800	1800	1800	1800	\N	\N	1800	9	2018-11-05 09:41:44.007625	2018-11-05 09:41:44.007625	Kantou
32	32	Yamato	1000	\N	1000	1000	1000	1000	1000	\N	1000	1000	1000	1000	1000	\N	\N	1000	9	2018-11-10 16:49:29.403389	2018-11-10 16:49:29.403389	Kantou
33	45	Sagawa	1420	\N	1200	1198	1100	1030	1150	\N	1040	940	930	940	\N	830	880	1880	19	2018-11-26 14:43:27.808329	2018-11-26 14:43:27.808329	Kyushu
35	1	Jp	1480	1140	1140	1140	1050	1050	1050	1050	970	970	970	970	1050	\N	\N	1380	17	2018-11-26 19:36:45.139824	2018-11-26 19:36:45.139824	Kansai
36	29	Yamato	1447	\N	1123	1015	907	907	907	\N	907	907	1015	1015	1123	\N	\N	1339	20	2018-12-27 10:58:12.781072	2018-12-27 10:58:12.781072	Chubu
37	20	Jp	2000	2000	2000	2000	2000	2000	2000	2000	2000	2000	2000	2000	2000	\N	\N	2000	21	2019-01-05 09:30:14.777662	2019-01-05 09:30:14.777662	Kansai
38	29	Yamato	1242	\N	1134	1026	918	918	918	\N	918	918	1026	1134	1134	1134	1242	2200	20	2019-01-08 08:19:15.916772	2019-01-08 08:19:15.916772	error
39	25	Yamato	1242	\N	1134	1026	918	918	918	\N	918	918	1026	1134	1134	\N	\N	2200	20	2019-01-08 08:19:57.237861	2019-01-08 08:19:57.237861	error
31	24	Jp	1380	1040	1040	1040	950	950	950	950	870	870	870	870	950	\N	\N	1280	17	2018-11-09 19:40:05.914291	2019-02-09 09:39:40.256591	Kansai
34	59	Jp	1480	1140	1140	1140	1050	1050	1050	1050	970	970	970	970	1050	\N	\N	1380	17	2018-11-26 19:34:51.678096	2019-02-09 09:40:08.13602	Kansai
40	62	Yamato	0	\N	0	0	0	0	0	\N	0	0	0	0	0	\N	\N	0	9	2019-04-29 16:29:38.105157	2019-04-29 16:29:38.105157	Kantou
17	1	Yamato	100	\N	100	100	100	100	100	\N	100	100	100	100	100	\N	\N	100	10	2018-08-03 04:08:09.624659	2019-04-29 16:39:19.474422	Kantou
18	1	Yamato	100	\N	100	100	100	100	100	\N	100	100	100	100	100	\N	\N	100	10	2018-08-03 04:08:10.188958	2019-04-29 16:39:19.481989	Kantou
20	1	Jp	1800	1300	\N	\N	1200	1300	1300	1300	1200	1200	1200	1200	1300	\N	\N	1700	12	2018-08-04 06:42:29.985112	2019-04-29 16:39:19.486041	Kansai
21	1	Sagawa	1600	\N	1050	1050	750	750	750	\N	750	750	800	900	1050	1050	1050	1600	13	2018-08-04 09:07:24.52626	2019-04-29 16:39:19.4898	Hokuriku
25	1	Yamato	2500	\N	1400	1400	1200	1200	1200	\N	1200	1100	1000	1200	1200	\N	\N	2700	16	2018-08-09 01:26:25.375091	2019-04-29 16:39:19.493681	Chugoku
24	1	Yamato	1080	\N	756	648	648	648	648	\N	648	756	864	972	1080	\N	\N	1296	15	2018-08-07 13:31:15.923426	2019-04-29 16:39:19.497593	Shinetsu
22	1	Yamato	2110	1300	1610	1610	1210	1410	1140	1000	1210	1110	1010	1110	800	\N	\N	2010	14	2018-08-04 14:31:05.554662	2019-04-29 16:39:19.501237	Kyushu
\.


--
-- Name: postages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.postages_id_seq', 40, true);


--
-- Data for Name: product_items; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.product_items (id, user_id, product_id, created_at, updated_at) FROM stdin;
9	12	2	2018-09-17 11:46:08.403631	2018-09-17 11:46:08.403631
12	12	4	2018-09-23 11:57:58.571119	2018-09-23 11:57:58.571119
15	12	7	2018-09-23 18:35:09.397441	2018-09-23 18:35:09.397441
17	12	9	2018-09-23 18:50:53.851745	2018-09-23 18:50:53.851745
18	12	10	2018-09-23 19:05:44.796298	2018-09-23 19:05:44.796298
19	12	11	2018-09-23 19:10:23.853899	2018-09-23 19:10:23.853899
20	12	12	2018-09-26 09:47:26.077463	2018-09-26 09:47:26.077463
21	12	13	2018-09-26 11:18:43.432701	2018-09-26 11:18:43.432701
22	12	14	2018-10-08 12:19:41.869116	2018-10-08 12:19:41.869116
23	12	15	2018-10-08 12:24:12.189751	2018-10-08 12:24:12.189751
24	12	16	2018-10-08 14:12:49.414959	2018-10-08 14:12:49.414959
25	12	17	2018-10-08 14:18:09.358388	2018-10-08 14:18:09.358388
26	12	18	2018-10-08 14:30:00.616429	2018-10-08 14:30:00.616429
29	9	21	2018-10-17 17:06:30.912992	2018-10-17 17:06:55.994913
27	9	19	2018-10-08 14:54:06.763127	2018-10-23 14:09:29.678094
30	9	22	2018-11-03 09:32:32.750927	2018-11-03 09:32:32.750927
35	12	26	2018-11-04 18:54:03.567891	2018-11-04 18:54:03.567891
36	9	28	2018-11-05 01:39:08.055182	2018-11-05 01:39:08.055182
38	9	31	2018-11-06 20:26:39.839488	2018-11-06 20:26:39.839488
42	9	35	2018-11-10 19:24:29.730402	2018-11-10 19:24:29.730402
44	9	38	2018-11-10 20:04:22.081774	2018-11-10 20:04:22.081774
47	9	43	2018-11-10 21:26:06.315649	2018-11-10 21:26:06.315649
50	12	44	2018-11-21 17:07:17.536967	2018-11-21 17:07:17.536967
54	12	47	2018-11-23 13:03:38.158636	2018-11-23 13:16:31.704926
56	9	32	2018-11-28 10:05:42.32947	2018-11-28 10:05:42.32947
37	20	29	2018-11-06 19:43:53.925172	2018-12-10 16:01:09.680711
60	12	48	2018-12-19 15:15:00.744554	2018-12-19 15:15:00.744554
61	12	50	2018-12-19 15:26:43.749525	2018-12-19 15:26:43.749525
62	12	52	2018-12-19 15:46:18.121794	2018-12-19 15:46:18.121794
63	12	53	2018-12-19 17:03:52.284376	2018-12-19 17:03:52.284376
64	20	25	2018-12-22 10:51:01.206955	2018-12-22 10:51:01.206955
59	12	5	2018-12-17 11:40:12.771893	2018-12-27 10:31:53.617045
16	12	8	2018-09-23 18:48:47.104316	2018-12-27 10:32:03.57522
10	12	3	2018-09-17 12:14:50.722983	2018-12-27 10:32:15.612414
14	12	6	2018-09-23 18:33:14.798747	2018-12-27 10:32:25.637234
28	21	20	2018-10-16 17:25:22.037216	2019-01-09 10:14:28.326226
65	12	45	2019-01-16 13:48:12.477153	2019-01-16 13:48:12.477153
66	12	46	2019-01-16 13:48:30.409341	2019-01-16 13:48:30.409341
67	12	33	2019-01-16 13:49:04.555983	2019-01-16 13:49:04.555983
68	12	39	2019-01-16 13:49:33.045469	2019-01-16 13:49:33.045469
69	12	42	2019-01-16 13:49:52.280352	2019-01-16 13:49:52.280352
43	12	37	2018-11-10 19:42:00.316006	2019-01-16 13:50:04.145267
70	12	54	2019-01-25 23:49:02.087415	2019-01-25 23:49:02.087415
71	12	56	2019-01-26 10:17:49.478869	2019-01-26 10:17:49.478869
72	12	57	2019-01-29 20:01:32.422577	2019-01-29 20:01:32.422577
73	12	58	2019-01-29 20:16:46.374421	2019-01-29 20:16:46.374421
8	17	1	2018-09-17 10:15:04.472167	2019-02-05 10:26:59.808777
74	12	1	2019-02-05 10:30:50.541831	2019-02-05 10:30:50.541831
75	17	59	2019-02-05 10:39:50.92474	2019-02-05 10:39:50.92474
76	9	60	2019-02-11 14:01:17.383163	2019-02-11 14:01:17.383163
77	9	61	2019-02-11 14:02:26.592847	2019-02-11 14:02:26.592847
78	9	62	2019-02-11 15:46:26.740561	2019-02-11 15:46:26.740561
79	9	63	2019-02-11 15:47:53.188278	2019-02-11 15:47:53.188278
80	9	64	2019-02-11 15:48:50.455656	2019-02-11 15:48:50.455656
81	9	65	2019-02-11 15:50:24.745285	2019-02-11 15:50:24.745285
82	9	66	2019-02-11 15:52:12.261304	2019-02-11 15:52:12.261304
83	9	67	2019-02-11 15:55:34.770603	2019-02-11 15:55:34.770603
84	9	68	2019-02-11 16:01:12.575693	2019-02-11 16:01:12.575693
85	9	69	2019-02-11 18:15:46.340323	2019-02-11 18:15:46.340323
86	9	70	2019-02-11 18:16:48.245584	2019-02-11 18:16:48.245584
87	9	71	2019-02-11 18:18:40.318307	2019-02-11 18:18:40.318307
88	9	72	2019-02-12 19:43:27.685653	2019-02-12 19:43:27.685653
89	9	73	2019-02-12 20:12:52.354204	2019-02-12 20:12:52.354204
90	9	74	2019-02-12 20:14:37.500534	2019-02-12 20:14:37.500534
91	9	75	2019-02-12 20:16:37.531525	2019-02-12 20:16:37.531525
92	9	76	2019-02-14 14:49:22.082914	2019-02-14 14:49:22.082914
93	9	77	2019-02-14 16:12:22.801495	2019-02-14 16:12:22.801495
94	9	78	2019-02-14 16:16:43.520076	2019-02-14 16:16:43.520076
95	9	79	2019-02-14 16:35:42.684476	2019-02-14 16:36:21.747804
96	9	80	2019-02-14 16:40:48.928593	2019-02-14 16:40:48.928593
97	12	81	2019-02-19 15:42:40.374392	2019-02-19 15:42:40.374392
99	9	4	2019-02-27 21:19:30.134577	2019-02-27 21:19:30.134577
101	9	26	2019-02-27 21:27:34.700422	2019-02-27 21:27:34.700422
102	9	25	2019-02-27 21:33:20.758875	2019-02-27 21:33:20.758875
103	9	5	2019-03-11 16:25:07.084389	2019-03-11 16:25:07.084389
104	9	20	2019-03-18 18:12:37.501317	2019-03-18 18:12:37.501317
105	9	56	2019-03-25 17:55:04.376284	2019-03-25 17:55:04.376284
106	12	83	2019-03-31 13:21:52.709673	2019-03-31 13:21:52.709673
107	12	84	2019-03-31 13:29:39.021478	2019-03-31 13:29:39.021478
108	9	85	2019-04-02 13:17:59.738241	2019-04-02 13:17:59.738241
109	12	86	2019-04-09 13:58:06.951213	2019-04-09 13:58:06.951213
110	12	87	2019-04-20 20:36:33.741074	2019-04-20 20:36:33.741074
111	15	24	2019-04-23 21:53:00.898772	2019-04-23 21:53:00.898772
113	17	88	2019-05-14 10:02:40.712857	2019-05-14 10:02:40.712857
114	12	89	2019-05-15 22:18:07.374954	2019-05-15 22:18:07.374954
115	12	90	2019-05-23 19:54:24.187679	2019-05-23 19:54:24.187679
116	12	91	2019-05-23 20:00:26.805005	2019-05-23 20:00:26.805005
118	12	92	2019-05-25 11:01:07.186828	2019-05-25 11:01:07.186828
119	12	93	2019-05-25 11:07:56.664881	2019-05-25 11:07:56.664881
120	17	94	2019-05-28 08:31:47.620097	2019-05-28 08:31:47.620097
\.


--
-- Name: product_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.product_items_id_seq', 120, true);


--
-- Data for Name: room_managers; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.room_managers (id, user_id, room_id, created_at, updated_at, accessed_at) FROM stdin;
1	9	1	2018-11-25 21:53:50.690915	2018-11-25 21:53:50.771251	2018-11-25 21:53:50.767642
3	9	2	2018-11-26 11:01:35.441745	2018-11-26 11:01:35.502286	2018-11-26 11:01:35.499545
5	9	3	2018-11-28 14:00:29.478448	2018-11-28 14:00:29.528353	2018-11-28 14:00:29.526397
4	16	2	2018-11-26 11:01:35.448204	2018-12-13 06:06:50.204311	2018-12-13 06:06:50.202159
13	9	7	2019-01-11 16:13:14.371803	2019-01-11 16:13:14.435319	2019-01-11 16:13:14.432617
7	9	4	2018-12-07 12:13:25.195944	2019-02-16 16:00:47.568509	2019-02-16 16:00:47.56508
9	9	5	2018-12-20 12:39:36.733643	2019-02-16 16:01:02.358674	2019-02-16 16:01:02.35658
10	12	5	2018-12-20 12:39:36.740535	2019-04-08 17:18:19.45049	2019-04-08 17:18:19.448045
12	12	6	2018-12-22 18:13:24.87339	2019-04-08 17:18:24.634785	2019-04-08 17:18:24.63232
14	12	7	2019-01-11 16:13:14.386212	2019-04-08 17:18:33.132131	2019-04-08 17:18:33.130176
8	15	4	2018-12-07 12:13:25.20261	2019-05-10 21:53:40.743847	2019-05-10 21:53:40.741129
6	15	3	2018-11-28 14:00:29.486748	2019-05-10 21:53:51.754934	2019-05-10 21:53:51.753017
2	15	1	2018-11-25 21:53:50.699043	2019-05-10 21:54:01.62281	2019-05-10 21:54:01.620539
11	9	6	2018-12-22 18:13:24.866321	2019-06-03 12:31:21.657298	2019-06-03 12:31:21.653711
\.


--
-- Name: room_managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.room_managers_id_seq', 14, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.rooms (id, order_product_id, created_at, updated_at, posted_at) FROM stdin;
1	66	2018-11-25 21:53:50.677821	2018-11-25 21:53:50.677821	\N
2	1970	2018-11-26 11:01:35.438021	2018-11-26 11:03:56.993685	2018-11-26 11:03:56.988906
3	2170	2018-11-28 14:00:29.474261	2018-11-28 14:00:29.474261	\N
4	2414	2018-12-07 12:13:25.191795	2018-12-07 12:22:09.450521	2018-12-07 12:22:09.445795
5	2653	2018-12-20 12:39:36.72985	2018-12-20 12:39:36.72985	\N
6	2609	2018-12-22 18:13:24.85225	2018-12-22 18:13:24.85225	\N
7	2830	2019-01-11 16:13:14.366834	2019-01-11 16:13:14.366834	\N
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.rooms_id_seq', 7, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.schema_migrations (version) FROM stdin;
20180728071200
20180728071943
20180728071956
20180728072326
20180731082239
20180916025744
20180916030959
20180916074405
20180916093501
20181120121321
20181121014448
20181121022654
20181123081801
20181123101655
20181227034800
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.stocks (id, quantity, shipment_week, remark, salable, user_id, created_at, updated_at, accept_order_count, pref, area, product_id) FROM stdin;
1003	50	23		2019-06-03 00:00:00	21	2019-06-05 14:40:29.411074	2019-06-05 14:40:29.411074	0	滋賀県	Kansai	20
188	10	44		2018-10-29 00:00:00	15	2018-11-03 14:55:34.510474	2018-11-03 14:55:34.510474	0	長野県	Shinetsu	24
45	56	34	沖縄中長ゴーヤ、コリンキー（サラダかぼちゃ）、トマト、紫ジャガイモ、甘長ししとう、真黒ナス、さきがけピーマン、淡路島玉ねぎ、モロヘイヤ、ズッキーニ,芳香青じそ、丸いんげん、バジル、西洋かぼちゃ、バターナッツかぼちゃ、金糸瓜、マクワウリ、きゅうり	2018-08-20 00:00:00	12	2018-08-04 07:09:28.664426	2018-09-17 11:16:40.377385	14	兵庫県	Kansai	1
436	8	3		2019-01-14 00:00:00	12	2019-01-15 15:37:19.658105	2019-01-16 01:27:38.381075	2	兵庫県	Kansai	6
43	67	32	沖縄中長ゴーヤ、コリンキー（サラダかぼちゃ）、トマト、紫ジャガイモ、甘長ししとう、真黒ナス、さきがけピーマン、淡路島玉ねぎ、モロヘイヤ、ズッキーニ、黄色ズッキーニ、芳香青じそ、丸いんげん、バジル、西洋かぼちゃ、バターナッツかぼちゃ、金糸瓜、マクワウリ、きゅうり	2018-08-06 00:00:00	12	2018-08-04 06:56:19.818928	2018-09-17 11:16:40.384248	3	兵庫県	Kansai	1
46	10	32	1．キュウリ・自家採種2年・固定種（バテシラズ）\r\n2．ピーマン\t（F1種、または三重ピーマン固定種）\t\t\r\n3．万願寺とうがらし・自家採種5年・固定種\t\t\t\r\n4．スターオフデビット・自家採種5年・固定種\t\r\n5．オクラ・自家採種5年・固定種\t\r\n6．まくわ瓜\r\n7．空心菜\t\t\t\r\n8．ニンニク　自家採種5年\t\t\t\r\n9．モロヘイヤ・自家採種5年・固定種\t\r\nうち7~9品目\r\n	2018-08-06 00:00:00	14	2018-08-04 14:42:28.244153	2018-09-17 11:16:40.391426	0	大分県	Kyushu	1
440	13	3		2019-01-14 00:00:00	12	2019-01-15 15:38:14.421007	2019-01-17 21:50:26.848497	2	兵庫県	Kansai	4
40	0	32	ナス\r\nトマト	2018-08-06 00:00:00	10	2018-08-03 04:12:23.163852	2018-09-17 11:16:40.41062	0	千葉県	Kantou	1
50	5	32	神田四葉キュウリ\r\n八丈オクラ\r\nさきがけピーマン\r\n沖縄あばしゴーヤ\r\nアンデスレッド\r\n	2018-08-06 00:00:00	16	2018-08-09 01:31:02.501076	2018-09-17 11:16:40.417055	0	岡山県	Chugoku	1
48	1	32	ナス3種\r\nピーマン4種\r\nミニトマト\r\n中玉トマト\r\nマイクロトマト\r\nゴーヤ\r\n八町きゅうり\r\n空芯菜（少し）\r\nケール（少し）\r\nセルバチコ\r\nルッコラ\r\nサラダミックス\r\n玉ねぎ\r\n赤玉ねぎ\r\nニンニク\r\nバジル\r\n青紫蘇\r\nエディブルフラワー	2018-08-06 00:00:00	15	2018-08-07 13:33:51.16956	2018-09-17 11:16:40.432608	4	長野県	Shinetsu	1
49	13	33	ナス11種、ピーマン5種、唐辛子2種、ミニトマト数種、中玉トマト数種、マイクロトマト、ゴーヤ、四葉きゅうり、八町きゅうり、オクラ2種、ズッキーニ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも4種、かぼちゃ、玉ねぎ、赤玉ねぎ、大豆、ニンニク、バジル、青紫蘇、エディブルフラワー\r\n\r\n	2018-08-13 00:00:00	15	2018-08-07 13:35:27.583108	2018-09-17 11:16:40.438797	2	長野県	Shinetsu	1
54	6	33	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．ピーマン\t（F1種、または三重ピーマン固定種）\t3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 7．空心菜\t8．ニンニク　自家採種5年\t9．モロヘイヤ・自家採種5年・固定種\t10．ツルムラサキ　11．かぼちゃ　うち7~9品目	2018-08-13 00:00:00	14	2018-08-14 12:35:06.40813	2018-09-17 11:16:40.44521	0	大分県	Kyushu	1
51	14	34	ナス11種、ピーマン5種、唐辛子2種、ミニトマト数種、中玉トマト数種、マイクロトマト、ゴーヤ、四葉きゅうり、八町きゅうり、オクラ2種、ズッキーニ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも4種、かぼちゃ、玉ねぎ、赤玉ねぎ、大豆、ニンニク、バジル、青紫蘇、エディブルフラワー	2018-08-20 00:00:00	15	2018-08-12 13:32:17.080251	2018-09-17 11:16:40.464906	6	長野県	Shinetsu	1
56	9	35	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．ピーマン\t（F1種、または三重ピーマン固定種）\t3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 7．空心菜\t8．ニンニク　自家採種5年\t9．モロヘイヤ・自家採種5年・固定種\t10．ツルムラサキ　11．かぼちゃ　うち7~9品目	2018-08-27 00:00:00	14	2018-08-14 12:38:29.738656	2018-09-17 11:16:40.473328	1	大分県	Kyushu	1
132	2	42		2018-10-15 00:00:00	12	2018-10-16 14:34:17.324763	2018-10-16 14:34:17.324763	0	兵庫県	Kansai	7
39	20	31	トマト\r\nナス	2018-07-30 00:00:00	10	2018-08-03 04:09:59.733803	2018-09-17 11:16:40.362222	0	千葉県	Kantou	1
42	29	31	沖縄中長ゴーヤ、コリンキー（サラダかぼちゃ）、トマト、紫ジャガイモ、\r\n甘長ししとう、真黒ナス、さきがけピーマン、淡路島玉ねぎ、モロヘイヤ、\r\nズッキーニ、黄色ズッキーニ、芳香青じそ、丸いんげん	2018-07-30 00:00:00	12	2018-08-04 06:55:36.364248	2018-09-17 11:16:40.370923	1	兵庫県	Kansai	1
47	10	31	1．キュウリ・自家採種2年・固定種（バテシラズ）\r\n2．ピーマン\t（F1種、または三重ピーマン固定種）\t\t\r\n3．万願寺とうがらし・自家採種5年・固定種\t\t\t\r\n4．スターオフデビット・自家採種5年・固定種\t\r\n5．オクラ・自家採種5年・固定種\t\r\n6．まくわ瓜\r\n7．空心菜\t\t\t\r\n8．ニンニク　自家採種5年\t\t\t\r\n9．モロヘイヤ・自家採種5年・固定種\t\r\nうち6~8品目	2018-07-30 00:00:00	14	2018-08-04 14:43:39.14825	2018-09-17 11:16:40.397896	0	大分県	Kyushu	1
52	15	35	ナス11種、ピーマン5種、唐辛子2種、ミニトマト数種、中玉トマト数種、マイクロトマト、ゴーヤ、四葉きゅうり、八町きゅうり、オクラ2種、ズッキーニ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも4種、かぼちゃ、玉ねぎ、赤玉ねぎ、大豆、ニンニク、バジル、青紫蘇、エディブルフラワー	2018-08-27 00:00:00	15	2018-08-12 13:32:43.464532	2018-09-17 11:16:40.423553	5	長野県	Shinetsu	1
55	9	34	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．ピーマン\t（F1種、または三重ピーマン固定種）\t3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 7．空心菜\t8．ニンニク　自家採種5年\t9．モロヘイヤ・自家採種5年・固定種\t10．ツルムラサキ　11．かぼちゃ　うち7~9品目	2018-08-20 00:00:00	14	2018-08-14 12:38:15.572459	2018-09-17 11:16:40.459009	1	大分県	Kyushu	1
133	2	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:34:33.83803	2018-10-16 14:34:33.83803	0	兵庫県	Kansai	12
134	3	42		2018-10-15 00:00:00	12	2018-10-16 14:34:44.307252	2018-10-16 14:34:44.307252	0	兵庫県	Kansai	6
136	5	42		2018-10-15 00:00:00	12	2018-10-16 14:38:35.327017	2018-10-16 14:38:35.327017	0	兵庫県	Kansai	3
135	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:37:35.480729	2018-10-21 17:30:40.843158	2	兵庫県	Kansai	2
992	50	23		2019-06-03 00:00:00	12	2019-05-30 17:46:24.60348	2019-05-30 17:46:24.60348	0	兵庫県	Kansai	50
61	1	36	玉ねぎ、赤玉ネギ、バターナッツ、日本かぼちゃ、打木赤皮甘栗かぼちゃ、モロヘイヤ、オクラ、紫ジャガイモ、バジル\r\n玉ねぎチップス、バジルハーブティー	2018-09-03 00:00:00	12	2018-08-29 09:20:45.115094	2018-09-17 11:16:40.513272	19	兵庫県	Kansai	1
160	10	43		2018-10-22 00:00:00	12	2018-10-22 22:03:20.955086	2018-10-22 22:03:20.955086	0	兵庫県	Kansai	10
161	10	43		2018-10-22 00:00:00	12	2018-10-22 22:04:39.413645	2018-10-22 22:04:39.413645	0	兵庫県	Kansai	11
44	55	33	沖縄中長ゴーヤ、コリンキー（サラダかぼちゃ）、トマト、紫ジャガイモ、甘長ししとう、真黒ナス、さきがけピーマン、淡路島玉ねぎ、モロヘイヤ、ズッキーニ,芳香青じそ、丸いんげん、バジル、西洋かぼちゃ、バターナッツかぼちゃ、金糸瓜、マクワウリ、きゅうり	2018-08-13 00:00:00	12	2018-08-04 07:06:28.306768	2018-09-17 11:16:40.486272	15	兵庫県	Kansai	1
59	1	37	\r\n：ナス各種、ピーマン各種、唐辛子、ミニトマト、中玉トマト、マイクロトマト、ゴーヤ、きゅうり、オクラ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも、かぼちゃ、玉ねぎ、赤玉ねぎ、大豆、ニンニク、バジル、青紫蘇、エディブルフラワー	2018-09-10 00:00:00	15	2018-08-27 23:54:27.495335	2018-09-17 11:16:40.527422	12	長野県	Shinetsu	1
62	2	37	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．真黒ナス・自家採種5年・固定種　3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 　7．冬瓜　自家採種5年・固定種　8．ニンニク　自家採種5年\t9．．ツルムラサキ　10．かぼちゃ　うち7~8品目	2018-09-10 00:00:00	14	2018-09-07 00:12:30.344741	2018-09-17 11:16:40.548038	0	大分県	Kyushu	1
60	18	35	玉ねぎ、赤玉ネギ、真黒ナス、バターナッツ、日本かぼちゃ、打木赤皮甘栗かぼちゃ、モロヘイヤ、ズッキーニ、オクラ、紫ジャガイモ、バジル\r\n玉ねぎチップス、バジルハーブティー	2018-08-27 00:00:00	12	2018-08-29 09:19:35.153318	2018-09-17 11:16:40.492924	2	兵庫県	Kansai	1
63	5	38	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．真黒ナス・自家採種5年・固定種　3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 　7．冬瓜　自家採種5年・固定種　8．ニンニク　自家採種5年\t9．．ツルムラサキ　10．かぼちゃ　11. 栗　12．空芯菜　13．カボスうち7~8品目	2018-09-17 00:00:00	14	2018-09-09 19:24:57.453859	2018-09-18 22:00:53.658561	0	大分県	Kyushu	1
58	1	36	\r\n：ナス各種、ピーマン各種、唐辛子、ミニトマト、中玉トマト、マイクロトマト、ゴーヤ、きゅうり、オクラ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも、かぼちゃ、玉ねぎ、赤玉ねぎ、大豆、ニンニク、バジル、青紫蘇、エディブルフラワー	2018-09-03 00:00:00	15	2018-08-27 23:54:06.644694	2018-09-17 11:16:40.499118	14	長野県	Shinetsu	1
71	6	39	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．真黒ナス・自家採種5年・固定種　3．万願寺とうがらし・自家採種5年・固定種 4．スターオフデビット・自家採種5年・固定種 5．オクラ・自家採種5年・固定種\t6．まくわ瓜 　7．冬瓜　自家採種5年・固定種　8．ニンニク　自家採種5年\t9．．ツルムラサキ　10．かぼちゃ　11. 栗　12．空芯菜　13．カボスうち7~8品目	2018-09-24 00:00:00	14	2018-09-18 22:01:44.700936	2018-09-18 22:01:44.700936	0	大分県	Kyushu	1
66	0	37	玉ねぎ、赤玉ねぎ、紫じゃがいも、日本かぼちゃ、バターナッツかぼちゃ、ナス、ローザビアンカ （ナス）、モロヘイヤ、オクラ、玉ねぎチップス、バジルティー	2018-09-10 00:00:00	12	2018-09-11 17:46:44.111888	2018-09-17 11:16:40.534497	15	兵庫県	Kansai	1
57	1	36	1．キュウリ・自家採種2年・固定種（バテシラズ） 2．真黒ナス・自家採種5年・固定種　3．万願寺とうがらし・自家採種5年・固定種\t4．スターオフデビット・自家採種5年・固定種\t5．オクラ・自家採種5年・固定種\t6．まくわ瓜 　7．冬瓜　自家採種5年・固定種　8．ニンニク　自家採種5年\t9．．ツルムラサキ　10．かぼちゃ　うち7~8品目	2018-09-03 00:00:00	14	2018-08-21 05:06:45.512731	2018-09-17 11:16:40.541538	1	大分県	Kyushu	1
77	3	38	モロヘイヤ、オクラ、玉ねぎ、じゃがいも、ナス、かぼちゃ	2018-09-17 00:00:00	12	2018-09-23 20:02:28.017261	2018-09-23 20:02:54.92432	0	兵庫県	Kansai	10
68	0	38	モロヘイヤ、オクラ、ナス、安納芋、玉ねぎ、じゃがいも、インゲン、日本かぼちゃ、バターナッツかぼちゃ	2018-09-17 00:00:00	12	2018-09-17 13:25:55.901226	2018-09-18 19:58:20.255791	10	兵庫県	Kansai	1
67	5	38	モロヘイヤ、オクラ、ナス、安納芋、玉ねぎ、じゃがいも、インゲン、日本かぼちゃ、バターナッツかぼちゃ	2018-09-17 00:00:00	12	2018-09-17 13:25:24.955903	2018-09-21 22:19:52.987528	5	兵庫県	Kansai	2
73	5	38	モロヘイヤ、玉ねぎ、じゃがいも、ナス、オクラ、かぼちゃ	2018-09-17 00:00:00	12	2018-09-23 12:01:44.451287	2018-09-23 20:02:43.706019	0	兵庫県	Kansai	4
75	2	38		2018-09-17 00:00:00	12	2018-09-23 19:10:42.392873	2018-09-23 19:10:42.392873	0	兵庫県	Kansai	6
72	5	38		2018-09-17 00:00:00	12	2018-09-19 11:09:14.505839	2018-09-23 19:09:14.655656	1	兵庫県	Kansai	3
76	2	38		2018-09-17 00:00:00	12	2018-09-23 19:10:54.073873	2018-09-23 19:10:54.073873	0	兵庫県	Kansai	8
64	1	38	枝豆、ラディッシュ、間引き菜各種、ナス各種、ピーマン各種、唐辛子、ゴーヤ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、赤玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-09-17 00:00:00	15	2018-09-10 10:53:07.099108	2018-09-23 19:23:33.251057	22	長野県	Shinetsu	1
78	3	38		2018-09-17 00:00:00	12	2018-09-23 20:04:52.082477	2018-09-23 20:05:20.38344	0	兵庫県	Kansai	5
79	3	38	モロヘイヤ、オクラ、玉ねぎ、じゃがいも、ナス、かぼちゃ	2018-09-17 00:00:00	12	2018-09-23 20:07:10.033207	2018-09-23 20:07:10.033207	0	兵庫県	Kansai	11
80	1	40	枝豆、ラディッシュ、間引き菜各種、ナス各種、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、赤玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-10-01 00:00:00	15	2018-09-24 12:31:12.28701	2018-10-03 15:23:00.299308	2	長野県	Shinetsu	1
83	5	39		2018-09-24 00:00:00	12	2018-09-25 07:46:13.370426	2018-09-25 07:46:13.370426	0	兵庫県	Kansai	3
84	5	39	モロヘイヤ、オクラ、ナス、玉ねぎ、じゃがいも、	2018-09-24 00:00:00	12	2018-09-25 07:46:39.096574	2018-09-25 07:46:39.096574	0	兵庫県	Kansai	2
85	5	39	モロヘイヤ、オクラ、ナス、玉ねぎ、じゃがいも	2018-09-24 00:00:00	12	2018-09-25 07:47:14.126563	2018-09-25 07:47:14.126563	0	兵庫県	Kansai	4
86	5	39		2018-09-24 00:00:00	12	2018-09-25 07:47:44.9863	2018-09-25 07:47:44.9863	0	兵庫県	Kansai	5
87	3	39	モロヘイヤ、オクラ、ナス、玉ねぎ、じゃがいも	2018-09-24 00:00:00	12	2018-09-25 07:48:17.0964	2018-09-25 07:48:17.0964	0	兵庫県	Kansai	10
88	3	39	モロヘイヤ、オクラ、ナス、玉ねぎ、じゃがいも	2018-09-24 00:00:00	12	2018-09-25 07:49:32.429559	2018-09-25 07:49:32.429559	0	兵庫県	Kansai	11
90	3	39		2018-09-24 00:00:00	12	2018-09-30 15:59:14.817564	2018-09-30 15:59:14.817564	0	兵庫県	Kansai	8
128	4	42		2018-10-15 00:00:00	12	2018-10-16 14:33:22.785825	2018-10-21 18:43:06.599078	1	兵庫県	Kansai	5
106	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:13:02.615321	2018-10-09 19:13:02.615321	0	兵庫県	Kansai	17
107	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:13:23.122005	2018-10-09 19:13:23.122005	0	兵庫県	Kansai	16
82	1	39	モロヘイヤ、オクラ、ナス、玉ねぎ、じゃがいも、かぼちゃ	2018-09-24 00:00:00	12	2018-09-25 07:45:57.147496	2018-09-30 17:35:05.504353	9	兵庫県	Kansai	1
92	5	40		2018-10-01 00:00:00	14	2018-10-01 07:50:04.5467	2018-10-01 07:50:04.5467	0	大分県	Kyushu	1
108	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:13:57.490009	2018-10-09 19:13:57.490009	0	兵庫県	Kansai	14
109	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:14:13.934668	2018-10-09 19:14:13.934668	0	兵庫県	Kansai	15
94	5	40	玉ねぎ、オクラ、安納芋、ナス、かぼちゃ、青パプリカなど	2018-10-01 00:00:00	12	2018-10-02 20:20:46.822295	2018-10-02 20:20:46.822295	0	兵庫県	Kansai	4
89	1	39		2018-09-24 00:00:00	12	2018-09-28 15:07:48.62694	2018-09-28 15:07:48.62694	0	兵庫県	Kansai	6
110	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:14:42.401226	2018-10-09 19:14:42.401226	0	兵庫県	Kansai	18
95	5	40	玉ねぎ、オクラ、安納芋、ナス、かぼちゃ、青パプリカなど	2018-10-01 00:00:00	12	2018-10-02 20:21:20.372792	2018-10-02 20:21:20.372792	0	兵庫県	Kansai	2
65	1	39	枝豆、ラディッシュ、間引き菜各種、ナス各種、ピーマン各種、唐辛子、ゴーヤ、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、赤玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-09-24 00:00:00	15	2018-09-10 23:26:51.769815	2018-09-29 19:57:32.644374	10	長野県	Shinetsu	1
96	5	40		2018-10-01 00:00:00	12	2018-10-02 20:25:35.009405	2018-10-02 20:25:35.009405	0	兵庫県	Kansai	3
97	5	40		2018-10-01 00:00:00	12	2018-10-02 20:25:45.850871	2018-10-02 20:25:45.850871	0	兵庫県	Kansai	5
98	3	40		2018-10-01 00:00:00	12	2018-10-02 20:26:37.351911	2018-10-02 20:26:37.351911	0	兵庫県	Kansai	6
99	3	40		2018-10-01 00:00:00	12	2018-10-02 20:26:45.441717	2018-10-02 20:26:45.441717	0	兵庫県	Kansai	8
111	3	41		2018-10-08 00:00:00	12	2018-10-09 19:15:21.765665	2018-10-09 19:15:21.765665	0	兵庫県	Kansai	19
81	1	41	枝豆、ラディッシュ、間引き菜各種、ナス各種、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、赤玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-10-08 00:00:00	15	2018-09-24 12:32:14.308244	2018-10-08 11:59:54.435845	1	長野県	Shinetsu	1
93	3	41		2018-10-08 00:00:00	14	2018-10-01 07:50:21.432492	2018-10-09 07:24:32.671288	2	大分県	Kyushu	1
100	5	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:03:18.486344	2018-10-09 19:09:05.699782	0	兵庫県	Kansai	2
101	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:09:26.724315	2018-10-09 19:09:26.724315	0	兵庫県	Kansai	10
102	5	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:09:54.702669	2018-10-09 19:09:54.702669	0	兵庫県	Kansai	4
103	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:10:24.634458	2018-10-09 19:10:30.564915	0	兵庫県	Kansai	11
105	3	41		2018-10-08 00:00:00	12	2018-10-09 19:12:26.142828	2018-10-09 19:12:26.142828	0	兵庫県	Kansai	6
113	3	41		2018-10-08 00:00:00	12	2018-10-09 19:17:33.834902	2018-10-09 19:17:33.834902	0	兵庫県	Kansai	13
114	3	41		2018-10-08 00:00:00	12	2018-10-09 19:18:01.752502	2018-10-09 19:18:01.752502	0	兵庫県	Kansai	8
189	0	45		2018-11-05 00:00:00	9	2018-11-05 01:40:03.464328	2018-11-05 01:48:36.667755	4	東京都	Kantou	28
116	2	41		2018-10-08 00:00:00	12	2018-10-09 19:18:22.74163	2018-10-09 19:18:22.74163	0	兵庫県	Kansai	7
117	2	41		2018-10-08 00:00:00	12	2018-10-09 19:20:15.542666	2018-10-09 19:20:15.542666	0	兵庫県	Kansai	9
118	3	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:20:35.607494	2018-10-09 19:20:42.586799	0	兵庫県	Kansai	12
165	2	43		2018-10-22 00:00:00	12	2018-10-22 22:12:27.017224	2018-10-28 20:35:17.934545	3	兵庫県	Kansai	6
122	5	41		2018-10-08 00:00:00	12	2018-10-09 19:27:19.213565	2018-10-09 19:27:19.213565	0	兵庫県	Kansai	3
123	5	41		2018-10-08 00:00:00	12	2018-10-09 19:27:35.887894	2018-10-09 19:27:35.887894	0	兵庫県	Kansai	5
112	1	41	玉ねぎ、オクラ、紫サツマイモ、ナス、小かぶ、葉大根など	2018-10-08 00:00:00	12	2018-10-09 19:16:49.951647	2018-10-14 22:28:50.724913	7	兵庫県	Kansai	1
124	3	42		2018-10-15 00:00:00	12	2018-10-15 11:24:24.6678	2018-10-15 11:24:24.6678	0	兵庫県	Kansai	15
126	2	42		2018-10-15 00:00:00	12	2018-10-16 14:32:53.792877	2018-10-16 14:32:53.792877	0	兵庫県	Kansai	9
127	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:33:10.092703	2018-10-16 14:33:10.092703	0	兵庫県	Kansai	17
170	19	43		2018-10-22 00:00:00	9	2018-10-25 20:21:05.555348	2018-10-25 20:58:51.37919	1	東京都	Kantou	21
130	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:33:47.656946	2018-10-16 14:33:47.656946	0	兵庫県	Kansai	16
131	2	42		2018-10-15 00:00:00	12	2018-10-16 14:33:58.473199	2018-10-16 14:33:58.473199	0	兵庫県	Kansai	8
137	5	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:39:17.459692	2018-10-16 14:39:17.459692	0	兵庫県	Kansai	4
141	3	42		2018-10-15 00:00:00	12	2018-10-16 14:43:19.009212	2018-10-16 14:43:19.009212	0	兵庫県	Kansai	13
143	5	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:43:52.585572	2018-10-16 14:43:52.585572	0	兵庫県	Kansai	18
154	5	43		2018-10-22 00:00:00	12	2018-10-22 14:48:11.041982	2018-10-22 14:48:11.041982	0	兵庫県	Kansai	3
186	17	44		2018-10-29 00:00:00	9	2018-11-03 09:59:31.761742	2018-11-03 11:28:53.766429	3	東京都	Kantou	22
192	10	45		2018-11-05 00:00:00	12	2018-11-05 08:33:44.185933	2018-11-05 08:33:44.185933	0	兵庫県	Kansai	3
166	14	43		2018-10-22 00:00:00	9	2018-10-23 14:30:10.215386	2018-10-25 22:18:37.502198	6	東京都	Kantou	19
150	14	43	コーラルリーフ(サラダわさび菜)、ラディッシュ、小かぶ、日野菜、玉ねぎ、バターナッツ、日本かぼちゃ	2018-10-22 00:00:00	12	2018-10-22 13:28:46.835363	2018-10-28 22:22:49.717462	40	兵庫県	Kansai	1
195	10	45		2018-11-05 00:00:00	12	2018-11-05 08:34:46.131325	2018-11-05 08:34:46.131325	0	兵庫県	Kansai	6
151	1	43		2018-10-22 00:00:00	12	2018-10-22 14:47:20.815053	2018-10-23 18:50:18.267657	4	兵庫県	Kansai	2
233	5	46		2018-11-12 00:00:00	12	2018-11-14 08:32:50.276432	2018-11-18 19:17:52.909917	5	兵庫県	Kansai	24
206	20	45		2018-11-05 00:00:00	9	2018-11-10 18:41:48.585757	2018-11-10 18:41:48.585757	0	東京都	Kantou	33
204	0	45		2018-11-05 00:00:00	12	2018-11-10 10:26:23.947986	2018-11-11 21:40:01.604114	10	兵庫県	Kansai	1
208	20	45		2018-11-05 00:00:00	9	2018-11-10 19:45:51.59501	2018-11-10 19:45:51.59501	0	東京都	Kantou	37
210	10	45		2018-11-05 00:00:00	9	2018-11-10 20:42:54.823984	2018-11-10 20:42:54.823984	0	東京都	Kantou	39
1004	10	23		2019-06-03 00:00:00	9	2019-06-05 14:41:24.438664	2019-06-05 14:41:24.438664	0	東京都	Kantou	75
437	10	3		2019-01-14 00:00:00	12	2019-01-15 15:37:30.314339	2019-01-15 15:37:30.314339	0	兵庫県	Kansai	5
438	10	3		2019-01-14 00:00:00	12	2019-01-15 15:37:39.852559	2019-01-15 15:37:39.852559	0	兵庫県	Kansai	8
171	0	43	大根、小松菜、水菜、さつまいも、長ネギ、九条ネギ、春菊、枝豆、ラディッシュ、間引き菜各種、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-10-22 00:00:00	15	2018-10-27 10:51:26.612185	2018-10-28 22:07:06.35296	10	長野県	Shinetsu	1
230	50	46		2018-11-12 00:00:00	12	2018-11-12 17:29:19.997486	2018-11-12 17:29:19.997486	0	兵庫県	Kansai	25
196	8	45		2018-11-05 00:00:00	9	2018-11-05 09:31:14.148104	2018-11-11 14:00:23.552033	7	東京都	Kantou	22
201	0	46	春菊・ミニ人参・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-11-12 00:00:00	17	2018-11-09 19:45:06.500114	2018-11-12 20:41:02.149524	5	京都府	Kansai	1
193	7	45		2018-11-05 00:00:00	12	2018-11-05 08:33:59.048075	2018-11-11 14:31:12.065499	3	兵庫県	Kansai	5
179	5	44		2018-10-29 00:00:00	12	2018-10-29 09:52:41.248275	2018-11-01 12:49:04.561706	24	兵庫県	Kansai	4
175	5	44		2018-10-29 00:00:00	12	2018-10-29 09:51:42.558813	2018-11-01 12:49:21.515572	8	兵庫県	Kansai	8
177	5	44		2018-10-29 00:00:00	12	2018-10-29 09:52:06.478874	2018-11-01 12:49:41.441656	9	兵庫県	Kansai	6
236	29	46		2018-11-12 00:00:00	9	2018-11-14 14:51:23.515338	2018-11-14 14:52:46.937383	1	東京都	Kantou	22
199	29	45		2018-11-05 00:00:00	9	2018-11-06 19:44:53.143166	2018-11-14 18:03:38.530388	23	東京都	Kantou	29
168	2	44	1．枝豆・自家採種5年・固定種（青大豆） \r\n2．かぼちゃ・自家採種2年・固定種（宿儺かぼちゃ）\r\n3．万願寺とうがらし・自家採種5年・固定種 \r\n4．さつま芋・自家採種5年・固定種 (金時芋、安納芋、または紅はるか）\r\n5．里芋・自家採種5年・固定種(赤芽、大和、大野または土垂）\r\n6．小松菜（固定種）\r\n7．冬瓜　自家採種5年・固定種　(姫冬瓜）\r\n8．ジャンボニンニク　自家採種5年・固定種\r\n9．ツルムラサキ　\r\n10．コカブ・固定種（みやまコカブ）\r\n11．チンゲン菜・固定種\r\n12．カボス　\r\n13．銀杏\r\nうち7~9品目	2018-10-29 00:00:00	14	2018-10-24 00:50:10.365411	2018-11-01 23:14:33.163076	7	大分県	Kyushu	1
173	0	44		2018-10-29 00:00:00	12	2018-10-29 07:09:21.006824	2018-11-02 14:33:48.154095	60	兵庫県	Kansai	1
238	6	46		2018-11-12 00:00:00	9	2018-11-14 18:32:18.984714	2018-11-15 17:06:20.712975	2	東京都	Kantou	31
190	9	45		2018-11-05 00:00:00	15	2018-11-05 08:31:45.160296	2018-11-10 11:24:16.872264	31	長野県	Shinetsu	1
247	20	47		2018-11-19 00:00:00	12	2018-11-19 09:42:45.119474	2018-11-19 09:42:45.119474	0	兵庫県	Kansai	11
251	50	47		2018-11-19 00:00:00	9	2018-11-19 09:56:30.707386	2018-11-19 09:56:30.707386	0	東京都	Kantou	20
244	19	47		2018-11-19 00:00:00	12	2018-11-19 09:42:04.605602	2018-11-25 11:49:09.809154	1	兵庫県	Kansai	8
252	0	47	城南小松菜、中葉春菊、のらぼう菜、飛騨紅カブ、紅芯大根、冬越黒田五寸人参、日本ほうれん草、さきがけピーマン、大野芋、	2018-11-19 00:00:00	16	2018-11-19 22:11:08.192992	2018-11-25 09:28:41.139465	8	岡山県	Chugoku	1
241	19	47		2018-11-19 00:00:00	12	2018-11-19 09:41:20.672042	2018-11-21 08:56:52.188769	1	兵庫県	Kansai	3
254	1	49	春菊・ミニ人参・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-12-03 00:00:00	17	2018-11-21 07:32:42.658124	2018-12-09 23:53:52.645083	6	京都府	Kansai	1
258	20	47		2018-11-19 00:00:00	9	2018-11-21 16:07:44.614568	2018-11-21 16:07:44.614568	0	東京都	Kantou	31
242	13	47		2018-11-19 00:00:00	12	2018-11-19 09:41:37.977243	2018-11-25 09:29:01.832041	7	兵庫県	Kansai	5
261	7	47		2018-11-19 00:00:00	9	2018-11-21 17:40:21.90193	2018-11-23 10:44:18.501613	3	東京都	Kantou	45
260	7	47		2018-11-19 00:00:00	15	2018-11-21 17:13:43.336089	2018-11-23 10:15:18.630647	3	長野県	Shinetsu	44
262	7	47		2018-11-19 00:00:00	9	2018-11-21 17:40:37.968177	2018-11-23 10:43:29.576011	3	東京都	Kantou	46
259	5	47		2018-11-19 00:00:00	12	2018-11-21 17:13:07.041476	2018-11-25 10:15:12.169485	5	兵庫県	Kansai	44
249	18	47		2018-11-19 00:00:00	12	2018-11-19 09:54:48.87749	2018-11-25 10:53:26.921559	2	兵庫県	Kansai	25
245	16	47		2018-11-19 00:00:00	12	2018-11-19 09:42:25.544254	2018-11-25 11:53:49.200946	4	兵庫県	Kansai	2
255	0	50	春菊・にんじん・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-12-10 00:00:00	17	2018-11-21 07:33:51.630645	2018-12-16 14:57:56.539622	11	京都府	Kansai	1
256	0	51	春菊・にんじん・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-12-17 00:00:00	17	2018-11-21 07:35:15.525224	2018-12-18 19:56:34.200836	7	京都府	Kansai	1
138	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:39:45.336086	2018-10-16 14:39:45.336086	0	兵庫県	Kansai	14
142	3	42		2018-10-15 00:00:00	12	2018-10-16 14:43:32.758411	2018-10-16 14:43:32.758411	0	兵庫県	Kansai	19
144	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:44:06.352347	2018-10-16 14:44:06.352347	0	兵庫県	Kansai	10
146	3	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:44:26.770328	2018-10-16 14:44:26.770328	0	兵庫県	Kansai	11
147	20	42		2018-10-15 00:00:00	9	2018-10-16 17:27:19.479649	2018-10-16 17:27:19.479649	0	東京都	Kantou	20
149	1	42	大根、小松菜、水菜、さつまいも、長ネギ、九条ネギ、春菊、枝豆、ラディッシュ、間引き菜各種、空芯菜、ケール、セルバチコ、ルッコラ、サラダミックス、じゃがいも各種、かぼちゃ、里芋、玉ねぎ、大豆、小豆、白インゲン、ニンニク、フルーツ鬼灯、エディブルフラワー	2018-10-15 00:00:00	15	2018-10-17 22:57:37.634705	2018-10-17 23:00:04.533731	0	長野県	Shinetsu	1
169	26	43		2018-10-22 00:00:00	9	2018-10-24 14:33:56.212871	2018-10-28 09:48:54.379183	8	東京都	Kantou	20
148	31	42		2018-10-15 00:00:00	9	2018-10-17 17:09:27.579642	2018-10-21 14:20:33.227704	9	東京都	Kantou	21
152	1	43		2018-10-22 00:00:00	12	2018-10-22 14:47:37.231907	2018-10-28 20:10:09.626967	4	兵庫県	Kansai	4
187	3	44		2018-10-29 00:00:00	9	2018-11-03 10:05:58.669483	2018-11-03 19:49:43.813482	7	東京都	Kantou	1
125	2	42	小かぶ、日野菜、コーラルリーフ、玉ねぎ、かぼちゃ類など	2018-10-15 00:00:00	12	2018-10-16 14:32:38.127553	2018-10-21 21:33:32.419817	17	兵庫県	Kansai	1
194	10	45		2018-11-05 00:00:00	12	2018-11-05 08:34:25.654165	2018-11-05 08:34:25.654165	0	兵庫県	Kansai	8
229	10	46		2018-11-12 00:00:00	12	2018-11-12 17:28:17.658413	2018-11-12 17:28:17.658413	0	兵庫県	Kansai	6
180	5	44		2018-10-29 00:00:00	12	2018-10-29 09:52:55.506824	2018-10-29 09:52:55.506824	0	兵庫県	Kansai	11
215	1	46	春菊・ミニ人参・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-11-12 00:00:00	17	2018-11-11 23:20:00.507476	2018-11-18 19:25:38.405318	6	京都府	Kansai	24
155	2	43		2018-10-22 00:00:00	12	2018-10-22 14:48:23.174492	2018-10-23 18:57:07.087011	3	兵庫県	Kansai	8
181	4	44		2018-10-29 00:00:00	9	2018-10-29 16:18:54.675413	2018-10-29 16:19:25.306933	1	東京都	Kantou	19
167	1	43	1．枝豆・自家採種5年・固定種（青大豆） \r\n2．かぼちゃ・自家採種2年・固定種（宿儺かぼちゃ）\r\n3．万願寺とうがらし・自家採種5年・固定種 \r\n4．さつま芋・自家採種5年・固定種 (金時芋、安納芋、または紅はるか）\r\n5．里芋・自家採種5年・固定種(赤芽、大和、大野または土垂）\r\n6．小松菜（固定種）\r\n7．冬瓜　自家採種5年・固定種　(姫冬瓜）\r\n8．ジャンボニンニク　自家採種5年・固定種\r\n9．ツルムラサキ　\r\n10．コカブ・固定種（みやまコカブ）\r\n11．チンゲン菜・固定種\r\n12．カボス　\r\n13．銀杏\r\nうち7~9品目	2018-10-22 00:00:00	14	2018-10-24 00:40:25.218558	2018-10-24 07:41:44.673767	4	大分県	Kyushu	1
198	48	45		2018-11-05 00:00:00	12	2018-11-06 19:26:39.284867	2018-11-08 12:51:01.755368	2	兵庫県	Kansai	25
153	4	43		2018-10-22 00:00:00	12	2018-10-22 14:47:59.875197	2018-10-25 07:46:05.952796	1	兵庫県	Kansai	5
231	20	46		2018-11-12 00:00:00	12	2018-11-12 17:40:18.885214	2018-11-12 17:40:18.885214	0	兵庫県	Kansai	26
212	1	46		2018-11-12 00:00:00	15	2018-11-11 23:17:35.123627	2018-11-12 09:51:52.681203	4	長野県	Shinetsu	24
197	27	45		2018-11-05 00:00:00	12	2018-11-06 19:21:39.196657	2018-11-10 16:02:36.8961	3	兵庫県	Kansai	26
205	25	45		2018-11-05 00:00:00	9	2018-11-10 16:50:18.712033	2018-11-10 16:50:18.712033	0	東京都	Kantou	32
207	20	45		2018-11-05 00:00:00	9	2018-11-10 19:27:09.547463	2018-11-10 19:27:09.547463	0	東京都	Kantou	35
176	2	44		2018-10-29 00:00:00	12	2018-10-29 09:51:55.880082	2018-10-31 23:51:29.26489	8	兵庫県	Kansai	3
209	10	45		2018-11-05 00:00:00	9	2018-11-10 20:42:45.218547	2018-11-10 20:42:45.218547	0	東京都	Kantou	38
211	10	45		2018-11-05 00:00:00	9	2018-11-10 20:43:03.057485	2018-11-10 20:43:03.057485	0	東京都	Kantou	42
191	0	45		2018-11-05 00:00:00	15	2018-11-05 08:31:55.990857	2018-11-10 23:44:32.35858	10	長野県	Shinetsu	24
178	5	44		2018-10-29 00:00:00	12	2018-10-29 09:52:24.144569	2018-11-01 12:49:12.326218	12	兵庫県	Kansai	2
217	10	46		2018-11-12 00:00:00	12	2018-11-12 15:10:32.437364	2018-11-12 15:10:32.437364	0	兵庫県	Kansai	11
218	10	46		2018-11-12 00:00:00	12	2018-11-12 15:11:00.934107	2018-11-12 15:11:00.934107	0	兵庫県	Kansai	5
174	3	44		2018-10-29 00:00:00	12	2018-10-29 09:51:26.649095	2018-11-01 20:07:12.854417	9	兵庫県	Kansai	5
182	1	44		2018-10-29 00:00:00	15	2018-10-30 15:36:19.095857	2018-11-02 15:04:26.542649	68	長野県	Shinetsu	1
225	10	46		2018-11-12 00:00:00	12	2018-11-12 15:14:09.63374	2018-11-12 15:14:09.63374	0	兵庫県	Kansai	8
439	13	3		2019-01-14 00:00:00	12	2019-01-15 15:38:00.474991	2019-01-18 12:24:51.678717	2	兵庫県	Kansai	2
235	0	46		2018-11-12 00:00:00	16	2018-11-14 09:35:03.832022	2018-11-16 23:14:33.054676	2	岡山県	Chugoku	24
222	7	46		2018-11-12 00:00:00	12	2018-11-12 15:11:54.892521	2018-11-15 15:09:42.848081	3	兵庫県	Kansai	2
219	9	46		2018-11-12 00:00:00	12	2018-11-12 15:11:20.590308	2018-11-18 21:07:40.718046	1	兵庫県	Kansai	3
200	8	45		2018-11-05 00:00:00	9	2018-11-07 18:51:31.122454	2018-11-14 18:31:18.256657	7	東京都	Kantou	31
435	8	3		2019-01-14 00:00:00	12	2019-01-15 15:37:09.937206	2019-01-20 00:10:12.185428	2	兵庫県	Kansai	3
228	8	46		2018-11-12 00:00:00	12	2018-11-12 17:27:16.638379	2018-11-15 12:09:56.170655	2	兵庫県	Kansai	4
237	20	46		2018-11-12 00:00:00	9	2018-11-14 17:43:31.575102	2018-11-16 17:02:08.727791	3	東京都	Kantou	29
234	4	46	城南小松菜、中葉春菊、のらぼう菜、さきがけピーマン、みやま小カブ、冬越黒田五寸人参、打木源助大根、大野芋、新しょうが、	2018-11-12 00:00:00	16	2018-11-14 09:32:51.089909	2018-11-18 16:31:49.391325	1	岡山県	Chugoku	1
216	8	46		2018-11-12 00:00:00	12	2018-11-12 15:10:08.053614	2018-11-18 22:53:45.128582	27	兵庫県	Kansai	1
248	20	47		2018-11-19 00:00:00	12	2018-11-19 09:42:55.017074	2018-11-19 09:42:55.017074	0	兵庫県	Kansai	10
965	3	21		2019-05-20 00:00:00	12	2019-05-25 12:50:15.683819	2019-05-25 19:43:36.249082	2	兵庫県	Kansai	91
214	1	48		2018-11-26 00:00:00	15	2018-11-11 23:18:02.066978	2018-12-02 18:37:52.436157	19	長野県	Shinetsu	24
257	48	47		2018-11-19 00:00:00	9	2018-11-21 16:07:29.173897	2018-11-23 17:42:25.363086	2	東京都	Kantou	29
243	19	47		2018-11-19 00:00:00	12	2018-11-19 09:41:56.811462	2018-11-25 09:51:21.767731	1	兵庫県	Kansai	6
246	19	47		2018-11-19 00:00:00	12	2018-11-19 09:42:34.943591	2018-11-25 13:16:54.162394	1	兵庫県	Kansai	4
250	18	47		2018-11-19 00:00:00	12	2018-11-19 09:55:19.252305	2018-11-22 12:09:31.586308	2	兵庫県	Kansai	26
202	0	47	春菊・ミニ人参・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-11-19 00:00:00	17	2018-11-09 19:45:33.415132	2018-11-22 21:34:22.190798	5	京都府	Kansai	1
274	0	48		2018-11-26 00:00:00	12	2018-11-27 11:27:29.327213	2018-12-01 19:10:48.86514	10	兵庫県	Kansai	24
263	50	47		2018-11-19 00:00:00	12	2018-11-23 13:20:00.540607	2018-11-23 13:20:00.540607	0	兵庫県	Kansai	47
441	5	3		2019-01-14 00:00:00	12	2019-01-15 15:38:57.817759	2019-01-15 15:38:57.817759	0	兵庫県	Kansai	47
270	4	48		2018-11-26 00:00:00	12	2018-11-27 11:26:07.099788	2018-12-02 09:06:51.482449	6	兵庫県	Kansai	2
442	10	3		2019-01-14 00:00:00	12	2019-01-19 19:51:09.525112	2019-01-19 19:51:09.525112	0	兵庫県	Kansai	44
428	0	3	にんじん・大根・れんこん・かつお菜・チンゲン菜・小松菜・こかぶ・海老芋・じゃがいも　などから5～7種程度	2019-01-14 00:00:00	17	2019-01-13 21:32:31.816363	2019-01-20 11:30:27.898316	15	京都府	Kansai	1
280	4	48		2018-11-26 00:00:00	12	2018-11-27 11:31:52.799535	2018-12-02 16:48:48.79439	6	兵庫県	Kansai	5
213	0	47		2018-11-19 00:00:00	15	2018-11-11 23:17:50.682893	2018-11-25 20:14:48.348028	13	長野県	Shinetsu	24
266	9	47		2018-11-19 00:00:00	15	2018-11-25 15:29:28.906117	2018-11-25 21:18:32.48743	1	長野県	Shinetsu	1
277	5	48		2018-11-26 00:00:00	12	2018-11-27 11:30:59.670418	2018-12-02 21:31:19.969073	5	兵庫県	Kansai	8
269	10	48		2018-11-26 00:00:00	9	2018-11-26 19:07:43.127523	2018-11-26 19:07:43.127523	0	東京都	Kantou	37
281	19	48		2018-11-26 00:00:00	12	2018-11-27 11:32:11.909925	2018-11-29 08:28:02.226375	1	兵庫県	Kansai	26
271	10	48		2018-11-26 00:00:00	12	2018-11-27 11:26:24.56411	2018-11-27 11:26:24.56411	0	兵庫県	Kansai	10
273	10	48		2018-11-26 00:00:00	12	2018-11-27 11:26:45.516655	2018-11-27 11:26:45.516655	0	兵庫県	Kansai	11
267	0	48	城南小松菜、日本ほうれん草、のらぼう菜、みやま小カブ、日野菜カブ、打木源助大根、紅園中長大根、冬越黒田五寸人参、ネギ“牛の角”、みずさわレタス	2018-11-26 00:00:00	16	2018-11-25 21:07:36.102064	2018-11-30 00:35:38.66508	8	岡山県	Chugoku	1
278	7	48		2018-11-26 00:00:00	12	2018-11-27 11:31:20.101936	2018-12-02 21:36:59.329519	3	兵庫県	Kansai	6
268	17	48		2018-11-26 00:00:00	15	2018-11-26 10:01:37.545547	2018-12-02 23:04:04.858908	23	長野県	Shinetsu	1
994	20	23		2019-06-03 00:00:00	12	2019-05-30 17:47:02.719207	2019-05-30 17:47:02.719207	0	兵庫県	Kansai	89
289	15	48		2018-11-26 00:00:00	9	2018-11-28 10:05:14.506039	2018-11-28 10:05:14.506039	0	東京都	Kantou	22
290	15	48		2018-11-26 00:00:00	9	2018-11-28 10:06:00.43104	2018-11-28 10:06:00.43104	0	東京都	Kantou	32
203	0	48	春菊・ミニ人参・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-11-26 00:00:00	17	2018-11-09 19:46:07.46472	2018-11-30 00:44:47.148724	8	京都府	Kansai	1
296	30	49		2018-12-03 00:00:00	12	2018-12-03 09:37:20.638754	2018-12-03 09:37:20.638754	0	兵庫県	Kansai	10
307	24	50		2018-12-10 00:00:00	12	2018-12-03 09:40:03.189399	2018-12-14 19:37:10.266873	6	兵庫県	Kansai	24
297	20	49		2018-12-03 00:00:00	12	2018-12-03 09:37:37.463422	2018-12-03 09:37:37.463422	0	兵庫県	Kansai	11
283	46	48		2018-11-26 00:00:00	12	2018-11-27 11:33:04.109521	2018-11-30 20:54:36.551906	4	兵庫県	Kansai	47
300	20	49		2018-12-03 00:00:00	12	2018-12-03 09:38:25.057819	2018-12-03 09:38:25.057819	0	兵庫県	Kansai	8
285	43	49		2018-12-03 00:00:00	9	2018-11-27 11:34:58.125419	2018-12-03 09:49:05.977766	7	東京都	Kantou	20
284	15	48		2018-11-26 00:00:00	9	2018-11-27 11:34:34.849533	2018-11-30 09:13:38.311298	5	東京都	Kantou	20
446	0	4		2019-01-21 00:00:00	12	2019-01-21 09:42:23.663837	2019-01-26 22:03:03.497954	5	兵庫県	Kansai	8
276	7	48		2018-11-26 00:00:00	12	2018-11-27 11:30:24.315276	2018-11-30 10:42:49.097369	3	兵庫県	Kansai	4
317	4	50	城南小松菜、のらぼう菜、みやま小カブ、日野菜カブ、打木源助大根、紅芯大根、冬越黒田五寸人参、沖縄島人参、ネギ“牛の角”、トレビス、	2018-12-10 00:00:00	16	2018-12-09 18:38:59.525694	2018-12-15 21:06:00.187345	4	岡山県	Chugoku	1
279	7	48		2018-11-26 00:00:00	12	2018-11-27 11:31:31.849564	2018-11-30 22:50:38.351084	3	兵庫県	Kansai	3
282	19	48		2018-11-26 00:00:00	12	2018-11-27 11:32:32.255378	2018-11-30 22:59:19.627393	11	兵庫県	Kansai	25
302	49	49		2018-12-03 00:00:00	12	2018-12-03 09:38:48.313609	2018-12-04 08:02:43.119855	1	兵庫県	Kansai	47
292	8	49	城南小松菜、みやま小カブ、飛騨紅カブ、紅芯大根、打木源助大根、冬越黒田五寸人参、沖縄島人参、ネギ“牛の角”、みずさわレタス(orトレビス)	2018-12-03 00:00:00	16	2018-12-01 05:44:58.19731	2018-12-01 05:44:58.19731	0	岡山県	Chugoku	1
275	0	49		2018-12-03 00:00:00	12	2018-11-27 11:27:55.127246	2018-12-04 19:40:33.926407	10	兵庫県	Kansai	24
301	19	49		2018-12-03 00:00:00	12	2018-12-03 09:38:37.8593	2018-12-05 13:57:28.278426	1	兵庫県	Kansai	6
295	29	49		2018-12-03 00:00:00	12	2018-12-03 09:36:58.649093	2018-12-05 14:31:02.430998	1	兵庫県	Kansai	4
294	17	49		2018-12-03 00:00:00	12	2018-12-03 09:36:42.484681	2018-12-09 23:50:52.365796	3	兵庫県	Kansai	2
298	28	49		2018-12-03 00:00:00	12	2018-12-03 09:37:58.770454	2018-12-08 09:43:58.670849	2	兵庫県	Kansai	5
293	28	49		2018-12-03 00:00:00	12	2018-12-03 09:36:23.63194	2018-12-09 10:30:41.993751	12	兵庫県	Kansai	1
314	27	49		2018-12-03 00:00:00	12	2018-12-07 17:02:30.653065	2018-12-08 23:43:58.518115	3	兵庫県	Kansai	25
299	28	49		2018-12-03 00:00:00	12	2018-12-03 09:38:13.104315	2018-12-08 13:57:24.313865	2	兵庫県	Kansai	3
313	0	50	春菊・にんじん・かつお菜・こかぶ・大根・れんこん・海老芋　などから5～7種程度	2018-12-10 00:00:00	17	2018-12-05 17:23:17.679265	2018-12-16 15:14:16.782274	5	京都府	Kansai	24
308	16	51		2018-12-17 00:00:00	12	2018-12-03 09:40:21.661035	2018-12-22 18:57:37.580046	14	兵庫県	Kansai	24
286	44	50		2018-12-10 00:00:00	9	2018-11-27 11:35:09.146177	2018-12-15 08:01:58.614474	6	東京都	Kantou	20
315	27	50		2018-12-10 00:00:00	12	2018-12-07 17:02:43.37232	2018-12-15 14:34:29.006976	3	兵庫県	Kansai	25
303	45	50		2018-12-10 00:00:00	12	2018-12-03 09:39:01.521032	2018-12-16 00:24:32.688415	5	兵庫県	Kansai	47
287	47	51		2018-12-17 00:00:00	9	2018-11-27 11:35:22.191827	2018-12-21 00:01:58.660789	3	東京都	Kantou	20
309	3	52		2018-12-24 00:00:00	12	2018-12-03 09:40:33.845676	2018-12-30 15:02:16.084589	27	兵庫県	Kansai	24
305	0	52		2018-12-24 00:00:00	12	2018-12-03 09:39:36.465236	2018-12-20 02:21:58.912868	0	兵庫県	Kansai	47
304	0	51		2018-12-17 00:00:00	12	2018-12-03 09:39:19.80692	2018-12-20 02:22:11.621453	2	兵庫県	Kansai	47
288	45	52		2018-12-24 00:00:00	9	2018-11-27 11:35:32.421361	2018-12-30 16:08:11.169574	5	東京都	Kantou	20
311	6	49		2018-12-03 00:00:00	15	2018-12-05 16:23:29.015006	2018-12-09 23:45:10.91718	24	長野県	Shinetsu	24
319	10	50		2018-12-10 00:00:00	12	2018-12-10 15:38:19.355849	2018-12-10 15:38:19.355849	0	兵庫県	Kansai	8
327	10	50		2018-12-10 00:00:00	12	2018-12-10 15:42:14.509043	2018-12-10 15:42:14.509043	0	兵庫県	Kansai	3
328	50	50		2018-12-10 00:00:00	20	2018-12-10 15:46:11.414623	2018-12-10 15:46:11.414623	0	岐阜県	error	25
329	50	51		2018-12-17 00:00:00	20	2018-12-10 15:46:21.213533	2018-12-10 15:46:21.213533	0	岐阜県	error	25
330	50	50		2018-12-10 00:00:00	20	2018-12-10 16:01:38.249425	2018-12-10 16:01:38.249425	0	岐阜県	error	29
354	50	52	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-24 00:00:00	15	2018-12-20 14:36:03.941814	2018-12-20 14:36:03.941814	0	長野県	Shinetsu	1
325	26	50		2018-12-10 00:00:00	12	2018-12-10 15:41:32.590314	2018-12-14 19:24:06.387447	4	兵庫県	Kansai	2
316	50	50	じゃがいも３種\r\n下栗白\r\n下栗赤\r\nむらさき芋\r\nさつまいも（太白）\r\n大豆（中尾早生）\r\n黒豆（丹波黒）\r\n白インゲン（銀手亡）\r\nニンニク（赤石紅）\r\nかぼちゃ（清内路）\r\n白菜\r\nキャベツ\r\n大根各種\r\nサラダMix\r\nルッコラ\r\nパクチー\r\nケールMix\r\n人参各種\r\nパースニップ\r\n長ネギ\r\n九条葱\r\nエディブルフラワー\r\nカボス\r\n柚子\r\n他	2018-12-10 00:00:00	15	2018-12-08 10:11:31.79128	2018-12-15 16:28:58.279583	10	長野県	Shinetsu	1
320	15	50		2018-12-10 00:00:00	15	2018-12-10 15:38:54.664361	2018-12-11 16:31:59.327649	0	長野県	Shinetsu	44
333	15	50		2018-12-10 00:00:00	12	2018-12-11 16:32:39.003665	2018-12-11 16:32:39.003665	0	兵庫県	Kansai	44
355	50	52	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-24 00:00:00	15	2018-12-20 14:36:22.704842	2018-12-20 14:36:22.704842	0	長野県	Shinetsu	24
318	20	50		2018-12-10 00:00:00	12	2018-12-10 15:38:04.240109	2018-12-15 23:55:35.47878	10	兵庫県	Kansai	1
326	18	50		2018-12-10 00:00:00	12	2018-12-10 15:41:55.590547	2018-12-12 17:48:59.72581	2	兵庫県	Kansai	5
349	29	51		2018-12-17 00:00:00	12	2018-12-20 10:43:40.074016	2018-12-20 21:00:51.318926	1	兵庫県	Kansai	48
345	29	51		2018-12-17 00:00:00	12	2018-12-20 10:42:39.636736	2018-12-22 15:02:55.120348	1	兵庫県	Kansai	52
321	26	50		2018-12-10 00:00:00	15	2018-12-10 15:39:04.568853	2018-12-13 21:54:08.824932	4	長野県	Shinetsu	24
324	0	50		2018-12-10 00:00:00	12	2018-12-10 15:40:41.192053	2018-12-16 00:01:40.772166	5	兵庫県	Kansai	6
323	28	50		2018-12-10 00:00:00	12	2018-12-10 15:40:21.863626	2018-12-16 18:18:34.019208	2	兵庫県	Kansai	4
334	0	51	城南小松菜、みやま小カブ、飛騨紅カブ、打木源助大根、紅芯大根、冬越黒田五寸人参、沖縄島人参、ネギ“牛の角”、トレビス、アンデスレッド(新ジャガ)、	2018-12-17 00:00:00	16	2018-12-17 07:51:19.093127	2018-12-20 10:02:05.979595	8	岡山県	Chugoku	1
336	20	51		2018-12-17 00:00:00	19	2018-12-17 11:41:32.639777	2018-12-17 11:42:37.246224	0	大分県	Kyushu	3
339	10	51		2018-12-17 00:00:00	19	2018-12-17 11:42:50.657013	2018-12-17 11:42:50.657013	0	大分県	Kyushu	45
340	10	51		2018-12-17 00:00:00	19	2018-12-17 11:42:57.379877	2018-12-17 11:42:57.379877	0	大分県	Kyushu	46
348	30	51		2018-12-17 00:00:00	12	2018-12-20 10:43:23.880417	2018-12-20 10:43:23.880417	0	兵庫県	Kansai	53
331	47	51		2018-12-17 00:00:00	20	2018-12-10 16:01:47.622025	2018-12-22 15:12:14.076129	3	岐阜県	error	29
350	23	51	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-17 00:00:00	15	2018-12-20 14:33:55.887954	2018-12-22 18:43:42.06117	27	長野県	Shinetsu	1
341	9	51		2018-12-17 00:00:00	19	2018-12-17 11:44:18.257619	2018-12-22 09:52:54.549875	1	大分県	Kyushu	6
335	18	51		2018-12-17 00:00:00	19	2018-12-17 11:41:22.467172	2018-12-20 13:54:46.359238	2	大分県	Kyushu	5
347	29	51		2018-12-17 00:00:00	12	2018-12-20 10:43:08.423354	2018-12-21 08:31:25.673043	1	兵庫県	Kansai	50
337	7	51		2018-12-17 00:00:00	19	2018-12-17 11:41:40.541932	2018-12-22 18:53:28.314056	3	大分県	Kyushu	8
343	12	51		2018-12-17 00:00:00	12	2018-12-17 11:46:24.783797	2018-12-22 15:14:19.505647	3	兵庫県	Kansai	4
342	12	51		2018-12-17 00:00:00	12	2018-12-17 11:46:14.291038	2018-12-23 11:24:37.279437	3	兵庫県	Kansai	2
392	50	52		2018-12-24 00:00:00	12	2018-12-24 18:39:50.978282	2018-12-24 18:39:50.978282	0	兵庫県	Kansai	53
364	0	52	にんじん・かつお菜・チンゲン菜・こかぶ・大根・れんこん・海老芋・じゃがいも　などから5～7種程度	2018-12-24 00:00:00	17	2018-12-23 17:31:56.995117	2018-12-25 20:35:56.020863	8	京都府	Kansai	1
396	49	52		2018-12-24 00:00:00	12	2018-12-24 18:41:20.611437	2018-12-26 21:48:14.808735	1	兵庫県	Kansai	52
404	10	53		2018-12-31 00:00:00	12	2018-12-31 13:47:08.520072	2019-01-02 12:21:45.157104	10	兵庫県	Kansai	8
382	24	53		2018-12-31 00:00:00	12	2018-12-24 18:35:06.0729	2019-01-06 22:59:49.450679	46	兵庫県	Kansai	1
400	10	1		2018-01-01 00:00:00	12	2018-12-31 12:51:46.055662	2018-12-31 12:51:46.055662	0	兵庫県	Kansai	8
401	10	1		2018-01-01 00:00:00	12	2018-12-31 12:51:56.104857	2018-12-31 12:51:56.104857	0	兵庫県	Kansai	6
397	46	53		2018-12-31 00:00:00	12	2018-12-24 18:41:33.812356	2019-01-01 18:59:58.52268	4	兵庫県	Kansai	52
405	20	1		2018-01-01 00:00:00	9	2018-12-31 14:00:22.497874	2018-12-31 14:00:22.497874	0	東京都	Kantou	20
394	48	53		2018-12-31 00:00:00	12	2018-12-24 18:40:20.85489	2018-12-31 22:28:28.561851	2	兵庫県	Kansai	53
387	10	53		2018-12-31 00:00:00	12	2018-12-24 18:37:20.901675	2019-01-02 12:21:52.428023	9	兵庫県	Kansai	2
412	6	53	\N	2018-12-31 00:00:00	12	2019-01-02 12:56:41.383424	2019-01-04 09:20:17.160492	4	兵庫県	Kansai	3
403	5	53	\N	2018-12-31 00:00:00	12	2018-12-31 13:45:47.713625	2019-01-03 10:25:27.789411	5	兵庫県	Kansai	6
344	0	53		2018-12-31 00:00:00	16	2018-12-17 17:49:44.285372	2019-01-06 14:04:20.893778	3	岡山県	Chugoku	24
360	49	54	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2019-01-07 00:00:00	15	2018-12-20 14:37:56.860885	2019-01-10 10:15:47.228239	1	長野県	Shinetsu	44
357	50	53	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-31 00:00:00	15	2018-12-20 14:36:59.260863	2018-12-20 14:36:59.260863	0	長野県	Shinetsu	1
358	50	53	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-31 00:00:00	15	2018-12-20 14:37:16.314373	2018-12-20 14:37:16.314373	0	長野県	Shinetsu	44
359	50	54	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2019-01-07 00:00:00	15	2018-12-20 14:37:38.645634	2018-12-20 14:37:38.645634	0	長野県	Shinetsu	1
362	50	53	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-31 00:00:00	15	2018-12-20 14:40:28.275732	2018-12-20 14:40:28.275732	0	長野県	Shinetsu	24
363	50	54	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2019-01-07 00:00:00	15	2018-12-20 14:40:46.050253	2018-12-20 14:40:46.050253	0	長野県	Shinetsu	24
312	48	51	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-17 00:00:00	15	2018-12-05 16:23:49.556995	2018-12-21 13:13:59.172772	8	長野県	Shinetsu	24
352	0	51	サラダMix ルッコラ パクチー 春菊 人参 ヤーコン さつま芋（太白）白菜 大根各種 かぼちゃ パースニップ長葱 九条葱（清内路）じゃがいも３種（下栗白）（下栗赤）（むらさき芋）大豆（中尾早生） 浸し豆（鞍掛豆）青大豆（秘伝）青大豆（青バツ）黒豆（丹波黒） 白インゲン（銀手亡） ニンニク（赤石紅）菊芋 カボス（おまけ）柚子（おまけ）他	2018-12-17 00:00:00	15	2018-12-20 14:34:33.119527	2018-12-22 18:58:24.053993	0	長野県	Shinetsu	44
390	49	52		2018-12-24 00:00:00	12	2018-12-24 18:39:21.57198	2018-12-28 21:47:11.020024	1	兵庫県	Kansai	50
433	9	3		2019-01-14 00:00:00	12	2019-01-15 15:36:19.479019	2019-01-20 23:58:48.778107	16	兵庫県	Kansai	1
369	10	52		2018-12-24 00:00:00	19	2018-12-24 18:30:00.14118	2018-12-24 18:30:00.14118	0	大分県	Kyushu	8
431	48	3		2019-01-14 00:00:00	20	2019-01-15 11:26:55.325725	2019-01-17 16:12:42.079391	2	岐阜県	error	29
371	10	52		2018-12-24 00:00:00	19	2018-12-24 18:30:26.910026	2018-12-24 18:30:26.910026	0	大分県	Kyushu	6
429	47	3		2019-01-14 00:00:00	21	2019-01-15 11:26:17.758907	2019-01-20 22:26:45.237754	3	滋賀県	Kansai	20
373	10	53		2018-12-31 00:00:00	19	2018-12-24 18:30:59.690346	2018-12-24 18:30:59.690346	0	大分県	Kyushu	45
932	36	20		2019-05-13 00:00:00	12	2019-05-16 08:26:18.249318	2019-05-18 09:17:00.306522	4	兵庫県	Kansai	89
375	10	53		2018-12-31 00:00:00	19	2018-12-24 18:31:19.710593	2018-12-24 18:31:19.710593	0	大分県	Kyushu	46
443	2	4		2019-01-21 00:00:00	12	2019-01-21 09:40:18.69633	2019-01-26 15:17:02.507589	33	兵庫県	Kansai	1
377	50	52		2018-12-24 00:00:00	20	2018-12-24 18:33:06.91031	2018-12-24 18:33:06.91031	0	岐阜県	error	25
388	50	52		2018-12-24 00:00:00	12	2018-12-24 18:38:45.860764	2018-12-24 18:38:45.860764	0	兵庫県	Kansai	48
367	9	52		2018-12-24 00:00:00	19	2018-12-24 18:29:32.414352	2018-12-25 12:28:31.123212	1	大分県	Kyushu	3
365	4	52		2018-12-24 00:00:00	19	2018-12-24 18:29:02.1912	2018-12-25 09:31:16.835351	6	大分県	Kyushu	5
386	4	52		2018-12-24 00:00:00	12	2018-12-24 18:37:09.430862	2018-12-30 20:13:33.584858	6	兵庫県	Kansai	2
378	37	53		2018-12-31 00:00:00	20	2018-12-24 18:33:18.146004	2019-01-06 15:08:39.867821	13	岐阜県	error	25
379	41	52		2018-12-24 00:00:00	20	2018-12-24 18:33:26.091451	2018-12-30 13:08:34.252265	9	岐阜県	error	29
381	23	52		2018-12-24 00:00:00	12	2018-12-24 18:34:50.20071	2018-12-30 23:48:03.869874	27	兵庫県	Kansai	1
383	8	52		2018-12-24 00:00:00	12	2018-12-24 18:35:57.970332	2018-12-30 07:44:50.093134	2	兵庫県	Kansai	4
398	20	1		2018-01-01 00:00:00	12	2018-12-31 12:51:23.063232	2018-12-31 12:51:23.063232	0	兵庫県	Kansai	5
406	23	53	\N	2018-12-31 00:00:00	9	2018-12-31 17:38:20.386358	2019-01-01 22:18:14.735146	7	東京都	Kantou	20
385	4	53		2018-12-31 00:00:00	12	2018-12-24 18:36:40.694885	2019-01-01 18:48:47.50744	6	兵庫県	Kansai	4
399	20	1		2018-01-01 00:00:00	12	2018-12-31 12:51:34.28414	2018-12-31 12:51:34.28414	0	兵庫県	Kansai	3
391	43	53		2018-12-31 00:00:00	12	2018-12-24 18:39:37.190619	2019-01-06 00:06:24.47681	7	兵庫県	Kansai	50
389	49	53		2018-12-31 00:00:00	12	2018-12-24 18:38:57.391662	2018-12-31 22:28:28.61	1	兵庫県	Kansai	48
411	10	53	\N	2018-12-31 00:00:00	12	2019-01-02 12:56:08.448406	2019-01-02 12:56:08.448406	0	兵庫県	Kansai	5
380	40	53		2018-12-31 00:00:00	20	2018-12-24 18:33:42.249936	2019-01-04 19:51:10.778681	10	岐阜県	error	29
414	50	1		2018-12-31 00:00:00	12	2019-01-05 18:45:40.352209	2019-01-05 18:45:40.352209	0	兵庫県	Kansai	47
417	20	2		2019-01-07 00:00:00	12	2019-01-07 12:42:19.978111	2019-01-07 12:42:19.978111	0	兵庫県	Kansai	8
418	20	2		2019-01-07 00:00:00	12	2019-01-07 12:42:38.307807	2019-01-07 12:42:38.307807	0	兵庫県	Kansai	6
425	5	2		2019-01-07 00:00:00	12	2019-01-07 12:45:12.216098	2019-01-07 12:45:12.216098	0	兵庫県	Kansai	9
426	5	2		2019-01-07 00:00:00	12	2019-01-07 12:45:18.577478	2019-01-07 12:45:18.577478	0	兵庫県	Kansai	7
413	7	2	日本ほうれん草、打木源助大根、紅芯大根、飛騨紅カブ、日野菜カブ、冬越黒田五寸人参、沖縄島人参、ネギ“牛の角”、アンデスレッド(ジャガイモ)、トレビス、のうち7～8品目。      	2019-01-07 00:00:00	16	2019-01-04 07:41:18.426949	2019-01-07 17:47:49.529185	1	岡山県	Chugoku	1
423	9	2		2019-01-07 00:00:00	12	2019-01-07 12:43:47.862978	2019-01-07 19:10:36.690179	1	兵庫県	Kansai	47
456	47	4		2019-01-21 00:00:00	20	2019-01-25 16:00:22.222627	2019-01-26 20:01:32.36496	3	岐阜県	error	25
421	17	2		2019-01-07 00:00:00	12	2019-01-07 12:43:18.653785	2019-01-10 13:41:24.992559	3	兵庫県	Kansai	2
453	14	4		2019-01-21 00:00:00	12	2019-01-21 21:36:37.228975	2019-01-25 10:16:20.171925	1	兵庫県	Kansai	33
454	15	4		2019-01-21 00:00:00	12	2019-01-21 21:43:17.883918	2019-01-21 21:43:17.883918	0	兵庫県	Kansai	39
427	44	2		2019-01-07 00:00:00	9	2019-01-09 10:06:35.973827	2019-01-09 10:12:36.727607	6	東京都	Kantou	20
422	19	2		2019-01-07 00:00:00	12	2019-01-07 12:43:31.262174	2019-01-09 13:11:08.042847	1	兵庫県	Kansai	4
420	27	2		2019-01-07 00:00:00	12	2019-01-07 12:42:59.884536	2019-01-09 17:38:11.025728	3	兵庫県	Kansai	3
419	29	2		2019-01-07 00:00:00	12	2019-01-07 12:42:47.651159	2019-01-11 13:59:41.648381	1	兵庫県	Kansai	5
452	10	4		2019-01-21 00:00:00	12	2019-01-21 21:36:21.449259	2019-01-25 10:16:39.287591	10	兵庫県	Kansai	44
424	0	2		2019-01-07 00:00:00	12	2019-01-07 12:44:47.533938	2019-01-11 18:13:17.680974	5	兵庫県	Kansai	44
448	21	4		2019-01-21 00:00:00	12	2019-01-21 09:42:53.239229	2019-01-25 10:42:41.626705	4	兵庫県	Kansai	3
447	8	4		2019-01-21 00:00:00	12	2019-01-21 09:42:38.044985	2019-01-26 23:25:10.162424	7	兵庫県	Kansai	6
416	3	2		2019-01-07 00:00:00	12	2019-01-07 12:42:02.297135	2019-01-13 01:56:55.643882	21	兵庫県	Kansai	24
462	47	5		2019-01-28 00:00:00	12	2019-01-28 10:37:10.335265	2019-02-01 00:07:38.696622	10	兵庫県	Kansai	4
415	7	2		2019-01-07 00:00:00	12	2019-01-07 12:41:42.877874	2019-01-13 20:10:14.68232	23	兵庫県	Kansai	1
432	49	3		2019-01-14 00:00:00	20	2019-01-15 11:27:03.616994	2019-01-15 22:36:47.301642	1	岐阜県	error	25
455	42	4		2019-01-21 00:00:00	20	2019-01-25 16:00:03.997949	2019-01-26 23:56:37.061148	8	岐阜県	error	29
449	16	4		2019-01-21 00:00:00	12	2019-01-21 09:43:04.607938	2019-01-25 09:25:15.840732	9	兵庫県	Kansai	5
434	0	3		2019-01-14 00:00:00	12	2019-01-15 15:36:36.487705	2019-01-20 12:56:47.278628	15	兵庫県	Kansai	24
451	11	4		2019-01-21 00:00:00	12	2019-01-21 09:43:34.932261	2019-01-26 07:14:31.683558	14	兵庫県	Kansai	24
1005	20	23		2019-06-03 00:00:00	9	2019-06-05 14:41:44.753015	2019-06-05 14:41:44.753015	0	東京都	Kantou	72
450	0	4		2019-01-21 00:00:00	12	2019-01-21 09:43:16.973387	2019-01-27 01:52:21.924063	10	兵庫県	Kansai	47
444	16	4		2019-01-21 00:00:00	12	2019-01-21 09:40:52.636142	2019-01-27 15:04:07.451354	4	兵庫県	Kansai	2
469	20	5		2019-01-28 00:00:00	12	2019-01-28 10:40:37.141958	2019-01-28 17:19:29.374805	0	兵庫県	Kansai	7
430	45	4		2019-01-21 00:00:00	21	2019-01-15 11:26:29.188359	2019-01-27 17:11:40.499673	5	滋賀県	Kansai	20
445	16	4		2019-01-21 00:00:00	12	2019-01-21 09:42:08.829074	2019-01-26 15:06:48.046514	4	兵庫県	Kansai	4
468	20	5		2019-01-28 00:00:00	12	2019-01-28 10:40:20.57333	2019-01-28 17:19:41.419532	0	兵庫県	Kansai	9
458	9	4		2019-01-21 00:00:00	12	2019-01-26 10:45:05.632186	2019-01-27 23:38:31.174432	1	兵庫県	Kansai	56
457	20	4		2019-01-21 00:00:00	12	2019-01-26 00:01:00.591485	2019-01-27 23:48:33.743375	15	兵庫県	Kansai	54
467	45	5		2019-01-28 00:00:00	12	2019-01-28 10:39:05.967591	2019-01-31 23:37:05.917729	16	兵庫県	Kansai	47
459	4	5		2019-01-28 00:00:00	12	2019-01-28 10:36:18.525449	2019-02-03 17:13:41.941226	31	兵庫県	Kansai	56
464	20	5		2019-01-28 00:00:00	12	2019-01-28 10:38:17.675907	2019-01-31 23:08:36.586828	5	兵庫県	Kansai	6
481	83	5		2019-01-28 00:00:00	12	2019-01-30 08:40:35.236709	2019-02-01 12:02:19.809346	17	兵庫県	Kansai	57
466	13	5		2019-01-28 00:00:00	12	2019-01-28 10:38:41.897314	2019-02-03 21:03:59.435966	17	兵庫県	Kansai	5
473	10	5		2019-01-28 00:00:00	12	2019-01-28 14:49:54.483275	2019-01-28 17:27:35.502611	0	兵庫県	Kansai	46
474	10	5		2019-01-28 00:00:00	12	2019-01-28 14:50:13.972088	2019-01-28 17:27:39.520151	0	兵庫県	Kansai	45
463	24	5		2019-01-28 00:00:00	12	2019-01-28 10:37:47.509598	2019-02-01 11:50:30.058465	7	兵庫県	Kansai	8
470	45	5		2019-01-28 00:00:00	20	2019-01-28 11:03:29.40874	2019-02-01 14:08:38.576846	35	岐阜県	error	29
471	13	5		2019-01-28 00:00:00	20	2019-01-28 11:03:39.465921	2019-01-31 23:52:28.442359	17	岐阜県	error	25
472	15	5		2019-01-28 00:00:00	21	2019-01-28 14:18:38.530672	2019-02-02 11:02:01.501187	15	滋賀県	Kansai	20
479	10	5		2019-01-28 00:00:00	12	2019-01-28 20:39:57.189297	2019-01-31 17:33:12.564121	0	兵庫県	Kansai	37
480	5	5	にんじん・大根・れんこん・かつお菜・チンゲン菜・小松菜・こかぶ・海老芋・じゃがいも　などから5～7種程度	2019-01-28 00:00:00	17	2019-01-29 22:33:00.299485	2019-01-29 22:33:00.299485	0	京都府	Kansai	1
482	95	5		2019-01-28 00:00:00	12	2019-01-30 08:40:52.039568	2019-01-30 14:16:03.472129	5	兵庫県	Kansai	58
461	47	5		2019-01-28 00:00:00	12	2019-01-28 10:36:57.17995	2019-01-31 23:42:46.945438	9	兵庫県	Kansai	2
484	30	6		2019-02-04 00:00:00	20	2019-02-03 21:19:17.195853	2019-02-03 21:19:17.195853	0	岐阜県	error	29
485	30	6		2019-02-04 00:00:00	20	2019-02-03 21:19:30.176129	2019-02-03 21:19:30.176129	0	岐阜県	error	25
465	19	5		2019-01-28 00:00:00	12	2019-01-28 10:38:29.44861	2019-02-03 18:29:41.288199	11	兵庫県	Kansai	3
460	69	5		2019-01-28 00:00:00	12	2019-01-28 10:36:29.301003	2019-02-03 22:59:38.11265	81	兵庫県	Kansai	54
489	15	6		2019-02-04 00:00:00	12	2019-02-04 10:28:39.243392	2019-02-04 10:28:39.243392	0	兵庫県	Kansai	8
490	15	6		2019-02-04 00:00:00	12	2019-02-04 10:28:58.234846	2019-02-04 10:28:58.234846	0	兵庫県	Kansai	6
486	29	6		2019-02-04 00:00:00	21	2019-02-03 21:20:00.196296	2019-02-05 14:24:25.647163	1	滋賀県	Kansai	20
491	18	6		2019-02-04 00:00:00	12	2019-02-04 10:29:10.427489	2019-02-08 21:12:06.945276	2	兵庫県	Kansai	5
492	20	6		2019-02-04 00:00:00	12	2019-02-04 10:29:19.145644	2019-02-04 10:29:19.145644	0	兵庫県	Kansai	3
497	24	6		2019-02-04 00:00:00	12	2019-02-04 10:30:35.383329	2019-02-10 12:04:17.254186	1	兵庫県	Kansai	4
937	0	20		2019-05-13 00:00:00	12	2019-05-19 01:09:45.571143	2019-05-20 07:58:13.092265	0	兵庫県	Kansai	8
935	0	20		2019-05-13 00:00:00	12	2019-05-19 01:07:55.432594	2019-05-20 07:58:28.054446	0	兵庫県	Kansai	3
933	0	21		2019-05-20 00:00:00	17	2019-05-18 08:02:22.359368	2019-05-21 23:13:06.809149	6	京都府	Kansai	88
967	3	21		2019-05-20 00:00:00	12	2019-05-25 12:50:42.532853	2019-05-26 16:03:54.313051	2	兵庫県	Kansai	93
1006	20	23		2019-06-03 00:00:00	9	2019-06-05 14:41:54.813072	2019-06-05 14:41:54.813072	0	東京都	Kantou	77
1009	10	23		2019-06-03 00:00:00	9	2019-06-05 14:42:59.143763	2019-06-05 14:42:59.143763	0	東京都	Kantou	78
1011	10	23		2019-06-03 00:00:00	9	2019-06-05 14:43:33.451294	2019-06-05 14:43:33.451294	0	東京都	Kantou	80
995	20	25	新玉ねぎ 葉赤玉ねぎ 空芯菜 サラダミックス レタスミックス ハーブミックス ケールミックス 春菊 大根間引き菜 カブ間引き菜 わらび フキ 大豆 青大豆 黒大豆 金時豆 インゲン エディブルフラワー 玄米 もうすぐ 紫蘇 大根 小カブ きゅうり にんにくの芽 ミニトマト ナス ピーマン	2019-06-17 00:00:00	15	2019-05-30 21:36:52.438854	2019-06-01 23:39:34.85818	0	長野県	Shinetsu	24
996	20	26	新玉ねぎ 葉赤玉ねぎ 空芯菜 サラダミックス レタスミックス ハーブミックス ケールミックス 春菊 大根間引き菜 カブ間引き菜 わらび フキ 大豆 青大豆 黒大豆 金時豆 インゲン エディブルフラワー 玄米 もうすぐ 紫蘇 大根 小カブ きゅうり にんにくの芽 ミニトマト ナス ピーマン	2019-06-24 00:00:00	15	2019-05-30 21:37:16.303299	2019-06-01 23:39:45.857611	0	長野県	Shinetsu	24
904	17	22	タラの芽 わらび フキ 新玉ねぎ 新赤玉ねぎ 絹さやエンドウ サラダミックス レタスミックス 春菊 ラディッシュ 西洋人参 大豆 青大豆 黒大豆 金時豆 インゲン豆 九条ネギ フェンネル エディブルフラワー 玄米 もうすぐ 筍 小松菜 青梗菜 きゅうり にんにくの芽 ミニトマト	2019-05-27 00:00:00	15	2019-05-07 21:07:24.266389	2019-06-02 10:11:19.630343	28	長野県	Shinetsu	24
520	192	7		2019-02-11 00:00:00	9	2019-02-11 16:02:54.796905	2019-02-11 23:37:03.414124	8	東京都	Kantou	62
512	162	7		2019-02-11 00:00:00	9	2019-02-11 15:51:08.240934	2019-02-12 23:16:57.01041	38	東京都	Kantou	65
1007	20	23		2019-06-03 00:00:00	9	2019-06-05 14:42:07.755775	2019-06-05 14:42:07.755775	0	東京都	Kantou	74
529	0	7	にんじん・大根・れんこん・海老芋・じゃがいも・かつお菜・小松菜・紅菜苔などから7品目程度	2019-02-11 00:00:00	17	2019-02-13 17:33:50.545787	2019-02-14 12:55:41.299151	5	京都府	Kansai	59
936	0	20		2019-05-13 00:00:00	12	2019-05-19 01:08:49.886105	2019-05-20 07:57:43.781342	3	兵庫県	Kansai	6
494	20	6		2019-02-04 00:00:00	12	2019-02-04 10:29:49.898903	2019-02-08 09:26:39.600103	0	兵庫県	Kansai	57
488	21	6		2019-02-04 00:00:00	12	2019-02-04 10:28:28.08521	2019-02-08 10:00:21.351501	9	兵庫県	Kansai	54
496	21	6		2019-02-04 00:00:00	12	2019-02-04 10:30:24.873426	2019-02-08 17:36:07.434114	4	兵庫県	Kansai	2
495	5	6		2019-02-04 00:00:00	12	2019-02-04 10:30:04.150243	2019-02-09 11:37:32.7572	0	兵庫県	Kansai	47
501	13	7		2019-02-11 00:00:00	12	2019-02-11 09:33:05.760982	2019-02-16 21:12:37.318126	7	兵庫県	Kansai	5
521	199	7		2019-02-11 00:00:00	9	2019-02-11 16:03:18.28705	2019-02-11 16:31:17.950742	1	東京都	Kantou	64
498	0	6	にんじん・大根・れんこん・海老芋・じゃがいも・かつお菜・小松菜・紅菜苔などから7品目程度	2019-02-04 00:00:00	17	2019-02-05 14:28:45.392407	2019-02-09 18:43:54.722428	12	京都府	Kansai	59
530	200	7		2019-02-11 00:00:00	9	2019-02-14 15:45:49.812526	2019-02-14 15:45:49.812526	0	東京都	Kantou	72
493	0	6		2019-02-04 00:00:00	12	2019-02-04 10:29:41.167854	2019-02-10 22:40:20.288115	2	兵庫県	Kansai	58
487	2	6		2019-02-04 00:00:00	12	2019-02-04 10:26:58.221461	2019-02-10 23:11:41.089707	18	兵庫県	Kansai	56
503	10	7		2019-02-11 00:00:00	12	2019-02-11 09:33:24.721605	2019-02-11 09:33:24.721605	0	兵庫県	Kansai	8
531	200	7		2019-02-11 00:00:00	9	2019-02-14 15:59:52.379663	2019-02-14 15:59:52.379663	0	東京都	Kantou	74
507	199	7		2019-02-11 00:00:00	9	2019-02-11 14:03:09.589052	2019-02-11 16:38:14.884157	1	東京都	Kantou	61
524	184	7		2019-02-11 00:00:00	9	2019-02-11 18:17:43.340799	2019-02-12 00:08:17.646301	16	東京都	Kantou	69
535	200	7		2019-02-11 00:00:00	9	2019-02-14 16:32:10.188608	2019-02-14 16:32:10.188608	0	東京都	Kantou	78
527	30	7		2019-02-11 00:00:00	20	2019-02-12 10:43:48.751753	2019-02-12 10:43:48.751753	0	岐阜県	error	25
509	196	7		2019-02-11 00:00:00	9	2019-02-11 14:03:27.465576	2019-02-11 17:41:54.994734	4	東京都	Kantou	60
515	187	7		2019-02-11 00:00:00	9	2019-02-11 16:02:03.126977	2019-02-11 22:00:51.064912	13	東京都	Kantou	68
528	30	7		2019-02-11 00:00:00	21	2019-02-12 10:44:47.172138	2019-02-12 10:44:47.172138	0	滋賀県	Kansai	20
534	199	7		2019-02-11 00:00:00	9	2019-02-14 16:32:00.536731	2019-02-14 16:55:32.348904	1	東京都	Kantou	77
506	16	7		2019-02-11 00:00:00	12	2019-02-11 09:34:42.031332	2019-02-15 11:29:39.239049	4	兵庫県	Kansai	2
533	198	7		2019-02-11 00:00:00	9	2019-02-14 16:03:19.871817	2019-02-15 12:33:18.613704	2	東京都	Kantou	75
523	195	7		2019-02-11 00:00:00	9	2019-02-11 18:17:30.771649	2019-02-11 22:38:05.105598	5	東京都	Kantou	70
532	197	7		2019-02-11 00:00:00	9	2019-02-14 16:02:56.876431	2019-02-16 21:27:37.183386	3	東京都	Kantou	73
548	50	8		2019-02-18 00:00:00	9	2019-02-18 08:56:52.119663	2019-02-18 08:56:52.119663	0	東京都	Kantou	78
550	50	8		2019-02-18 00:00:00	9	2019-02-18 08:57:13.320201	2019-02-18 08:57:13.320201	0	東京都	Kantou	72
502	20	7		2019-02-11 00:00:00	12	2019-02-11 09:33:16.521538	2019-02-11 22:44:40.464303	0	兵庫県	Kansai	3
551	50	8		2019-02-18 00:00:00	9	2019-02-18 08:57:23.240069	2019-02-18 08:57:23.240069	0	東京都	Kantou	74
553	50	8		2019-02-18 00:00:00	9	2019-02-18 08:57:36.519693	2019-02-18 08:57:36.519693	0	東京都	Kantou	75
518	196	7		2019-02-11 00:00:00	9	2019-02-11 16:02:24.237478	2019-02-12 20:57:05.405289	4	東京都	Kantou	66
504	9	7		2019-02-11 00:00:00	12	2019-02-11 09:33:34.992355	2019-02-12 22:33:39.233278	1	兵庫県	Kansai	6
543	10	7		2019-02-11 00:00:00	12	2019-02-16 23:26:19.932055	2019-02-16 23:26:19.932055	0	兵庫県	Kansai	57
513	193	7		2019-02-11 00:00:00	9	2019-02-11 16:01:47.009658	2019-02-11 22:55:50.428615	7	東京都	Kantou	67
510	198	7		2019-02-11 00:00:00	9	2019-02-11 15:50:46.662172	2019-02-11 23:28:35.621573	2	東京都	Kantou	63
505	16	7		2019-02-11 00:00:00	12	2019-02-11 09:34:31.02349	2019-02-15 14:56:12.705483	4	兵庫県	Kansai	4
526	26	7		2019-02-11 00:00:00	20	2019-02-12 10:43:20.656782	2019-02-15 15:58:37.832918	4	岐阜県	error	29
500	6	7		2019-02-11 00:00:00	12	2019-02-11 09:32:38.273058	2019-02-17 13:42:49.001628	20	兵庫県	Kansai	54
525	196	7		2019-02-11 00:00:00	9	2019-02-11 18:19:07.826369	2019-02-15 01:52:13.846042	4	東京都	Kantou	71
542	16	7		2019-02-11 00:00:00	9	2019-02-14 17:13:31.186663	2019-02-15 07:56:00.564986	4	東京都	Kantou	76
499	25	7		2019-02-11 00:00:00	12	2019-02-11 09:31:40.918269	2019-02-17 14:37:07.541692	23	兵庫県	Kansai	56
538	187	7		2019-02-11 00:00:00	9	2019-02-14 16:54:40.578973	2019-02-17 16:26:04.72246	13	東京都	Kantou	79
557	20	8		2019-02-18 00:00:00	20	2019-02-18 09:00:18.285561	2019-02-18 09:00:18.285561	0	岐阜県	error	25
540	194	7		2019-02-11 00:00:00	9	2019-02-14 17:02:27.313087	2019-02-17 16:26:04.745603	6	東京都	Kantou	80
546	49	8		2019-02-18 00:00:00	9	2019-02-18 08:56:20.320064	2019-02-20 20:07:03.03775	1	東京都	Kantou	77
566	20	10		2019-03-04 00:00:00	20	2019-02-18 10:26:43.651765	2019-02-18 10:26:43.651765	0	岐阜県	error	25
559	35	9		2019-02-25 00:00:00	21	2019-02-18 10:25:05.314934	2019-03-03 20:40:50.878777	15	滋賀県	Kansai	20
554	48	8		2019-02-18 00:00:00	9	2019-02-18 08:57:46.746349	2019-02-19 10:18:46.650667	2	東京都	Kantou	73
544	17	8		2019-02-18 00:00:00	9	2019-02-18 08:50:03.204551	2019-02-19 12:33:08.821503	3	東京都	Kantou	76
558	48	8		2019-02-18 00:00:00	21	2019-02-18 10:24:53.413863	2019-02-18 21:08:42.406705	2	滋賀県	Kansai	20
555	19	8		2019-02-18 00:00:00	20	2019-02-18 09:00:04.103789	2019-02-21 19:47:57.707123	1	岐阜県	error	29
549	44	8		2019-02-18 00:00:00	9	2019-02-18 08:57:01.523997	2019-02-24 10:23:08.056985	6	東京都	Kantou	79
565	10	9		2019-02-25 00:00:00	20	2019-02-18 10:26:34.47506	2019-02-28 22:19:39.372994	10	岐阜県	error	29
563	17	9		2019-02-25 00:00:00	20	2019-02-18 10:26:21.165547	2019-02-28 21:44:47.425032	3	岐阜県	error	25
560	49	10		2019-03-04 00:00:00	21	2019-02-18 10:25:20.629118	2019-03-09 07:09:26.462018	1	滋賀県	Kansai	20
561	47	11		2019-03-11 00:00:00	21	2019-02-18 10:25:29.930954	2019-03-17 15:16:52.753574	3	滋賀県	Kansai	20
562	49	12		2019-03-18 00:00:00	21	2019-02-18 10:25:38.168054	2019-03-24 22:14:24.158355	1	滋賀県	Kansai	20
568	20	10		2019-03-04 00:00:00	20	2019-02-18 10:26:59.220072	2019-02-18 10:26:59.220072	0	岐阜県	error	29
574	20	12		2019-03-18 00:00:00	20	2019-02-18 10:27:51.440355	2019-02-18 10:27:51.440355	0	岐阜県	error	25
938	0	20		2019-05-13 00:00:00	12	2019-05-19 01:10:18.631147	2019-05-20 07:58:02.7321	3	兵庫県	Kansai	5
969	20	22		2019-05-27 00:00:00	9	2019-05-27 02:53:33.364015	2019-05-27 02:53:33.364015	0	東京都	Kantou	75
971	20	22		2019-05-27 00:00:00	9	2019-05-27 02:54:10.734832	2019-05-27 02:54:10.734832	0	東京都	Kantou	72
973	20	22		2019-05-27 00:00:00	9	2019-05-27 02:54:33.774997	2019-05-27 02:54:33.774997	0	東京都	Kantou	73
998	26	23		2019-06-03 00:00:00	12	2019-06-02 06:15:11.175462	2019-06-05 00:45:28.517568	4	兵庫県	Kansai	56
999	16	23		2019-06-03 00:00:00	12	2019-06-02 06:16:28.480714	2019-06-05 10:58:54.945554	4	兵庫県	Kansai	90
1010	10	23		2019-06-03 00:00:00	9	2019-06-05 14:43:18.767349	2019-06-05 14:43:18.767349	0	東京都	Kantou	79
1012	10	23		2019-06-03 00:00:00	9	2019-06-05 14:43:48.151193	2019-06-05 14:43:48.151193	0	東京都	Kantou	73
1000	7	23		2019-06-03 00:00:00	12	2019-06-02 06:21:43.710143	2019-06-05 18:07:08.280314	3	兵庫県	Kansai	92
980	16	22		2019-05-27 00:00:00	9	2019-05-27 02:56:02.003596	2019-05-31 17:52:49.435917	4	東京都	Kantou	79
975	19	22		2019-05-27 00:00:00	9	2019-05-27 02:54:51.856243	2019-05-31 17:52:49.528606	1	東京都	Kantou	77
962	27	22		2019-05-27 00:00:00	12	2019-05-24 11:49:42.817624	2019-06-01 18:06:38.565124	53	兵庫県	Kansai	83
956	20	24	新玉ねぎ 葉赤玉ねぎ 空芯菜 サラダミックス レタスミックス ハーブミックス ケールミックス 春菊 大根間引き菜 カブ間引き菜 わらび フキ 大豆 青大豆 黒大豆 金時豆 インゲン エディブルフラワー 玄米 もうすぐ 紫蘇 大根 小カブ きゅうり にんにくの芽 ミニトマト ナス ピーマン ミニトマト	2019-06-10 00:00:00	15	2019-05-22 22:32:16.137504	2019-06-01 23:41:16.538563	0	長野県	Shinetsu	24
569	20	11		2019-03-11 00:00:00	20	2019-02-18 10:27:08.063913	2019-02-18 10:27:08.063913	0	岐阜県	error	25
570	20	11		2019-03-11 00:00:00	20	2019-02-18 10:27:19.658487	2019-02-18 10:27:19.658487	0	岐阜県	error	29
573	20	12		2019-03-18 00:00:00	20	2019-02-18 10:27:43.297578	2019-02-18 10:27:43.297578	0	岐阜県	error	29
579	15	8		2019-02-18 00:00:00	12	2019-02-18 10:37:18.717174	2019-02-23 22:35:49.77398	5	兵庫県	Kansai	4
595	15	9		2019-02-25 00:00:00	12	2019-02-25 03:08:06.385415	2019-02-28 23:11:51.437628	5	兵庫県	Kansai	3
581	15	8		2019-02-18 00:00:00	12	2019-02-18 10:38:09.073559	2019-02-18 11:45:54.37173	0	兵庫県	Kansai	6
592	16	9		2019-02-25 00:00:00	12	2019-02-25 02:58:28.201102	2019-02-28 21:42:44.091795	4	兵庫県	Kansai	4
611	0	9	にんじん・大根・れんこん・海老芋・じゃがいも・かつお菜・小松菜・紅菜苔・花菜・ブロッコリー・ネギなどから7品目程度	2019-02-25 00:00:00	17	2019-02-27 08:04:01.418208	2019-02-27 20:31:07.603659	5	京都府	Kansai	59
612	20	45	\N	2018-11-04 15:00:00	9	2019-02-27 21:25:17.743328	2019-02-27 21:25:17.743328	0	東京都	Kantou	4
613	20	45	\N	2018-11-04 15:00:00	9	2019-02-27 21:26:50.747808	2019-02-27 21:26:50.747808	0	東京都	Kantou	5
580	14	8		2019-02-18 00:00:00	12	2019-02-18 10:37:49.294797	2019-02-24 16:32:59.035059	1	兵庫県	Kansai	8
582	19	8		2019-02-18 00:00:00	12	2019-02-18 11:08:55.61502	2019-02-24 18:03:32.65884	2	兵庫県	Kansai	5
577	11	8		2019-02-18 00:00:00	12	2019-02-18 10:34:27.163011	2019-02-24 19:58:12.09811	19	兵庫県	Kansai	56
575	6	8		2019-02-18 00:00:00	12	2019-02-18 10:30:09.868085	2019-02-24 22:09:04.203128	4	兵庫県	Kansai	57
545	48	8		2019-02-18 00:00:00	9	2019-02-18 08:55:49.174133	2019-02-19 10:18:46.703876	2	東京都	Kantou	80
576	16	8		2019-02-18 00:00:00	12	2019-02-18 10:32:26.745514	2019-02-24 23:44:03.155143	14	兵庫県	Kansai	54
586	10	8		2019-02-18 00:00:00	12	2019-02-19 15:43:29.436835	2019-02-19 15:43:29.436835	0	兵庫県	Kansai	81
588	1	8		2019-02-18 00:00:00	12	2019-02-19 15:49:12.332078	2019-02-19 15:49:12.332078	0	兵庫県	Kansai	44
591	10	9		2019-02-25 00:00:00	12	2019-02-25 02:56:13.951285	2019-02-25 02:56:13.951285	0	兵庫県	Kansai	81
585	19	8		2019-02-18 00:00:00	12	2019-02-18 15:27:56.213507	2019-02-19 22:28:59.330705	1	兵庫県	Kansai	52
583	19	8		2019-02-18 00:00:00	12	2019-02-18 11:09:17.253811	2019-02-20 20:34:35.86331	1	兵庫県	Kansai	3
607	189	9		2019-02-25 00:00:00	9	2019-02-26 10:34:45.298362	2019-02-28 21:42:58.253668	11	東京都	Kantou	79
614	20	45	\N	2018-11-04 15:00:00	9	2019-02-27 21:28:01.836672	2019-02-27 21:28:01.836672	0	東京都	Kantou	26
610	18	9		2019-02-25 00:00:00	9	2019-02-26 15:21:40.729214	2019-02-28 21:44:47.443634	2	東京都	Kantou	76
584	16	8		2019-02-18 00:00:00	12	2019-02-18 15:27:37.744917	2019-02-21 23:05:35.101574	4	兵庫県	Kansai	50
600	2000	9		2019-02-25 00:00:00	9	2019-02-26 10:33:44.579774	2019-02-26 10:33:44.579774	0	東京都	Kantou	72
940	48	21		2019-05-20 00:00:00	12	2019-05-19 17:45:44.49838	2019-05-26 19:49:17.912531	2	兵庫県	Kansai	52
578	16	8		2019-02-18 00:00:00	12	2019-02-18 10:36:22.317487	2019-02-22 21:27:55.060672	4	兵庫県	Kansai	2
608	15	9		2019-02-25 00:00:00	12	2019-02-26 11:01:30.667004	2019-02-26 11:01:30.667004	0	兵庫県	Kansai	8
616	20	45	\N	2018-11-05 00:00:00	9	2019-02-27 21:33:42.3483	2019-02-27 21:33:42.3483	0	東京都	Kantou	25
609	14	9		2019-02-25 00:00:00	12	2019-02-26 11:01:54.56612	2019-02-26 12:53:53.442373	1	兵庫県	Kansai	6
603	191	9		2019-02-25 00:00:00	9	2019-02-26 10:34:11.558162	2019-03-03 20:40:50.932205	9	東京都	Kantou	73
597	12	9		2019-02-25 00:00:00	12	2019-02-25 03:10:25.535076	2019-03-01 02:33:15.112751	8	兵庫県	Kansai	50
604	193	9		2019-02-25 00:00:00	9	2019-02-26 10:34:24.005736	2019-03-02 12:40:29.970138	7	東京都	Kantou	75
605	192	9		2019-02-25 00:00:00	9	2019-02-26 10:34:31.541051	2019-03-02 20:43:19.410233	8	東京都	Kantou	77
596	11	9		2019-02-25 00:00:00	12	2019-02-25 03:09:50.571063	2019-03-02 22:09:19.812098	9	兵庫県	Kansai	52
601	1998	9		2019-02-25 00:00:00	9	2019-02-26 10:33:53.20872	2019-03-01 13:19:47.566207	2	東京都	Kantou	74
627	20	10		2019-03-04 00:00:00	12	2019-03-03 21:54:06.604806	2019-03-03 21:54:26.681989	0	兵庫県	Kansai	3
606	193	9		2019-02-25 00:00:00	9	2019-02-26 10:34:38.370927	2019-02-27 23:23:15.604985	7	東京都	Kantou	78
593	14	9		2019-02-25 00:00:00	12	2019-02-25 02:59:45.475903	2019-02-28 22:06:48.213942	6	兵庫県	Kansai	2
599	190	9		2019-02-25 00:00:00	9	2019-02-26 10:33:33.283131	2019-03-01 13:19:47.589929	10	東京都	Kantou	80
598	5	9		2019-02-25 00:00:00	12	2019-02-25 03:11:11.425866	2019-03-01 17:17:07.490027	8	兵庫県	Kansai	57
623	0	10		2019-03-04 00:00:00	12	2019-03-03 21:47:47.600013	2019-03-03 21:55:20.516245	0	兵庫県	Kansai	24
590	14	9		2019-02-25 00:00:00	12	2019-02-25 02:52:28.980219	2019-03-03 13:35:42.397977	36	兵庫県	Kansai	54
589	20	9		2019-02-25 00:00:00	12	2019-02-25 02:47:37.851702	2019-03-03 15:31:08.02478	20	兵庫県	Kansai	56
594	5	9		2019-02-25 00:00:00	12	2019-02-25 03:07:32.456095	2019-02-28 22:40:25.305302	25	兵庫県	Kansai	5
635	20	10		2019-03-04 00:00:00	9	2019-03-04 09:00:13.851495	2019-03-04 09:00:13.851495	0	東京都	Kantou	73
637	20	10		2019-03-04 00:00:00	9	2019-03-04 09:00:32.820056	2019-03-04 09:00:32.820056	0	東京都	Kantou	75
638	20	10		2019-03-04 00:00:00	9	2019-03-04 09:00:39.827748	2019-03-04 09:00:39.827748	0	東京都	Kantou	74
619	29	11		2019-03-11 00:00:00	12	2019-03-03 18:37:09.374361	2019-03-16 12:29:13.228526	3	兵庫県	Kansai	50
620	6	10		2019-03-04 00:00:00	12	2019-03-03 18:37:49.356821	2019-03-09 16:11:30.617639	4	兵庫県	Kansai	57
634	18	10		2019-03-04 00:00:00	9	2019-03-04 08:59:53.4324	2019-03-05 18:18:18.155236	2	東京都	Kantou	77
618	0	10		2019-03-04 00:00:00	12	2019-03-03 18:35:37.031521	2019-03-08 12:48:03.025517	4	兵庫県	Kansai	52
630	19	10		2019-03-04 00:00:00	12	2019-03-03 21:57:53.070955	2019-03-10 15:52:04.543808	1	兵庫県	Kansai	2
628	9	10		2019-03-04 00:00:00	12	2019-03-03 21:54:54.50991	2019-03-06 07:50:59.750833	1	兵庫県	Kansai	6
639	18	10		2019-03-04 00:00:00	9	2019-03-04 10:09:21.654333	2019-03-05 03:15:26.544308	2	東京都	Kantou	72
633	17	10		2019-03-04 00:00:00	9	2019-03-04 08:59:44.763622	2019-03-08 10:29:25.75483	3	東京都	Kantou	79
629	16	10		2019-03-04 00:00:00	12	2019-03-03 21:56:10.485295	2019-03-09 13:24:19.754667	4	兵庫県	Kansai	4
626	9	10		2019-03-04 00:00:00	12	2019-03-03 21:53:22.149875	2019-03-08 00:19:36.015939	1	兵庫県	Kansai	8
631	4	10		2019-03-04 00:00:00	12	2019-03-03 21:58:59.220039	2019-03-10 18:39:55.952755	26	兵庫県	Kansai	56
625	19	10		2019-03-04 00:00:00	12	2019-03-03 21:52:11.107337	2019-03-10 19:53:18.484619	1	兵庫県	Kansai	5
621	36	10		2019-03-04 00:00:00	12	2019-03-03 21:43:24.973556	2019-03-10 20:55:29.558867	14	兵庫県	Kansai	54
941	50	21		2019-05-20 00:00:00	12	2019-05-19 17:45:59.304144	2019-05-19 17:45:59.304144	0	兵庫県	Kansai	50
1002	18	23		2019-06-03 00:00:00	12	2019-06-02 06:22:45.156076	2019-06-05 15:36:31.787262	2	兵庫県	Kansai	91
974	20	22		2019-05-27 00:00:00	9	2019-05-27 02:54:42.315756	2019-05-27 02:54:42.315756	0	東京都	Kantou	74
970	17	22		2019-05-27 00:00:00	9	2019-05-27 02:53:50.787148	2019-05-31 17:52:49.390061	3	東京都	Kantou	80
976	18	22		2019-05-27 00:00:00	9	2019-05-27 02:54:59.732638	2019-05-31 17:52:49.482394	2	東京都	Kantou	78
989	0	22		2019-05-27 00:00:00	17	2019-05-28 08:48:47.623167	2019-05-31 21:42:52.639764	37	京都府	Kansai	94
1001	9	23		2019-06-03 00:00:00	12	2019-06-02 06:22:16.490336	2019-06-03 12:15:01.804029	1	兵庫県	Kansai	93
663	15	11		2019-03-11 00:00:00	12	2019-03-10 23:56:27.314822	2019-03-10 23:56:27.314822	0	兵庫県	Kansai	44
664	15	11		2019-03-11 00:00:00	12	2019-03-10 23:57:37.770575	2019-03-10 23:57:37.770575	0	兵庫県	Kansai	45
665	15	11		2019-03-11 00:00:00	12	2019-03-10 23:58:11.094874	2019-03-10 23:58:11.094874	0	兵庫県	Kansai	46
666	17	11		2019-03-11 00:00:00	9	2019-03-11 08:56:42.661173	2019-03-15 10:47:36.447121	3	東京都	Kantou	80
646	0	10	にんじん・大根・れんこん・海老芋・じゃがいも・かつお菜・小松菜・紅菜苔・花菜・ブロッコリー・ネギなどから7品目程度	2019-03-04 00:00:00	17	2019-03-05 14:23:28.099985	2019-03-05 17:59:09.955628	5	京都府	Kansai	59
673	16	11		2019-03-11 00:00:00	9	2019-03-11 08:58:20.041244	2019-03-15 10:48:28.193529	4	東京都	Kantou	79
668	18	11		2019-03-11 00:00:00	9	2019-03-11 08:57:15.651381	2019-03-15 10:52:59.347008	2	東京都	Kantou	73
647	20	6	\N	2019-02-03 15:00:00	12	2019-03-07 09:32:14.349842	2019-03-07 09:32:14.349842	0	兵庫県	Kansai	1
648	20	9	\N	2019-02-24 15:00:00	12	2019-03-07 09:32:47.71889	2019-03-07 09:32:47.71889	0	兵庫県	Kansai	1
650	5	10		2019-03-04 00:00:00	12	2019-03-07 10:29:07.089105	2019-03-07 10:29:07.089105	0	兵庫県	Kansai	39
653	5	10		2019-03-04 00:00:00	12	2019-03-07 10:32:44.314742	2019-03-07 10:32:44.314742	0	兵庫県	Kansai	33
667	20	11		2019-03-11 00:00:00	9	2019-03-11 08:56:57.785134	2019-03-11 08:56:57.785134	0	東京都	Kantou	72
669	20	11		2019-03-11 00:00:00	9	2019-03-11 08:57:29.902261	2019-03-11 08:57:29.902261	0	東京都	Kantou	74
649	1	10		2019-03-04 00:00:00	12	2019-03-07 10:28:56.683072	2019-03-07 10:50:04.596003	4	兵庫県	Kansai	37
632	16	10		2019-03-04 00:00:00	9	2019-03-04 08:59:33.204232	2019-03-07 19:50:18.772768	4	東京都	Kantou	78
643	17	10		2019-03-04 00:00:00	9	2019-03-04 10:10:23.795094	2019-03-08 10:28:01.988684	3	東京都	Kantou	80
679	6	11		2019-03-11 00:00:00	12	2019-03-11 11:20:31.560101	2019-03-11 11:20:31.560101	0	兵庫県	Kansai	1
657	19	11		2019-03-11 00:00:00	12	2019-03-10 23:43:51.032451	2019-03-11 12:35:49.708772	1	兵庫県	Kansai	8
684	20	12		2019-03-18 00:00:00	9	2019-03-18 01:21:22.814645	2019-03-18 01:21:22.814645	0	東京都	Kantou	75
685	20	12		2019-03-18 00:00:00	9	2019-03-18 01:21:30.91579	2019-03-18 01:21:30.91579	0	東京都	Kantou	74
686	20	12		2019-03-18 00:00:00	9	2019-03-18 01:21:39.58053	2019-03-18 01:21:39.58053	0	東京都	Kantou	73
654	11	10		2019-03-04 00:00:00	12	2019-03-07 13:51:51.867447	2019-03-10 10:16:10.121856	9	兵庫県	Kansai	44
644	3	10		2019-03-04 00:00:00	12	2019-03-04 20:24:57.370863	2019-03-10 10:16:22.724008	7	兵庫県	Kansai	45
645	8	10		2019-03-04 00:00:00	12	2019-03-04 20:25:21.710192	2019-03-10 10:16:27.742649	2	兵庫県	Kansai	46
671	19	11		2019-03-11 00:00:00	9	2019-03-11 08:57:59.704327	2019-03-14 17:54:38.788296	1	東京都	Kantou	77
672	19	11		2019-03-11 00:00:00	9	2019-03-11 08:58:09.52172	2019-03-14 17:54:38.805155	1	東京都	Kantou	78
656	48	11		2019-03-11 00:00:00	12	2019-03-10 23:43:16.042911	2019-03-12 17:28:36.184163	2	兵庫県	Kansai	5
655	29	11		2019-03-11 00:00:00	12	2019-03-10 23:42:09.287392	2019-03-12 19:03:26.082295	1	兵庫県	Kansai	3
658	19	11		2019-03-11 00:00:00	12	2019-03-10 23:44:31.040707	2019-03-16 09:21:38.059018	1	兵庫県	Kansai	6
677	4	11		2019-03-11 00:00:00	12	2019-03-11 10:29:16.615929	2019-03-16 10:12:43.962447	1	兵庫県	Kansai	57
691	20	12		2019-03-18 00:00:00	9	2019-03-18 01:23:38.620877	2019-03-18 01:23:38.620877	0	東京都	Kantou	80
670	18	11		2019-03-11 00:00:00	9	2019-03-11 08:57:43.228614	2019-03-13 08:24:10.52251	2	東京都	Kantou	75
674	29	11		2019-03-11 00:00:00	12	2019-03-11 10:27:59.418648	2019-03-13 12:21:29.274877	1	兵庫県	Kansai	52
693	20	12		2019-03-18 00:00:00	12	2019-03-18 05:50:51.461566	2019-03-18 05:50:51.461566	0	兵庫県	Kansai	6
695	20	12		2019-03-18 00:00:00	12	2019-03-18 05:55:53.215241	2019-03-18 05:55:53.215241	0	兵庫県	Kansai	3
680	0	11	にんじん・大根・れんこん・海老芋・じゃがいも・かつお菜・小松菜・紅菜苔・菜の花・ブロッコリー・ネギなどから7品目程度	2019-03-11 00:00:00	17	2019-03-14 21:15:24.793753	2019-03-15 08:13:43.857052	5	京都府	Kansai	59
659	25	11		2019-03-11 00:00:00	12	2019-03-10 23:45:55.808648	2019-03-17 08:14:20.294656	5	兵庫県	Kansai	2
661	32	11		2019-03-11 00:00:00	12	2019-03-10 23:48:19.939863	2019-03-17 16:12:08.196942	18	兵庫県	Kansai	54
662	27	11		2019-03-11 00:00:00	12	2019-03-10 23:53:07.299838	2019-03-17 17:38:28.33369	23	兵庫県	Kansai	56
660	19	11		2019-03-11 00:00:00	12	2019-03-10 23:47:01.880947	2019-03-17 21:14:38.623424	1	兵庫県	Kansai	4
681	20	12		2019-03-18 00:00:00	9	2019-03-18 01:20:51.461127	2019-03-18 01:20:51.461127	0	東京都	Kantou	79
682	20	12		2019-03-18 00:00:00	9	2019-03-18 01:21:00.216462	2019-03-18 01:21:00.216462	0	東京都	Kantou	78
683	20	12		2019-03-18 00:00:00	9	2019-03-18 01:21:11.549727	2019-03-18 01:21:11.549727	0	東京都	Kantou	77
703	0	10	\N	2019-03-03 15:00:00	9	2019-03-18 18:14:30.903226	2019-03-18 18:14:30.903226	0	東京都	Kantou	20
690	19	12		2019-03-18 00:00:00	9	2019-03-18 01:23:07.004252	2019-03-19 10:56:31.563892	1	東京都	Kantou	72
696	29	12		2019-03-18 00:00:00	12	2019-03-18 05:57:22.033891	2019-03-24 23:06:35.386439	22	兵庫県	Kansai	54
701	29	12		2019-03-18 00:00:00	12	2019-03-18 09:10:36.871396	2019-03-19 11:15:53.524185	1	兵庫県	Kansai	52
698	18	12		2019-03-18 00:00:00	12	2019-03-18 06:00:26.173928	2019-03-24 11:28:20.424715	2	兵庫県	Kansai	4
700	5	12		2019-03-18 00:00:00	12	2019-03-18 09:10:20.942327	2019-03-24 10:10:02.77703	4	兵庫県	Kansai	57
694	28	12		2019-03-18 00:00:00	12	2019-03-18 05:55:11.185961	2019-03-21 23:30:12.647505	2	兵庫県	Kansai	5
692	19	12		2019-03-18 00:00:00	12	2019-03-18 05:50:08.040609	2019-03-22 12:45:27.832023	1	兵庫県	Kansai	8
697	26	12		2019-03-18 00:00:00	12	2019-03-18 05:59:12.204868	2019-03-23 18:26:02.050642	4	兵庫県	Kansai	2
699	35	12		2019-03-18 00:00:00	12	2019-03-18 06:02:04.026186	2019-03-23 14:02:10.742327	15	兵庫県	Kansai	56
708	17	13		2019-03-25 00:00:00	9	2019-03-25 09:12:19.124375	2019-03-31 23:43:02.121618	3	東京都	Kantou	73
705	39	13		2019-03-25 00:00:00	12	2019-03-24 10:10:41.560826	2019-03-31 23:46:09.922453	11	兵庫県	Kansai	50
702	27	12		2019-03-18 00:00:00	12	2019-03-18 09:10:52.905231	2019-03-24 20:34:21.884719	3	兵庫県	Kansai	50
707	20	13		2019-03-25 00:00:00	9	2019-03-25 09:12:01.522248	2019-03-25 09:12:01.522248	0	東京都	Kantou	72
709	20	13		2019-03-25 00:00:00	9	2019-03-25 09:12:27.95126	2019-03-25 09:12:27.95126	0	東京都	Kantou	74
710	20	13		2019-03-25 00:00:00	9	2019-03-25 09:12:39.942994	2019-03-25 09:12:39.942994	0	東京都	Kantou	75
706	17	13		2019-03-25 00:00:00	9	2019-03-25 09:11:47.92627	2019-03-31 23:43:02.147868	3	東京都	Kantou	80
711	20	13		2019-03-25 00:00:00	9	2019-03-25 09:12:58.185444	2019-03-25 09:12:58.185444	0	東京都	Kantou	77
943	30	21		2019-05-20 00:00:00	12	2019-05-19 23:34:14.35725	2019-05-19 23:34:14.35725	0	兵庫県	Kansai	56
713	18	13		2019-03-25 00:00:00	9	2019-03-25 09:13:18.060082	2019-03-30 18:46:25.179285	2	東京都	Kantou	79
991	48	23		2019-06-03 00:00:00	12	2019-05-30 17:46:08.669906	2019-06-04 18:03:27.162899	2	兵庫県	Kansai	52
984	15	22		2019-05-27 00:00:00	12	2019-05-27 09:21:05.851974	2019-05-31 23:06:24.276789	18	兵庫県	Kansai	90
986	13	22		2019-05-27 00:00:00	12	2019-05-27 09:21:32.718028	2019-06-01 17:53:53.940872	17	兵庫県	Kansai	92
960	27	22		2019-05-27 00:00:00	12	2019-05-24 11:49:09.766372	2019-06-01 18:06:38.510529	23	兵庫県	Kansai	52
959	7	22		2019-05-27 00:00:00	12	2019-05-24 11:48:57.312175	2019-06-01 22:20:24.9936	40	兵庫県	Kansai	89
968	6	22		2019-05-27 00:00:00	21	2019-05-27 02:53:02.984305	2019-06-01 22:29:07.238651	24	滋賀県	Kansai	20
993	48	23		2019-06-03 00:00:00	12	2019-05-30 17:46:51.17866	2019-06-03 23:05:27.88878	2	兵庫県	Kansai	83
961	39	22		2019-05-27 00:00:00	12	2019-05-24 11:49:24.325348	2019-05-31 17:52:49.576247	11	兵庫県	Kansai	50
712	20	13		2019-03-25 00:00:00	9	2019-03-25 09:13:09.70424	2019-03-25 09:13:09.70424	0	東京都	Kantou	78
719	\N	16		2019-04-15 00:00:00	21	2019-03-25 10:40:01.548634	2019-03-25 10:40:01.548634	0	滋賀県	Kansai	20
733	2	13		2019-03-25 00:00:00	9	2019-03-25 22:11:06.93115	2019-03-31 21:37:32.898166	1	東京都	Kantou	76
722	5	13		2019-03-25 00:00:00	12	2019-03-25 11:56:42.323413	2019-03-31 23:16:46.005107	50	兵庫県	Kansai	54
726	17	13		2019-03-25 00:00:00	12	2019-03-25 11:58:27.628973	2019-03-31 23:27:23.972901	13	兵庫県	Kansai	2
716	2	13		2019-03-25 00:00:00	21	2019-03-25 10:39:24.935032	2019-03-31 23:41:16.167799	18	滋賀県	Kansai	20
704	25	13		2019-03-25 00:00:00	12	2019-03-24 10:10:27.494474	2019-03-31 23:59:42.362615	25	兵庫県	Kansai	52
723	23	13		2019-03-25 00:00:00	12	2019-03-25 11:56:59.301145	2019-03-31 21:48:32.707937	27	兵庫県	Kansai	56
715	30	13		2019-03-25 00:00:00	12	2019-03-25 10:34:26.324053	2019-03-25 12:12:06.36194	0	兵庫県	Kansai	45
754	20	14		2019-04-01 00:00:00	9	2019-04-01 01:08:44.743691	2019-04-01 01:08:44.743691	0	東京都	Kantou	80
755	20	14		2019-04-01 00:00:00	9	2019-04-01 01:09:05.18201	2019-04-01 01:09:05.18201	0	東京都	Kantou	72
756	20	14		2019-04-01 00:00:00	9	2019-04-01 01:09:19.258095	2019-04-01 01:09:19.258095	0	東京都	Kantou	73
732	30	13		2019-03-25 00:00:00	12	2019-03-25 15:44:46.835626	2019-03-25 15:44:46.835626	0	兵庫県	Kansai	1
757	20	14		2019-04-01 00:00:00	9	2019-04-01 01:09:29.912418	2019-04-01 01:09:29.912418	0	東京都	Kantou	74
714	0	13		2019-03-25 00:00:00	9	2019-03-25 10:08:47.921253	2019-03-25 17:54:44.141673	0	東京都	Kantou	56
730	4	13		2019-03-25 00:00:00	12	2019-03-25 12:05:58.937121	2019-03-31 18:11:16.178526	1	兵庫県	Kansai	6
758	20	14		2019-04-01 00:00:00	9	2019-04-01 01:09:38.50303	2019-04-01 01:09:38.50303	0	東京都	Kantou	75
729	26	13		2019-03-25 00:00:00	12	2019-03-25 12:05:39.47495	2019-03-31 18:14:33.675965	4	兵庫県	Kansai	8
734	10	13		2019-03-25 00:00:00	12	2019-03-26 10:16:30.654792	2019-03-26 10:16:30.654792	0	兵庫県	Kansai	37
736	10	13		2019-03-25 00:00:00	12	2019-03-26 10:16:50.572142	2019-03-26 10:16:50.572142	0	兵庫県	Kansai	42
737	10	13		2019-03-25 00:00:00	12	2019-03-26 10:17:00.468929	2019-03-26 10:17:00.468929	0	兵庫県	Kansai	39
738	10	13		2019-03-25 00:00:00	12	2019-03-26 10:17:15.402895	2019-03-26 10:17:15.402895	0	兵庫県	Kansai	33
760	20	14		2019-04-01 00:00:00	9	2019-04-01 01:10:00.273356	2019-04-01 01:10:00.273356	0	東京都	Kantou	77
761	20	14		2019-04-01 00:00:00	9	2019-04-01 01:10:10.652661	2019-04-01 01:10:10.652661	0	東京都	Kantou	78
739	10	13		2019-03-25 00:00:00	12	2019-03-26 17:05:41.944286	2019-03-26 17:05:41.944286	0	兵庫県	Kansai	44
741	10	13		2019-03-25 00:00:00	12	2019-03-26 17:20:15.982352	2019-03-26 17:20:15.982352	0	兵庫県	Kansai	46
746	0	14		2019-04-01 00:00:00	12	2019-03-31 21:23:01.431256	2019-04-07 14:44:09.193552	1	兵庫県	Kansai	2
724	33	13		2019-03-25 00:00:00	12	2019-03-25 11:57:36.795954	2019-03-31 22:37:06.545407	7	兵庫県	Kansai	5
762	20	14		2019-04-01 00:00:00	9	2019-04-01 01:10:17.304504	2019-04-01 01:10:17.304504	0	東京都	Kantou	79
742	39	14		2019-04-01 00:00:00	12	2019-03-31 21:19:51.646107	2019-04-04 17:49:46.15551	1	兵庫県	Kansai	5
728	0	13		2019-03-25 00:00:00	12	2019-03-25 12:04:32.4252	2019-03-30 21:13:47.199466	5	兵庫県	Kansai	57
727	19	13		2019-03-25 00:00:00	12	2019-03-25 11:58:49.16119	2019-03-31 20:33:48.158383	11	兵庫県	Kansai	4
745	30	14		2019-04-01 00:00:00	12	2019-03-31 21:22:06.415892	2019-03-31 21:22:06.415892	0	兵庫県	Kansai	8
778	7	14		2019-04-01 00:00:00	12	2019-04-03 09:32:33.361787	2019-04-03 09:32:33.361787	0	兵庫県	Kansai	57
725	19	13		2019-03-25 00:00:00	12	2019-03-25 11:57:47.251415	2019-03-31 22:47:55.994212	11	兵庫県	Kansai	3
748	50	14		2019-04-01 00:00:00	12	2019-03-31 21:25:12.33551	2019-03-31 21:25:12.33551	0	兵庫県	Kansai	15
767	47	14		2019-04-01 00:00:00	12	2019-04-02 16:25:53.506857	2019-04-07 21:42:28.754826	3	兵庫県	Kansai	83
777	0	14		2019-04-01 00:00:00	12	2019-04-02 21:02:48.262284	2019-04-07 14:42:10.131941	20	兵庫県	Kansai	56
765	48	14		2019-04-01 00:00:00	12	2019-04-01 11:27:43.024587	2019-04-02 13:15:04.070525	2	兵庫県	Kansai	50
751	0	14		2019-04-01 00:00:00	12	2019-03-31 21:27:18.315494	2019-04-02 14:08:03.802686	0	兵庫県	Kansai	46
752	0	14		2019-04-01 00:00:00	12	2019-03-31 21:28:59.691229	2019-04-02 14:08:15.386766	0	兵庫県	Kansai	45
750	0	14		2019-04-01 00:00:00	12	2019-03-31 21:26:46.40515	2019-04-02 14:08:29.520895	0	兵庫県	Kansai	81
766	0	14		2019-04-01 00:00:00	9	2019-04-02 12:59:23.525811	2019-04-04 07:55:51.828706	1	東京都	Kantou	76
743	29	14		2019-04-01 00:00:00	12	2019-03-31 21:20:30.326142	2019-04-02 21:29:25.817732	1	兵庫県	Kansai	3
717	17	14		2019-04-01 00:00:00	21	2019-03-25 10:39:36.375923	2019-04-04 22:53:59.036463	3	滋賀県	Kansai	20
744	19	14		2019-04-01 00:00:00	12	2019-03-31 21:21:10.154471	2019-04-05 22:34:06.3611	1	兵庫県	Kansai	6
772	47	14		2019-04-01 00:00:00	12	2019-04-02 16:28:10.163093	2019-04-04 15:19:38.384097	3	兵庫県	Kansai	84
779	30	15		2019-04-08 00:00:00	12	2019-04-08 01:44:25.684681	2019-04-08 01:44:25.684681	0	兵庫県	Kansai	8
764	48	14		2019-04-01 00:00:00	12	2019-04-01 11:27:30.498231	2019-04-04 09:04:34.203364	2	兵庫県	Kansai	52
749	0	14		2019-04-01 00:00:00	12	2019-03-31 21:25:55.065222	2019-04-07 14:42:54.845067	9	兵庫県	Kansai	54
747	0	14		2019-04-01 00:00:00	12	2019-03-31 21:24:14.435503	2019-04-07 14:43:30.112156	2	兵庫県	Kansai	4
773	49	15		2019-04-08 00:00:00	12	2019-04-02 16:29:51.937619	2019-04-10 14:42:32.698817	1	兵庫県	Kansai	84
780	29	15		2019-04-08 00:00:00	12	2019-04-08 01:44:56.376946	2019-04-10 14:42:32.596545	1	兵庫県	Kansai	6
718	17	15		2019-04-08 00:00:00	21	2019-03-25 10:39:48.553614	2019-04-12 14:50:19.269683	3	滋賀県	Kansai	20
768	47	15		2019-04-08 00:00:00	12	2019-04-02 16:26:14.744111	2019-04-12 01:42:03.765576	3	兵庫県	Kansai	83
781	49	15		2019-04-08 00:00:00	12	2019-04-08 01:45:36.771149	2019-04-13 09:45:50.491608	1	兵庫県	Kansai	5
769	36	16		2019-04-15 00:00:00	12	2019-04-02 16:26:34.167827	2019-04-21 16:52:31.975463	14	兵庫県	Kansai	83
774	47	16		2019-04-15 00:00:00	12	2019-04-02 16:30:05.423004	2019-04-20 19:50:28.838689	3	兵庫県	Kansai	84
776	43	18		2019-04-29 00:00:00	12	2019-04-02 16:30:48.022144	2019-04-30 22:58:32.507364	7	兵庫県	Kansai	84
770	44	17		2019-04-22 00:00:00	12	2019-04-02 16:26:49.758521	2019-04-26 16:43:33.384444	6	兵庫県	Kansai	83
775	44	17		2019-04-22 00:00:00	12	2019-04-02 16:30:33.713268	2019-04-28 23:59:56.97369	6	兵庫県	Kansai	84
720	13	17		2019-04-22 00:00:00	21	2019-03-25 10:40:17.389509	2019-04-28 10:58:44.48056	7	滋賀県	Kansai	20
771	30	18		2019-04-29 00:00:00	12	2019-04-02 16:27:02.782203	2019-05-04 15:43:11.094787	20	兵庫県	Kansai	83
783	19	15		2019-04-08 00:00:00	12	2019-04-08 01:47:15.802406	2019-04-08 18:58:43.936008	1	兵庫県	Kansai	45
945	20	21		2019-05-20 00:00:00	9	2019-05-20 00:03:25.227894	2019-05-20 00:03:25.227894	0	東京都	Kantou	80
949	20	21		2019-05-20 00:00:00	9	2019-05-20 00:04:33.495645	2019-05-20 00:04:33.495645	0	東京都	Kantou	73
953	20	21		2019-05-20 00:00:00	9	2019-05-20 00:05:09.697312	2019-05-20 00:05:09.697312	0	東京都	Kantou	79
955	20	21		2019-05-20 00:00:00	9	2019-05-20 00:06:18.582252	2019-05-20 00:06:18.582252	0	東京都	Kantou	75
958	0	21		2019-05-20 00:00:00	12	2019-05-23 23:33:36.359226	2019-05-24 12:05:13.716636	1	兵庫県	Kansai	24
997	42	23		2019-06-03 00:00:00	12	2019-06-02 06:14:06.000364	2019-06-05 17:28:01.401684	8	兵庫県	Kansai	54
981	15	22		2019-05-27 00:00:00	12	2019-05-27 09:19:43.667694	2019-06-01 22:20:25.086443	15	兵庫県	Kansai	93
983	0	22		2019-05-27 00:00:00	12	2019-05-27 09:20:14.470085	2019-06-02 06:12:47.441389	0	兵庫県	Kansai	5
985	16	22		2019-05-27 00:00:00	12	2019-05-27 09:21:19.485385	2019-06-02 22:10:48.85084	17	兵庫県	Kansai	91
913	25	20		2019-05-13 00:00:00	12	2019-05-10 09:32:32.302592	2019-05-17 18:49:57.70202	5	兵庫県	Kansai	52
915	20	20		2019-05-13 00:00:00	12	2019-05-10 09:33:02.118623	2019-05-18 09:17:00.207875	10	兵庫県	Kansai	83
790	20	15		2019-04-08 00:00:00	9	2019-04-08 09:44:34.988771	2019-04-08 09:44:34.988771	0	東京都	Kantou	80
791	20	15		2019-04-08 00:00:00	9	2019-04-08 09:44:47.419998	2019-04-08 09:44:47.419998	0	東京都	Kantou	72
792	20	15		2019-04-08 00:00:00	9	2019-04-08 09:45:02.080365	2019-04-08 09:45:02.080365	0	東京都	Kantou	74
793	20	15		2019-04-08 00:00:00	9	2019-04-08 09:45:11.090267	2019-04-08 09:45:11.090267	0	東京都	Kantou	61
795	20	15		2019-04-08 00:00:00	9	2019-04-08 09:45:38.824047	2019-04-08 09:45:38.824047	0	東京都	Kantou	75
796	20	15		2019-04-08 00:00:00	9	2019-04-08 09:45:50.113422	2019-04-08 09:45:50.113422	0	東京都	Kantou	77
797	20	15		2019-04-08 00:00:00	9	2019-04-08 09:46:24.347367	2019-04-08 09:46:24.347367	0	東京都	Kantou	78
798	20	15		2019-04-08 00:00:00	9	2019-04-08 09:46:36.400148	2019-04-08 09:46:36.400148	0	東京都	Kantou	79
946	20	21		2019-05-20 00:00:00	9	2019-05-20 00:04:02.045392	2019-05-20 00:04:02.045392	0	東京都	Kantou	72
794	18	15		2019-04-08 00:00:00	9	2019-04-08 09:45:27.860305	2019-04-08 18:26:39.181059	2	東京都	Kantou	73
789	6	15		2019-04-08 00:00:00	12	2019-04-08 09:21:50.455277	2019-04-09 07:46:49.783319	1	兵庫県	Kansai	57
948	20	21		2019-05-20 00:00:00	9	2019-05-20 00:04:24.85521	2019-05-20 00:04:24.85521	0	東京都	Kantou	74
950	20	21		2019-05-20 00:00:00	9	2019-05-20 00:04:46.321705	2019-05-20 00:04:46.321705	0	東京都	Kantou	77
952	20	21		2019-05-20 00:00:00	9	2019-05-20 00:05:02.027924	2019-05-20 00:05:02.027924	0	東京都	Kantou	78
821	8	16		2019-04-15 00:00:00	12	2019-04-16 10:11:43.120336	2019-04-16 10:19:01.827697	2	兵庫県	Kansai	46
802	48	16		2019-04-15 00:00:00	12	2019-04-12 16:50:56.462667	2019-04-21 21:57:49.772524	2	兵庫県	Kansai	50
820	7	16		2019-04-15 00:00:00	12	2019-04-16 10:11:12.096104	2019-04-16 10:20:03.052126	3	兵庫県	Kansai	45
833	0	17		2019-04-22 00:00:00	12	2019-04-22 09:10:45.467875	2019-04-26 16:43:33.436216	14	兵庫県	Kansai	87
782	46	15		2019-04-08 00:00:00	12	2019-04-08 01:46:06.448663	2019-04-14 14:32:07.44614	4	兵庫県	Kansai	3
810	30	16		2019-04-15 00:00:00	12	2019-04-15 03:38:00.55992	2019-04-15 03:38:00.55992	0	兵庫県	Kansai	8
827	20	16		2019-04-15 00:00:00	9	2019-04-16 13:36:01.163934	2019-04-16 13:36:01.163934	0	東京都	Kantou	72
824	100	16		2019-04-15 00:00:00	9	2019-04-16 13:35:37.772932	2019-04-16 13:40:42.848855	0	東京都	Kantou	74
785	49	15		2019-04-08 00:00:00	12	2019-04-08 09:17:57.622476	2019-04-11 08:49:12.4355	1	兵庫県	Kansai	52
832	6	16		2019-04-15 00:00:00	12	2019-04-21 11:55:36.55326	2019-04-21 23:45:36.922371	14	兵庫県	Kansai	87
811	2	16		2019-04-15 00:00:00	12	2019-04-15 03:44:47.663649	2019-04-21 23:47:37.794474	45	兵庫県	Kansai	86
784	17	15		2019-04-08 00:00:00	12	2019-04-08 01:47:50.59681	2019-04-11 11:43:44.444783	3	兵庫県	Kansai	46
813	20	16		2019-04-15 00:00:00	9	2019-04-15 19:42:10.163601	2019-04-15 19:42:10.163601	0	東京都	Kantou	26
814	20	16		2019-04-15 00:00:00	9	2019-04-15 19:42:19.230367	2019-04-15 19:42:19.230367	0	東京都	Kantou	73
816	20	16		2019-04-15 00:00:00	9	2019-04-15 19:42:38.474234	2019-04-15 19:42:38.474234	0	東京都	Kantou	75
817	20	16		2019-04-15 00:00:00	9	2019-04-15 19:42:49.579812	2019-04-15 19:42:49.579812	0	東京都	Kantou	77
828	6	16		2019-04-15 00:00:00	12	2019-04-17 09:47:50.0562	2019-04-17 09:47:50.0562	0	兵庫県	Kansai	57
786	48	15		2019-04-08 00:00:00	12	2019-04-08 09:18:10.293113	2019-04-12 12:44:53.741671	2	兵庫県	Kansai	50
818	20	16		2019-04-15 00:00:00	9	2019-04-15 19:42:58.80346	2019-04-15 19:42:58.80346	0	東京都	Kantou	78
809	47	16		2019-04-15 00:00:00	12	2019-04-15 03:37:27.08043	2019-04-21 23:55:46.910863	3	兵庫県	Kansai	5
807	47	16		2019-04-15 00:00:00	12	2019-04-15 03:36:04.346005	2019-04-20 00:37:09.359838	3	兵庫県	Kansai	3
808	28	16		2019-04-15 00:00:00	12	2019-04-15 03:36:46.389079	2019-04-16 08:51:17.417703	2	兵庫県	Kansai	6
834	20	17		2019-04-22 00:00:00	9	2019-04-22 10:46:00.209884	2019-04-22 10:46:00.209884	0	東京都	Kantou	80
799	5	15	\r\n	2019-04-08 00:00:00	12	2019-04-09 14:58:42.166858	2019-04-20 23:18:16.339478	65	兵庫県	Kansai	86
836	20	17		2019-04-22 00:00:00	9	2019-04-22 10:46:25.770941	2019-04-22 10:46:25.770941	0	東京都	Kantou	73
801	48	16		2019-04-15 00:00:00	12	2019-04-12 16:50:31.133568	2019-04-21 02:38:55.241703	2	兵庫県	Kansai	52
819	19	16		2019-04-15 00:00:00	9	2019-04-15 19:43:07.321213	2019-04-21 02:38:55.292335	1	東京都	Kantou	79
812	19	16		2019-04-15 00:00:00	9	2019-04-15 19:35:43.959122	2019-04-21 02:38:55.342078	1	東京都	Kantou	80
837	20	17		2019-04-22 00:00:00	9	2019-04-22 10:46:35.935776	2019-04-22 10:46:35.935776	0	東京都	Kantou	74
840	20	17		2019-04-22 00:00:00	9	2019-04-22 10:46:55.942712	2019-04-22 10:46:55.942712	0	東京都	Kantou	75
831	24	17		2019-04-22 00:00:00	12	2019-04-17 11:55:21.770448	2019-04-27 12:40:27.163925	6	兵庫県	Kansai	52
841	20	17		2019-04-22 00:00:00	9	2019-04-22 10:47:06.252602	2019-04-22 10:47:06.252602	0	東京都	Kantou	77
842	20	17		2019-04-22 00:00:00	9	2019-04-22 10:47:14.71804	2019-04-22 10:47:14.71804	0	東京都	Kantou	78
843	20	17		2019-04-22 00:00:00	9	2019-04-22 10:47:23.048027	2019-04-22 10:47:23.048027	0	東京都	Kantou	79
847	2	17		2019-04-22 00:00:00	12	2019-04-23 07:22:34.654645	2019-04-28 21:55:29.456813	38	兵庫県	Kansai	54
845	6	17		2019-04-22 00:00:00	12	2019-04-23 07:13:33.776648	2019-04-28 15:35:54.05954	4	兵庫県	Kansai	6
835	19	17		2019-04-22 00:00:00	9	2019-04-22 10:46:12.273426	2019-04-28 17:26:05.036319	1	東京都	Kantou	72
830	29	17		2019-04-22 00:00:00	12	2019-04-17 11:55:05.098164	2019-04-26 22:30:54.819893	1	兵庫県	Kansai	50
846	16	17		2019-04-22 00:00:00	12	2019-04-23 07:14:08.343918	2019-04-26 22:28:43.316862	4	兵庫県	Kansai	3
844	0	17		2019-04-22 00:00:00	12	2019-04-22 12:55:38.620456	2019-04-27 22:29:03.137771	5	兵庫県	Kansai	57
848	17	17		2019-04-22 00:00:00	12	2019-04-23 07:23:10.421692	2019-04-28 18:06:50.515982	13	兵庫県	Kansai	56
851	8	18	タラの芽\r\nのびろ\r\n葉玉ねぎ\r\nニラ\r\nサラダミックス\r\nレタスミックス\r\nルッコラ\r\nセルバチコ\r\nレッドマスタードリーフ\r\nフェンネル\r\nケール\r\nパースニップ\r\n人参\r\n西洋人参\r\n大豆\r\nインゲン豆\r\n金時豆\r\n黒豆\r\n菜の花\r\n九条ネギ\r\n千本ネギ\r\n長葱\r\nヤーコン\r\nヨモギ\r\n\r\n玄米\r\n\r\nもうすぐ\r\n絹さやエンドウ\r\n蕨\r\nコシアブラ\r\nセリ	2019-04-29 00:00:00	15	2019-04-23 21:56:20.838774	2019-05-05 01:09:27.380027	17	長野県	Shinetsu	24
916	29	20		2019-05-13 00:00:00	12	2019-05-10 09:33:18.598166	2019-05-13 22:12:22.929713	1	兵庫県	Kansai	84
914	29	20		2019-05-13 00:00:00	12	2019-05-10 09:32:45.835783	2019-05-14 23:33:16.392283	1	兵庫県	Kansai	50
855	0	17		2019-04-22 00:00:00	12	2019-04-24 20:45:49.288836	2019-04-28 23:15:47.954604	10	兵庫県	Kansai	5
873	20	18		2019-04-29 00:00:00	9	2019-04-29 01:54:29.161183	2019-04-29 01:54:29.161183	0	東京都	Kantou	80
856	7	17		2019-04-22 00:00:00	12	2019-04-25 09:40:05.694678	2019-04-25 09:40:05.694678	0	兵庫県	Kansai	1
875	20	18		2019-04-29 00:00:00	9	2019-04-29 01:54:56.56729	2019-04-29 01:54:56.56729	0	東京都	Kantou	74
859	5	17		2019-04-22 00:00:00	12	2019-04-25 09:48:55.239852	2019-04-25 09:48:55.239852	0	兵庫県	Kansai	39
902	11	20	タラの芽 わらび のびろ 葉玉ねぎ 絹さやエンドウ サラダミックス レタスミックス ルッコラ セルバチコ レッドマスタードリーフ パースニップ 人参 西洋人参 大豆 青大豆 黒大豆 金時豆 インゲン豆 九条ネギ 千本ネギ 長葱 ヤーコン フェンネル エディブルフラワー 玄米 もうすぐ フキ 新玉ねぎ 新赤玉ねぎ にんにくの芽	2019-05-13 00:00:00	15	2019-05-07 21:00:29.288974	2019-05-18 19:15:01.467022	14	長野県	Shinetsu	24
878	20	18		2019-04-29 00:00:00	9	2019-04-29 01:55:25.335837	2019-04-29 01:55:25.335837	0	東京都	Kantou	75
879	20	18		2019-04-29 00:00:00	9	2019-04-29 01:55:34.282055	2019-04-29 01:55:34.282055	0	東京都	Kantou	77
963	10	21		2019-05-20 00:00:00	12	2019-05-25 11:53:13.728887	2019-05-25 11:53:13.728887	0	兵庫県	Kansai	1
903	13	21	タラの芽 わらび フキ 新玉ねぎ 新赤玉ねぎ 絹さやエンドウ サラダミックス レタスミックス 春菊 ラディッシュ 西洋人参 大豆 青大豆 黒大豆 金時豆 インゲン豆 九条ネギ フェンネル エディブルフラワー 玄米 もうすぐ 筍 小松菜 青梗菜 きゅうり にんにくの芽 ミニトマト	2019-05-20 00:00:00	15	2019-05-07 21:01:23.922197	2019-05-26 15:31:09.398925	12	長野県	Shinetsu	24
954	22	21		2019-05-20 00:00:00	21	2019-05-20 00:05:39.975389	2019-05-26 21:20:55.594357	8	滋賀県	Kansai	20
987	19	22		2019-05-27 00:00:00	12	2019-05-27 09:46:21.570878	2019-06-01 18:46:05.852886	53	兵庫県	Kansai	54
990	0	22		2019-05-27 00:00:00	12	2019-05-28 19:26:48.24563	2019-06-02 06:10:53.601196	0	兵庫県	Kansai	44
858	4	17		2019-04-22 00:00:00	12	2019-04-25 09:48:44.021604	2019-04-25 20:09:46.131801	1	兵庫県	Kansai	42
880	20	18		2019-04-29 00:00:00	9	2019-04-29 01:55:43.694795	2019-04-29 01:55:43.694795	0	東京都	Kantou	78
857	4	17		2019-04-22 00:00:00	12	2019-04-25 09:48:30.114782	2019-04-25 20:10:08.456432	1	兵庫県	Kansai	37
860	4	17		2019-04-22 00:00:00	12	2019-04-25 09:49:05.859994	2019-04-25 20:10:25.362119	1	兵庫県	Kansai	33
906	10	19		2019-05-06 00:00:00	12	2019-05-10 09:08:23.426446	2019-05-10 15:02:38.092506	10	兵庫県	Kansai	44
881	20	18		2019-04-29 00:00:00	9	2019-04-29 01:55:57.727925	2019-04-29 01:55:57.727925	0	東京都	Kantou	79
888	1	18		2019-04-29 00:00:00	12	2019-04-29 14:03:41.588649	2019-05-05 11:20:42.389376	29	兵庫県	Kansai	54
861	0	17		2019-04-22 00:00:00	12	2019-04-25 09:49:22.527907	2019-05-08 19:14:49.80672	1	兵庫県	Kansai	46
864	3	17		2019-04-22 00:00:00	12	2019-04-25 09:50:28.660978	2019-04-25 20:11:18.720585	7	兵庫県	Kansai	44
882	4	18		2019-04-29 00:00:00	12	2019-04-29 13:21:33.381789	2019-04-29 13:22:09.517142	1	兵庫県	Kansai	37
863	0	17		2019-04-22 00:00:00	12	2019-04-25 09:49:51.487392	2019-05-08 19:14:32.083946	1	兵庫県	Kansai	45
890	26	19		2019-05-06 00:00:00	12	2019-05-03 12:38:53.706779	2019-05-12 15:45:43.200604	4	兵庫県	Kansai	50
886	0	18		2019-04-29 00:00:00	12	2019-04-29 13:35:48.701439	2019-05-08 19:13:17.649332	3	兵庫県	Kansai	5
884	0	18		2019-04-29 00:00:00	12	2019-04-29 13:33:25.767764	2019-05-08 19:13:51.715507	8	兵庫県	Kansai	3
850	15	17	タラの芽\r\nのびろ\r\n葉玉ねぎ\r\nニラ\r\nサラダミックス\r\nレタスミックス\r\nルッコラ\r\nセルバチコ\r\nレッドマスタードリーフ\r\nフェンネル\r\nケール\r\nパースニップ\r\n人参\r\n西洋人参\r\n大豆\r\nインゲン豆\r\n金時豆\r\n黒豆\r\n菜の花\r\n九条ネギ\r\n千本ネギ\r\n長葱\r\nヤーコン\r\nヨモギ\r\n\r\n玄米\r\n\r\nもうすぐ\r\n絹さやエンドウ\r\n蕨\r\nコシアブラ\r\nセリ	2019-04-22 00:00:00	15	2019-04-23 21:56:00.935513	2019-04-29 17:21:12.373712	6	長野県	Shinetsu	24
853	28	18		2019-04-29 00:00:00	12	2019-04-24 12:29:55.070657	2019-04-30 18:32:17.619004	2	兵庫県	Kansai	50
893	16	19		2019-05-06 00:00:00	12	2019-05-06 17:27:11.145615	2019-05-12 18:41:36.079716	14	兵庫県	Kansai	54
894	20	19		2019-05-06 00:00:00	9	2019-05-07 03:30:46.064934	2019-05-07 03:30:46.064934	0	東京都	Kantou	80
895	20	19		2019-05-06 00:00:00	9	2019-05-07 03:31:07.590499	2019-05-07 03:31:07.590499	0	東京都	Kantou	72
896	20	19		2019-05-06 00:00:00	9	2019-05-07 03:31:18.345239	2019-05-07 03:31:18.345239	0	東京都	Kantou	73
877	19	18		2019-04-29 00:00:00	9	2019-04-29 01:55:14.236858	2019-04-30 10:27:39.139582	1	東京都	Kantou	73
898	20	19		2019-05-06 00:00:00	9	2019-05-07 03:31:35.904659	2019-05-07 03:31:35.904659	0	東京都	Kantou	74
854	28	18		2019-04-29 00:00:00	12	2019-04-24 12:30:10.772646	2019-04-30 22:39:34.490316	2	兵庫県	Kansai	52
885	0	18		2019-04-29 00:00:00	12	2019-04-29 13:35:06.953356	2019-05-08 19:13:31.715242	2	兵庫県	Kansai	6
899	20	19		2019-05-06 00:00:00	9	2019-05-07 03:31:47.862101	2019-05-07 03:31:47.862101	0	東京都	Kantou	61
900	20	19		2019-05-06 00:00:00	9	2019-05-07 03:31:56.869217	2019-05-07 03:31:56.869217	0	東京都	Kantou	78
901	20	19		2019-05-06 00:00:00	9	2019-05-07 03:32:05.976778	2019-05-07 03:32:05.976778	0	東京都	Kantou	79
892	22	19		2019-05-06 00:00:00	12	2019-05-03 12:39:24.900393	2019-05-12 15:45:43.251973	8	兵庫県	Kansai	83
887	0	18	\r\n	2019-04-29 00:00:00	12	2019-04-29 13:36:31.978205	2019-05-08 19:13:01.486194	1	兵庫県	Kansai	8
874	18	18		2019-04-29 00:00:00	9	2019-04-29 01:54:44.490591	2019-05-01 15:23:50.308257	2	東京都	Kantou	72
889	30	19		2019-05-06 00:00:00	12	2019-05-03 12:38:40.157184	2019-05-03 12:38:40.157184	0	兵庫県	Kansai	52
891	30	19		2019-05-06 00:00:00	12	2019-05-03 12:39:05.465222	2019-05-03 12:39:05.465222	0	兵庫県	Kansai	84
912	10	19		2019-05-06 00:00:00	12	2019-05-10 09:16:18.872236	2019-05-10 10:06:50.182707	0	兵庫県	Kansai	1
911	7	19		2019-05-06 00:00:00	12	2019-05-10 09:15:53.786128	2019-05-10 15:02:56.8771	3	兵庫県	Kansai	45
908	8	19		2019-05-06 00:00:00	12	2019-05-10 09:14:41.526076	2019-05-10 15:03:11.07258	2	兵庫県	Kansai	46
939	35	21		2019-05-20 00:00:00	12	2019-05-19 17:45:22.062623	2019-05-26 20:43:41.983857	15	兵庫県	Kansai	83
905	14	19	内容は変更の可能性あり。\r\n玉ねぎ、スナップエンドウor実エンドウ、里芋（白芽・赤芽）、グリーンレタス、サニーレタス、ニンニク、人参チップス、菊芋チップス、ひじき他	2019-05-06 00:00:00	12	2019-05-08 11:24:14.044511	2019-05-12 19:44:46.12767	6	兵庫県	Kansai	56
852	7	19	タラの芽\r\nのびろ\r\n葉玉ねぎ\r\nニラ\r\nサラダミックス\r\nレタスミックス\r\nルッコラ\r\nセルバチコ\r\nレッドマスタードリーフ\r\nフェンネル\r\nケール\r\nパースニップ\r\n人参\r\n西洋人参\r\n大豆\r\nインゲン豆\r\n金時豆\r\n黒豆\r\n菜の花\r\n九条ネギ\r\n千本ネギ\r\n長葱\r\nヤーコン\r\nヨモギ\r\n\r\n玄米\r\n\r\nもうすぐ\r\n絹さやエンドウ\r\n蕨\r\nコシアブラ\r\nセリ	2019-05-06 00:00:00	15	2019-04-23 21:56:42.102627	2019-05-12 23:28:15.489138	18	長野県	Shinetsu	24
920	20	20		2019-05-13 00:00:00	9	2019-05-13 11:00:56.560556	2019-05-13 11:00:56.560556	0	東京都	Kantou	72
921	20	20		2019-05-13 00:00:00	9	2019-05-13 11:01:14.776384	2019-05-13 11:01:14.776384	0	東京都	Kantou	73
944	22	21		2019-05-20 00:00:00	12	2019-05-19 23:35:01.522468	2019-05-26 22:57:25.076014	28	兵庫県	Kansai	54
923	20	20		2019-05-13 00:00:00	9	2019-05-13 11:02:25.876587	2019-05-13 11:02:25.876587	0	東京都	Kantou	74
925	20	20		2019-05-13 00:00:00	9	2019-05-13 11:02:42.156831	2019-05-13 11:02:42.156831	0	東京都	Kantou	75
928	20	20		2019-05-13 00:00:00	9	2019-05-13 11:03:40.285839	2019-05-13 11:03:40.285839	0	東京都	Kantou	78
927	19	20		2019-05-13 00:00:00	9	2019-05-13 11:03:02.157134	2019-05-17 18:49:57.752999	1	東京都	Kantou	79
919	19	20		2019-05-13 00:00:00	9	2019-05-13 11:00:33.893715	2019-05-17 18:49:57.803017	1	東京都	Kantou	80
918	7	20		2019-05-13 00:00:00	12	2019-05-13 09:29:01.313296	2019-05-17 23:34:56.552525	13	兵庫県	Kansai	56
929	43	20		2019-05-13 00:00:00	21	2019-05-13 12:22:16.812441	2019-05-18 09:17:00.005835	7	滋賀県	Kansai	20
988	11	22		2019-05-27 00:00:00	12	2019-05-27 09:47:04.794424	2019-05-31 23:55:17.738212	19	兵庫県	Kansai	56
942	15	21		2019-05-20 00:00:00	12	2019-05-19 17:46:12.095286	2019-05-24 12:31:38.842256	15	兵庫県	Kansai	89
931	0	20		2019-05-13 00:00:00	17	2019-05-15 09:42:09.004292	2019-05-18 16:58:14.038266	28	京都府	Kansai	88
930	18	23	新玉ねぎ 葉赤玉ねぎ 空芯菜 サラダミックス レタスミックス ハーブミックス ケールミックス 春菊 大根間引き菜 カブ間引き菜 わらび フキ 大豆 青大豆 黒大豆 金時豆 インゲン エディブルフラワー 玄米 もうすぐ 紫蘇 大根 小カブ きゅうり にんにくの芽 ミニトマト ナス ピーマン	2019-06-03 00:00:00	15	2019-05-14 22:23:40.050753	2019-06-04 11:33:43.932402	2	長野県	Shinetsu	24
966	4	21		2019-05-20 00:00:00	12	2019-05-25 12:50:28.924352	2019-05-25 16:03:01.940135	1	兵庫県	Kansai	92
926	19	20		2019-05-13 00:00:00	9	2019-05-13 11:02:51.877437	2019-05-19 17:30:10.194631	1	東京都	Kantou	77
917	25	20		2019-05-13 00:00:00	12	2019-05-13 09:28:29.314827	2019-05-19 20:57:41.404591	25	兵庫県	Kansai	54
964	3	21		2019-05-20 00:00:00	12	2019-05-25 12:49:58.857719	2019-05-26 15:31:09.456958	2	兵庫県	Kansai	90
\.


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.stocks_id_seq', 1012, true);


--
-- Data for Name: transport_companies; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.transport_companies (id, user_id, name, created_at, updated_at) FROM stdin;
1	9	0	2019-02-16 14:21:52.833809	2019-02-16 14:21:52.833809
2	13	1	2019-02-16 14:29:58.164927	2019-02-16 14:29:58.164927
3	15	0	2019-02-16 14:29:58.17172	2019-02-16 14:29:58.17172
4	20	0	2019-02-16 14:29:58.177289	2019-02-16 14:29:58.177289
5	14	0	2019-02-16 14:29:58.18258	2019-02-16 14:29:58.18258
6	10	0	2019-02-16 14:29:58.188108	2019-02-16 14:29:58.188108
7	12	2	2019-02-16 14:29:58.193644	2019-02-16 14:29:58.193644
8	19	1	2019-02-16 14:29:58.198922	2019-02-16 14:29:58.198922
9	21	2	2019-02-16 14:29:58.204055	2019-02-16 14:29:58.204055
10	16	0	2019-02-16 14:29:58.209747	2019-02-16 14:29:58.209747
11	17	2	2019-02-16 14:29:58.214752	2019-02-16 14:29:58.214752
13	9	0	2019-04-29 16:19:38.372443	2019-04-29 16:19:38.372443
\.


--
-- Name: transport_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.transport_companies_id_seq', 13, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: aftech
--

COPY public.users (id, corporate_name, lastname, firstname, lastname_phonetic, firstname_phonetic, email, phone, zipcode, pref, area, city, street, building, password_digest, remember_digest, activation_digest, activated_at, activated, reset_digest, reset_sent_at, admin, created_at, updated_at) FROM stdin;
13	あんがとう農園	明星	孝昭	ミョウセイ	タカアキ	yasaitukuriya@gmail.com	09037661817	9291604	石川県	Hokuriku	鹿島郡中能登町	能登部下53-34-5		$2a$10$dUIwk.FQk0P4tyCCnqAxX.3I3H3kWdjiMWw.SVnJ.Lt2sZbdWCnaq	\N	$2a$10$N5AcqwQ7Yub0bvoDNC6iWOEEkadcmKJStIyebz5DK8dVB71TAz.LO	2018-08-04 09:01:24.351759	t	\N	\N	f	2018-08-04 09:01:04.985982	2018-08-04 09:01:04.985982
9	AFTECH	農業事業部	担当	ノウギョジギョ	タント	t.fujiyoshi@aftech.co.jp	08017225118	1050022	東京都	Kantou	港区	海岸2-6-31	日建ビル	$2a$10$slGIKPt1mb0DrCLBlf3QdeO0e1W.ZpvlZ6N2Sm4VnBwQJ2r4xBDk6	$2a$10$pelC2rLIZ4q3PVEamEc/gOLR7Tp2ealcKPn/45mhmIYlF8mO6ay82	$2a$10$8qqVE2KbzqEoD.I6B7406u/Qnzf9CkL0L2ZXMhIwo5MIEvHbiUtim	2018-08-03 01:02:20.747681	t	$2a$10$u6kstwtIHnhNwjCb.ix4FO70T3eKSJj3wGRsnwYNq6SQMN3SxQb3.	2018-08-30 18:34:55.484747	t	2018-08-03 00:51:32.454189	2019-06-03 12:29:10.604819
17	Red Rice 自然農園	赤穂	達郎	アコウ	タツオ	akou333@yahoo.co.jp	09022685183	6191152	京都府	Kansai	木津川市	加茂町里西上田42-2		$2a$10$GWjYyzFZ8ObqRK200wozw.aB9HvxQ5TUHWyAZMBYr/pfTZeuwd3r6	$2a$10$G/NwrRUhTKaSdahmmquxWeQbSMDZH.4Hb15ZVCOdRph8UAKm9.wpe	$2a$10$1Lii/epku0PTy/RV2v89We2CashPB.Cc16XI6bCmQLzrC45lwwnkq	2018-11-06 00:55:51.710811	t	\N	\N	f	2018-11-06 00:55:27.504667	2019-06-03 20:20:38.33902
12	ビオアグリ	柏木	大樹	カシワギ	ヒロキ	info@bioagri.jp	09077341911	6562212	兵庫県	Kansai	淡路市	佐野404-2		$2a$10$F3QoGIB2kZtTGYXvW0HVsuG6NInAygYTRSIvlOtqGxspB3wmlxXBW	\N	$2a$10$nkdHEEfw8kgDA7622JDq8OywKNjkUsgJvui3n43WQNf3Wwnhd.Rt.	2018-08-04 06:36:36.597896	t	\N	\N	f	2018-08-04 06:34:20.827404	2019-04-08 17:17:12.86004
20	飛騨高山よしま農園	与嶋	靖智	ヨシマ	ヤスノリ	info@yoshima.net	0577336216	5060044	岐阜県	error	高山市	上切町378		$2a$10$w7duRUlBBYqnfLnq7luaz.byLpdAY7Mbbf.RrPUETpTn1GNdy28zm	$2a$10$yvjvhIy97EQXwNHqlGxDj.UUrkn59TkaHnpF1NIKDNbiqc8jM.dQO	$2a$10$4bz90y8euV4TMzqsNUpFluaFMOQ1J23Mt9QUik3Tu8ePZEZDWdrfC	2018-12-06 18:31:46.642059	t	\N	2019-01-08 08:13:24.045863	f	2018-12-06 18:30:37.102024	2019-01-08 10:18:23.801241
14	まるか三代目	上平	将義	カミヒラ	マサヨシ	fusako.kamihira@gmail.com	09085087852	8730352	大分県	Kyushu	国東市	安岐町明治	4583-1	$2a$10$qUCsdpDVx90O9AzqINvR2O/820RGCXCxMUl7kiHUvA5DdSHT5flCe	\N	$2a$10$BR7nHqrEthT4SxAnSZWIHejkgP7u1XX69GAy6gwi5.S1kSVg8lEpK	2018-08-04 14:25:54.363148	t	\N	\N	f	2018-08-04 14:23:21.845938	2018-10-26 21:18:46.337105
10	うむ農園	高橋	秀彰	タカハシ	ヒデアキ	hideakitakahashi99@gmail.com	09017352078	2700035	千葉県	Kantou	松戸市	新松戸南2-25-313		$2a$10$6lcZFJN9xhSh9r7Cvf6Hn.CJG41ltMbU91Zh/1rfG.gMWrhatvRA6	\N	$2a$10$/0CePI357zLExXgX0OyP3eP6aocbB2kSAJSVEtH.ibyEc3btcyzvK	2018-08-03 03:55:28.300133	t	\N	\N	f	2018-08-03 03:54:59.663765	2018-08-03 03:54:59.663765
19	有限会社宇佐本百姓	深見	壽孝	フカミ	ヒサタカ	order@100sho.co.jp	0978333265	8790235	大分県	Kyushu	宇佐市	木部887番地		$2a$10$C7K5TXas1tAag510Ry/bLOLe5HEFf8gZ7lrgz9AFwp9TmXOuec28G	\N	$2a$10$tXFF81tOMt9C6jadShA09.JMjxzB2TMhGTDV/CywiTOspiYZLmGau	2018-11-26 10:59:57.779068	t	\N	\N	f	2018-11-26 10:59:33.182397	2018-12-21 12:54:58.551025
21	山本農園	山本	嘉紀	ヤマモト	ヨシキ	season@r6.dion.ne.jp	09096193969	5291813	滋賀県	Kansai	甲賀市	信楽町畑419-1		$2a$10$OHGnsryrz0lKDxOnCt9aJuBBLnUxukoRjUJA./okmAJel0nJfr8YK	\N	$2a$10$PGV7tgoiMQaNfcadvNQys.k4P01fiXivU/f2xzsyBbM8suXwdjl3u	2019-01-05 09:21:49.303743	t	\N	\N	f	2019-01-05 09:21:26.41338	2019-02-07 13:10:52.593429
16	ORGANIC FARM 風の谷	平川	敬介	ヒラカワ	ケイスケ	backalley20@gmail.com	09027296333	7014302	岡山県	Chugoku	瀬戸内市	牛窓町牛窓2978-3		$2a$10$vtUZJd7E9Gn9TN2VJSJlwOydh1u4zM7WSsx/GCFPr2fJtRHXqyXbO	$2a$10$ld8wOfHUTPFGMT9mZ7iJyuXQrjgBs.OTp3q6EZ9KRSqrLoqZ/ENs.	$2a$10$pDGJOpqo8WhAHiRawZZfDuvOxUlPwDNAfky1LOKK24HBJ9WJUO7x.	2018-08-09 01:11:55.645644	t	\N	\N	f	2018-08-09 01:11:22.295831	2018-11-14 12:28:51.02289
15	ずくなし農園	中村	真仁	ナカムラ	マニ	slowcafe1974@gmail.com	07069639191	3890813	長野県	Shinetsu	千曲市	若宮1425		$2a$10$dqPRAXSTpMr8kgQTYQLpvOKAGEjnpOPuQVap7JKwnitGOAi/j6Dci	\N	$2a$10$5ySGNQ6wXnfI2F0OHq/ZK.hiBKOlh/c0duE8.1DZvDOqKlPf6DNqe	2018-08-05 08:56:42.157529	t	\N	2018-11-21 22:11:01.008645	f	2018-08-05 08:56:14.277245	2019-05-15 05:53:18.835307
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aftech
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: postages postages_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.postages
    ADD CONSTRAINT postages_pkey PRIMARY KEY (id);


--
-- Name: product_items product_items_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_pkey PRIMARY KEY (id);


--
-- Name: room_managers room_managers_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.room_managers
    ADD CONSTRAINT room_managers_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: transport_companies transport_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.transport_companies
    ADD CONSTRAINT transport_companies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_messages_on_room_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_messages_on_room_id ON public.messages USING btree (room_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_messages_on_user_id ON public.messages USING btree (user_id);


--
-- Name: index_orders_on_area; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_orders_on_area ON public.orders USING btree (area);


--
-- Name: index_orders_on_stock_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_orders_on_stock_id ON public.orders USING btree (stock_id);


--
-- Name: index_orders_on_stock_id_and_created_at; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_orders_on_stock_id_and_created_at ON public.orders USING btree (stock_id, created_at);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_orders_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_orders_on_user_id_and_created_at ON public.orders USING btree (user_id, created_at);


--
-- Name: index_postages_on_id_and_item_type; Type: INDEX; Schema: public; Owner: aftech
--

CREATE UNIQUE INDEX index_postages_on_id_and_item_type ON public.postages USING btree (id, item_type);


--
-- Name: index_postages_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_postages_on_user_id ON public.postages USING btree (user_id);


--
-- Name: index_product_items_on_product_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_product_items_on_product_id ON public.product_items USING btree (product_id);


--
-- Name: index_product_items_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_product_items_on_user_id ON public.product_items USING btree (user_id);


--
-- Name: index_product_items_on_user_id_and_product_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE UNIQUE INDEX index_product_items_on_user_id_and_product_id ON public.product_items USING btree (user_id, product_id);


--
-- Name: index_room_managers_on_room_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_room_managers_on_room_id ON public.room_managers USING btree (room_id);


--
-- Name: index_room_managers_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_room_managers_on_user_id ON public.room_managers USING btree (user_id);


--
-- Name: index_rooms_on_order_product_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_rooms_on_order_product_id ON public.rooms USING btree (order_product_id);


--
-- Name: index_stocks_on_product_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_stocks_on_product_id ON public.stocks USING btree (product_id);


--
-- Name: index_stocks_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_stocks_on_user_id ON public.stocks USING btree (user_id);


--
-- Name: index_stocks_on_user_id_and_product_id_and_shipment_week; Type: INDEX; Schema: public; Owner: aftech
--

CREATE UNIQUE INDEX index_stocks_on_user_id_and_product_id_and_shipment_week ON public.stocks USING btree (user_id, product_id, shipment_week);


--
-- Name: index_transport_companies_on_user_id; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_transport_companies_on_user_id ON public.transport_companies USING btree (user_id);


--
-- Name: index_users_on_area; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_users_on_area ON public.users USING btree (area);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: aftech
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_pref; Type: INDEX; Schema: public; Owner: aftech
--

CREATE INDEX index_users_on_pref ON public.users USING btree (pref);


--
-- Name: product_items fk_rails_0866517f75; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT fk_rails_0866517f75 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages fk_rails_273a25a7a6; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_273a25a7a6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_57fce42aa1; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_57fce42aa1 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: room_managers fk_rails_6c922dc326; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.room_managers
    ADD CONSTRAINT fk_rails_6c922dc326 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: room_managers fk_rails_8cc5fbcbf5; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.room_managers
    ADD CONSTRAINT fk_rails_8cc5fbcbf5 FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- Name: transport_companies fk_rails_98f833c28f; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.transport_companies
    ADD CONSTRAINT fk_rails_98f833c28f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages fk_rails_a8db0fb63a; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_a8db0fb63a FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- Name: postages fk_rails_b2d9af837d; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.postages
    ADD CONSTRAINT fk_rails_b2d9af837d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: stocks fk_rails_f4b3894c0d; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_rails_f4b3894c0d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: aftech
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: aftech
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO aftech;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

