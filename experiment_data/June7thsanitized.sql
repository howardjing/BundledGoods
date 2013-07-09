--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    question_id integer,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO good;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: good
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO good;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: good
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: good
--

SELECT pg_catalog.setval('answers_id_seq', 362, true);


--
-- Name: instructions; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE instructions (
    id integer NOT NULL,
    content text,
    number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.instructions OWNER TO good;

--
-- Name: instructions_id_seq; Type: SEQUENCE; Schema: public; Owner: good
--

CREATE SEQUENCE instructions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructions_id_seq OWNER TO good;

--
-- Name: instructions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: good
--

ALTER SEQUENCE instructions_id_seq OWNED BY instructions.id;


--
-- Name: instructions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: good
--

SELECT pg_catalog.setval('instructions_id_seq', 8, true);


--
-- Name: question_stats; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE question_stats (
    id integer NOT NULL,
    question_id integer NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.question_stats OWNER TO good;

--
-- Name: question_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: good
--

CREATE SEQUENCE question_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_stats_id_seq OWNER TO good;

--
-- Name: question_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: good
--

ALTER SEQUENCE question_stats_id_seq OWNED BY question_stats.id;


--
-- Name: question_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: good
--

SELECT pg_catalog.setval('question_stats_id_seq', 7410, true);


--
-- Name: questions; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    user_id integer,
    previous_question_id integer,
    duration integer,
    time_started timestamp without time zone,
    "values" text,
    effects text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    instruction_id integer NOT NULL,
    display_timer boolean DEFAULT true,
    display_formula boolean DEFAULT false
);


ALTER TABLE public.questions OWNER TO good;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: good
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO good;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: good
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: good
--

SELECT pg_catalog.setval('questions_id_seq', 1131, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO good;

--
-- Name: users; Type: TABLE; Schema: public; Owner: good; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    lab_number character varying(255),
    age integer,
    current_question_id integer,
    year character varying(255),
    major character varying(255),
    gender character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    chosen_question_id integer
);


ALTER TABLE public.users OWNER TO good;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: good
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO good;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: good
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: good
--

SELECT pg_catalog.setval('users_id_seq', 96, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: good
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: good
--

ALTER TABLE ONLY instructions ALTER COLUMN id SET DEFAULT nextval('instructions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: good
--

ALTER TABLE ONLY question_stats ALTER COLUMN id SET DEFAULT nextval('question_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: good
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: good
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: good
--

COPY answers (id, question_id, content, created_at, updated_at) FROM stdin;
1	1	{"choice":"combo","expired":false}	2013-03-25 20:41:34.910834	2013-03-25 20:41:34.910834
2	5	{"choice":"goods","goods":[2,3],"expired":false}	2013-03-25 20:41:45.001637	2013-03-25 20:41:45.001637
3	3	{"choice":"goods","goods":[1,3],"expired":false}	2013-03-25 20:42:01.753527	2013-03-25 20:42:01.753527
4	11	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-03-25 20:42:20.325951	2013-03-25 20:42:20.325951
5	14	{"choice":"combo","expired":false}	2013-03-25 20:47:42.415672	2013-03-25 20:47:42.415672
6	27	{"choice":"unanswered","expired":false}	2013-03-25 20:49:49.155604	2013-03-25 20:49:49.155604
7	35	{"choice":"unanswered","expired":false}	2013-03-25 20:49:56.380231	2013-03-25 20:49:56.380231
8	20	{"choice":"combo","expired":false}	2013-03-25 20:54:20.903909	2013-03-25 20:54:20.903909
9	17	{"choice":"combo","expired":false}	2013-03-25 20:57:53.867608	2013-03-25 20:57:53.867608
10	25	{"choice":"combo","expired":false}	2013-03-25 21:02:22.502609	2013-03-25 21:02:22.502609
11	18	{"choice":"combo","expired":false}	2013-03-25 21:07:14.402501	2013-03-25 21:07:14.402501
12	19	{"choice":"combo","expired":false}	2013-03-25 21:12:11.196594	2013-03-25 21:12:11.196594
13	26	{"choice":"unanswered","expired":false}	2013-03-25 21:17:11.384756	2013-03-25 21:17:11.384756
14	24	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-03-25 21:23:39.58034	2013-03-25 21:23:39.58034
15	16	{"choice":"combo","expired":false}	2013-03-25 21:29:23.687562	2013-03-25 21:29:23.687562
16	37	{"choice":"unanswered","expired":true}	2013-03-26 04:09:52.341083	2013-03-26 04:09:52.341083
17	29	{"choice":"goods","goods":[2,3],"expired":false}	2013-03-26 04:10:01.92372	2013-03-26 04:10:01.92372
18	40	{"choice":"combo","expired":false}	2013-03-27 00:23:32.332109	2013-03-27 00:23:32.332109
19	41	{"choice":"goods","goods":[1,2],"expired":false}	2013-03-27 00:24:19.666382	2013-03-27 00:24:19.666382
20	53	{"choice":"combo","expired":false}	2013-03-27 03:33:45.151162	2013-03-27 03:33:45.151162
21	64	{"choice":"combo","expired":false}	2013-03-27 03:38:05.387655	2013-03-27 03:38:05.387655
22	66	{"choice":"unanswered","expired":false}	2013-03-31 17:27:39.276984	2013-03-31 17:27:39.276984
23	69	{"choice":"unanswered","expired":false}	2013-03-31 17:27:46.190292	2013-03-31 17:27:46.190292
24	70	{"choice":"unanswered","expired":false}	2013-03-31 17:58:07.789443	2013-03-31 17:58:07.789443
25	79	{"choice":"unanswered","expired":false}	2013-03-31 21:37:20.47113	2013-03-31 21:37:20.47113
26	84	{"choice":"unanswered","expired":false}	2013-03-31 21:37:40.77953	2013-03-31 21:37:40.77953
27	105	{"choice":"unanswered","expired":false}	2013-04-11 04:35:39.458985	2013-04-11 04:35:39.458985
28	113	{"choice":"unanswered","expired":false}	2013-04-11 04:35:39.709453	2013-04-11 04:35:39.709453
29	106	{"choice":"unanswered","expired":false}	2013-04-11 04:36:02.773693	2013-04-11 04:36:02.773693
30	107	{"choice":"unanswered","expired":false}	2013-04-11 04:36:21.715044	2013-04-11 04:36:21.715044
31	110	{"choice":"unanswered","expired":false}	2013-04-11 04:36:30.351178	2013-04-11 04:36:30.351178
32	116	{"choice":"unanswered","expired":false}	2013-04-11 04:37:23.115516	2013-04-11 04:37:23.115516
33	118	{"choice":"unanswered","expired":false}	2013-04-11 18:20:16.16896	2013-04-11 18:20:16.16896
34	122	{"choice":"goods","goods":[1,2],"expired":false}	2013-04-11 18:24:19.320788	2013-04-11 18:24:19.320788
35	124	{"choice":"unanswered","expired":false}	2013-04-11 18:34:02.711096	2013-04-11 18:34:02.711096
36	119	{"choice":"combo","expired":false}	2013-04-11 18:38:49.083037	2013-04-11 18:38:49.083037
37	129	{"choice":"combo","expired":false}	2013-04-11 18:42:00.881759	2013-04-11 18:42:00.881759
38	144	{"choice":"goods","goods":[2,3],"expired":false}	2013-04-11 19:13:07.835514	2013-04-11 19:13:07.835514
39	157	{"choice":"goods","goods":[1,3],"expired":false}	2013-04-11 19:16:05.43244	2013-04-11 19:16:05.43244
40	131	{"choice":"goods","goods":[1,2],"expired":false}	2013-04-11 19:16:10.085986	2013-04-11 19:16:10.085986
41	133	{"choice":"combo","expired":false}	2013-04-11 19:19:06.321847	2013-04-11 19:19:06.321847
42	166	{"choice":"goods","goods":[1,2],"expired":false}	2013-04-11 19:19:49.650234	2013-04-11 19:19:49.650234
43	147	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-04-11 19:20:36.122924	2013-04-11 19:20:36.122924
44	158	{"choice":"goods","goods":[1,2],"expired":false}	2013-04-11 19:23:46.146627	2013-04-11 19:23:46.146627
45	152	{"choice":"goods","goods":[1,3],"expired":false}	2013-04-11 19:23:53.488888	2013-04-11 19:23:53.488888
46	139	{"choice":"goods","goods":[1,2],"expired":false}	2013-04-11 19:23:58.301269	2013-04-11 19:23:58.301269
47	132	{"choice":"goods","goods":[2,3],"expired":false}	2013-04-11 19:28:13.388321	2013-04-11 19:28:13.388321
48	164	{"choice":"unanswered","expired":false}	2013-04-11 19:28:24.783085	2013-04-11 19:28:24.783085
49	153	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-04-11 19:28:43.461717	2013-04-11 19:28:43.461717
50	167	{"choice":"unanswered","expired":false}	2013-04-11 19:32:56.327413	2013-04-11 19:32:56.327413
51	142	{"choice":"combo","expired":false}	2013-04-11 19:33:45.426841	2013-04-11 19:33:45.426841
52	155	{"choice":"goods","goods":[3,4],"expired":false}	2013-04-11 19:33:50.934769	2013-04-11 19:33:50.934769
53	159	{"choice":"goods","goods":[2,3],"expired":false}	2013-04-11 19:36:15.441075	2013-04-11 19:36:15.441075
54	145	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-04-11 19:37:19.827963	2013-04-11 19:37:19.827963
55	143	{"choice":"combo","expired":false}	2013-04-11 19:37:37.078226	2013-04-11 19:37:37.078226
56	138	{"choice":"combo","expired":false}	2013-04-11 19:41:13.813923	2013-04-11 19:41:13.813923
57	151	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-04-11 19:41:20.99567	2013-04-11 19:41:20.99567
58	168	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-04-11 19:42:16.65995	2013-04-11 19:42:16.65995
59	134	{"choice":"combo","expired":false}	2013-04-11 19:45:39.341125	2013-04-11 19:45:39.341125
60	165	{"choice":"unanswered","expired":false}	2013-04-11 19:45:43.728087	2013-04-11 19:45:43.728087
61	146	{"choice":"goods","goods":[1,3],"expired":false}	2013-04-11 19:45:44.65305	2013-04-11 19:45:44.65305
62	169	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-04-11 19:50:07.936118	2013-04-11 19:50:07.936118
63	135	{"choice":"combo","expired":false}	2013-04-11 19:50:27.08124	2013-04-11 19:50:27.08124
64	148	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-04-11 19:50:27.892569	2013-04-11 19:50:27.892569
65	162	{"choice":"goods","goods":[2,3,4,5],"expired":false}	2013-04-11 19:53:41.218594	2013-04-11 19:53:41.218594
66	141	{"choice":"combo","expired":false}	2013-04-11 19:54:28.191014	2013-04-11 19:54:28.191014
67	150	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-04-11 19:56:02.575023	2013-04-11 19:56:02.575023
68	160	{"choice":"combo","expired":false}	2013-04-11 19:57:45.21303	2013-04-11 19:57:45.21303
69	154	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-04-11 19:59:07.021161	2013-04-11 19:59:07.021161
70	136	{"choice":"goods","goods":[1,2,5],"expired":false}	2013-04-11 20:00:09.140588	2013-04-11 20:00:09.140588
71	161	{"choice":"combo","expired":false}	2013-04-11 20:01:16.062524	2013-04-11 20:01:16.062524
72	137	{"choice":"combo","expired":false}	2013-04-11 20:03:16.617681	2013-04-11 20:03:16.617681
73	156	{"choice":"combo","expired":false}	2013-04-11 20:05:13.856663	2013-04-11 20:05:13.856663
74	163	{"choice":"combo","expired":false}	2013-04-11 20:05:43.422679	2013-04-11 20:05:43.422679
75	140	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-04-11 20:07:30.096206	2013-04-11 20:07:30.096206
76	149	{"choice":"goods","goods":[1,2,5],"expired":false}	2013-04-11 20:07:52.444932	2013-04-11 20:07:52.444932
77	235	{"choice":"combo","expired":false}	2013-06-27 21:10:00.626593	2013-06-27 21:10:00.626593
78	534	{"choice":"combo","expired":false}	2013-06-27 21:10:04.177673	2013-06-27 21:10:04.177673
79	729	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:12:00.857795	2013-06-27 21:12:00.857795
80	404	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:12:36.685525	2013-06-27 21:12:36.685525
81	196	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:12:57.146334	2013-06-27 21:12:57.146334
82	222	{"choice":"goods","goods":[2],"expired":false}	2013-06-27 21:13:01.152056	2013-06-27 21:13:01.152056
83	976	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:13:21.385054	2013-06-27 21:13:21.385054
84	1041	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:14:03.782687	2013-06-27 21:14:03.782687
85	963	{"choice":"combo","expired":false}	2013-06-27 21:14:06.440835	2013-06-27 21:14:06.440835
86	1080	{"choice":"unanswered","expired":false}	2013-06-27 21:14:08.243784	2013-06-27 21:14:08.243784
87	287	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:14:18.074454	2013-06-27 21:14:18.074454
88	1002	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:14:35.043028	2013-06-27 21:14:35.043028
89	950	{"choice":"combo","expired":false}	2013-06-27 21:14:45.109617	2013-06-27 21:14:45.109617
90	937	{"choice":"combo","expired":false}	2013-06-27 21:15:07.857053	2013-06-27 21:15:07.857053
91	690	{"choice":"combo","expired":false}	2013-06-27 21:15:13.168307	2013-06-27 21:15:13.168307
92	209	{"choice":"combo","expired":false}	2013-06-27 21:15:53.137388	2013-06-27 21:15:53.137388
93	1093	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:15:55.505696	2013-06-27 21:15:55.505696
94	246	{"choice":"combo","expired":false}	2013-06-27 21:16:19.724153	2013-06-27 21:16:19.724153
95	989	{"choice":"combo","expired":false}	2013-06-27 21:16:26.756321	2013-06-27 21:16:26.756321
96	543	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:16:27.791934	2013-06-27 21:16:27.791934
97	898	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:16:50.044716	2013-06-27 21:16:50.044716
98	232	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:16:52.176976	2013-06-27 21:16:52.176976
99	1015	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:17:15.100719	2013-06-27 21:17:15.100719
100	697	{"choice":"combo","expired":false}	2013-06-27 21:18:00.131861	2013-06-27 21:18:00.131861
101	982	{"choice":"unanswered","expired":false}	2013-06-27 21:18:00.712236	2013-06-27 21:18:00.712236
102	739	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:18:13.06979	2013-06-27 21:18:13.06979
103	1119	{"choice":"combo","expired":false}	2013-06-27 21:18:26.084539	2013-06-27 21:18:26.084539
104	206	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:18:33.820994	2013-06-27 21:18:33.820994
105	411	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:18:34.844188	2013-06-27 21:18:34.844188
106	975	{"choice":"goods","goods":[1,5],"expired":false}	2013-06-27 21:18:39.336598	2013-06-27 21:18:39.336598
107	960	{"choice":"goods","goods":[2],"expired":false}	2013-06-27 21:19:08.629517	2013-06-27 21:19:08.629517
108	1087	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:20:06.915465	2013-06-27 21:20:06.915465
109	1098	{"choice":"goods","goods":[1,2,5],"expired":false}	2013-06-27 21:20:11.552479	2013-06-27 21:20:11.552479
110	1026	{"choice":"unanswered","expired":false}	2013-06-27 21:20:19.75783	2013-06-27 21:20:19.75783
111	1129	{"choice":"goods","goods":[1,4],"expired":false}	2013-06-27 21:20:25.488279	2013-06-27 21:20:25.488279
112	1052	{"choice":"combo","expired":false}	2013-06-27 21:20:30.742842	2013-06-27 21:20:30.742842
113	221	{"choice":"goods","goods":[2,5],"expired":false}	2013-06-27 21:20:48.510443	2013-06-27 21:20:48.510443
114	1014	{"choice":"goods","goods":[2,3,4,5],"expired":false}	2013-06-27 21:21:24.750167	2013-06-27 21:21:24.750167
115	226	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 21:21:33.994007	2013-06-27 21:21:33.994007
116	730	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:21:39.732524	2013-06-27 21:21:39.732524
117	298	{"choice":"goods","goods":[2,3,4,5],"expired":false}	2013-06-27 21:21:52.061073	2013-06-27 21:21:52.061073
118	237	{"choice":"goods","goods":[3],"expired":false}	2013-06-27 21:22:31.875871	2013-06-27 21:22:31.875871
119	545	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:22:36.682913	2013-06-27 21:22:36.682913
120	694	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:23:05.389695	2013-06-27 21:23:05.389695
121	948	{"choice":"goods","goods":[5],"expired":false}	2013-06-27 21:23:25.979573	2013-06-27 21:23:25.979573
122	202	{"choice":"combo","expired":false}	2013-06-27 21:23:31.974064	2013-06-27 21:23:31.974064
123	900	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:23:53.531985	2013-06-27 21:23:53.531985
124	977	{"choice":"combo","expired":false}	2013-06-27 21:24:08.27191	2013-06-27 21:24:08.27191
125	991	{"choice":"combo","expired":false}	2013-06-27 21:24:08.512593	2013-06-27 21:24:08.512593
126	956	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:24:17.107727	2013-06-27 21:24:17.107727
127	974	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:24:21.141727	2013-06-27 21:24:21.141727
128	1044	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:25:20.292531	2013-06-27 21:25:20.292531
129	1128	{"choice":"combo","expired":false}	2013-06-27 21:25:32.662496	2013-06-27 21:25:32.662496
130	542	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:25:39.336501	2013-06-27 21:25:39.336501
131	1105	{"choice":"goods","goods":[1,4,5],"expired":false}	2013-06-27 21:25:40.462695	2013-06-27 21:25:40.462695
132	210	{"choice":"combo","expired":false}	2013-06-27 21:25:43.800132	2013-06-27 21:25:43.800132
133	1019	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:25:48.233288	2013-06-27 21:25:48.233288
134	242	{"choice":"combo","expired":false}	2013-06-27 21:25:59.291554	2013-06-27 21:25:59.291554
135	698	{"choice":"combo","expired":false}	2013-06-27 21:26:01.054344	2013-06-27 21:26:01.054344
136	947	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 21:26:05.795584	2013-06-27 21:26:05.795584
137	229	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:26:07.583249	2013-06-27 21:26:07.583249
138	1008	{"choice":"goods","goods":[1,4,5],"expired":false}	2013-06-27 21:26:17.270797	2013-06-27 21:26:17.270797
139	416	{"choice":"goods","goods":[4,5],"expired":false}	2013-06-27 21:26:23.316471	2013-06-27 21:26:23.316471
140	299	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:26:45.623938	2013-06-27 21:26:45.623938
141	1106	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:26:57.452644	2013-06-27 21:26:57.452644
142	995	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:27:24.682992	2013-06-27 21:27:24.682992
143	199	{"choice":"combo","expired":false}	2013-06-27 21:28:08.973099	2013-06-27 21:28:08.973099
144	966	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:28:30.919118	2013-06-27 21:28:30.919118
145	957	{"choice":"combo","expired":false}	2013-06-27 21:28:47.805722	2013-06-27 21:28:47.805722
146	1101	{"choice":"combo","expired":false}	2013-06-27 21:28:51.529125	2013-06-27 21:28:51.529125
147	740	{"choice":"unanswered","expired":false}	2013-06-27 21:28:57.86245	2013-06-27 21:28:57.86245
148	987	{"choice":"goods","goods":[2],"expired":false}	2013-06-27 21:29:06.81556	2013-06-27 21:29:06.81556
149	901	{"choice":"combo","expired":false}	2013-06-27 21:29:25.106228	2013-06-27 21:29:25.106228
150	1092	{"choice":"unanswered","expired":false}	2013-06-27 21:29:53.611457	2013-06-27 21:29:53.611457
151	1012	{"choice":"combo","expired":false}	2013-06-27 21:30:01.205496	2013-06-27 21:30:01.205496
152	541	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:30:29.50778	2013-06-27 21:30:29.50778
153	700	{"choice":"combo","expired":false}	2013-06-27 21:30:34.272135	2013-06-27 21:30:34.272135
154	415	{"choice":"goods","goods":[1,4,5],"expired":false}	2013-06-27 21:30:48.964799	2013-06-27 21:30:48.964799
155	1122	{"choice":"combo","expired":false}	2013-06-27 21:30:57.136193	2013-06-27 21:30:57.136193
156	1018	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:30:58.629688	2013-06-27 21:30:58.629688
157	245	{"choice":"combo","expired":false}	2013-06-27 21:31:19.963327	2013-06-27 21:31:19.963327
158	996	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:31:22.920995	2013-06-27 21:31:22.920995
159	230	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:31:30.378575	2013-06-27 21:31:30.378575
160	216	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:31:35.728162	2013-06-27 21:31:35.728162
161	944	{"choice":"combo","expired":false}	2013-06-27 21:31:44.922009	2013-06-27 21:31:44.922009
162	292	{"choice":"goods","goods":[1,2,4,5],"expired":false}	2013-06-27 21:31:46.031603	2013-06-27 21:31:46.031603
163	1053	{"choice":"unanswered","expired":false}	2013-06-27 21:31:50.605377	2013-06-27 21:31:50.605377
164	738	{"choice":"combo","expired":false}	2013-06-27 21:32:10.898126	2013-06-27 21:32:10.898126
165	951	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:32:36.428948	2013-06-27 21:32:36.428948
166	201	{"choice":"goods","goods":[1,3,4,5],"expired":false}	2013-06-27 21:33:48.824131	2013-06-27 21:33:48.824131
167	973	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:33:50.621604	2013-06-27 21:33:50.621604
168	985	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:34:36.317184	2013-06-27 21:34:36.317184
169	1099	{"choice":"combo","expired":false}	2013-06-27 21:34:44.646489	2013-06-27 21:34:44.646489
170	1112	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 21:34:45.812066	2013-06-27 21:34:45.812066
171	413	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:34:51.213738	2013-06-27 21:34:51.213738
172	945	{"choice":"combo","expired":false}	2013-06-27 21:35:05.28795	2013-06-27 21:35:05.28795
173	297	{"choice":"goods","goods":[3,4],"expired":false}	2013-06-27 21:35:09.213245	2013-06-27 21:35:09.213245
174	1050	{"choice":"goods","goods":[1,4],"expired":false}	2013-06-27 21:35:21.019296	2013-06-27 21:35:21.019296
175	1086	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 21:35:22.508556	2013-06-27 21:35:22.508556
176	1013	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 21:35:25.213144	2013-06-27 21:35:25.213144
177	699	{"choice":"goods","goods":[3,4],"expired":false}	2013-06-27 21:35:47.544737	2013-06-27 21:35:47.544737
178	1120	{"choice":"combo","expired":false}	2013-06-27 21:36:05.823985	2013-06-27 21:36:05.823985
179	1024	{"choice":"goods","goods":[2,4],"expired":false}	2013-06-27 21:36:12.792117	2013-06-27 21:36:12.792117
180	223	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:36:26.573465	2013-06-27 21:36:26.573465
181	540	{"choice":"combo","expired":false}	2013-06-27 21:36:28.136697	2013-06-27 21:36:28.136697
182	241	{"choice":"combo","expired":false}	2013-06-27 21:36:32.43304	2013-06-27 21:36:32.43304
183	200	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 21:36:40.262082	2013-06-27 21:36:40.262082
184	212	{"choice":"combo","expired":false}	2013-06-27 21:36:59.350882	2013-06-27 21:36:59.350882
185	958	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:37:13.255458	2013-06-27 21:37:13.255458
186	908	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:37:33.063911	2013-06-27 21:37:33.063911
187	741	{"choice":"unanswered","expired":false}	2013-06-27 21:37:50.093777	2013-06-27 21:37:50.093777
188	1117	{"choice":"combo","expired":false}	2013-06-27 21:37:53.856312	2013-06-27 21:37:53.856312
189	1009	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:38:48.120105	2013-06-27 21:38:48.120105
190	1091	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:39:22.657201	2013-06-27 21:39:22.657201
191	990	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:39:24.696288	2013-06-27 21:39:24.696288
192	980	{"choice":"combo","expired":false}	2013-06-27 21:39:42.535882	2013-06-27 21:39:42.535882
193	291	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:40:12.529891	2013-06-27 21:40:12.529891
194	946	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:40:23.28517	2013-06-27 21:40:23.28517
195	408	{"choice":"combo","expired":false}	2013-06-27 21:40:30.419104	2013-06-27 21:40:30.419104
196	968	{"choice":"goods","goods":[2,4,5],"expired":false}	2013-06-27 21:40:33.78739	2013-06-27 21:40:33.78739
197	1016	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:40:35.696366	2013-06-27 21:40:35.696366
198	1125	{"choice":"combo","expired":false}	2013-06-27 21:40:40.979138	2013-06-27 21:40:40.979138
199	244	{"choice":"combo","expired":false}	2013-06-27 21:40:48.628009	2013-06-27 21:40:48.628009
200	538	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:40:51.7013	2013-06-27 21:40:51.7013
201	1047	{"choice":"combo","expired":false}	2013-06-27 21:41:37.831198	2013-06-27 21:41:37.831198
202	702	{"choice":"unanswered","expired":false}	2013-06-27 21:41:54.152066	2013-06-27 21:41:54.152066
203	1102	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:42:05.32772	2013-06-27 21:42:05.32772
204	227	{"choice":"goods","goods":[2,4,5],"expired":false}	2013-06-27 21:42:18.251144	2013-06-27 21:42:18.251144
205	732	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:42:26.17868	2013-06-27 21:42:26.17868
206	953	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:42:29.090052	2013-06-27 21:42:29.090052
207	1084	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:42:33.802134	2013-06-27 21:42:33.802134
208	902	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:42:38.619673	2013-06-27 21:42:38.619673
209	215	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:42:52.072247	2013-06-27 21:42:52.072247
210	998	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:43:06.819988	2013-06-27 21:43:06.819988
211	207	{"choice":"combo","expired":false}	2013-06-27 21:43:14.99352	2013-06-27 21:43:14.99352
212	972	{"choice":"combo","expired":false}	2013-06-27 21:43:43.493136	2013-06-27 21:43:43.493136
213	1003	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:43:47.064454	2013-06-27 21:43:47.064454
214	986	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:44:16.74669	2013-06-27 21:44:16.74669
215	1104	{"choice":"goods","goods":[1,4],"expired":false}	2013-06-27 21:44:35.355522	2013-06-27 21:44:35.355522
216	1042	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:45:01.314013	2013-06-27 21:45:01.314013
217	290	{"choice":"combo","expired":false}	2013-06-27 21:45:08.765049	2013-06-27 21:45:08.765049
218	1130	{"choice":"goods","goods":[2,4],"expired":false}	2013-06-27 21:45:09.457091	2013-06-27 21:45:09.457091
219	1017	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:45:46.041888	2013-06-27 21:45:46.041888
220	240	{"choice":"combo","expired":false}	2013-06-27 21:46:17.230847	2013-06-27 21:46:17.230847
221	1113	{"choice":"unanswered","expired":false}	2013-06-27 21:46:18.66472	2013-06-27 21:46:18.66472
222	204	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:46:21.053482	2013-06-27 21:46:21.053482
223	546	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 21:46:21.194711	2013-06-27 21:46:21.194711
224	701	{"choice":"goods","goods":[2,4,5],"expired":false}	2013-06-27 21:46:36.181601	2013-06-27 21:46:36.181601
225	225	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:46:42.118303	2013-06-27 21:46:42.118303
226	992	{"choice":"combo","expired":false}	2013-06-27 21:46:51.342793	2013-06-27 21:46:51.342793
227	217	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:46:52.459926	2013-06-27 21:46:52.459926
228	949	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 21:47:20.055253	2013-06-27 21:47:20.055253
229	899	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:47:45.307985	2013-06-27 21:47:45.307985
230	733	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:47:54.36855	2013-06-27 21:47:54.36855
231	1097	{"choice":"combo","expired":false}	2013-06-27 21:47:56.460421	2013-06-27 21:47:56.460421
232	1114	{"choice":"combo","expired":false}	2013-06-27 21:47:57.185429	2013-06-27 21:47:57.185429
233	961	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 21:47:58.047191	2013-06-27 21:47:58.047191
234	410	{"choice":"combo","expired":false}	2013-06-27 21:47:58.767007	2013-06-27 21:47:58.767007
235	692	{"choice":"combo","expired":false}	2013-06-27 21:48:05.295737	2013-06-27 21:48:05.295737
236	1010	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:48:18.895562	2013-06-27 21:48:18.895562
237	1089	{"choice":"combo","expired":false}	2013-06-27 21:48:28.381843	2013-06-27 21:48:28.381843
238	970	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:48:55.490367	2013-06-27 21:48:55.490367
239	289	{"choice":"combo","expired":false}	2013-06-27 21:49:04.733448	2013-06-27 21:49:04.733448
240	979	{"choice":"goods","goods":[1],"expired":false}	2013-06-27 21:49:17.375489	2013-06-27 21:49:17.375489
241	1043	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:50:00.922359	2013-06-27 21:50:00.922359
242	1131	{"choice":"combo","expired":false}	2013-06-27 21:50:01.225671	2013-06-27 21:50:01.225671
243	405	{"choice":"combo","expired":false}	2013-06-27 21:50:05.187083	2013-06-27 21:50:05.187083
244	236	{"choice":"goods","goods":[3],"expired":false}	2013-06-27 21:50:12.090566	2013-06-27 21:50:12.090566
245	197	{"choice":"combo","expired":false}	2013-06-27 21:50:38.133672	2013-06-27 21:50:38.133672
246	544	{"choice":"goods","goods":[2],"expired":false}	2013-06-27 21:51:13.128562	2013-06-27 21:51:13.128562
247	942	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 21:51:42.485813	2013-06-27 21:51:42.485813
248	231	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 21:51:47.4032	2013-06-27 21:51:47.4032
249	691	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:52:14.393919	2013-06-27 21:52:14.393919
250	213	{"choice":"combo","expired":false}	2013-06-27 21:52:21.298378	2013-06-27 21:52:21.298378
251	1094	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:52:39.085544	2013-06-27 21:52:39.085544
252	955	{"choice":"goods","goods":[2,3,4,5],"expired":false}	2013-06-27 21:52:53.675013	2013-06-27 21:52:53.675013
253	1088	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:52:59.516229	2013-06-27 21:52:59.516229
254	1027	{"choice":"combo","expired":false}	2013-06-27 21:53:04.903935	2013-06-27 21:53:04.903935
255	994	{"choice":"combo","expired":false}	2013-06-27 21:53:07.705893	2013-06-27 21:53:07.705893
256	1011	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 21:53:26.448587	2013-06-27 21:53:26.448587
257	734	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 21:53:35.171988	2013-06-27 21:53:35.171988
258	984	{"choice":"combo","expired":false}	2013-06-27 21:53:49.606947	2013-06-27 21:53:49.606947
259	910	{"choice":"combo","expired":false}	2013-06-27 21:54:00.299506	2013-06-27 21:54:00.299506
260	964	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:54:01.980636	2013-06-27 21:54:01.980636
261	1127	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:54:46.379603	2013-06-27 21:54:46.379603
262	536	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:54:56.349238	2013-06-27 21:54:56.349238
263	941	{"choice":"combo","expired":false}	2013-06-27 21:55:11.472729	2013-06-27 21:55:11.472729
264	407	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 21:55:18.061249	2013-06-27 21:55:18.061249
265	243	{"choice":"goods","goods":[3],"expired":false}	2013-06-27 21:55:19.950966	2013-06-27 21:55:19.950966
266	1051	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:55:40.826232	2013-06-27 21:55:40.826232
267	293	{"choice":"goods","goods":[1,3,5],"expired":false}	2013-06-27 21:55:48.448057	2013-06-27 21:55:48.448057
268	1025	{"choice":"unanswered","expired":false}	2013-06-27 21:55:53.135555	2013-06-27 21:55:53.135555
269	208	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 21:56:27.574492	2013-06-27 21:56:27.574492
270	737	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 21:56:59.243498	2013-06-27 21:56:59.243498
271	1110	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:56:59.548118	2013-06-27 21:56:59.548118
272	228	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 21:57:03.246399	2013-06-27 21:57:03.246399
273	997	{"choice":"combo","expired":false}	2013-06-27 21:57:04.893335	2013-06-27 21:57:04.893335
274	1103	{"choice":"combo","expired":false}	2013-06-27 21:57:15.712383	2013-06-27 21:57:15.712383
275	695	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 21:57:28.211537	2013-06-27 21:57:28.211537
276	962	{"choice":"combo","expired":false}	2013-06-27 21:57:41.671159	2013-06-27 21:57:41.671159
277	214	{"choice":"combo","expired":false}	2013-06-27 21:58:01.47144	2013-06-27 21:58:01.47144
278	288	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 21:58:41.701153	2013-06-27 21:58:41.701153
279	1115	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 21:59:00.260326	2013-06-27 21:59:00.260326
280	906	{"choice":"combo","expired":false}	2013-06-27 21:59:04.406827	2013-06-27 21:59:04.406827
281	1007	{"choice":"goods","goods":[1,2,5],"expired":false}	2013-06-27 21:59:18.540003	2013-06-27 21:59:18.540003
282	967	{"choice":"combo","expired":false}	2013-06-27 21:59:24.430355	2013-06-27 21:59:24.430355
283	198	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:59:41.527862	2013-06-27 21:59:41.527862
284	1123	{"choice":"combo","expired":false}	2013-06-27 21:59:54.932262	2013-06-27 21:59:54.932262
285	406	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 21:59:56.74133	2013-06-27 21:59:56.74133
286	988	{"choice":"unanswered","expired":false}	2013-06-27 21:59:59.829488	2013-06-27 21:59:59.829488
287	1049	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:00:05.294807	2013-06-27 22:00:05.294807
288	239	{"choice":"goods","goods":[3],"expired":false}	2013-06-27 22:00:09.948452	2013-06-27 22:00:09.948452
289	943	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 22:00:18.73345	2013-06-27 22:00:18.73345
290	1085	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 22:00:41.842064	2013-06-27 22:00:41.842064
291	537	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 22:00:44.087072	2013-06-27 22:00:44.087072
292	234	{"choice":"combo","expired":false}	2013-06-27 22:01:47.908916	2013-06-27 22:01:47.908916
293	219	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:01:52.626452	2013-06-27 22:01:52.626452
294	954	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:01:53.909168	2013-06-27 22:01:53.909168
295	1021	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 22:01:58.67387	2013-06-27 22:01:58.67387
296	1095	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:02:21.751662	2013-06-27 22:02:21.751662
297	696	{"choice":"goods","goods":[1,2,3,5],"expired":false}	2013-06-27 22:02:33.615892	2013-06-27 22:02:33.615892
298	1005	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:02:51.366986	2013-06-27 22:02:51.366986
299	1000	{"choice":"combo","expired":false}	2013-06-27 22:03:00.525349	2013-06-27 22:03:00.525349
300	939	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:03:00.627481	2013-06-27 22:03:00.627481
301	735	{"choice":"combo","expired":false}	2013-06-27 22:03:07.711329	2013-06-27 22:03:07.711329
302	294	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:03:39.109827	2013-06-27 22:03:39.109827
303	983	{"choice":"unanswered","expired":false}	2013-06-27 22:03:46.010158	2013-06-27 22:03:46.010158
304	1081	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:03:53.115252	2013-06-27 22:03:53.115252
305	971	{"choice":"combo","expired":false}	2013-06-27 22:03:57.133574	2013-06-27 22:03:57.133574
306	909	{"choice":"combo","expired":false}	2013-06-27 22:04:09.551616	2013-06-27 22:04:09.551616
307	203	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 22:04:17.154493	2013-06-27 22:04:17.154493
308	1121	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:04:35.022019	2013-06-27 22:04:35.022019
309	535	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:05:06.995904	2013-06-27 22:05:06.995904
310	1045	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 22:05:23.041796	2013-06-27 22:05:23.041796
311	412	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:05:25.214633	2013-06-27 22:05:25.214633
312	247	{"choice":"goods","goods":[4],"expired":false}	2013-06-27 22:05:44.473153	2013-06-27 22:05:44.473153
313	952	{"choice":"combo","expired":false}	2013-06-27 22:05:44.702324	2013-06-27 22:05:44.702324
314	1020	{"choice":"goods","goods":[4,5],"expired":false}	2013-06-27 22:06:44.298029	2013-06-27 22:06:44.298029
315	999	{"choice":"combo","expired":false}	2013-06-27 22:07:11.061164	2013-06-27 22:07:11.061164
316	1004	{"choice":"combo","expired":false}	2013-06-27 22:07:22.415329	2013-06-27 22:07:22.415329
317	218	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 22:07:24.464635	2013-06-27 22:07:24.464635
318	1100	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:07:40.650998	2013-06-27 22:07:40.650998
319	1109	{"choice":"goods","goods":[3,4],"expired":false}	2013-06-27 22:07:52.319947	2013-06-27 22:07:52.319947
320	736	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 22:08:05.991683	2013-06-27 22:08:05.991683
321	233	{"choice":"unanswered","expired":false}	2013-06-27 22:08:06.116	2013-06-27 22:08:06.116
322	978	{"choice":"combo","expired":false}	2013-06-27 22:08:40.629408	2013-06-27 22:08:40.629408
323	940	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 22:08:44.255015	2013-06-27 22:08:44.255015
324	693	{"choice":"unanswered","expired":true}	2013-06-27 22:08:47.078504	2013-06-27 22:08:47.078504
325	907	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:09:11.129874	2013-06-27 22:09:11.129874
326	296	{"choice":"combo","expired":false}	2013-06-27 22:09:13.686968	2013-06-27 22:09:13.686968
327	205	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 22:09:21.149488	2013-06-27 22:09:21.149488
328	1108	{"choice":"combo","expired":false}	2013-06-27 22:09:30.587483	2013-06-27 22:09:30.587483
329	1083	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:09:34.303625	2013-06-27 22:09:34.303625
330	969	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 22:09:58.353046	2013-06-27 22:09:58.353046
331	238	{"choice":"goods","goods":[4],"expired":false}	2013-06-27 22:10:01.356986	2013-06-27 22:10:01.356986
332	1124	{"choice":"goods","goods":[3,4,5],"expired":false}	2013-06-27 22:10:02.505008	2013-06-27 22:10:02.505008
333	1048	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:10:13.148557	2013-06-27 22:10:13.148557
334	959	{"choice":"goods","goods":[2,3,4],"expired":false}	2013-06-27 22:10:18.141202	2013-06-27 22:10:18.141202
335	1023	{"choice":"combo","expired":false}	2013-06-27 22:10:46.953289	2013-06-27 22:10:46.953289
336	224	{"choice":"combo","expired":false}	2013-06-27 22:11:08.95483	2013-06-27 22:11:08.95483
337	731	{"choice":"combo","expired":false}	2013-06-27 22:11:57.33974	2013-06-27 22:11:57.33974
338	220	{"choice":"combo","expired":false}	2013-06-27 22:12:04.559997	2013-06-27 22:12:04.559997
339	539	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 22:12:19.342407	2013-06-27 22:12:19.342407
340	993	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 22:12:19.768787	2013-06-27 22:12:19.768787
341	409	{"choice":"goods","goods":[3,5],"expired":false}	2013-06-27 22:12:22.162879	2013-06-27 22:12:22.162879
342	938	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:12:23.932307	2013-06-27 22:12:23.932307
343	1096	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 22:12:29.969675	2013-06-27 22:12:29.969675
344	1006	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 22:12:33.605042	2013-06-27 22:12:33.605042
345	295	{"choice":"combo","expired":false}	2013-06-27 22:12:46.278507	2013-06-27 22:12:46.278507
346	981	{"choice":"combo","expired":false}	2013-06-27 22:13:23.041174	2013-06-27 22:13:23.041174
347	965	{"choice":"combo","expired":false}	2013-06-27 22:14:00.590808	2013-06-27 22:14:00.590808
348	1082	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:14:03.75543	2013-06-27 22:14:03.75543
349	903	{"choice":"goods","goods":[1,2,4,5],"expired":false}	2013-06-27 22:14:17.313711	2013-06-27 22:14:17.313711
350	1126	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:14:43.67359	2013-06-27 22:14:43.67359
351	414	{"choice":"goods","goods":[1,2,3],"expired":false}	2013-06-27 22:15:39.837002	2013-06-27 22:15:39.837002
352	1022	{"choice":"goods","goods":[1,2],"expired":false}	2013-06-27 22:15:40.313936	2013-06-27 22:15:40.313936
353	211	{"choice":"combo","expired":false}	2013-06-27 22:16:29.389192	2013-06-27 22:16:29.389192
354	1046	{"choice":"goods","goods":[1,2,3,4,5],"expired":false}	2013-06-27 22:16:34.991461	2013-06-27 22:16:34.991461
355	1001	{"choice":"goods","goods":[1,2,4],"expired":false}	2013-06-27 22:17:18.530141	2013-06-27 22:17:18.530141
356	1118	{"choice":"goods","goods":[1,3,4],"expired":false}	2013-06-27 22:18:05.53872	2013-06-27 22:18:05.53872
357	904	{"choice":"combo","expired":false}	2013-06-27 22:19:16.555653	2013-06-27 22:19:16.555653
358	1090	{"choice":"goods","goods":[1,2,3,4],"expired":false}	2013-06-27 22:19:30.396233	2013-06-27 22:19:30.396233
359	905	{"choice":"goods","goods":[1,3],"expired":false}	2013-06-27 22:20:26.631827	2013-06-27 22:20:26.631827
360	1107	{"choice":"goods","goods":[2,3],"expired":false}	2013-06-27 22:20:55.075767	2013-06-27 22:20:55.075767
361	1111	{"choice":"combo","expired":false}	2013-06-27 22:24:30.998414	2013-06-27 22:24:30.998414
362	1116	{"choice":"combo","expired":false}	2013-06-27 22:33:35.143625	2013-06-27 22:33:35.143625
\.


--
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: good
--

COPY instructions (id, content, number, created_at, updated_at) FROM stdin;
1	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub> x<sub>3</sub> denoted as Good 1, Good 2, and Good 3.</li>\n<br>\n<li>There is a menu of values for goods that are given to you. \n\t</li>\n<br>\n<li> Purchasing goods together will have a Bundle Effect however. \n<br>\n<br>\n<li>For a concrete example, a bundle effect for a statement containing goods one and two\nwould be as follows:</li>\n<br>\n<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>\n<li>The final value gained from purchasing\nthe goods you have chosen is the sum of their values added with the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<br>\n<li>This experiment does not count towards your payment.</li><br>\n	0	2013-03-25 20:18:35.367329	2013-03-25 20:18:35.367329
2	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, and x<sub>3</sub> denoted as Good 1, Good 2, and \nGood 3.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have a Bundle Effect however. \nFor a concrete example, the bundle effect for a statement containing goods one and two\nwould be as follows:</li>\n<br>\n<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>There is a time limit of 5 minutes for this experiment. The final choice you have \nselected when the given timer runs out will be your final choice for the experiment.</li>\n<br>\n	1	2013-03-25 20:18:35.542714	2013-03-25 20:18:35.542714
3	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, and x<sub>4</sub> denoted as \nGood 1, Good 2, Good 3, and Good 4.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.\n\t</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have a Bundle Effect however. \nFor a concrete example, the bundle effect for a statement containing goods one and two\nwould be as follows:</li>\n<br>\n<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>There is a time limit of 5 minutes for this experiment. The final choice you have \nselected when the given timer runs out will be your final choice for the experiment.</li>\n<br>\n	2	2013-03-25 20:18:35.582065	2013-03-25 20:18:35.582065
4	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as \nGood 1, Good 2, Good 3, Good 4, and Good 5.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.\n\t</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have Bundle effects however. \nFor a concrete example, the bundle effect for a statement containing goods two, three, four,\nand \ffive would be as follows:</li>\n<br>\n<i>"Purchasing goods two, three, four, and five gives a bundle effect of - 1.0."</i> <br></li><br>\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>There is a time limit of 5 minutes for this experiment. The final choice you have \nselected when the given timer runs out will be your final choice for the experiment.</li>\n<br>\n	3	2013-03-25 20:18:35.593794	2013-03-25 20:18:35.593794
5	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, and x<sub>3</sub> denoted as Good 1, Good 2, and \nGood 3.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.\n\t</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have a Bundle Effect however. \nFor a concrete example, the bundle effect for a statement containing goods one and two\nwould be as follows:</li>\n<br>\n<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by \n  the graph below, will be randomly selected. Whatever option you have selected at that time \n  will be your final choice for that particular experiment. Therefore, it is in your best interest \n  to "choose as you go" in the sense that, if you prefer a particular option more to the one you \n  have selected, to change your selection. This experiment will be different from the other \n  experiments as your final choice is not necessarily the choice you selected when you click "finish", \n  but the choice that you have selected at the randomly determined time. </li>\n  <br>\n<li>The time that is selected will be determined by drawing from a random integer number between\n  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times \n  with the probability of the time happening on appearing on the y axis. For example, there is a\n  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the \n  time selected. Below is the graph of the probability distribution for Experiment 4.</li>\n<br>\n<img src="http://i.imgur.com/9VTK4cE.png">\n	4	2013-03-25 20:18:35.78635	2013-03-25 20:18:35.78635
6	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, and x<sub>4</sub> denoted as \nGood 1, Good 2, Good 3, and Good 4.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.\n\t</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have a Bundle Effect however. \nFor a concrete example, the bundle effect for a statement containing goods one and two\nwould be as follows:</li>\n<br>\n<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by \n  the graph below, will be randomly selected. Whatever option you have selected at that time \n  will be your final choice for that particular experiment. Therefore, it is in your best interest \n  to "choose as you go" in the sense that, if you prefer a particular option more to the one you \n  have selected, to change your selection. This experiment will be different from the other \n  experiments as your final choice is not necessarily the choice you selected when you click "finish", \n  but the choice that you have selected at the randomly determined time. </li>\n  <br>\n<li>The time that is selected will be determined by drawing from a random integer number between\n  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times \n  with the probability of the time happening on appearing on the y axis. For example, there is a\n  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the \n  time selected. Below is the graph of the probability distribution for Experiment 4.</li>\n<br>\n<img src="http://i.imgur.com/9VTK4cE.png">\n	5	2013-03-25 20:18:35.83869	2013-03-25 20:18:35.83869
7	<ol>\n<li>You will be faced with a decision to purchase a bundle of arbitrary goods\nx<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as \nGood 1, Good 2, Good 3, Good 4, and Good 5.</li>\n<br>\n<li>There is a menu of values for goods that are given to you.\n\t</li>\n<br>\n<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good \nwill have a equal chance of being assigned a value between the given range.</li>\n<br>\n<li> Purchasing goods together will have Bundle effects however. \nFor a concrete example, the bundle effect for a statement containing goods two, three, four,\nand \ffive would be as follows:</li>\n<br>\n<i>"Purchasing goods two, three, four, and five gives a bundle effect of - 1.0."</i> <br></li><br>\n<br>\n<li><B>THE FINAL VALUE YOU CALCULATE \nIS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>\n<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. \nThis means each bundle will have an equal chance of being assigned a value between the given range.\n<br>\n<li>Your monetary reward is based on the total value from your \ffinal choice.</li>\n<br>\n<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by \n  the graph below, will be randomly selected. Whatever option you have selected at that time \n  will be your final choice for that particular experiment. Therefore, it is in your best interest \n  to "choose as you go" in the sense that, if you prefer a particular option more to the one you \n  have selected, to change your selection. This experiment will be different from the other \n  experiments as your final choice is not necessarily the choice you selected when you click "finish", \n  but the choice that you have selected at the randomly determined time. </li>\n  <br>\n<li>The time that is selected will be determined by drawing from a random integer number between\n  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times \n  with the probability of the time happening on appearing on the y axis. For example, there is a\n  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the \n  time selected. Below is the graph of the probability distribution for Experiment 4.</li>\n<br>\n<img src="http://i.imgur.com/9VTK4cE.png">\n	6	2013-03-25 20:18:35.885554	2013-03-25 20:18:35.885554
\.


--
-- Data for Name: question_stats; Type: TABLE DATA; Schema: public; Owner: good
--

COPY question_stats (id, question_id, content, created_at, updated_at) FROM stdin;
90	144	Menu item was shown: bundle 1,2	2013-04-11 19:12:56.720243	2013-04-11 19:12:56.720243
91	144	Menu item was shown: bundle 1,3	2013-04-11 19:12:57.822365	2013-04-11 19:12:57.822365
92	144	Menu item was shown: bundle 2,3	2013-04-11 19:12:58.37914	2013-04-11 19:12:58.37914
93	144	Menu item was shown: bundle 1,2,3	2013-04-11 19:12:59.089672	2013-04-11 19:12:59.089672
94	144	Menu item was shown: bundle 2,3	2013-04-11 19:13:00.043994	2013-04-11 19:13:00.043994
95	144	Good 2 was clicked. Value is now: true	2013-04-11 19:13:03.117191	2013-04-11 19:13:03.117191
96	144	Good 3 was clicked. Value is now: true	2013-04-11 19:13:03.694913	2013-04-11 19:13:03.694913
97	131	Menu item was shown: bundle 1,2	2013-04-11 19:13:39.248218	2013-04-11 19:13:39.248218
98	131	Menu item was shown: bundle 1,3	2013-04-11 19:13:44.809398	2013-04-11 19:13:44.809398
99	157	Menu item was shown: bundle 1,2	2013-04-11 19:13:46.407104	2013-04-11 19:13:46.407104
100	131	Menu item was shown: bundle 1,2	2013-04-11 19:13:47.484313	2013-04-11 19:13:47.484313
101	131	Menu item was shown: bundle 2,3	2013-04-11 19:13:48.569247	2013-04-11 19:13:48.569247
102	157	Menu item was shown: bundle 1,3	2013-04-11 19:13:50.02405	2013-04-11 19:13:50.02405
103	131	Menu item was shown: bundle 1,2,3	2013-04-11 19:13:52.455472	2013-04-11 19:13:52.455472
104	157	Menu item was shown: bundle 2,3	2013-04-11 19:13:54.588984	2013-04-11 19:13:54.588984
105	157	Menu item was shown: bundle 1,2,3	2013-04-11 19:13:56.278784	2013-04-11 19:13:56.278784
106	157	Menu item was shown: bundle 1,3	2013-04-11 19:14:01.3047	2013-04-11 19:14:01.3047
107	157	Menu item was shown: bundle 1,2	2013-04-11 19:14:14.587733	2013-04-11 19:14:14.587733
108	131	Menu item was shown: bundle 1,2	2013-04-11 19:14:19.722619	2013-04-11 19:14:19.722619
109	131	Menu item was shown: bundle 1,3	2013-04-11 19:14:26.554308	2013-04-11 19:14:26.554308
110	131	Menu item was shown: bundle 2,3	2013-04-11 19:14:36.138742	2013-04-11 19:14:36.138742
111	131	Menu item was shown: bundle 1,2,3	2013-04-11 19:14:47.94178	2013-04-11 19:14:47.94178
112	157	Menu item was shown: bundle 1,3	2013-04-11 19:14:53.456151	2013-04-11 19:14:53.456151
113	157	Menu item was shown: bundle 2,3	2013-04-11 19:15:00.907423	2013-04-11 19:15:00.907423
114	131	Menu item was shown: bundle 1,2	2013-04-11 19:15:18.971757	2013-04-11 19:15:18.971757
115	131	Menu item was shown: bundle 1,3	2013-04-11 19:15:22.153634	2013-04-11 19:15:22.153634
116	131	Menu item was shown: bundle 2,3	2013-04-11 19:15:24.042803	2013-04-11 19:15:24.042803
117	157	Menu item was shown: bundle 1,2,3	2013-04-11 19:15:30.592446	2013-04-11 19:15:30.592446
118	131	Menu item was shown: bundle 1,2	2013-04-11 19:15:53.677293	2013-04-11 19:15:53.677293
119	157	Good 1 was clicked. Value is now: true	2013-04-11 19:16:01.604542	2013-04-11 19:16:01.604542
120	157	Good 3 was clicked. Value is now: true	2013-04-11 19:16:02.595907	2013-04-11 19:16:02.595907
121	131	Good 2 was clicked. Value is now: true	2013-04-11 19:16:05.843936	2013-04-11 19:16:05.843936
122	131	Good 1 was clicked. Value is now: true	2013-04-11 19:16:06.578094	2013-04-11 19:16:06.578094
123	133	Menu item was shown: bundle 1,2	2013-04-11 19:18:09.410407	2013-04-11 19:18:09.410407
124	133	Menu item was shown: bundle 2,3	2013-04-11 19:18:17.096621	2013-04-11 19:18:17.096621
125	133	Menu item was shown: bundle 1,3	2013-04-11 19:18:20.781592	2013-04-11 19:18:20.781592
126	133	Menu item was shown: bundle 1,2,3	2013-04-11 19:18:25.794154	2013-04-11 19:18:25.794154
127	147	Menu item was shown: bundle 1,2	2013-04-11 19:18:31.725724	2013-04-11 19:18:31.725724
128	147	Menu item was hidden: bundle 1,2	2013-04-11 19:18:33.349273	2013-04-11 19:18:33.349273
129	147	Menu item was shown: bundle 1,3	2013-04-11 19:18:33.943175	2013-04-11 19:18:33.943175
130	147	Menu item was hidden: bundle 1,3	2013-04-11 19:18:34.447319	2013-04-11 19:18:34.447319
131	147	Menu item was shown: bundle 1,4	2013-04-11 19:18:34.942561	2013-04-11 19:18:34.942561
132	147	Menu item was hidden: bundle 1,4	2013-04-11 19:18:35.39919	2013-04-11 19:18:35.39919
133	147	Menu item was shown: bundle 2,3	2013-04-11 19:18:35.837468	2013-04-11 19:18:35.837468
134	147	Menu item was hidden: bundle 2,3	2013-04-11 19:18:36.704619	2013-04-11 19:18:36.704619
135	147	Menu item was shown: bundle 2,4	2013-04-11 19:18:37.373577	2013-04-11 19:18:37.373577
136	147	Menu item was hidden: bundle 2,4	2013-04-11 19:18:37.830674	2013-04-11 19:18:37.830674
137	147	Menu item was shown: bundle 3,4	2013-04-11 19:18:38.300081	2013-04-11 19:18:38.300081
138	147	Menu item was hidden: bundle 3,4	2013-04-11 19:18:38.737432	2013-04-11 19:18:38.737432
139	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:18:41.789563	2013-04-11 19:18:41.789563
140	133	Combo was clicked. Value is now: true	2013-04-11 19:18:46.763477	2013-04-11 19:18:46.763477
141	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:18:50.929382	2013-04-11 19:18:50.929382
142	147	Menu item was shown: bundle 1,2,4	2013-04-11 19:18:51.443317	2013-04-11 19:18:51.443317
143	147	Menu item was hidden: bundle 1,2,4	2013-04-11 19:18:53.279742	2013-04-11 19:18:53.279742
144	147	Menu item was shown: bundle 1,3,4	2013-04-11 19:18:53.86379	2013-04-11 19:18:53.86379
145	147	Menu item was hidden: bundle 1,3,4	2013-04-11 19:18:54.457709	2013-04-11 19:18:54.457709
146	147	Menu item was shown: bundle 2,3,4	2013-04-11 19:18:54.892808	2013-04-11 19:18:54.892808
147	147	Menu item was hidden: bundle 2,3,4	2013-04-11 19:18:55.291018	2013-04-11 19:18:55.291018
148	147	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:18:55.723082	2013-04-11 19:18:55.723082
149	147	Menu item was hidden: bundle 1,2,3,4	2013-04-11 19:18:56.707936	2013-04-11 19:18:56.707936
150	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:18:57.438602	2013-04-11 19:18:57.438602
151	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:18:58.983448	2013-04-11 19:18:58.983448
152	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:01.113254	2013-04-11 19:19:01.113254
153	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:19:02.427399	2013-04-11 19:19:02.427399
154	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:08.684921	2013-04-11 19:19:08.684921
155	166	Menu item was shown: bundle 1,2	2013-04-11 19:19:09.31817	2013-04-11 19:19:09.31817
156	147	Menu item was shown: bundle 3,4	2013-04-11 19:19:10.713165	2013-04-11 19:19:10.713165
157	166	Menu item was shown: bundle 1,3	2013-04-11 19:19:11.479138	2013-04-11 19:19:11.479138
158	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:12.105377	2013-04-11 19:19:12.105377
159	166	Menu item was shown: bundle 1,4	2013-04-11 19:19:12.625162	2013-04-11 19:19:12.625162
160	166	Menu item was shown: bundle 2,3	2013-04-11 19:19:13.466431	2013-04-11 19:19:13.466431
161	166	Menu item was shown: bundle 2,4	2013-04-11 19:19:14.449981	2013-04-11 19:19:14.449981
162	166	Menu item was shown: bundle 3,4	2013-04-11 19:19:15.22913	2013-04-11 19:19:15.22913
163	166	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:16.012503	2013-04-11 19:19:16.012503
164	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:19:16.490152	2013-04-11 19:19:16.490152
165	166	Menu item was shown: bundle 1,2,4	2013-04-11 19:19:16.977021	2013-04-11 19:19:16.977021
166	147	Menu item was shown: bundle 1,2,4	2013-04-11 19:19:17.253759	2013-04-11 19:19:17.253759
167	147	Menu item was hidden: bundle 1,2,4	2013-04-11 19:19:17.667801	2013-04-11 19:19:17.667801
168	166	Menu item was shown: bundle 1,3,4	2013-04-11 19:19:17.716508	2013-04-11 19:19:17.716508
169	147	Menu item was shown: bundle 1,3,4	2013-04-11 19:19:18.019955	2013-04-11 19:19:18.019955
170	147	Menu item was hidden: bundle 1,3,4	2013-04-11 19:19:18.369462	2013-04-11 19:19:18.369462
171	147	Menu item was shown: bundle 2,3,4	2013-04-11 19:19:18.771473	2013-04-11 19:19:18.771473
172	166	Menu item was shown: bundle 2,3,4	2013-04-11 19:19:18.784989	2013-04-11 19:19:18.784989
173	147	Menu item was hidden: bundle 2,3,4	2013-04-11 19:19:19.240441	2013-04-11 19:19:19.240441
174	166	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:19:19.599939	2013-04-11 19:19:19.599939
175	147	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:19:19.741159	2013-04-11 19:19:19.741159
176	147	Menu item was hidden: bundle 1,2,3,4	2013-04-11 19:19:20.160368	2013-04-11 19:19:20.160368
177	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:20.81929	2013-04-11 19:19:20.81929
178	166	Menu item was shown: bundle 1,2	2013-04-11 19:19:20.931306	2013-04-11 19:19:20.931306
179	166	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:19:27.006522	2013-04-11 19:19:27.006522
180	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:19:28.202278	2013-04-11 19:19:28.202278
181	147	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:19:29.09321	2013-04-11 19:19:29.09321
182	147	Menu item was hidden: bundle 1,2,3,4	2013-04-11 19:19:30.177771	2013-04-11 19:19:30.177771
183	166	Menu item was shown: bundle 1,2	2013-04-11 19:19:35.129995	2013-04-11 19:19:35.129995
184	147	Menu item was shown: bundle 1,3,4	2013-04-11 19:19:36.952771	2013-04-11 19:19:36.952771
185	147	Menu item was hidden: bundle 1,3,4	2013-04-11 19:19:37.586545	2013-04-11 19:19:37.586545
186	147	Menu item was shown: bundle 3,4	2013-04-11 19:19:39.439073	2013-04-11 19:19:39.439073
187	147	Menu item was hidden: bundle 3,4	2013-04-11 19:19:40.481616	2013-04-11 19:19:40.481616
188	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:40.821405	2013-04-11 19:19:40.821405
189	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:19:41.320552	2013-04-11 19:19:41.320552
190	147	Menu item was shown: bundle 3,4	2013-04-11 19:19:41.596623	2013-04-11 19:19:41.596623
191	147	Menu item was hidden: bundle 3,4	2013-04-11 19:19:44.0506	2013-04-11 19:19:44.0506
192	166	Good 1 was clicked. Value is now: true	2013-04-11 19:19:47.676725	2013-04-11 19:19:47.676725
193	166	Good 2 was clicked. Value is now: true	2013-04-11 19:19:48.150998	2013-04-11 19:19:48.150998
194	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:19:48.249542	2013-04-11 19:19:48.249542
195	147	Menu item was hidden: bundle 1,2,3	2013-04-11 19:19:49.251339	2013-04-11 19:19:49.251339
196	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:20:18.700114	2013-04-11 19:20:18.700114
197	147	Menu item was shown: bundle 1,2,4	2013-04-11 19:20:26.906336	2013-04-11 19:20:26.906336
198	147	Menu item was shown: bundle 1,3,4	2013-04-11 19:20:27.470489	2013-04-11 19:20:27.470489
199	147	Menu item was shown: bundle 2,3,4	2013-04-11 19:20:27.887048	2013-04-11 19:20:27.887048
200	147	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:20:28.255135	2013-04-11 19:20:28.255135
201	147	Menu item was shown: bundle 3,4	2013-04-11 19:20:29.457761	2013-04-11 19:20:29.457761
202	147	Menu item was shown: bundle 1,2,3	2013-04-11 19:20:29.9714	2013-04-11 19:20:29.9714
203	147	Good 1 was clicked. Value is now: true	2013-04-11 19:20:32.262578	2013-04-11 19:20:32.262578
204	147	Good 2 was clicked. Value is now: true	2013-04-11 19:20:32.910111	2013-04-11 19:20:32.910111
205	147	Good 3 was clicked. Value is now: true	2013-04-11 19:20:33.770162	2013-04-11 19:20:33.770162
206	158	Menu item was shown: bundle 1,2	2013-04-11 19:23:19.440023	2013-04-11 19:23:19.440023
207	152	Combo was clicked. Value is now: true	2013-04-11 19:23:22.8702	2013-04-11 19:23:22.8702
208	152	Menu item was shown: bundle 1,2	2013-04-11 19:23:24.083252	2013-04-11 19:23:24.083252
209	158	Menu item was shown: bundle 1,3	2013-04-11 19:23:26.501348	2013-04-11 19:23:26.501348
210	158	Menu item was shown: bundle 2,3	2013-04-11 19:23:29.862089	2013-04-11 19:23:29.862089
211	152	Menu item was shown: bundle 1,3	2013-04-11 19:23:30.494506	2013-04-11 19:23:30.494506
212	152	Menu item was shown: bundle 1,2	2013-04-11 19:23:31.136668	2013-04-11 19:23:31.136668
213	152	Menu item was shown: bundle 1,3	2013-04-11 19:23:31.566075	2013-04-11 19:23:31.566075
214	158	Menu item was shown: bundle 1,2,3	2013-04-11 19:23:31.686281	2013-04-11 19:23:31.686281
215	139	Good 2 was clicked. Value is now: true	2013-04-11 19:23:34.59649	2013-04-11 19:23:34.59649
216	152	Good 1 was clicked. Value is now: true	2013-04-11 19:23:35.026197	2013-04-11 19:23:35.026197
217	152	Good 3 was clicked. Value is now: true	2013-04-11 19:23:35.58157	2013-04-11 19:23:35.58157
218	152	Menu item was shown: bundle 2,3	2013-04-11 19:23:36.403709	2013-04-11 19:23:36.403709
219	139	Combo was clicked. Value is now: true	2013-04-11 19:23:37.45202	2013-04-11 19:23:37.45202
220	139	Menu item was shown: bundle 1,2,3	2013-04-11 19:23:38.376011	2013-04-11 19:23:38.376011
221	139	Menu item was shown: bundle 1,2	2013-04-11 19:23:40.596294	2013-04-11 19:23:40.596294
222	152	Menu item was shown: bundle 1,2,3	2013-04-11 19:23:40.880861	2013-04-11 19:23:40.880861
223	152	Menu item was shown: bundle 1,3	2013-04-11 19:23:42.574468	2013-04-11 19:23:42.574468
224	158	Good 1 was clicked. Value is now: true	2013-04-11 19:23:43.653592	2013-04-11 19:23:43.653592
225	158	Good 2 was clicked. Value is now: true	2013-04-11 19:23:44.494006	2013-04-11 19:23:44.494006
226	139	Good 2 was clicked. Value is now: true	2013-04-11 19:23:44.951515	2013-04-11 19:23:44.951515
227	139	Good 1 was clicked. Value is now: true	2013-04-11 19:23:45.404861	2013-04-11 19:23:45.404861
228	152	Menu item was shown: bundle 1,2	2013-04-11 19:23:47.331543	2013-04-11 19:23:47.331543
229	139	Menu item was shown: bundle 1,3	2013-04-11 19:23:47.662991	2013-04-11 19:23:47.662991
230	139	Menu item was shown: bundle 2,3	2013-04-11 19:23:49.446783	2013-04-11 19:23:49.446783
231	139	Menu item was shown: bundle 1,2,3	2013-04-11 19:23:50.367116	2013-04-11 19:23:50.367116
232	164	Menu item was shown: bundle 2,3	2013-04-11 19:27:32.430788	2013-04-11 19:27:32.430788
233	164	Menu item was shown: bundle 1,3	2013-04-11 19:27:35.281207	2013-04-11 19:27:35.281207
234	164	Menu item was shown: bundle 1,2	2013-04-11 19:27:36.633366	2013-04-11 19:27:36.633366
235	164	Menu item was shown: bundle 1,2,3	2013-04-11 19:27:37.684892	2013-04-11 19:27:37.684892
236	153	Combo was clicked. Value is now: true	2013-04-11 19:27:42.084664	2013-04-11 19:27:42.084664
237	164	Combo was clicked. Value is now: true	2013-04-11 19:27:44.351211	2013-04-11 19:27:44.351211
238	153	Menu item was shown: bundle 1,2	2013-04-11 19:27:44.989841	2013-04-11 19:27:44.989841
239	153	Menu item was shown: bundle 1,3	2013-04-11 19:27:45.588324	2013-04-11 19:27:45.588324
240	164	Menu item was shown: bundle 2,3	2013-04-11 19:27:45.808593	2013-04-11 19:27:45.808593
241	164	Menu item was shown: bundle 1,2,3	2013-04-11 19:27:50.794426	2013-04-11 19:27:50.794426
242	153	Menu item was shown: bundle 1,4	2013-04-11 19:27:52.599478	2013-04-11 19:27:52.599478
243	164	Good 1 was clicked. Value is now: true	2013-04-11 19:27:53.824865	2013-04-11 19:27:53.824865
244	153	Menu item was shown: bundle 2,3	2013-04-11 19:27:54.756141	2013-04-11 19:27:54.756141
245	164	Good 3 was clicked. Value is now: true	2013-04-11 19:27:56.098755	2013-04-11 19:27:56.098755
246	164	Good 2 was clicked. Value is now: true	2013-04-11 19:27:56.973706	2013-04-11 19:27:56.973706
247	153	Menu item was shown: bundle 2,4	2013-04-11 19:27:58.572846	2013-04-11 19:27:58.572846
248	132	Menu item was shown: bundle 1,2	2013-04-11 19:27:58.98095	2013-04-11 19:27:58.98095
249	153	Menu item was shown: bundle 1,2,3	2013-04-11 19:28:01.39721	2013-04-11 19:28:01.39721
250	132	Menu item was shown: bundle 1,3	2013-04-11 19:28:02.104645	2013-04-11 19:28:02.104645
251	153	Menu item was shown: bundle 1,2,4	2013-04-11 19:28:02.236776	2013-04-11 19:28:02.236776
252	132	Menu item was shown: bundle 2,3	2013-04-11 19:28:05.132016	2013-04-11 19:28:05.132016
253	164	Combo was clicked. Value is now: true	2013-04-11 19:28:05.574864	2013-04-11 19:28:05.574864
254	132	Menu item was shown: bundle 1,2,3	2013-04-11 19:28:08.119071	2013-04-11 19:28:08.119071
255	153	Good 1 was clicked. Value is now: true	2013-04-11 19:28:08.86662	2013-04-11 19:28:08.86662
256	132	Menu item was shown: bundle 2,3	2013-04-11 19:28:09.707235	2013-04-11 19:28:09.707235
257	153	Good 2 was clicked. Value is now: true	2013-04-11 19:28:10.001545	2013-04-11 19:28:10.001545
258	153	Good 4 was clicked. Value is now: true	2013-04-11 19:28:11.983815	2013-04-11 19:28:11.983815
259	132	Good 2 was clicked. Value is now: true	2013-04-11 19:28:12.154184	2013-04-11 19:28:12.154184
260	132	Good 3 was clicked. Value is now: true	2013-04-11 19:28:12.598584	2013-04-11 19:28:12.598584
261	153	Menu item was shown: bundle 1,3,4	2013-04-11 19:28:13.183611	2013-04-11 19:28:13.183611
262	153	Menu item was shown: bundle 2,3,4	2013-04-11 19:28:14.097487	2013-04-11 19:28:14.097487
263	153	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:28:14.713756	2013-04-11 19:28:14.713756
264	153	Menu item was shown: bundle 1,2,4	2013-04-11 19:28:15.655458	2013-04-11 19:28:15.655458
265	153	Menu item was shown: bundle 1,2,3	2013-04-11 19:28:17.029978	2013-04-11 19:28:17.029978
266	153	Menu item was shown: bundle 1,2,4	2013-04-11 19:28:19.354535	2013-04-11 19:28:19.354535
267	153	Menu item was shown: bundle 1,2,3	2013-04-11 19:28:20.018962	2013-04-11 19:28:20.018962
268	153	Menu item was shown: bundle 3,4	2013-04-11 19:28:20.585437	2013-04-11 19:28:20.585437
269	153	Menu item was shown: bundle 2,4	2013-04-11 19:28:20.984308	2013-04-11 19:28:20.984308
270	153	Menu item was shown: bundle 2,3	2013-04-11 19:28:21.504185	2013-04-11 19:28:21.504185
271	153	Menu item was shown: bundle 1,4	2013-04-11 19:28:21.937563	2013-04-11 19:28:21.937563
272	153	Menu item was shown: bundle 2,3	2013-04-11 19:28:22.350807	2013-04-11 19:28:22.350807
273	153	Menu item was shown: bundle 1,3	2013-04-11 19:28:24.956411	2013-04-11 19:28:24.956411
274	153	Menu item was shown: bundle 1,2	2013-04-11 19:28:27.640212	2013-04-11 19:28:27.640212
275	153	Menu item was shown: bundle 1,4	2013-04-11 19:28:29.212083	2013-04-11 19:28:29.212083
276	153	Menu item was shown: bundle 1,2,4	2013-04-11 19:28:35.720039	2013-04-11 19:28:35.720039
277	167	Menu item was shown: bundle 1,4	2013-04-11 19:31:28.764346	2013-04-11 19:31:28.764346
278	167	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:31:32.131582	2013-04-11 19:31:32.131582
279	167	Menu item was shown: bundle 2,3,4	2013-04-11 19:31:38.290744	2013-04-11 19:31:38.290744
280	167	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:31:44.184055	2013-04-11 19:31:44.184055
281	167	Menu item was shown: bundle 1,3,4	2013-04-11 19:31:49.634961	2013-04-11 19:31:49.634961
282	167	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:31:55.487231	2013-04-11 19:31:55.487231
283	167	Menu item was shown: bundle 1,2,4	2013-04-11 19:31:59.712989	2013-04-11 19:31:59.712989
284	167	Menu item was shown: bundle 1,2,3	2013-04-11 19:32:03.873413	2013-04-11 19:32:03.873413
285	167	Menu item was shown: bundle 3,4	2013-04-11 19:32:04.8804	2013-04-11 19:32:04.8804
286	167	Menu item was shown: bundle 2,4	2013-04-11 19:32:05.708155	2013-04-11 19:32:05.708155
287	167	Menu item was hidden: bundle 2,4	2013-04-11 19:32:06.029791	2013-04-11 19:32:06.029791
288	167	Menu item was shown: bundle 2,4	2013-04-11 19:32:06.82898	2013-04-11 19:32:06.82898
289	167	Menu item was shown: bundle 2,3	2013-04-11 19:32:12.863555	2013-04-11 19:32:12.863555
290	167	Menu item was shown: bundle 1,4	2013-04-11 19:32:13.991431	2013-04-11 19:32:13.991431
291	167	Menu item was shown: bundle 1,3	2013-04-11 19:32:16.496731	2013-04-11 19:32:16.496731
292	167	Menu item was shown: bundle 1,2	2013-04-11 19:32:19.027645	2013-04-11 19:32:19.027645
293	142	Good 3 was clicked. Value is now: true	2013-04-11 19:32:23.970005	2013-04-11 19:32:23.970005
294	167	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:32:24.333289	2013-04-11 19:32:24.333289
295	142	Combo was clicked. Value is now: true	2013-04-11 19:32:25.7257	2013-04-11 19:32:25.7257
296	167	Menu item was shown: bundle 2,3,4	2013-04-11 19:32:29.13507	2013-04-11 19:32:29.13507
297	142	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:32:29.905515	2013-04-11 19:32:29.905515
298	155	Combo was clicked. Value is now: true	2013-04-11 19:32:32.437011	2013-04-11 19:32:32.437011
299	142	Menu item was shown: bundle 1,2	2013-04-11 19:32:33.546878	2013-04-11 19:32:33.546878
300	142	Menu item was hidden: bundle 1,2	2013-04-11 19:32:34.442431	2013-04-11 19:32:34.442431
301	142	Menu item was shown: bundle 1,3	2013-04-11 19:32:34.925591	2013-04-11 19:32:34.925591
302	142	Menu item was hidden: bundle 1,3	2013-04-11 19:32:35.889268	2013-04-11 19:32:35.889268
303	142	Menu item was shown: bundle 1,4	2013-04-11 19:32:36.697636	2013-04-11 19:32:36.697636
304	142	Menu item was hidden: bundle 1,4	2013-04-11 19:32:37.277335	2013-04-11 19:32:37.277335
305	155	Menu item was shown: bundle 1,2	2013-04-11 19:32:37.715415	2013-04-11 19:32:37.715415
306	142	Menu item was shown: bundle 1,5	2013-04-11 19:32:37.74856	2013-04-11 19:32:37.74856
307	155	Menu item was shown: bundle 1,3	2013-04-11 19:32:38.130243	2013-04-11 19:32:38.130243
308	142	Menu item was hidden: bundle 1,5	2013-04-11 19:32:38.258035	2013-04-11 19:32:38.258035
309	142	Menu item was shown: bundle 2,3	2013-04-11 19:32:38.86614	2013-04-11 19:32:38.86614
310	167	Menu item was shown: bundle 1,3,4	2013-04-11 19:32:39.259084	2013-04-11 19:32:39.259084
311	142	Menu item was hidden: bundle 2,3	2013-04-11 19:32:39.324749	2013-04-11 19:32:39.324749
312	155	Good 1 was clicked. Value is now: true	2013-04-11 19:32:39.867199	2013-04-11 19:32:39.867199
313	142	Menu item was shown: bundle 2,4	2013-04-11 19:32:40.07201	2013-04-11 19:32:40.07201
314	155	Good 2 was clicked. Value is now: true	2013-04-11 19:32:40.269996	2013-04-11 19:32:40.269996
315	142	Menu item was hidden: bundle 2,4	2013-04-11 19:32:40.456466	2013-04-11 19:32:40.456466
316	142	Menu item was shown: bundle 2,5	2013-04-11 19:32:41.131309	2013-04-11 19:32:41.131309
317	155	Menu item was shown: bundle 1,4	2013-04-11 19:32:41.190933	2013-04-11 19:32:41.190933
318	155	Menu item was shown: bundle 1,5	2013-04-11 19:32:41.617169	2013-04-11 19:32:41.617169
319	155	Menu item was shown: bundle 2,3	2013-04-11 19:32:41.956657	2013-04-11 19:32:41.956657
320	142	Menu item was hidden: bundle 2,5	2013-04-11 19:32:42.286658	2013-04-11 19:32:42.286658
321	155	Menu item was shown: bundle 2,4	2013-04-11 19:32:42.543877	2013-04-11 19:32:42.543877
322	155	Menu item was shown: bundle 2,5	2013-04-11 19:32:42.949024	2013-04-11 19:32:42.949024
323	142	Menu item was shown: bundle 3,4	2013-04-11 19:32:42.9754	2013-04-11 19:32:42.9754
324	142	Menu item was hidden: bundle 3,4	2013-04-11 19:32:43.335347	2013-04-11 19:32:43.335347
325	155	Menu item was shown: bundle 3,4	2013-04-11 19:32:43.540346	2013-04-11 19:32:43.540346
326	155	Menu item was shown: bundle 2,5	2013-04-11 19:32:44.040621	2013-04-11 19:32:44.040621
327	142	Menu item was shown: bundle 3,5	2013-04-11 19:32:45.013207	2013-04-11 19:32:45.013207
328	142	Menu item was hidden: bundle 3,5	2013-04-11 19:32:45.558597	2013-04-11 19:32:45.558597
329	155	Menu item was shown: bundle 2,4	2013-04-11 19:32:45.898566	2013-04-11 19:32:45.898566
330	142	Menu item was shown: bundle 4,5	2013-04-11 19:32:46.084474	2013-04-11 19:32:46.084474
331	142	Menu item was shown: bundle 1,2,3	2013-04-11 19:32:46.759745	2013-04-11 19:32:46.759745
332	155	Menu item was shown: bundle 2,5	2013-04-11 19:32:47.295707	2013-04-11 19:32:47.295707
333	142	Menu item was shown: bundle 1,2,4	2013-04-11 19:32:47.466554	2013-04-11 19:32:47.466554
334	155	Menu item was shown: bundle 3,4	2013-04-11 19:32:47.939176	2013-04-11 19:32:47.939176
335	142	Menu item was shown: bundle 1,2,5	2013-04-11 19:32:48.096306	2013-04-11 19:32:48.096306
336	142	Menu item was shown: bundle 1,3,4	2013-04-11 19:32:48.999845	2013-04-11 19:32:48.999845
337	142	Menu item was shown: bundle 1,3,5	2013-04-11 19:32:49.91366	2013-04-11 19:32:49.91366
338	155	Good 1 was clicked. Value is now: false	2013-04-11 19:32:50.439486	2013-04-11 19:32:50.439486
339	155	Good 2 was clicked. Value is now: false	2013-04-11 19:32:50.866729	2013-04-11 19:32:50.866729
340	155	Good 3 was clicked. Value is now: true	2013-04-11 19:32:51.162045	2013-04-11 19:32:51.162045
341	155	Good 4 was clicked. Value is now: true	2013-04-11 19:32:51.431668	2013-04-11 19:32:51.431668
342	155	Menu item was shown: bundle 3,5	2013-04-11 19:32:52.208337	2013-04-11 19:32:52.208337
343	167	Good 1 was clicked. Value is now: true	2013-04-11 19:32:53.367976	2013-04-11 19:32:53.367976
344	155	Menu item was shown: bundle 4,5	2013-04-11 19:32:53.892203	2013-04-11 19:32:53.892203
345	167	Good 3 was clicked. Value is now: true	2013-04-11 19:32:54.141642	2013-04-11 19:32:54.141642
346	155	Menu item was shown: bundle 1,2,3	2013-04-11 19:32:54.706404	2013-04-11 19:32:54.706404
347	167	Good 4 was clicked. Value is now: true	2013-04-11 19:32:54.942569	2013-04-11 19:32:54.942569
348	142	Menu item was shown: bundle 1,4,5	2013-04-11 19:32:55.519408	2013-04-11 19:32:55.519408
349	142	Menu item was shown: bundle 2,3,4	2013-04-11 19:32:57.378817	2013-04-11 19:32:57.378817
350	142	Menu item was shown: bundle 2,3,5	2013-04-11 19:32:58.024618	2013-04-11 19:32:58.024618
351	155	Menu item was shown: bundle 1,2,4	2013-04-11 19:32:58.186117	2013-04-11 19:32:58.186117
352	142	Menu item was shown: bundle 2,4,5	2013-04-11 19:32:58.591555	2013-04-11 19:32:58.591555
353	155	Menu item was shown: bundle 1,2,5	2013-04-11 19:32:59.090386	2013-04-11 19:32:59.090386
354	142	Menu item was shown: bundle 3,4,5	2013-04-11 19:32:59.388704	2013-04-11 19:32:59.388704
355	155	Menu item was shown: bundle 1,3,4	2013-04-11 19:32:59.669965	2013-04-11 19:32:59.669965
356	142	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:32:59.831907	2013-04-11 19:32:59.831907
357	142	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:33:00.382895	2013-04-11 19:33:00.382895
358	155	Menu item was shown: bundle 1,2,5	2013-04-11 19:33:00.779377	2013-04-11 19:33:00.779377
359	142	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:33:01.228483	2013-04-11 19:33:01.228483
360	142	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:33:01.886887	2013-04-11 19:33:01.886887
361	155	Menu item was shown: bundle 3,4	2013-04-11 19:33:03.978015	2013-04-11 19:33:03.978015
362	155	Menu item was shown: bundle 1,3,4	2013-04-11 19:33:05.483193	2013-04-11 19:33:05.483193
363	155	Menu item was shown: bundle 1,2,5	2013-04-11 19:33:06.242832	2013-04-11 19:33:06.242832
364	142	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:33:10.883484	2013-04-11 19:33:10.883484
365	155	Menu item was shown: bundle 1,3,4	2013-04-11 19:33:12.249752	2013-04-11 19:33:12.249752
366	155	Menu item was shown: bundle 1,3,5	2013-04-11 19:33:12.678623	2013-04-11 19:33:12.678623
367	142	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:33:12.718321	2013-04-11 19:33:12.718321
368	155	Menu item was shown: bundle 1,4,5	2013-04-11 19:33:12.996623	2013-04-11 19:33:12.996623
369	155	Menu item was shown: bundle 2,3,4	2013-04-11 19:33:13.622245	2013-04-11 19:33:13.622245
370	155	Menu item was shown: bundle 2,3,5	2013-04-11 19:33:14.01405	2013-04-11 19:33:14.01405
371	155	Menu item was shown: bundle 2,3,4	2013-04-11 19:33:14.399179	2013-04-11 19:33:14.399179
372	155	Menu item was shown: bundle 2,3,5	2013-04-11 19:33:17.313728	2013-04-11 19:33:17.313728
373	155	Menu item was shown: bundle 2,4,5	2013-04-11 19:33:17.905265	2013-04-11 19:33:17.905265
374	155	Menu item was shown: bundle 3,4,5	2013-04-11 19:33:18.67695	2013-04-11 19:33:18.67695
375	155	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:33:19.450331	2013-04-11 19:33:19.450331
376	155	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:33:19.792059	2013-04-11 19:33:19.792059
377	155	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:33:20.949056	2013-04-11 19:33:20.949056
378	155	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:33:22.087486	2013-04-11 19:33:22.087486
379	155	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:33:22.76605	2013-04-11 19:33:22.76605
380	142	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:33:23.397953	2013-04-11 19:33:23.397953
381	155	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:33:23.522412	2013-04-11 19:33:23.522412
382	155	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:33:23.923798	2013-04-11 19:33:23.923798
383	142	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:33:23.95328	2013-04-11 19:33:23.95328
384	155	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:33:26.596893	2013-04-11 19:33:26.596893
385	155	Menu item was shown: bundle 3,4,5	2013-04-11 19:33:27.095777	2013-04-11 19:33:27.095777
386	155	Menu item was shown: bundle 2,4,5	2013-04-11 19:33:27.694815	2013-04-11 19:33:27.694815
387	155	Menu item was shown: bundle 2,3,5	2013-04-11 19:33:28.461888	2013-04-11 19:33:28.461888
388	142	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:33:42.134161	2013-04-11 19:33:42.134161
389	155	Menu item was shown: bundle 2,3,4	2013-04-11 19:33:42.670584	2013-04-11 19:33:42.670584
390	155	Menu item was shown: bundle 1,4,5	2013-04-11 19:33:43.002979	2013-04-11 19:33:43.002979
391	155	Menu item was shown: bundle 2,3,4	2013-04-11 19:33:43.415496	2013-04-11 19:33:43.415496
392	155	Menu item was shown: bundle 3,4	2013-04-11 19:33:48.327093	2013-04-11 19:33:48.327093
393	159	Menu item was shown: bundle 1,2,3	2013-04-11 19:35:43.843604	2013-04-11 19:35:43.843604
394	159	Menu item was shown: bundle 2,3	2013-04-11 19:35:49.94852	2013-04-11 19:35:49.94852
395	159	Menu item was shown: bundle 1,2	2013-04-11 19:35:53.506467	2013-04-11 19:35:53.506467
396	159	Menu item was shown: bundle 1,3	2013-04-11 19:35:55.288028	2013-04-11 19:35:55.288028
397	159	Menu item was shown: bundle 1,2,3	2013-04-11 19:36:05.172698	2013-04-11 19:36:05.172698
398	159	Menu item was shown: bundle 2,3	2013-04-11 19:36:10.681279	2013-04-11 19:36:10.681279
399	159	Good 2 was clicked. Value is now: true	2013-04-11 19:36:13.313933	2013-04-11 19:36:13.313933
400	159	Good 3 was clicked. Value is now: true	2013-04-11 19:36:13.694672	2013-04-11 19:36:13.694672
401	143	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:36:44.559694	2013-04-11 19:36:44.559694
402	143	Combo was clicked. Value is now: true	2013-04-11 19:36:46.550099	2013-04-11 19:36:46.550099
403	143	Menu item was shown: bundle 1,2	2013-04-11 19:36:49.850308	2013-04-11 19:36:49.850308
404	145	Combo was clicked. Value is now: true	2013-04-11 19:36:51.002314	2013-04-11 19:36:51.002314
405	145	Menu item was shown: bundle 1,2	2013-04-11 19:36:52.110847	2013-04-11 19:36:52.110847
406	143	Menu item was shown: bundle 1,3	2013-04-11 19:36:56.994925	2013-04-11 19:36:56.994925
407	145	Good 1 was clicked. Value is now: true	2013-04-11 19:36:57.664791	2013-04-11 19:36:57.664791
408	145	Good 2 was clicked. Value is now: true	2013-04-11 19:36:57.994764	2013-04-11 19:36:57.994764
409	145	Menu item was shown: bundle 1,3	2013-04-11 19:36:58.741397	2013-04-11 19:36:58.741397
410	145	Menu item was shown: bundle 2,3	2013-04-11 19:37:01.413209	2013-04-11 19:37:01.413209
411	145	Good 1 was clicked. Value is now: false	2013-04-11 19:37:05.348278	2013-04-11 19:37:05.348278
412	143	Menu item was shown: bundle 1,5	2013-04-11 19:37:05.38691	2013-04-11 19:37:05.38691
413	145	Good 3 was clicked. Value is now: true	2013-04-11 19:37:05.62717	2013-04-11 19:37:05.62717
414	145	Menu item was shown: bundle 1,2,3	2013-04-11 19:37:07.169716	2013-04-11 19:37:07.169716
415	143	Good 1 was clicked. Value is now: true	2013-04-11 19:37:10.663243	2013-04-11 19:37:10.663243
416	143	Good 5 was clicked. Value is now: true	2013-04-11 19:37:11.414858	2013-04-11 19:37:11.414858
417	145	Good 1 was clicked. Value is now: true	2013-04-11 19:37:16.150659	2013-04-11 19:37:16.150659
418	143	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:37:18.422502	2013-04-11 19:37:18.422502
419	143	Menu item was shown: bundle 1,5	2013-04-11 19:37:23.015738	2013-04-11 19:37:23.015738
420	143	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:37:30.595008	2013-04-11 19:37:30.595008
421	143	Combo was clicked. Value is now: true	2013-04-11 19:37:36.069598	2013-04-11 19:37:36.069598
422	168	Menu item was shown: bundle 1,3,4	2013-04-11 19:39:51.673225	2013-04-11 19:39:51.673225
423	168	Menu item was shown: bundle 1,3	2013-04-11 19:40:00.995101	2013-04-11 19:40:00.995101
424	168	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:40:05.675397	2013-04-11 19:40:05.675397
425	168	Menu item was shown: bundle 2,5	2013-04-11 19:40:15.806002	2013-04-11 19:40:15.806002
426	168	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:40:19.917021	2013-04-11 19:40:19.917021
427	168	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:40:27.728797	2013-04-11 19:40:27.728797
428	168	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:40:36.722298	2013-04-11 19:40:36.722298
429	168	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:40:38.797768	2013-04-11 19:40:38.797768
430	168	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:40:39.88558	2013-04-11 19:40:39.88558
431	168	Good 1 was clicked. Value is now: true	2013-04-11 19:40:57.983133	2013-04-11 19:40:57.983133
432	168	Good 2 was clicked. Value is now: true	2013-04-11 19:40:58.528798	2013-04-11 19:40:58.528798
433	168	Good 3 was clicked. Value is now: true	2013-04-11 19:40:58.975529	2013-04-11 19:40:58.975529
434	168	Good 4 was clicked. Value is now: true	2013-04-11 19:40:59.855608	2013-04-11 19:40:59.855608
435	168	Menu item was shown: bundle 3,4,5	2013-04-11 19:41:01.004457	2013-04-11 19:41:01.004457
436	138	Menu item was shown: bundle 1,2,3	2013-04-11 19:41:02.366715	2013-04-11 19:41:02.366715
437	138	Combo was clicked. Value is now: true	2013-04-11 19:41:05.63133	2013-04-11 19:41:05.63133
438	168	Menu item was shown: bundle 2,4,5	2013-04-11 19:41:06.5799	2013-04-11 19:41:06.5799
439	138	Menu item was shown: bundle 1,2	2013-04-11 19:41:06.721344	2013-04-11 19:41:06.721344
440	151	Combo was clicked. Value is now: true	2013-04-11 19:41:07.641584	2013-04-11 19:41:07.641584
441	138	Menu item was shown: bundle 1,3	2013-04-11 19:41:08.778928	2013-04-11 19:41:08.778928
442	151	Menu item was shown: bundle 1,2	2013-04-11 19:41:09.133645	2013-04-11 19:41:09.133645
443	138	Menu item was shown: bundle 2,3	2013-04-11 19:41:09.663141	2013-04-11 19:41:09.663141
444	151	Menu item was shown: bundle 1,3	2013-04-11 19:41:10.308903	2013-04-11 19:41:10.308903
445	151	Menu item was shown: bundle 2,3	2013-04-11 19:41:11.090051	2013-04-11 19:41:11.090051
446	138	Menu item was shown: bundle 1,2,3	2013-04-11 19:41:11.980594	2013-04-11 19:41:11.980594
447	151	Menu item was shown: bundle 1,2,3	2013-04-11 19:41:12.202501	2013-04-11 19:41:12.202501
448	151	Combo was clicked. Value is now: false	2013-04-11 19:41:15.932262	2013-04-11 19:41:15.932262
449	151	Good 1 was clicked. Value is now: true	2013-04-11 19:41:16.804576	2013-04-11 19:41:16.804576
450	151	Good 2 was clicked. Value is now: true	2013-04-11 19:41:17.083973	2013-04-11 19:41:17.083973
451	151	Good 3 was clicked. Value is now: true	2013-04-11 19:41:17.547465	2013-04-11 19:41:17.547465
452	151	Menu item was shown: bundle 1,2	2013-04-11 19:41:19.09437	2013-04-11 19:41:19.09437
453	168	Menu item was shown: bundle 2,3,5	2013-04-11 19:41:19.264895	2013-04-11 19:41:19.264895
454	151	Menu item was shown: bundle 1,3	2013-04-11 19:41:19.705883	2013-04-11 19:41:19.705883
455	168	Menu item was shown: bundle 2,3,4	2013-04-11 19:41:19.981512	2013-04-11 19:41:19.981512
456	151	Menu item was shown: bundle 1,2,3	2013-04-11 19:41:20.221748	2013-04-11 19:41:20.221748
457	168	Menu item was shown: bundle 1,4,5	2013-04-11 19:41:25.838677	2013-04-11 19:41:25.838677
458	168	Menu item was shown: bundle 1,3,5	2013-04-11 19:41:26.980989	2013-04-11 19:41:26.980989
459	168	Menu item was shown: bundle 1,3,4	2013-04-11 19:41:33.375062	2013-04-11 19:41:33.375062
460	168	Menu item was shown: bundle 1,2,5	2013-04-11 19:41:35.035779	2013-04-11 19:41:35.035779
461	168	Menu item was shown: bundle 1,2,4	2013-04-11 19:41:40.128312	2013-04-11 19:41:40.128312
462	168	Menu item was shown: bundle 1,2,3	2013-04-11 19:41:46.448542	2013-04-11 19:41:46.448542
463	168	Menu item was shown: bundle 4,5	2013-04-11 19:41:48.923412	2013-04-11 19:41:48.923412
464	168	Menu item was shown: bundle 3,5	2013-04-11 19:41:51.349234	2013-04-11 19:41:51.349234
465	168	Menu item was shown: bundle 3,4	2013-04-11 19:41:55.064858	2013-04-11 19:41:55.064858
466	168	Menu item was shown: bundle 2,5	2013-04-11 19:41:55.836379	2013-04-11 19:41:55.836379
467	168	Menu item was shown: bundle 2,4	2013-04-11 19:41:56.88382	2013-04-11 19:41:56.88382
468	168	Menu item was shown: bundle 2,3	2013-04-11 19:41:59.813167	2013-04-11 19:41:59.813167
469	168	Menu item was shown: bundle 1,5	2013-04-11 19:42:02.296586	2013-04-11 19:42:02.296586
470	168	Menu item was shown: bundle 1,4	2013-04-11 19:42:06.110995	2013-04-11 19:42:06.110995
471	168	Menu item was shown: bundle 1,3	2013-04-11 19:42:09.134601	2013-04-11 19:42:09.134601
472	168	Menu item was shown: bundle 1,2	2013-04-11 19:42:13.364148	2013-04-11 19:42:13.364148
473	165	Menu item was shown: bundle 1,3	2013-04-11 19:43:55.400338	2013-04-11 19:43:55.400338
474	165	Menu item was shown: bundle 1,2,3	2013-04-11 19:43:57.978212	2013-04-11 19:43:57.978212
475	165	Menu item was shown: bundle 2,3	2013-04-11 19:44:01.060711	2013-04-11 19:44:01.060711
476	165	Menu item was shown: bundle 1,2	2013-04-11 19:44:02.239898	2013-04-11 19:44:02.239898
477	165	Menu item was shown: bundle 1,3	2013-04-11 19:44:06.168811	2013-04-11 19:44:06.168811
478	165	Good 1 was clicked. Value is now: true	2013-04-11 19:44:11.150937	2013-04-11 19:44:11.150937
479	165	Good 3 was clicked. Value is now: true	2013-04-11 19:44:11.853479	2013-04-11 19:44:11.853479
480	165	Menu item was hidden: bundle 1,3	2013-04-11 19:44:29.030846	2013-04-11 19:44:29.030846
481	165	Menu item was shown: bundle 1,2,3	2013-04-11 19:44:35.325503	2013-04-11 19:44:35.325503
482	165	Menu item was shown: bundle 2,3	2013-04-11 19:44:37.373384	2013-04-11 19:44:37.373384
483	134	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:45:23.71914	2013-04-11 19:45:23.71914
484	134	Combo was clicked. Value is now: true	2013-04-11 19:45:26.549847	2013-04-11 19:45:26.549847
485	134	Menu item was shown: bundle 1,2	2013-04-11 19:45:27.664341	2013-04-11 19:45:27.664341
486	146	Menu item was shown: bundle 1,2	2013-04-11 19:45:30.921926	2013-04-11 19:45:30.921926
487	134	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:45:31.36663	2013-04-11 19:45:31.36663
488	146	Menu item was shown: bundle 1,3	2013-04-11 19:45:31.825844	2013-04-11 19:45:31.825844
489	146	Menu item was shown: bundle 2,3	2013-04-11 19:45:33.380225	2013-04-11 19:45:33.380225
490	134	Menu item was shown: bundle 1,4	2013-04-11 19:45:33.795559	2013-04-11 19:45:33.795559
491	134	Menu item was shown: bundle 2,3	2013-04-11 19:45:34.181094	2013-04-11 19:45:34.181094
492	134	Menu item was shown: bundle 2,4	2013-04-11 19:45:34.592142	2013-04-11 19:45:34.592142
493	134	Menu item was shown: bundle 3,4	2013-04-11 19:45:35.01388	2013-04-11 19:45:35.01388
494	134	Menu item was shown: bundle 1,2,3	2013-04-11 19:45:35.38954	2013-04-11 19:45:35.38954
495	134	Menu item was shown: bundle 1,2,4	2013-04-11 19:45:35.830034	2013-04-11 19:45:35.830034
496	134	Menu item was shown: bundle 1,3,4	2013-04-11 19:45:36.285721	2013-04-11 19:45:36.285721
497	146	Menu item was shown: bundle 1,3	2013-04-11 19:45:36.693209	2013-04-11 19:45:36.693209
498	134	Menu item was shown: bundle 2,3,4	2013-04-11 19:45:36.752272	2013-04-11 19:45:36.752272
499	134	Menu item was shown: bundle 1,3	2013-04-11 19:45:37.821854	2013-04-11 19:45:37.821854
500	146	Menu item was shown: bundle 1,2,3	2013-04-11 19:45:38.841621	2013-04-11 19:45:38.841621
501	146	Good 1 was clicked. Value is now: true	2013-04-11 19:45:40.927192	2013-04-11 19:45:40.927192
502	146	Good 3 was clicked. Value is now: true	2013-04-11 19:45:41.785144	2013-04-11 19:45:41.785144
503	146	Menu item was shown: bundle 1,3	2013-04-11 19:45:42.352299	2013-04-11 19:45:42.352299
504	146	Menu item was shown: bundle 1,2,3	2013-04-11 19:45:43.189592	2013-04-11 19:45:43.189592
505	169	Menu item was shown: bundle 2,5	2013-04-11 19:48:01.549705	2013-04-11 19:48:01.549705
506	169	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:48:08.401123	2013-04-11 19:48:08.401123
507	169	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:48:12.451275	2013-04-11 19:48:12.451275
508	169	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:48:13.701711	2013-04-11 19:48:13.701711
509	169	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:48:15.116482	2013-04-11 19:48:15.116482
510	169	Good 1 was clicked. Value is now: true	2013-04-11 19:48:27.846856	2013-04-11 19:48:27.846856
511	169	Good 2 was clicked. Value is now: true	2013-04-11 19:48:28.198121	2013-04-11 19:48:28.198121
512	169	Good 4 was clicked. Value is now: true	2013-04-11 19:48:29.017957	2013-04-11 19:48:29.017957
513	169	Good 5 was clicked. Value is now: true	2013-04-11 19:48:29.371768	2013-04-11 19:48:29.371768
514	169	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:48:31.089777	2013-04-11 19:48:31.089777
515	169	Good 3 was clicked. Value is now: true	2013-04-11 19:48:43.877812	2013-04-11 19:48:43.877812
516	169	Good 4 was clicked. Value is now: false	2013-04-11 19:48:44.075571	2013-04-11 19:48:44.075571
517	169	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:48:46.610052	2013-04-11 19:48:46.610052
518	169	Menu item was shown: bundle 3,4,5	2013-04-11 19:48:47.987227	2013-04-11 19:48:47.987227
519	169	Menu item was shown: bundle 2,4,5	2013-04-11 19:48:49.766962	2013-04-11 19:48:49.766962
520	169	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:48:53.690605	2013-04-11 19:48:53.690605
521	169	Menu item was shown: bundle 2,4,5	2013-04-11 19:49:17.594001	2013-04-11 19:49:17.594001
522	169	Menu item was shown: bundle 2,3,5	2013-04-11 19:49:18.325002	2013-04-11 19:49:18.325002
523	169	Menu item was shown: bundle 2,3,4	2013-04-11 19:49:25.793901	2013-04-11 19:49:25.793901
524	169	Menu item was shown: bundle 1,4,5	2013-04-11 19:49:26.660254	2013-04-11 19:49:26.660254
525	169	Menu item was shown: bundle 1,3,5	2013-04-11 19:49:28.089795	2013-04-11 19:49:28.089795
526	169	Menu item was shown: bundle 1,3,4	2013-04-11 19:49:28.819822	2013-04-11 19:49:28.819822
527	169	Menu item was shown: bundle 1,2,5	2013-04-11 19:49:36.630188	2013-04-11 19:49:36.630188
528	169	Menu item was shown: bundle 1,2,4	2013-04-11 19:49:37.456712	2013-04-11 19:49:37.456712
529	135	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:49:39.645965	2013-04-11 19:49:39.645965
530	135	Combo was clicked. Value is now: true	2013-04-11 19:49:41.530059	2013-04-11 19:49:41.530059
531	169	Menu item was shown: bundle 4,5	2013-04-11 19:49:42.730354	2013-04-11 19:49:42.730354
532	169	Menu item was shown: bundle 1,2,3	2013-04-11 19:49:43.527768	2013-04-11 19:49:43.527768
533	135	Menu item was shown: bundle 2,3,4	2013-04-11 19:49:44.47362	2013-04-11 19:49:44.47362
534	169	Menu item was shown: bundle 3,5	2013-04-11 19:49:44.530304	2013-04-11 19:49:44.530304
535	148	Combo was clicked. Value is now: true	2013-04-11 19:49:44.642048	2013-04-11 19:49:44.642048
536	169	Menu item was shown: bundle 3,4	2013-04-11 19:49:45.085126	2013-04-11 19:49:45.085126
537	169	Menu item was shown: bundle 2,5	2013-04-11 19:49:45.692252	2013-04-11 19:49:45.692252
538	148	Menu item was shown: bundle 1,2	2013-04-11 19:49:46.061634	2013-04-11 19:49:46.061634
539	135	Menu item was shown: bundle 1,3,4	2013-04-11 19:49:46.736895	2013-04-11 19:49:46.736895
540	169	Menu item was shown: bundle 2,4	2013-04-11 19:49:48.8331	2013-04-11 19:49:48.8331
541	135	Menu item was shown: bundle 1,2,4	2013-04-11 19:49:48.875233	2013-04-11 19:49:48.875233
542	135	Menu item was shown: bundle 2,4	2013-04-11 19:49:51.623499	2013-04-11 19:49:51.623499
543	148	Combo was clicked. Value is now: false	2013-04-11 19:49:51.743475	2013-04-11 19:49:51.743475
544	169	Menu item was shown: bundle 2,3	2013-04-11 19:49:52.620322	2013-04-11 19:49:52.620322
545	148	Good 1 was clicked. Value is now: true	2013-04-11 19:49:52.725693	2013-04-11 19:49:52.725693
546	135	Menu item was shown: bundle 3,4	2013-04-11 19:49:52.936182	2013-04-11 19:49:52.936182
547	148	Good 2 was clicked. Value is now: true	2013-04-11 19:49:53.253821	2013-04-11 19:49:53.253821
548	148	Menu item was shown: bundle 1,3	2013-04-11 19:49:53.89391	2013-04-11 19:49:53.89391
549	169	Menu item was shown: bundle 1,5	2013-04-11 19:49:55.693588	2013-04-11 19:49:55.693588
550	135	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:49:56.294851	2013-04-11 19:49:56.294851
551	169	Menu item was shown: bundle 1,4	2013-04-11 19:49:56.945611	2013-04-11 19:49:56.945611
552	169	Menu item was shown: bundle 1,3	2013-04-11 19:49:57.915059	2013-04-11 19:49:57.915059
553	169	Menu item was shown: bundle 1,2	2013-04-11 19:49:58.790752	2013-04-11 19:49:58.790752
554	148	Menu item was shown: bundle 1,4	2013-04-11 19:49:59.406199	2013-04-11 19:49:59.406199
555	148	Menu item was shown: bundle 2,3	2013-04-11 19:50:00.782432	2013-04-11 19:50:00.782432
556	135	Menu item was shown: bundle 1,2	2013-04-11 19:50:02.437648	2013-04-11 19:50:02.437648
557	169	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:50:02.533789	2013-04-11 19:50:02.533789
558	148	Menu item was shown: bundle 2,4	2013-04-11 19:50:03.128202	2013-04-11 19:50:03.128202
559	135	Menu item was shown: bundle 1,3	2013-04-11 19:50:04.053053	2013-04-11 19:50:04.053053
560	148	Menu item was shown: bundle 3,4	2013-04-11 19:50:04.221333	2013-04-11 19:50:04.221333
561	135	Menu item was shown: bundle 1,4	2013-04-11 19:50:04.655936	2013-04-11 19:50:04.655936
562	148	Menu item was shown: bundle 1,2,3	2013-04-11 19:50:04.863025	2013-04-11 19:50:04.863025
563	135	Menu item was shown: bundle 1,3	2013-04-11 19:50:05.914862	2013-04-11 19:50:05.914862
564	135	Menu item was shown: bundle 1,4	2013-04-11 19:50:08.202784	2013-04-11 19:50:08.202784
565	135	Menu item was shown: bundle 2,3	2013-04-11 19:50:09.039519	2013-04-11 19:50:09.039519
566	148	Good 2 was clicked. Value is now: false	2013-04-11 19:50:10.11615	2013-04-11 19:50:10.11615
567	148	Good 2 was clicked. Value is now: true	2013-04-11 19:50:10.614968	2013-04-11 19:50:10.614968
568	148	Good 4 was clicked. Value is now: true	2013-04-11 19:50:10.866993	2013-04-11 19:50:10.866993
569	148	Good 3 was clicked. Value is now: true	2013-04-11 19:50:11.449964	2013-04-11 19:50:11.449964
570	148	Good 4 was clicked. Value is now: false	2013-04-11 19:50:11.758519	2013-04-11 19:50:11.758519
571	148	Menu item was shown: bundle 1,2,4	2013-04-11 19:50:12.75316	2013-04-11 19:50:12.75316
572	135	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:50:14.621049	2013-04-11 19:50:14.621049
573	135	Menu item was shown: bundle 2,3	2013-04-11 19:50:16.878287	2013-04-11 19:50:16.878287
574	148	Menu item was shown: bundle 1,3,4	2013-04-11 19:50:17.610346	2013-04-11 19:50:17.610346
575	148	Menu item was shown: bundle 1,2,3	2013-04-11 19:50:18.67969	2013-04-11 19:50:18.67969
576	135	Menu item was shown: bundle 2,4	2013-04-11 19:50:19.817983	2013-04-11 19:50:19.817983
577	135	Menu item was shown: bundle 3,4	2013-04-11 19:50:22.109336	2013-04-11 19:50:22.109336
578	148	Menu item was shown: bundle 2,3,4	2013-04-11 19:50:22.821844	2013-04-11 19:50:22.821844
579	135	Menu item was shown: bundle 1,2,3	2013-04-11 19:50:23.146643	2013-04-11 19:50:23.146643
580	135	Menu item was shown: bundle 1,2,4	2013-04-11 19:50:23.84937	2013-04-11 19:50:23.84937
581	135	Menu item was shown: bundle 1,3,4	2013-04-11 19:50:24.608338	2013-04-11 19:50:24.608338
582	135	Menu item was shown: bundle 2,3,4	2013-04-11 19:50:25.382698	2013-04-11 19:50:25.382698
583	148	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:50:25.78042	2013-04-11 19:50:25.78042
584	162	Menu item was shown: bundle 3,5	2013-04-11 19:52:12.351041	2013-04-11 19:52:12.351041
585	162	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:52:15.760795	2013-04-11 19:52:15.760795
586	162	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:52:23.556403	2013-04-11 19:52:23.556403
587	162	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:52:33.73155	2013-04-11 19:52:33.73155
588	162	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:52:35.029912	2013-04-11 19:52:35.029912
589	162	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:52:35.95447	2013-04-11 19:52:35.95447
590	162	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:52:37.255132	2013-04-11 19:52:37.255132
591	162	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:52:38.575928	2013-04-11 19:52:38.575928
592	162	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:52:39.694221	2013-04-11 19:52:39.694221
593	162	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:52:40.640539	2013-04-11 19:52:40.640539
594	162	Menu item was shown: bundle 3,4,5	2013-04-11 19:52:46.805992	2013-04-11 19:52:46.805992
595	162	Menu item was shown: bundle 2,4,5	2013-04-11 19:52:48.235348	2013-04-11 19:52:48.235348
596	162	Menu item was shown: bundle 2,3,5	2013-04-11 19:52:49.084329	2013-04-11 19:52:49.084329
597	162	Menu item was shown: bundle 2,3,4	2013-04-11 19:52:59.780227	2013-04-11 19:52:59.780227
598	162	Menu item was shown: bundle 1,4,5	2013-04-11 19:53:00.720603	2013-04-11 19:53:00.720603
599	162	Menu item was shown: bundle 1,3,5	2013-04-11 19:53:01.364132	2013-04-11 19:53:01.364132
600	162	Menu item was shown: bundle 1,3,4	2013-04-11 19:53:02.207204	2013-04-11 19:53:02.207204
601	162	Menu item was shown: bundle 1,2,5	2013-04-11 19:53:02.893248	2013-04-11 19:53:02.893248
602	162	Menu item was shown: bundle 1,2,4	2013-04-11 19:53:08.63906	2013-04-11 19:53:08.63906
603	162	Menu item was shown: bundle 1,2,3	2013-04-11 19:53:09.535497	2013-04-11 19:53:09.535497
604	162	Menu item was shown: bundle 4,5	2013-04-11 19:53:10.466654	2013-04-11 19:53:10.466654
605	162	Menu item was shown: bundle 3,5	2013-04-11 19:53:11.6235	2013-04-11 19:53:11.6235
606	162	Menu item was shown: bundle 3,4	2013-04-11 19:53:12.598835	2013-04-11 19:53:12.598835
607	162	Menu item was shown: bundle 2,5	2013-04-11 19:53:13.21302	2013-04-11 19:53:13.21302
608	162	Menu item was shown: bundle 2,4	2013-04-11 19:53:13.728499	2013-04-11 19:53:13.728499
609	162	Menu item was shown: bundle 2,3	2013-04-11 19:53:14.311403	2013-04-11 19:53:14.311403
610	162	Menu item was shown: bundle 1,5	2013-04-11 19:53:15.221529	2013-04-11 19:53:15.221529
611	162	Menu item was shown: bundle 1,2	2013-04-11 19:53:17.248887	2013-04-11 19:53:17.248887
612	162	Menu item was shown: bundle 1,3	2013-04-11 19:53:19.1725	2013-04-11 19:53:19.1725
613	162	Menu item was shown: bundle 1,4	2013-04-11 19:53:19.96566	2013-04-11 19:53:19.96566
614	162	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:53:26.129212	2013-04-11 19:53:26.129212
615	162	Good 5 was clicked. Value is now: true	2013-04-11 19:53:28.277367	2013-04-11 19:53:28.277367
616	162	Good 4 was clicked. Value is now: true	2013-04-11 19:53:29.753492	2013-04-11 19:53:29.753492
617	162	Good 3 was clicked. Value is now: true	2013-04-11 19:53:30.951284	2013-04-11 19:53:30.951284
618	162	Good 2 was clicked. Value is now: true	2013-04-11 19:53:31.486366	2013-04-11 19:53:31.486366
619	150	Menu item was shown: bundle 1,2	2013-04-11 19:54:01.96481	2013-04-11 19:54:01.96481
620	150	Menu item was shown: bundle 1,3	2013-04-11 19:54:03.297247	2013-04-11 19:54:03.297247
621	141	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:54:03.384892	2013-04-11 19:54:03.384892
622	141	Combo was clicked. Value is now: true	2013-04-11 19:54:05.005839	2013-04-11 19:54:05.005839
623	141	Menu item was shown: bundle 1,2	2013-04-11 19:54:08.725443	2013-04-11 19:54:08.725443
624	141	Menu item was shown: bundle 1,3	2013-04-11 19:54:11.115632	2013-04-11 19:54:11.115632
625	141	Menu item was shown: bundle 1,4	2013-04-11 19:54:11.917064	2013-04-11 19:54:11.917064
626	150	Good 1 was clicked. Value is now: true	2013-04-11 19:54:12.336233	2013-04-11 19:54:12.336233
627	141	Menu item was shown: bundle 2,3	2013-04-11 19:54:12.712177	2013-04-11 19:54:12.712177
628	150	Good 3 was clicked. Value is now: true	2013-04-11 19:54:12.810745	2013-04-11 19:54:12.810745
629	150	Menu item was shown: bundle 1,4	2013-04-11 19:54:14.161333	2013-04-11 19:54:14.161333
630	141	Menu item was shown: bundle 2,4	2013-04-11 19:54:15.3693	2013-04-11 19:54:15.3693
631	141	Menu item was shown: bundle 3,4	2013-04-11 19:54:16.97714	2013-04-11 19:54:16.97714
632	141	Menu item was shown: bundle 1,2,3	2013-04-11 19:54:19.044516	2013-04-11 19:54:19.044516
633	150	Menu item was shown: bundle 1,5	2013-04-11 19:54:19.652636	2013-04-11 19:54:19.652636
634	141	Menu item was shown: bundle 1,2,4	2013-04-11 19:54:19.96232	2013-04-11 19:54:19.96232
635	150	Menu item was shown: bundle 2,3	2013-04-11 19:54:21.855868	2013-04-11 19:54:21.855868
636	141	Menu item was shown: bundle 1,3,4	2013-04-11 19:54:22.078719	2013-04-11 19:54:22.078719
637	150	Menu item was shown: bundle 2,4	2013-04-11 19:54:22.688538	2013-04-11 19:54:22.688538
638	141	Menu item was shown: bundle 2,3,4	2013-04-11 19:54:22.837142	2013-04-11 19:54:22.837142
639	150	Menu item was shown: bundle 2,5	2013-04-11 19:54:25.841716	2013-04-11 19:54:25.841716
640	141	Menu item was shown: bundle 1,2,3	2013-04-11 19:54:26.065492	2013-04-11 19:54:26.065492
641	150	Menu item was shown: bundle 3,4	2013-04-11 19:54:26.715876	2013-04-11 19:54:26.715876
642	150	Menu item was shown: bundle 3,5	2013-04-11 19:54:32.367615	2013-04-11 19:54:32.367615
643	150	Menu item was shown: bundle 4,5	2013-04-11 19:54:33.844132	2013-04-11 19:54:33.844132
644	150	Menu item was shown: bundle 1,2,3	2013-04-11 19:54:35.607316	2013-04-11 19:54:35.607316
645	150	Menu item was shown: bundle 1,2,4	2013-04-11 19:54:36.920518	2013-04-11 19:54:36.920518
646	150	Menu item was shown: bundle 1,2,5	2013-04-11 19:54:43.116925	2013-04-11 19:54:43.116925
647	150	Menu item was shown: bundle 1,3,4	2013-04-11 19:54:49.626341	2013-04-11 19:54:49.626341
648	150	Menu item was shown: bundle 1,3,5	2013-04-11 19:54:50.224473	2013-04-11 19:54:50.224473
649	150	Menu item was shown: bundle 1,4,5	2013-04-11 19:55:01.067403	2013-04-11 19:55:01.067403
650	150	Menu item was shown: bundle 2,3,4	2013-04-11 19:55:02.560141	2013-04-11 19:55:02.560141
651	150	Menu item was shown: bundle 2,3,5	2013-04-11 19:55:03.876116	2013-04-11 19:55:03.876116
652	150	Menu item was shown: bundle 2,4,5	2013-04-11 19:55:11.140407	2013-04-11 19:55:11.140407
653	150	Menu item was shown: bundle 3,4,5	2013-04-11 19:55:19.722971	2013-04-11 19:55:19.722971
654	150	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:55:21.608496	2013-04-11 19:55:21.608496
655	150	Good 4 was clicked. Value is now: true	2013-04-11 19:55:34.139277	2013-04-11 19:55:34.139277
656	150	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:55:35.424805	2013-04-11 19:55:35.424805
657	150	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:55:39.793439	2013-04-11 19:55:39.793439
658	150	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:55:46.367562	2013-04-11 19:55:46.367562
659	150	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:55:47.432154	2013-04-11 19:55:47.432154
660	150	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:55:48.653692	2013-04-11 19:55:48.653692
661	150	Good 5 was clicked. Value is now: true	2013-04-11 19:55:54.193541	2013-04-11 19:55:54.193541
662	150	Good 2 was clicked. Value is now: true	2013-04-11 19:55:55.435491	2013-04-11 19:55:55.435491
663	160	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:56:13.325632	2013-04-11 19:56:13.325632
664	160	Menu item was shown: bundle 2,3,4	2013-04-11 19:56:17.936908	2013-04-11 19:56:17.936908
665	160	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:56:22.215284	2013-04-11 19:56:22.215284
666	160	Menu item was shown: bundle 1,3,4	2013-04-11 19:56:23.387523	2013-04-11 19:56:23.387523
667	160	Menu item was shown: bundle 1,2,4	2013-04-11 19:56:25.61644	2013-04-11 19:56:25.61644
668	160	Menu item was shown: bundle 1,2,3	2013-04-11 19:56:28.09159	2013-04-11 19:56:28.09159
669	160	Menu item was shown: bundle 1,3	2013-04-11 19:56:30.532164	2013-04-11 19:56:30.532164
670	160	Menu item was shown: bundle 1,2	2013-04-11 19:56:36.277703	2013-04-11 19:56:36.277703
671	160	Menu item was shown: bundle 2,4	2013-04-11 19:56:40.115048	2013-04-11 19:56:40.115048
672	160	Menu item was shown: bundle 3,4	2013-04-11 19:56:42.657005	2013-04-11 19:56:42.657005
673	160	Menu item was shown: bundle 1,4	2013-04-11 19:56:45.868711	2013-04-11 19:56:45.868711
674	160	Menu item was shown: bundle 3,4	2013-04-11 19:56:48.785955	2013-04-11 19:56:48.785955
675	160	Menu item was shown: bundle 2,4	2013-04-11 19:56:49.977049	2013-04-11 19:56:49.977049
676	160	Menu item was shown: bundle 2,3	2013-04-11 19:56:51.350526	2013-04-11 19:56:51.350526
677	160	Menu item was shown: bundle 1,4	2013-04-11 19:56:52.285065	2013-04-11 19:56:52.285065
678	160	Menu item was shown: bundle 1,3	2013-04-11 19:56:53.490885	2013-04-11 19:56:53.490885
679	160	Menu item was shown: bundle 1,2	2013-04-11 19:56:54.065307	2013-04-11 19:56:54.065307
680	160	Combo was clicked. Value is now: true	2013-04-11 19:56:58.263645	2013-04-11 19:56:58.263645
681	154	Combo was clicked. Value is now: true	2013-04-11 19:58:15.310332	2013-04-11 19:58:15.310332
682	154	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:58:19.139244	2013-04-11 19:58:19.139244
683	154	Combo was clicked. Value is now: false	2013-04-11 19:58:21.661847	2013-04-11 19:58:21.661847
684	154	Good 1 was clicked. Value is now: true	2013-04-11 19:58:22.390165	2013-04-11 19:58:22.390165
685	154	Good 2 was clicked. Value is now: true	2013-04-11 19:58:22.676999	2013-04-11 19:58:22.676999
686	154	Good 3 was clicked. Value is now: true	2013-04-11 19:58:22.957683	2013-04-11 19:58:22.957683
687	154	Good 4 was clicked. Value is now: true	2013-04-11 19:58:23.224232	2013-04-11 19:58:23.224232
688	136	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 19:58:23.296283	2013-04-11 19:58:23.296283
689	136	Menu item was shown: bundle 1,2	2013-04-11 19:58:27.400084	2013-04-11 19:58:27.400084
690	154	Menu item was shown: bundle 2,3,4	2013-04-11 19:58:27.596565	2013-04-11 19:58:27.596565
691	136	Menu item was shown: bundle 1,3	2013-04-11 19:58:31.849382	2013-04-11 19:58:31.849382
692	154	Menu item was shown: bundle 1,3,4	2013-04-11 19:58:33.509586	2013-04-11 19:58:33.509586
693	154	Menu item was shown: bundle 1,2,4	2013-04-11 19:58:34.743939	2013-04-11 19:58:34.743939
694	136	Menu item was shown: bundle 1,4	2013-04-11 19:58:35.247585	2013-04-11 19:58:35.247585
695	154	Menu item was shown: bundle 1,2,3	2013-04-11 19:58:38.926441	2013-04-11 19:58:38.926441
696	136	Good 2 was clicked. Value is now: true	2013-04-11 19:58:38.949059	2013-04-11 19:58:38.949059
697	136	Good 1 was clicked. Value is now: true	2013-04-11 19:58:39.536739	2013-04-11 19:58:39.536739
698	154	Menu item was shown: bundle 3,4	2013-04-11 19:58:39.908281	2013-04-11 19:58:39.908281
699	136	Menu item was shown: bundle 1,5	2013-04-11 19:58:43.252415	2013-04-11 19:58:43.252415
700	154	Menu item was shown: bundle 2,4	2013-04-11 19:58:48.345706	2013-04-11 19:58:48.345706
701	136	Good 5 was clicked. Value is now: true	2013-04-11 19:58:50.493338	2013-04-11 19:58:50.493338
702	154	Menu item was shown: bundle 2,3	2013-04-11 19:58:50.788492	2013-04-11 19:58:50.788492
703	136	Good 2 was clicked. Value is now: false	2013-04-11 19:58:51.089045	2013-04-11 19:58:51.089045
704	136	Menu item was shown: bundle 2,3	2013-04-11 19:58:54.296509	2013-04-11 19:58:54.296509
705	154	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:58:54.819946	2013-04-11 19:58:54.819946
706	136	Menu item was shown: bundle 2,4	2013-04-11 19:58:57.244357	2013-04-11 19:58:57.244357
707	154	Menu item was shown: bundle 2,3	2013-04-11 19:58:57.549278	2013-04-11 19:58:57.549278
708	154	Menu item was shown: bundle 1,4	2013-04-11 19:59:00.852384	2013-04-11 19:59:00.852384
709	136	Menu item was shown: bundle 2,5	2013-04-11 19:59:01.758185	2013-04-11 19:59:01.758185
710	136	Menu item was shown: bundle 3,4	2013-04-11 19:59:03.092155	2013-04-11 19:59:03.092155
711	154	Menu item was shown: bundle 1,3	2013-04-11 19:59:03.365609	2013-04-11 19:59:03.365609
712	136	Menu item was shown: bundle 3,5	2013-04-11 19:59:03.860473	2013-04-11 19:59:03.860473
713	136	Menu item was shown: bundle 4,5	2013-04-11 19:59:04.619521	2013-04-11 19:59:04.619521
714	154	Menu item was shown: bundle 1,2	2013-04-11 19:59:05.042802	2013-04-11 19:59:05.042802
715	136	Menu item was shown: bundle 1,2,3	2013-04-11 19:59:05.668238	2013-04-11 19:59:05.668238
716	136	Menu item was shown: bundle 1,2,4	2013-04-11 19:59:07.678046	2013-04-11 19:59:07.678046
717	136	Menu item was shown: bundle 1,2,5	2013-04-11 19:59:08.299289	2013-04-11 19:59:08.299289
718	136	Good 2 was clicked. Value is now: true	2013-04-11 19:59:16.55353	2013-04-11 19:59:16.55353
719	136	Menu item was shown: bundle 1,3,4	2013-04-11 19:59:18.103754	2013-04-11 19:59:18.103754
720	136	Menu item was shown: bundle 1,3,5	2013-04-11 19:59:26.654124	2013-04-11 19:59:26.654124
721	136	Menu item was shown: bundle 1,4,5	2013-04-11 19:59:27.749974	2013-04-11 19:59:27.749974
722	136	Menu item was shown: bundle 1,3,5	2013-04-11 19:59:28.742932	2013-04-11 19:59:28.742932
723	136	Menu item was shown: bundle 1,4,5	2013-04-11 19:59:35.660352	2013-04-11 19:59:35.660352
724	136	Menu item was shown: bundle 2,3,4	2013-04-11 19:59:36.638199	2013-04-11 19:59:36.638199
725	136	Menu item was shown: bundle 2,3,5	2013-04-11 19:59:37.422754	2013-04-11 19:59:37.422754
726	136	Menu item was shown: bundle 2,4,5	2013-04-11 19:59:44.877978	2013-04-11 19:59:44.877978
727	136	Menu item was shown: bundle 3,4,5	2013-04-11 19:59:45.893132	2013-04-11 19:59:45.893132
728	136	Menu item was shown: bundle 1,2,3,4	2013-04-11 19:59:46.781955	2013-04-11 19:59:46.781955
729	136	Menu item was shown: bundle 1,2,3,5	2013-04-11 19:59:47.485266	2013-04-11 19:59:47.485266
730	136	Menu item was shown: bundle 1,2,4,5	2013-04-11 19:59:49.838393	2013-04-11 19:59:49.838393
731	136	Menu item was shown: bundle 1,3,4,5	2013-04-11 19:59:50.972588	2013-04-11 19:59:50.972588
732	136	Menu item was shown: bundle 2,3,4,5	2013-04-11 19:59:52.28574	2013-04-11 19:59:52.28574
733	136	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:00:00.340507	2013-04-11 20:00:00.340507
734	136	Menu item was shown: bundle 1,2,5	2013-04-11 20:00:04.272163	2013-04-11 20:00:04.272163
735	161	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:00:12.047398	2013-04-11 20:00:12.047398
736	161	Menu item was shown: bundle 2,3,4	2013-04-11 20:00:15.452268	2013-04-11 20:00:15.452268
737	161	Menu item was shown: bundle 1,3,4	2013-04-11 20:00:17.34297	2013-04-11 20:00:17.34297
738	161	Menu item was shown: bundle 1,2,4	2013-04-11 20:00:23.986333	2013-04-11 20:00:23.986333
739	161	Menu item was shown: bundle 1,2,3	2013-04-11 20:00:26.67618	2013-04-11 20:00:26.67618
740	161	Menu item was shown: bundle 3,4	2013-04-11 20:00:28.666477	2013-04-11 20:00:28.666477
741	161	Menu item was shown: bundle 1,3	2013-04-11 20:00:32.754593	2013-04-11 20:00:32.754593
742	161	Menu item was shown: bundle 2,4	2013-04-11 20:00:34.569866	2013-04-11 20:00:34.569866
743	161	Menu item was shown: bundle 2,3	2013-04-11 20:00:37.86628	2013-04-11 20:00:37.86628
744	161	Menu item was shown: bundle 1,2	2013-04-11 20:00:40.287514	2013-04-11 20:00:40.287514
745	161	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:00:44.569619	2013-04-11 20:00:44.569619
746	161	Combo was clicked. Value is now: true	2013-04-11 20:00:51.411088	2013-04-11 20:00:51.411088
747	156	Combo was clicked. Value is now: true	2013-04-11 20:02:34.316269	2013-04-11 20:02:34.316269
748	156	Menu item was shown: bundle 1,2	2013-04-11 20:02:36.96455	2013-04-11 20:02:36.96455
749	156	Menu item was shown: bundle 1,3	2013-04-11 20:02:37.716546	2013-04-11 20:02:37.716546
750	137	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:02:39.49969	2013-04-11 20:02:39.49969
751	137	Combo was clicked. Value is now: true	2013-04-11 20:02:41.196955	2013-04-11 20:02:41.196955
752	156	Menu item was shown: bundle 1,4	2013-04-11 20:02:42.108461	2013-04-11 20:02:42.108461
753	156	Menu item was shown: bundle 1,5	2013-04-11 20:02:43.341027	2013-04-11 20:02:43.341027
754	156	Menu item was shown: bundle 2,3	2013-04-11 20:02:55.059853	2013-04-11 20:02:55.059853
755	156	Menu item was shown: bundle 2,4	2013-04-11 20:02:57.293886	2013-04-11 20:02:57.293886
756	156	Menu item was shown: bundle 2,5	2013-04-11 20:02:58.350113	2013-04-11 20:02:58.350113
757	156	Combo was clicked. Value is now: false	2013-04-11 20:03:03.863822	2013-04-11 20:03:03.863822
758	156	Good 2 was clicked. Value is now: true	2013-04-11 20:03:04.508401	2013-04-11 20:03:04.508401
759	156	Good 5 was clicked. Value is now: true	2013-04-11 20:03:05.090209	2013-04-11 20:03:05.090209
760	156	Menu item was shown: bundle 3,4	2013-04-11 20:03:06.58069	2013-04-11 20:03:06.58069
761	156	Menu item was shown: bundle 3,5	2013-04-11 20:03:09.35517	2013-04-11 20:03:09.35517
762	156	Menu item was shown: bundle 2,4,5	2013-04-11 20:03:20.83177	2013-04-11 20:03:20.83177
763	156	Menu item was shown: bundle 3,4,5	2013-04-11 20:03:28.332345	2013-04-11 20:03:28.332345
764	156	Menu item was shown: bundle 2,4,5	2013-04-11 20:03:29.107136	2013-04-11 20:03:29.107136
765	156	Menu item was shown: bundle 2,3,5	2013-04-11 20:03:29.660039	2013-04-11 20:03:29.660039
766	156	Menu item was shown: bundle 2,3,4	2013-04-11 20:03:40.879847	2013-04-11 20:03:40.879847
767	156	Menu item was shown: bundle 2,3,5	2013-04-11 20:03:43.679684	2013-04-11 20:03:43.679684
768	156	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:03:45.266224	2013-04-11 20:03:45.266224
769	156	Menu item was shown: bundle 1,2,3,5	2013-04-11 20:03:50.891274	2013-04-11 20:03:50.891274
770	156	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:04:03.880787	2013-04-11 20:04:03.880787
771	156	Menu item was shown: bundle 1,3,4,5	2013-04-11 20:04:05.247639	2013-04-11 20:04:05.247639
772	156	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:04:07.700433	2013-04-11 20:04:07.700433
773	163	Menu item was shown: bundle 2,3,4	2013-04-11 20:04:09.436488	2013-04-11 20:04:09.436488
774	156	Menu item was shown: bundle 1,3,4,5	2013-04-11 20:04:09.623439	2013-04-11 20:04:09.623439
775	156	Menu item was shown: bundle 2,3,4,5	2013-04-11 20:04:16.783915	2013-04-11 20:04:16.783915
776	156	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:04:17.808708	2013-04-11 20:04:17.808708
777	163	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:04:20.030762	2013-04-11 20:04:20.030762
778	156	Menu item was shown: bundle 2,5	2013-04-11 20:04:20.481611	2013-04-11 20:04:20.481611
779	163	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:04:24.393475	2013-04-11 20:04:24.393475
780	163	Menu item was shown: bundle 2,3,4,5	2013-04-11 20:04:27.180362	2013-04-11 20:04:27.180362
781	163	Menu item was shown: bundle 1,3,4,5	2013-04-11 20:04:28.563518	2013-04-11 20:04:28.563518
782	163	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:04:29.295763	2013-04-11 20:04:29.295763
783	163	Menu item was shown: bundle 1,2,3,5	2013-04-11 20:04:30.321292	2013-04-11 20:04:30.321292
784	156	Menu item was shown: bundle 1,3,4,5	2013-04-11 20:04:30.575079	2013-04-11 20:04:30.575079
785	163	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:04:32.040271	2013-04-11 20:04:32.040271
786	163	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:04:37.960642	2013-04-11 20:04:37.960642
787	163	Menu item was shown: bundle 3,4,5	2013-04-11 20:04:41.625122	2013-04-11 20:04:41.625122
788	156	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:04:42.43253	2013-04-11 20:04:42.43253
789	163	Menu item was shown: bundle 2,4,5	2013-04-11 20:04:42.443834	2013-04-11 20:04:42.443834
790	163	Menu item was shown: bundle 2,3,5	2013-04-11 20:04:43.13901	2013-04-11 20:04:43.13901
791	156	Menu item was shown: bundle 1,2,3,5	2013-04-11 20:04:43.516102	2013-04-11 20:04:43.516102
792	163	Menu item was shown: bundle 2,3,4	2013-04-11 20:04:43.721564	2013-04-11 20:04:43.721564
793	163	Menu item was shown: bundle 1,4,5	2013-04-11 20:04:44.25173	2013-04-11 20:04:44.25173
794	163	Menu item was shown: bundle 1,3,5	2013-04-11 20:04:48.327655	2013-04-11 20:04:48.327655
795	163	Menu item was shown: bundle 1,3,4	2013-04-11 20:04:53.589856	2013-04-11 20:04:53.589856
796	156	Good 3 was clicked. Value is now: true	2013-04-11 20:04:55.368386	2013-04-11 20:04:55.368386
797	156	Good 1 was clicked. Value is now: true	2013-04-11 20:04:55.875004	2013-04-11 20:04:55.875004
798	163	Menu item was shown: bundle 1,2,5	2013-04-11 20:04:59.481802	2013-04-11 20:04:59.481802
799	163	Menu item was shown: bundle 1,2,4	2013-04-11 20:05:06.009923	2013-04-11 20:05:06.009923
800	156	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:05:06.257878	2013-04-11 20:05:06.257878
801	156	Menu item was shown: bundle 1,3,4,5	2013-04-11 20:05:06.701212	2013-04-11 20:05:06.701212
802	156	Menu item was shown: bundle 2,3,4,5	2013-04-11 20:05:07.75329	2013-04-11 20:05:07.75329
803	156	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:05:08.458638	2013-04-11 20:05:08.458638
804	156	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:05:11.10504	2013-04-11 20:05:11.10504
805	156	Menu item was shown: bundle 1,2,3,5	2013-04-11 20:05:11.64329	2013-04-11 20:05:11.64329
806	163	Menu item was shown: bundle 1,2,3	2013-04-11 20:05:12.892456	2013-04-11 20:05:12.892456
807	163	Menu item was shown: bundle 4,5	2013-04-11 20:05:15.183455	2013-04-11 20:05:15.183455
808	163	Menu item was shown: bundle 3,5	2013-04-11 20:05:16.325434	2013-04-11 20:05:16.325434
809	163	Menu item was shown: bundle 3,4	2013-04-11 20:05:18.113047	2013-04-11 20:05:18.113047
810	163	Menu item was shown: bundle 2,5	2013-04-11 20:05:19.196191	2013-04-11 20:05:19.196191
811	163	Menu item was shown: bundle 2,4	2013-04-11 20:05:23.576472	2013-04-11 20:05:23.576472
812	163	Menu item was shown: bundle 2,3	2013-04-11 20:05:28.932435	2013-04-11 20:05:28.932435
813	163	Menu item was shown: bundle 1,5	2013-04-11 20:05:30.823049	2013-04-11 20:05:30.823049
814	163	Menu item was shown: bundle 1,4	2013-04-11 20:05:31.747956	2013-04-11 20:05:31.747956
815	163	Menu item was shown: bundle 1,3	2013-04-11 20:05:33.181865	2013-04-11 20:05:33.181865
816	163	Menu item was shown: bundle 1,2	2013-04-11 20:05:33.999104	2013-04-11 20:05:33.999104
817	163	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:05:36.663175	2013-04-11 20:05:36.663175
818	163	Combo was clicked. Value is now: true	2013-04-11 20:05:41.952826	2013-04-11 20:05:41.952826
819	149	Combo was clicked. Value is now: true	2013-04-11 20:06:48.102552	2013-04-11 20:06:48.102552
820	149	Menu item was shown: bundle 1,2	2013-04-11 20:06:52.239838	2013-04-11 20:06:52.239838
821	149	Menu item was shown: bundle 1,3	2013-04-11 20:06:52.981828	2013-04-11 20:06:52.981828
822	149	Menu item was shown: bundle 1,4	2013-04-11 20:06:56.130372	2013-04-11 20:06:56.130372
823	140	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:06:56.666488	2013-04-11 20:06:56.666488
824	149	Menu item was shown: bundle 1,5	2013-04-11 20:06:58.149011	2013-04-11 20:06:58.149011
825	140	Menu item was shown: bundle 2,3,4	2013-04-11 20:07:00.497453	2013-04-11 20:07:00.497453
826	149	Menu item was shown: bundle 2,5	2013-04-11 20:07:00.522134	2013-04-11 20:07:00.522134
827	140	Menu item was shown: bundle 3,4	2013-04-11 20:07:03.824494	2013-04-11 20:07:03.824494
828	149	Menu item was shown: bundle 1,2,3	2013-04-11 20:07:05.555797	2013-04-11 20:07:05.555797
829	140	Menu item was shown: bundle 2,3,4	2013-04-11 20:07:06.117926	2013-04-11 20:07:06.117926
830	140	Good 3 was clicked. Value is now: true	2013-04-11 20:07:08.758221	2013-04-11 20:07:08.758221
831	140	Good 4 was clicked. Value is now: true	2013-04-11 20:07:09.181035	2013-04-11 20:07:09.181035
832	149	Combo was clicked. Value is now: false	2013-04-11 20:07:09.654488	2013-04-11 20:07:09.654488
833	140	Good 2 was clicked. Value is now: true	2013-04-11 20:07:09.783463	2013-04-11 20:07:09.783463
834	149	Good 1 was clicked. Value is now: true	2013-04-11 20:07:10.917815	2013-04-11 20:07:10.917815
835	149	Good 2 was clicked. Value is now: true	2013-04-11 20:07:11.121188	2013-04-11 20:07:11.121188
836	140	Menu item was shown: bundle 1,2,3,4	2013-04-11 20:07:11.635348	2013-04-11 20:07:11.635348
837	149	Good 3 was clicked. Value is now: true	2013-04-11 20:07:11.660846	2013-04-11 20:07:11.660846
838	140	Menu item was shown: bundle 2,3,4	2013-04-11 20:07:13.120847	2013-04-11 20:07:13.120847
839	149	Menu item was shown: bundle 1,2,4	2013-04-11 20:07:14.52642	2013-04-11 20:07:14.52642
840	140	Menu item was shown: bundle 1,3,4	2013-04-11 20:07:14.726002	2013-04-11 20:07:14.726002
841	140	Menu item was shown: bundle 1,2,4	2013-04-11 20:07:18.945923	2013-04-11 20:07:18.945923
842	149	Menu item was shown: bundle 1,2,5	2013-04-11 20:07:20.589513	2013-04-11 20:07:20.589513
843	140	Menu item was shown: bundle 2,3,4	2013-04-11 20:07:24.53439	2013-04-11 20:07:24.53439
844	149	Good 3 was clicked. Value is now: false	2013-04-11 20:07:25.001762	2013-04-11 20:07:25.001762
845	149	Good 5 was clicked. Value is now: true	2013-04-11 20:07:25.134357	2013-04-11 20:07:25.134357
846	149	Menu item was shown: bundle 1,3,4	2013-04-11 20:07:27.180153	2013-04-11 20:07:27.180153
847	149	Menu item was shown: bundle 1,2,5	2013-04-11 20:07:32.220981	2013-04-11 20:07:32.220981
848	149	Menu item was shown: bundle 1,2,4,5	2013-04-11 20:07:42.466387	2013-04-11 20:07:42.466387
849	149	Menu item was shown: bundle 1,2,3,4,5	2013-04-11 20:07:49.14608	2013-04-11 20:07:49.14608
850	149	Menu item was shown: bundle 2,3,4,5	2013-04-11 20:07:49.967728	2013-04-11 20:07:49.967728
853	534	Menu item was shown: bundle 1,2	2013-06-27 21:09:55.633048	2013-06-27 21:09:55.633048
854	534	Menu item was shown: bundle 1,3	2013-06-27 21:09:57.251917	2013-06-27 21:09:57.251917
855	235	Combo was clicked. Value is now: true	2013-06-27 21:09:58.475947	2013-06-27 21:09:58.475947
856	534	Menu item was shown: bundle 2,3	2013-06-27 21:09:58.749348	2013-06-27 21:09:58.749348
857	534	Menu item was shown: bundle 1,2,3	2013-06-27 21:10:00.804551	2013-06-27 21:10:00.804551
858	534	Combo was clicked. Value is now: true	2013-06-27 21:10:03.233261	2013-06-27 21:10:03.233261
859	729	Menu item was shown: bundle 1,2	2013-06-27 21:10:17.859007	2013-06-27 21:10:17.859007
860	729	Menu item was hidden: bundle 1,2	2013-06-27 21:10:20.475248	2013-06-27 21:10:20.475248
861	729	Menu item was shown: bundle 1,3	2013-06-27 21:10:21.086241	2013-06-27 21:10:21.086241
862	729	Menu item was hidden: bundle 1,3	2013-06-27 21:10:21.715528	2013-06-27 21:10:21.715528
863	729	Menu item was shown: bundle 2,3	2013-06-27 21:10:22.148578	2013-06-27 21:10:22.148578
864	729	Menu item was hidden: bundle 2,3	2013-06-27 21:10:22.66404	2013-06-27 21:10:22.66404
865	729	Menu item was shown: bundle 1,2,3	2013-06-27 21:10:23.286196	2013-06-27 21:10:23.286196
866	729	Menu item was hidden: bundle 1,2,3	2013-06-27 21:10:23.951184	2013-06-27 21:10:23.951184
867	729	Menu item was shown: bundle 2,3	2013-06-27 21:10:24.778977	2013-06-27 21:10:24.778977
868	729	Menu item was hidden: bundle 2,3	2013-06-27 21:10:25.020577	2013-06-27 21:10:25.020577
869	729	Good 2 was clicked. Value is now: true	2013-06-27 21:10:28.471695	2013-06-27 21:10:28.471695
870	729	Good 3 was clicked. Value is now: true	2013-06-27 21:10:28.931446	2013-06-27 21:10:28.931446
871	222	Good 2 was clicked. Value is now: true	2013-06-27 21:10:31.528369	2013-06-27 21:10:31.528369
872	729	Menu item was shown: bundle 2,3	2013-06-27 21:10:31.7114	2013-06-27 21:10:31.7114
873	729	Menu item was shown: bundle 1,3	2013-06-27 21:10:32.305935	2013-06-27 21:10:32.305935
874	729	Menu item was shown: bundle 1,2	2013-06-27 21:10:32.839523	2013-06-27 21:10:32.839523
875	222	Good 3 was clicked. Value is now: true	2013-06-27 21:10:33.575053	2013-06-27 21:10:33.575053
876	729	Menu item was shown: bundle 1,2,3	2013-06-27 21:10:34.216357	2013-06-27 21:10:34.216357
877	222	Menu item was shown: bundle 1,2	2013-06-27 21:10:39.947724	2013-06-27 21:10:39.947724
878	729	Menu item was shown: bundle 1,2	2013-06-27 21:10:41.207017	2013-06-27 21:10:41.207017
879	222	Menu item was hidden: bundle 1,2	2013-06-27 21:10:43.508494	2013-06-27 21:10:43.508494
880	222	Menu item was shown: bundle 1,2	2013-06-27 21:11:03.959817	2013-06-27 21:11:03.959817
881	404	Menu item was shown: bundle 1,2	2013-06-27 21:11:05.350874	2013-06-27 21:11:05.350874
882	404	Menu item was shown: bundle 1,3	2013-06-27 21:11:06.709008	2013-06-27 21:11:06.709008
883	404	Menu item was shown: bundle 1,2	2013-06-27 21:11:07.641093	2013-06-27 21:11:07.641093
884	729	Menu item was shown: bundle 1,3	2013-06-27 21:11:10.001597	2013-06-27 21:11:10.001597
885	222	Menu item was shown: bundle 1,3	2013-06-27 21:11:10.053873	2013-06-27 21:11:10.053873
886	729	Menu item was hidden: bundle 1,3	2013-06-27 21:11:10.23389	2013-06-27 21:11:10.23389
887	404	Menu item was shown: bundle 1,3	2013-06-27 21:11:10.894371	2013-06-27 21:11:10.894371
888	404	Menu item was shown: bundle 2,3	2013-06-27 21:11:12.211924	2013-06-27 21:11:12.211924
889	404	Menu item was shown: bundle 1,2,3	2013-06-27 21:11:12.934511	2013-06-27 21:11:12.934511
890	404	Menu item was shown: bundle 1,2	2013-06-27 21:11:14.283531	2013-06-27 21:11:14.283531
891	404	Good 1 was clicked. Value is now: true	2013-06-27 21:11:16.391257	2013-06-27 21:11:16.391257
892	404	Good 2 was clicked. Value is now: true	2013-06-27 21:11:17.111443	2013-06-27 21:11:17.111443
893	729	Menu item was shown: bundle 2,3	2013-06-27 21:11:19.084228	2013-06-27 21:11:19.084228
894	222	Menu item was shown: bundle 1,2	2013-06-27 21:11:20.021475	2013-06-27 21:11:20.021475
895	222	Menu item was shown: bundle 1,3	2013-06-27 21:11:33.493565	2013-06-27 21:11:33.493565
896	404	Menu item was shown: bundle 1,3	2013-06-27 21:11:40.353019	2013-06-27 21:11:40.353019
897	222	Menu item was shown: bundle 2,3	2013-06-27 21:11:42.924278	2013-06-27 21:11:42.924278
898	729	Menu item was shown: bundle 1,2,3	2013-06-27 21:11:44.527595	2013-06-27 21:11:44.527595
899	950	Menu item was shown: bundle 1,2	2013-06-27 21:11:48.537807	2013-06-27 21:11:48.537807
900	690	Menu item was shown: bundle 1,2	2013-06-27 21:11:48.588108	2013-06-27 21:11:48.588108
901	950	Menu item was hidden: bundle 1,2	2013-06-27 21:11:48.832132	2013-06-27 21:11:48.832132
902	690	Menu item was hidden: bundle 1,2	2013-06-27 21:11:48.909639	2013-06-27 21:11:48.909639
903	950	Menu item was shown: bundle 1,2	2013-06-27 21:11:49.322888	2013-06-27 21:11:49.322888
904	690	Menu item was shown: bundle 1,2	2013-06-27 21:11:49.485514	2013-06-27 21:11:49.485514
905	950	Menu item was shown: bundle 1,3	2013-06-27 21:11:50.385243	2013-06-27 21:11:50.385243
906	404	Menu item was shown: bundle 2,3	2013-06-27 21:11:51.086968	2013-06-27 21:11:51.086968
907	950	Menu item was shown: bundle 1,2	2013-06-27 21:11:51.198322	2013-06-27 21:11:51.198322
908	690	Menu item was hidden: bundle 1,2	2013-06-27 21:11:56.567155	2013-06-27 21:11:56.567155
909	222	Good 3 was clicked. Value is now: false	2013-06-27 21:11:57.043018	2013-06-27 21:11:57.043018
910	690	Menu item was shown: bundle 1,3	2013-06-27 21:11:57.275003	2013-06-27 21:11:57.275003
911	222	Good 2 was clicked. Value is now: false	2013-06-27 21:11:57.747641	2013-06-27 21:11:57.747641
912	690	Menu item was hidden: bundle 1,3	2013-06-27 21:11:59.048121	2013-06-27 21:11:59.048121
913	690	Menu item was shown: bundle 2,3	2013-06-27 21:11:59.656771	2013-06-27 21:11:59.656771
914	963	Menu item was shown: bundle 1,2	2013-06-27 21:12:00.24265	2013-06-27 21:12:00.24265
915	963	Menu item was hidden: bundle 1,2	2013-06-27 21:12:01.443575	2013-06-27 21:12:01.443575
916	690	Menu item was hidden: bundle 2,3	2013-06-27 21:12:01.81131	2013-06-27 21:12:01.81131
917	963	Menu item was shown: bundle 1,2	2013-06-27 21:12:02.145996	2013-06-27 21:12:02.145996
918	690	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:02.479944	2013-06-27 21:12:02.479944
919	963	Menu item was hidden: bundle 1,2	2013-06-27 21:12:03.092093	2013-06-27 21:12:03.092093
920	196	Menu item was shown: bundle 1,2	2013-06-27 21:12:03.427949	2013-06-27 21:12:03.427949
921	196	Menu item was shown: bundle 1,3	2013-06-27 21:12:04.591408	2013-06-27 21:12:04.591408
922	963	Menu item was shown: bundle 1,3	2013-06-27 21:12:04.721697	2013-06-27 21:12:04.721697
923	222	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:05.381803	2013-06-27 21:12:05.381803
924	690	Menu item was shown: bundle 1,3	2013-06-27 21:12:05.511933	2013-06-27 21:12:05.511933
925	196	Menu item was shown: bundle 2,3	2013-06-27 21:12:05.74462	2013-06-27 21:12:05.74462
926	963	Menu item was hidden: bundle 1,3	2013-06-27 21:12:05.780725	2013-06-27 21:12:05.780725
927	196	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:06.388032	2013-06-27 21:12:06.388032
928	963	Menu item was shown: bundle 2,3	2013-06-27 21:12:06.614705	2013-06-27 21:12:06.614705
929	963	Menu item was hidden: bundle 2,3	2013-06-27 21:12:08.202642	2013-06-27 21:12:08.202642
930	690	Menu item was shown: bundle 2,3	2013-06-27 21:12:08.357654	2013-06-27 21:12:08.357654
931	963	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:08.979241	2013-06-27 21:12:08.979241
932	690	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:09.574553	2013-06-27 21:12:09.574553
933	404	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:09.879605	2013-06-27 21:12:09.879605
934	963	Menu item was hidden: bundle 1,2,3	2013-06-27 21:12:10.669954	2013-06-27 21:12:10.669954
935	690	Menu item was shown: bundle 1,3	2013-06-27 21:12:12.25822	2013-06-27 21:12:12.25822
936	950	Menu item was shown: bundle 1,3	2013-06-27 21:12:16.374888	2013-06-27 21:12:16.374888
937	1041	Menu item was shown: bundle 1,2	2013-06-27 21:12:16.876943	2013-06-27 21:12:16.876943
938	963	Combo was clicked. Value is now: true	2013-06-27 21:12:17.788096	2013-06-27 21:12:17.788096
939	937	Menu item was shown: bundle 1,2	2013-06-27 21:12:18.172146	2013-06-27 21:12:18.172146
940	222	Menu item was shown: bundle 2,3	2013-06-27 21:12:18.257877	2013-06-27 21:12:18.257877
941	1041	Menu item was shown: bundle 1,3	2013-06-27 21:12:20.845746	2013-06-27 21:12:20.845746
942	1041	Menu item was shown: bundle 2,3	2013-06-27 21:12:22.959332	2013-06-27 21:12:22.959332
943	937	Menu item was shown: bundle 1,3	2013-06-27 21:12:23.826993	2013-06-27 21:12:23.826993
944	950	Menu item was shown: bundle 2,3	2013-06-27 21:12:24.071546	2013-06-27 21:12:24.071546
945	1041	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:26.268798	2013-06-27 21:12:26.268798
946	937	Menu item was shown: bundle 2,3	2013-06-27 21:12:28.716788	2013-06-27 21:12:28.716788
947	196	Menu item was shown: bundle 1,2	2013-06-27 21:12:28.962317	2013-06-27 21:12:28.962317
948	950	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:31.353422	2013-06-27 21:12:31.353422
949	1041	Menu item was shown: bundle 1,2	2013-06-27 21:12:32.654443	2013-06-27 21:12:32.654443
950	937	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:33.68713	2013-06-27 21:12:33.68713
951	196	Menu item was shown: bundle 1,3	2013-06-27 21:12:35.518788	2013-06-27 21:12:35.518788
952	222	Good 2 was clicked. Value is now: true	2013-06-27 21:12:37.146313	2013-06-27 21:12:37.146313
953	690	Menu item was shown: bundle 1,2	2013-06-27 21:12:37.322908	2013-06-27 21:12:37.322908
954	196	Menu item was shown: bundle 2,3	2013-06-27 21:12:39.009486	2013-06-27 21:12:39.009486
955	1002	Menu item was shown: bundle 1,2	2013-06-27 21:12:39.89241	2013-06-27 21:12:39.89241
956	963	Menu item was shown: bundle 2,3	2013-06-27 21:12:43.664634	2013-06-27 21:12:43.664634
957	196	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:43.894787	2013-06-27 21:12:43.894787
958	963	Menu item was hidden: bundle 2,3	2013-06-27 21:12:44.023406	2013-06-27 21:12:44.023406
959	1002	Menu item was shown: bundle 1,3	2013-06-27 21:12:44.188716	2013-06-27 21:12:44.188716
960	1080	Menu item was shown: bundle 1,2	2013-06-27 21:12:44.771185	2013-06-27 21:12:44.771185
961	1002	Menu item was shown: bundle 2,3	2013-06-27 21:12:44.995009	2013-06-27 21:12:44.995009
962	937	Good 1 was clicked. Value is now: true	2013-06-27 21:12:45.401199	2013-06-27 21:12:45.401199
963	1002	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:45.881968	2013-06-27 21:12:45.881968
964	1002	Menu item was shown: bundle 1,2	2013-06-27 21:12:47.051922	2013-06-27 21:12:47.051922
965	1080	Menu item was shown: bundle 1,3	2013-06-27 21:12:47.477907	2013-06-27 21:12:47.477907
966	1080	Menu item was shown: bundle 2,3	2013-06-27 21:12:48.725124	2013-06-27 21:12:48.725124
967	1080	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:49.46169	2013-06-27 21:12:49.46169
968	976	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:50.804185	2013-06-27 21:12:50.804185
969	963	Menu item was shown: bundle 1,2,3	2013-06-27 21:12:51.46171	2013-06-27 21:12:51.46171
970	976	Menu item was hidden: bundle 1,2,3	2013-06-27 21:12:51.620334	2013-06-27 21:12:51.620334
971	963	Menu item was shown: bundle 2,3	2013-06-27 21:12:51.821259	2013-06-27 21:12:51.821259
972	937	Menu item was shown: bundle 1,2	2013-06-27 21:12:53.763808	2013-06-27 21:12:53.763808
973	1041	Menu item was shown: bundle 1,3	2013-06-27 21:12:53.838902	2013-06-27 21:12:53.838902
974	937	Menu item was shown: bundle 1,3	2013-06-27 21:12:55.165688	2013-06-27 21:12:55.165688
975	196	Good 1 was clicked. Value is now: true	2013-06-27 21:12:55.855704	2013-06-27 21:12:55.855704
976	196	Good 2 was clicked. Value is now: true	2013-06-27 21:12:56.363097	2013-06-27 21:12:56.363097
977	963	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:00.469069	2013-06-27 21:13:00.469069
978	1041	Menu item was shown: bundle 2,3	2013-06-27 21:13:03.636979	2013-06-27 21:13:03.636979
979	1002	Menu item was shown: bundle 1,3	2013-06-27 21:13:04.52592	2013-06-27 21:13:04.52592
980	1080	Menu item was shown: bundle 1,2	2013-06-27 21:13:05.844815	2013-06-27 21:13:05.844815
981	1080	Menu item was hidden: bundle 1,2	2013-06-27 21:13:06.125661	2013-06-27 21:13:06.125661
982	1002	Menu item was shown: bundle 1,2	2013-06-27 21:13:06.252828	2013-06-27 21:13:06.252828
983	1080	Menu item was shown: bundle 1,2	2013-06-27 21:13:06.577512	2013-06-27 21:13:06.577512
984	1041	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:12.501666	2013-06-27 21:13:12.501666
985	1015	Menu item was shown: bundle 1,2	2013-06-27 21:13:13.381819	2013-06-27 21:13:13.381819
986	989	Menu item was shown: bundle 1,2	2013-06-27 21:13:17.383545	2013-06-27 21:13:17.383545
987	1015	Menu item was shown: bundle 1,3	2013-06-27 21:13:19.202656	2013-06-27 21:13:19.202656
988	989	Menu item was shown: bundle 1,3	2013-06-27 21:13:19.60926	2013-06-27 21:13:19.60926
989	1080	Menu item was shown: bundle 1,3	2013-06-27 21:13:20.470435	2013-06-27 21:13:20.470435
990	976	Good 1 was clicked. Value is now: true	2013-06-27 21:13:20.674782	2013-06-27 21:13:20.674782
991	989	Menu item was shown: bundle 2,3	2013-06-27 21:13:21.088807	2013-06-27 21:13:21.088807
992	989	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:22.400787	2013-06-27 21:13:22.400787
993	937	Menu item was shown: bundle 2,3	2013-06-27 21:13:23.108814	2013-06-27 21:13:23.108814
994	1002	Menu item was shown: bundle 1,3	2013-06-27 21:13:24.474517	2013-06-27 21:13:24.474517
995	1015	Menu item was shown: bundle 2,3	2013-06-27 21:13:25.963863	2013-06-27 21:13:25.963863
996	989	Menu item was shown: bundle 1,2	2013-06-27 21:13:27.755439	2013-06-27 21:13:27.755439
997	937	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:28.369733	2013-06-27 21:13:28.369733
998	989	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:29.231715	2013-06-27 21:13:29.231715
999	950	Menu item was shown: bundle 1,2	2013-06-27 21:13:30.339474	2013-06-27 21:13:30.339474
1000	1015	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:33.21385	2013-06-27 21:13:33.21385
1001	1015	Combo was clicked. Value is now: true	2013-06-27 21:13:38.278155	2013-06-27 21:13:38.278155
1002	989	Combo was clicked. Value is now: true	2013-06-27 21:13:38.366572	2013-06-27 21:13:38.366572
1003	1080	Menu item was shown: bundle 2,3	2013-06-27 21:13:39.818808	2013-06-27 21:13:39.818808
1004	1002	Menu item was shown: bundle 1,2	2013-06-27 21:13:42.781541	2013-06-27 21:13:42.781541
1005	963	Menu item was shown: bundle 1,2	2013-06-27 21:13:43.122622	2013-06-27 21:13:43.122622
1006	690	Menu item was shown: bundle 1,3	2013-06-27 21:13:43.504507	2013-06-27 21:13:43.504507
1007	690	Menu item was hidden: bundle 1,3	2013-06-27 21:13:44.762349	2013-06-27 21:13:44.762349
1008	898	Menu item was shown: bundle 1,2	2013-06-27 21:13:44.998253	2013-06-27 21:13:44.998253
1009	963	Menu item was shown: bundle 1,3	2013-06-27 21:13:45.168275	2013-06-27 21:13:45.168275
1010	690	Menu item was shown: bundle 2,3	2013-06-27 21:13:45.780399	2013-06-27 21:13:45.780399
1011	963	Menu item was shown: bundle 2,3	2013-06-27 21:13:46.272675	2013-06-27 21:13:46.272675
1012	1080	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:47.394287	2013-06-27 21:13:47.394287
1013	898	Menu item was shown: bundle 1,3	2013-06-27 21:13:50.107646	2013-06-27 21:13:50.107646
1014	1002	Menu item was shown: bundle 1,3	2013-06-27 21:13:51.878162	2013-06-27 21:13:51.878162
1015	937	Menu item was shown: bundle 1,2	2013-06-27 21:13:52.868827	2013-06-27 21:13:52.868827
1016	1015	Menu item was shown: bundle 1,2	2013-06-27 21:13:52.935069	2013-06-27 21:13:52.935069
1017	950	Menu item was shown: bundle 1,3	2013-06-27 21:13:53.217759	2013-06-27 21:13:53.217759
1018	898	Menu item was shown: bundle 2,3	2013-06-27 21:13:54.323026	2013-06-27 21:13:54.323026
1019	1041	Good 2 was clicked. Value is now: true	2013-06-27 21:13:55.855923	2013-06-27 21:13:55.855923
1020	1093	Menu item was shown: bundle 1,2	2013-06-27 21:13:56.052033	2013-06-27 21:13:56.052033
1021	937	Menu item was shown: bundle 1,3	2013-06-27 21:13:56.293993	2013-06-27 21:13:56.293993
1022	1093	Menu item was shown: bundle 1,3	2013-06-27 21:13:58.465136	2013-06-27 21:13:58.465136
1023	963	Menu item was shown: bundle 1,2	2013-06-27 21:13:58.64816	2013-06-27 21:13:58.64816
1024	898	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:58.778046	2013-06-27 21:13:58.778046
1025	937	Menu item was shown: bundle 2,3	2013-06-27 21:13:58.892907	2013-06-27 21:13:58.892907
1026	690	Menu item was shown: bundle 1,2,3	2013-06-27 21:13:58.999014	2013-06-27 21:13:58.999014
1027	287	Menu item was shown: bundle 1,2	2013-06-27 21:13:59.039336	2013-06-27 21:13:59.039336
1028	963	Menu item was hidden: bundle 1,2	2013-06-27 21:13:59.183768	2013-06-27 21:13:59.183768
1029	989	Menu item was shown: bundle 1,2	2013-06-27 21:14:00.583719	2013-06-27 21:14:00.583719
1030	963	Menu item was shown: bundle 1,2	2013-06-27 21:14:00.743594	2013-06-27 21:14:00.743594
1031	287	Menu item was shown: bundle 1,3	2013-06-27 21:14:01.06162	2013-06-27 21:14:01.06162
1032	950	Menu item was shown: bundle 2,3	2013-06-27 21:14:01.190161	2013-06-27 21:14:01.190161
1033	1093	Menu item was shown: bundle 2,3	2013-06-27 21:14:01.943967	2013-06-27 21:14:01.943967
1034	1002	Menu item was shown: bundle 2,3	2013-06-27 21:14:02.044445	2013-06-27 21:14:02.044445
1035	963	Menu item was shown: bundle 1,3	2013-06-27 21:14:02.229831	2013-06-27 21:14:02.229831
1036	287	Menu item was shown: bundle 2,3	2013-06-27 21:14:02.710018	2013-06-27 21:14:02.710018
1037	1041	Good 3 was clicked. Value is now: true	2013-06-27 21:14:02.953704	2013-06-27 21:14:02.953704
1038	1093	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:03.571322	2013-06-27 21:14:03.571322
1039	963	Menu item was shown: bundle 2,3	2013-06-27 21:14:03.638926	2013-06-27 21:14:03.638926
1040	287	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:04.681162	2013-06-27 21:14:04.681162
1041	1093	Menu item was shown: bundle 1,2	2013-06-27 21:14:04.76375	2013-06-27 21:14:04.76375
1042	1015	Menu item was shown: bundle 1,3	2013-06-27 21:14:04.883274	2013-06-27 21:14:04.883274
1043	963	Menu item was hidden: bundle 2,3	2013-06-27 21:14:04.955963	2013-06-27 21:14:04.955963
1044	989	Menu item was shown: bundle 1,3	2013-06-27 21:14:05.541716	2013-06-27 21:14:05.541716
1045	1093	Menu item was shown: bundle 1,3	2013-06-27 21:14:05.737461	2013-06-27 21:14:05.737461
1046	1093	Menu item was shown: bundle 2,3	2013-06-27 21:14:06.588886	2013-06-27 21:14:06.588886
1047	287	Menu item was shown: bundle 1,3	2013-06-27 21:14:06.788355	2013-06-27 21:14:06.788355
1048	950	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:06.851251	2013-06-27 21:14:06.851251
1049	1093	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:07.195544	2013-06-27 21:14:07.195544
1050	989	Menu item was shown: bundle 1,2	2013-06-27 21:14:08.883054	2013-06-27 21:14:08.883054
1051	1002	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:09.790226	2013-06-27 21:14:09.790226
1052	898	Menu item was shown: bundle 1,2	2013-06-27 21:14:12.033929	2013-06-27 21:14:12.033929
1053	1119	Menu item was shown: bundle 1,2	2013-06-27 21:14:12.185303	2013-06-27 21:14:12.185303
1054	1119	Menu item was hidden: bundle 1,2	2013-06-27 21:14:15.441821	2013-06-27 21:14:15.441821
1055	287	Good 1 was clicked. Value is now: true	2013-06-27 21:14:15.844705	2013-06-27 21:14:15.844705
1056	287	Good 3 was clicked. Value is now: true	2013-06-27 21:14:16.708217	2013-06-27 21:14:16.708217
1057	1119	Menu item was shown: bundle 1,2	2013-06-27 21:14:19.421595	2013-06-27 21:14:19.421595
1058	937	Menu item was shown: bundle 1,2	2013-06-27 21:14:19.579529	2013-06-27 21:14:19.579529
1059	989	Menu item was shown: bundle 1,3	2013-06-27 21:14:20.86695	2013-06-27 21:14:20.86695
1060	937	Menu item was shown: bundle 1,3	2013-06-27 21:14:21.391481	2013-06-27 21:14:21.391481
1061	1093	Menu item was shown: bundle 1,2	2013-06-27 21:14:21.836736	2013-06-27 21:14:21.836736
1062	1119	Menu item was shown: bundle 1,3	2013-06-27 21:14:22.239889	2013-06-27 21:14:22.239889
1063	937	Menu item was shown: bundle 2,3	2013-06-27 21:14:23.347118	2013-06-27 21:14:23.347118
1064	1119	Menu item was shown: bundle 2,3	2013-06-27 21:14:24.54921	2013-06-27 21:14:24.54921
1065	1119	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:27.147067	2013-06-27 21:14:27.147067
1066	1119	Menu item was shown: bundle 2,3	2013-06-27 21:14:28.214419	2013-06-27 21:14:28.214419
1067	898	Menu item was shown: bundle 1,3	2013-06-27 21:14:29.040835	2013-06-27 21:14:29.040835
1068	1002	Good 1 was clicked. Value is now: true	2013-06-27 21:14:29.724425	2013-06-27 21:14:29.724425
1069	1015	Good 1 was clicked. Value is now: true	2013-06-27 21:14:30.05871	2013-06-27 21:14:30.05871
1070	1002	Good 2 was clicked. Value is now: true	2013-06-27 21:14:30.267081	2013-06-27 21:14:30.267081
1071	1119	Menu item was hidden: bundle 2,3	2013-06-27 21:14:30.93195	2013-06-27 21:14:30.93195
1072	1015	Good 3 was clicked. Value is now: true	2013-06-27 21:14:30.979393	2013-06-27 21:14:30.979393
1073	1119	Menu item was shown: bundle 1,3	2013-06-27 21:14:32.338796	2013-06-27 21:14:32.338796
1074	1119	Menu item was hidden: bundle 1,3	2013-06-27 21:14:33.190116	2013-06-27 21:14:33.190116
1075	1119	Menu item was shown: bundle 1,2	2013-06-27 21:14:33.686851	2013-06-27 21:14:33.686851
1076	1119	Menu item was hidden: bundle 1,2	2013-06-27 21:14:34.262405	2013-06-27 21:14:34.262405
1077	1119	Menu item was shown: bundle 1,3	2013-06-27 21:14:34.710537	2013-06-27 21:14:34.710537
1078	1119	Menu item was hidden: bundle 1,3	2013-06-27 21:14:35.36144	2013-06-27 21:14:35.36144
1079	937	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:35.448319	2013-06-27 21:14:35.448319
1080	1119	Menu item was shown: bundle 2,3	2013-06-27 21:14:35.72551	2013-06-27 21:14:35.72551
1081	1119	Menu item was hidden: bundle 2,3	2013-06-27 21:14:37.159993	2013-06-27 21:14:37.159993
1082	898	Menu item was shown: bundle 2,3	2013-06-27 21:14:37.289634	2013-06-27 21:14:37.289634
1083	989	Menu item was shown: bundle 1,2	2013-06-27 21:14:37.427018	2013-06-27 21:14:37.427018
1084	1119	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:37.761713	2013-06-27 21:14:37.761713
1085	989	Menu item was shown: bundle 1,3	2013-06-27 21:14:37.869074	2013-06-27 21:14:37.869074
1086	898	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:38.039049	2013-06-27 21:14:38.039049
1087	1093	Menu item was shown: bundle 2,3	2013-06-27 21:14:38.214033	2013-06-27 21:14:38.214033
1088	1119	Menu item was hidden: bundle 1,2,3	2013-06-27 21:14:39.170746	2013-06-27 21:14:39.170746
1089	989	Menu item was shown: bundle 1,2	2013-06-27 21:14:40.470548	2013-06-27 21:14:40.470548
1090	1119	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:40.760325	2013-06-27 21:14:40.760325
1091	1119	Menu item was hidden: bundle 1,2,3	2013-06-27 21:14:41.561931	2013-06-27 21:14:41.561931
1092	1119	Menu item was shown: bundle 2,3	2013-06-27 21:14:42.196739	2013-06-27 21:14:42.196739
1093	1119	Menu item was hidden: bundle 2,3	2013-06-27 21:14:43.343436	2013-06-27 21:14:43.343436
1094	950	Combo was clicked. Value is now: true	2013-06-27 21:14:44.515986	2013-06-27 21:14:44.515986
1095	937	Good 1 was clicked. Value is now: false	2013-06-27 21:14:45.316375	2013-06-27 21:14:45.316375
1096	989	Menu item was shown: bundle 1,3	2013-06-27 21:14:46.789978	2013-06-27 21:14:46.789978
1097	937	Combo was clicked. Value is now: true	2013-06-27 21:14:47.254036	2013-06-27 21:14:47.254036
1098	1093	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:47.595541	2013-06-27 21:14:47.595541
1099	209	Menu item was shown: bundle 1,2	2013-06-27 21:14:48.588039	2013-06-27 21:14:48.588039
1100	209	Menu item was hidden: bundle 1,2	2013-06-27 21:14:50.522278	2013-06-27 21:14:50.522278
1101	209	Menu item was shown: bundle 1,2	2013-06-27 21:14:51.027257	2013-06-27 21:14:51.027257
1102	1015	Menu item was shown: bundle 2,3	2013-06-27 21:14:51.384673	2013-06-27 21:14:51.384673
1103	1015	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:52.428101	2013-06-27 21:14:52.428101
1104	209	Menu item was shown: bundle 1,3	2013-06-27 21:14:56.5656	2013-06-27 21:14:56.5656
1105	898	Combo was clicked. Value is now: true	2013-06-27 21:14:57.118106	2013-06-27 21:14:57.118106
1106	989	Menu item was shown: bundle 2,3	2013-06-27 21:14:57.210656	2013-06-27 21:14:57.210656
1107	937	Menu item was shown: bundle 2,3	2013-06-27 21:14:58.356548	2013-06-27 21:14:58.356548
1108	937	Menu item was shown: bundle 1,3	2013-06-27 21:14:59.064585	2013-06-27 21:14:59.064585
1109	937	Menu item was shown: bundle 1,2,3	2013-06-27 21:14:59.867907	2013-06-27 21:14:59.867907
1110	937	Menu item was shown: bundle 2,3	2013-06-27 21:15:00.371408	2013-06-27 21:15:00.371408
1111	209	Menu item was hidden: bundle 1,3	2013-06-27 21:15:00.514509	2013-06-27 21:15:00.514509
1112	937	Menu item was shown: bundle 1,3	2013-06-27 21:15:01.069922	2013-06-27 21:15:01.069922
1113	937	Menu item was shown: bundle 1,2	2013-06-27 21:15:01.927647	2013-06-27 21:15:01.927647
1114	543	Menu item was shown: bundle 1,2	2013-06-27 21:15:06.117865	2013-06-27 21:15:06.117865
1115	209	Menu item was shown: bundle 2,3	2013-06-27 21:15:06.201992	2013-06-27 21:15:06.201992
1116	209	Menu item was hidden: bundle 2,3	2013-06-27 21:15:06.989628	2013-06-27 21:15:06.989628
1117	989	Menu item was shown: bundle 1,2,3	2013-06-27 21:15:08.333048	2013-06-27 21:15:08.333048
1118	1015	Good 1 was clicked. Value is now: false	2013-06-27 21:15:11.629132	2013-06-27 21:15:11.629132
1119	690	Combo was clicked. Value is now: true	2013-06-27 21:15:12.104989	2013-06-27 21:15:12.104989
1120	1015	Good 3 was clicked. Value is now: false	2013-06-27 21:15:12.561354	2013-06-27 21:15:12.561354
1121	209	Menu item was shown: bundle 1,2,3	2013-06-27 21:15:14.790531	2013-06-27 21:15:14.790531
1122	989	Good 1 was clicked. Value is now: true	2013-06-27 21:15:15.415066	2013-06-27 21:15:15.415066
1123	1015	Menu item was shown: bundle 2,3	2013-06-27 21:15:15.526844	2013-06-27 21:15:15.526844
1124	989	Good 2 was clicked. Value is now: true	2013-06-27 21:15:15.821343	2013-06-27 21:15:15.821343
1125	1119	Menu item was shown: bundle 1,2	2013-06-27 21:15:15.903226	2013-06-27 21:15:15.903226
1126	989	Good 3 was clicked. Value is now: true	2013-06-27 21:15:16.209351	2013-06-27 21:15:16.209351
1127	543	Menu item was shown: bundle 1,3	2013-06-27 21:15:17.989796	2013-06-27 21:15:17.989796
1128	543	Menu item was shown: bundle 1,4	2013-06-27 21:15:20.380947	2013-06-27 21:15:20.380947
1129	543	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:15:23.471402	2013-06-27 21:15:23.471402
1130	209	Good 2 was clicked. Value is now: true	2013-06-27 21:15:33.369411	2013-06-27 21:15:33.369411
1131	209	Good 3 was clicked. Value is now: true	2013-06-27 21:15:33.802021	2013-06-27 21:15:33.802021
1132	989	Menu item was hidden: bundle 1,2,3	2013-06-27 21:15:36.049186	2013-06-27 21:15:36.049186
1133	543	Menu item was shown: bundle 2,3,4	2013-06-27 21:15:36.187826	2013-06-27 21:15:36.187826
1134	989	Menu item was shown: bundle 1,2,3	2013-06-27 21:15:36.273128	2013-06-27 21:15:36.273128
1135	232	Menu item was shown: bundle 1,2	2013-06-27 21:15:38.992838	2013-06-27 21:15:38.992838
1136	232	Menu item was hidden: bundle 1,2	2013-06-27 21:15:40.051907	2013-06-27 21:15:40.051907
1137	543	Good 2 was clicked. Value is now: true	2013-06-27 21:15:40.35492	2013-06-27 21:15:40.35492
1138	543	Good 3 was clicked. Value is now: true	2013-06-27 21:15:40.862221	2013-06-27 21:15:40.862221
1139	543	Good 4 was clicked. Value is now: true	2013-06-27 21:15:41.432674	2013-06-27 21:15:41.432674
1140	209	Menu item was shown: bundle 2,3	2013-06-27 21:15:45.441819	2013-06-27 21:15:45.441819
1141	209	Menu item was hidden: bundle 2,3	2013-06-27 21:15:46.192413	2013-06-27 21:15:46.192413
1142	543	Menu item was shown: bundle 1,3,4	2013-06-27 21:15:46.541586	2013-06-27 21:15:46.541586
1143	209	Good 2 was clicked. Value is now: false	2013-06-27 21:15:47.468574	2013-06-27 21:15:47.468574
1144	209	Good 3 was clicked. Value is now: false	2013-06-27 21:15:47.984	2013-06-27 21:15:47.984
1145	232	Combo was clicked. Value is now: true	2013-06-27 21:15:48.208131	2013-06-27 21:15:48.208131
1146	209	Combo was clicked. Value is now: true	2013-06-27 21:15:48.741078	2013-06-27 21:15:48.741078
1147	232	Menu item was shown: bundle 1,2	2013-06-27 21:15:51.661262	2013-06-27 21:15:51.661262
1148	1093	Good 1 was clicked. Value is now: true	2013-06-27 21:15:54.233603	2013-06-27 21:15:54.233603
1149	232	Menu item was hidden: bundle 1,2	2013-06-27 21:15:56.080799	2013-06-27 21:15:56.080799
1150	543	Menu item was shown: bundle 1,2,4	2013-06-27 21:15:56.441225	2013-06-27 21:15:56.441225
1151	232	Menu item was shown: bundle 1,3	2013-06-27 21:15:56.767834	2013-06-27 21:15:56.767834
1152	232	Menu item was hidden: bundle 1,3	2013-06-27 21:15:57.40452	2013-06-27 21:15:57.40452
1153	232	Menu item was shown: bundle 1,4	2013-06-27 21:15:57.880482	2013-06-27 21:15:57.880482
1154	232	Menu item was hidden: bundle 1,4	2013-06-27 21:15:58.297458	2013-06-27 21:15:58.297458
1155	232	Menu item was shown: bundle 2,3	2013-06-27 21:15:58.893227	2013-06-27 21:15:58.893227
1156	232	Menu item was hidden: bundle 2,3	2013-06-27 21:15:59.354774	2013-06-27 21:15:59.354774
1157	232	Menu item was shown: bundle 2,4	2013-06-27 21:16:00.113088	2013-06-27 21:16:00.113088
1158	232	Menu item was hidden: bundle 2,4	2013-06-27 21:16:00.600204	2013-06-27 21:16:00.600204
1159	232	Menu item was shown: bundle 3,4	2013-06-27 21:16:01.096316	2013-06-27 21:16:01.096316
1160	232	Menu item was hidden: bundle 3,4	2013-06-27 21:16:02.331222	2013-06-27 21:16:02.331222
1161	232	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:02.873606	2013-06-27 21:16:02.873606
1162	232	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:03.635888	2013-06-27 21:16:03.635888
1163	543	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:03.958003	2013-06-27 21:16:03.958003
1164	232	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:04.311914	2013-06-27 21:16:04.311914
1165	232	Menu item was hidden: bundle 1,2,4	2013-06-27 21:16:04.640926	2013-06-27 21:16:04.640926
1166	232	Menu item was shown: bundle 1,3,4	2013-06-27 21:16:05.321989	2013-06-27 21:16:05.321989
1167	232	Menu item was hidden: bundle 1,3,4	2013-06-27 21:16:06.066732	2013-06-27 21:16:06.066732
1168	543	Menu item was shown: bundle 3,4	2013-06-27 21:16:06.421034	2013-06-27 21:16:06.421034
1169	232	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:06.611384	2013-06-27 21:16:06.611384
1170	232	Menu item was shown: bundle 2,3,4	2013-06-27 21:16:09.130741	2013-06-27 21:16:09.130741
1171	989	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:09.398819	2013-06-27 21:16:09.398819
1172	232	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:09.983687	2013-06-27 21:16:09.983687
1173	232	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:16:10.997359	2013-06-27 21:16:10.997359
1174	543	Menu item was shown: bundle 2,4	2013-06-27 21:16:11.629397	2013-06-27 21:16:11.629397
1175	543	Menu item was shown: bundle 2,3	2013-06-27 21:16:12.939861	2013-06-27 21:16:12.939861
1176	543	Menu item was shown: bundle 1,4	2013-06-27 21:16:13.901965	2013-06-27 21:16:13.901965
1177	543	Menu item was shown: bundle 1,3	2013-06-27 21:16:14.665079	2013-06-27 21:16:14.665079
1178	232	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:14.846326	2013-06-27 21:16:14.846326
1179	543	Menu item was shown: bundle 1,2	2013-06-27 21:16:15.361185	2013-06-27 21:16:15.361185
1180	232	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:16:15.914444	2013-06-27 21:16:15.914444
1181	246	Combo was clicked. Value is now: true	2013-06-27 21:16:16.763194	2013-06-27 21:16:16.763194
1182	898	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:18.258557	2013-06-27 21:16:18.258557
1183	543	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:18.504567	2013-06-27 21:16:18.504567
1184	232	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:18.72781	2013-06-27 21:16:18.72781
1185	898	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:19.329969	2013-06-27 21:16:19.329969
1186	232	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:16:19.502301	2013-06-27 21:16:19.502301
1187	898	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:19.788931	2013-06-27 21:16:19.788931
1188	898	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:20.436169	2013-06-27 21:16:20.436169
1189	543	Menu item was shown: bundle 1,3,4	2013-06-27 21:16:20.66355	2013-06-27 21:16:20.66355
1190	989	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:21.39962	2013-06-27 21:16:21.39962
1191	543	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:21.629342	2013-06-27 21:16:21.629342
1192	232	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:21.711294	2013-06-27 21:16:21.711294
1193	1119	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:21.957725	2013-06-27 21:16:21.957725
1194	739	Menu item was shown: bundle 1,2	2013-06-27 21:16:22.099608	2013-06-27 21:16:22.099608
1195	1119	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:22.818128	2013-06-27 21:16:22.818128
1196	739	Menu item was hidden: bundle 1,2	2013-06-27 21:16:23.071207	2013-06-27 21:16:23.071207
1197	543	Good 1 was clicked. Value is now: true	2013-06-27 21:16:23.847692	2013-06-27 21:16:23.847692
1198	543	Good 3 was clicked. Value is now: false	2013-06-27 21:16:25.077147	2013-06-27 21:16:25.077147
1199	898	Combo was clicked. Value is now: false	2013-06-27 21:16:25.405387	2013-06-27 21:16:25.405387
1200	989	Combo was clicked. Value is now: true	2013-06-27 21:16:25.713063	2013-06-27 21:16:25.713063
1201	739	Menu item was shown: bundle 1,2	2013-06-27 21:16:26.424976	2013-06-27 21:16:26.424976
1202	739	Menu item was shown: bundle 1,3	2013-06-27 21:16:26.831229	2013-06-27 21:16:26.831229
1203	739	Menu item was shown: bundle 1,4	2013-06-27 21:16:27.367284	2013-06-27 21:16:27.367284
1204	739	Menu item was shown: bundle 2,3	2013-06-27 21:16:27.860243	2013-06-27 21:16:27.860243
1205	739	Menu item was shown: bundle 2,4	2013-06-27 21:16:28.289362	2013-06-27 21:16:28.289362
1206	739	Menu item was hidden: bundle 2,4	2013-06-27 21:16:28.554738	2013-06-27 21:16:28.554738
1207	739	Menu item was shown: bundle 2,4	2013-06-27 21:16:29.134542	2013-06-27 21:16:29.134542
1208	739	Menu item was shown: bundle 3,4	2013-06-27 21:16:29.740515	2013-06-27 21:16:29.740515
1209	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:30.299692	2013-06-27 21:16:30.299692
1210	739	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:30.892517	2013-06-27 21:16:30.892517
1211	232	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:16:31.034108	2013-06-27 21:16:31.034108
1212	739	Menu item was shown: bundle 1,3,4	2013-06-27 21:16:31.396812	2013-06-27 21:16:31.396812
1213	232	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:31.803394	2013-06-27 21:16:31.803394
1214	898	Good 2 was clicked. Value is now: true	2013-06-27 21:16:34.463191	2013-06-27 21:16:34.463191
1215	232	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:16:35.687877	2013-06-27 21:16:35.687877
1216	232	Menu item was shown: bundle 2,3,4	2013-06-27 21:16:36.140617	2013-06-27 21:16:36.140617
1217	739	Menu item was shown: bundle 2,3,4	2013-06-27 21:16:36.374224	2013-06-27 21:16:36.374224
1218	232	Menu item was hidden: bundle 2,3,4	2013-06-27 21:16:36.609063	2013-06-27 21:16:36.609063
1219	739	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:36.846228	2013-06-27 21:16:36.846228
1220	898	Good 3 was clicked. Value is now: true	2013-06-27 21:16:36.942339	2013-06-27 21:16:36.942339
1221	232	Menu item was shown: bundle 1,3,4	2013-06-27 21:16:37.133549	2013-06-27 21:16:37.133549
1222	739	Menu item was shown: bundle 1,3,4	2013-06-27 21:16:37.564592	2013-06-27 21:16:37.564592
1223	232	Menu item was hidden: bundle 1,3,4	2013-06-27 21:16:37.78389	2013-06-27 21:16:37.78389
1224	232	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:38.105006	2013-06-27 21:16:38.105006
1225	232	Menu item was hidden: bundle 1,2,4	2013-06-27 21:16:39.743216	2013-06-27 21:16:39.743216
1226	739	Good 1 was clicked. Value is now: true	2013-06-27 21:16:40.120622	2013-06-27 21:16:40.120622
1227	739	Good 3 was clicked. Value is now: true	2013-06-27 21:16:40.701814	2013-06-27 21:16:40.701814
1228	739	Good 4 was clicked. Value is now: true	2013-06-27 21:16:41.307486	2013-06-27 21:16:41.307486
1229	232	Good 1 was clicked. Value is now: true	2013-06-27 21:16:42.432367	2013-06-27 21:16:42.432367
1230	232	Good 2 was clicked. Value is now: true	2013-06-27 21:16:43.088773	2013-06-27 21:16:43.088773
1231	232	Good 4 was clicked. Value is now: true	2013-06-27 21:16:43.697948	2013-06-27 21:16:43.697948
1232	232	Menu item was shown: bundle 1,2,4	2013-06-27 21:16:45.291666	2013-06-27 21:16:45.291666
1233	697	Menu item was shown: bundle 1,2	2013-06-27 21:16:46.724472	2013-06-27 21:16:46.724472
1234	739	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:16:47.431544	2013-06-27 21:16:47.431544
1235	697	Menu item was hidden: bundle 1,2	2013-06-27 21:16:49.681414	2013-06-27 21:16:49.681414
1236	1015	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:50.326792	2013-06-27 21:16:50.326792
1237	697	Menu item was shown: bundle 1,3	2013-06-27 21:16:50.566796	2013-06-27 21:16:50.566796
1238	1015	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:50.61152	2013-06-27 21:16:50.61152
1239	232	Menu item was hidden: bundle 1,2,4	2013-06-27 21:16:50.640183	2013-06-27 21:16:50.640183
1240	1015	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:51.90298	2013-06-27 21:16:51.90298
1241	1119	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:55.44881	2013-06-27 21:16:55.44881
1242	697	Menu item was shown: bundle 1,2	2013-06-27 21:16:56.538564	2013-06-27 21:16:56.538564
1243	1119	Menu item was hidden: bundle 1,2,3	2013-06-27 21:16:58.774529	2013-06-27 21:16:58.774529
1244	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:16:59.797819	2013-06-27 21:16:59.797819
1245	697	Menu item was shown: bundle 1,3	2013-06-27 21:16:59.831233	2013-06-27 21:16:59.831233
1246	739	Menu item was shown: bundle 1,2,4	2013-06-27 21:17:00.701292	2013-06-27 21:17:00.701292
1247	739	Menu item was hidden: bundle 1,2,4	2013-06-27 21:17:02.658485	2013-06-27 21:17:02.658485
1248	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:02.959193	2013-06-27 21:17:02.959193
1249	739	Menu item was shown: bundle 1,3,4	2013-06-27 21:17:04.576949	2013-06-27 21:17:04.576949
1250	697	Menu item was shown: bundle 2,3	2013-06-27 21:17:04.805939	2013-06-27 21:17:04.805939
1251	1015	Good 3 was clicked. Value is now: true	2013-06-27 21:17:08.024559	2013-06-27 21:17:08.024559
1252	1015	Good 1 was clicked. Value is now: true	2013-06-27 21:17:09.353442	2013-06-27 21:17:09.353442
1253	739	Menu item was shown: bundle 1,2	2013-06-27 21:17:11.503472	2013-06-27 21:17:11.503472
1254	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:13.752354	2013-06-27 21:17:13.752354
1255	739	Menu item was hidden: bundle 1,2,3	2013-06-27 21:17:13.834677	2013-06-27 21:17:13.834677
1256	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:14.122604	2013-06-27 21:17:14.122604
1257	739	Menu item was shown: bundle 3,4	2013-06-27 21:17:14.94025	2013-06-27 21:17:14.94025
1258	960	Menu item was shown: bundle 1,2	2013-06-27 21:17:16.135599	2013-06-27 21:17:16.135599
1259	697	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:18.47753	2013-06-27 21:17:18.47753
1260	739	Menu item was shown: bundle 1,2	2013-06-27 21:17:18.69563	2013-06-27 21:17:18.69563
1261	739	Menu item was shown: bundle 1,3	2013-06-27 21:17:19.932411	2013-06-27 21:17:19.932411
1262	739	Menu item was shown: bundle 1,4	2013-06-27 21:17:20.538116	2013-06-27 21:17:20.538116
1263	960	Menu item was shown: bundle 1,3	2013-06-27 21:17:20.707969	2013-06-27 21:17:20.707969
1264	739	Menu item was shown: bundle 2,3	2013-06-27 21:17:21.233744	2013-06-27 21:17:21.233744
1265	739	Menu item was shown: bundle 2,4	2013-06-27 21:17:21.808656	2013-06-27 21:17:21.808656
1266	697	Menu item was shown: bundle 2,3	2013-06-27 21:17:23.118904	2013-06-27 21:17:23.118904
1267	697	Good 2 was clicked. Value is now: true	2013-06-27 21:17:25.874725	2013-06-27 21:17:25.874725
1268	697	Good 3 was clicked. Value is now: true	2013-06-27 21:17:26.231266	2013-06-27 21:17:26.231266
1269	982	Menu item was shown: bundle 1,2	2013-06-27 21:17:27.763381	2013-06-27 21:17:27.763381
1270	960	Good 2 was clicked. Value is now: true	2013-06-27 21:17:30.4245	2013-06-27 21:17:30.4245
1271	960	Menu item was shown: bundle 1,4	2013-06-27 21:17:31.141053	2013-06-27 21:17:31.141053
1272	982	Menu item was shown: bundle 2,4	2013-06-27 21:17:31.377082	2013-06-27 21:17:31.377082
1273	206	Good 1 was clicked. Value is now: true	2013-06-27 21:17:32.67194	2013-06-27 21:17:32.67194
1274	739	Good 1 was clicked. Value is now: false	2013-06-27 21:17:34.508555	2013-06-27 21:17:34.508555
1275	206	Good 2 was clicked. Value is now: true	2013-06-27 21:17:35.21913	2013-06-27 21:17:35.21913
1276	960	Menu item was shown: bundle 2,3	2013-06-27 21:17:35.626006	2013-06-27 21:17:35.626006
1277	739	Good 4 was clicked. Value is now: false	2013-06-27 21:17:36.284125	2013-06-27 21:17:36.284125
1278	739	Good 3 was clicked. Value is now: false	2013-06-27 21:17:36.662384	2013-06-27 21:17:36.662384
1279	739	Good 2 was clicked. Value is now: true	2013-06-27 21:17:36.77275	2013-06-27 21:17:36.77275
1280	739	Good 4 was clicked. Value is now: true	2013-06-27 21:17:36.872683	2013-06-27 21:17:36.872683
1281	739	Menu item was shown: bundle 3,4	2013-06-27 21:17:37.37988	2013-06-27 21:17:37.37988
1282	960	Menu item was shown: bundle 2,4	2013-06-27 21:17:38.373293	2013-06-27 21:17:38.373293
1283	697	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:38.505134	2013-06-27 21:17:38.505134
1284	739	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:38.721973	2013-06-27 21:17:38.721973
1285	206	Combo was clicked. Value is now: true	2013-06-27 21:17:38.91328	2013-06-27 21:17:38.91328
1286	982	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:17:39.674603	2013-06-27 21:17:39.674603
1287	739	Menu item was shown: bundle 1,2,4	2013-06-27 21:17:40.618106	2013-06-27 21:17:40.618106
1288	739	Menu item was shown: bundle 1,3,4	2013-06-27 21:17:41.613229	2013-06-27 21:17:41.613229
1289	206	Menu item was shown: bundle 1,2	2013-06-27 21:17:41.831043	2013-06-27 21:17:41.831043
1290	960	Menu item was shown: bundle 3,4	2013-06-27 21:17:42.515966	2013-06-27 21:17:42.515966
1291	739	Menu item was shown: bundle 1,2,4	2013-06-27 21:17:42.733047	2013-06-27 21:17:42.733047
1292	206	Menu item was shown: bundle 1,3	2013-06-27 21:17:44.440962	2013-06-27 21:17:44.440962
1293	975	Menu item was shown: bundle 1,2	2013-06-27 21:17:44.927327	2013-06-27 21:17:44.927327
1294	206	Menu item was shown: bundle 1,4	2013-06-27 21:17:45.620263	2013-06-27 21:17:45.620263
1295	975	Menu item was hidden: bundle 1,2	2013-06-27 21:17:45.930695	2013-06-27 21:17:45.930695
1296	206	Menu item was shown: bundle 2,3	2013-06-27 21:17:46.556704	2013-06-27 21:17:46.556704
1297	975	Menu item was shown: bundle 1,3	2013-06-27 21:17:46.903567	2013-06-27 21:17:46.903567
1298	960	Menu item was shown: bundle 1,2,3	2013-06-27 21:17:47.349936	2013-06-27 21:17:47.349936
1299	739	Good 1 was clicked. Value is now: true	2013-06-27 21:17:47.848784	2013-06-27 21:17:47.848784
1300	975	Menu item was hidden: bundle 1,3	2013-06-27 21:17:47.948077	2013-06-27 21:17:47.948077
1301	739	Good 2 was clicked. Value is now: false	2013-06-27 21:17:48.512477	2013-06-27 21:17:48.512477
1302	739	Good 2 was clicked. Value is now: true	2013-06-27 21:17:49.001373	2013-06-27 21:17:49.001373
1303	975	Menu item was shown: bundle 1,4,5	2013-06-27 21:17:49.187246	2013-06-27 21:17:49.187246
1304	206	Menu item was shown: bundle 2,4	2013-06-27 21:17:50.004554	2013-06-27 21:17:50.004554
1305	739	Menu item was shown: bundle 1,3,4	2013-06-27 21:17:50.528318	2013-06-27 21:17:50.528318
1306	975	Menu item was hidden: bundle 1,4,5	2013-06-27 21:17:50.744191	2013-06-27 21:17:50.744191
1307	206	Menu item was shown: bundle 3,4	2013-06-27 21:17:50.837137	2013-06-27 21:17:50.837137
1308	975	Menu item was shown: bundle 1,3,5	2013-06-27 21:17:51.906131	2013-06-27 21:17:51.906131
1309	982	Menu item was shown: bundle 1,2	2013-06-27 21:17:52.91311	2013-06-27 21:17:52.91311
1310	206	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:17:54.671916	2013-06-27 21:17:54.671916
1311	982	Menu item was shown: bundle 1,3	2013-06-27 21:17:56.745865	2013-06-27 21:17:56.745865
1312	960	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:17:57.914777	2013-06-27 21:17:57.914777
1313	697	Good 2 was clicked. Value is now: false	2013-06-27 21:17:58.054225	2013-06-27 21:17:58.054225
1314	697	Good 3 was clicked. Value is now: false	2013-06-27 21:17:58.475668	2013-06-27 21:17:58.475668
1315	206	Menu item was shown: bundle 2,3,4	2013-06-27 21:17:58.730523	2013-06-27 21:17:58.730523
1316	697	Combo was clicked. Value is now: true	2013-06-27 21:17:59.403962	2013-06-27 21:17:59.403962
1317	975	Menu item was shown: bundle 2,3,5	2013-06-27 21:17:59.521845	2013-06-27 21:17:59.521845
1318	206	Menu item was shown: bundle 1,3,4	2013-06-27 21:17:59.630062	2013-06-27 21:17:59.630062
1319	982	Menu item was shown: bundle 1,4	2013-06-27 21:17:59.699513	2013-06-27 21:17:59.699513
1320	975	Menu item was shown: bundle 1,3,5	2013-06-27 21:18:00.580542	2013-06-27 21:18:00.580542
1321	206	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:00.630822	2013-06-27 21:18:00.630822
1322	975	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:01.071833	2013-06-27 21:18:01.071833
1323	975	Menu item was shown: bundle 1,4,5	2013-06-27 21:18:01.505357	2013-06-27 21:18:01.505357
1324	975	Menu item was shown: bundle 3,4,5	2013-06-27 21:18:01.928573	2013-06-27 21:18:01.928573
1325	975	Menu item was shown: bundle 2,3,5	2013-06-27 21:18:02.590133	2013-06-27 21:18:02.590133
1326	975	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:18:02.928177	2013-06-27 21:18:02.928177
1327	975	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:18:03.474871	2013-06-27 21:18:03.474871
1328	975	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:18:04.031556	2013-06-27 21:18:04.031556
1329	739	Good 2 was clicked. Value is now: false	2013-06-27 21:18:04.438264	2013-06-27 21:18:04.438264
1330	975	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:18:04.722298	2013-06-27 21:18:04.722298
1331	739	Good 3 was clicked. Value is now: true	2013-06-27 21:18:04.785445	2013-06-27 21:18:04.785445
1332	975	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:18:05.131416	2013-06-27 21:18:05.131416
1333	739	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:05.632552	2013-06-27 21:18:05.632552
1334	975	Menu item was shown: bundle 1,3,5	2013-06-27 21:18:06.346902	2013-06-27 21:18:06.346902
1335	739	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:18:06.691383	2013-06-27 21:18:06.691383
1336	411	Menu item was shown: bundle 1,2	2013-06-27 21:18:07.022124	2013-06-27 21:18:07.022124
1337	975	Good 1 was clicked. Value is now: true	2013-06-27 21:18:08.327722	2013-06-27 21:18:08.327722
1338	739	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:08.843395	2013-06-27 21:18:08.843395
1339	206	Good 1 was clicked. Value is now: true	2013-06-27 21:18:08.937899	2013-06-27 21:18:08.937899
1340	960	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:09.07858	2013-06-27 21:18:09.07858
1341	975	Good 3 was clicked. Value is now: true	2013-06-27 21:18:09.119357	2013-06-27 21:18:09.119357
1342	206	Good 2 was clicked. Value is now: true	2013-06-27 21:18:09.494773	2013-06-27 21:18:09.494773
1343	975	Good 5 was clicked. Value is now: true	2013-06-27 21:18:09.876396	2013-06-27 21:18:09.876396
1344	206	Good 4 was clicked. Value is now: true	2013-06-27 21:18:10.141772	2013-06-27 21:18:10.141772
1345	206	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:11.887976	2013-06-27 21:18:11.887976
1346	206	Menu item was shown: bundle 3,4	2013-06-27 21:18:13.782947	2013-06-27 21:18:13.782947
1347	975	Menu item was shown: bundle 1,2	2013-06-27 21:18:14.046973	2013-06-27 21:18:14.046973
1348	411	Menu item was shown: bundle 1,3	2013-06-27 21:18:14.316408	2013-06-27 21:18:14.316408
1349	206	Menu item was shown: bundle 2,4	2013-06-27 21:18:14.657312	2013-06-27 21:18:14.657312
1350	975	Menu item was shown: bundle 1,3	2013-06-27 21:18:15.018643	2013-06-27 21:18:15.018643
1351	975	Menu item was shown: bundle 1,4	2013-06-27 21:18:16.295619	2013-06-27 21:18:16.295619
1352	975	Menu item was shown: bundle 1,5	2013-06-27 21:18:16.771046	2013-06-27 21:18:16.771046
1353	975	Menu item was shown: bundle 2,4	2013-06-27 21:18:17.203567	2013-06-27 21:18:17.203567
1354	206	Menu item was shown: bundle 2,3	2013-06-27 21:18:17.513383	2013-06-27 21:18:17.513383
1355	975	Menu item was shown: bundle 1,5	2013-06-27 21:18:17.716351	2013-06-27 21:18:17.716351
1356	411	Menu item was shown: bundle 2,3	2013-06-27 21:18:19.154372	2013-06-27 21:18:19.154372
1357	206	Menu item was shown: bundle 3,4	2013-06-27 21:18:20.308616	2013-06-27 21:18:20.308616
1358	948	Menu item was shown: bundle 1,2	2013-06-27 21:18:20.641596	2013-06-27 21:18:20.641596
1359	960	Menu item was shown: bundle 1,3	2013-06-27 21:18:21.678216	2013-06-27 21:18:21.678216
1360	411	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:23.506027	2013-06-27 21:18:23.506027
1361	206	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:23.59883	2013-06-27 21:18:23.59883
1362	411	Menu item was shown: bundle 2,3	2013-06-27 21:18:24.572314	2013-06-27 21:18:24.572314
1363	1119	Combo was clicked. Value is now: true	2013-06-27 21:18:25.401623	2013-06-27 21:18:25.401623
1364	411	Good 2 was clicked. Value is now: true	2013-06-27 21:18:25.883665	2013-06-27 21:18:25.883665
1365	411	Good 3 was clicked. Value is now: true	2013-06-27 21:18:26.504607	2013-06-27 21:18:26.504607
1366	1014	Menu item was shown: bundle 1,2	2013-06-27 21:18:29.223032	2013-06-27 21:18:29.223032
1367	975	Good 3 was clicked. Value is now: false	2013-06-27 21:18:29.418622	2013-06-27 21:18:29.418622
1368	1052	Menu item was shown: bundle 1,2	2013-06-27 21:18:29.747487	2013-06-27 21:18:29.747487
1369	948	Menu item was shown: bundle 1,3	2013-06-27 21:18:30.154727	2013-06-27 21:18:30.154727
1370	1052	Menu item was shown: bundle 1,3	2013-06-27 21:18:30.680439	2013-06-27 21:18:30.680439
1371	975	Menu item was shown: bundle 2,3	2013-06-27 21:18:30.728097	2013-06-27 21:18:30.728097
1372	975	Menu item was shown: bundle 2,4	2013-06-27 21:18:31.544476	2013-06-27 21:18:31.544476
1373	1052	Menu item was shown: bundle 1,4	2013-06-27 21:18:32.159819	2013-06-27 21:18:32.159819
1374	960	Menu item was shown: bundle 1,4	2013-06-27 21:18:32.22374	2013-06-27 21:18:32.22374
1375	1014	Menu item was shown: bundle 1,3	2013-06-27 21:18:32.924014	2013-06-27 21:18:32.924014
1376	1098	Menu item was shown: bundle 1,4	2013-06-27 21:18:33.112939	2013-06-27 21:18:33.112939
1377	1052	Menu item was shown: bundle 1,5	2013-06-27 21:18:33.42706	2013-06-27 21:18:33.42706
1378	1014	Menu item was shown: bundle 1,4	2013-06-27 21:18:33.66763	2013-06-27 21:18:33.66763
1379	960	Menu item was shown: bundle 1,2	2013-06-27 21:18:34.129522	2013-06-27 21:18:34.129522
1380	975	Menu item was shown: bundle 2,5	2013-06-27 21:18:34.218631	2013-06-27 21:18:34.218631
1381	1014	Menu item was shown: bundle 1,5	2013-06-27 21:18:34.301133	2013-06-27 21:18:34.301133
1382	1052	Menu item was shown: bundle 2,3	2013-06-27 21:18:34.386986	2013-06-27 21:18:34.386986
1383	1014	Menu item was shown: bundle 2,3	2013-06-27 21:18:35.424056	2013-06-27 21:18:35.424056
1384	1014	Menu item was shown: bundle 2,4	2013-06-27 21:18:36.192667	2013-06-27 21:18:36.192667
1385	948	Good 2 was clicked. Value is now: true	2013-06-27 21:18:36.257607	2013-06-27 21:18:36.257607
1386	1014	Menu item was shown: bundle 2,5	2013-06-27 21:18:36.573607	2013-06-27 21:18:36.573607
1387	1014	Menu item was shown: bundle 3,4	2013-06-27 21:18:37.201133	2013-06-27 21:18:37.201133
1388	975	Menu item was shown: bundle 3,4	2013-06-27 21:18:37.452353	2013-06-27 21:18:37.452353
1389	975	Menu item was shown: bundle 3,5	2013-06-27 21:18:38.149034	2013-06-27 21:18:38.149034
1390	1098	Menu item was hidden: bundle 1,4	2013-06-27 21:18:38.280081	2013-06-27 21:18:38.280081
1391	960	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:40.422894	2013-06-27 21:18:40.422894
1392	960	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:41.381298	2013-06-27 21:18:41.381298
1393	1014	Menu item was shown: bundle 3,5	2013-06-27 21:18:41.878075	2013-06-27 21:18:41.878075
1394	1014	Menu item was shown: bundle 4,5	2013-06-27 21:18:42.676613	2013-06-27 21:18:42.676613
1395	1014	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:43.256612	2013-06-27 21:18:43.256612
1396	960	Menu item was shown: bundle 1,3,4	2013-06-27 21:18:43.524518	2013-06-27 21:18:43.524518
1397	1098	Menu item was shown: bundle 1,2,5	2013-06-27 21:18:43.57154	2013-06-27 21:18:43.57154
1398	948	Menu item was shown: bundle 1,4	2013-06-27 21:18:43.992327	2013-06-27 21:18:43.992327
1399	1014	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:44.46177	2013-06-27 21:18:44.46177
1400	960	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:18:44.505327	2013-06-27 21:18:44.505327
1401	1052	Good 2 was clicked. Value is now: true	2013-06-27 21:18:45.048634	2013-06-27 21:18:45.048634
1402	1014	Menu item was shown: bundle 1,2,5	2013-06-27 21:18:45.157073	2013-06-27 21:18:45.157073
1403	1052	Good 3 was clicked. Value is now: true	2013-06-27 21:18:45.448793	2013-06-27 21:18:45.448793
1404	960	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:45.842971	2013-06-27 21:18:45.842971
1405	1014	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:46.022064	2013-06-27 21:18:46.022064
1406	1052	Menu item was shown: bundle 2,4	2013-06-27 21:18:46.550226	2013-06-27 21:18:46.550226
1407	960	Menu item was shown: bundle 1,2	2013-06-27 21:18:47.210506	2013-06-27 21:18:47.210506
1408	1014	Menu item was shown: bundle 1,2,5	2013-06-27 21:18:47.3997	2013-06-27 21:18:47.3997
1409	1014	Menu item was shown: bundle 1,3,4	2013-06-27 21:18:47.930018	2013-06-27 21:18:47.930018
1410	960	Menu item was shown: bundle 1,3	2013-06-27 21:18:48.864557	2013-06-27 21:18:48.864557
1411	1052	Menu item was shown: bundle 2,5	2013-06-27 21:18:49.658332	2013-06-27 21:18:49.658332
1412	1052	Menu item was shown: bundle 3,4	2013-06-27 21:18:50.352961	2013-06-27 21:18:50.352961
1413	960	Menu item was shown: bundle 1,4	2013-06-27 21:18:51.505052	2013-06-27 21:18:51.505052
1414	1052	Menu item was shown: bundle 3,5	2013-06-27 21:18:51.711158	2013-06-27 21:18:51.711158
1415	960	Menu item was shown: bundle 2,3	2013-06-27 21:18:52.038115	2013-06-27 21:18:52.038115
1416	1014	Menu item was shown: bundle 1,3,5	2013-06-27 21:18:52.474458	2013-06-27 21:18:52.474458
1417	1014	Menu item was shown: bundle 1,4,5	2013-06-27 21:18:53.084476	2013-06-27 21:18:53.084476
1418	960	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:53.847913	2013-06-27 21:18:53.847913
1419	948	Good 2 was clicked. Value is now: false	2013-06-27 21:18:54.764321	2013-06-27 21:18:54.764321
1420	1087	Menu item was shown: bundle 1,2	2013-06-27 21:18:54.812844	2013-06-27 21:18:54.812844
1421	948	Good 3 was clicked. Value is now: true	2013-06-27 21:18:55.126922	2013-06-27 21:18:55.126922
1422	1098	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:18:55.586455	2013-06-27 21:18:55.586455
1423	960	Good 3 was clicked. Value is now: true	2013-06-27 21:18:55.684925	2013-06-27 21:18:55.684925
1424	960	Menu item was shown: bundle 1,3,4	2013-06-27 21:18:57.025744	2013-06-27 21:18:57.025744
1425	1052	Menu item was shown: bundle 4,5	2013-06-27 21:18:57.058066	2013-06-27 21:18:57.058066
1426	1014	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:57.366916	2013-06-27 21:18:57.366916
1427	1014	Menu item was shown: bundle 2,3,5	2013-06-27 21:18:58.17902	2013-06-27 21:18:58.17902
1428	960	Menu item was shown: bundle 2,3,4	2013-06-27 21:18:58.452158	2013-06-27 21:18:58.452158
1429	1014	Menu item was shown: bundle 2,4,5	2013-06-27 21:18:58.743519	2013-06-27 21:18:58.743519
1430	948	Menu item was shown: bundle 1,5	2013-06-27 21:18:58.800294	2013-06-27 21:18:58.800294
1431	1052	Menu item was shown: bundle 1,2,3	2013-06-27 21:18:58.899545	2013-06-27 21:18:58.899545
1432	1087	Menu item was shown: bundle 1,3	2013-06-27 21:18:59.141704	2013-06-27 21:18:59.141704
1433	960	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:18:59.456103	2013-06-27 21:18:59.456103
1434	1052	Menu item was shown: bundle 1,2,4	2013-06-27 21:18:59.538983	2013-06-27 21:18:59.538983
1435	1014	Menu item was shown: bundle 3,4,5	2013-06-27 21:18:59.610906	2013-06-27 21:18:59.610906
1436	1052	Menu item was shown: bundle 1,2,5	2013-06-27 21:19:00.470036	2013-06-27 21:19:00.470036
1437	1014	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:19:01.162737	2013-06-27 21:19:01.162737
1438	1098	Menu item was shown: bundle 1,2	2013-06-27 21:19:01.560048	2013-06-27 21:19:01.560048
1439	1014	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:19:01.712979	2013-06-27 21:19:01.712979
1440	1014	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:19:02.488556	2013-06-27 21:19:02.488556
1441	1098	Menu item was shown: bundle 1,3	2013-06-27 21:19:02.680406	2013-06-27 21:19:02.680406
1442	1014	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:19:03.261212	2013-06-27 21:19:03.261212
1443	1098	Menu item was shown: bundle 1,4	2013-06-27 21:19:03.600868	2013-06-27 21:19:03.600868
1444	1098	Menu item was shown: bundle 1,5	2013-06-27 21:19:04.169326	2013-06-27 21:19:04.169326
1445	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:04.458813	2013-06-27 21:19:04.458813
1446	1098	Menu item was shown: bundle 2,3	2013-06-27 21:19:04.644736	2013-06-27 21:19:04.644736
1447	1087	Menu item was shown: bundle 2,3	2013-06-27 21:19:04.950733	2013-06-27 21:19:04.950733
1448	1087	Menu item was hidden: bundle 2,3	2013-06-27 21:19:05.244392	2013-06-27 21:19:05.244392
1449	1098	Menu item was shown: bundle 2,4	2013-06-27 21:19:05.342911	2013-06-27 21:19:05.342911
1450	948	Menu item was shown: bundle 2,3	2013-06-27 21:19:05.409375	2013-06-27 21:19:05.409375
1451	960	Menu item was shown: bundle 1,3	2013-06-27 21:19:05.723152	2013-06-27 21:19:05.723152
1452	1087	Menu item was shown: bundle 2,3	2013-06-27 21:19:05.795177	2013-06-27 21:19:05.795177
1453	1098	Menu item was shown: bundle 2,3	2013-06-27 21:19:05.974066	2013-06-27 21:19:05.974066
1454	1052	Menu item was shown: bundle 1,3,4	2013-06-27 21:19:06.013389	2013-06-27 21:19:06.013389
1455	1098	Menu item was shown: bundle 2,5	2013-06-27 21:19:06.644453	2013-06-27 21:19:06.644453
1456	960	Good 2 was clicked. Value is now: false	2013-06-27 21:19:08.028108	2013-06-27 21:19:08.028108
1457	960	Good 1 was clicked. Value is now: true	2013-06-27 21:19:08.088933	2013-06-27 21:19:08.088933
1458	1098	Menu item was shown: bundle 3,4	2013-06-27 21:19:08.146632	2013-06-27 21:19:08.146632
1459	1098	Menu item was shown: bundle 3,5	2013-06-27 21:19:08.388423	2013-06-27 21:19:08.388423
1460	1052	Menu item was shown: bundle 1,3,5	2013-06-27 21:19:08.472467	2013-06-27 21:19:08.472467
1461	1014	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:09.273841	2013-06-27 21:19:09.273841
1462	1098	Menu item was shown: bundle 4,5	2013-06-27 21:19:09.327897	2013-06-27 21:19:09.327897
1463	1098	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:10.263567	2013-06-27 21:19:10.263567
1464	1098	Menu item was shown: bundle 1,2,4	2013-06-27 21:19:10.736632	2013-06-27 21:19:10.736632
1465	1087	Good 2 was clicked. Value is now: true	2013-06-27 21:19:11.502776	2013-06-27 21:19:11.502776
1466	1098	Menu item was shown: bundle 1,2,5	2013-06-27 21:19:11.600502	2013-06-27 21:19:11.600502
1467	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:11.724825	2013-06-27 21:19:11.724825
1468	1087	Good 3 was clicked. Value is now: true	2013-06-27 21:19:11.937691	2013-06-27 21:19:11.937691
1469	1098	Menu item was shown: bundle 1,3,4	2013-06-27 21:19:12.395469	2013-06-27 21:19:12.395469
1470	1014	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:12.490972	2013-06-27 21:19:12.490972
1471	1052	Menu item was shown: bundle 1,4,5	2013-06-27 21:19:12.972043	2013-06-27 21:19:12.972043
1472	1098	Menu item was shown: bundle 1,3,5	2013-06-27 21:19:13.671392	2013-06-27 21:19:13.671392
1473	1098	Menu item was shown: bundle 1,4,5	2013-06-27 21:19:14.075592	2013-06-27 21:19:14.075592
1474	1087	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:14.373442	2013-06-27 21:19:14.373442
1475	1098	Menu item was shown: bundle 2,3,4	2013-06-27 21:19:14.893217	2013-06-27 21:19:14.893217
1476	1052	Menu item was shown: bundle 2,3,4	2013-06-27 21:19:15.277229	2013-06-27 21:19:15.277229
1477	1098	Menu item was shown: bundle 2,3,5	2013-06-27 21:19:15.502082	2013-06-27 21:19:15.502082
1478	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:15.574391	2013-06-27 21:19:15.574391
1479	948	Good 3 was clicked. Value is now: false	2013-06-27 21:19:16.227484	2013-06-27 21:19:16.227484
1480	1098	Menu item was shown: bundle 2,4,5	2013-06-27 21:19:16.567589	2013-06-27 21:19:16.567589
1481	1014	Good 2 was clicked. Value is now: true	2013-06-27 21:19:16.925172	2013-06-27 21:19:16.925172
1482	948	Good 5 was clicked. Value is now: true	2013-06-27 21:19:16.968285	2013-06-27 21:19:16.968285
1483	1098	Menu item was shown: bundle 3,4,5	2013-06-27 21:19:17.103782	2013-06-27 21:19:17.103782
1484	1014	Good 3 was clicked. Value is now: true	2013-06-27 21:19:17.417566	2013-06-27 21:19:17.417566
1485	1014	Good 4 was clicked. Value is now: true	2013-06-27 21:19:17.80552	2013-06-27 21:19:17.80552
1486	1014	Good 5 was clicked. Value is now: true	2013-06-27 21:19:18.126994	2013-06-27 21:19:18.126994
1487	1098	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:19:18.267323	2013-06-27 21:19:18.267323
1488	948	Menu item was shown: bundle 2,4	2013-06-27 21:19:18.81974	2013-06-27 21:19:18.81974
1489	1098	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:19:18.892362	2013-06-27 21:19:18.892362
1490	900	Menu item was shown: bundle 1,2	2013-06-27 21:19:19.856102	2013-06-27 21:19:19.856102
1491	991	Menu item was shown: bundle 1,2	2013-06-27 21:19:19.898085	2013-06-27 21:19:19.898085
1492	1098	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:19:20.047313	2013-06-27 21:19:20.047313
1493	1098	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:19:20.676288	2013-06-27 21:19:20.676288
1494	1026	Menu item was shown: bundle 1,2	2013-06-27 21:19:21.815445	2013-06-27 21:19:21.815445
1495	1098	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:21.93115	2013-06-27 21:19:21.93115
1496	1098	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:22.290702	2013-06-27 21:19:22.290702
1497	1052	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:22.907653	2013-06-27 21:19:22.907653
1498	948	Menu item was shown: bundle 2,3	2013-06-27 21:19:23.045168	2013-06-27 21:19:23.045168
1499	991	Menu item was shown: bundle 1,3	2013-06-27 21:19:23.786041	2013-06-27 21:19:23.786041
1500	1087	Good 1 was clicked. Value is now: true	2013-06-27 21:19:24.289813	2013-06-27 21:19:24.289813
1501	1098	Good 1 was clicked. Value is now: true	2013-06-27 21:19:24.895348	2013-06-27 21:19:24.895348
1502	1098	Good 2 was clicked. Value is now: true	2013-06-27 21:19:25.261853	2013-06-27 21:19:25.261853
1503	1098	Good 5 was clicked. Value is now: true	2013-06-27 21:19:25.984836	2013-06-27 21:19:25.984836
1504	1052	Menu item was shown: bundle 1,2,4	2013-06-27 21:19:26.158327	2013-06-27 21:19:26.158327
1505	1014	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:26.358881	2013-06-27 21:19:26.358881
1506	1052	Menu item was shown: bundle 1,2,5	2013-06-27 21:19:26.741513	2013-06-27 21:19:26.741513
1507	900	Menu item was shown: bundle 1,3	2013-06-27 21:19:26.770685	2013-06-27 21:19:26.770685
1508	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:28.01428	2013-06-27 21:19:28.01428
1509	1026	Menu item was shown: bundle 1,3	2013-06-27 21:19:28.82837	2013-06-27 21:19:28.82837
1510	991	Menu item was shown: bundle 2,3	2013-06-27 21:19:28.982097	2013-06-27 21:19:28.982097
1511	1026	Menu item was shown: bundle 1,4	2013-06-27 21:19:30.01118	2013-06-27 21:19:30.01118
1512	1026	Menu item was shown: bundle 1,5	2013-06-27 21:19:30.978051	2013-06-27 21:19:30.978051
1513	1026	Menu item was shown: bundle 2,3	2013-06-27 21:19:31.81793	2013-06-27 21:19:31.81793
1514	900	Menu item was shown: bundle 2,3	2013-06-27 21:19:32.349034	2013-06-27 21:19:32.349034
1515	1026	Menu item was shown: bundle 2,4	2013-06-27 21:19:32.959146	2013-06-27 21:19:32.959146
1516	1052	Menu item was shown: bundle 1,3,4	2013-06-27 21:19:33.040496	2013-06-27 21:19:33.040496
1517	1052	Menu item was shown: bundle 1,3,5	2013-06-27 21:19:34.268001	2013-06-27 21:19:34.268001
1518	1026	Menu item was shown: bundle 2,5	2013-06-27 21:19:34.333507	2013-06-27 21:19:34.333507
1519	948	Menu item was shown: bundle 2,4	2013-06-27 21:19:34.384919	2013-06-27 21:19:34.384919
1520	1026	Menu item was shown: bundle 3,4	2013-06-27 21:19:35.182066	2013-06-27 21:19:35.182066
1521	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:35.908016	2013-06-27 21:19:35.908016
1522	1098	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:19:36.094587	2013-06-27 21:19:36.094587
1523	1026	Menu item was shown: bundle 3,5	2013-06-27 21:19:36.221358	2013-06-27 21:19:36.221358
1524	948	Menu item was shown: bundle 2,5	2013-06-27 21:19:36.28433	2013-06-27 21:19:36.28433
1525	1098	Menu item was hidden: bundle 1,2,4,5	2013-06-27 21:19:37.477461	2013-06-27 21:19:37.477461
1526	1087	Menu item was shown: bundle 2,3	2013-06-27 21:19:37.504578	2013-06-27 21:19:37.504578
1527	1026	Menu item was shown: bundle 4,5	2013-06-27 21:19:38.011097	2013-06-27 21:19:38.011097
1528	1026	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:38.593853	2013-06-27 21:19:38.593853
1529	1026	Menu item was shown: bundle 1,2,4	2013-06-27 21:19:39.748033	2013-06-27 21:19:39.748033
1530	948	Menu item was shown: bundle 3,4	2013-06-27 21:19:40.679304	2013-06-27 21:19:40.679304
1531	1026	Menu item was shown: bundle 1,2,5	2013-06-27 21:19:42.060018	2013-06-27 21:19:42.060018
1532	1098	Menu item was shown: bundle 2,4	2013-06-27 21:19:42.247954	2013-06-27 21:19:42.247954
1533	1026	Menu item was shown: bundle 1,3,4	2013-06-27 21:19:42.610174	2013-06-27 21:19:42.610174
1534	1098	Menu item was shown: bundle 1,2,4	2013-06-27 21:19:43.146175	2013-06-27 21:19:43.146175
1535	1026	Menu item was shown: bundle 1,3,5	2013-06-27 21:19:43.226466	2013-06-27 21:19:43.226466
1536	1026	Menu item was shown: bundle 1,4,5	2013-06-27 21:19:44.081465	2013-06-27 21:19:44.081465
1537	1098	Menu item was shown: bundle 1,2,5	2013-06-27 21:19:44.53512	2013-06-27 21:19:44.53512
1538	1098	Menu item was shown: bundle 1,4,5	2013-06-27 21:19:44.584036	2013-06-27 21:19:44.584036
1539	1026	Menu item was shown: bundle 2,3,4	2013-06-27 21:19:44.712797	2013-06-27 21:19:44.712797
1540	1098	Menu item was shown: bundle 2,3,4	2013-06-27 21:19:45.230699	2013-06-27 21:19:45.230699
1541	900	Menu item was shown: bundle 1,2	2013-06-27 21:19:45.334351	2013-06-27 21:19:45.334351
1542	1026	Menu item was shown: bundle 2,3,5	2013-06-27 21:19:45.744346	2013-06-27 21:19:45.744346
1543	948	Menu item was shown: bundle 3,5	2013-06-27 21:19:45.931304	2013-06-27 21:19:45.931304
1544	1052	Good 1 was clicked. Value is now: true	2013-06-27 21:19:46.588183	2013-06-27 21:19:46.588183
1545	1026	Menu item was shown: bundle 2,4,5	2013-06-27 21:19:46.65099	2013-06-27 21:19:46.65099
1546	1098	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:46.976171	2013-06-27 21:19:46.976171
1547	991	Menu item was shown: bundle 1,2	2013-06-27 21:19:47.214351	2013-06-27 21:19:47.214351
1548	1026	Menu item was shown: bundle 3,4,5	2013-06-27 21:19:47.304597	2013-06-27 21:19:47.304597
1549	1129	Menu item was shown: bundle 1,2	2013-06-27 21:19:47.498094	2013-06-27 21:19:47.498094
1550	1098	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:47.668095	2013-06-27 21:19:47.668095
1551	1052	Good 5 was clicked. Value is now: true	2013-06-27 21:19:47.771633	2013-06-27 21:19:47.771633
1552	1026	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:19:47.950491	2013-06-27 21:19:47.950491
1553	1098	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:19:48.558167	2013-06-27 21:19:48.558167
1554	1129	Menu item was hidden: bundle 1,2	2013-06-27 21:19:48.59613	2013-06-27 21:19:48.59613
1555	948	Menu item was shown: bundle 4,5	2013-06-27 21:19:48.846058	2013-06-27 21:19:48.846058
1556	1052	Good 2 was clicked. Value is now: false	2013-06-27 21:19:48.938811	2013-06-27 21:19:48.938811
1557	991	Menu item was shown: bundle 1,3	2013-06-27 21:19:49.130017	2013-06-27 21:19:49.130017
1558	1098	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:19:49.411382	2013-06-27 21:19:49.411382
1559	1026	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:19:49.584689	2013-06-27 21:19:49.584689
1560	1098	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:19:50.014665	2013-06-27 21:19:50.014665
1561	1026	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:19:50.109408	2013-06-27 21:19:50.109408
1562	1087	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:50.566394	2013-06-27 21:19:50.566394
1563	1098	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:19:50.618085	2013-06-27 21:19:50.618085
1564	1026	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:19:50.918084	2013-06-27 21:19:50.918084
1565	1052	Menu item was shown: bundle 2,3	2013-06-27 21:19:51.34865	2013-06-27 21:19:51.34865
1566	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:19:51.381126	2013-06-27 21:19:51.381126
1567	900	Menu item was shown: bundle 1,3	2013-06-27 21:19:51.707606	2013-06-27 21:19:51.707606
1568	1098	Menu item was shown: bundle 3,4,5	2013-06-27 21:19:51.833983	2013-06-27 21:19:51.833983
1569	948	Menu item was shown: bundle 1,2,3	2013-06-27 21:19:54.995559	2013-06-27 21:19:54.995559
1570	1129	Menu item was shown: bundle 1,2	2013-06-27 21:19:55.265522	2013-06-27 21:19:55.265522
1571	1129	Menu item was shown: bundle 1,3	2013-06-27 21:19:55.933259	2013-06-27 21:19:55.933259
1572	900	Menu item was shown: bundle 2,3	2013-06-27 21:19:56.455567	2013-06-27 21:19:56.455567
1573	298	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:19:56.661332	2013-06-27 21:19:56.661332
1574	1052	Menu item was shown: bundle 1,3,5	2013-06-27 21:19:56.714725	2013-06-27 21:19:56.714725
1575	1098	Menu item was shown: bundle 2,4,5	2013-06-27 21:19:56.984388	2013-06-27 21:19:56.984388
1576	1052	Menu item was shown: bundle 1,4,5	2013-06-27 21:19:57.087333	2013-06-27 21:19:57.087333
1577	1129	Menu item was shown: bundle 1,2	2013-06-27 21:19:57.207298	2013-06-27 21:19:57.207298
1578	1098	Menu item was shown: bundle 2,3,5	2013-06-27 21:19:57.574558	2013-06-27 21:19:57.574558
1579	1052	Menu item was shown: bundle 2,3,4	2013-06-27 21:19:58.281239	2013-06-27 21:19:58.281239
1580	1129	Menu item was hidden: bundle 1,2	2013-06-27 21:19:58.311031	2013-06-27 21:19:58.311031
1581	1052	Menu item was shown: bundle 2,3,5	2013-06-27 21:19:58.92541	2013-06-27 21:19:58.92541
1582	1129	Menu item was shown: bundle 1,4	2013-06-27 21:19:59.027987	2013-06-27 21:19:59.027987
1583	1052	Menu item was shown: bundle 2,4,5	2013-06-27 21:19:59.50498	2013-06-27 21:19:59.50498
1584	1129	Menu item was hidden: bundle 1,4	2013-06-27 21:19:59.752658	2013-06-27 21:19:59.752658
1585	948	Menu item was shown: bundle 1,2,4	2013-06-27 21:19:59.811179	2013-06-27 21:19:59.811179
1586	1052	Menu item was shown: bundle 3,4,5	2013-06-27 21:20:00.176054	2013-06-27 21:20:00.176054
1587	1129	Menu item was shown: bundle 2,3	2013-06-27 21:20:01.081258	2013-06-27 21:20:01.081258
1588	1052	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:01.27536	2013-06-27 21:20:01.27536
1589	221	Menu item was shown: bundle 1,2	2013-06-27 21:20:01.302424	2013-06-27 21:20:01.302424
1590	1129	Menu item was hidden: bundle 2,3	2013-06-27 21:20:01.705274	2013-06-27 21:20:01.705274
1591	1052	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:20:01.914681	2013-06-27 21:20:01.914681
1592	221	Menu item was hidden: bundle 1,2	2013-06-27 21:20:02.03921	2013-06-27 21:20:02.03921
1593	1098	Menu item was shown: bundle 2,4	2013-06-27 21:20:02.129905	2013-06-27 21:20:02.129905
1594	1129	Menu item was shown: bundle 2,4	2013-06-27 21:20:02.211095	2013-06-27 21:20:02.211095
1595	991	Menu item was shown: bundle 2,3	2013-06-27 21:20:02.331173	2013-06-27 21:20:02.331173
1596	221	Menu item was shown: bundle 1,3	2013-06-27 21:20:02.371466	2013-06-27 21:20:02.371466
1597	1098	Menu item was shown: bundle 2,5	2013-06-27 21:20:02.58793	2013-06-27 21:20:02.58793
1598	1014	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:20:02.711601	2013-06-27 21:20:02.711601
1599	1052	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:20:02.774865	2013-06-27 21:20:02.774865
1600	221	Menu item was hidden: bundle 1,3	2013-06-27 21:20:03.198047	2013-06-27 21:20:03.198047
1601	221	Menu item was shown: bundle 1,4	2013-06-27 21:20:03.532515	2013-06-27 21:20:03.532515
1602	1052	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:20:03.650003	2013-06-27 21:20:03.650003
1603	1129	Menu item was hidden: bundle 2,4	2013-06-27 21:20:04.102354	2013-06-27 21:20:04.102354
1604	1098	Menu item was shown: bundle 1,2,5	2013-06-27 21:20:04.142241	2013-06-27 21:20:04.142241
1605	221	Menu item was hidden: bundle 1,4	2013-06-27 21:20:04.428705	2013-06-27 21:20:04.428705
1606	900	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:04.463407	2013-06-27 21:20:04.463407
1607	1129	Menu item was shown: bundle 3,4	2013-06-27 21:20:04.60314	2013-06-27 21:20:04.60314
1608	221	Menu item was shown: bundle 1,5	2013-06-27 21:20:04.727889	2013-06-27 21:20:04.727889
1609	1129	Menu item was hidden: bundle 3,4	2013-06-27 21:20:05.194552	2013-06-27 21:20:05.194552
1610	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:05.428809	2013-06-27 21:20:05.428809
1611	1129	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:05.858481	2013-06-27 21:20:05.858481
1612	1026	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:06.112277	2013-06-27 21:20:06.112277
1613	1129	Menu item was hidden: bundle 1,2,3	2013-06-27 21:20:06.682438	2013-06-27 21:20:06.682438
1614	1129	Menu item was shown: bundle 1,2,4	2013-06-27 21:20:07.034573	2013-06-27 21:20:07.034573
1615	221	Menu item was hidden: bundle 1,5	2013-06-27 21:20:07.095591	2013-06-27 21:20:07.095591
1616	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:07.166397	2013-06-27 21:20:07.166397
1617	1129	Menu item was hidden: bundle 1,2,4	2013-06-27 21:20:07.840204	2013-06-27 21:20:07.840204
1618	221	Menu item was shown: bundle 2,3	2013-06-27 21:20:08.071979	2013-06-27 21:20:08.071979
1619	948	Menu item was shown: bundle 1,2,5	2013-06-27 21:20:08.364208	2013-06-27 21:20:08.364208
1620	298	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:08.585793	2013-06-27 21:20:08.585793
1621	1129	Menu item was shown: bundle 1,3,4	2013-06-27 21:20:08.728055	2013-06-27 21:20:08.728055
1622	1129	Menu item was hidden: bundle 1,3,4	2013-06-27 21:20:08.944233	2013-06-27 21:20:08.944233
1623	900	Menu item was shown: bundle 2,3	2013-06-27 21:20:09.135939	2013-06-27 21:20:09.135939
1624	1129	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:09.273992	2013-06-27 21:20:09.273992
1625	1129	Menu item was hidden: bundle 2,3,4	2013-06-27 21:20:10.080812	2013-06-27 21:20:10.080812
1626	221	Menu item was hidden: bundle 2,3	2013-06-27 21:20:10.347881	2013-06-27 21:20:10.347881
1627	1129	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:10.578582	2013-06-27 21:20:10.578582
1628	1052	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:10.72982	2013-06-27 21:20:10.72982
1629	221	Menu item was shown: bundle 2,4	2013-06-27 21:20:10.962171	2013-06-27 21:20:10.962171
1630	1129	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:20:11.23124	2013-06-27 21:20:11.23124
1631	991	Menu item was hidden: bundle 1,2,3	2013-06-27 21:20:11.403307	2013-06-27 21:20:11.403307
1632	1026	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:20:11.977039	2013-06-27 21:20:11.977039
1633	221	Menu item was shown: bundle 2,5	2013-06-27 21:20:12.143138	2013-06-27 21:20:12.143138
1634	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:12.344747	2013-06-27 21:20:12.344747
1635	1129	Menu item was shown: bundle 1,4	2013-06-27 21:20:12.455467	2013-06-27 21:20:12.455467
1636	1129	Menu item was hidden: bundle 1,4	2013-06-27 21:20:13.571042	2013-06-27 21:20:13.571042
1637	1129	Good 1 was clicked. Value is now: true	2013-06-27 21:20:15.597065	2013-06-27 21:20:15.597065
1638	1129	Good 4 was clicked. Value is now: true	2013-06-27 21:20:16.21117	2013-06-27 21:20:16.21117
1639	221	Menu item was shown: bundle 3,4	2013-06-27 21:20:16.250184	2013-06-27 21:20:16.250184
1640	221	Menu item was shown: bundle 3,5	2013-06-27 21:20:17.209605	2013-06-27 21:20:17.209605
1641	298	Good 2 was clicked. Value is now: true	2013-06-27 21:20:17.371423	2013-06-27 21:20:17.371423
1642	1026	Good 1 was clicked. Value is now: true	2013-06-27 21:20:17.449446	2013-06-27 21:20:17.449446
1643	1129	Menu item was shown: bundle 1,4	2013-06-27 21:20:17.575329	2013-06-27 21:20:17.575329
1644	1052	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:20:17.704327	2013-06-27 21:20:17.704327
1645	221	Menu item was shown: bundle 4,5	2013-06-27 21:20:17.91521	2013-06-27 21:20:17.91521
1646	1026	Good 3 was clicked. Value is now: true	2013-06-27 21:20:17.973237	2013-06-27 21:20:17.973237
1647	991	Menu item was shown: bundle 2,3	2013-06-27 21:20:18.022382	2013-06-27 21:20:18.022382
1648	298	Good 3 was clicked. Value is now: true	2013-06-27 21:20:18.05788	2013-06-27 21:20:18.05788
1649	298	Good 4 was clicked. Value is now: true	2013-06-27 21:20:18.420385	2013-06-27 21:20:18.420385
1650	1026	Good 4 was clicked. Value is now: true	2013-06-27 21:20:18.528123	2013-06-27 21:20:18.528123
1651	1014	Menu item was shown: bundle 1,2	2013-06-27 21:20:18.578062	2013-06-27 21:20:18.578062
1652	1026	Good 5 was clicked. Value is now: true	2013-06-27 21:20:18.947609	2013-06-27 21:20:18.947609
1653	298	Good 5 was clicked. Value is now: true	2013-06-27 21:20:18.976517	2013-06-27 21:20:18.976517
1654	991	Good 2 was clicked. Value is now: true	2013-06-27 21:20:19.242793	2013-06-27 21:20:19.242793
1655	991	Good 3 was clicked. Value is now: true	2013-06-27 21:20:19.596722	2013-06-27 21:20:19.596722
1656	298	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:20:20.365722	2013-06-27 21:20:20.365722
1657	221	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:20.40453	2013-06-27 21:20:20.40453
1658	991	Combo was clicked. Value is now: true	2013-06-27 21:20:20.432091	2013-06-27 21:20:20.432091
1659	1014	Menu item was shown: bundle 1,3	2013-06-27 21:20:21.120491	2013-06-27 21:20:21.120491
1660	298	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:20:21.779968	2013-06-27 21:20:21.779968
1661	1129	Menu item was hidden: bundle 1,4	2013-06-27 21:20:22.687705	2013-06-27 21:20:22.687705
1662	298	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:20:22.908001	2013-06-27 21:20:22.908001
1663	221	Menu item was shown: bundle 1,2,4	2013-06-27 21:20:23.015847	2013-06-27 21:20:23.015847
1664	298	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:23.542485	2013-06-27 21:20:23.542485
1665	1014	Menu item was shown: bundle 2,3	2013-06-27 21:20:24.192262	2013-06-27 21:20:24.192262
1666	1052	Combo was clicked. Value is now: true	2013-06-27 21:20:24.608386	2013-06-27 21:20:24.608386
1667	298	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:24.652606	2013-06-27 21:20:24.652606
1668	221	Menu item was shown: bundle 2,5	2013-06-27 21:20:25.352642	2013-06-27 21:20:25.352642
1669	1014	Menu item was shown: bundle 2,4	2013-06-27 21:20:25.565073	2013-06-27 21:20:25.565073
1670	298	Menu item was shown: bundle 3,4,5	2013-06-27 21:20:25.622524	2013-06-27 21:20:25.622524
1671	298	Menu item was shown: bundle 2,4,5	2013-06-27 21:20:26.112736	2013-06-27 21:20:26.112736
1672	221	Menu item was shown: bundle 1,2,4	2013-06-27 21:20:26.227472	2013-06-27 21:20:26.227472
1673	221	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:26.575356	2013-06-27 21:20:26.575356
1674	948	Good 1 was clicked. Value is now: true	2013-06-27 21:20:26.859854	2013-06-27 21:20:26.859854
1675	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:20:26.989493	2013-06-27 21:20:26.989493
1676	221	Menu item was shown: bundle 1,2,4	2013-06-27 21:20:27.100686	2013-06-27 21:20:27.100686
1677	900	Good 2 was clicked. Value is now: true	2013-06-27 21:20:27.139726	2013-06-27 21:20:27.139726
1678	948	Good 2 was clicked. Value is now: true	2013-06-27 21:20:27.36719	2013-06-27 21:20:27.36719
1679	221	Menu item was shown: bundle 1,2,5	2013-06-27 21:20:27.435041	2013-06-27 21:20:27.435041
1680	1014	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:27.565949	2013-06-27 21:20:27.565949
1681	900	Good 3 was clicked. Value is now: true	2013-06-27 21:20:28.014144	2013-06-27 21:20:28.014144
1682	221	Menu item was shown: bundle 1,3,4	2013-06-27 21:20:29.070605	2013-06-27 21:20:29.070605
1683	948	Menu item was shown: bundle 1,3,4	2013-06-27 21:20:29.358229	2013-06-27 21:20:29.358229
1684	221	Menu item was shown: bundle 1,3,5	2013-06-27 21:20:29.659344	2013-06-27 21:20:29.659344
1685	1014	Menu item was shown: bundle 2,3,5	2013-06-27 21:20:30.159711	2013-06-27 21:20:30.159711
1686	221	Menu item was shown: bundle 1,4,5	2013-06-27 21:20:30.330704	2013-06-27 21:20:30.330704
1687	221	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:31.096535	2013-06-27 21:20:31.096535
1688	1014	Menu item was shown: bundle 2,4,5	2013-06-27 21:20:31.416593	2013-06-27 21:20:31.416593
1689	545	Menu item was shown: bundle 1,2	2013-06-27 21:20:31.838918	2013-06-27 21:20:31.838918
1690	221	Menu item was shown: bundle 2,3,5	2013-06-27 21:20:32.301079	2013-06-27 21:20:32.301079
1691	221	Menu item was shown: bundle 2,4,5	2013-06-27 21:20:32.786141	2013-06-27 21:20:32.786141
1692	1014	Menu item was shown: bundle 3,4,5	2013-06-27 21:20:32.848467	2013-06-27 21:20:32.848467
1693	1014	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:33.669617	2013-06-27 21:20:33.669617
1694	298	Menu item was shown: bundle 2,3,5	2013-06-27 21:20:34.507271	2013-06-27 21:20:34.507271
1695	221	Menu item was shown: bundle 3,4,5	2013-06-27 21:20:34.537031	2013-06-27 21:20:34.537031
1696	545	Menu item was shown: bundle 1,3	2013-06-27 21:20:34.567516	2013-06-27 21:20:34.567516
1697	298	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:35.250996	2013-06-27 21:20:35.250996
1698	221	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:35.533004	2013-06-27 21:20:35.533004
1699	298	Menu item was shown: bundle 1,4,5	2013-06-27 21:20:36.156215	2013-06-27 21:20:36.156215
1700	298	Menu item was shown: bundle 1,3,5	2013-06-27 21:20:36.344324	2013-06-27 21:20:36.344324
1701	948	Menu item was shown: bundle 1,3,5	2013-06-27 21:20:36.4502	2013-06-27 21:20:36.4502
1702	221	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:20:37.018254	2013-06-27 21:20:37.018254
1703	298	Menu item was shown: bundle 1,3,4	2013-06-27 21:20:37.199172	2013-06-27 21:20:37.199172
1704	1014	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:20:37.263081	2013-06-27 21:20:37.263081
1705	221	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:20:37.794695	2013-06-27 21:20:37.794695
1706	1014	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:20:37.990193	2013-06-27 21:20:37.990193
1707	221	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:20:38.080041	2013-06-27 21:20:38.080041
1708	221	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:38.498375	2013-06-27 21:20:38.498375
1709	1014	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:20:38.85695	2013-06-27 21:20:38.85695
1710	226	Menu item was shown: bundle 1,2	2013-06-27 21:20:39.142664	2013-06-27 21:20:39.142664
1711	221	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:20:39.323162	2013-06-27 21:20:39.323162
1712	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:40.214101	2013-06-27 21:20:40.214101
1713	226	Menu item was hidden: bundle 1,2	2013-06-27 21:20:40.646486	2013-06-27 21:20:40.646486
1714	545	Menu item was shown: bundle 1,4	2013-06-27 21:20:42.207648	2013-06-27 21:20:42.207648
1715	221	Good 2 was clicked. Value is now: true	2013-06-27 21:20:43.342547	2013-06-27 21:20:43.342547
1716	221	Good 5 was clicked. Value is now: true	2013-06-27 21:20:43.920772	2013-06-27 21:20:43.920772
1717	226	Menu item was shown: bundle 1,3	2013-06-27 21:20:45.871663	2013-06-27 21:20:45.871663
1718	226	Menu item was hidden: bundle 1,3	2013-06-27 21:20:46.866724	2013-06-27 21:20:46.866724
1719	221	Menu item was shown: bundle 2,5	2013-06-27 21:20:47.20989	2013-06-27 21:20:47.20989
1720	221	Menu item was hidden: bundle 2,5	2013-06-27 21:20:47.526723	2013-06-27 21:20:47.526723
1721	948	Menu item was shown: bundle 1,4,5	2013-06-27 21:20:47.778166	2013-06-27 21:20:47.778166
1722	545	Menu item was shown: bundle 1,5	2013-06-27 21:20:48.845324	2013-06-27 21:20:48.845324
1723	226	Menu item was shown: bundle 1,4	2013-06-27 21:20:49.414085	2013-06-27 21:20:49.414085
1724	298	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:20:49.84494	2013-06-27 21:20:49.84494
1725	237	Combo was clicked. Value is now: true	2013-06-27 21:20:50.105373	2013-06-27 21:20:50.105373
1726	545	Menu item was shown: bundle 2,3	2013-06-27 21:20:50.392137	2013-06-27 21:20:50.392137
1727	226	Menu item was hidden: bundle 1,4	2013-06-27 21:20:50.427582	2013-06-27 21:20:50.427582
1728	948	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:52.013553	2013-06-27 21:20:52.013553
1729	226	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:20:52.171553	2013-06-27 21:20:52.171553
1730	1014	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:20:53.900931	2013-06-27 21:20:53.900931
1731	948	Menu item was shown: bundle 2,3,5	2013-06-27 21:20:56.660059	2013-06-27 21:20:56.660059
1732	298	Menu item was shown: bundle 1,2	2013-06-27 21:20:56.848816	2013-06-27 21:20:56.848816
1733	545	Good 2 was clicked. Value is now: true	2013-06-27 21:20:57.601397	2013-06-27 21:20:57.601397
1734	545	Good 3 was clicked. Value is now: true	2013-06-27 21:20:57.934804	2013-06-27 21:20:57.934804
1735	226	Menu item was shown: bundle 2,3,4	2013-06-27 21:20:58.654955	2013-06-27 21:20:58.654955
1736	545	Menu item was shown: bundle 2,4	2013-06-27 21:20:59.164619	2013-06-27 21:20:59.164619
1737	226	Menu item was shown: bundle 1,3,4	2013-06-27 21:20:59.694132	2013-06-27 21:20:59.694132
1738	545	Menu item was shown: bundle 2,5	2013-06-27 21:21:00.608141	2013-06-27 21:21:00.608141
1739	226	Menu item was shown: bundle 1,2,4	2013-06-27 21:21:00.721001	2013-06-27 21:21:00.721001
1740	237	Menu item was shown: bundle 1,3	2013-06-27 21:21:01.412166	2013-06-27 21:21:01.412166
1741	948	Menu item was shown: bundle 2,4,5	2013-06-27 21:21:01.513621	2013-06-27 21:21:01.513621
1742	237	Menu item was shown: bundle 2,3	2013-06-27 21:21:02.972477	2013-06-27 21:21:02.972477
1743	900	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:03.38434	2013-06-27 21:21:03.38434
1744	298	Menu item was shown: bundle 1,4	2013-06-27 21:21:03.458054	2013-06-27 21:21:03.458054
1745	226	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:03.815907	2013-06-27 21:21:03.815907
1746	237	Menu item was shown: bundle 1,2	2013-06-27 21:21:04.380977	2013-06-27 21:21:04.380977
1747	298	Menu item was shown: bundle 1,5	2013-06-27 21:21:04.564626	2013-06-27 21:21:04.564626
1748	545	Menu item was shown: bundle 3,4	2013-06-27 21:21:04.997976	2013-06-27 21:21:04.997976
1749	237	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:06.008921	2013-06-27 21:21:06.008921
1750	545	Menu item was shown: bundle 3,5	2013-06-27 21:21:06.032503	2013-06-27 21:21:06.032503
1751	237	Menu item was shown: bundle 2,3	2013-06-27 21:21:07.182937	2013-06-27 21:21:07.182937
1752	226	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:07.369948	2013-06-27 21:21:07.369948
1753	545	Menu item was shown: bundle 4,5	2013-06-27 21:21:07.725635	2013-06-27 21:21:07.725635
1754	237	Menu item was shown: bundle 1,3	2013-06-27 21:21:08.685977	2013-06-27 21:21:08.685977
1755	948	Menu item was shown: bundle 3,4,5	2013-06-27 21:21:10.017195	2013-06-27 21:21:10.017195
1756	298	Menu item was shown: bundle 2,3	2013-06-27 21:21:10.696343	2013-06-27 21:21:10.696343
1757	226	Good 1 was clicked. Value is now: true	2013-06-27 21:21:10.866463	2013-06-27 21:21:10.866463
1758	226	Good 2 was clicked. Value is now: true	2013-06-27 21:21:11.213724	2013-06-27 21:21:11.213724
1759	298	Menu item was shown: bundle 2,4	2013-06-27 21:21:11.245371	2013-06-27 21:21:11.245371
1760	545	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:11.355426	2013-06-27 21:21:11.355426
1761	226	Good 3 was clicked. Value is now: true	2013-06-27 21:21:11.705985	2013-06-27 21:21:11.705985
1762	900	Menu item was shown: bundle 2,3	2013-06-27 21:21:11.92606	2013-06-27 21:21:11.92606
1763	226	Good 4 was clicked. Value is now: true	2013-06-27 21:21:12.072534	2013-06-27 21:21:12.072534
1764	298	Menu item was shown: bundle 2,5	2013-06-27 21:21:12.312705	2013-06-27 21:21:12.312705
1765	298	Menu item was shown: bundle 3,4	2013-06-27 21:21:12.625772	2013-06-27 21:21:12.625772
1766	948	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:13.94457	2013-06-27 21:21:13.94457
1767	298	Menu item was shown: bundle 3,5	2013-06-27 21:21:14.948998	2013-06-27 21:21:14.948998
1768	226	Menu item was shown: bundle 1,2	2013-06-27 21:21:14.979796	2013-06-27 21:21:14.979796
1769	298	Menu item was shown: bundle 4,5	2013-06-27 21:21:14.99966	2013-06-27 21:21:14.99966
1770	298	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:15.187871	2013-06-27 21:21:15.187871
1771	298	Menu item was shown: bundle 1,2,4	2013-06-27 21:21:15.582166	2013-06-27 21:21:15.582166
1772	1014	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:21:16.535461	2013-06-27 21:21:16.535461
1773	694	Menu item was shown: bundle 1,2	2013-06-27 21:21:17.242995	2013-06-27 21:21:17.242995
1774	226	Menu item was shown: bundle 1,3	2013-06-27 21:21:17.261905	2013-06-27 21:21:17.261905
1775	237	Good 3 was clicked. Value is now: true	2013-06-27 21:21:18.377483	2013-06-27 21:21:18.377483
1776	694	Menu item was hidden: bundle 1,2	2013-06-27 21:21:18.836995	2013-06-27 21:21:18.836995
1777	226	Menu item was shown: bundle 1,4	2013-06-27 21:21:19.044717	2013-06-27 21:21:19.044717
1778	948	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:21:19.506956	2013-06-27 21:21:19.506956
1779	694	Menu item was shown: bundle 1,3	2013-06-27 21:21:19.645493	2013-06-27 21:21:19.645493
1780	730	Menu item was shown: bundle 1,2	2013-06-27 21:21:19.685799	2013-06-27 21:21:19.685799
1781	730	Menu item was shown: bundle 1,3	2013-06-27 21:21:20.054944	2013-06-27 21:21:20.054944
1782	730	Menu item was shown: bundle 2,3	2013-06-27 21:21:20.490674	2013-06-27 21:21:20.490674
1783	730	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:20.916084	2013-06-27 21:21:20.916084
1784	545	Good 1 was clicked. Value is now: true	2013-06-27 21:21:21.008144	2013-06-27 21:21:21.008144
1785	545	Menu item was shown: bundle 1,2,4	2013-06-27 21:21:22.310223	2013-06-27 21:21:22.310223
1786	226	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:22.871864	2013-06-27 21:21:22.871864
1787	298	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:21:22.948054	2013-06-27 21:21:22.948054
1788	694	Menu item was shown: bundle 1,4	2013-06-27 21:21:23.106029	2013-06-27 21:21:23.106029
1789	545	Menu item was shown: bundle 1,2,5	2013-06-27 21:21:23.126159	2013-06-27 21:21:23.126159
1790	545	Menu item was shown: bundle 1,3,4	2013-06-27 21:21:24.674036	2013-06-27 21:21:24.674036
1791	730	Good 1 was clicked. Value is now: true	2013-06-27 21:21:25.041941	2013-06-27 21:21:25.041941
1792	730	Good 2 was clicked. Value is now: true	2013-06-27 21:21:25.374887	2013-06-27 21:21:25.374887
1793	900	Menu item was shown: bundle 1,3	2013-06-27 21:21:26.270903	2013-06-27 21:21:26.270903
1794	545	Menu item was shown: bundle 1,3,5	2013-06-27 21:21:26.405917	2013-06-27 21:21:26.405917
1795	226	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:26.459673	2013-06-27 21:21:26.459673
1796	545	Menu item was shown: bundle 1,4,5	2013-06-27 21:21:26.966921	2013-06-27 21:21:26.966921
1797	545	Menu item was shown: bundle 2,3,4	2013-06-27 21:21:27.767797	2013-06-27 21:21:27.767797
1798	694	Menu item was shown: bundle 2,3	2013-06-27 21:21:28.023424	2013-06-27 21:21:28.023424
1799	545	Menu item was shown: bundle 2,3,5	2013-06-27 21:21:28.451203	2013-06-27 21:21:28.451203
1800	545	Menu item was shown: bundle 2,4,5	2013-06-27 21:21:28.955928	2013-06-27 21:21:28.955928
1801	226	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:29.091136	2013-06-27 21:21:29.091136
1802	545	Menu item was shown: bundle 3,4,5	2013-06-27 21:21:29.557784	2013-06-27 21:21:29.557784
1803	237	Menu item was shown: bundle 1,2	2013-06-27 21:21:29.859281	2013-06-27 21:21:29.859281
1804	545	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:30.32012	2013-06-27 21:21:30.32012
1805	545	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:21:30.920629	2013-06-27 21:21:30.920629
1806	730	Menu item was shown: bundle 1,2	2013-06-27 21:21:31.20791	2013-06-27 21:21:31.20791
1807	694	Menu item was shown: bundle 2,4	2013-06-27 21:21:32.610449	2013-06-27 21:21:32.610449
1808	730	Menu item was hidden: bundle 1,2	2013-06-27 21:21:33.035617	2013-06-27 21:21:33.035617
1809	545	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:21:33.209727	2013-06-27 21:21:33.209727
1810	237	Menu item was shown: bundle 2,3	2013-06-27 21:21:33.434533	2013-06-27 21:21:33.434533
1811	730	Menu item was shown: bundle 1,2	2013-06-27 21:21:33.615072	2013-06-27 21:21:33.615072
1812	730	Menu item was hidden: bundle 1,2	2013-06-27 21:21:33.649337	2013-06-27 21:21:33.649337
1813	545	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:21:33.765039	2013-06-27 21:21:33.765039
1814	545	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:21:33.821345	2013-06-27 21:21:33.821345
1815	545	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:21:33.899547	2013-06-27 21:21:33.899547
1816	948	Good 3 was clicked. Value is now: true	2013-06-27 21:21:34.149555	2013-06-27 21:21:34.149555
1817	694	Menu item was shown: bundle 3,4	2013-06-27 21:21:34.227948	2013-06-27 21:21:34.227948
1818	545	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:21:34.283979	2013-06-27 21:21:34.283979
1819	730	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:34.409691	2013-06-27 21:21:34.409691
1820	545	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:21:35.48769	2013-06-27 21:21:35.48769
1821	545	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:21:35.867288	2013-06-27 21:21:35.867288
1822	298	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:21:36.627819	2013-06-27 21:21:36.627819
1823	730	Menu item was hidden: bundle 1,2,3	2013-06-27 21:21:38.403454	2013-06-27 21:21:38.403454
1824	948	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:21:40.371649	2013-06-27 21:21:40.371649
1825	694	Menu item was shown: bundle 1,2,3	2013-06-27 21:21:41.383748	2013-06-27 21:21:41.383748
1826	694	Menu item was shown: bundle 1,2,4	2013-06-27 21:21:44.226924	2013-06-27 21:21:44.226924
1827	298	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:21:44.636761	2013-06-27 21:21:44.636761
1828	948	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:21:47.374407	2013-06-27 21:21:47.374407
1829	948	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:21:48.611013	2013-06-27 21:21:48.611013
1830	545	Good 4 was clicked. Value is now: true	2013-06-27 21:21:51.428814	2013-06-27 21:21:51.428814
1831	694	Menu item was shown: bundle 1,3,4	2013-06-27 21:21:54.1003	2013-06-27 21:21:54.1003
1832	948	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:21:55.769219	2013-06-27 21:21:55.769219
1833	545	Menu item was shown: bundle 3,4,5	2013-06-27 21:21:56.162269	2013-06-27 21:21:56.162269
1834	545	Menu item was shown: bundle 2,4,5	2013-06-27 21:22:01.358524	2013-06-27 21:22:01.358524
1835	545	Menu item was shown: bundle 2,3,5	2013-06-27 21:22:02.326948	2013-06-27 21:22:02.326948
1836	545	Menu item was shown: bundle 3,4,5	2013-06-27 21:22:02.967464	2013-06-27 21:22:02.967464
1837	545	Menu item was shown: bundle 2,4,5	2013-06-27 21:22:03.505383	2013-06-27 21:22:03.505383
1838	694	Menu item was shown: bundle 2,3,4	2013-06-27 21:22:04.563801	2013-06-27 21:22:04.563801
1839	948	Good 4 was clicked. Value is now: true	2013-06-27 21:22:06.941287	2013-06-27 21:22:06.941287
1840	956	Menu item was shown: bundle 1,2	2013-06-27 21:22:07.420601	2013-06-27 21:22:07.420601
1841	900	Menu item was shown: bundle 1,2	2013-06-27 21:22:08.128736	2013-06-27 21:22:08.128736
1842	694	Menu item was shown: bundle 1,3,4	2013-06-27 21:22:08.675111	2013-06-27 21:22:08.675111
1843	545	Menu item was shown: bundle 2,3,5	2013-06-27 21:22:09.23859	2013-06-27 21:22:09.23859
1844	694	Menu item was shown: bundle 2,3,4	2013-06-27 21:22:09.636614	2013-06-27 21:22:09.636614
1845	545	Menu item was shown: bundle 2,3,4	2013-06-27 21:22:10.12664	2013-06-27 21:22:10.12664
1846	545	Menu item was shown: bundle 1,4,5	2013-06-27 21:22:10.763179	2013-06-27 21:22:10.763179
1847	956	Menu item was shown: bundle 1,3	2013-06-27 21:22:10.826414	2013-06-27 21:22:10.826414
1848	545	Menu item was shown: bundle 1,3,5	2013-06-27 21:22:11.332997	2013-06-27 21:22:11.332997
1849	956	Menu item was shown: bundle 1,4	2013-06-27 21:22:13.982924	2013-06-27 21:22:13.982924
1850	202	Menu item was shown: bundle 1,2	2013-06-27 21:22:15.911811	2013-06-27 21:22:15.911811
1851	545	Menu item was shown: bundle 1,3,4	2013-06-27 21:22:16.164587	2013-06-27 21:22:16.164587
1852	202	Menu item was shown: bundle 1,3	2013-06-27 21:22:16.675815	2013-06-27 21:22:16.675815
1853	694	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:22:16.953245	2013-06-27 21:22:16.953245
1854	956	Menu item was shown: bundle 1,5	2013-06-27 21:22:17.060523	2013-06-27 21:22:17.060523
1855	202	Menu item was shown: bundle 1,4	2013-06-27 21:22:17.807448	2013-06-27 21:22:17.807448
1856	545	Menu item was shown: bundle 1,2,5	2013-06-27 21:22:18.164494	2013-06-27 21:22:18.164494
1857	545	Menu item was shown: bundle 1,2,4	2013-06-27 21:22:18.320389	2013-06-27 21:22:18.320389
1858	202	Menu item was shown: bundle 1,5	2013-06-27 21:22:18.453866	2013-06-27 21:22:18.453866
1859	545	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:18.876304	2013-06-27 21:22:18.876304
1860	956	Menu item was shown: bundle 2,3	2013-06-27 21:22:20.100092	2013-06-27 21:22:20.100092
1861	202	Menu item was shown: bundle 2,3	2013-06-27 21:22:20.134606	2013-06-27 21:22:20.134606
1862	948	Menu item was shown: bundle 1,2	2013-06-27 21:22:20.275747	2013-06-27 21:22:20.275747
1863	694	Menu item was shown: bundle 2,3,4	2013-06-27 21:22:20.744859	2013-06-27 21:22:20.744859
1864	694	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:22:21.952797	2013-06-27 21:22:21.952797
1865	900	Menu item was shown: bundle 1,3	2013-06-27 21:22:23.225503	2013-06-27 21:22:23.225503
1866	948	Menu item was shown: bundle 1,3	2013-06-27 21:22:24.293915	2013-06-27 21:22:24.293915
1867	237	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:24.580663	2013-06-27 21:22:24.580663
1868	948	Menu item was shown: bundle 1,4	2013-06-27 21:22:25.066018	2013-06-27 21:22:25.066018
1869	237	Menu item was shown: bundle 1,3	2013-06-27 21:22:25.829733	2013-06-27 21:22:25.829733
1870	545	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:22:27.056893	2013-06-27 21:22:27.056893
1871	956	Good 2 was clicked. Value is now: true	2013-06-27 21:22:27.321367	2013-06-27 21:22:27.321367
1872	202	Good 2 was clicked. Value is now: true	2013-06-27 21:22:27.390237	2013-06-27 21:22:27.390237
1873	237	Menu item was shown: bundle 1,2	2013-06-27 21:22:27.423943	2013-06-27 21:22:27.423943
1874	202	Good 3 was clicked. Value is now: true	2013-06-27 21:22:27.568184	2013-06-27 21:22:27.568184
1875	956	Good 3 was clicked. Value is now: true	2013-06-27 21:22:27.696684	2013-06-27 21:22:27.696684
1876	948	Menu item was shown: bundle 1,5	2013-06-27 21:22:28.074934	2013-06-27 21:22:28.074934
1877	956	Menu item was shown: bundle 2,4	2013-06-27 21:22:28.923739	2013-06-27 21:22:28.923739
1878	202	Menu item was shown: bundle 2,4	2013-06-27 21:22:29.154351	2013-06-27 21:22:29.154351
1879	948	Menu item was shown: bundle 2,3	2013-06-27 21:22:29.597088	2013-06-27 21:22:29.597088
1880	948	Menu item was shown: bundle 2,4	2013-06-27 21:22:31.581398	2013-06-27 21:22:31.581398
1881	948	Menu item was shown: bundle 2,5	2013-06-27 21:22:32.382001	2013-06-27 21:22:32.382001
1882	956	Menu item was shown: bundle 2,5	2013-06-27 21:22:33.422451	2013-06-27 21:22:33.422451
1883	948	Menu item was shown: bundle 3,4	2013-06-27 21:22:33.827775	2013-06-27 21:22:33.827775
1884	948	Menu item was shown: bundle 3,5	2013-06-27 21:22:35.112717	2013-06-27 21:22:35.112717
1885	948	Menu item was shown: bundle 4,5	2013-06-27 21:22:36.498623	2013-06-27 21:22:36.498623
1886	956	Menu item was shown: bundle 3,4	2013-06-27 21:22:36.916602	2013-06-27 21:22:36.916602
1887	948	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:37.899089	2013-06-27 21:22:37.899089
1888	202	Menu item was shown: bundle 2,5	2013-06-27 21:22:38.459933	2013-06-27 21:22:38.459933
1889	948	Menu item was shown: bundle 1,2,4	2013-06-27 21:22:38.666027	2013-06-27 21:22:38.666027
1890	202	Menu item was shown: bundle 3,4	2013-06-27 21:22:39.277664	2013-06-27 21:22:39.277664
1891	948	Menu item was shown: bundle 1,2,5	2013-06-27 21:22:39.755541	2013-06-27 21:22:39.755541
1892	202	Menu item was shown: bundle 3,5	2013-06-27 21:22:40.13473	2013-06-27 21:22:40.13473
1893	956	Menu item was shown: bundle 3,5	2013-06-27 21:22:40.947235	2013-06-27 21:22:40.947235
1894	202	Menu item was shown: bundle 4,5	2013-06-27 21:22:41.114047	2013-06-27 21:22:41.114047
1895	948	Menu item was shown: bundle 1,3,4	2013-06-27 21:22:41.457986	2013-06-27 21:22:41.457986
1896	948	Menu item was shown: bundle 1,3,5	2013-06-27 21:22:42.400324	2013-06-27 21:22:42.400324
1897	202	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:42.613352	2013-06-27 21:22:42.613352
1898	948	Menu item was shown: bundle 1,4,5	2013-06-27 21:22:43.501575	2013-06-27 21:22:43.501575
1899	900	Menu item was shown: bundle 2,3	2013-06-27 21:22:43.970389	2013-06-27 21:22:43.970389
1900	694	Combo was clicked. Value is now: true	2013-06-27 21:22:44.654936	2013-06-27 21:22:44.654936
1901	948	Menu item was shown: bundle 2,3,4	2013-06-27 21:22:45.231421	2013-06-27 21:22:45.231421
1902	956	Menu item was shown: bundle 4,5	2013-06-27 21:22:45.561096	2013-06-27 21:22:45.561096
1903	977	Menu item was shown: bundle 1,2	2013-06-27 21:22:46.405686	2013-06-27 21:22:46.405686
1904	948	Menu item was shown: bundle 2,3,5	2013-06-27 21:22:47.463547	2013-06-27 21:22:47.463547
1905	202	Menu item was shown: bundle 1,2,4	2013-06-27 21:22:48.02502	2013-06-27 21:22:48.02502
1906	202	Menu item was shown: bundle 1,2,5	2013-06-27 21:22:48.523906	2013-06-27 21:22:48.523906
1907	956	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:48.68111	2013-06-27 21:22:48.68111
1908	948	Menu item was shown: bundle 2,4,5	2013-06-27 21:22:49.15033	2013-06-27 21:22:49.15033
1909	694	Good 4 was clicked. Value is now: true	2013-06-27 21:22:49.578174	2013-06-27 21:22:49.578174
1910	948	Menu item was shown: bundle 3,4,5	2013-06-27 21:22:50.72087	2013-06-27 21:22:50.72087
1911	694	Good 2 was clicked. Value is now: true	2013-06-27 21:22:50.884486	2013-06-27 21:22:50.884486
1912	956	Menu item was hidden: bundle 1,2,3	2013-06-27 21:22:51.037649	2013-06-27 21:22:51.037649
1913	956	Menu item was shown: bundle 1,2,3	2013-06-27 21:22:52.13672	2013-06-27 21:22:52.13672
1914	694	Good 3 was clicked. Value is now: true	2013-06-27 21:22:52.381422	2013-06-27 21:22:52.381422
1915	974	Menu item was shown: bundle 1,2	2013-06-27 21:22:52.497994	2013-06-27 21:22:52.497994
1916	956	Menu item was shown: bundle 1,2,4	2013-06-27 21:22:52.607816	2013-06-27 21:22:52.607816
1917	974	Menu item was hidden: bundle 1,2	2013-06-27 21:22:53.152184	2013-06-27 21:22:53.152184
1918	948	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:22:53.392097	2013-06-27 21:22:53.392097
1919	974	Menu item was shown: bundle 1,3	2013-06-27 21:22:53.54897	2013-06-27 21:22:53.54897
1920	974	Menu item was hidden: bundle 1,3	2013-06-27 21:22:54.534052	2013-06-27 21:22:54.534052
1921	956	Menu item was shown: bundle 1,2,5	2013-06-27 21:22:56.073003	2013-06-27 21:22:56.073003
1922	202	Good 3 was clicked. Value is now: false	2013-06-27 21:22:56.100592	2013-06-27 21:22:56.100592
1923	948	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:22:56.122545	2013-06-27 21:22:56.122545
1924	974	Menu item was shown: bundle 1,4	2013-06-27 21:22:56.154501	2013-06-27 21:22:56.154501
1925	694	Menu item was shown: bundle 1,3	2013-06-27 21:22:56.43024	2013-06-27 21:22:56.43024
1926	977	Menu item was hidden: bundle 1,2	2013-06-27 21:22:56.583863	2013-06-27 21:22:56.583863
1927	202	Good 2 was clicked. Value is now: false	2013-06-27 21:22:56.628419	2013-06-27 21:22:56.628419
1928	977	Menu item was shown: bundle 1,2	2013-06-27 21:22:57.180464	2013-06-27 21:22:57.180464
1929	202	Good 1 was clicked. Value is now: true	2013-06-27 21:22:57.213136	2013-06-27 21:22:57.213136
1930	974	Menu item was hidden: bundle 1,4	2013-06-27 21:22:57.278025	2013-06-27 21:22:57.278025
1931	948	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:22:57.514153	2013-06-27 21:22:57.514153
1932	202	Good 2 was clicked. Value is now: true	2013-06-27 21:22:57.541333	2013-06-27 21:22:57.541333
1933	694	Menu item was hidden: bundle 1,3	2013-06-27 21:22:58.203072	2013-06-27 21:22:58.203072
1934	202	Good 5 was clicked. Value is now: true	2013-06-27 21:22:58.508754	2013-06-27 21:22:58.508754
1935	948	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:22:58.640366	2013-06-27 21:22:58.640366
1936	974	Menu item was shown: bundle 1,4	2013-06-27 21:22:59.073642	2013-06-27 21:22:59.073642
1937	977	Menu item was shown: bundle 1,3	2013-06-27 21:22:59.203702	2013-06-27 21:22:59.203702
1938	694	Menu item was shown: bundle 1,4	2013-06-27 21:22:59.533594	2013-06-27 21:22:59.533594
1939	948	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:22:59.869542	2013-06-27 21:22:59.869542
1940	694	Menu item was shown: bundle 1,2	2013-06-27 21:23:01.147928	2013-06-27 21:23:01.147928
1941	974	Menu item was shown: bundle 1,5	2013-06-27 21:23:01.375476	2013-06-27 21:23:01.375476
1942	948	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:23:02.708972	2013-06-27 21:23:02.708972
1943	694	Menu item was shown: bundle 2,4	2013-06-27 21:23:03.051491	2013-06-27 21:23:03.051491
1944	974	Menu item was shown: bundle 2,3	2013-06-27 21:23:03.138229	2013-06-27 21:23:03.138229
1945	202	Menu item was shown: bundle 1,3,4	2013-06-27 21:23:03.522632	2013-06-27 21:23:03.522632
1946	202	Menu item was shown: bundle 1,3,5	2013-06-27 21:23:04.357912	2013-06-27 21:23:04.357912
1947	202	Menu item was shown: bundle 1,4,5	2013-06-27 21:23:04.97062	2013-06-27 21:23:04.97062
1948	974	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:05.278407	2013-06-27 21:23:05.278407
1949	977	Menu item was shown: bundle 2,3	2013-06-27 21:23:05.617638	2013-06-27 21:23:05.617638
1950	974	Menu item was shown: bundle 1,2,4	2013-06-27 21:23:06.379501	2013-06-27 21:23:06.379501
1951	974	Menu item was shown: bundle 1,2,5	2013-06-27 21:23:07.117936	2013-06-27 21:23:07.117936
1952	974	Menu item was shown: bundle 1,3,4	2013-06-27 21:23:07.924063	2013-06-27 21:23:07.924063
1953	977	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:08.295966	2013-06-27 21:23:08.295966
1954	956	Menu item was shown: bundle 2,3	2013-06-27 21:23:09.459524	2013-06-27 21:23:09.459524
1955	202	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:23:10.969621	2013-06-27 21:23:10.969621
1956	202	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:23:13.778095	2013-06-27 21:23:13.778095
1957	948	Menu item was shown: bundle 1,2	2013-06-27 21:23:13.884554	2013-06-27 21:23:13.884554
1958	977	Menu item was shown: bundle 1,2	2013-06-27 21:23:14.146452	2013-06-27 21:23:14.146452
1959	956	Menu item was shown: bundle 1,2,4	2013-06-27 21:23:15.27802	2013-06-27 21:23:15.27802
1960	202	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:23:16.023979	2013-06-27 21:23:16.023979
1961	974	Good 1 was clicked. Value is now: true	2013-06-27 21:23:16.055128	2013-06-27 21:23:16.055128
1962	202	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:23:16.717033	2013-06-27 21:23:16.717033
1963	974	Good 3 was clicked. Value is now: true	2013-06-27 21:23:16.838795	2013-06-27 21:23:16.838795
1964	977	Menu item was shown: bundle 1,3	2013-06-27 21:23:17.168227	2013-06-27 21:23:17.168227
1965	974	Good 4 was clicked. Value is now: true	2013-06-27 21:23:17.650888	2013-06-27 21:23:17.650888
1966	202	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:23:17.866607	2013-06-27 21:23:17.866607
1967	956	Menu item was shown: bundle 1,2,5	2013-06-27 21:23:18.497001	2013-06-27 21:23:18.497001
1968	977	Menu item was shown: bundle 2,3	2013-06-27 21:23:18.594804	2013-06-27 21:23:18.594804
1969	974	Menu item was shown: bundle 1,3,5	2013-06-27 21:23:20.377149	2013-06-27 21:23:20.377149
1970	974	Menu item was shown: bundle 1,4,5	2013-06-27 21:23:21.118177	2013-06-27 21:23:21.118177
1971	977	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:21.317519	2013-06-27 21:23:21.317519
1972	1008	Menu item was shown: bundle 1,2	2013-06-27 21:23:23.321745	2013-06-27 21:23:23.321745
1973	977	Combo was clicked. Value is now: true	2013-06-27 21:23:23.378014	2013-06-27 21:23:23.378014
1974	202	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:23:23.941495	2013-06-27 21:23:23.941495
1975	956	Menu item was shown: bundle 1,3,4	2013-06-27 21:23:24.354732	2013-06-27 21:23:24.354732
1976	1008	Menu item was shown: bundle 1,3	2013-06-27 21:23:24.389282	2013-06-27 21:23:24.389282
1977	1008	Menu item was shown: bundle 1,4	2013-06-27 21:23:24.493668	2013-06-27 21:23:24.493668
1978	202	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:25.309779	2013-06-27 21:23:25.309779
1979	202	Menu item was shown: bundle 3,4,5	2013-06-27 21:23:26.288445	2013-06-27 21:23:26.288445
1980	956	Menu item was shown: bundle 1,3,5	2013-06-27 21:23:27.07281	2013-06-27 21:23:27.07281
1981	1106	Menu item was shown: bundle 1,2	2013-06-27 21:23:27.311739	2013-06-27 21:23:27.311739
1982	991	Menu item was shown: bundle 1,3	2013-06-27 21:23:27.392539	2013-06-27 21:23:27.392539
1983	956	Menu item was shown: bundle 1,4,5	2013-06-27 21:23:28.208615	2013-06-27 21:23:28.208615
1984	202	Menu item was shown: bundle 2,4,5	2013-06-27 21:23:28.26233	2013-06-27 21:23:28.26233
1985	1008	Menu item was shown: bundle 1,5	2013-06-27 21:23:28.548262	2013-06-27 21:23:28.548262
1986	974	Menu item was shown: bundle 2,3,5	2013-06-27 21:23:29.418191	2013-06-27 21:23:29.418191
1987	202	Menu item was shown: bundle 2,3,5	2013-06-27 21:23:29.751758	2013-06-27 21:23:29.751758
1988	1008	Menu item was shown: bundle 2,3	2013-06-27 21:23:31.074703	2013-06-27 21:23:31.074703
1989	1008	Menu item was shown: bundle 2,4	2013-06-27 21:23:31.40287	2013-06-27 21:23:31.40287
1990	956	Menu item was shown: bundle 2,3,4	2013-06-27 21:23:31.883412	2013-06-27 21:23:31.883412
1991	202	Combo was clicked. Value is now: true	2013-06-27 21:23:31.926967	2013-06-27 21:23:31.926967
1992	1008	Menu item was shown: bundle 2,5	2013-06-27 21:23:33.710686	2013-06-27 21:23:33.710686
1993	991	Menu item was shown: bundle 1,2	2013-06-27 21:23:33.867996	2013-06-27 21:23:33.867996
1994	1008	Menu item was shown: bundle 3,4	2013-06-27 21:23:34.189637	2013-06-27 21:23:34.189637
1995	974	Menu item was shown: bundle 2,4,5	2013-06-27 21:23:35.527925	2013-06-27 21:23:35.527925
1996	991	Menu item was shown: bundle 2,3	2013-06-27 21:23:35.658777	2013-06-27 21:23:35.658777
1997	977	Menu item was shown: bundle 1,2	2013-06-27 21:23:35.77511	2013-06-27 21:23:35.77511
1998	974	Menu item was shown: bundle 3,4,5	2013-06-27 21:23:36.675114	2013-06-27 21:23:36.675114
1999	956	Menu item was shown: bundle 2,3,5	2013-06-27 21:23:36.874874	2013-06-27 21:23:36.874874
2000	974	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:37.185557	2013-06-27 21:23:37.185557
2001	974	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:23:37.794479	2013-06-27 21:23:37.794479
2002	1008	Menu item was shown: bundle 3,5	2013-06-27 21:23:38.013239	2013-06-27 21:23:38.013239
2003	974	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:23:38.387946	2013-06-27 21:23:38.387946
2004	956	Menu item was shown: bundle 2,4,5	2013-06-27 21:23:38.540856	2013-06-27 21:23:38.540856
2005	1008	Menu item was shown: bundle 4,5	2013-06-27 21:23:38.679743	2013-06-27 21:23:38.679743
2006	974	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:23:39.251017	2013-06-27 21:23:39.251017
2007	956	Menu item was shown: bundle 3,4,5	2013-06-27 21:23:39.591177	2013-06-27 21:23:39.591177
2008	991	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:39.655885	2013-06-27 21:23:39.655885
2009	1008	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:40.183561	2013-06-27 21:23:40.183561
2010	1106	Menu item was shown: bundle 1,3	2013-06-27 21:23:41.361828	2013-06-27 21:23:41.361828
2011	1008	Menu item was shown: bundle 1,2,4	2013-06-27 21:23:41.446717	2013-06-27 21:23:41.446717
2012	956	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:41.654513	2013-06-27 21:23:41.654513
2013	1105	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:23:42.077869	2013-06-27 21:23:42.077869
2014	416	Menu item was shown: bundle 1,2	2013-06-27 21:23:42.404692	2013-06-27 21:23:42.404692
2015	947	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:42.483769	2013-06-27 21:23:42.483769
2016	1105	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:23:42.804305	2013-06-27 21:23:42.804305
2017	956	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:23:43.733219	2013-06-27 21:23:43.733219
2018	416	Menu item was shown: bundle 1,3	2013-06-27 21:23:43.982379	2013-06-27 21:23:43.982379
2019	977	Menu item was shown: bundle 1,2,3	2013-06-27 21:23:44.291433	2013-06-27 21:23:44.291433
2020	956	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:23:44.357505	2013-06-27 21:23:44.357505
2021	974	Good 2 was clicked. Value is now: true	2013-06-27 21:23:45.985891	2013-06-27 21:23:45.985891
2022	1008	Menu item was shown: bundle 1,2,5	2013-06-27 21:23:46.704406	2013-06-27 21:23:46.704406
2023	1008	Menu item was shown: bundle 1,3,4	2013-06-27 21:23:47.496281	2013-06-27 21:23:47.496281
2024	974	Good 3 was clicked. Value is now: false	2013-06-27 21:23:47.646203	2013-06-27 21:23:47.646203
2025	947	Good 4 was clicked. Value is now: true	2013-06-27 21:23:47.694878	2013-06-27 21:23:47.694878
2026	1105	Good 1 was clicked. Value is now: true	2013-06-27 21:23:47.938327	2013-06-27 21:23:47.938327
2027	947	Good 3 was clicked. Value is now: true	2013-06-27 21:23:48.300223	2013-06-27 21:23:48.300223
2028	974	Good 5 was clicked. Value is now: true	2013-06-27 21:23:48.336585	2013-06-27 21:23:48.336585
2029	1105	Good 2 was clicked. Value is now: true	2013-06-27 21:23:48.417889	2013-06-27 21:23:48.417889
2030	947	Good 2 was clicked. Value is now: true	2013-06-27 21:23:48.662007	2013-06-27 21:23:48.662007
2031	1105	Good 3 was clicked. Value is now: true	2013-06-27 21:23:48.776598	2013-06-27 21:23:48.776598
2032	947	Good 1 was clicked. Value is now: true	2013-06-27 21:23:49.10376	2013-06-27 21:23:49.10376
2033	1105	Good 4 was clicked. Value is now: true	2013-06-27 21:23:49.168489	2013-06-27 21:23:49.168489
2034	1008	Menu item was shown: bundle 1,3,5	2013-06-27 21:23:49.985084	2013-06-27 21:23:49.985084
2035	416	Good 1 was clicked. Value is now: true	2013-06-27 21:23:50.011605	2013-06-27 21:23:50.011605
2036	1044	Menu item was shown: bundle 1,2	2013-06-27 21:23:50.473039	2013-06-27 21:23:50.473039
2037	416	Good 3 was clicked. Value is now: true	2013-06-27 21:23:50.655867	2013-06-27 21:23:50.655867
2038	1008	Menu item was shown: bundle 1,4,5	2013-06-27 21:23:51.314758	2013-06-27 21:23:51.314758
2039	956	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:23:51.937927	2013-06-27 21:23:51.937927
2040	1105	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:52.552262	2013-06-27 21:23:52.552262
2041	416	Menu item was shown: bundle 1,4	2013-06-27 21:23:53.628923	2013-06-27 21:23:53.628923
2042	947	Menu item was shown: bundle 2,3,4	2013-06-27 21:23:54.002106	2013-06-27 21:23:54.002106
2043	956	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:23:54.783662	2013-06-27 21:23:54.783662
2044	1044	Menu item was shown: bundle 1,3	2013-06-27 21:23:55.801488	2013-06-27 21:23:55.801488
2045	974	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:23:56.711379	2013-06-27 21:23:56.711379
2046	974	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:23:57.285493	2013-06-27 21:23:57.285493
2047	1044	Menu item was shown: bundle 1,4	2013-06-27 21:23:57.438047	2013-06-27 21:23:57.438047
2048	974	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:23:57.857949	2013-06-27 21:23:57.857949
2049	947	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:23:57.990175	2013-06-27 21:23:57.990175
2050	1105	Menu item was shown: bundle 1,2	2013-06-27 21:23:58.038001	2013-06-27 21:23:58.038001
2051	974	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:23:58.566997	2013-06-27 21:23:58.566997
2052	974	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:23:59.387116	2013-06-27 21:23:59.387116
2053	1008	Menu item was shown: bundle 2,3,4	2013-06-27 21:23:59.7997	2013-06-27 21:23:59.7997
2054	947	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:00.303616	2013-06-27 21:24:00.303616
2055	1105	Menu item was hidden: bundle 1,2	2013-06-27 21:24:00.841725	2013-06-27 21:24:00.841725
2056	956	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:24:00.905613	2013-06-27 21:24:00.905613
2057	1044	Menu item was shown: bundle 2,3	2013-06-27 21:24:01.25725	2013-06-27 21:24:01.25725
2058	1105	Menu item was shown: bundle 1,3	2013-06-27 21:24:02.401723	2013-06-27 21:24:02.401723
2059	947	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:02.78873	2013-06-27 21:24:02.78873
2060	1105	Menu item was hidden: bundle 1,3	2013-06-27 21:24:03.085142	2013-06-27 21:24:03.085142
2061	1105	Menu item was shown: bundle 1,4	2013-06-27 21:24:03.813834	2013-06-27 21:24:03.813834
2062	1008	Menu item was shown: bundle 2,3,5	2013-06-27 21:24:04.021364	2013-06-27 21:24:04.021364
2063	1044	Menu item was shown: bundle 2,4	2013-06-27 21:24:04.325298	2013-06-27 21:24:04.325298
2064	1008	Menu item was shown: bundle 2,4,5	2013-06-27 21:24:04.664916	2013-06-27 21:24:04.664916
2065	1105	Menu item was hidden: bundle 1,4	2013-06-27 21:24:04.874628	2013-06-27 21:24:04.874628
2066	1105	Menu item was shown: bundle 1,5	2013-06-27 21:24:04.980057	2013-06-27 21:24:04.980057
2067	1008	Menu item was shown: bundle 3,4,5	2013-06-27 21:24:05.069981	2013-06-27 21:24:05.069981
2068	974	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:24:05.286189	2013-06-27 21:24:05.286189
2069	416	Menu item was shown: bundle 1,5	2013-06-27 21:24:05.986643	2013-06-27 21:24:05.986643
2070	974	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:24:06.234355	2013-06-27 21:24:06.234355
2071	1008	Menu item was shown: bundle 1,4,5	2013-06-27 21:24:06.665141	2013-06-27 21:24:06.665141
2072	416	Menu item was shown: bundle 2,3	2013-06-27 21:24:07.258675	2013-06-27 21:24:07.258675
2073	1044	Menu item was shown: bundle 3,4	2013-06-27 21:24:08.013334	2013-06-27 21:24:08.013334
2074	1008	Good 1 was clicked. Value is now: true	2013-06-27 21:24:08.084934	2013-06-27 21:24:08.084934
2075	947	Menu item was shown: bundle 1,2,4	2013-06-27 21:24:08.703053	2013-06-27 21:24:08.703053
2076	1008	Good 4 was clicked. Value is now: true	2013-06-27 21:24:08.863805	2013-06-27 21:24:08.863805
2077	1008	Good 5 was clicked. Value is now: true	2013-06-27 21:24:08.999766	2013-06-27 21:24:08.999766
2078	1044	Menu item was shown: bundle 1,2,3	2013-06-27 21:24:09.421624	2013-06-27 21:24:09.421624
2079	956	Menu item was shown: bundle 2,3	2013-06-27 21:24:09.738052	2013-06-27 21:24:09.738052
2080	1105	Good 2 was clicked. Value is now: false	2013-06-27 21:24:10.242376	2013-06-27 21:24:10.242376
2081	1044	Menu item was shown: bundle 1,2,4	2013-06-27 21:24:10.420537	2013-06-27 21:24:10.420537
2082	1105	Good 3 was clicked. Value is now: false	2013-06-27 21:24:10.590337	2013-06-27 21:24:10.590337
2083	947	Menu item was shown: bundle 1,2,3	2013-06-27 21:24:10.699578	2013-06-27 21:24:10.699578
2084	1105	Good 4 was clicked. Value is now: false	2013-06-27 21:24:10.827889	2013-06-27 21:24:10.827889
2085	1105	Good 5 was clicked. Value is now: true	2013-06-27 21:24:11.175869	2013-06-27 21:24:11.175869
2086	1008	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:11.965744	2013-06-27 21:24:11.965744
2087	416	Menu item was shown: bundle 2,4	2013-06-27 21:24:12.399186	2013-06-27 21:24:12.399186
2088	1008	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:24:13.344836	2013-06-27 21:24:13.344836
2089	947	Menu item was shown: bundle 3,4	2013-06-27 21:24:13.512434	2013-06-27 21:24:13.512434
2090	1008	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:24:14.115584	2013-06-27 21:24:14.115584
2091	947	Menu item was shown: bundle 2,4	2013-06-27 21:24:14.259263	2013-06-27 21:24:14.259263
2092	1008	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:24:15.130696	2013-06-27 21:24:15.130696
2093	947	Menu item was shown: bundle 2,3	2013-06-27 21:24:15.504705	2013-06-27 21:24:15.504705
2094	1105	Menu item was shown: bundle 2,3	2013-06-27 21:24:15.554192	2013-06-27 21:24:15.554192
2095	416	Menu item was shown: bundle 2,5	2013-06-27 21:24:16.211982	2013-06-27 21:24:16.211982
2096	1008	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:24:16.440047	2013-06-27 21:24:16.440047
2097	974	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:24:16.778274	2013-06-27 21:24:16.778274
2098	1008	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:24:17.332563	2013-06-27 21:24:17.332563
2099	1044	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:17.967275	2013-06-27 21:24:17.967275
2100	974	Menu item was hidden: bundle 1,2,4,5	2013-06-27 21:24:18.226375	2013-06-27 21:24:18.226375
2101	974	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:24:18.679396	2013-06-27 21:24:18.679396
2102	1105	Menu item was shown: bundle 1,2,3	2013-06-27 21:24:19.123645	2013-06-27 21:24:19.123645
2103	974	Menu item was hidden: bundle 1,2,3,5	2013-06-27 21:24:19.321366	2013-06-27 21:24:19.321366
2104	947	Menu item was shown: bundle 1,4	2013-06-27 21:24:19.991675	2013-06-27 21:24:19.991675
2105	1105	Menu item was shown: bundle 1,2,4	2013-06-27 21:24:20.648422	2013-06-27 21:24:20.648422
2106	1105	Menu item was shown: bundle 1,2,5	2013-06-27 21:24:21.436526	2013-06-27 21:24:21.436526
2107	1105	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:21.757685	2013-06-27 21:24:21.757685
2108	947	Menu item was shown: bundle 1,3	2013-06-27 21:24:22.914729	2013-06-27 21:24:22.914729
2109	1106	Menu item was shown: bundle 1,2	2013-06-27 21:24:23.101891	2013-06-27 21:24:23.101891
2110	1105	Menu item was shown: bundle 1,3,5	2013-06-27 21:24:23.22665	2013-06-27 21:24:23.22665
2111	1105	Menu item was shown: bundle 1,4,5	2013-06-27 21:24:24.294656	2013-06-27 21:24:24.294656
2112	416	Menu item was shown: bundle 3,4	2013-06-27 21:24:24.607813	2013-06-27 21:24:24.607813
2113	1105	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:25.12121	2013-06-27 21:24:25.12121
2114	1105	Menu item was shown: bundle 1,4,5	2013-06-27 21:24:26.192075	2013-06-27 21:24:26.192075
2115	416	Menu item was shown: bundle 3,5	2013-06-27 21:24:26.901347	2013-06-27 21:24:26.901347
2116	1105	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:27.191715	2013-06-27 21:24:27.191715
2117	947	Menu item was shown: bundle 1,2	2013-06-27 21:24:27.260949	2013-06-27 21:24:27.260949
2118	1105	Menu item was shown: bundle 1,4,5	2013-06-27 21:24:27.614576	2013-06-27 21:24:27.614576
2119	416	Menu item was shown: bundle 4,5	2013-06-27 21:24:28.987951	2013-06-27 21:24:28.987951
2120	1019	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:30.208045	2013-06-27 21:24:30.208045
2121	947	Menu item was shown: bundle 1,3	2013-06-27 21:24:30.307839	2013-06-27 21:24:30.307839
2122	1105	Good 4 was clicked. Value is now: true	2013-06-27 21:24:30.580948	2013-06-27 21:24:30.580948
2123	1044	Good 1 was clicked. Value is now: true	2013-06-27 21:24:31.382783	2013-06-27 21:24:31.382783
2124	1044	Good 3 was clicked. Value is now: true	2013-06-27 21:24:32.324258	2013-06-27 21:24:32.324258
2125	1044	Good 4 was clicked. Value is now: true	2013-06-27 21:24:33.009838	2013-06-27 21:24:33.009838
2126	1044	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:34.917415	2013-06-27 21:24:34.917415
2127	1019	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:35.53193	2013-06-27 21:24:35.53193
2128	947	Menu item was shown: bundle 1,2	2013-06-27 21:24:36.052207	2013-06-27 21:24:36.052207
2129	947	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:38.128982	2013-06-27 21:24:38.128982
2130	1044	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:38.557802	2013-06-27 21:24:38.557802
2131	416	Good 3 was clicked. Value is now: false	2013-06-27 21:24:40.961442	2013-06-27 21:24:40.961442
2132	416	Good 1 was clicked. Value is now: false	2013-06-27 21:24:41.515869	2013-06-27 21:24:41.515869
2133	1105	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:41.605392	2013-06-27 21:24:41.605392
2134	299	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:24:41.85887	2013-06-27 21:24:41.85887
2135	947	Menu item was shown: bundle 1,2	2013-06-27 21:24:42.051096	2013-06-27 21:24:42.051096
2136	416	Good 4 was clicked. Value is now: true	2013-06-27 21:24:42.318949	2013-06-27 21:24:42.318949
2137	416	Good 5 was clicked. Value is now: true	2013-06-27 21:24:42.713148	2013-06-27 21:24:42.713148
2138	947	Menu item was shown: bundle 1,3	2013-06-27 21:24:44.185648	2013-06-27 21:24:44.185648
2139	1106	Menu item was shown: bundle 1,3	2013-06-27 21:24:44.743219	2013-06-27 21:24:44.743219
2140	1019	Good 2 was clicked. Value is now: true	2013-06-27 21:24:44.947545	2013-06-27 21:24:44.947545
2141	1019	Good 3 was clicked. Value is now: true	2013-06-27 21:24:45.298542	2013-06-27 21:24:45.298542
2142	1019	Good 4 was clicked. Value is now: true	2013-06-27 21:24:45.619158	2013-06-27 21:24:45.619158
2143	1105	Menu item was shown: bundle 2,3,5	2013-06-27 21:24:45.695799	2013-06-27 21:24:45.695799
2144	947	Menu item was shown: bundle 1,4	2013-06-27 21:24:46.027043	2013-06-27 21:24:46.027043
2145	1019	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:47.389209	2013-06-27 21:24:47.389209
2146	1008	Menu item was shown: bundle 1,4,5	2013-06-27 21:24:47.501867	2013-06-27 21:24:47.501867
2147	947	Menu item was shown: bundle 2,3	2013-06-27 21:24:47.787518	2013-06-27 21:24:47.787518
2148	947	Menu item was shown: bundle 3,4	2013-06-27 21:24:48.930742	2013-06-27 21:24:48.930742
2149	299	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:24:49.513743	2013-06-27 21:24:49.513743
2150	947	Menu item was shown: bundle 2,4	2013-06-27 21:24:49.540893	2013-06-27 21:24:49.540893
2151	995	Menu item was shown: bundle 1,2	2013-06-27 21:24:50.206021	2013-06-27 21:24:50.206021
2152	947	Menu item was shown: bundle 3,4	2013-06-27 21:24:50.605963	2013-06-27 21:24:50.605963
2153	1105	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:50.698413	2013-06-27 21:24:50.698413
2154	901	Menu item was shown: bundle 1,2	2013-06-27 21:24:51.102282	2013-06-27 21:24:51.102282
2155	1105	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:24:51.560614	2013-06-27 21:24:51.560614
2156	416	Menu item was shown: bundle 1,2	2013-06-27 21:24:51.711429	2013-06-27 21:24:51.711429
2157	1105	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:24:52.279319	2013-06-27 21:24:52.279319
2158	1044	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:52.45116	2013-06-27 21:24:52.45116
2159	947	Menu item was shown: bundle 1,2,3	2013-06-27 21:24:52.83887	2013-06-27 21:24:52.83887
2160	995	Menu item was shown: bundle 1,3	2013-06-27 21:24:53.145759	2013-06-27 21:24:53.145759
2161	1105	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:24:53.173861	2013-06-27 21:24:53.173861
2162	1019	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:53.693444	2013-06-27 21:24:53.693444
2163	1128	Menu item was shown: bundle 1,2	2013-06-27 21:24:54.226961	2013-06-27 21:24:54.226961
2164	947	Menu item was shown: bundle 1,2,4	2013-06-27 21:24:54.310048	2013-06-27 21:24:54.310048
2165	416	Menu item was shown: bundle 3,5	2013-06-27 21:24:54.586782	2013-06-27 21:24:54.586782
2166	947	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:55.19068	2013-06-27 21:24:55.19068
2167	416	Menu item was shown: bundle 4,5	2013-06-27 21:24:55.32999	2013-06-27 21:24:55.32999
2168	1128	Menu item was shown: bundle 1,3	2013-06-27 21:24:55.645532	2013-06-27 21:24:55.645532
2169	1019	Menu item was shown: bundle 1,3,4	2013-06-27 21:24:55.877803	2013-06-27 21:24:55.877803
2170	1128	Menu item was shown: bundle 1,4	2013-06-27 21:24:56.304702	2013-06-27 21:24:56.304702
2171	1105	Good 3 was clicked. Value is now: true	2013-06-27 21:24:56.581312	2013-06-27 21:24:56.581312
2172	1128	Menu item was shown: bundle 2,3	2013-06-27 21:24:57.045683	2013-06-27 21:24:57.045683
2173	1128	Menu item was shown: bundle 2,4	2013-06-27 21:24:57.527241	2013-06-27 21:24:57.527241
2174	995	Menu item was shown: bundle 1,4	2013-06-27 21:24:57.546739	2013-06-27 21:24:57.546739
2175	947	Menu item was shown: bundle 2,3,4	2013-06-27 21:24:57.590642	2013-06-27 21:24:57.590642
2176	1019	Menu item was shown: bundle 1,2,4	2013-06-27 21:24:58.27115	2013-06-27 21:24:58.27115
2177	1128	Menu item was shown: bundle 3,4	2013-06-27 21:24:58.778388	2013-06-27 21:24:58.778388
2178	299	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:24:59.566589	2013-06-27 21:24:59.566589
2179	947	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:24:59.714604	2013-06-27 21:24:59.714604
2180	1106	Menu item was shown: bundle 2,3	2013-06-27 21:24:59.758642	2013-06-27 21:24:59.758642
2181	901	Menu item was shown: bundle 1,3	2013-06-27 21:25:01.074398	2013-06-27 21:25:01.074398
2182	995	Menu item was shown: bundle 1,3	2013-06-27 21:25:01.2517	2013-06-27 21:25:01.2517
2183	299	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:25:01.89768	2013-06-27 21:25:01.89768
2184	299	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:25:03.013881	2013-06-27 21:25:03.013881
2185	995	Menu item was shown: bundle 1,5	2013-06-27 21:25:03.463241	2013-06-27 21:25:03.463241
2186	1019	Good 3 was clicked. Value is now: false	2013-06-27 21:25:04.105861	2013-06-27 21:25:04.105861
2187	1019	Good 2 was clicked. Value is now: false	2013-06-27 21:25:04.427669	2013-06-27 21:25:04.427669
2188	1019	Good 4 was clicked. Value is now: false	2013-06-27 21:25:04.4983	2013-06-27 21:25:04.4983
2189	1019	Good 1 was clicked. Value is now: true	2013-06-27 21:25:05.205355	2013-06-27 21:25:05.205355
2190	1128	Menu item was shown: bundle 2,4	2013-06-27 21:25:05.492534	2013-06-27 21:25:05.492534
2191	1019	Good 2 was clicked. Value is now: true	2013-06-27 21:25:05.548162	2013-06-27 21:25:05.548162
2192	995	Menu item was shown: bundle 1,3	2013-06-27 21:25:06.084269	2013-06-27 21:25:06.084269
2193	416	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:06.111122	2013-06-27 21:25:06.111122
2194	1019	Good 4 was clicked. Value is now: true	2013-06-27 21:25:06.163582	2013-06-27 21:25:06.163582
2195	901	Menu item was shown: bundle 1,4	2013-06-27 21:25:06.732235	2013-06-27 21:25:06.732235
2196	416	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:07.776963	2013-06-27 21:25:07.776963
2197	995	Good 1 was clicked. Value is now: true	2013-06-27 21:25:09.574289	2013-06-27 21:25:09.574289
2198	416	Menu item was shown: bundle 1,2,5	2013-06-27 21:25:09.816177	2013-06-27 21:25:09.816177
2199	995	Good 3 was clicked. Value is now: true	2013-06-27 21:25:10.603136	2013-06-27 21:25:10.603136
2200	416	Menu item was shown: bundle 1,3,4	2013-06-27 21:25:10.906843	2013-06-27 21:25:10.906843
2201	1106	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:11.256653	2013-06-27 21:25:11.256653
2202	210	Menu item was shown: bundle 1,2	2013-06-27 21:25:13.361518	2013-06-27 21:25:13.361518
2203	995	Menu item was shown: bundle 1,5	2013-06-27 21:25:13.388014	2013-06-27 21:25:13.388014
2204	995	Menu item was shown: bundle 2,3	2013-06-27 21:25:14.311554	2013-06-27 21:25:14.311554
2205	416	Menu item was shown: bundle 1,3,5	2013-06-27 21:25:15.287999	2013-06-27 21:25:15.287999
2206	416	Menu item was shown: bundle 1,4,5	2013-06-27 21:25:16.306176	2013-06-27 21:25:16.306176
2207	1128	Menu item was shown: bundle 1,3	2013-06-27 21:25:16.554647	2013-06-27 21:25:16.554647
2208	1019	Menu item was shown: bundle 1,2	2013-06-27 21:25:16.964595	2013-06-27 21:25:16.964595
2209	210	Menu item was shown: bundle 1,3	2013-06-27 21:25:17.493387	2013-06-27 21:25:17.493387
2210	416	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:18.085072	2013-06-27 21:25:18.085072
2211	1092	Menu item was shown: bundle 1,2	2013-06-27 21:25:18.342006	2013-06-27 21:25:18.342006
2212	1128	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:19.161361	2013-06-27 21:25:19.161361
2213	1019	Menu item was shown: bundle 1,3	2013-06-27 21:25:19.261453	2013-06-27 21:25:19.261453
2214	901	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:19.84732	2013-06-27 21:25:19.84732
2215	210	Menu item was shown: bundle 2,3	2013-06-27 21:25:20.387889	2013-06-27 21:25:20.387889
2216	1128	Menu item was hidden: bundle 1,2,3	2013-06-27 21:25:20.855015	2013-06-27 21:25:20.855015
2217	995	Menu item was shown: bundle 1,3	2013-06-27 21:25:21.034942	2013-06-27 21:25:21.034942
2218	542	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:21.161376	2013-06-27 21:25:21.161376
2219	1128	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:21.587609	2013-06-27 21:25:21.587609
2220	1019	Menu item was shown: bundle 1,4	2013-06-27 21:25:21.776052	2013-06-27 21:25:21.776052
2221	210	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:21.926073	2013-06-27 21:25:21.926073
2222	901	Menu item was shown: bundle 2,3	2013-06-27 21:25:22.04485	2013-06-27 21:25:22.04485
2223	416	Menu item was shown: bundle 2,3,5	2013-06-27 21:25:22.182049	2013-06-27 21:25:22.182049
2224	901	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:23.33024	2013-06-27 21:25:23.33024
2225	1128	Menu item was hidden: bundle 1,2,3	2013-06-27 21:25:23.816446	2013-06-27 21:25:23.816446
2226	1019	Menu item was shown: bundle 2,3	2013-06-27 21:25:24.298417	2013-06-27 21:25:24.298417
2227	299	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:25:24.786821	2013-06-27 21:25:24.786821
2228	1128	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:24.863554	2013-06-27 21:25:24.863554
2229	1128	Menu item was shown: bundle 1,3,4	2013-06-27 21:25:25.453046	2013-06-27 21:25:25.453046
2230	901	Menu item was shown: bundle 2,3	2013-06-27 21:25:26.091214	2013-06-27 21:25:26.091214
2231	1128	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:26.26197	2013-06-27 21:25:26.26197
2232	947	Menu item was shown: bundle 1,2	2013-06-27 21:25:26.519015	2013-06-27 21:25:26.519015
2233	1128	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:26.607226	2013-06-27 21:25:26.607226
2234	1019	Menu item was shown: bundle 2,4	2013-06-27 21:25:27.275888	2013-06-27 21:25:27.275888
2235	901	Menu item was shown: bundle 1,4	2013-06-27 21:25:27.900072	2013-06-27 21:25:27.900072
2236	1128	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:27.990265	2013-06-27 21:25:27.990265
2237	995	Menu item was shown: bundle 2,4	2013-06-27 21:25:28.02439	2013-06-27 21:25:28.02439
2238	995	Menu item was shown: bundle 2,3	2013-06-27 21:25:28.364795	2013-06-27 21:25:28.364795
2239	995	Menu item was hidden: bundle 2,3	2013-06-27 21:25:28.624741	2013-06-27 21:25:28.624741
2240	210	Menu item was shown: bundle 1,2	2013-06-27 21:25:28.680079	2013-06-27 21:25:28.680079
2241	1128	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:28.821879	2013-06-27 21:25:28.821879
2242	1092	Menu item was shown: bundle 1,3	2013-06-27 21:25:28.881399	2013-06-27 21:25:28.881399
2243	995	Menu item was shown: bundle 2,3	2013-06-27 21:25:29.060135	2013-06-27 21:25:29.060135
2244	1128	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:29.254746	2013-06-27 21:25:29.254746
2245	542	Good 1 was clicked. Value is now: true	2013-06-27 21:25:29.592328	2013-06-27 21:25:29.592328
2246	542	Good 2 was clicked. Value is now: true	2013-06-27 21:25:29.988235	2013-06-27 21:25:29.988235
2247	1128	Menu item was hidden: bundle 1,2,3	2013-06-27 21:25:30.309487	2013-06-27 21:25:30.309487
2248	542	Good 3 was clicked. Value is now: true	2013-06-27 21:25:30.503578	2013-06-27 21:25:30.503578
2249	210	Menu item was shown: bundle 1,3	2013-06-27 21:25:31.388014	2013-06-27 21:25:31.388014
2250	299	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:25:31.733892	2013-06-27 21:25:31.733892
2251	1128	Combo was clicked. Value is now: true	2013-06-27 21:25:31.871423	2013-06-27 21:25:31.871423
2252	1105	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:25:31.949743	2013-06-27 21:25:31.949743
2253	299	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:25:32.074881	2013-06-27 21:25:32.074881
2254	995	Good 2 was clicked. Value is now: true	2013-06-27 21:25:32.260163	2013-06-27 21:25:32.260163
2255	1105	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:25:32.318349	2013-06-27 21:25:32.318349
2256	210	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:32.451436	2013-06-27 21:25:32.451436
2257	995	Good 1 was clicked. Value is now: false	2013-06-27 21:25:32.906313	2013-06-27 21:25:32.906313
2258	542	Menu item was shown: bundle 2,3	2013-06-27 21:25:33.763468	2013-06-27 21:25:33.763468
2259	1008	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:34.429264	2013-06-27 21:25:34.429264
2260	1019	Menu item was shown: bundle 3,4	2013-06-27 21:25:34.625206	2013-06-27 21:25:34.625206
2261	1019	Menu item was hidden: bundle 3,4	2013-06-27 21:25:34.908512	2013-06-27 21:25:34.908512
2262	1019	Menu item was shown: bundle 3,4	2013-06-27 21:25:35.309538	2013-06-27 21:25:35.309538
2263	1008	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:25:35.592333	2013-06-27 21:25:35.592333
2264	299	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:25:35.730029	2013-06-27 21:25:35.730029
2265	995	Menu item was shown: bundle 2,4	2013-06-27 21:25:36.132327	2013-06-27 21:25:36.132327
2266	1105	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:25:36.920945	2013-06-27 21:25:36.920945
2267	542	Menu item was shown: bundle 1,3	2013-06-27 21:25:37.089416	2013-06-27 21:25:37.089416
2268	299	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:37.194852	2013-06-27 21:25:37.194852
2269	901	Menu item was shown: bundle 2,3	2013-06-27 21:25:37.307694	2013-06-27 21:25:37.307694
2270	1092	Menu item was shown: bundle 1,4	2013-06-27 21:25:37.394207	2013-06-27 21:25:37.394207
2271	542	Menu item was shown: bundle 1,2	2013-06-27 21:25:37.766293	2013-06-27 21:25:37.766293
2272	995	Menu item was shown: bundle 2,5	2013-06-27 21:25:37.938887	2013-06-27 21:25:37.938887
2273	1008	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:25:38.224525	2013-06-27 21:25:38.224525
2274	210	Combo was clicked. Value is now: true	2013-06-27 21:25:38.498272	2013-06-27 21:25:38.498272
2275	299	Menu item was shown: bundle 3,4,5	2013-06-27 21:25:38.675759	2013-06-27 21:25:38.675759
2276	1008	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:25:39.003274	2013-06-27 21:25:39.003274
2277	299	Menu item was shown: bundle 2,4,5	2013-06-27 21:25:39.204925	2013-06-27 21:25:39.204925
2278	1008	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:25:39.864473	2013-06-27 21:25:39.864473
2279	299	Menu item was shown: bundle 2,3,5	2013-06-27 21:25:39.93707	2013-06-27 21:25:39.93707
2280	1019	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:40.200071	2013-06-27 21:25:40.200071
2281	1008	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:25:41.090893	2013-06-27 21:25:41.090893
2282	995	Menu item was shown: bundle 3,4	2013-06-27 21:25:41.462332	2013-06-27 21:25:41.462332
2283	299	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:42.073564	2013-06-27 21:25:42.073564
2284	1008	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:42.315986	2013-06-27 21:25:42.315986
2285	1019	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:42.415526	2013-06-27 21:25:42.415526
2286	416	Menu item was shown: bundle 2,4,5	2013-06-27 21:25:42.95046	2013-06-27 21:25:42.95046
2287	901	Menu item was shown: bundle 2,4	2013-06-27 21:25:43.06121	2013-06-27 21:25:43.06121
2288	995	Menu item was shown: bundle 3,5	2013-06-27 21:25:43.332406	2013-06-27 21:25:43.332406
2289	1008	Menu item was shown: bundle 3,4,5	2013-06-27 21:25:43.479964	2013-06-27 21:25:43.479964
2290	947	Menu item was shown: bundle 1,3	2013-06-27 21:25:43.604227	2013-06-27 21:25:43.604227
2291	1008	Menu item was shown: bundle 2,4,5	2013-06-27 21:25:43.664357	2013-06-27 21:25:43.664357
2292	1008	Menu item was shown: bundle 2,3,5	2013-06-27 21:25:43.731397	2013-06-27 21:25:43.731397
2293	698	Menu item was shown: bundle 1,2	2013-06-27 21:25:43.913269	2013-06-27 21:25:43.913269
2294	1008	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:44.005807	2013-06-27 21:25:44.005807
2295	299	Menu item was shown: bundle 1,4,5	2013-06-27 21:25:44.090628	2013-06-27 21:25:44.090628
2296	947	Menu item was shown: bundle 1,4	2013-06-27 21:25:44.211808	2013-06-27 21:25:44.211808
2297	995	Menu item was shown: bundle 4,5	2013-06-27 21:25:44.833618	2013-06-27 21:25:44.833618
2298	1092	Menu item was shown: bundle 1,5	2013-06-27 21:25:44.878384	2013-06-27 21:25:44.878384
2299	698	Menu item was hidden: bundle 1,2	2013-06-27 21:25:45.06342	2013-06-27 21:25:45.06342
2300	995	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:45.132798	2013-06-27 21:25:45.132798
2301	947	Menu item was shown: bundle 2,3	2013-06-27 21:25:45.285084	2013-06-27 21:25:45.285084
2302	698	Menu item was shown: bundle 1,3	2013-06-27 21:25:45.992824	2013-06-27 21:25:45.992824
2303	299	Menu item was shown: bundle 1,3,5	2013-06-27 21:25:46.0902	2013-06-27 21:25:46.0902
2304	995	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:46.369607	2013-06-27 21:25:46.369607
2305	947	Menu item was shown: bundle 2,4	2013-06-27 21:25:46.631903	2013-06-27 21:25:46.631903
2306	947	Menu item was shown: bundle 3,4	2013-06-27 21:25:47.153081	2013-06-27 21:25:47.153081
2307	416	Menu item was shown: bundle 3,4,5	2013-06-27 21:25:47.592622	2013-06-27 21:25:47.592622
2308	947	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:48.617056	2013-06-27 21:25:48.617056
2309	299	Menu item was shown: bundle 1,4,5	2013-06-27 21:25:48.772096	2013-06-27 21:25:48.772096
2310	416	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:48.865219	2013-06-27 21:25:48.865219
2311	229	Menu item was shown: bundle 1,2	2013-06-27 21:25:49.127258	2013-06-27 21:25:49.127258
2312	242	Menu item was shown: bundle 1,2	2013-06-27 21:25:49.213256	2013-06-27 21:25:49.213256
2313	698	Menu item was shown: bundle 2,3	2013-06-27 21:25:49.510893	2013-06-27 21:25:49.510893
2314	242	Menu item was shown: bundle 1,3	2013-06-27 21:25:49.907726	2013-06-27 21:25:49.907726
2315	229	Menu item was shown: bundle 1,3	2013-06-27 21:25:50.001507	2013-06-27 21:25:50.001507
2316	947	Menu item was shown: bundle 1,2,4	2013-06-27 21:25:50.049279	2013-06-27 21:25:50.049279
2317	416	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:25:50.1035	2013-06-27 21:25:50.1035
2318	1092	Menu item was shown: bundle 2,3	2013-06-27 21:25:50.173839	2013-06-27 21:25:50.173839
2319	242	Menu item was shown: bundle 2,3	2013-06-27 21:25:50.484986	2013-06-27 21:25:50.484986
2320	229	Menu item was shown: bundle 1,2	2013-06-27 21:25:50.880325	2013-06-27 21:25:50.880325
2321	416	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:25:51.154625	2013-06-27 21:25:51.154625
2322	947	Menu item was shown: bundle 1,3,4	2013-06-27 21:25:51.31881	2013-06-27 21:25:51.31881
2323	242	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:51.771355	2013-06-27 21:25:51.771355
2324	698	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:51.844651	2013-06-27 21:25:51.844651
2325	947	Menu item was shown: bundle 2,3,4	2013-06-27 21:25:52.408743	2013-06-27 21:25:52.408743
2326	1092	Menu item was shown: bundle 1,2	2013-06-27 21:25:53.643605	2013-06-27 21:25:53.643605
2327	947	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:25:53.774854	2013-06-27 21:25:53.774854
2328	299	Menu item was shown: bundle 1,3,4	2013-06-27 21:25:53.894223	2013-06-27 21:25:53.894223
2329	229	Menu item was shown: bundle 1,3	2013-06-27 21:25:54.492957	2013-06-27 21:25:54.492957
2330	242	Combo was clicked. Value is now: true	2013-06-27 21:25:54.600265	2013-06-27 21:25:54.600265
2331	1092	Menu item was shown: bundle 2,3	2013-06-27 21:25:54.834147	2013-06-27 21:25:54.834147
2332	299	Menu item was shown: bundle 1,2,5	2013-06-27 21:25:55.337289	2013-06-27 21:25:55.337289
2333	229	Menu item was shown: bundle 2,3	2013-06-27 21:25:56.028952	2013-06-27 21:25:56.028952
2334	229	Menu item was shown: bundle 1,2,3	2013-06-27 21:25:57.404482	2013-06-27 21:25:57.404482
2335	1106	Menu item was shown: bundle 2,3	2013-06-27 21:25:58.911436	2013-06-27 21:25:58.911436
2336	698	Combo was clicked. Value is now: true	2013-06-27 21:26:00.41936	2013-06-27 21:26:00.41936
2337	416	Good 1 was clicked. Value is now: true	2013-06-27 21:26:00.700863	2013-06-27 21:26:00.700863
2338	416	Good 2 was clicked. Value is now: true	2013-06-27 21:26:01.214062	2013-06-27 21:26:01.214062
2339	299	Menu item was shown: bundle 1,2,4	2013-06-27 21:26:01.47763	2013-06-27 21:26:01.47763
2340	995	Menu item was shown: bundle 2,3	2013-06-27 21:26:01.966756	2013-06-27 21:26:01.966756
2341	229	Good 1 was clicked. Value is now: true	2013-06-27 21:26:04.457239	2013-06-27 21:26:04.457239
2342	229	Good 2 was clicked. Value is now: true	2013-06-27 21:26:04.872495	2013-06-27 21:26:04.872495
2343	229	Good 3 was clicked. Value is now: true	2013-06-27 21:26:05.206656	2013-06-27 21:26:05.206656
2344	995	Menu item was shown: bundle 1,2,4	2013-06-27 21:26:05.544652	2013-06-27 21:26:05.544652
2345	901	Menu item was shown: bundle 3,4	2013-06-27 21:26:06.576083	2013-06-27 21:26:06.576083
2346	1106	Good 2 was clicked. Value is now: true	2013-06-27 21:26:06.980171	2013-06-27 21:26:06.980171
2347	995	Menu item was shown: bundle 1,2,5	2013-06-27 21:26:07.705914	2013-06-27 21:26:07.705914
2348	1106	Good 3 was clicked. Value is now: true	2013-06-27 21:26:08.182743	2013-06-27 21:26:08.182743
2349	299	Good 1 was clicked. Value is now: true	2013-06-27 21:26:09.086117	2013-06-27 21:26:09.086117
2350	299	Good 2 was clicked. Value is now: true	2013-06-27 21:26:11.346317	2013-06-27 21:26:11.346317
2351	299	Good 4 was clicked. Value is now: true	2013-06-27 21:26:12.169262	2013-06-27 21:26:12.169262
2352	901	Menu item was shown: bundle 1,2,3	2013-06-27 21:26:12.645239	2013-06-27 21:26:12.645239
2353	995	Menu item was shown: bundle 1,3,4	2013-06-27 21:26:13.062694	2013-06-27 21:26:13.062694
2354	416	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:26:13.431241	2013-06-27 21:26:13.431241
2355	416	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:26:14.474602	2013-06-27 21:26:14.474602
2356	416	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:26:16.138339	2013-06-27 21:26:16.138339
2357	995	Menu item was shown: bundle 1,3,5	2013-06-27 21:26:17.103359	2013-06-27 21:26:17.103359
2358	416	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:26:17.55784	2013-06-27 21:26:17.55784
2359	901	Menu item was shown: bundle 1,2,4	2013-06-27 21:26:17.830868	2013-06-27 21:26:17.830868
2360	1106	Menu item was shown: bundle 1,2	2013-06-27 21:26:17.887949	2013-06-27 21:26:17.887949
2361	995	Menu item was shown: bundle 1,4,5	2013-06-27 21:26:18.48374	2013-06-27 21:26:18.48374
2362	1106	Menu item was shown: bundle 2,3	2013-06-27 21:26:19.141766	2013-06-27 21:26:19.141766
2363	1106	Menu item was shown: bundle 1,2	2013-06-27 21:26:19.878939	2013-06-27 21:26:19.878939
2364	995	Menu item was shown: bundle 2,3,4	2013-06-27 21:26:21.442854	2013-06-27 21:26:21.442854
2365	299	Menu item was shown: bundle 1,2,3	2013-06-27 21:26:23.135845	2013-06-27 21:26:23.135845
2366	901	Menu item was shown: bundle 1,2,3	2013-06-27 21:26:24.258016	2013-06-27 21:26:24.258016
2367	299	Menu item was shown: bundle 4,5	2013-06-27 21:26:25.712743	2013-06-27 21:26:25.712743
2368	1092	Menu item was shown: bundle 2,4	2013-06-27 21:26:26.491353	2013-06-27 21:26:26.491353
2369	299	Menu item was shown: bundle 3,5	2013-06-27 21:26:26.654996	2013-06-27 21:26:26.654996
2370	299	Menu item was shown: bundle 3,4	2013-06-27 21:26:27.324355	2013-06-27 21:26:27.324355
2371	299	Menu item was shown: bundle 2,5	2013-06-27 21:26:28.117739	2013-06-27 21:26:28.117739
2372	901	Menu item was shown: bundle 1,2,4	2013-06-27 21:26:28.153572	2013-06-27 21:26:28.153572
2373	1092	Menu item was shown: bundle 2,3	2013-06-27 21:26:28.476856	2013-06-27 21:26:28.476856
2374	995	Good 4 was clicked. Value is now: true	2013-06-27 21:26:28.629929	2013-06-27 21:26:28.629929
2375	299	Menu item was shown: bundle 2,4	2013-06-27 21:26:28.705628	2013-06-27 21:26:28.705628
2376	1106	Menu item was shown: bundle 2,3	2013-06-27 21:26:29.355622	2013-06-27 21:26:29.355622
2377	299	Menu item was shown: bundle 2,3	2013-06-27 21:26:29.726171	2013-06-27 21:26:29.726171
2378	299	Menu item was shown: bundle 1,5	2013-06-27 21:26:30.058163	2013-06-27 21:26:30.058163
2379	1106	Menu item was shown: bundle 1,2	2013-06-27 21:26:30.192445	2013-06-27 21:26:30.192445
2380	1092	Good 2 was clicked. Value is now: true	2013-06-27 21:26:30.432532	2013-06-27 21:26:30.432532
2381	299	Menu item was shown: bundle 1,4	2013-06-27 21:26:30.628746	2013-06-27 21:26:30.628746
2382	1092	Good 3 was clicked. Value is now: true	2013-06-27 21:26:31.308666	2013-06-27 21:26:31.308666
2383	299	Menu item was shown: bundle 1,3	2013-06-27 21:26:31.465734	2013-06-27 21:26:31.465734
2384	901	Menu item was shown: bundle 1,3,4	2013-06-27 21:26:31.66372	2013-06-27 21:26:31.66372
2385	299	Menu item was shown: bundle 1,2	2013-06-27 21:26:32.032369	2013-06-27 21:26:32.032369
2386	299	Menu item was shown: bundle 1,3	2013-06-27 21:26:33.153521	2013-06-27 21:26:33.153521
2387	1092	Menu item was shown: bundle 2,4	2013-06-27 21:26:36.047804	2013-06-27 21:26:36.047804
2388	299	Menu item was shown: bundle 1,2,4	2013-06-27 21:26:36.240249	2013-06-27 21:26:36.240249
2389	995	Menu item was shown: bundle 2,3,5	2013-06-27 21:26:36.428113	2013-06-27 21:26:36.428113
2390	740	Menu item was shown: bundle 1,2	2013-06-27 21:26:37.839464	2013-06-27 21:26:37.839464
2391	740	Menu item was hidden: bundle 1,2	2013-06-27 21:26:38.987843	2013-06-27 21:26:38.987843
2392	1092	Menu item was shown: bundle 2,5	2013-06-27 21:26:39.662867	2013-06-27 21:26:39.662867
2393	995	Menu item was shown: bundle 2,4,5	2013-06-27 21:26:39.738595	2013-06-27 21:26:39.738595
2394	740	Menu item was shown: bundle 1,2	2013-06-27 21:26:40.044607	2013-06-27 21:26:40.044607
2395	1106	Menu item was shown: bundle 2,3	2013-06-27 21:26:41.093229	2013-06-27 21:26:41.093229
2396	740	Menu item was shown: bundle 1,3	2013-06-27 21:26:41.549615	2013-06-27 21:26:41.549615
2397	1092	Menu item was shown: bundle 3,4	2013-06-27 21:26:46.174385	2013-06-27 21:26:46.174385
2398	995	Menu item was shown: bundle 3,4,5	2013-06-27 21:26:46.237665	2013-06-27 21:26:46.237665
2399	740	Menu item was shown: bundle 1,4	2013-06-27 21:26:46.623553	2013-06-27 21:26:46.623553
2400	1106	Menu item was shown: bundle 1,2,3	2013-06-27 21:26:47.035197	2013-06-27 21:26:47.035197
2401	995	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:26:47.974644	2013-06-27 21:26:47.974644
2402	995	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:26:49.302743	2013-06-27 21:26:49.302743
2403	740	Good 1 was clicked. Value is now: true	2013-06-27 21:26:49.908042	2013-06-27 21:26:49.908042
2404	740	Good 3 was clicked. Value is now: true	2013-06-27 21:26:50.558046	2013-06-27 21:26:50.558046
2405	1092	Menu item was shown: bundle 3,5	2013-06-27 21:26:55.070005	2013-06-27 21:26:55.070005
2406	740	Menu item was shown: bundle 1,5	2013-06-27 21:26:55.831213	2013-06-27 21:26:55.831213
2407	740	Menu item was shown: bundle 2,3	2013-06-27 21:26:58.31794	2013-06-27 21:26:58.31794
2408	901	Menu item was shown: bundle 2,3,4	2013-06-27 21:26:59.038837	2013-06-27 21:26:59.038837
2409	1092	Good 2 was clicked. Value is now: false	2013-06-27 21:27:01.499751	2013-06-27 21:27:01.499751
2410	199	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:27:01.981888	2013-06-27 21:27:01.981888
2411	740	Menu item was shown: bundle 2,4	2013-06-27 21:27:02.323849	2013-06-27 21:27:02.323849
2412	1092	Good 5 was clicked. Value is now: true	2013-06-27 21:27:02.364476	2013-06-27 21:27:02.364476
2413	995	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:27:03.94969	2013-06-27 21:27:03.94969
2414	995	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:27:05.009051	2013-06-27 21:27:05.009051
2415	995	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:27:06.08965	2013-06-27 21:27:06.08965
2416	199	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:27:07.651467	2013-06-27 21:27:07.651467
2417	199	Menu item was shown: bundle 2,3,4	2013-06-27 21:27:08.487947	2013-06-27 21:27:08.487947
2418	995	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:27:09.348988	2013-06-27 21:27:09.348988
2419	901	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:27:11.024871	2013-06-27 21:27:11.024871
2420	1092	Menu item was shown: bundle 4,5	2013-06-27 21:27:12.142982	2013-06-27 21:27:12.142982
2421	740	Good 1 was clicked. Value is now: false	2013-06-27 21:27:13.933125	2013-06-27 21:27:13.933125
2422	740	Good 2 was clicked. Value is now: true	2013-06-27 21:27:14.53193	2013-06-27 21:27:14.53193
2423	740	Good 4 was clicked. Value is now: true	2013-06-27 21:27:15.158243	2013-06-27 21:27:15.158243
2424	740	Good 3 was clicked. Value is now: false	2013-06-27 21:27:15.559467	2013-06-27 21:27:15.559467
2425	740	Menu item was shown: bundle 2,5	2013-06-27 21:27:16.456268	2013-06-27 21:27:16.456268
2426	1092	Menu item was shown: bundle 1,2,3	2013-06-27 21:27:17.057458	2013-06-27 21:27:17.057458
2427	199	Menu item was hidden: bundle 2,3,4	2013-06-27 21:27:17.151526	2013-06-27 21:27:17.151526
2428	901	Combo was clicked. Value is now: true	2013-06-27 21:27:17.342044	2013-06-27 21:27:17.342044
2429	199	Menu item was shown: bundle 1,3,4	2013-06-27 21:27:17.928382	2013-06-27 21:27:17.928382
2430	995	Menu item was shown: bundle 2,3,4	2013-06-27 21:27:20.054928	2013-06-27 21:27:20.054928
2431	740	Menu item was shown: bundle 3,4	2013-06-27 21:27:20.693088	2013-06-27 21:27:20.693088
2432	901	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:27:21.251261	2013-06-27 21:27:21.251261
2433	199	Menu item was hidden: bundle 1,3,4	2013-06-27 21:27:21.470674	2013-06-27 21:27:21.470674
2434	199	Menu item was shown: bundle 1,2,4	2013-06-27 21:27:22.021764	2013-06-27 21:27:22.021764
2435	199	Menu item was hidden: bundle 1,2,4	2013-06-27 21:27:22.873798	2013-06-27 21:27:22.873798
2436	901	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:27:23.083892	2013-06-27 21:27:23.083892
2437	199	Menu item was shown: bundle 1,2,3	2013-06-27 21:27:23.294444	2013-06-27 21:27:23.294444
2438	199	Menu item was hidden: bundle 1,2,3	2013-06-27 21:27:24.520359	2013-06-27 21:27:24.520359
2439	740	Menu item was shown: bundle 3,5	2013-06-27 21:27:25.070399	2013-06-27 21:27:25.070399
2440	199	Menu item was shown: bundle 3,4	2013-06-27 21:27:25.258535	2013-06-27 21:27:25.258535
2441	199	Menu item was hidden: bundle 3,4	2013-06-27 21:27:26.003284	2013-06-27 21:27:26.003284
2442	199	Menu item was shown: bundle 2,4	2013-06-27 21:27:27.145761	2013-06-27 21:27:27.145761
2443	199	Menu item was hidden: bundle 2,4	2013-06-27 21:27:27.568446	2013-06-27 21:27:27.568446
2444	199	Menu item was shown: bundle 2,3	2013-06-27 21:27:27.898119	2013-06-27 21:27:27.898119
2445	199	Menu item was hidden: bundle 2,3	2013-06-27 21:27:28.344828	2013-06-27 21:27:28.344828
2446	199	Menu item was shown: bundle 1,4	2013-06-27 21:27:28.897482	2013-06-27 21:27:28.897482
2447	199	Menu item was hidden: bundle 1,4	2013-06-27 21:27:29.328291	2013-06-27 21:27:29.328291
2448	901	Menu item was shown: bundle 1,2	2013-06-27 21:27:30.205255	2013-06-27 21:27:30.205255
2449	199	Menu item was shown: bundle 1,3	2013-06-27 21:27:30.349129	2013-06-27 21:27:30.349129
2450	199	Menu item was hidden: bundle 1,3	2013-06-27 21:27:31.815833	2013-06-27 21:27:31.815833
2451	199	Menu item was shown: bundle 1,2	2013-06-27 21:27:31.978009	2013-06-27 21:27:31.978009
2452	199	Menu item was hidden: bundle 1,2	2013-06-27 21:27:32.628241	2013-06-27 21:27:32.628241
2453	740	Menu item was shown: bundle 4,5	2013-06-27 21:27:33.340883	2013-06-27 21:27:33.340883
2454	199	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:27:33.885989	2013-06-27 21:27:33.885989
2455	901	Menu item was shown: bundle 1,3	2013-06-27 21:27:34.414578	2013-06-27 21:27:34.414578
2456	740	Menu item was shown: bundle 1,2,3	2013-06-27 21:27:35.782533	2013-06-27 21:27:35.782533
2457	901	Menu item was shown: bundle 1,4	2013-06-27 21:27:37.925727	2013-06-27 21:27:37.925727
2458	1092	Menu item was shown: bundle 1,2,4	2013-06-27 21:27:40.530116	2013-06-27 21:27:40.530116
2459	957	Menu item was shown: bundle 1,2	2013-06-27 21:27:41.069636	2013-06-27 21:27:41.069636
2460	901	Menu item was shown: bundle 2,3	2013-06-27 21:27:41.631483	2013-06-27 21:27:41.631483
2461	957	Menu item was shown: bundle 1,3	2013-06-27 21:27:42.104754	2013-06-27 21:27:42.104754
2462	957	Menu item was hidden: bundle 1,3	2013-06-27 21:27:42.369703	2013-06-27 21:27:42.369703
2463	957	Menu item was shown: bundle 1,3	2013-06-27 21:27:42.812437	2013-06-27 21:27:42.812437
2464	957	Menu item was shown: bundle 2,3	2013-06-27 21:27:45.464819	2013-06-27 21:27:45.464819
2465	740	Menu item was shown: bundle 1,2,4	2013-06-27 21:27:45.584118	2013-06-27 21:27:45.584118
2466	1092	Menu item was shown: bundle 1,2,5	2013-06-27 21:27:46.05236	2013-06-27 21:27:46.05236
2467	957	Good 2 was clicked. Value is now: true	2013-06-27 21:27:48.101811	2013-06-27 21:27:48.101811
2468	957	Good 3 was clicked. Value is now: true	2013-06-27 21:27:48.706477	2013-06-27 21:27:48.706477
2469	199	Good 1 was clicked. Value is now: true	2013-06-27 21:27:48.912732	2013-06-27 21:27:48.912732
2470	199	Good 2 was clicked. Value is now: true	2013-06-27 21:27:49.245218	2013-06-27 21:27:49.245218
2471	901	Menu item was shown: bundle 2,4	2013-06-27 21:27:49.338519	2013-06-27 21:27:49.338519
2472	957	Menu item was shown: bundle 1,2,3	2013-06-27 21:27:49.416283	2013-06-27 21:27:49.416283
2473	199	Good 3 was clicked. Value is now: true	2013-06-27 21:27:49.620408	2013-06-27 21:27:49.620408
2474	199	Good 4 was clicked. Value is now: true	2013-06-27 21:27:50.075703	2013-06-27 21:27:50.075703
2475	901	Menu item was shown: bundle 3,4	2013-06-27 21:27:52.755425	2013-06-27 21:27:52.755425
2476	1092	Good 4 was clicked. Value is now: true	2013-06-27 21:27:54.271011	2013-06-27 21:27:54.271011
2477	957	Good 1 was clicked. Value is now: true	2013-06-27 21:27:54.52466	2013-06-27 21:27:54.52466
2478	1092	Good 2 was clicked. Value is now: true	2013-06-27 21:27:55.164454	2013-06-27 21:27:55.164454
2479	957	Menu item was shown: bundle 2,3	2013-06-27 21:27:55.412342	2013-06-27 21:27:55.412342
2480	1092	Good 3 was clicked. Value is now: false	2013-06-27 21:27:55.698714	2013-06-27 21:27:55.698714
2481	1092	Good 4 was clicked. Value is now: false	2013-06-27 21:27:57.788657	2013-06-27 21:27:57.788657
2482	901	Menu item was shown: bundle 1,2,3	2013-06-27 21:27:58.345637	2013-06-27 21:27:58.345637
2483	1092	Good 1 was clicked. Value is now: true	2013-06-27 21:27:58.468012	2013-06-27 21:27:58.468012
2484	740	Good 1 was clicked. Value is now: true	2013-06-27 21:27:59.325028	2013-06-27 21:27:59.325028
2485	740	Menu item was shown: bundle 1,2,5	2013-06-27 21:28:01.531476	2013-06-27 21:28:01.531476
2486	966	Menu item was shown: bundle 1,2	2013-06-27 21:28:02.93289	2013-06-27 21:28:02.93289
2487	957	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:03.846448	2013-06-27 21:28:03.846448
2488	199	Good 1 was clicked. Value is now: false	2013-06-27 21:28:04.104702	2013-06-27 21:28:04.104702
2489	199	Good 4 was clicked. Value is now: false	2013-06-27 21:28:05.381317	2013-06-27 21:28:05.381317
2490	957	Menu item was hidden: bundle 1,2,3	2013-06-27 21:28:05.728165	2013-06-27 21:28:05.728165
2491	966	Menu item was shown: bundle 1,3	2013-06-27 21:28:06.574924	2013-06-27 21:28:06.574924
2492	199	Good 3 was clicked. Value is now: false	2013-06-27 21:28:06.856768	2013-06-27 21:28:06.856768
2493	199	Good 2 was clicked. Value is now: false	2013-06-27 21:28:07.221115	2013-06-27 21:28:07.221115
2494	966	Menu item was shown: bundle 1,4	2013-06-27 21:28:07.956832	2013-06-27 21:28:07.956832
2495	199	Combo was clicked. Value is now: true	2013-06-27 21:28:08.249878	2013-06-27 21:28:08.249878
2496	966	Menu item was shown: bundle 2,3	2013-06-27 21:28:08.680202	2013-06-27 21:28:08.680202
2497	901	Menu item was shown: bundle 1,2,4	2013-06-27 21:28:09.234483	2013-06-27 21:28:09.234483
2498	966	Menu item was shown: bundle 2,4	2013-06-27 21:28:09.414496	2013-06-27 21:28:09.414496
2499	740	Menu item was shown: bundle 1,2,4	2013-06-27 21:28:10.025688	2013-06-27 21:28:10.025688
2500	966	Menu item was shown: bundle 3,4	2013-06-27 21:28:10.058522	2013-06-27 21:28:10.058522
2501	1092	Menu item was shown: bundle 1,3,4	2013-06-27 21:28:10.951768	2013-06-27 21:28:10.951768
2502	966	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:11.035412	2013-06-27 21:28:11.035412
2503	740	Menu item was shown: bundle 1,2,5	2013-06-27 21:28:12.932466	2013-06-27 21:28:12.932466
2504	740	Menu item was shown: bundle 1,3,4	2013-06-27 21:28:13.587158	2013-06-27 21:28:13.587158
2505	740	Menu item was shown: bundle 1,3,5	2013-06-27 21:28:15.345132	2013-06-27 21:28:15.345132
2506	957	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:15.379004	2013-06-27 21:28:15.379004
2507	1092	Menu item was shown: bundle 1,3,5	2013-06-27 21:28:16.57994	2013-06-27 21:28:16.57994
2508	966	Menu item was shown: bundle 1,2,4	2013-06-27 21:28:17.59874	2013-06-27 21:28:17.59874
2509	966	Menu item was shown: bundle 1,3,4	2013-06-27 21:28:18.4047	2013-06-27 21:28:18.4047
2510	966	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:28:19.297916	2013-06-27 21:28:19.297916
2511	901	Menu item was shown: bundle 1,3,4	2013-06-27 21:28:19.485903	2013-06-27 21:28:19.485903
2512	966	Menu item was shown: bundle 2,3,4	2013-06-27 21:28:20.310978	2013-06-27 21:28:20.310978
2513	740	Menu item was shown: bundle 1,4,5	2013-06-27 21:28:21.033092	2013-06-27 21:28:21.033092
2514	966	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:21.66787	2013-06-27 21:28:21.66787
2515	740	Menu item was shown: bundle 2,3,4	2013-06-27 21:28:21.888162	2013-06-27 21:28:21.888162
2516	740	Menu item was shown: bundle 2,3,5	2013-06-27 21:28:22.867293	2013-06-27 21:28:22.867293
2517	740	Menu item was shown: bundle 2,4,5	2013-06-27 21:28:23.228853	2013-06-27 21:28:23.228853
2518	1012	Menu item was shown: bundle 1,2	2013-06-27 21:28:23.272163	2013-06-27 21:28:23.272163
2519	740	Menu item was shown: bundle 2,3,5	2013-06-27 21:28:23.86916	2013-06-27 21:28:23.86916
2520	1012	Menu item was shown: bundle 1,3	2013-06-27 21:28:24.821879	2013-06-27 21:28:24.821879
2521	966	Good 1 was clicked. Value is now: true	2013-06-27 21:28:25.154935	2013-06-27 21:28:25.154935
2522	966	Good 2 was clicked. Value is now: true	2013-06-27 21:28:25.908642	2013-06-27 21:28:25.908642
2523	966	Good 3 was clicked. Value is now: true	2013-06-27 21:28:26.577976	2013-06-27 21:28:26.577976
2524	1092	Menu item was shown: bundle 1,4,5	2013-06-27 21:28:27.015741	2013-06-27 21:28:27.015741
2525	1012	Menu item was shown: bundle 1,4	2013-06-27 21:28:30.844767	2013-06-27 21:28:30.844767
2526	740	Good 1 was clicked. Value is now: false	2013-06-27 21:28:31.244083	2013-06-27 21:28:31.244083
2527	1012	Menu item was shown: bundle 2,3	2013-06-27 21:28:31.535057	2013-06-27 21:28:31.535057
2528	740	Good 3 was clicked. Value is now: true	2013-06-27 21:28:31.877193	2013-06-27 21:28:31.877193
2529	1012	Menu item was shown: bundle 2,4	2013-06-27 21:28:32.013056	2013-06-27 21:28:32.013056
2530	957	Combo was clicked. Value is now: true	2013-06-27 21:28:32.182416	2013-06-27 21:28:32.182416
2531	1092	Menu item was shown: bundle 2,3,4	2013-06-27 21:28:32.495482	2013-06-27 21:28:32.495482
2532	1012	Menu item was shown: bundle 3,4	2013-06-27 21:28:32.586112	2013-06-27 21:28:32.586112
2533	740	Menu item was shown: bundle 2,4,5	2013-06-27 21:28:32.881484	2013-06-27 21:28:32.881484
2534	1101	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:33.981054	2013-06-27 21:28:33.981054
2535	1012	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:35.457224	2013-06-27 21:28:35.457224
2536	1101	Combo was clicked. Value is now: true	2013-06-27 21:28:35.994685	2013-06-27 21:28:35.994685
2537	1012	Menu item was shown: bundle 1,2,4	2013-06-27 21:28:36.239074	2013-06-27 21:28:36.239074
2538	1101	Menu item was hidden: bundle 1,2,3	2013-06-27 21:28:37.278227	2013-06-27 21:28:37.278227
2539	1012	Menu item was shown: bundle 1,3,4	2013-06-27 21:28:37.307749	2013-06-27 21:28:37.307749
2540	740	Menu item was shown: bundle 2,3,5	2013-06-27 21:28:38.135559	2013-06-27 21:28:38.135559
2541	987	Menu item was shown: bundle 1,2	2013-06-27 21:28:38.256647	2013-06-27 21:28:38.256647
2542	740	Menu item was hidden: bundle 2,3,5	2013-06-27 21:28:38.41888	2013-06-27 21:28:38.41888
2543	740	Menu item was shown: bundle 2,4,5	2013-06-27 21:28:38.997843	2013-06-27 21:28:38.997843
2544	987	Menu item was shown: bundle 1,3	2013-06-27 21:28:39.184772	2013-06-27 21:28:39.184772
2545	740	Menu item was shown: bundle 3,4,5	2013-06-27 21:28:39.352805	2013-06-27 21:28:39.352805
2546	987	Menu item was shown: bundle 1,4	2013-06-27 21:28:40.200324	2013-06-27 21:28:40.200324
2547	1101	Menu item was shown: bundle 1,2	2013-06-27 21:28:40.323454	2013-06-27 21:28:40.323454
2548	957	Menu item was shown: bundle 2,3	2013-06-27 21:28:40.906076	2013-06-27 21:28:40.906076
2549	987	Menu item was shown: bundle 1,5	2013-06-27 21:28:40.935535	2013-06-27 21:28:40.935535
2550	1092	Menu item was shown: bundle 2,3,5	2013-06-27 21:28:40.962917	2013-06-27 21:28:40.962917
2551	1101	Menu item was hidden: bundle 1,2	2013-06-27 21:28:41.044474	2013-06-27 21:28:41.044474
2552	957	Menu item was hidden: bundle 2,3	2013-06-27 21:28:41.144277	2013-06-27 21:28:41.144277
2553	740	Menu item was shown: bundle 2,4,5	2013-06-27 21:28:41.479036	2013-06-27 21:28:41.479036
2554	987	Menu item was shown: bundle 2,3	2013-06-27 21:28:41.56509	2013-06-27 21:28:41.56509
2555	1101	Menu item was shown: bundle 1,3	2013-06-27 21:28:41.641125	2013-06-27 21:28:41.641125
2556	957	Menu item was shown: bundle 1,3	2013-06-27 21:28:41.703394	2013-06-27 21:28:41.703394
2557	1012	Menu item was shown: bundle 2,3,4	2013-06-27 21:28:41.999918	2013-06-27 21:28:41.999918
2558	1101	Menu item was hidden: bundle 1,3	2013-06-27 21:28:42.280209	2013-06-27 21:28:42.280209
2559	957	Menu item was shown: bundle 1,2	2013-06-27 21:28:42.456545	2013-06-27 21:28:42.456545
2560	987	Menu item was shown: bundle 2,4	2013-06-27 21:28:42.490302	2013-06-27 21:28:42.490302
2561	1101	Menu item was shown: bundle 2,3	2013-06-27 21:28:42.551277	2013-06-27 21:28:42.551277
2562	1101	Menu item was hidden: bundle 2,3	2013-06-27 21:28:43.084692	2013-06-27 21:28:43.084692
2563	740	Menu item was shown: bundle 3,4,5	2013-06-27 21:28:43.118955	2013-06-27 21:28:43.118955
2564	1101	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:43.57825	2013-06-27 21:28:43.57825
2565	740	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:28:43.598878	2013-06-27 21:28:43.598878
2566	987	Menu item was shown: bundle 2,5	2013-06-27 21:28:43.706266	2013-06-27 21:28:43.706266
2567	740	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:28:44.035989	2013-06-27 21:28:44.035989
2568	1101	Menu item was hidden: bundle 1,2,3	2013-06-27 21:28:44.229607	2013-06-27 21:28:44.229607
2569	987	Menu item was shown: bundle 3,4	2013-06-27 21:28:44.456021	2013-06-27 21:28:44.456021
2570	740	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:28:44.516582	2013-06-27 21:28:44.516582
2571	1012	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:28:44.707327	2013-06-27 21:28:44.707327
2572	740	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:28:44.950926	2013-06-27 21:28:44.950926
2573	987	Menu item was shown: bundle 3,5	2013-06-27 21:28:45.603959	2013-06-27 21:28:45.603959
2574	740	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:28:46.274896	2013-06-27 21:28:46.274896
2575	987	Menu item was shown: bundle 4,5	2013-06-27 21:28:46.71385	2013-06-27 21:28:46.71385
2576	740	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:28:46.975829	2013-06-27 21:28:46.975829
2577	901	Menu item was shown: bundle 2,3,4	2013-06-27 21:28:47.349153	2013-06-27 21:28:47.349153
2578	1092	Menu item was shown: bundle 2,4,5	2013-06-27 21:28:47.982824	2013-06-27 21:28:47.982824
2579	1101	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:48.724476	2013-06-27 21:28:48.724476
2580	1101	Menu item was hidden: bundle 1,2,3	2013-06-27 21:28:49.560289	2013-06-27 21:28:49.560289
2581	1012	Good 1 was clicked. Value is now: true	2013-06-27 21:28:49.819676	2013-06-27 21:28:49.819676
2582	987	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:28:50.215069	2013-06-27 21:28:50.215069
2583	1012	Good 2 was clicked. Value is now: true	2013-06-27 21:28:50.233754	2013-06-27 21:28:50.233754
2584	1012	Good 3 was clicked. Value is now: true	2013-06-27 21:28:50.750395	2013-06-27 21:28:50.750395
2585	987	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:28:51.014177	2013-06-27 21:28:51.014177
2586	1012	Good 4 was clicked. Value is now: true	2013-06-27 21:28:51.223363	2013-06-27 21:28:51.223363
2587	987	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:28:52.001652	2013-06-27 21:28:52.001652
2588	987	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:28:52.867887	2013-06-27 21:28:52.867887
2589	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:28:53.012376	2013-06-27 21:28:53.012376
2590	740	Combo was clicked. Value is now: true	2013-06-27 21:28:53.57768	2013-06-27 21:28:53.57768
2591	987	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:28:54.229098	2013-06-27 21:28:54.229098
2592	944	Good 3 was clicked. Value is now: true	2013-06-27 21:28:55.680961	2013-06-27 21:28:55.680961
2593	944	Good 2 was clicked. Value is now: true	2013-06-27 21:28:56.054851	2013-06-27 21:28:56.054851
2594	987	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:28:57.090384	2013-06-27 21:28:57.090384
2595	944	Good 1 was clicked. Value is now: true	2013-06-27 21:28:57.226625	2013-06-27 21:28:57.226625
2596	415	Menu item was shown: bundle 1,2	2013-06-27 21:28:57.809974	2013-06-27 21:28:57.809974
2597	987	Menu item was shown: bundle 3,4,5	2013-06-27 21:28:57.925312	2013-06-27 21:28:57.925312
2598	987	Menu item was shown: bundle 2,3	2013-06-27 21:28:59.868125	2013-06-27 21:28:59.868125
2599	944	Menu item was shown: bundle 2,3	2013-06-27 21:29:00.265396	2013-06-27 21:29:00.265396
2600	987	Menu item was shown: bundle 1,5	2013-06-27 21:29:00.676411	2013-06-27 21:29:00.676411
2601	1092	Menu item was shown: bundle 3,4,5	2013-06-27 21:29:02.362075	2013-06-27 21:29:02.362075
2602	987	Menu item was shown: bundle 1,2	2013-06-27 21:29:02.429898	2013-06-27 21:29:02.429898
2603	1012	Combo was clicked. Value is now: true	2013-06-27 21:29:02.458482	2013-06-27 21:29:02.458482
2604	415	Menu item was shown: bundle 1,3	2013-06-27 21:29:03.59462	2013-06-27 21:29:03.59462
2605	987	Menu item was shown: bundle 2,3	2013-06-27 21:29:03.636455	2013-06-27 21:29:03.636455
2606	987	Menu item was shown: bundle 2,4	2013-06-27 21:29:04.110392	2013-06-27 21:29:04.110392
2607	987	Menu item was shown: bundle 2,5	2013-06-27 21:29:04.92251	2013-06-27 21:29:04.92251
2608	987	Good 2 was clicked. Value is now: true	2013-06-27 21:29:06.207888	2013-06-27 21:29:06.207888
2609	415	Menu item was shown: bundle 1,4	2013-06-27 21:29:08.391109	2013-06-27 21:29:08.391109
2610	944	Good 1 was clicked. Value is now: false	2013-06-27 21:29:08.468229	2013-06-27 21:29:08.468229
2611	415	Menu item was shown: bundle 1,5	2013-06-27 21:29:09.498337	2013-06-27 21:29:09.498337
2612	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:10.391222	2013-06-27 21:29:10.391222
2613	415	Menu item was shown: bundle 2,3	2013-06-27 21:29:10.71827	2013-06-27 21:29:10.71827
2614	944	Menu item was shown: bundle 2,3	2013-06-27 21:29:11.12798	2013-06-27 21:29:11.12798
2615	415	Menu item was shown: bundle 2,4	2013-06-27 21:29:13.756431	2013-06-27 21:29:13.756431
2616	415	Menu item was shown: bundle 2,5	2013-06-27 21:29:14.600051	2013-06-27 21:29:14.600051
2617	1092	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:29:15.24704	2013-06-27 21:29:15.24704
2618	944	Menu item was shown: bundle 1,3	2013-06-27 21:29:15.672607	2013-06-27 21:29:15.672607
2619	415	Menu item was shown: bundle 3,4	2013-06-27 21:29:17.167478	2013-06-27 21:29:17.167478
2620	1012	Good 1 was clicked. Value is now: true	2013-06-27 21:29:17.384952	2013-06-27 21:29:17.384952
2621	1012	Good 2 was clicked. Value is now: true	2013-06-27 21:29:17.959846	2013-06-27 21:29:17.959846
2622	415	Menu item was shown: bundle 3,5	2013-06-27 21:29:18.286769	2013-06-27 21:29:18.286769
2623	1012	Good 3 was clicked. Value is now: true	2013-06-27 21:29:18.436816	2013-06-27 21:29:18.436816
2624	1012	Good 4 was clicked. Value is now: true	2013-06-27 21:29:18.769575	2013-06-27 21:29:18.769575
2625	944	Menu item was shown: bundle 1,2	2013-06-27 21:29:19.052293	2013-06-27 21:29:19.052293
2626	415	Menu item was shown: bundle 4,5	2013-06-27 21:29:19.540277	2013-06-27 21:29:19.540277
2627	1092	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:29:20.028072	2013-06-27 21:29:20.028072
2628	1053	Menu item was shown: bundle 1,2	2013-06-27 21:29:20.298156	2013-06-27 21:29:20.298156
2629	415	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:20.632805	2013-06-27 21:29:20.632805
2630	1053	Menu item was shown: bundle 1,3	2013-06-27 21:29:20.92734	2013-06-27 21:29:20.92734
2631	415	Menu item was shown: bundle 1,2,4	2013-06-27 21:29:22.273275	2013-06-27 21:29:22.273275
2632	415	Menu item was shown: bundle 1,2,5	2013-06-27 21:29:23.353823	2013-06-27 21:29:23.353823
2633	1053	Menu item was shown: bundle 1,4	2013-06-27 21:29:24.142282	2013-06-27 21:29:24.142282
2634	944	Menu item was shown: bundle 1,3	2013-06-27 21:29:24.694682	2013-06-27 21:29:24.694682
2635	1092	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:29:25.573696	2013-06-27 21:29:25.573696
2636	1012	Menu item was shown: bundle 2,3,4	2013-06-27 21:29:25.843672	2013-06-27 21:29:25.843672
2637	944	Menu item was shown: bundle 2,3	2013-06-27 21:29:26.639522	2013-06-27 21:29:26.639522
2638	1053	Menu item was shown: bundle 1,5	2013-06-27 21:29:27.151506	2013-06-27 21:29:27.151506
2639	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:28.654488	2013-06-27 21:29:28.654488
2640	415	Menu item was shown: bundle 1,3,4	2013-06-27 21:29:28.856789	2013-06-27 21:29:28.856789
2641	944	Good 2 was clicked. Value is now: false	2013-06-27 21:29:31.342619	2013-06-27 21:29:31.342619
2642	944	Good 3 was clicked. Value is now: false	2013-06-27 21:29:31.609807	2013-06-27 21:29:31.609807
2643	1092	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:29:31.95728	2013-06-27 21:29:31.95728
2644	944	Combo was clicked. Value is now: true	2013-06-27 21:29:33.004201	2013-06-27 21:29:33.004201
2645	415	Good 1 was clicked. Value is now: true	2013-06-27 21:29:35.701498	2013-06-27 21:29:35.701498
2646	415	Good 3 was clicked. Value is now: true	2013-06-27 21:29:36.249702	2013-06-27 21:29:36.249702
2647	415	Good 4 was clicked. Value is now: true	2013-06-27 21:29:36.619959	2013-06-27 21:29:36.619959
2648	292	Menu item was shown: bundle 2,4	2013-06-27 21:29:37.266927	2013-06-27 21:29:37.266927
2649	1053	Menu item was shown: bundle 2,3	2013-06-27 21:29:38.067959	2013-06-27 21:29:38.067959
2650	1053	Menu item was shown: bundle 2,4	2013-06-27 21:29:41.749576	2013-06-27 21:29:41.749576
2651	944	Menu item was shown: bundle 1,2	2013-06-27 21:29:41.899725	2013-06-27 21:29:41.899725
2652	1053	Menu item was shown: bundle 2,5	2013-06-27 21:29:42.375734	2013-06-27 21:29:42.375734
2653	292	Good 2 was clicked. Value is now: true	2013-06-27 21:29:42.762893	2013-06-27 21:29:42.762893
2654	1012	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:29:43.056647	2013-06-27 21:29:43.056647
2655	292	Good 4 was clicked. Value is now: true	2013-06-27 21:29:43.391526	2013-06-27 21:29:43.391526
2656	1053	Menu item was shown: bundle 3,4	2013-06-27 21:29:43.594955	2013-06-27 21:29:43.594955
2657	1092	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:29:43.73858	2013-06-27 21:29:43.73858
2658	1018	Menu item was shown: bundle 1,2	2013-06-27 21:29:43.845544	2013-06-27 21:29:43.845544
2659	944	Menu item was shown: bundle 1,3	2013-06-27 21:29:43.888459	2013-06-27 21:29:43.888459
2660	944	Menu item was shown: bundle 2,3	2013-06-27 21:29:44.268598	2013-06-27 21:29:44.268598
2661	415	Menu item was shown: bundle 1,3,5	2013-06-27 21:29:44.393229	2013-06-27 21:29:44.393229
2662	1018	Menu item was shown: bundle 1,3	2013-06-27 21:29:45.342279	2013-06-27 21:29:45.342279
2663	415	Menu item was shown: bundle 1,4,5	2013-06-27 21:29:45.369961	2013-06-27 21:29:45.369961
2664	292	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:29:45.443337	2013-06-27 21:29:45.443337
2665	292	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:29:46.500813	2013-06-27 21:29:46.500813
2666	1012	Menu item was shown: bundle 2,3,4	2013-06-27 21:29:46.571752	2013-06-27 21:29:46.571752
2667	1018	Menu item was shown: bundle 1,4	2013-06-27 21:29:46.728109	2013-06-27 21:29:46.728109
2668	1012	Menu item was shown: bundle 1,3,4	2013-06-27 21:29:47.373259	2013-06-27 21:29:47.373259
2669	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:47.422213	2013-06-27 21:29:47.422213
2670	1112	Menu item was shown: bundle 1,2	2013-06-27 21:29:48.228801	2013-06-27 21:29:48.228801
2671	1112	Menu item was shown: bundle 1,3	2013-06-27 21:29:49.514523	2013-06-27 21:29:49.514523
2672	1092	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:29:49.696658	2013-06-27 21:29:49.696658
2673	1112	Menu item was hidden: bundle 1,3	2013-06-27 21:29:49.809055	2013-06-27 21:29:49.809055
2674	1053	Good 3 was clicked. Value is now: true	2013-06-27 21:29:49.880581	2013-06-27 21:29:49.880581
2675	1012	Menu item was shown: bundle 2,3,4	2013-06-27 21:29:49.924577	2013-06-27 21:29:49.924577
2676	1053	Good 4 was clicked. Value is now: true	2013-06-27 21:29:50.30282	2013-06-27 21:29:50.30282
2677	1018	Menu item was shown: bundle 2,3	2013-06-27 21:29:50.771612	2013-06-27 21:29:50.771612
2678	1012	Menu item was shown: bundle 1,3,4	2013-06-27 21:29:51.005906	2013-06-27 21:29:51.005906
2679	700	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:29:51.323065	2013-06-27 21:29:51.323065
2680	415	Good 3 was clicked. Value is now: false	2013-06-27 21:29:51.657651	2013-06-27 21:29:51.657651
2681	1018	Menu item was shown: bundle 2,4	2013-06-27 21:29:51.836209	2013-06-27 21:29:51.836209
2682	415	Good 5 was clicked. Value is now: true	2013-06-27 21:29:52.226944	2013-06-27 21:29:52.226944
2683	1012	Menu item was shown: bundle 1,2,4	2013-06-27 21:29:52.319169	2013-06-27 21:29:52.319169
2684	292	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:29:52.88942	2013-06-27 21:29:52.88942
2685	415	Menu item was shown: bundle 2,3,4	2013-06-27 21:29:53.349914	2013-06-27 21:29:53.349914
2686	1012	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:53.405489	2013-06-27 21:29:53.405489
2687	292	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:29:53.760524	2013-06-27 21:29:53.760524
2688	1018	Menu item was shown: bundle 3,4	2013-06-27 21:29:53.89986	2013-06-27 21:29:53.89986
2689	415	Menu item was shown: bundle 2,3,5	2013-06-27 21:29:53.943934	2013-06-27 21:29:53.943934
2690	415	Menu item was shown: bundle 2,4,5	2013-06-27 21:29:54.685971	2013-06-27 21:29:54.685971
2691	1012	Menu item was shown: bundle 3,4	2013-06-27 21:29:54.770523	2013-06-27 21:29:54.770523
2692	1018	Menu item was shown: bundle 1,2,3	2013-06-27 21:29:55.326279	2013-06-27 21:29:55.326279
2693	415	Menu item was shown: bundle 3,4,5	2013-06-27 21:29:55.806027	2013-06-27 21:29:55.806027
2694	1018	Menu item was shown: bundle 1,2,4	2013-06-27 21:29:56.260788	2013-06-27 21:29:56.260788
2695	1012	Menu item was shown: bundle 2,4	2013-06-27 21:29:56.585838	2013-06-27 21:29:56.585838
2696	1112	Menu item was shown: bundle 1,2	2013-06-27 21:29:56.664054	2013-06-27 21:29:56.664054
2697	1053	Menu item was shown: bundle 3,5	2013-06-27 21:29:56.988199	2013-06-27 21:29:56.988199
2698	1012	Menu item was shown: bundle 2,3	2013-06-27 21:29:57.772213	2013-06-27 21:29:57.772213
2699	1053	Menu item was shown: bundle 4,5	2013-06-27 21:29:58.057829	2013-06-27 21:29:58.057829
2700	1122	Menu item was shown: bundle 1,2	2013-06-27 21:29:58.326328	2013-06-27 21:29:58.326328
2701	1018	Menu item was shown: bundle 1,3,4	2013-06-27 21:29:58.464491	2013-06-27 21:29:58.464491
2702	1012	Menu item was shown: bundle 1,2	2013-06-27 21:29:59.069872	2013-06-27 21:29:59.069872
2703	1122	Menu item was hidden: bundle 1,2	2013-06-27 21:29:59.270537	2013-06-27 21:29:59.270537
2704	1122	Menu item was shown: bundle 1,3	2013-06-27 21:30:00.383485	2013-06-27 21:30:00.383485
2705	1053	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:00.442963	2013-06-27 21:30:00.442963
2706	292	Good 1 was clicked. Value is now: true	2013-06-27 21:30:01.138282	2013-06-27 21:30:01.138282
2707	415	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:01.684368	2013-06-27 21:30:01.684368
2708	292	Good 5 was clicked. Value is now: true	2013-06-27 21:30:02.285423	2013-06-27 21:30:02.285423
2709	1122	Menu item was hidden: bundle 1,3	2013-06-27 21:30:02.473129	2013-06-27 21:30:02.473129
2710	1122	Menu item was shown: bundle 1,4	2013-06-27 21:30:03.586137	2013-06-27 21:30:03.586137
2711	1122	Menu item was hidden: bundle 1,4	2013-06-27 21:30:04.106569	2013-06-27 21:30:04.106569
2712	1122	Menu item was shown: bundle 2,3	2013-06-27 21:30:04.526025	2013-06-27 21:30:04.526025
2713	700	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:05.082016	2013-06-27 21:30:05.082016
2714	1018	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:05.362342	2013-06-27 21:30:05.362342
2715	1122	Menu item was hidden: bundle 2,3	2013-06-27 21:30:05.585572	2013-06-27 21:30:05.585572
2716	1122	Menu item was shown: bundle 2,4	2013-06-27 21:30:06.200597	2013-06-27 21:30:06.200597
2717	944	Menu item was shown: bundle 2,3	2013-06-27 21:30:06.344068	2013-06-27 21:30:06.344068
2718	1122	Menu item was hidden: bundle 2,4	2013-06-27 21:30:06.64748	2013-06-27 21:30:06.64748
2719	1122	Menu item was shown: bundle 3,4	2013-06-27 21:30:07.167316	2013-06-27 21:30:07.167316
2720	1122	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:08.157877	2013-06-27 21:30:08.157877
2721	1122	Menu item was hidden: bundle 3,4	2013-06-27 21:30:08.318354	2013-06-27 21:30:08.318354
2722	1122	Menu item was hidden: bundle 1,2,3	2013-06-27 21:30:08.597593	2013-06-27 21:30:08.597593
2723	292	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:30:08.633847	2013-06-27 21:30:08.633847
2724	1053	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:08.663526	2013-06-27 21:30:08.663526
2725	1122	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:09.223876	2013-06-27 21:30:09.223876
2726	1053	Menu item was shown: bundle 1,2,5	2013-06-27 21:30:09.481852	2013-06-27 21:30:09.481852
2727	292	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:09.983503	2013-06-27 21:30:09.983503
2728	1122	Menu item was hidden: bundle 1,2,4	2013-06-27 21:30:10.353596	2013-06-27 21:30:10.353596
2729	415	Good 2 was clicked. Value is now: true	2013-06-27 21:30:10.81486	2013-06-27 21:30:10.81486
2730	292	Menu item was shown: bundle 3,4,5	2013-06-27 21:30:11.117263	2013-06-27 21:30:11.117263
2731	415	Good 3 was clicked. Value is now: true	2013-06-27 21:30:11.317963	2013-06-27 21:30:11.317963
2732	1018	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:11.571946	2013-06-27 21:30:11.571946
2733	292	Menu item was shown: bundle 2,4,5	2013-06-27 21:30:11.599973	2013-06-27 21:30:11.599973
2734	415	Good 5 was clicked. Value is now: false	2013-06-27 21:30:11.735915	2013-06-27 21:30:11.735915
2735	1122	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:11.880409	2013-06-27 21:30:11.880409
2736	541	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:11.941777	2013-06-27 21:30:11.941777
2737	1112	Menu item was hidden: bundle 1,2	2013-06-27 21:30:12.074738	2013-06-27 21:30:12.074738
2738	700	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:12.599531	2013-06-27 21:30:12.599531
2739	1122	Menu item was hidden: bundle 1,3,4	2013-06-27 21:30:12.898376	2013-06-27 21:30:12.898376
2740	1112	Menu item was shown: bundle 1,3	2013-06-27 21:30:13.094622	2013-06-27 21:30:13.094622
2741	541	Menu item was shown: bundle 2,3	2013-06-27 21:30:13.555438	2013-06-27 21:30:13.555438
2742	292	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:30:13.764367	2013-06-27 21:30:13.764367
2743	541	Menu item was shown: bundle 1,3	2013-06-27 21:30:14.51407	2013-06-27 21:30:14.51407
2744	541	Menu item was shown: bundle 1,2	2013-06-27 21:30:15.131787	2013-06-27 21:30:15.131787
2745	1122	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:15.15946	2013-06-27 21:30:15.15946
2746	292	Menu item was shown: bundle 2,4,5	2013-06-27 21:30:15.456298	2013-06-27 21:30:15.456298
2747	1122	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:30:16.180643	2013-06-27 21:30:16.180643
2748	1122	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:16.636926	2013-06-27 21:30:16.636926
2749	415	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:30:16.740879	2013-06-27 21:30:16.740879
2750	1112	Menu item was shown: bundle 1,4	2013-06-27 21:30:16.982559	2013-06-27 21:30:16.982559
2751	1053	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:17.267189	2013-06-27 21:30:17.267189
2752	415	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:30:17.8701	2013-06-27 21:30:17.8701
2753	541	Good 1 was clicked. Value is now: true	2013-06-27 21:30:18.070166	2013-06-27 21:30:18.070166
2754	541	Good 2 was clicked. Value is now: true	2013-06-27 21:30:18.464912	2013-06-27 21:30:18.464912
2755	1053	Menu item was shown: bundle 1,3,5	2013-06-27 21:30:18.500716	2013-06-27 21:30:18.500716
2756	1122	Menu item was hidden: bundle 2,3,4	2013-06-27 21:30:20.16114	2013-06-27 21:30:20.16114
2757	292	Menu item was shown: bundle 2,3,5	2013-06-27 21:30:20.490549	2013-06-27 21:30:20.490549
2758	1018	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:20.552062	2013-06-27 21:30:20.552062
2759	1122	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:20.572867	2013-06-27 21:30:20.572867
2760	944	Menu item was shown: bundle 1,3	2013-06-27 21:30:20.754874	2013-06-27 21:30:20.754874
2761	1053	Menu item was shown: bundle 1,4,5	2013-06-27 21:30:20.88999	2013-06-27 21:30:20.88999
2762	1122	Menu item was hidden: bundle 1,3,4	2013-06-27 21:30:21.161037	2013-06-27 21:30:21.161037
2763	1122	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:21.587063	2013-06-27 21:30:21.587063
2764	944	Menu item was shown: bundle 1,2	2013-06-27 21:30:21.868773	2013-06-27 21:30:21.868773
2765	700	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:22.956971	2013-06-27 21:30:22.956971
2766	1122	Menu item was hidden: bundle 1,2,4	2013-06-27 21:30:23.097065	2013-06-27 21:30:23.097065
2767	1112	Menu item was shown: bundle 1,5	2013-06-27 21:30:23.315528	2013-06-27 21:30:23.315528
2768	1018	Good 1 was clicked. Value is now: true	2013-06-27 21:30:24.152266	2013-06-27 21:30:24.152266
2769	1018	Good 3 was clicked. Value is now: true	2013-06-27 21:30:24.932333	2013-06-27 21:30:24.932333
2770	1053	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:24.952161	2013-06-27 21:30:24.952161
2771	292	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:25.219564	2013-06-27 21:30:25.219564
2772	1018	Good 4 was clicked. Value is now: true	2013-06-27 21:30:25.293405	2013-06-27 21:30:25.293405
2773	415	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:30:25.398337	2013-06-27 21:30:25.398337
2774	292	Menu item was shown: bundle 1,4,5	2013-06-27 21:30:26.074004	2013-06-27 21:30:26.074004
2775	1122	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:26.143404	2013-06-27 21:30:26.143404
2776	415	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:30:26.488931	2013-06-27 21:30:26.488931
2777	944	Menu item was shown: bundle 1,3	2013-06-27 21:30:26.957973	2013-06-27 21:30:26.957973
2778	292	Menu item was shown: bundle 1,3,5	2013-06-27 21:30:26.987852	2013-06-27 21:30:26.987852
2779	1122	Menu item was hidden: bundle 1,3,4	2013-06-27 21:30:27.190437	2013-06-27 21:30:27.190437
2780	415	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:30:27.222884	2013-06-27 21:30:27.222884
2781	292	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:27.48051	2013-06-27 21:30:27.48051
2782	944	Menu item was shown: bundle 2,3	2013-06-27 21:30:27.615542	2013-06-27 21:30:27.615542
2783	1122	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:27.913174	2013-06-27 21:30:27.913174
2784	292	Menu item was shown: bundle 1,2,5	2013-06-27 21:30:28.057819	2013-06-27 21:30:28.057819
2785	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:28.130779	2013-06-27 21:30:28.130779
2786	1112	Menu item was shown: bundle 2,3	2013-06-27 21:30:28.719684	2013-06-27 21:30:28.719684
2787	292	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:29.149639	2013-06-27 21:30:29.149639
2788	944	Menu item was shown: bundle 2,3	2013-06-27 21:30:29.198936	2013-06-27 21:30:29.198936
2789	292	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:29.631336	2013-06-27 21:30:29.631336
2790	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:30.392953	2013-06-27 21:30:30.392953
2791	292	Menu item was shown: bundle 4,5	2013-06-27 21:30:31.532827	2013-06-27 21:30:31.532827
2792	1053	Menu item was shown: bundle 2,3,5	2013-06-27 21:30:31.584167	2013-06-27 21:30:31.584167
2793	292	Menu item was shown: bundle 3,5	2013-06-27 21:30:32.543774	2013-06-27 21:30:32.543774
2794	700	Combo was clicked. Value is now: true	2013-06-27 21:30:33.228475	2013-06-27 21:30:33.228475
2795	292	Menu item was shown: bundle 3,4	2013-06-27 21:30:33.631261	2013-06-27 21:30:33.631261
2796	415	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:34.34846	2013-06-27 21:30:34.34846
2797	944	Menu item was shown: bundle 2,3	2013-06-27 21:30:35.02515	2013-06-27 21:30:35.02515
2798	292	Menu item was shown: bundle 2,5	2013-06-27 21:30:35.119375	2013-06-27 21:30:35.119375
2799	1112	Menu item was shown: bundle 2,4	2013-06-27 21:30:35.621491	2013-06-27 21:30:35.621491
2800	1122	Menu item was hidden: bundle 1,2,4	2013-06-27 21:30:35.776876	2013-06-27 21:30:35.776876
2801	292	Menu item was shown: bundle 2,4	2013-06-27 21:30:36.074748	2013-06-27 21:30:36.074748
2802	292	Menu item was shown: bundle 2,3	2013-06-27 21:30:37.6594	2013-06-27 21:30:37.6594
2803	1018	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:38.115111	2013-06-27 21:30:38.115111
2804	292	Menu item was shown: bundle 1,5	2013-06-27 21:30:38.405366	2013-06-27 21:30:38.405366
2805	245	Menu item was shown: bundle 1,2	2013-06-27 21:30:38.88048	2013-06-27 21:30:38.88048
2806	292	Menu item was shown: bundle 1,4	2013-06-27 21:30:38.933065	2013-06-27 21:30:38.933065
2807	292	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:40.034945	2013-06-27 21:30:40.034945
2808	1018	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:40.344384	2013-06-27 21:30:40.344384
2809	944	Menu item was shown: bundle 1,2	2013-06-27 21:30:40.651782	2013-06-27 21:30:40.651782
2810	1112	Menu item was shown: bundle 2,5	2013-06-27 21:30:40.686939	2013-06-27 21:30:40.686939
2811	1053	Menu item was shown: bundle 2,4,5	2013-06-27 21:30:41.148854	2013-06-27 21:30:41.148854
2812	1018	Menu item was shown: bundle 3,4	2013-06-27 21:30:41.457511	2013-06-27 21:30:41.457511
2813	944	Menu item was shown: bundle 1,3	2013-06-27 21:30:41.709601	2013-06-27 21:30:41.709601
2814	1018	Menu item was shown: bundle 2,4	2013-06-27 21:30:42.192899	2013-06-27 21:30:42.192899
2815	944	Menu item was shown: bundle 2,3	2013-06-27 21:30:42.348886	2013-06-27 21:30:42.348886
2816	245	Good 1 was clicked. Value is now: true	2013-06-27 21:30:42.452623	2013-06-27 21:30:42.452623
2817	944	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:42.833949	2013-06-27 21:30:42.833949
2818	292	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:43.067093	2013-06-27 21:30:43.067093
2819	1018	Menu item was shown: bundle 2,3,4	2013-06-27 21:30:43.249478	2013-06-27 21:30:43.249478
2820	292	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:30:44.034635	2013-06-27 21:30:44.034635
2821	245	Combo was clicked. Value is now: true	2013-06-27 21:30:44.372181	2013-06-27 21:30:44.372181
2822	292	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:30:45.259445	2013-06-27 21:30:45.259445
2823	996	Menu item was shown: bundle 1,2	2013-06-27 21:30:45.368355	2013-06-27 21:30:45.368355
2824	1018	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:45.812128	2013-06-27 21:30:45.812128
2825	245	Menu item was shown: bundle 1,3	2013-06-27 21:30:46.201693	2013-06-27 21:30:46.201693
2826	1018	Menu item was shown: bundle 1,2	2013-06-27 21:30:46.688491	2013-06-27 21:30:46.688491
2827	1018	Menu item was hidden: bundle 1,2	2013-06-27 21:30:46.980226	2013-06-27 21:30:46.980226
2828	1053	Menu item was shown: bundle 3,4,5	2013-06-27 21:30:47.121265	2013-06-27 21:30:47.121265
2829	1018	Menu item was shown: bundle 1,2	2013-06-27 21:30:47.386108	2013-06-27 21:30:47.386108
2830	1018	Menu item was shown: bundle 1,3	2013-06-27 21:30:47.890033	2013-06-27 21:30:47.890033
2831	1018	Menu item was shown: bundle 1,4	2013-06-27 21:30:48.451715	2013-06-27 21:30:48.451715
2832	1053	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:48.681889	2013-06-27 21:30:48.681889
2833	1018	Menu item was shown: bundle 2,3	2013-06-27 21:30:49.052042	2013-06-27 21:30:49.052042
2834	1122	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:30:49.488497	2013-06-27 21:30:49.488497
2835	292	Menu item was shown: bundle 2,4,5	2013-06-27 21:30:49.524249	2013-06-27 21:30:49.524249
2836	1053	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:30:49.851054	2013-06-27 21:30:49.851054
2837	1018	Menu item was shown: bundle 3,4	2013-06-27 21:30:49.884274	2013-06-27 21:30:49.884274
2838	1018	Menu item was shown: bundle 2,4	2013-06-27 21:30:50.304482	2013-06-27 21:30:50.304482
2839	1122	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:30:50.610542	2013-06-27 21:30:50.610542
2840	996	Menu item was shown: bundle 1,3	2013-06-27 21:30:51.916711	2013-06-27 21:30:51.916711
2841	1018	Menu item was shown: bundle 3,4	2013-06-27 21:30:52.091401	2013-06-27 21:30:52.091401
2842	1122	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:53.453496	2013-06-27 21:30:53.453496
2843	1086	Menu item was shown: bundle 1,2	2013-06-27 21:30:53.733854	2013-06-27 21:30:53.733854
2844	1018	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:53.758669	2013-06-27 21:30:53.758669
2845	1122	Menu item was hidden: bundle 1,2,3	2013-06-27 21:30:54.101976	2013-06-27 21:30:54.101976
2846	1018	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:54.222257	2013-06-27 21:30:54.222257
2847	1122	Menu item was shown: bundle 3,4	2013-06-27 21:30:54.572775	2013-06-27 21:30:54.572775
2848	1018	Menu item was shown: bundle 1,2,4	2013-06-27 21:30:54.662648	2013-06-27 21:30:54.662648
2849	1122	Menu item was hidden: bundle 3,4	2013-06-27 21:30:55.047209	2013-06-27 21:30:55.047209
2850	996	Good 1 was clicked. Value is now: true	2013-06-27 21:30:55.276161	2013-06-27 21:30:55.276161
2851	245	Menu item was shown: bundle 1,4	2013-06-27 21:30:55.564533	2013-06-27 21:30:55.564533
2852	996	Good 3 was clicked. Value is now: true	2013-06-27 21:30:56.198773	2013-06-27 21:30:56.198773
2853	245	Menu item was shown: bundle 2,3	2013-06-27 21:30:56.399397	2013-06-27 21:30:56.399397
2854	1122	Combo was clicked. Value is now: true	2013-06-27 21:30:56.557175	2013-06-27 21:30:56.557175
2855	292	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:30:56.763065	2013-06-27 21:30:56.763065
2856	245	Menu item was shown: bundle 2,4	2013-06-27 21:30:57.039132	2013-06-27 21:30:57.039132
2857	245	Menu item was shown: bundle 3,4	2013-06-27 21:30:57.701312	2013-06-27 21:30:57.701312
2858	245	Menu item was shown: bundle 1,2,3	2013-06-27 21:30:58.351444	2013-06-27 21:30:58.351444
2859	1086	Menu item was shown: bundle 1,3	2013-06-27 21:30:59.519274	2013-06-27 21:30:59.519274
2860	292	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:30:59.635747	2013-06-27 21:30:59.635747
2861	245	Menu item was shown: bundle 1,3,4	2013-06-27 21:30:59.81356	2013-06-27 21:30:59.81356
2862	245	Menu item was shown: bundle 1,2,4	2013-06-27 21:31:00.747134	2013-06-27 21:31:00.747134
2863	245	Menu item was shown: bundle 2,3,4	2013-06-27 21:31:01.807256	2013-06-27 21:31:01.807256
2864	230	Menu item was shown: bundle 1,2	2013-06-27 21:31:02.614655	2013-06-27 21:31:02.614655
2865	245	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:31:02.648033	2013-06-27 21:31:02.648033
2866	996	Menu item was shown: bundle 2,3	2013-06-27 21:31:02.674006	2013-06-27 21:31:02.674006
2867	245	Menu item was shown: bundle 1,2	2013-06-27 21:31:04.139765	2013-06-27 21:31:04.139765
2868	1086	Good 1 was clicked. Value is now: true	2013-06-27 21:31:04.386793	2013-06-27 21:31:04.386793
2869	996	Menu item was shown: bundle 1,2,3	2013-06-27 21:31:05.05279	2013-06-27 21:31:05.05279
2870	1086	Good 3 was clicked. Value is now: true	2013-06-27 21:31:05.090182	2013-06-27 21:31:05.090182
2871	1112	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:31:05.513527	2013-06-27 21:31:05.513527
2872	1053	Good 1 was clicked. Value is now: true	2013-06-27 21:31:06.880418	2013-06-27 21:31:06.880418
2873	1053	Good 2 was clicked. Value is now: true	2013-06-27 21:31:07.47796	2013-06-27 21:31:07.47796
2874	230	Menu item was shown: bundle 1,2,3	2013-06-27 21:31:08.116253	2013-06-27 21:31:08.116253
2875	1053	Good 4 was clicked. Value is now: false	2013-06-27 21:31:08.278606	2013-06-27 21:31:08.278606
2876	1086	Menu item was shown: bundle 1,4	2013-06-27 21:31:08.563558	2013-06-27 21:31:08.563558
2877	1053	Good 5 was clicked. Value is now: true	2013-06-27 21:31:08.773324	2013-06-27 21:31:08.773324
2878	216	Menu item was shown: bundle 2,3	2013-06-27 21:31:08.934249	2013-06-27 21:31:08.934249
2879	245	Menu item was shown: bundle 1,3	2013-06-27 21:31:09.844771	2013-06-27 21:31:09.844771
2880	216	Good 2 was clicked. Value is now: true	2013-06-27 21:31:10.590136	2013-06-27 21:31:10.590136
2881	1053	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:31:10.956158	2013-06-27 21:31:10.956158
2882	1053	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:31:11.883083	2013-06-27 21:31:11.883083
2883	216	Menu item was shown: bundle 1,2	2013-06-27 21:31:11.994957	2013-06-27 21:31:11.994957
2884	1086	Menu item was shown: bundle 1,5	2013-06-27 21:31:12.339466	2013-06-27 21:31:12.339466
2885	216	Menu item was shown: bundle 1,3	2013-06-27 21:31:12.713978	2013-06-27 21:31:12.713978
2886	1053	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:31:12.936398	2013-06-27 21:31:12.936398
2887	216	Menu item was shown: bundle 1,2	2013-06-27 21:31:13.51951	2013-06-27 21:31:13.51951
2888	1053	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:31:13.560328	2013-06-27 21:31:13.560328
2889	1086	Menu item was shown: bundle 2,3	2013-06-27 21:31:15.453464	2013-06-27 21:31:15.453464
2890	216	Good 1 was clicked. Value is now: true	2013-06-27 21:31:15.890516	2013-06-27 21:31:15.890516
2891	230	Menu item was shown: bundle 2,3	2013-06-27 21:31:16.432611	2013-06-27 21:31:16.432611
2892	216	Menu item was shown: bundle 1,3	2013-06-27 21:31:17.207593	2013-06-27 21:31:17.207593
2893	216	Menu item was shown: bundle 2,3	2013-06-27 21:31:17.773228	2013-06-27 21:31:17.773228
2894	216	Menu item was shown: bundle 1,2,3	2013-06-27 21:31:18.57424	2013-06-27 21:31:18.57424
2895	1112	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:31:18.630391	2013-06-27 21:31:18.630391
2896	996	Menu item was shown: bundle 1,3	2013-06-27 21:31:19.57394	2013-06-27 21:31:19.57394
2897	1086	Menu item was shown: bundle 2,4	2013-06-27 21:31:19.628155	2013-06-27 21:31:19.628155
2898	216	Menu item was shown: bundle 1,2	2013-06-27 21:31:20.822216	2013-06-27 21:31:20.822216
2899	944	Good 3 was clicked. Value is now: true	2013-06-27 21:31:21.696093	2013-06-27 21:31:21.696093
2900	230	Menu item was shown: bundle 1,3	2013-06-27 21:31:22.50237	2013-06-27 21:31:22.50237
2901	944	Combo was clicked. Value is now: true	2013-06-27 21:31:23.000004	2013-06-27 21:31:23.000004
2902	230	Menu item was shown: bundle 1,2	2013-06-27 21:31:23.732187	2013-06-27 21:31:23.732187
2903	1086	Menu item was shown: bundle 2,5	2013-06-27 21:31:23.762512	2013-06-27 21:31:23.762512
2904	216	Menu item was shown: bundle 1,3	2013-06-27 21:31:24.173505	2013-06-27 21:31:24.173505
2905	216	Menu item was shown: bundle 1,2	2013-06-27 21:31:27.219706	2013-06-27 21:31:27.219706
2906	1086	Menu item was shown: bundle 1,3	2013-06-27 21:31:27.641524	2013-06-27 21:31:27.641524
2907	230	Good 1 was clicked. Value is now: true	2013-06-27 21:31:29.11991	2013-06-27 21:31:29.11991
2908	230	Good 2 was clicked. Value is now: true	2013-06-27 21:31:29.956047	2013-06-27 21:31:29.956047
2909	1112	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:31:30.207802	2013-06-27 21:31:30.207802
2910	216	Menu item was shown: bundle 1,3	2013-06-27 21:31:30.543061	2013-06-27 21:31:30.543061
2911	216	Menu item was shown: bundle 2,3	2013-06-27 21:31:31.705769	2013-06-27 21:31:31.705769
2912	216	Menu item was shown: bundle 1,2,3	2013-06-27 21:31:32.455577	2013-06-27 21:31:32.455577
2913	216	Menu item was shown: bundle 1,2	2013-06-27 21:31:33.330531	2013-06-27 21:31:33.330531
2914	738	Menu item was shown: bundle 1,2	2013-06-27 21:31:33.544619	2013-06-27 21:31:33.544619
2915	1086	Menu item was shown: bundle 2,3	2013-06-27 21:31:33.634765	2013-06-27 21:31:33.634765
2916	738	Menu item was shown: bundle 1,3	2013-06-27 21:31:36.442348	2013-06-27 21:31:36.442348
2917	1053	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:31:36.86555	2013-06-27 21:31:36.86555
2918	1086	Menu item was shown: bundle 2,4	2013-06-27 21:31:36.934474	2013-06-27 21:31:36.934474
2919	1112	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:31:37.948919	2013-06-27 21:31:37.948919
2920	1086	Menu item was shown: bundle 2,5	2013-06-27 21:31:39.205901	2013-06-27 21:31:39.205901
2921	738	Menu item was shown: bundle 1,4	2013-06-27 21:31:41.874104	2013-06-27 21:31:41.874104
2922	1112	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:31:44.535164	2013-06-27 21:31:44.535164
2923	1086	Menu item was shown: bundle 3,4	2013-06-27 21:31:44.779585	2013-06-27 21:31:44.779585
2924	738	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:31:46.307221	2013-06-27 21:31:46.307221
2925	738	Combo was clicked. Value is now: true	2013-06-27 21:31:49.578022	2013-06-27 21:31:49.578022
2926	1086	Good 1 was clicked. Value is now: false	2013-06-27 21:31:50.520551	2013-06-27 21:31:50.520551
2927	1086	Good 4 was clicked. Value is now: true	2013-06-27 21:31:51.696987	2013-06-27 21:31:51.696987
2928	738	Menu item was shown: bundle 2,3,4	2013-06-27 21:31:52.561673	2013-06-27 21:31:52.561673
2929	1086	Menu item was shown: bundle 1,3	2013-06-27 21:31:55.497968	2013-06-27 21:31:55.497968
2930	738	Menu item was shown: bundle 1,3,4	2013-06-27 21:31:56.097642	2013-06-27 21:31:56.097642
2931	738	Menu item was shown: bundle 1,2,4	2013-06-27 21:31:57.306939	2013-06-27 21:31:57.306939
2932	1112	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:31:57.684526	2013-06-27 21:31:57.684526
2933	738	Menu item was shown: bundle 1,2,3	2013-06-27 21:31:58.387325	2013-06-27 21:31:58.387325
2934	1112	Menu item was shown: bundle 3,4,5	2013-06-27 21:31:59.060425	2013-06-27 21:31:59.060425
2935	1112	Menu item was shown: bundle 2,4,5	2013-06-27 21:31:59.6372	2013-06-27 21:31:59.6372
2936	1112	Menu item was shown: bundle 2,3,5	2013-06-27 21:32:00.128287	2013-06-27 21:32:00.128287
2937	1112	Menu item was shown: bundle 2,3,4	2013-06-27 21:32:00.590364	2013-06-27 21:32:00.590364
2938	738	Menu item was shown: bundle 3,4	2013-06-27 21:32:01.08609	2013-06-27 21:32:01.08609
2939	1112	Menu item was shown: bundle 1,4,5	2013-06-27 21:32:01.297831	2013-06-27 21:32:01.297831
2940	201	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:32:01.640099	2013-06-27 21:32:01.640099
2941	1112	Menu item was shown: bundle 1,3,5	2013-06-27 21:32:01.749499	2013-06-27 21:32:01.749499
2942	738	Menu item was shown: bundle 2,4	2013-06-27 21:32:02.055406	2013-06-27 21:32:02.055406
2943	1112	Menu item was shown: bundle 1,3,4	2013-06-27 21:32:02.148992	2013-06-27 21:32:02.148992
2944	1086	Menu item was shown: bundle 3,4	2013-06-27 21:32:02.249242	2013-06-27 21:32:02.249242
2945	1112	Menu item was shown: bundle 1,2,5	2013-06-27 21:32:02.546849	2013-06-27 21:32:02.546849
2946	738	Menu item was shown: bundle 2,3	2013-06-27 21:32:02.583884	2013-06-27 21:32:02.583884
2947	1112	Menu item was shown: bundle 1,3,4	2013-06-27 21:32:03.023647	2013-06-27 21:32:03.023647
2948	738	Menu item was shown: bundle 1,4	2013-06-27 21:32:03.10437	2013-06-27 21:32:03.10437
2949	738	Menu item was shown: bundle 1,3	2013-06-27 21:32:03.798028	2013-06-27 21:32:03.798028
2950	201	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:32:04.21193	2013-06-27 21:32:04.21193
2951	201	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:32:04.820853	2013-06-27 21:32:04.820853
2952	738	Menu item was shown: bundle 1,2	2013-06-27 21:32:05.435191	2013-06-27 21:32:05.435191
2953	201	Menu item was hidden: bundle 2,3,4,5	2013-06-27 21:32:06.122214	2013-06-27 21:32:06.122214
2954	201	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:32:06.534025	2013-06-27 21:32:06.534025
2955	1086	Menu item was shown: bundle 3,5	2013-06-27 21:32:06.61318	2013-06-27 21:32:06.61318
2956	1112	Menu item was shown: bundle 1,2,5	2013-06-27 21:32:07.689823	2013-06-27 21:32:07.689823
2957	738	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:32:08.29083	2013-06-27 21:32:08.29083
2958	1086	Menu item was shown: bundle 4,5	2013-06-27 21:32:11.900206	2013-06-27 21:32:11.900206
2959	201	Menu item was hidden: bundle 1,3,4,5	2013-06-27 21:32:15.220931	2013-06-27 21:32:15.220931
2960	951	Menu item was shown: bundle 1,2	2013-06-27 21:32:15.459511	2013-06-27 21:32:15.459511
2961	201	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:32:15.780964	2013-06-27 21:32:15.780964
2962	1086	Menu item was shown: bundle 1,2,3	2013-06-27 21:32:16.372755	2013-06-27 21:32:16.372755
2963	201	Menu item was hidden: bundle 1,2,4,5	2013-06-27 21:32:16.471523	2013-06-27 21:32:16.471523
2964	201	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:32:17.115825	2013-06-27 21:32:17.115825
2965	951	Menu item was shown: bundle 1,3	2013-06-27 21:32:17.823942	2013-06-27 21:32:17.823942
2966	201	Menu item was hidden: bundle 1,2,3,5	2013-06-27 21:32:18.338326	2013-06-27 21:32:18.338326
2967	1112	Menu item was shown: bundle 1,2,4	2013-06-27 21:32:18.590427	2013-06-27 21:32:18.590427
2968	1112	Menu item was shown: bundle 1,2,3	2013-06-27 21:32:19.157144	2013-06-27 21:32:19.157144
2969	1112	Menu item was shown: bundle 4,5	2013-06-27 21:32:19.591505	2013-06-27 21:32:19.591505
2970	1112	Menu item was shown: bundle 3,5	2013-06-27 21:32:20.038263	2013-06-27 21:32:20.038263
2971	951	Menu item was shown: bundle 2,3	2013-06-27 21:32:20.948526	2013-06-27 21:32:20.948526
2972	951	Menu item was shown: bundle 1,2,3	2013-06-27 21:32:22.793029	2013-06-27 21:32:22.793029
2973	1112	Menu item was shown: bundle 3,4	2013-06-27 21:32:23.655825	2013-06-27 21:32:23.655825
2974	1112	Menu item was shown: bundle 2,5	2013-06-27 21:32:26.458742	2013-06-27 21:32:26.458742
2975	1112	Menu item was shown: bundle 2,4	2013-06-27 21:32:27.170412	2013-06-27 21:32:27.170412
2976	951	Combo was clicked. Value is now: true	2013-06-27 21:32:27.341292	2013-06-27 21:32:27.341292
2977	1112	Menu item was shown: bundle 2,3	2013-06-27 21:32:27.556881	2013-06-27 21:32:27.556881
2978	1112	Menu item was shown: bundle 1,5	2013-06-27 21:32:27.965738	2013-06-27 21:32:27.965738
2979	1112	Menu item was shown: bundle 1,4	2013-06-27 21:32:28.439794	2013-06-27 21:32:28.439794
2980	1086	Combo was clicked. Value is now: true	2013-06-27 21:32:28.678275	2013-06-27 21:32:28.678275
2981	951	Combo was clicked. Value is now: false	2013-06-27 21:32:28.878568	2013-06-27 21:32:28.878568
2982	201	Menu item was shown: bundle 1,2	2013-06-27 21:32:29.173713	2013-06-27 21:32:29.173713
2983	1112	Menu item was shown: bundle 1,3	2013-06-27 21:32:29.377718	2013-06-27 21:32:29.377718
2984	201	Menu item was hidden: bundle 1,2	2013-06-27 21:32:29.574956	2013-06-27 21:32:29.574956
2985	951	Good 1 was clicked. Value is now: true	2013-06-27 21:32:29.935602	2013-06-27 21:32:29.935602
2986	1086	Good 3 was clicked. Value is now: true	2013-06-27 21:32:30.104672	2013-06-27 21:32:30.104672
2987	951	Good 2 was clicked. Value is now: true	2013-06-27 21:32:30.40294	2013-06-27 21:32:30.40294
2988	1086	Good 4 was clicked. Value is now: true	2013-06-27 21:32:30.606559	2013-06-27 21:32:30.606559
2989	201	Menu item was shown: bundle 1,2,3	2013-06-27 21:32:31.368919	2013-06-27 21:32:31.368919
2990	201	Menu item was hidden: bundle 1,2,3	2013-06-27 21:32:32.100109	2013-06-27 21:32:32.100109
2991	951	Menu item was shown: bundle 1,2	2013-06-27 21:32:32.671471	2013-06-27 21:32:32.671471
2992	201	Menu item was shown: bundle 1,2,4	2013-06-27 21:32:33.027525	2013-06-27 21:32:33.027525
2993	1112	Menu item was shown: bundle 1,2	2013-06-27 21:32:33.416211	2013-06-27 21:32:33.416211
2994	201	Menu item was hidden: bundle 1,2,4	2013-06-27 21:32:33.489767	2013-06-27 21:32:33.489767
2995	201	Menu item was shown: bundle 1,2,5	2013-06-27 21:32:33.727288	2013-06-27 21:32:33.727288
2996	1112	Menu item was shown: bundle 2,3	2013-06-27 21:32:36.291463	2013-06-27 21:32:36.291463
2997	1086	Menu item was shown: bundle 1,2,4	2013-06-27 21:32:37.163134	2013-06-27 21:32:37.163134
2998	201	Menu item was hidden: bundle 1,2,5	2013-06-27 21:32:40.267782	2013-06-27 21:32:40.267782
2999	201	Menu item was shown: bundle 1,3,4	2013-06-27 21:32:40.731109	2013-06-27 21:32:40.731109
3000	201	Menu item was hidden: bundle 1,3,4	2013-06-27 21:32:41.324815	2013-06-27 21:32:41.324815
3001	201	Menu item was shown: bundle 1,3,5	2013-06-27 21:32:42.303427	2013-06-27 21:32:42.303427
3002	201	Menu item was hidden: bundle 1,3,5	2013-06-27 21:32:42.778099	2013-06-27 21:32:42.778099
3003	908	Combo was clicked. Value is now: true	2013-06-27 21:32:43.220297	2013-06-27 21:32:43.220297
3004	201	Menu item was shown: bundle 1,4,5	2013-06-27 21:32:43.55173	2013-06-27 21:32:43.55173
3005	201	Menu item was hidden: bundle 1,4,5	2013-06-27 21:32:43.998808	2013-06-27 21:32:43.998808
3006	201	Menu item was shown: bundle 2,3,4	2013-06-27 21:32:44.70143	2013-06-27 21:32:44.70143
3007	1112	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:32:45.215115	2013-06-27 21:32:45.215115
3008	201	Menu item was hidden: bundle 2,3,4	2013-06-27 21:32:45.579788	2013-06-27 21:32:45.579788
3009	1112	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:32:46.005705	2013-06-27 21:32:46.005705
3010	1086	Menu item was shown: bundle 1,2,5	2013-06-27 21:32:49.942276	2013-06-27 21:32:49.942276
3011	1112	Good 1 was clicked. Value is now: true	2013-06-27 21:32:54.123902	2013-06-27 21:32:54.123902
3012	1112	Good 2 was clicked. Value is now: true	2013-06-27 21:32:54.594603	2013-06-27 21:32:54.594603
3013	1112	Good 3 was clicked. Value is now: true	2013-06-27 21:32:55.594372	2013-06-27 21:32:55.594372
3014	1112	Good 5 was clicked. Value is now: true	2013-06-27 21:32:56.188197	2013-06-27 21:32:56.188197
3015	201	Menu item was shown: bundle 2,4,5	2013-06-27 21:32:57.134774	2013-06-27 21:32:57.134774
3016	201	Menu item was hidden: bundle 2,4,5	2013-06-27 21:32:57.882664	2013-06-27 21:32:57.882664
3017	201	Menu item was shown: bundle 3,4,5	2013-06-27 21:32:58.362516	2013-06-27 21:32:58.362516
3018	201	Menu item was hidden: bundle 3,4,5	2013-06-27 21:32:59.039898	2013-06-27 21:32:59.039898
3019	201	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:32:59.441187	2013-06-27 21:32:59.441187
3020	201	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:33:01.264449	2013-06-27 21:33:01.264449
3021	201	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:33:03.185089	2013-06-27 21:33:03.185089
3022	201	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:33:04.009343	2013-06-27 21:33:04.009343
3023	201	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:33:04.515185	2013-06-27 21:33:04.515185
3024	201	Menu item was hidden: bundle 2,3,4,5	2013-06-27 21:33:05.196836	2013-06-27 21:33:05.196836
3025	201	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:05.769148	2013-06-27 21:33:05.769148
3026	201	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:06.83105	2013-06-27 21:33:06.83105
3027	1086	Good 2 was clicked. Value is now: true	2013-06-27 21:33:07.179234	2013-06-27 21:33:07.179234
3028	1086	Good 1 was clicked. Value is now: true	2013-06-27 21:33:07.545655	2013-06-27 21:33:07.545655
3029	1086	Good 3 was clicked. Value is now: false	2013-06-27 21:33:08.38131	2013-06-27 21:33:08.38131
3030	908	Menu item was shown: bundle 1,2	2013-06-27 21:33:08.444708	2013-06-27 21:33:08.444708
3031	201	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:08.95617	2013-06-27 21:33:08.95617
3032	1112	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:09.011929	2013-06-27 21:33:09.011929
3033	1086	Good 4 was clicked. Value is now: false	2013-06-27 21:33:09.043978	2013-06-27 21:33:09.043978
3034	1086	Good 5 was clicked. Value is now: true	2013-06-27 21:33:09.499232	2013-06-27 21:33:09.499232
3035	201	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:33:10.738735	2013-06-27 21:33:10.738735
3036	201	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:11.539307	2013-06-27 21:33:11.539307
3037	908	Menu item was shown: bundle 1,3	2013-06-27 21:33:11.617269	2013-06-27 21:33:11.617269
3038	1013	Menu item was shown: bundle 1,2	2013-06-27 21:33:13.050335	2013-06-27 21:33:13.050335
3039	908	Menu item was shown: bundle 1,4	2013-06-27 21:33:15.346896	2013-06-27 21:33:15.346896
3040	1112	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:15.943209	2013-06-27 21:33:15.943209
3041	1013	Menu item was shown: bundle 1,3	2013-06-27 21:33:16.143095	2013-06-27 21:33:16.143095
3042	1013	Menu item was shown: bundle 1,4	2013-06-27 21:33:16.951827	2013-06-27 21:33:16.951827
3043	1086	Menu item was shown: bundle 1,3,4	2013-06-27 21:33:18.712476	2013-06-27 21:33:18.712476
3044	908	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:21.702867	2013-06-27 21:33:21.702867
3045	201	Good 1 was clicked. Value is now: true	2013-06-27 21:33:21.857439	2013-06-27 21:33:21.857439
3046	1013	Menu item was shown: bundle 1,5	2013-06-27 21:33:23.383198	2013-06-27 21:33:23.383198
3047	1099	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:33:23.944717	2013-06-27 21:33:23.944717
3048	908	Menu item was shown: bundle 1,4	2013-06-27 21:33:24.037791	2013-06-27 21:33:24.037791
3049	201	Good 3 was clicked. Value is now: true	2013-06-27 21:33:24.292773	2013-06-27 21:33:24.292773
3050	973	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:24.737415	2013-06-27 21:33:24.737415
3051	1013	Menu item was shown: bundle 2,3	2013-06-27 21:33:24.792494	2013-06-27 21:33:24.792494
3052	1013	Menu item was shown: bundle 2,4	2013-06-27 21:33:25.616285	2013-06-27 21:33:25.616285
3053	201	Good 5 was clicked. Value is now: true	2013-06-27 21:33:25.756631	2013-06-27 21:33:25.756631
3054	973	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:33:25.777066	2013-06-27 21:33:25.777066
3055	1099	Combo was clicked. Value is now: true	2013-06-27 21:33:26.010361	2013-06-27 21:33:26.010361
3056	201	Good 4 was clicked. Value is now: true	2013-06-27 21:33:26.092032	2013-06-27 21:33:26.092032
3057	973	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:26.140335	2013-06-27 21:33:26.140335
3058	1013	Menu item was shown: bundle 2,5	2013-06-27 21:33:26.314896	2013-06-27 21:33:26.314896
3059	973	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:33:26.873943	2013-06-27 21:33:26.873943
3060	1099	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:33:27.250214	2013-06-27 21:33:27.250214
3061	1013	Menu item was shown: bundle 1,2	2013-06-27 21:33:27.297816	2013-06-27 21:33:27.297816
3062	973	Menu item was shown: bundle 2,3,4	2013-06-27 21:33:27.465087	2013-06-27 21:33:27.465087
3063	1013	Menu item was shown: bundle 1,3	2013-06-27 21:33:27.974643	2013-06-27 21:33:27.974643
3064	973	Menu item was hidden: bundle 2,3,4	2013-06-27 21:33:28.261008	2013-06-27 21:33:28.261008
3065	973	Menu item was shown: bundle 1,3,4	2013-06-27 21:33:28.613422	2013-06-27 21:33:28.613422
3066	1086	Menu item was shown: bundle 1,3,5	2013-06-27 21:33:29.057693	2013-06-27 21:33:29.057693
3067	973	Menu item was shown: bundle 1,2,4	2013-06-27 21:33:29.172052	2013-06-27 21:33:29.172052
3068	1013	Menu item was shown: bundle 1,2	2013-06-27 21:33:29.302159	2013-06-27 21:33:29.302159
3069	973	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:30.085415	2013-06-27 21:33:30.085415
3070	201	Menu item was shown: bundle 2,3,5	2013-06-27 21:33:30.184973	2013-06-27 21:33:30.184973
3071	973	Menu item was shown: bundle 3,4	2013-06-27 21:33:30.727577	2013-06-27 21:33:30.727577
3072	201	Menu item was hidden: bundle 2,3,5	2013-06-27 21:33:30.77041	2013-06-27 21:33:30.77041
3073	945	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:32.450099	2013-06-27 21:33:32.450099
3074	1013	Menu item was shown: bundle 2,5	2013-06-27 21:33:33.317144	2013-06-27 21:33:33.317144
3075	908	Combo was clicked. Value is now: false	2013-06-27 21:33:33.530291	2013-06-27 21:33:33.530291
3076	201	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:33.566371	2013-06-27 21:33:33.566371
3077	973	Menu item was shown: bundle 2,4	2013-06-27 21:33:33.919416	2013-06-27 21:33:33.919416
3078	1013	Menu item was shown: bundle 3,4	2013-06-27 21:33:33.951535	2013-06-27 21:33:33.951535
3079	201	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:33:34.069437	2013-06-27 21:33:34.069437
3080	908	Good 1 was clicked. Value is now: true	2013-06-27 21:33:34.163414	2013-06-27 21:33:34.163414
3081	1013	Menu item was shown: bundle 3,5	2013-06-27 21:33:34.477858	2013-06-27 21:33:34.477858
3082	973	Menu item was shown: bundle 2,3	2013-06-27 21:33:34.673503	2013-06-27 21:33:34.673503
3083	201	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:34.842145	2013-06-27 21:33:34.842145
3084	908	Good 4 was clicked. Value is now: true	2013-06-27 21:33:34.931152	2013-06-27 21:33:34.931152
3085	1013	Menu item was shown: bundle 4,5	2013-06-27 21:33:35.149631	2013-06-27 21:33:35.149631
3086	945	Good 3 was clicked. Value is now: true	2013-06-27 21:33:35.347027	2013-06-27 21:33:35.347027
3087	201	Menu item was hidden: bundle 1,2,3,5	2013-06-27 21:33:35.44546	2013-06-27 21:33:35.44546
3088	1013	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:35.687079	2013-06-27 21:33:35.687079
3089	201	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:36.164932	2013-06-27 21:33:36.164932
3090	1013	Menu item was shown: bundle 1,2,4	2013-06-27 21:33:36.711101	2013-06-27 21:33:36.711101
3091	908	Menu item was shown: bundle 2,3	2013-06-27 21:33:37.272701	2013-06-27 21:33:37.272701
3092	201	Menu item was hidden: bundle 1,2,4,5	2013-06-27 21:33:37.626099	2013-06-27 21:33:37.626099
3093	201	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:37.86119	2013-06-27 21:33:37.86119
3094	973	Menu item was shown: bundle 1,4	2013-06-27 21:33:38.148053	2013-06-27 21:33:38.148053
3095	1013	Menu item was shown: bundle 1,2,5	2013-06-27 21:33:38.425303	2013-06-27 21:33:38.425303
3096	973	Menu item was shown: bundle 1,3	2013-06-27 21:33:38.609153	2013-06-27 21:33:38.609153
3097	201	Menu item was hidden: bundle 1,3,4,5	2013-06-27 21:33:38.681392	2013-06-27 21:33:38.681392
3098	945	Menu item was shown: bundle 2,3	2013-06-27 21:33:38.734822	2013-06-27 21:33:38.734822
3099	973	Menu item was shown: bundle 1,2	2013-06-27 21:33:38.834584	2013-06-27 21:33:38.834584
3100	1013	Menu item was shown: bundle 1,3,4	2013-06-27 21:33:39.02247	2013-06-27 21:33:39.02247
3101	1013	Menu item was shown: bundle 1,3,5	2013-06-27 21:33:39.152873	2013-06-27 21:33:39.152873
3102	201	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:39.179434	2013-06-27 21:33:39.179434
3103	973	Menu item was shown: bundle 1,3	2013-06-27 21:33:39.216276	2013-06-27 21:33:39.216276
3104	1013	Menu item was shown: bundle 1,4,5	2013-06-27 21:33:40.147223	2013-06-27 21:33:40.147223
3105	908	Menu item was shown: bundle 2,4	2013-06-27 21:33:40.412596	2013-06-27 21:33:40.412596
3106	1013	Menu item was shown: bundle 2,3,4	2013-06-27 21:33:40.703859	2013-06-27 21:33:40.703859
3107	973	Menu item was shown: bundle 2,3	2013-06-27 21:33:40.954177	2013-06-27 21:33:40.954177
3108	1112	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:33:41.125672	2013-06-27 21:33:41.125672
3109	1013	Menu item was shown: bundle 2,3,5	2013-06-27 21:33:41.350483	2013-06-27 21:33:41.350483
3110	945	Menu item was shown: bundle 1,3	2013-06-27 21:33:41.68491	2013-06-27 21:33:41.68491
3111	973	Good 2 was clicked. Value is now: true	2013-06-27 21:33:42.58196	2013-06-27 21:33:42.58196
3112	1112	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:33:43.01239	2013-06-27 21:33:43.01239
3113	908	Menu item was shown: bundle 1,4	2013-06-27 21:33:43.060999	2013-06-27 21:33:43.060999
3114	973	Good 3 was clicked. Value is now: true	2013-06-27 21:33:43.106387	2013-06-27 21:33:43.106387
3115	1112	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:43.909988	2013-06-27 21:33:43.909988
3116	1112	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:44.335418	2013-06-27 21:33:44.335418
3117	1086	Menu item was shown: bundle 1,4,5	2013-06-27 21:33:44.815124	2013-06-27 21:33:44.815124
3118	973	Menu item was hidden: bundle 2,3	2013-06-27 21:33:44.925029	2013-06-27 21:33:44.925029
3119	1112	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:45.150341	2013-06-27 21:33:45.150341
3120	945	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:46.01114	2013-06-27 21:33:46.01114
3121	973	Menu item was shown: bundle 2,3	2013-06-27 21:33:47.005949	2013-06-27 21:33:47.005949
3122	908	Menu item was shown: bundle 2,4	2013-06-27 21:33:47.215107	2013-06-27 21:33:47.215107
3123	1099	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:33:47.457636	2013-06-27 21:33:47.457636
3124	945	Menu item was shown: bundle 1,3	2013-06-27 21:33:47.557952	2013-06-27 21:33:47.557952
3125	1099	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:33:47.816773	2013-06-27 21:33:47.816773
3126	1099	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:33:48.394593	2013-06-27 21:33:48.394593
3127	945	Menu item was shown: bundle 1,2	2013-06-27 21:33:48.503708	2013-06-27 21:33:48.503708
3128	973	Menu item was hidden: bundle 2,3	2013-06-27 21:33:48.749879	2013-06-27 21:33:48.749879
3129	1013	Menu item was shown: bundle 2,4,5	2013-06-27 21:33:51.21607	2013-06-27 21:33:51.21607
3130	1086	Menu item was shown: bundle 2,3,4	2013-06-27 21:33:51.669626	2013-06-27 21:33:51.669626
3131	908	Menu item was shown: bundle 3,4	2013-06-27 21:33:51.980991	2013-06-27 21:33:51.980991
3132	1112	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:33:52.700013	2013-06-27 21:33:52.700013
3133	1099	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:53.008415	2013-06-27 21:33:53.008415
3134	1112	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:33:53.686912	2013-06-27 21:33:53.686912
3135	908	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:53.829646	2013-06-27 21:33:53.829646
3136	1099	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:54.210632	2013-06-27 21:33:54.210632
3137	1112	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:54.626367	2013-06-27 21:33:54.626367
3138	945	Menu item was shown: bundle 1,3	2013-06-27 21:33:55.58626	2013-06-27 21:33:55.58626
3139	1099	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:55.784645	2013-06-27 21:33:55.784645
3140	1112	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:56.451438	2013-06-27 21:33:56.451438
3141	1013	Menu item was shown: bundle 3,4,5	2013-06-27 21:33:56.6847	2013-06-27 21:33:56.6847
3142	1013	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:57.456857	2013-06-27 21:33:57.456857
3143	1112	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:33:57.808037	2013-06-27 21:33:57.808037
3144	945	Menu item was shown: bundle 2,3	2013-06-27 21:33:58.20745	2013-06-27 21:33:58.20745
3145	1099	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:33:58.321423	2013-06-27 21:33:58.321423
3146	1013	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:33:58.444129	2013-06-27 21:33:58.444129
3147	1086	Menu item was shown: bundle 2,3,5	2013-06-27 21:33:58.513441	2013-06-27 21:33:58.513441
3148	945	Menu item was shown: bundle 1,2,3	2013-06-27 21:33:58.963449	2013-06-27 21:33:58.963449
3149	908	Good 1 was clicked. Value is now: false	2013-06-27 21:33:59.978544	2013-06-27 21:33:59.978544
3150	908	Good 1 was clicked. Value is now: true	2013-06-27 21:34:00.501411	2013-06-27 21:34:00.501411
3151	908	Good 2 was clicked. Value is now: true	2013-06-27 21:34:00.905735	2013-06-27 21:34:00.905735
3152	908	Good 3 was clicked. Value is now: true	2013-06-27 21:34:01.320703	2013-06-27 21:34:01.320703
3153	1112	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:34:01.866086	2013-06-27 21:34:01.866086
3154	908	Good 4 was clicked. Value is now: false	2013-06-27 21:34:01.940866	2013-06-27 21:34:01.940866
3155	945	Combo was clicked. Value is now: true	2013-06-27 21:34:02.282047	2013-06-27 21:34:02.282047
3156	1099	Menu item was shown: bundle 2,3,5	2013-06-27 21:34:02.330895	2013-06-27 21:34:02.330895
3157	1086	Menu item was shown: bundle 2,4,5	2013-06-27 21:34:04.340165	2013-06-27 21:34:04.340165
3158	985	Menu item was shown: bundle 1,2	2013-06-27 21:34:05.349464	2013-06-27 21:34:05.349464
3159	908	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:06.012917	2013-06-27 21:34:06.012917
3160	1099	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:06.047133	2013-06-27 21:34:06.047133
3161	985	Menu item was shown: bundle 1,3	2013-06-27 21:34:06.274021	2013-06-27 21:34:06.274021
3162	1099	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:06.652736	2013-06-27 21:34:06.652736
3163	1013	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:34:07.552491	2013-06-27 21:34:07.552491
3164	908	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:08.117006	2013-06-27 21:34:08.117006
3165	985	Menu item was shown: bundle 1,4	2013-06-27 21:34:08.189221	2013-06-27 21:34:08.189221
3166	1013	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:34:08.341898	2013-06-27 21:34:08.341898
3167	1013	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:34:08.920232	2013-06-27 21:34:08.920232
3168	1086	Menu item was shown: bundle 3,4,5	2013-06-27 21:34:09.266702	2013-06-27 21:34:09.266702
3169	985	Menu item was shown: bundle 1,3	2013-06-27 21:34:09.299655	2013-06-27 21:34:09.299655
3170	908	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:09.368599	2013-06-27 21:34:09.368599
3171	985	Menu item was shown: bundle 1,2	2013-06-27 21:34:10.421172	2013-06-27 21:34:10.421172
3172	1013	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:34:10.577273	2013-06-27 21:34:10.577273
3173	985	Menu item was shown: bundle 1,3	2013-06-27 21:34:11.352693	2013-06-27 21:34:11.352693
3174	1013	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:34:11.585683	2013-06-27 21:34:11.585683
3175	985	Menu item was shown: bundle 2,3	2013-06-27 21:34:12.339248	2013-06-27 21:34:12.339248
3176	1112	Menu item was shown: bundle 2,3,5	2013-06-27 21:34:13.074958	2013-06-27 21:34:13.074958
3177	1099	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:34:13.54465	2013-06-27 21:34:13.54465
3178	413	Menu item was shown: bundle 1,2	2013-06-27 21:34:13.572159	2013-06-27 21:34:13.572159
3179	1112	Menu item was shown: bundle 2,4,5	2013-06-27 21:34:13.765423	2013-06-27 21:34:13.765423
3180	985	Menu item was shown: bundle 1,2	2013-06-27 21:34:13.959349	2013-06-27 21:34:13.959349
3181	1086	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:14.24434	2013-06-27 21:34:14.24434
3182	985	Menu item was hidden: bundle 1,2	2013-06-27 21:34:14.265697	2013-06-27 21:34:14.265697
3183	1112	Menu item was shown: bundle 3,4,5	2013-06-27 21:34:14.287108	2013-06-27 21:34:14.287108
3184	413	Menu item was shown: bundle 1,3	2013-06-27 21:34:14.822167	2013-06-27 21:34:14.822167
3185	985	Menu item was shown: bundle 2,3	2013-06-27 21:34:14.898902	2013-06-27 21:34:14.898902
3186	1112	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:14.987007	2013-06-27 21:34:14.987007
3187	1112	Menu item was shown: bundle 1,4,5	2013-06-27 21:34:15.677979	2013-06-27 21:34:15.677979
3188	945	Menu item was shown: bundle 1,2	2013-06-27 21:34:15.697816	2013-06-27 21:34:15.697816
3189	985	Menu item was shown: bundle 2,4	2013-06-27 21:34:16.060529	2013-06-27 21:34:16.060529
3190	1112	Menu item was shown: bundle 1,3,5	2013-06-27 21:34:16.080608	2013-06-27 21:34:16.080608
3191	413	Menu item was shown: bundle 1,2	2013-06-27 21:34:16.320996	2013-06-27 21:34:16.320996
3192	1112	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:16.61406	2013-06-27 21:34:16.61406
3193	985	Menu item was shown: bundle 3,4	2013-06-27 21:34:18.049552	2013-06-27 21:34:18.049552
3194	413	Good 1 was clicked. Value is now: true	2013-06-27 21:34:18.461735	2013-06-27 21:34:18.461735
3195	1013	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:34:18.774126	2013-06-27 21:34:18.774126
3196	413	Good 2 was clicked. Value is now: true	2013-06-27 21:34:18.916578	2013-06-27 21:34:18.916578
3197	945	Menu item was shown: bundle 1,3	2013-06-27 21:34:19.30836	2013-06-27 21:34:19.30836
3198	985	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:19.392835	2013-06-27 21:34:19.392835
3199	413	Menu item was shown: bundle 1,3	2013-06-27 21:34:19.590889	2013-06-27 21:34:19.590889
3200	985	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:20.14588	2013-06-27 21:34:20.14588
3201	1086	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:34:20.604525	2013-06-27 21:34:20.604525
3202	1013	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:34:21.135209	2013-06-27 21:34:21.135209
3203	985	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:21.570435	2013-06-27 21:34:21.570435
3204	1112	Menu item was shown: bundle 1,2,5	2013-06-27 21:34:21.664056	2013-06-27 21:34:21.664056
3205	1112	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:22.039832	2013-06-27 21:34:22.039832
3206	985	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:22.187973	2013-06-27 21:34:22.187973
3207	413	Good 3 was clicked. Value is now: true	2013-06-27 21:34:22.222106	2013-06-27 21:34:22.222106
3208	413	Good 2 was clicked. Value is now: false	2013-06-27 21:34:22.239255	2013-06-27 21:34:22.239255
3209	1112	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:22.343762	2013-06-27 21:34:22.343762
3210	1112	Menu item was shown: bundle 4,5	2013-06-27 21:34:22.731326	2013-06-27 21:34:22.731326
3211	1112	Menu item was shown: bundle 3,5	2013-06-27 21:34:23.150205	2013-06-27 21:34:23.150205
3212	297	Menu item was shown: bundle 1,2	2013-06-27 21:34:23.254212	2013-06-27 21:34:23.254212
3213	1112	Menu item was shown: bundle 3,4	2013-06-27 21:34:23.512907	2013-06-27 21:34:23.512907
3214	945	Menu item was shown: bundle 2,3	2013-06-27 21:34:23.676585	2013-06-27 21:34:23.676585
3215	1112	Menu item was shown: bundle 2,5	2013-06-27 21:34:23.956087	2013-06-27 21:34:23.956087
3216	985	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:24.183416	2013-06-27 21:34:24.183416
3217	1112	Menu item was shown: bundle 2,4	2013-06-27 21:34:24.413673	2013-06-27 21:34:24.413673
3218	1112	Menu item was shown: bundle 2,3	2013-06-27 21:34:24.853295	2013-06-27 21:34:24.853295
3219	1112	Menu item was shown: bundle 1,5	2013-06-27 21:34:25.232764	2013-06-27 21:34:25.232764
3220	1050	Menu item was shown: bundle 1,2	2013-06-27 21:34:25.337552	2013-06-27 21:34:25.337552
3221	1112	Menu item was shown: bundle 1,3	2013-06-27 21:34:26.553889	2013-06-27 21:34:26.553889
3222	985	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:26.68625	2013-06-27 21:34:26.68625
3223	1112	Menu item was shown: bundle 1,2	2013-06-27 21:34:27.011306	2013-06-27 21:34:27.011306
3224	945	Menu item was shown: bundle 1,2	2013-06-27 21:34:27.114745	2013-06-27 21:34:27.114745
3225	985	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:27.324444	2013-06-27 21:34:27.324444
3226	297	Good 2 was clicked. Value is now: true	2013-06-27 21:34:27.439442	2013-06-27 21:34:27.439442
3227	1112	Menu item was shown: bundle 1,4	2013-06-27 21:34:27.690292	2013-06-27 21:34:27.690292
3228	945	Menu item was shown: bundle 1,3	2013-06-27 21:34:28.163437	2013-06-27 21:34:28.163437
3229	985	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:28.284333	2013-06-27 21:34:28.284333
3230	1112	Menu item was shown: bundle 1,2	2013-06-27 21:34:28.47392	2013-06-27 21:34:28.47392
3231	297	Menu item was shown: bundle 1,3	2013-06-27 21:34:28.595432	2013-06-27 21:34:28.595432
3232	1112	Menu item was shown: bundle 1,3	2013-06-27 21:34:29.028349	2013-06-27 21:34:29.028349
3233	1050	Menu item was shown: bundle 1,3	2013-06-27 21:34:29.093571	2013-06-27 21:34:29.093571
3234	1050	Menu item was shown: bundle 1,4	2013-06-27 21:34:30.13275	2013-06-27 21:34:30.13275
3235	985	Menu item was shown: bundle 1,2	2013-06-27 21:34:30.227149	2013-06-27 21:34:30.227149
3236	985	Menu item was shown: bundle 1,3	2013-06-27 21:34:30.985984	2013-06-27 21:34:30.985984
3237	1086	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:34:31.135518	2013-06-27 21:34:31.135518
3238	985	Menu item was shown: bundle 1,4	2013-06-27 21:34:31.490399	2013-06-27 21:34:31.490399
3239	945	Menu item was shown: bundle 2,3	2013-06-27 21:34:32.58123	2013-06-27 21:34:32.58123
3240	1013	Good 2 was clicked. Value is now: true	2013-06-27 21:34:32.637943	2013-06-27 21:34:32.637943
3241	985	Good 1 was clicked. Value is now: true	2013-06-27 21:34:32.778077	2013-06-27 21:34:32.778077
3242	413	Menu item was shown: bundle 1,4	2013-06-27 21:34:33.454053	2013-06-27 21:34:33.454053
3243	945	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:33.98179	2013-06-27 21:34:33.98179
3244	1013	Good 1 was clicked. Value is now: true	2013-06-27 21:34:34.156389	2013-06-27 21:34:34.156389
3245	413	Menu item was shown: bundle 2,3	2013-06-27 21:34:34.236886	2013-06-27 21:34:34.236886
3246	297	Menu item was shown: bundle 1,4	2013-06-27 21:34:34.346537	2013-06-27 21:34:34.346537
3247	985	Menu item was shown: bundle 2,4	2013-06-27 21:34:34.742241	2013-06-27 21:34:34.742241
3248	413	Menu item was shown: bundle 2,4	2013-06-27 21:34:35.310119	2013-06-27 21:34:35.310119
3249	297	Menu item was shown: bundle 2,3	2013-06-27 21:34:35.439638	2013-06-27 21:34:35.439638
3250	297	Menu item was shown: bundle 2,4	2013-06-27 21:34:36.586013	2013-06-27 21:34:36.586013
3251	1013	Good 3 was clicked. Value is now: true	2013-06-27 21:34:36.998067	2013-06-27 21:34:36.998067
3252	297	Menu item was shown: bundle 3,4	2013-06-27 21:34:37.086988	2013-06-27 21:34:37.086988
3253	413	Menu item was shown: bundle 3,4	2013-06-27 21:34:37.668906	2013-06-27 21:34:37.668906
3254	413	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:38.298958	2013-06-27 21:34:38.298958
3255	1013	Good 5 was clicked. Value is now: true	2013-06-27 21:34:38.373633	2013-06-27 21:34:38.373633
3256	1050	Good 1 was clicked. Value is now: true	2013-06-27 21:34:39.540518	2013-06-27 21:34:39.540518
3257	1050	Good 4 was clicked. Value is now: true	2013-06-27 21:34:39.81031	2013-06-27 21:34:39.81031
3258	1086	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:34:40.445422	2013-06-27 21:34:40.445422
3259	297	Good 3 was clicked. Value is now: true	2013-06-27 21:34:41.432721	2013-06-27 21:34:41.432721
3260	413	Good 2 was clicked. Value is now: true	2013-06-27 21:34:41.690108	2013-06-27 21:34:41.690108
3261	1050	Menu item was shown: bundle 2,3	2013-06-27 21:34:42.112117	2013-06-27 21:34:42.112117
3262	297	Good 4 was clicked. Value is now: true	2013-06-27 21:34:42.328579	2013-06-27 21:34:42.328579
3263	297	Good 2 was clicked. Value is now: false	2013-06-27 21:34:42.970888	2013-06-27 21:34:42.970888
3264	1050	Menu item was shown: bundle 2,4	2013-06-27 21:34:43.0707	2013-06-27 21:34:43.0707
3265	1050	Menu item was shown: bundle 3,4	2013-06-27 21:34:44.828719	2013-06-27 21:34:44.828719
3266	699	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:45.166181	2013-06-27 21:34:45.166181
3267	1050	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:45.768691	2013-06-27 21:34:45.768691
3268	413	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:46.433244	2013-06-27 21:34:46.433244
3269	297	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:46.474586	2013-06-27 21:34:46.474586
3270	1013	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:46.514801	2013-06-27 21:34:46.514801
3271	1120	Menu item was shown: bundle 1,2	2013-06-27 21:34:46.670819	2013-06-27 21:34:46.670819
3272	413	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:47.360112	2013-06-27 21:34:47.360112
3273	1013	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:34:47.873923	2013-06-27 21:34:47.873923
3274	1120	Menu item was hidden: bundle 1,2	2013-06-27 21:34:48.328821	2013-06-27 21:34:48.328821
3275	413	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:48.564033	2013-06-27 21:34:48.564033
3276	1120	Menu item was shown: bundle 1,3	2013-06-27 21:34:48.676951	2013-06-27 21:34:48.676951
3277	297	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:48.874853	2013-06-27 21:34:48.874853
3278	413	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:49.115393	2013-06-27 21:34:49.115393
3279	1120	Menu item was hidden: bundle 1,3	2013-06-27 21:34:49.340278	2013-06-27 21:34:49.340278
3280	297	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:49.60154	2013-06-27 21:34:49.60154
3281	1120	Menu item was shown: bundle 2,3	2013-06-27 21:34:49.943568	2013-06-27 21:34:49.943568
3282	297	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:50.322776	2013-06-27 21:34:50.322776
3283	699	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:50.47969	2013-06-27 21:34:50.47969
3284	1120	Menu item was hidden: bundle 2,3	2013-06-27 21:34:50.622571	2013-06-27 21:34:50.622571
3285	1086	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:34:50.954194	2013-06-27 21:34:50.954194
3286	297	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:51.404712	2013-06-27 21:34:51.404712
3287	1120	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:52.039767	2013-06-27 21:34:52.039767
3288	908	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:52.241701	2013-06-27 21:34:52.241701
3289	1120	Menu item was hidden: bundle 1,2,3	2013-06-27 21:34:52.277025	2013-06-27 21:34:52.277025
3290	908	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:34:52.493535	2013-06-27 21:34:52.493535
3291	908	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:34:53.143751	2013-06-27 21:34:53.143751
3292	1120	Menu item was shown: bundle 1,3	2013-06-27 21:34:53.461449	2013-06-27 21:34:53.461449
3293	1120	Menu item was hidden: bundle 1,3	2013-06-27 21:34:53.952757	2013-06-27 21:34:53.952757
3294	1120	Menu item was shown: bundle 1,2	2013-06-27 21:34:54.354817	2013-06-27 21:34:54.354817
3295	1050	Menu item was shown: bundle 1,2,4	2013-06-27 21:34:54.556861	2013-06-27 21:34:54.556861
3296	1120	Menu item was shown: bundle 1,3	2013-06-27 21:34:54.972096	2013-06-27 21:34:54.972096
3297	297	Menu item was shown: bundle 3,4	2013-06-27 21:34:55.554064	2013-06-27 21:34:55.554064
3298	1050	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:55.96967	2013-06-27 21:34:55.96967
3299	1120	Menu item was shown: bundle 1,2,3	2013-06-27 21:34:56.173794	2013-06-27 21:34:56.173794
3300	699	Menu item was shown: bundle 1,3,4	2013-06-27 21:34:57.178743	2013-06-27 21:34:57.178743
3301	1024	Menu item was shown: bundle 1,2	2013-06-27 21:34:57.511566	2013-06-27 21:34:57.511566
3302	908	Menu item was shown: bundle 1,2	2013-06-27 21:34:57.659546	2013-06-27 21:34:57.659546
3303	1086	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:34:59.433231	2013-06-27 21:34:59.433231
3304	1050	Menu item was shown: bundle 2,3,4	2013-06-27 21:34:59.555399	2013-06-27 21:34:59.555399
3305	1050	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:35:00.185314	2013-06-27 21:35:00.185314
3306	945	Menu item was shown: bundle 2,3	2013-06-27 21:35:01.328975	2013-06-27 21:35:01.328975
3307	908	Menu item was shown: bundle 1,3	2013-06-27 21:35:01.466348	2013-06-27 21:35:01.466348
3308	1024	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:35:02.047495	2013-06-27 21:35:02.047495
3309	945	Menu item was shown: bundle 1,3	2013-06-27 21:35:02.135925	2013-06-27 21:35:02.135925
3310	945	Menu item was shown: bundle 1,2	2013-06-27 21:35:02.378309	2013-06-27 21:35:02.378309
3311	699	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:02.581533	2013-06-27 21:35:02.581533
3312	1013	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:35:04.213285	2013-06-27 21:35:04.213285
3313	699	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:06.08244	2013-06-27 21:35:06.08244
3314	1050	Menu item was shown: bundle 1,4	2013-06-27 21:35:06.522065	2013-06-27 21:35:06.522065
3315	1120	Menu item was shown: bundle 1,2	2013-06-27 21:35:06.819213	2013-06-27 21:35:06.819213
3316	1024	Menu item was shown: bundle 1,2	2013-06-27 21:35:06.920904	2013-06-27 21:35:06.920904
3317	699	Menu item was shown: bundle 3,4	2013-06-27 21:35:07.077663	2013-06-27 21:35:07.077663
3318	1120	Menu item was hidden: bundle 1,2	2013-06-27 21:35:07.449337	2013-06-27 21:35:07.449337
3319	1086	Good 3 was clicked. Value is now: true	2013-06-27 21:35:07.633909	2013-06-27 21:35:07.633909
3320	1024	Menu item was shown: bundle 1,3	2013-06-27 21:35:08.11457	2013-06-27 21:35:08.11457
3321	908	Menu item was shown: bundle 1,4	2013-06-27 21:35:08.278747	2013-06-27 21:35:08.278747
3322	1086	Good 4 was clicked. Value is now: true	2013-06-27 21:35:08.401344	2013-06-27 21:35:08.401344
3323	1120	Menu item was shown: bundle 1,3	2013-06-27 21:35:08.734161	2013-06-27 21:35:08.734161
3324	1024	Menu item was shown: bundle 1,4	2013-06-27 21:35:10.838935	2013-06-27 21:35:10.838935
3325	908	Menu item was shown: bundle 2,3	2013-06-27 21:35:13.268523	2013-06-27 21:35:13.268523
3326	1050	Menu item was shown: bundle 2,3	2013-06-27 21:35:13.517797	2013-06-27 21:35:13.517797
3327	1024	Menu item was shown: bundle 2,3	2013-06-27 21:35:14.291468	2013-06-27 21:35:14.291468
3328	540	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:15.174467	2013-06-27 21:35:15.174467
3329	1050	Menu item was shown: bundle 2,4	2013-06-27 21:35:15.411785	2013-06-27 21:35:15.411785
3330	1050	Menu item was shown: bundle 3,4	2013-06-27 21:35:16.186146	2013-06-27 21:35:16.186146
3331	1050	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:16.752763	2013-06-27 21:35:16.752763
3332	540	Menu item was shown: bundle 2,3,4	2013-06-27 21:35:18.162588	2013-06-27 21:35:18.162588
3333	1024	Menu item was shown: bundle 2,4	2013-06-27 21:35:19.008624	2013-06-27 21:35:19.008624
3334	908	Menu item was shown: bundle 2,4	2013-06-27 21:35:19.792396	2013-06-27 21:35:19.792396
3335	540	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:35:21.123281	2013-06-27 21:35:21.123281
3336	1024	Menu item was shown: bundle 3,4	2013-06-27 21:35:22.716422	2013-06-27 21:35:22.716422
3337	1013	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:35:22.980342	2013-06-27 21:35:22.980342
3338	1024	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:23.377222	2013-06-27 21:35:23.377222
3339	699	Menu item was shown: bundle 2,4	2013-06-27 21:35:26.09137	2013-06-27 21:35:26.09137
3340	699	Menu item was shown: bundle 2,3	2013-06-27 21:35:26.726846	2013-06-27 21:35:26.726846
3341	1024	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:27.86788	2013-06-27 21:35:27.86788
3342	540	Menu item was shown: bundle 1,2	2013-06-27 21:35:29.426952	2013-06-27 21:35:29.426952
3343	699	Menu item was shown: bundle 1,4	2013-06-27 21:35:29.675663	2013-06-27 21:35:29.675663
3344	540	Menu item was shown: bundle 1,3	2013-06-27 21:35:30.661237	2013-06-27 21:35:30.661237
3345	540	Menu item was shown: bundle 1,4	2013-06-27 21:35:31.618403	2013-06-27 21:35:31.618403
3346	1024	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:31.80562	2013-06-27 21:35:31.80562
3347	540	Menu item was shown: bundle 1,5	2013-06-27 21:35:31.886288	2013-06-27 21:35:31.886288
3348	540	Menu item was shown: bundle 2,3	2013-06-27 21:35:32.425391	2013-06-27 21:35:32.425391
3349	699	Menu item was shown: bundle 1,3	2013-06-27 21:35:33.203542	2013-06-27 21:35:33.203542
3350	540	Menu item was shown: bundle 2,4	2013-06-27 21:35:33.639043	2013-06-27 21:35:33.639043
3351	540	Menu item was shown: bundle 2,5	2013-06-27 21:35:34.387792	2013-06-27 21:35:34.387792
3352	699	Menu item was shown: bundle 1,2	2013-06-27 21:35:34.644708	2013-06-27 21:35:34.644708
3353	540	Menu item was shown: bundle 3,4	2013-06-27 21:35:34.86944	2013-06-27 21:35:34.86944
3354	540	Menu item was shown: bundle 3,5	2013-06-27 21:35:35.592143	2013-06-27 21:35:35.592143
3355	1024	Menu item was shown: bundle 2,3,4	2013-06-27 21:35:36.498081	2013-06-27 21:35:36.498081
3356	540	Menu item was shown: bundle 3,4	2013-06-27 21:35:36.743338	2013-06-27 21:35:36.743338
3357	241	Menu item was shown: bundle 1,2	2013-06-27 21:35:38.031425	2013-06-27 21:35:38.031425
3358	699	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:35:38.114764	2013-06-27 21:35:38.114764
3359	699	Menu item was shown: bundle 2,3,4	2013-06-27 21:35:38.803302	2013-06-27 21:35:38.803302
3360	1024	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:38.96913	2013-06-27 21:35:38.96913
3361	540	Menu item was shown: bundle 3,5	2013-06-27 21:35:39.241845	2013-06-27 21:35:39.241845
3362	241	Menu item was shown: bundle 1,3	2013-06-27 21:35:39.881399	2013-06-27 21:35:39.881399
3363	699	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:40.095509	2013-06-27 21:35:40.095509
3364	540	Menu item was shown: bundle 4,5	2013-06-27 21:35:40.607844	2013-06-27 21:35:40.607844
3365	699	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:40.702015	2013-06-27 21:35:40.702015
3366	241	Menu item was shown: bundle 1,4	2013-06-27 21:35:41.124241	2013-06-27 21:35:41.124241
3367	699	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:41.849426	2013-06-27 21:35:41.849426
3368	908	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:42.636429	2013-06-27 21:35:42.636429
3369	699	Menu item was shown: bundle 3,4	2013-06-27 21:35:42.768896	2013-06-27 21:35:42.768896
3370	241	Menu item was shown: bundle 1,5	2013-06-27 21:35:42.88677	2013-06-27 21:35:42.88677
3371	540	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:43.465485	2013-06-27 21:35:43.465485
3372	908	Menu item was shown: bundle 3,4	2013-06-27 21:35:43.541947	2013-06-27 21:35:43.541947
3373	241	Menu item was shown: bundle 2,3	2013-06-27 21:35:43.829309	2013-06-27 21:35:43.829309
3374	1024	Menu item was shown: bundle 2,4	2013-06-27 21:35:44.690771	2013-06-27 21:35:44.690771
3375	241	Menu item was shown: bundle 2,4	2013-06-27 21:35:45.023805	2013-06-27 21:35:45.023805
3376	699	Good 4 was clicked. Value is now: true	2013-06-27 21:35:45.881218	2013-06-27 21:35:45.881218
3377	699	Good 3 was clicked. Value is now: true	2013-06-27 21:35:46.306625	2013-06-27 21:35:46.306625
3378	908	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:46.631557	2013-06-27 21:35:46.631557
3379	241	Menu item was shown: bundle 2,5	2013-06-27 21:35:46.993536	2013-06-27 21:35:46.993536
3380	540	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:49.241018	2013-06-27 21:35:49.241018
3381	241	Menu item was shown: bundle 3,4	2013-06-27 21:35:49.360244	2013-06-27 21:35:49.360244
3382	1024	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:49.402471	2013-06-27 21:35:49.402471
3383	540	Menu item was shown: bundle 1,2,5	2013-06-27 21:35:49.68839	2013-06-27 21:35:49.68839
3384	990	Menu item was shown: bundle 1,2	2013-06-27 21:35:50.223107	2013-06-27 21:35:50.223107
3385	241	Menu item was shown: bundle 3,5	2013-06-27 21:35:50.958884	2013-06-27 21:35:50.958884
3386	540	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:50.989918	2013-06-27 21:35:50.989918
3387	908	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:51.900734	2013-06-27 21:35:51.900734
3388	241	Menu item was shown: bundle 4,5	2013-06-27 21:35:52.348388	2013-06-27 21:35:52.348388
3389	540	Menu item was shown: bundle 1,3,5	2013-06-27 21:35:52.494938	2013-06-27 21:35:52.494938
3390	241	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:52.97346	2013-06-27 21:35:52.97346
3391	1024	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:54.159309	2013-06-27 21:35:54.159309
3392	241	Menu item was shown: bundle 1,2,4	2013-06-27 21:35:54.284667	2013-06-27 21:35:54.284667
3393	990	Good 1 was clicked. Value is now: true	2013-06-27 21:35:54.322052	2013-06-27 21:35:54.322052
3394	990	Good 2 was clicked. Value is now: true	2013-06-27 21:35:54.991969	2013-06-27 21:35:54.991969
3395	540	Menu item was shown: bundle 1,4,5	2013-06-27 21:35:55.735239	2013-06-27 21:35:55.735239
3396	1024	Good 1 was clicked. Value is now: true	2013-06-27 21:35:55.888893	2013-06-27 21:35:55.888893
3397	990	Menu item was shown: bundle 1,3	2013-06-27 21:35:56.036017	2013-06-27 21:35:56.036017
3398	241	Menu item was shown: bundle 1,2,5	2013-06-27 21:35:56.094493	2013-06-27 21:35:56.094493
3399	1117	Menu item was shown: bundle 1,2	2013-06-27 21:35:57.120747	2013-06-27 21:35:57.120747
3400	241	Menu item was shown: bundle 1,3,4	2013-06-27 21:35:57.660854	2013-06-27 21:35:57.660854
3401	1024	Menu item was shown: bundle 2,4	2013-06-27 21:35:57.770866	2013-06-27 21:35:57.770866
3402	1117	Menu item was shown: bundle 1,3	2013-06-27 21:35:57.961277	2013-06-27 21:35:57.961277
3403	990	Menu item was shown: bundle 2,3	2013-06-27 21:35:58.149039	2013-06-27 21:35:58.149039
3404	1117	Menu item was shown: bundle 1,4	2013-06-27 21:35:58.235078	2013-06-27 21:35:58.235078
3405	241	Menu item was shown: bundle 1,3,5	2013-06-27 21:35:59.437029	2013-06-27 21:35:59.437029
3406	990	Menu item was shown: bundle 1,2,3	2013-06-27 21:35:59.551316	2013-06-27 21:35:59.551316
3407	1024	Good 1 was clicked. Value is now: false	2013-06-27 21:36:01.145878	2013-06-27 21:36:01.145878
3408	241	Menu item was shown: bundle 1,4,5	2013-06-27 21:36:02.119282	2013-06-27 21:36:02.119282
3409	1117	Menu item was shown: bundle 1,5	2013-06-27 21:36:02.226478	2013-06-27 21:36:02.226478
3410	1117	Menu item was shown: bundle 2,3	2013-06-27 21:36:02.665302	2013-06-27 21:36:02.665302
3411	1117	Menu item was shown: bundle 2,4	2013-06-27 21:36:03.074153	2013-06-27 21:36:03.074153
3412	1117	Menu item was shown: bundle 2,3	2013-06-27 21:36:03.573944	2013-06-27 21:36:03.573944
3413	1024	Good 2 was clicked. Value is now: true	2013-06-27 21:36:03.607396	2013-06-27 21:36:03.607396
3414	241	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:03.765602	2013-06-27 21:36:03.765602
3415	1120	Combo was clicked. Value is now: true	2013-06-27 21:36:04.248634	2013-06-27 21:36:04.248634
3416	1024	Good 4 was clicked. Value is now: true	2013-06-27 21:36:04.595458	2013-06-27 21:36:04.595458
3417	990	Menu item was shown: bundle 1,2	2013-06-27 21:36:04.910408	2013-06-27 21:36:04.910408
3418	241	Menu item was shown: bundle 2,3,5	2013-06-27 21:36:05.867425	2013-06-27 21:36:05.867425
3419	1024	Menu item was shown: bundle 1,2,4	2013-06-27 21:36:06.592912	2013-06-27 21:36:06.592912
3420	1117	Menu item was shown: bundle 2,4	2013-06-27 21:36:06.63505	2013-06-27 21:36:06.63505
3421	1117	Menu item was shown: bundle 2,5	2013-06-27 21:36:07.191907	2013-06-27 21:36:07.191907
3422	1091	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:36:07.445619	2013-06-27 21:36:07.445619
3423	241	Menu item was shown: bundle 2,4,5	2013-06-27 21:36:07.467623	2013-06-27 21:36:07.467623
3424	1024	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:07.578782	2013-06-27 21:36:07.578782
3425	1117	Menu item was shown: bundle 3,4	2013-06-27 21:36:07.674359	2013-06-27 21:36:07.674359
3426	1117	Menu item was shown: bundle 3,5	2013-06-27 21:36:08.141244	2013-06-27 21:36:08.141244
3427	540	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:08.171982	2013-06-27 21:36:08.171982
3428	540	Menu item was shown: bundle 2,3,5	2013-06-27 21:36:09.039287	2013-06-27 21:36:09.039287
3429	1117	Menu item was shown: bundle 4,5	2013-06-27 21:36:09.312539	2013-06-27 21:36:09.312539
3430	1091	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:36:09.422541	2013-06-27 21:36:09.422541
3431	1117	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:09.85347	2013-06-27 21:36:09.85347
3432	540	Menu item was shown: bundle 2,4,5	2013-06-27 21:36:09.889109	2013-06-27 21:36:09.889109
3433	241	Menu item was shown: bundle 3,4,5	2013-06-27 21:36:10.013806	2013-06-27 21:36:10.013806
3434	1117	Menu item was shown: bundle 1,2,4	2013-06-27 21:36:10.272013	2013-06-27 21:36:10.272013
3435	990	Menu item was shown: bundle 1,3	2013-06-27 21:36:10.681198	2013-06-27 21:36:10.681198
3436	1117	Menu item was shown: bundle 1,2,5	2013-06-27 21:36:10.719711	2013-06-27 21:36:10.719711
3437	540	Menu item was shown: bundle 3,4,5	2013-06-27 21:36:11.06983	2013-06-27 21:36:11.06983
3438	1091	Menu item was shown: bundle 1,2	2013-06-27 21:36:11.182732	2013-06-27 21:36:11.182732
3439	1117	Menu item was shown: bundle 1,3,4	2013-06-27 21:36:11.316725	2013-06-27 21:36:11.316725
3440	908	Menu item was shown: bundle 1,3,4	2013-06-27 21:36:11.414426	2013-06-27 21:36:11.414426
3441	1117	Menu item was shown: bundle 1,3,5	2013-06-27 21:36:11.575103	2013-06-27 21:36:11.575103
3442	241	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:11.916741	2013-06-27 21:36:11.916741
3443	1117	Menu item was shown: bundle 1,3,4	2013-06-27 21:36:12.05865	2013-06-27 21:36:12.05865
3444	540	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:12.09193	2013-06-27 21:36:12.09193
3445	990	Menu item was shown: bundle 1,2	2013-06-27 21:36:12.735978	2013-06-27 21:36:12.735978
3446	241	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:36:13.412324	2013-06-27 21:36:13.412324
3447	223	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:13.923251	2013-06-27 21:36:13.923251
3448	241	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:36:14.337464	2013-06-27 21:36:14.337464
3449	241	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:36:15.223431	2013-06-27 21:36:15.223431
3450	540	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:36:15.944714	2013-06-27 21:36:15.944714
3451	1091	Good 1 was clicked. Value is now: true	2013-06-27 21:36:16.23	2013-06-27 21:36:16.23
3452	223	Menu item was shown: bundle 2,3	2013-06-27 21:36:16.449217	2013-06-27 21:36:16.449217
3453	241	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:36:16.59533	2013-06-27 21:36:16.59533
3454	1091	Good 2 was clicked. Value is now: true	2013-06-27 21:36:16.924953	2013-06-27 21:36:16.924953
3455	990	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:17.167559	2013-06-27 21:36:17.167559
3456	241	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:36:17.602626	2013-06-27 21:36:17.602626
3457	223	Menu item was shown: bundle 1,3	2013-06-27 21:36:18.42147	2013-06-27 21:36:18.42147
3458	990	Menu item was shown: bundle 2,3	2013-06-27 21:36:19.106503	2013-06-27 21:36:19.106503
3459	1091	Combo was clicked. Value is now: true	2013-06-27 21:36:19.572357	2013-06-27 21:36:19.572357
3460	908	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:20.526619	2013-06-27 21:36:20.526619
3461	212	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:20.80302	2013-06-27 21:36:20.80302
3462	540	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:36:21.064613	2013-06-27 21:36:21.064613
3463	1117	Menu item was shown: bundle 1,3,5	2013-06-27 21:36:21.154428	2013-06-27 21:36:21.154428
3464	223	Menu item was shown: bundle 1,2	2013-06-27 21:36:21.464232	2013-06-27 21:36:21.464232
3465	1117	Menu item was shown: bundle 1,4,5	2013-06-27 21:36:21.759032	2013-06-27 21:36:21.759032
3466	990	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:21.89552	2013-06-27 21:36:21.89552
3467	1117	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:22.201666	2013-06-27 21:36:22.201666
3468	223	Menu item was shown: bundle 1,3	2013-06-27 21:36:22.497089	2013-06-27 21:36:22.497089
3469	540	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:36:22.519569	2013-06-27 21:36:22.519569
3470	1117	Menu item was shown: bundle 2,3,5	2013-06-27 21:36:22.697277	2013-06-27 21:36:22.697277
3471	540	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:36:23.088048	2013-06-27 21:36:23.088048
3472	990	Menu item was shown: bundle 2,3	2013-06-27 21:36:23.143675	2013-06-27 21:36:23.143675
3473	1117	Menu item was shown: bundle 2,4,5	2013-06-27 21:36:23.162709	2013-06-27 21:36:23.162709
3474	1091	Menu item was shown: bundle 1,3	2013-06-27 21:36:23.326074	2013-06-27 21:36:23.326074
3475	1117	Menu item was shown: bundle 3,4,5	2013-06-27 21:36:23.598968	2013-06-27 21:36:23.598968
3476	223	Good 1 was clicked. Value is now: true	2013-06-27 21:36:23.690493	2013-06-27 21:36:23.690493
3477	540	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:36:23.831336	2013-06-27 21:36:23.831336
3478	212	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:36:24.242571	2013-06-27 21:36:24.242571
3479	1117	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:24.6584	2013-06-27 21:36:24.6584
3480	908	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:24.921401	2013-06-27 21:36:24.921401
3481	1117	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:36:25.16668	2013-06-27 21:36:25.16668
3482	990	Menu item was shown: bundle 1,3	2013-06-27 21:36:25.601154	2013-06-27 21:36:25.601154
3483	212	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:26.673804	2013-06-27 21:36:26.673804
3484	540	Combo was clicked. Value is now: true	2013-06-27 21:36:27.500417	2013-06-27 21:36:27.500417
3485	212	Menu item was hidden: bundle 2,3,4	2013-06-27 21:36:27.737592	2013-06-27 21:36:27.737592
3486	200	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:27.803623	2013-06-27 21:36:27.803623
3487	1091	Menu item was shown: bundle 1,4	2013-06-27 21:36:29.054411	2013-06-27 21:36:29.054411
3488	212	Menu item was shown: bundle 1,3,4	2013-06-27 21:36:29.553126	2013-06-27 21:36:29.553126
3489	990	Menu item was shown: bundle 1,2	2013-06-27 21:36:29.678697	2013-06-27 21:36:29.678697
3490	908	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:30.228235	2013-06-27 21:36:30.228235
3491	212	Menu item was hidden: bundle 1,3,4	2013-06-27 21:36:30.595774	2013-06-27 21:36:30.595774
3492	241	Combo was clicked. Value is now: true	2013-06-27 21:36:30.833349	2013-06-27 21:36:30.833349
3493	212	Menu item was shown: bundle 1,2,4	2013-06-27 21:36:31.246996	2013-06-27 21:36:31.246996
3494	212	Menu item was hidden: bundle 1,2,4	2013-06-27 21:36:32.224027	2013-06-27 21:36:32.224027
3495	212	Menu item was shown: bundle 1,2,3	2013-06-27 21:36:32.668963	2013-06-27 21:36:32.668963
3496	1091	Menu item was shown: bundle 1,5	2013-06-27 21:36:33.263074	2013-06-27 21:36:33.263074
3497	212	Menu item was hidden: bundle 1,2,3	2013-06-27 21:36:33.571778	2013-06-27 21:36:33.571778
3498	200	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:36:33.719512	2013-06-27 21:36:33.719512
3499	200	Menu item was shown: bundle 2,3,4	2013-06-27 21:36:33.758724	2013-06-27 21:36:33.758724
3500	212	Menu item was shown: bundle 3,4	2013-06-27 21:36:34.003412	2013-06-27 21:36:34.003412
3501	1117	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:36:35.071049	2013-06-27 21:36:35.071049
3502	200	Menu item was hidden: bundle 2,3,4	2013-06-27 21:36:35.515779	2013-06-27 21:36:35.515779
3503	1117	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:36:35.671614	2013-06-27 21:36:35.671614
3504	1117	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:36:36.117233	2013-06-27 21:36:36.117233
3505	741	Menu item was shown: bundle 1,4	2013-06-27 21:36:36.241406	2013-06-27 21:36:36.241406
3506	741	Menu item was hidden: bundle 1,4	2013-06-27 21:36:36.415976	2013-06-27 21:36:36.415976
3507	1117	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:36:36.61881	2013-06-27 21:36:36.61881
3508	1091	Menu item was shown: bundle 2,3	2013-06-27 21:36:36.920771	2013-06-27 21:36:36.920771
3509	200	Good 1 was clicked. Value is now: true	2013-06-27 21:36:37.056092	2013-06-27 21:36:37.056092
3510	212	Menu item was shown: bundle 2,4	2013-06-27 21:36:37.749068	2013-06-27 21:36:37.749068
3511	200	Good 2 was clicked. Value is now: true	2013-06-27 21:36:37.812876	2013-06-27 21:36:37.812876
3512	200	Good 3 was clicked. Value is now: true	2013-06-27 21:36:38.342616	2013-06-27 21:36:38.342616
3513	200	Good 4 was clicked. Value is now: true	2013-06-27 21:36:38.751818	2013-06-27 21:36:38.751818
3514	212	Menu item was shown: bundle 2,3	2013-06-27 21:36:39.016373	2013-06-27 21:36:39.016373
3515	741	Menu item was shown: bundle 1,2	2013-06-27 21:36:40.443404	2013-06-27 21:36:40.443404
3516	212	Menu item was shown: bundle 1,4	2013-06-27 21:36:42.389201	2013-06-27 21:36:42.389201
3517	1091	Menu item was shown: bundle 2,4	2013-06-27 21:36:43.890996	2013-06-27 21:36:43.890996
3518	741	Good 1 was clicked. Value is now: true	2013-06-27 21:36:45.105654	2013-06-27 21:36:45.105654
3519	741	Good 2 was clicked. Value is now: true	2013-06-27 21:36:45.47713	2013-06-27 21:36:45.47713
3520	212	Menu item was shown: bundle 1,3	2013-06-27 21:36:45.500988	2013-06-27 21:36:45.500988
3521	212	Menu item was shown: bundle 1,2	2013-06-27 21:36:46.733195	2013-06-27 21:36:46.733195
3522	741	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:36:47.673725	2013-06-27 21:36:47.673725
3523	212	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:36:50.976909	2013-06-27 21:36:50.976909
3524	741	Combo was clicked. Value is now: true	2013-06-27 21:36:51.751661	2013-06-27 21:36:51.751661
3525	1091	Menu item was shown: bundle 2,5	2013-06-27 21:36:52.043552	2013-06-27 21:36:52.043552
3526	741	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:36:53.946887	2013-06-27 21:36:53.946887
3527	1091	Menu item was shown: bundle 3,4	2013-06-27 21:36:54.798604	2013-06-27 21:36:54.798604
3528	212	Combo was clicked. Value is now: true	2013-06-27 21:36:56.878102	2013-06-27 21:36:56.878102
3529	958	Menu item was shown: bundle 1,2	2013-06-27 21:36:58.044862	2013-06-27 21:36:58.044862
3530	1091	Menu item was shown: bundle 3,5	2013-06-27 21:36:58.295654	2013-06-27 21:36:58.295654
3531	1117	Combo was clicked. Value is now: true	2013-06-27 21:36:58.536133	2013-06-27 21:36:58.536133
3532	958	Menu item was shown: bundle 1,3	2013-06-27 21:36:59.668408	2013-06-27 21:36:59.668408
3533	958	Good 1 was clicked. Value is now: true	2013-06-27 21:37:02.540522	2013-06-27 21:37:02.540522
3534	958	Good 3 was clicked. Value is now: true	2013-06-27 21:37:03.764819	2013-06-27 21:37:03.764819
3535	958	Menu item was shown: bundle 2,3	2013-06-27 21:37:05.113471	2013-06-27 21:37:05.113471
3536	1117	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:37:05.546764	2013-06-27 21:37:05.546764
3537	958	Menu item was shown: bundle 1,2,3	2013-06-27 21:37:06.364216	2013-06-27 21:37:06.364216
3538	1091	Good 3 was clicked. Value is now: true	2013-06-27 21:37:06.610199	2013-06-27 21:37:06.610199
3539	1117	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:37:06.921119	2013-06-27 21:37:06.921119
3540	1091	Good 5 was clicked. Value is now: true	2013-06-27 21:37:07.121143	2013-06-27 21:37:07.121143
3541	1117	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:37:07.590773	2013-06-27 21:37:07.590773
3542	1117	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:37:08.111855	2013-06-27 21:37:08.111855
3543	1117	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:37:08.532309	2013-06-27 21:37:08.532309
3544	1117	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:37:08.923138	2013-06-27 21:37:08.923138
3545	958	Menu item was shown: bundle 1,3	2013-06-27 21:37:09.336234	2013-06-27 21:37:09.336234
3546	741	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:37:12.951419	2013-06-27 21:37:12.951419
3547	741	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:37:13.820216	2013-06-27 21:37:13.820216
3548	741	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:37:15.585743	2013-06-27 21:37:15.585743
3549	1117	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:37:16.449254	2013-06-27 21:37:16.449254
3550	741	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:37:16.801016	2013-06-27 21:37:16.801016
3551	1117	Menu item was shown: bundle 3,4,5	2013-06-27 21:37:16.833781	2013-06-27 21:37:16.833781
3552	1117	Menu item was shown: bundle 2,4,5	2013-06-27 21:37:17.218013	2013-06-27 21:37:17.218013
3553	1117	Menu item was shown: bundle 2,3,5	2013-06-27 21:37:17.714458	2013-06-27 21:37:17.714458
3554	1117	Menu item was shown: bundle 2,3,4	2013-06-27 21:37:18.101265	2013-06-27 21:37:18.101265
3555	1117	Menu item was shown: bundle 1,4,5	2013-06-27 21:37:18.385841	2013-06-27 21:37:18.385841
3556	1091	Menu item was shown: bundle 2,3,4	2013-06-27 21:37:18.460114	2013-06-27 21:37:18.460114
3557	1117	Menu item was shown: bundle 1,3,5	2013-06-27 21:37:18.757018	2013-06-27 21:37:18.757018
3558	1117	Menu item was shown: bundle 1,3,4	2013-06-27 21:37:19.155242	2013-06-27 21:37:19.155242
3559	1117	Menu item was hidden: bundle 1,3,4	2013-06-27 21:37:19.504173	2013-06-27 21:37:19.504173
3560	1117	Menu item was shown: bundle 1,3,4	2013-06-27 21:37:20.012989	2013-06-27 21:37:20.012989
3561	1091	Menu item was shown: bundle 3,5	2013-06-27 21:37:23.095082	2013-06-27 21:37:23.095082
3562	741	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:37:23.807229	2013-06-27 21:37:23.807229
3563	1117	Menu item was shown: bundle 1,2,5	2013-06-27 21:37:24.795218	2013-06-27 21:37:24.795218
3564	1117	Menu item was shown: bundle 1,2,4	2013-06-27 21:37:25.507762	2013-06-27 21:37:25.507762
3565	1117	Menu item was shown: bundle 1,2,3	2013-06-27 21:37:25.986877	2013-06-27 21:37:25.986877
3566	1117	Menu item was shown: bundle 4,5	2013-06-27 21:37:26.552362	2013-06-27 21:37:26.552362
3567	1117	Menu item was shown: bundle 3,5	2013-06-27 21:37:27.167482	2013-06-27 21:37:27.167482
3568	1117	Menu item was shown: bundle 3,4	2013-06-27 21:37:27.752339	2013-06-27 21:37:27.752339
3569	741	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:37:29.468902	2013-06-27 21:37:29.468902
3570	1091	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:37:29.814949	2013-06-27 21:37:29.814949
3571	1117	Menu item was shown: bundle 1,2	2013-06-27 21:37:31.1093	2013-06-27 21:37:31.1093
3572	1117	Menu item was shown: bundle 1,3	2013-06-27 21:37:31.685453	2013-06-27 21:37:31.685453
3573	1117	Menu item was shown: bundle 1,4	2013-06-27 21:37:32.698095	2013-06-27 21:37:32.698095
3574	1091	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:37:33.390613	2013-06-27 21:37:33.390613
3575	1091	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:37:34.820381	2013-06-27 21:37:34.820381
3576	1091	Menu item was shown: bundle 3,5	2013-06-27 21:37:39.011383	2013-06-27 21:37:39.011383
3577	741	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:37:39.355478	2013-06-27 21:37:39.355478
3578	741	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:37:40.394224	2013-06-27 21:37:40.394224
3579	1117	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:37:43.52445	2013-06-27 21:37:43.52445
3580	1091	Menu item was shown: bundle 4,5	2013-06-27 21:37:44.209413	2013-06-27 21:37:44.209413
3581	1117	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:37:47.74452	2013-06-27 21:37:47.74452
3582	741	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:37:48.400801	2013-06-27 21:37:48.400801
3583	1117	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:37:48.566946	2013-06-27 21:37:48.566946
3584	741	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:37:48.88107	2013-06-27 21:37:48.88107
3585	1117	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:37:49.108977	2013-06-27 21:37:49.108977
3586	1117	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:37:49.494276	2013-06-27 21:37:49.494276
3587	1117	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:37:50.274357	2013-06-27 21:37:50.274357
3588	1091	Menu item was shown: bundle 1,2,3	2013-06-27 21:37:51.014048	2013-06-27 21:37:51.014048
3589	1091	Good 1 was clicked. Value is now: true	2013-06-27 21:37:57.771645	2013-06-27 21:37:57.771645
3590	1091	Good 2 was clicked. Value is now: true	2013-06-27 21:37:58.348903	2013-06-27 21:37:58.348903
3591	902	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:37:58.673799	2013-06-27 21:37:58.673799
3592	1091	Good 5 was clicked. Value is now: false	2013-06-27 21:37:59.05239	2013-06-27 21:37:59.05239
3593	902	Menu item was shown: bundle 1,2	2013-06-27 21:38:07.894486	2013-06-27 21:38:07.894486
3594	990	Menu item was shown: bundle 1,3	2013-06-27 21:38:10.61841	2013-06-27 21:38:10.61841
3595	1102	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:38:11.471668	2013-06-27 21:38:11.471668
3596	1102	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:38:12.28738	2013-06-27 21:38:12.28738
3597	1102	Menu item was shown: bundle 1,2	2013-06-27 21:38:14.044915	2013-06-27 21:38:14.044915
3598	1102	Good 1 was clicked. Value is now: true	2013-06-27 21:38:15.988806	2013-06-27 21:38:15.988806
3599	1102	Good 2 was clicked. Value is now: true	2013-06-27 21:38:16.185059	2013-06-27 21:38:16.185059
3600	1091	Menu item was shown: bundle 1,2,4	2013-06-27 21:38:17.480688	2013-06-27 21:38:17.480688
3601	902	Menu item was shown: bundle 1,3	2013-06-27 21:38:18.778885	2013-06-27 21:38:18.778885
3602	946	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:38:19.335105	2013-06-27 21:38:19.335105
3603	990	Menu item was shown: bundle 2,3	2013-06-27 21:38:19.969329	2013-06-27 21:38:19.969329
3604	1102	Menu item was hidden: bundle 1,2	2013-06-27 21:38:20.279322	2013-06-27 21:38:20.279322
3605	902	Menu item was shown: bundle 1,4	2013-06-27 21:38:20.721134	2013-06-27 21:38:20.721134
3606	1009	Menu item was shown: bundle 1,2	2013-06-27 21:38:20.927639	2013-06-27 21:38:20.927639
3607	1102	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:21.778065	2013-06-27 21:38:21.778065
3608	946	Good 1 was clicked. Value is now: true	2013-06-27 21:38:22.547094	2013-06-27 21:38:22.547094
3609	990	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:22.56937	2013-06-27 21:38:22.56937
3610	946	Good 3 was clicked. Value is now: true	2013-06-27 21:38:23.301376	2013-06-27 21:38:23.301376
3611	1091	Menu item was shown: bundle 1,2,5	2013-06-27 21:38:23.442214	2013-06-27 21:38:23.442214
3612	946	Good 4 was clicked. Value is now: true	2013-06-27 21:38:23.809029	2013-06-27 21:38:23.809029
3613	902	Menu item was shown: bundle 2,3	2013-06-27 21:38:24.225509	2013-06-27 21:38:24.225509
3614	1102	Menu item was hidden: bundle 1,2,3	2013-06-27 21:38:24.248214	2013-06-27 21:38:24.248214
3615	968	Menu item was shown: bundle 1,2	2013-06-27 21:38:24.292677	2013-06-27 21:38:24.292677
3616	1009	Menu item was shown: bundle 1,3	2013-06-27 21:38:24.773568	2013-06-27 21:38:24.773568
3617	946	Good 2 was clicked. Value is now: true	2013-06-27 21:38:25.041644	2013-06-27 21:38:25.041644
3618	1102	Menu item was shown: bundle 1,2	2013-06-27 21:38:25.060574	2013-06-27 21:38:25.060574
3619	968	Menu item was hidden: bundle 1,2	2013-06-27 21:38:25.15651	2013-06-27 21:38:25.15651
3620	1009	Menu item was shown: bundle 2,3	2013-06-27 21:38:25.635591	2013-06-27 21:38:25.635591
3621	946	Menu item was shown: bundle 2,3,4	2013-06-27 21:38:26.21487	2013-06-27 21:38:26.21487
3622	1009	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:26.308954	2013-06-27 21:38:26.308954
3623	968	Menu item was shown: bundle 1,2	2013-06-27 21:38:27.52209	2013-06-27 21:38:27.52209
3624	1009	Menu item was shown: bundle 1,2	2013-06-27 21:38:27.932934	2013-06-27 21:38:27.932934
3625	968	Menu item was hidden: bundle 1,2	2013-06-27 21:38:28.027866	2013-06-27 21:38:28.027866
3626	902	Menu item was shown: bundle 2,4	2013-06-27 21:38:28.119939	2013-06-27 21:38:28.119939
3627	1009	Menu item was shown: bundle 2,3	2013-06-27 21:38:28.715156	2013-06-27 21:38:28.715156
3628	1091	Menu item was shown: bundle 1,3,4	2013-06-27 21:38:29.228947	2013-06-27 21:38:29.228947
3629	968	Menu item was shown: bundle 1,3	2013-06-27 21:38:29.323794	2013-06-27 21:38:29.323794
3630	1009	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:29.454107	2013-06-27 21:38:29.454107
3631	1009	Menu item was shown: bundle 1,2	2013-06-27 21:38:29.909182	2013-06-27 21:38:29.909182
3632	1102	Menu item was hidden: bundle 1,2	2013-06-27 21:38:29.928665	2013-06-27 21:38:29.928665
3633	968	Menu item was shown: bundle 1,4	2013-06-27 21:38:29.996156	2013-06-27 21:38:29.996156
3634	946	Good 1 was clicked. Value is now: false	2013-06-27 21:38:30.445484	2013-06-27 21:38:30.445484
3635	968	Menu item was shown: bundle 1,5	2013-06-27 21:38:30.606497	2013-06-27 21:38:30.606497
3636	968	Menu item was shown: bundle 2,4	2013-06-27 21:38:31.120459	2013-06-27 21:38:31.120459
3637	1102	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:38:31.167476	2013-06-27 21:38:31.167476
3638	1009	Good 1 was clicked. Value is now: true	2013-06-27 21:38:31.404586	2013-06-27 21:38:31.404586
3639	1102	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:38:31.632084	2013-06-27 21:38:31.632084
3640	1009	Good 2 was clicked. Value is now: true	2013-06-27 21:38:31.787924	2013-06-27 21:38:31.787924
3641	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:38:33.627552	2013-06-27 21:38:33.627552
3642	1091	Menu item was shown: bundle 1,3,5	2013-06-27 21:38:34.135055	2013-06-27 21:38:34.135055
3643	968	Menu item was shown: bundle 2,5	2013-06-27 21:38:34.692589	2013-06-27 21:38:34.692589
3644	968	Menu item was shown: bundle 3,4	2013-06-27 21:38:35.29361	2013-06-27 21:38:35.29361
3645	1009	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:35.56932	2013-06-27 21:38:35.56932
3646	968	Menu item was shown: bundle 3,5	2013-06-27 21:38:36.087543	2013-06-27 21:38:36.087543
3647	1102	Menu item was shown: bundle 1,3	2013-06-27 21:38:36.128274	2013-06-27 21:38:36.128274
3648	1102	Menu item was hidden: bundle 1,3	2013-06-27 21:38:36.728286	2013-06-27 21:38:36.728286
3649	968	Menu item was shown: bundle 4,5	2013-06-27 21:38:37.262624	2013-06-27 21:38:37.262624
3650	1102	Menu item was shown: bundle 1,2	2013-06-27 21:38:37.333189	2013-06-27 21:38:37.333189
3651	1091	Menu item was shown: bundle 1,4,5	2013-06-27 21:38:37.595165	2013-06-27 21:38:37.595165
3652	968	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:37.640516	2013-06-27 21:38:37.640516
3653	1102	Menu item was hidden: bundle 1,2	2013-06-27 21:38:37.664559	2013-06-27 21:38:37.664559
3654	902	Good 2 was clicked. Value is now: true	2013-06-27 21:38:37.780272	2013-06-27 21:38:37.780272
3655	902	Good 4 was clicked. Value is now: true	2013-06-27 21:38:39.335069	2013-06-27 21:38:39.335069
3656	946	Good 2 was clicked. Value is now: false	2013-06-27 21:38:39.954695	2013-06-27 21:38:39.954695
3657	1009	Menu item was shown: bundle 1,2	2013-06-27 21:38:40.223049	2013-06-27 21:38:40.223049
3658	946	Good 1 was clicked. Value is now: true	2013-06-27 21:38:40.34023	2013-06-27 21:38:40.34023
3659	902	Menu item was shown: bundle 3,4	2013-06-27 21:38:40.667566	2013-06-27 21:38:40.667566
3660	902	Menu item was shown: bundle 2,4	2013-06-27 21:38:41.833416	2013-06-27 21:38:41.833416
3661	968	Menu item was shown: bundle 1,2,4	2013-06-27 21:38:42.245199	2013-06-27 21:38:42.245199
3662	968	Menu item was shown: bundle 1,2,5	2013-06-27 21:38:42.903029	2013-06-27 21:38:42.903029
3663	946	Menu item was shown: bundle 1,2,4	2013-06-27 21:38:42.978224	2013-06-27 21:38:42.978224
3664	968	Menu item was shown: bundle 1,3,4	2013-06-27 21:38:43.642367	2013-06-27 21:38:43.642367
3665	1091	Menu item was shown: bundle 2,3,4	2013-06-27 21:38:44.198673	2013-06-27 21:38:44.198673
3666	902	Menu item was shown: bundle 3,4	2013-06-27 21:38:44.22152	2013-06-27 21:38:44.22152
3667	968	Menu item was shown: bundle 1,3,5	2013-06-27 21:38:44.27833	2013-06-27 21:38:44.27833
3668	1009	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:45.097974	2013-06-27 21:38:45.097974
3669	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:38:45.411052	2013-06-27 21:38:45.411052
3670	946	Menu item was shown: bundle 1,2,4	2013-06-27 21:38:46.220237	2013-06-27 21:38:46.220237
3671	946	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:48.07493	2013-06-27 21:38:48.07493
3672	902	Menu item was shown: bundle 1,2,3	2013-06-27 21:38:48.318625	2013-06-27 21:38:48.318625
3673	1091	Menu item was shown: bundle 2,3,5	2013-06-27 21:38:48.888892	2013-06-27 21:38:48.888892
3674	946	Menu item was shown: bundle 3,4	2013-06-27 21:38:49.822039	2013-06-27 21:38:49.822039
3675	968	Menu item was hidden: bundle 1,3,5	2013-06-27 21:38:51.307714	2013-06-27 21:38:51.307714
3676	946	Menu item was shown: bundle 2,4	2013-06-27 21:38:51.85901	2013-06-27 21:38:51.85901
3677	968	Menu item was shown: bundle 1,4,5	2013-06-27 21:38:51.937172	2013-06-27 21:38:51.937172
3678	946	Menu item was shown: bundle 2,3	2013-06-27 21:38:53.797767	2013-06-27 21:38:53.797767
3679	1091	Menu item was shown: bundle 2,4,5	2013-06-27 21:38:53.948103	2013-06-27 21:38:53.948103
3680	946	Menu item was shown: bundle 1,4	2013-06-27 21:38:54.768353	2013-06-27 21:38:54.768353
3681	1091	Menu item was shown: bundle 3,4,5	2013-06-27 21:38:56.331504	2013-06-27 21:38:56.331504
3682	946	Menu item was shown: bundle 1,3	2013-06-27 21:38:57.030518	2013-06-27 21:38:57.030518
3683	1091	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:38:57.332625	2013-06-27 21:38:57.332625
3684	1091	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:38:58.676298	2013-06-27 21:38:58.676298
3685	968	Menu item was shown: bundle 2,3,4	2013-06-27 21:38:59.182031	2013-06-27 21:38:59.182031
3686	946	Menu item was shown: bundle 1,2	2013-06-27 21:38:59.401635	2013-06-27 21:38:59.401635
3687	1091	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:38:59.684537	2013-06-27 21:38:59.684537
3688	968	Menu item was shown: bundle 2,3,5	2013-06-27 21:38:59.818779	2013-06-27 21:38:59.818779
3689	968	Menu item was shown: bundle 2,4,5	2013-06-27 21:39:00.443934	2013-06-27 21:39:00.443934
3690	902	Good 4 was clicked. Value is now: false	2013-06-27 21:39:02.771472	2013-06-27 21:39:02.771472
3691	902	Good 3 was clicked. Value is now: true	2013-06-27 21:39:03.136092	2013-06-27 21:39:03.136092
3692	902	Good 1 was clicked. Value is now: true	2013-06-27 21:39:03.550244	2013-06-27 21:39:03.550244
3693	946	Menu item was shown: bundle 1,3	2013-06-27 21:39:03.655328	2013-06-27 21:39:03.655328
3694	902	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:04.295235	2013-06-27 21:39:04.295235
3695	968	Menu item was shown: bundle 3,4,5	2013-06-27 21:39:05.271945	2013-06-27 21:39:05.271945
3696	1102	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:05.506809	2013-06-27 21:39:05.506809
3697	946	Menu item was shown: bundle 1,4	2013-06-27 21:39:05.867029	2013-06-27 21:39:05.867029
3698	968	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:05.897563	2013-06-27 21:39:05.897563
3699	1091	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:39:07.063255	2013-06-27 21:39:07.063255
3700	968	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:39:07.086316	2013-06-27 21:39:07.086316
3701	968	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:39:07.347283	2013-06-27 21:39:07.347283
3702	946	Menu item was shown: bundle 2,3	2013-06-27 21:39:07.435542	2013-06-27 21:39:07.435542
3703	902	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:07.745158	2013-06-27 21:39:07.745158
3704	968	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:39:07.917957	2013-06-27 21:39:07.917957
3705	946	Menu item was shown: bundle 2,4	2013-06-27 21:39:08.265903	2013-06-27 21:39:08.265903
3706	980	Menu item was shown: bundle 1,2	2013-06-27 21:39:08.301899	2013-06-27 21:39:08.301899
3707	968	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:39:08.717977	2013-06-27 21:39:08.717977
3708	968	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:39:09.242491	2013-06-27 21:39:09.242491
3709	980	Menu item was shown: bundle 1,3	2013-06-27 21:39:09.445884	2013-06-27 21:39:09.445884
3710	946	Menu item was shown: bundle 3,4	2013-06-27 21:39:09.787993	2013-06-27 21:39:09.787993
3711	1102	Menu item was hidden: bundle 1,2,3	2013-06-27 21:39:10.02454	2013-06-27 21:39:10.02454
3712	980	Menu item was shown: bundle 1,4	2013-06-27 21:39:10.043826	2013-06-27 21:39:10.043826
3713	968	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:39:10.18835	2013-06-27 21:39:10.18835
3714	968	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:39:10.59687	2013-06-27 21:39:10.59687
3715	980	Menu item was shown: bundle 2,3	2013-06-27 21:39:10.740697	2013-06-27 21:39:10.740697
3716	968	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:39:11.189101	2013-06-27 21:39:11.189101
3717	946	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:11.426416	2013-06-27 21:39:11.426416
3718	1091	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:39:11.50485	2013-06-27 21:39:11.50485
3719	1102	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:11.731662	2013-06-27 21:39:11.731662
3720	968	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:39:11.753575	2013-06-27 21:39:11.753575
3721	980	Menu item was shown: bundle 2,4	2013-06-27 21:39:12.195575	2013-06-27 21:39:12.195575
3722	968	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:12.403252	2013-06-27 21:39:12.403252
3723	1102	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:12.444306	2013-06-27 21:39:12.444306
3724	1091	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:39:12.765161	2013-06-27 21:39:12.765161
3725	902	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:12.972099	2013-06-27 21:39:12.972099
3726	980	Menu item was shown: bundle 3,4	2013-06-27 21:39:12.995377	2013-06-27 21:39:12.995377
3727	1102	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:13.023093	2013-06-27 21:39:13.023093
3728	968	Menu item was shown: bundle 3,4,5	2013-06-27 21:39:13.126522	2013-06-27 21:39:13.126522
3729	968	Menu item was shown: bundle 2,4,5	2013-06-27 21:39:13.538524	2013-06-27 21:39:13.538524
3730	1102	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:13.724652	2013-06-27 21:39:13.724652
3731	291	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:14.625564	2013-06-27 21:39:14.625564
3732	946	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:14.932861	2013-06-27 21:39:14.932861
3733	980	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:15.159244	2013-06-27 21:39:15.159244
3734	1102	Menu item was shown: bundle 3,4	2013-06-27 21:39:15.447206	2013-06-27 21:39:15.447206
3735	291	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:15.762285	2013-06-27 21:39:15.762285
3736	980	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:15.807483	2013-06-27 21:39:15.807483
3737	1102	Menu item was shown: bundle 2,4	2013-06-27 21:39:15.993593	2013-06-27 21:39:15.993593
3738	1102	Menu item was shown: bundle 2,3	2013-06-27 21:39:16.672177	2013-06-27 21:39:16.672177
3739	1102	Menu item was shown: bundle 1,4	2013-06-27 21:39:17.171139	2013-06-27 21:39:17.171139
3740	980	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:17.579854	2013-06-27 21:39:17.579854
3741	1102	Menu item was shown: bundle 1,3	2013-06-27 21:39:17.786833	2013-06-27 21:39:17.786833
3742	1091	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:17.885929	2013-06-27 21:39:17.885929
3743	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:17.911875	2013-06-27 21:39:17.911875
3744	902	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:18.103657	2013-06-27 21:39:18.103657
3745	1102	Menu item was shown: bundle 1,2	2013-06-27 21:39:18.236063	2013-06-27 21:39:18.236063
3746	291	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:18.400809	2013-06-27 21:39:18.400809
3747	980	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:19.094078	2013-06-27 21:39:19.094078
3748	968	Good 2 was clicked. Value is now: true	2013-06-27 21:39:19.527741	2013-06-27 21:39:19.527741
3749	946	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:19.553751	2013-06-27 21:39:19.553751
3750	980	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:19.721063	2013-06-27 21:39:19.721063
3751	968	Good 4 was clicked. Value is now: true	2013-06-27 21:39:20.336698	2013-06-27 21:39:20.336698
3752	946	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:39:21.164415	2013-06-27 21:39:21.164415
3753	968	Good 5 was clicked. Value is now: true	2013-06-27 21:39:21.31149	2013-06-27 21:39:21.31149
3754	902	Menu item was shown: bundle 1,4	2013-06-27 21:39:22.509138	2013-06-27 21:39:22.509138
3755	980	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:22.617678	2013-06-27 21:39:22.617678
3756	291	Good 2 was clicked. Value is now: true	2013-06-27 21:39:23.219559	2013-06-27 21:39:23.219559
3757	702	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:39:23.305537	2013-06-27 21:39:23.305537
3758	902	Menu item was shown: bundle 2,3	2013-06-27 21:39:23.399156	2013-06-27 21:39:23.399156
3759	291	Good 3 was clicked. Value is now: true	2013-06-27 21:39:23.654404	2013-06-27 21:39:23.654404
3760	291	Good 4 was clicked. Value is now: true	2013-06-27 21:39:24.206103	2013-06-27 21:39:24.206103
3761	902	Menu item was shown: bundle 2,4	2013-06-27 21:39:24.497838	2013-06-27 21:39:24.497838
3762	968	Menu item was shown: bundle 1,2	2013-06-27 21:39:24.992089	2013-06-27 21:39:24.992089
3763	291	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:25.775011	2013-06-27 21:39:25.775011
3764	980	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:26.159368	2013-06-27 21:39:26.159368
3765	980	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:27.009461	2013-06-27 21:39:27.009461
3766	980	Menu item was shown: bundle 2,3	2013-06-27 21:39:29.257151	2013-06-27 21:39:29.257151
3767	980	Menu item was shown: bundle 2,4	2013-06-27 21:39:29.824446	2013-06-27 21:39:29.824446
3768	291	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:30.376461	2013-06-27 21:39:30.376461
3769	980	Menu item was shown: bundle 3,4	2013-06-27 21:39:31.734046	2013-06-27 21:39:31.734046
3770	408	Menu item was shown: bundle 1,2	2013-06-27 21:39:32.297676	2013-06-27 21:39:32.297676
3771	980	Menu item was shown: bundle 1,4	2013-06-27 21:39:32.803813	2013-06-27 21:39:32.803813
3772	980	Menu item was shown: bundle 1,2	2013-06-27 21:39:34.019944	2013-06-27 21:39:34.019944
3773	291	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:34.061245	2013-06-27 21:39:34.061245
3774	702	Menu item was shown: bundle 1,2	2013-06-27 21:39:34.153436	2013-06-27 21:39:34.153436
3775	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:34.558571	2013-06-27 21:39:34.558571
3776	968	Menu item was hidden: bundle 1,2	2013-06-27 21:39:35.080454	2013-06-27 21:39:35.080454
3777	408	Good 1 was clicked. Value is now: true	2013-06-27 21:39:37.168461	2013-06-27 21:39:37.168461
3778	408	Good 2 was clicked. Value is now: true	2013-06-27 21:39:37.437617	2013-06-27 21:39:37.437617
3779	408	Menu item was shown: bundle 1,3	2013-06-27 21:39:38.589012	2013-06-27 21:39:38.589012
3780	702	Menu item was shown: bundle 1,3	2013-06-27 21:39:38.829246	2013-06-27 21:39:38.829246
3781	968	Menu item was shown: bundle 2,4,5	2013-06-27 21:39:39.248859	2013-06-27 21:39:39.248859
3782	408	Menu item was shown: bundle 1,4	2013-06-27 21:39:39.682779	2013-06-27 21:39:39.682779
3783	968	Menu item was hidden: bundle 2,4,5	2013-06-27 21:39:39.947573	2013-06-27 21:39:39.947573
3784	946	Menu item was shown: bundle 1,2	2013-06-27 21:39:41.232559	2013-06-27 21:39:41.232559
3785	291	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:41.864459	2013-06-27 21:39:41.864459
3786	980	Combo was clicked. Value is now: true	2013-06-27 21:39:41.978322	2013-06-27 21:39:41.978322
3787	946	Menu item was shown: bundle 1,3	2013-06-27 21:39:42.219017	2013-06-27 21:39:42.219017
3788	1047	Menu item was shown: bundle 1,2	2013-06-27 21:39:42.980022	2013-06-27 21:39:42.980022
3789	408	Good 2 was clicked. Value is now: false	2013-06-27 21:39:43.397185	2013-06-27 21:39:43.397185
3790	291	Menu item was shown: bundle 3,4	2013-06-27 21:39:43.436297	2013-06-27 21:39:43.436297
3791	408	Good 4 was clicked. Value is now: true	2013-06-27 21:39:43.84675	2013-06-27 21:39:43.84675
3792	946	Menu item was shown: bundle 1,2	2013-06-27 21:39:44.127487	2013-06-27 21:39:44.127487
3793	1047	Menu item was shown: bundle 1,3	2013-06-27 21:39:44.783944	2013-06-27 21:39:44.783944
3794	968	Menu item was shown: bundle 1,4	2013-06-27 21:39:44.938643	2013-06-27 21:39:44.938643
3795	946	Menu item was shown: bundle 1,3	2013-06-27 21:39:45.015568	2013-06-27 21:39:45.015568
3796	902	Menu item was shown: bundle 3,4	2013-06-27 21:39:45.198474	2013-06-27 21:39:45.198474
3797	1047	Menu item was shown: bundle 1,4	2013-06-27 21:39:46.325288	2013-06-27 21:39:46.325288
3798	968	Menu item was shown: bundle 1,5	2013-06-27 21:39:46.480655	2013-06-27 21:39:46.480655
3799	1047	Menu item was shown: bundle 1,5	2013-06-27 21:39:47.061206	2013-06-27 21:39:47.061206
3800	291	Menu item was shown: bundle 2,4	2013-06-27 21:39:47.174371	2013-06-27 21:39:47.174371
3801	902	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:47.574913	2013-06-27 21:39:47.574913
3802	968	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:47.840704	2013-06-27 21:39:47.840704
3803	702	Menu item was shown: bundle 1,4	2013-06-27 21:39:48.162571	2013-06-27 21:39:48.162571
3804	291	Menu item was shown: bundle 2,3	2013-06-27 21:39:48.556391	2013-06-27 21:39:48.556391
3805	946	Menu item was shown: bundle 1,4	2013-06-27 21:39:48.600902	2013-06-27 21:39:48.600902
3806	902	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:48.820715	2013-06-27 21:39:48.820715
3807	291	Menu item was shown: bundle 1,4	2013-06-27 21:39:49.395863	2013-06-27 21:39:49.395863
3808	291	Menu item was shown: bundle 2,3	2013-06-27 21:39:50.463115	2013-06-27 21:39:50.463115
3809	902	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:50.575383	2013-06-27 21:39:50.575383
3810	946	Menu item was shown: bundle 2,3	2013-06-27 21:39:50.657545	2013-06-27 21:39:50.657545
3811	968	Menu item was shown: bundle 1,2,4	2013-06-27 21:39:50.801905	2013-06-27 21:39:50.801905
3812	1047	Menu item was shown: bundle 2,3	2013-06-27 21:39:50.923021	2013-06-27 21:39:50.923021
3813	946	Menu item was shown: bundle 2,4	2013-06-27 21:39:51.479625	2013-06-27 21:39:51.479625
3814	702	Menu item was shown: bundle 1,5	2013-06-27 21:39:51.564982	2013-06-27 21:39:51.564982
3815	902	Menu item was shown: bundle 2,3,4	2013-06-27 21:39:51.691567	2013-06-27 21:39:51.691567
3816	968	Menu item was shown: bundle 1,2,5	2013-06-27 21:39:51.757887	2013-06-27 21:39:51.757887
3817	968	Menu item was shown: bundle 1,3,4	2013-06-27 21:39:52.22615	2013-06-27 21:39:52.22615
3818	902	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:52.908945	2013-06-27 21:39:52.908945
3819	291	Menu item was shown: bundle 1,4	2013-06-27 21:39:53.056563	2013-06-27 21:39:53.056563
3820	946	Menu item was shown: bundle 3,4	2013-06-27 21:39:53.319977	2013-06-27 21:39:53.319977
3821	968	Menu item was shown: bundle 1,3,5	2013-06-27 21:39:53.361222	2013-06-27 21:39:53.361222
3822	946	Menu item was shown: bundle 1,2,3	2013-06-27 21:39:54.741454	2013-06-27 21:39:54.741454
3823	702	Menu item was shown: bundle 2,3	2013-06-27 21:39:55.647141	2013-06-27 21:39:55.647141
3824	1047	Menu item was shown: bundle 2,4	2013-06-27 21:39:56.109237	2013-06-27 21:39:56.109237
3825	1047	Menu item was shown: bundle 2,5	2013-06-27 21:39:57.3871	2013-06-27 21:39:57.3871
3826	291	Menu item was shown: bundle 1,3	2013-06-27 21:39:57.441892	2013-06-27 21:39:57.441892
3827	408	Menu item was shown: bundle 2,3	2013-06-27 21:39:57.914669	2013-06-27 21:39:57.914669
3828	968	Menu item was shown: bundle 1,4,5	2013-06-27 21:39:58.433829	2013-06-27 21:39:58.433829
3829	702	Menu item was shown: bundle 2,4	2013-06-27 21:39:58.768279	2013-06-27 21:39:58.768279
3830	408	Menu item was shown: bundle 2,4	2013-06-27 21:39:59.009477	2013-06-27 21:39:59.009477
3831	291	Menu item was shown: bundle 1,2	2013-06-27 21:39:59.029925	2013-06-27 21:39:59.029925
3832	946	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:00.116866	2013-06-27 21:40:00.116866
3833	291	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:00.898925	2013-06-27 21:40:00.898925
3834	538	Menu item was shown: bundle 1,2	2013-06-27 21:40:01.393993	2013-06-27 21:40:01.393993
3835	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:01.934781	2013-06-27 21:40:01.934781
3836	702	Menu item was shown: bundle 2,5	2013-06-27 21:40:01.982744	2013-06-27 21:40:01.982744
3837	408	Menu item was shown: bundle 3,4	2013-06-27 21:40:02.335581	2013-06-27 21:40:02.335581
3838	1047	Menu item was shown: bundle 3,4	2013-06-27 21:40:02.39648	2013-06-27 21:40:02.39648
3839	538	Menu item was shown: bundle 1,3	2013-06-27 21:40:02.603334	2013-06-27 21:40:02.603334
3840	408	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:02.994274	2013-06-27 21:40:02.994274
3841	902	Menu item was shown: bundle 2,3	2013-06-27 21:40:03.228007	2013-06-27 21:40:03.228007
3842	946	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:03.487135	2013-06-27 21:40:03.487135
3843	1047	Menu item was shown: bundle 3,5	2013-06-27 21:40:03.6368	2013-06-27 21:40:03.6368
3844	902	Menu item was shown: bundle 2,4	2013-06-27 21:40:04.43847	2013-06-27 21:40:04.43847
3845	1047	Menu item was shown: bundle 4,5	2013-06-27 21:40:04.489909	2013-06-27 21:40:04.489909
3846	1125	Menu item was shown: bundle 1,2	2013-06-27 21:40:05.212352	2013-06-27 21:40:05.212352
3847	538	Menu item was shown: bundle 2,3	2013-06-27 21:40:05.311422	2013-06-27 21:40:05.311422
3848	1125	Menu item was hidden: bundle 1,2	2013-06-27 21:40:05.950742	2013-06-27 21:40:05.950742
3849	538	Menu item was shown: bundle 2,4	2013-06-27 21:40:06.419065	2013-06-27 21:40:06.419065
3850	946	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:06.661909	2013-06-27 21:40:06.661909
3851	1016	Menu item was shown: bundle 1,2	2013-06-27 21:40:06.927867	2013-06-27 21:40:06.927867
3852	1125	Menu item was shown: bundle 1,3	2013-06-27 21:40:07.085006	2013-06-27 21:40:07.085006
3853	968	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:07.551875	2013-06-27 21:40:07.551875
3854	1125	Menu item was hidden: bundle 1,3	2013-06-27 21:40:08.355239	2013-06-27 21:40:08.355239
3855	1047	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:08.658804	2013-06-27 21:40:08.658804
3856	1125	Menu item was shown: bundle 1,3	2013-06-27 21:40:08.749556	2013-06-27 21:40:08.749556
3857	408	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:08.891869	2013-06-27 21:40:08.891869
3858	702	Menu item was shown: bundle 3,4	2013-06-27 21:40:08.998862	2013-06-27 21:40:08.998862
3859	968	Menu item was shown: bundle 2,3,5	2013-06-27 21:40:09.214677	2013-06-27 21:40:09.214677
3860	968	Menu item was shown: bundle 2,4,5	2013-06-27 21:40:10.082244	2013-06-27 21:40:10.082244
3861	1047	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:10.19735	2013-06-27 21:40:10.19735
3862	538	Menu item was shown: bundle 1,3	2013-06-27 21:40:10.238531	2013-06-27 21:40:10.238531
3863	1125	Menu item was hidden: bundle 1,3	2013-06-27 21:40:10.430951	2013-06-27 21:40:10.430951
3864	408	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:10.514328	2013-06-27 21:40:10.514328
3865	1125	Menu item was shown: bundle 1,4	2013-06-27 21:40:10.786313	2013-06-27 21:40:10.786313
3866	408	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:11.267366	2013-06-27 21:40:11.267366
3867	1125	Menu item was hidden: bundle 1,4	2013-06-27 21:40:11.304153	2013-06-27 21:40:11.304153
3868	538	Menu item was shown: bundle 1,4	2013-06-27 21:40:11.331673	2013-06-27 21:40:11.331673
3869	946	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:11.54405	2013-06-27 21:40:11.54405
3870	1047	Menu item was shown: bundle 1,2,5	2013-06-27 21:40:11.670003	2013-06-27 21:40:11.670003
3871	1125	Menu item was shown: bundle 1,5	2013-06-27 21:40:11.829099	2013-06-27 21:40:11.829099
3872	902	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:11.996806	2013-06-27 21:40:11.996806
3873	1016	Menu item was shown: bundle 1,3	2013-06-27 21:40:12.123769	2013-06-27 21:40:12.123769
3874	1047	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:12.493184	2013-06-27 21:40:12.493184
3875	902	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:13.154466	2013-06-27 21:40:13.154466
3876	1125	Menu item was hidden: bundle 1,5	2013-06-27 21:40:13.272875	2013-06-27 21:40:13.272875
3877	1016	Menu item was shown: bundle 2,3	2013-06-27 21:40:13.97823	2013-06-27 21:40:13.97823
3878	902	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:14.267395	2013-06-27 21:40:14.267395
3879	1125	Menu item was shown: bundle 2,3	2013-06-27 21:40:14.447003	2013-06-27 21:40:14.447003
3880	968	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:15.554397	2013-06-27 21:40:15.554397
3881	538	Menu item was shown: bundle 2,3	2013-06-27 21:40:16.076896	2013-06-27 21:40:16.076896
3882	702	Menu item was shown: bundle 3,5	2013-06-27 21:40:16.113347	2013-06-27 21:40:16.113347
3883	968	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:40:16.435551	2013-06-27 21:40:16.435551
3884	1125	Menu item was shown: bundle 1,5	2013-06-27 21:40:16.470408	2013-06-27 21:40:16.470408
3885	968	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:40:17.314472	2013-06-27 21:40:17.314472
3886	1016	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:17.342052	2013-06-27 21:40:17.342052
3887	408	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:17.614843	2013-06-27 21:40:17.614843
3888	968	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:40:17.842785	2013-06-27 21:40:17.842785
3889	538	Menu item was shown: bundle 2,4	2013-06-27 21:40:18.086882	2013-06-27 21:40:18.086882
3890	968	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:40:18.537087	2013-06-27 21:40:18.537087
3891	1125	Menu item was shown: bundle 2,4	2013-06-27 21:40:18.903653	2013-06-27 21:40:18.903653
3892	702	Menu item was shown: bundle 4,5	2013-06-27 21:40:19.516775	2013-06-27 21:40:19.516775
3893	1125	Menu item was shown: bundle 2,5	2013-06-27 21:40:19.637248	2013-06-27 21:40:19.637248
3894	968	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:40:20.118512	2013-06-27 21:40:20.118512
3895	1125	Menu item was shown: bundle 3,4	2013-06-27 21:40:20.937928	2013-06-27 21:40:20.937928
3896	968	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:40:21.226886	2013-06-27 21:40:21.226886
3897	1125	Menu item was shown: bundle 3,5	2013-06-27 21:40:21.523571	2013-06-27 21:40:21.523571
3898	538	Menu item was shown: bundle 3,4	2013-06-27 21:40:21.608899	2013-06-27 21:40:21.608899
3899	1125	Menu item was shown: bundle 4,5	2013-06-27 21:40:22.023989	2013-06-27 21:40:22.023989
3900	1125	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:22.532578	2013-06-27 21:40:22.532578
3901	538	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:22.55303	2013-06-27 21:40:22.55303
3902	1016	Menu item was shown: bundle 2,3	2013-06-27 21:40:22.875174	2013-06-27 21:40:22.875174
3903	1016	Menu item was hidden: bundle 2,3	2013-06-27 21:40:23.647635	2013-06-27 21:40:23.647635
3904	1016	Menu item was shown: bundle 2,3	2013-06-27 21:40:24.144068	2013-06-27 21:40:24.144068
3905	1047	Menu item was shown: bundle 1,3,5	2013-06-27 21:40:24.537472	2013-06-27 21:40:24.537472
3906	1125	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:25.104936	2013-06-27 21:40:25.104936
3907	1047	Menu item was shown: bundle 1,4,5	2013-06-27 21:40:25.431048	2013-06-27 21:40:25.431048
3908	1125	Menu item was shown: bundle 1,2,5	2013-06-27 21:40:25.507459	2013-06-27 21:40:25.507459
3909	1016	Menu item was shown: bundle 1,2	2013-06-27 21:40:26.092565	2013-06-27 21:40:26.092565
3910	1125	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:26.189474	2013-06-27 21:40:26.189474
3911	408	Good 4 was clicked. Value is now: false	2013-06-27 21:40:26.306045	2013-06-27 21:40:26.306045
3912	1047	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:26.324987	2013-06-27 21:40:26.324987
3913	244	Good 1 was clicked. Value is now: true	2013-06-27 21:40:26.842709	2013-06-27 21:40:26.842709
3914	408	Good 1 was clicked. Value is now: false	2013-06-27 21:40:26.965284	2013-06-27 21:40:26.965284
3915	1016	Menu item was shown: bundle 2,3	2013-06-27 21:40:26.994178	2013-06-27 21:40:26.994178
3916	1047	Menu item was shown: bundle 2,3,5	2013-06-27 21:40:27.285519	2013-06-27 21:40:27.285519
3917	1125	Menu item was shown: bundle 1,3,5	2013-06-27 21:40:27.418238	2013-06-27 21:40:27.418238
3918	538	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:27.439902	2013-06-27 21:40:27.439902
3919	968	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:40:27.723723	2013-06-27 21:40:27.723723
3920	1125	Menu item was shown: bundle 1,4,5	2013-06-27 21:40:27.930286	2013-06-27 21:40:27.930286
3921	408	Combo was clicked. Value is now: true	2013-06-27 21:40:28.077758	2013-06-27 21:40:28.077758
3922	244	Menu item was shown: bundle 1,2	2013-06-27 21:40:28.290747	2013-06-27 21:40:28.290747
3923	968	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:28.729934	2013-06-27 21:40:28.729934
3924	1125	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:28.760093	2013-06-27 21:40:28.760093
3925	702	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:28.955844	2013-06-27 21:40:28.955844
3926	244	Menu item was shown: bundle 1,3	2013-06-27 21:40:29.295457	2013-06-27 21:40:29.295457
3927	968	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:40:29.588211	2013-06-27 21:40:29.588211
3928	1125	Menu item was shown: bundle 2,3,5	2013-06-27 21:40:29.795979	2013-06-27 21:40:29.795979
3929	538	Good 1 was clicked. Value is now: true	2013-06-27 21:40:29.880189	2013-06-27 21:40:29.880189
3930	1016	Good 1 was clicked. Value is now: true	2013-06-27 21:40:30.190917	2013-06-27 21:40:30.190917
3931	538	Good 2 was clicked. Value is now: true	2013-06-27 21:40:30.243233	2013-06-27 21:40:30.243233
3932	1125	Menu item was shown: bundle 2,4,5	2013-06-27 21:40:30.364802	2013-06-27 21:40:30.364802
3933	244	Menu item was shown: bundle 1,4	2013-06-27 21:40:30.388871	2013-06-27 21:40:30.388871
3934	968	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:40:30.588635	2013-06-27 21:40:30.588635
3935	538	Good 3 was clicked. Value is now: true	2013-06-27 21:40:30.639024	2013-06-27 21:40:30.639024
3936	1125	Menu item was shown: bundle 3,4,5	2013-06-27 21:40:31.090923	2013-06-27 21:40:31.090923
3937	968	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:40:31.140305	2013-06-27 21:40:31.140305
3938	1125	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:31.799724	2013-06-27 21:40:31.799724
3939	538	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:32.124858	2013-06-27 21:40:32.124858
3940	1125	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:40:32.760981	2013-06-27 21:40:32.760981
3941	538	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:32.795698	2013-06-27 21:40:32.795698
3942	538	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:33.327765	2013-06-27 21:40:33.327765
3943	1125	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:40:33.726435	2013-06-27 21:40:33.726435
3944	1016	Good 2 was clicked. Value is now: true	2013-06-27 21:40:34.405456	2013-06-27 21:40:34.405456
3945	1125	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:40:34.530296	2013-06-27 21:40:34.530296
3946	1047	Menu item was shown: bundle 2,4,5	2013-06-27 21:40:34.770986	2013-06-27 21:40:34.770986
3947	1125	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:40:35.344473	2013-06-27 21:40:35.344473
3948	1125	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:40:35.934367	2013-06-27 21:40:35.934367
3949	244	Menu item was shown: bundle 2,3	2013-06-27 21:40:36.010493	2013-06-27 21:40:36.010493
3950	244	Menu item was shown: bundle 2,4	2013-06-27 21:40:37.694701	2013-06-27 21:40:37.694701
3951	538	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:38.411013	2013-06-27 21:40:38.411013
3952	244	Menu item was shown: bundle 3,4	2013-06-27 21:40:38.542357	2013-06-27 21:40:38.542357
3953	538	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:39.251717	2013-06-27 21:40:39.251717
3954	244	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:39.274815	2013-06-27 21:40:39.274815
3955	1047	Menu item was shown: bundle 3,4,5	2013-06-27 21:40:40.133975	2013-06-27 21:40:40.133975
3956	1125	Combo was clicked. Value is now: true	2013-06-27 21:40:40.391765	2013-06-27 21:40:40.391765
3957	244	Combo was clicked. Value is now: true	2013-06-27 21:40:40.566689	2013-06-27 21:40:40.566689
3958	244	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:42.668063	2013-06-27 21:40:42.668063
3959	244	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:43.433032	2013-06-27 21:40:43.433032
3960	244	Menu item was shown: bundle 2,3,4	2013-06-27 21:40:44.511613	2013-06-27 21:40:44.511613
3961	702	Menu item was shown: bundle 1,2,4	2013-06-27 21:40:44.69776	2013-06-27 21:40:44.69776
3962	538	Menu item was shown: bundle 1,2,3	2013-06-27 21:40:45.18235	2013-06-27 21:40:45.18235
3963	244	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:45.664096	2013-06-27 21:40:45.664096
3964	1047	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:40:46.271879	2013-06-27 21:40:46.271879
3965	1047	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:40:47.087355	2013-06-27 21:40:47.087355
3966	702	Menu item was shown: bundle 1,2,5	2013-06-27 21:40:55.748393	2013-06-27 21:40:55.748393
3967	702	Menu item was shown: bundle 1,3,4	2013-06-27 21:40:57.175411	2013-06-27 21:40:57.175411
3968	702	Menu item was shown: bundle 1,3,5	2013-06-27 21:40:58.751976	2013-06-27 21:40:58.751976
3969	702	Menu item was shown: bundle 1,4,5	2013-06-27 21:40:59.639922	2013-06-27 21:40:59.639922
3970	702	Menu item was shown: bundle 2,3,4	2013-06-27 21:41:01.440801	2013-06-27 21:41:01.440801
3971	998	Menu item was shown: bundle 1,4	2013-06-27 21:41:01.783871	2013-06-27 21:41:01.783871
3972	998	Menu item was shown: bundle 1,2	2013-06-27 21:41:04.981992	2013-06-27 21:41:04.981992
3973	702	Menu item was shown: bundle 2,3,5	2013-06-27 21:41:05.489737	2013-06-27 21:41:05.489737
3974	998	Menu item was shown: bundle 1,3	2013-06-27 21:41:05.90925	2013-06-27 21:41:05.90925
3975	702	Menu item was shown: bundle 2,4,5	2013-06-27 21:41:05.963234	2013-06-27 21:41:05.963234
3976	1047	Good 1 was clicked. Value is now: true	2013-06-27 21:41:06.216965	2013-06-27 21:41:06.216965
3977	1047	Good 2 was clicked. Value is now: true	2013-06-27 21:41:07.3082	2013-06-27 21:41:07.3082
3978	227	Menu item was shown: bundle 1,2	2013-06-27 21:41:07.418939	2013-06-27 21:41:07.418939
3979	1047	Good 3 was clicked. Value is now: true	2013-06-27 21:41:08.333465	2013-06-27 21:41:08.333465
3980	998	Menu item was shown: bundle 1,4	2013-06-27 21:41:08.615928	2013-06-27 21:41:08.615928
3981	1047	Good 5 was clicked. Value is now: true	2013-06-27 21:41:09.319143	2013-06-27 21:41:09.319143
3982	1047	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:41:10.408156	2013-06-27 21:41:10.408156
3983	998	Menu item was shown: bundle 2,3	2013-06-27 21:41:10.594191	2013-06-27 21:41:10.594191
3984	207	Combo was clicked. Value is now: true	2013-06-27 21:41:11.078692	2013-06-27 21:41:11.078692
3985	1047	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:41:11.327838	2013-06-27 21:41:11.327838
3986	227	Menu item was shown: bundle 4,5	2013-06-27 21:41:12.392327	2013-06-27 21:41:12.392327
3987	702	Menu item was shown: bundle 3,4,5	2013-06-27 21:41:12.651389	2013-06-27 21:41:12.651389
3988	998	Good 2 was clicked. Value is now: true	2013-06-27 21:41:12.701383	2013-06-27 21:41:12.701383
3989	998	Good 3 was clicked. Value is now: true	2013-06-27 21:41:12.933017	2013-06-27 21:41:12.933017
3990	998	Menu item was shown: bundle 2,4	2013-06-27 21:41:14.064448	2013-06-27 21:41:14.064448
3991	227	Menu item was hidden: bundle 4,5	2013-06-27 21:41:14.851122	2013-06-27 21:41:14.851122
3992	702	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:15.927612	2013-06-27 21:41:15.927612
3993	207	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:41:15.987862	2013-06-27 21:41:15.987862
3994	207	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:41:16.408048	2013-06-27 21:41:16.408048
3995	998	Menu item was shown: bundle 2,3	2013-06-27 21:41:18.342609	2013-06-27 21:41:18.342609
3996	998	Menu item was shown: bundle 2,4	2013-06-27 21:41:19.973351	2013-06-27 21:41:19.973351
3997	902	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:20.269876	2013-06-27 21:41:20.269876
3998	1047	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:41:21.731852	2013-06-27 21:41:21.731852
3999	1113	Menu item was shown: bundle 1,2	2013-06-27 21:41:22.491537	2013-06-27 21:41:22.491537
4000	227	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:22.515059	2013-06-27 21:41:22.515059
4001	1047	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:41:23.000099	2013-06-27 21:41:23.000099
4002	1113	Menu item was shown: bundle 1,3	2013-06-27 21:41:23.298513	2013-06-27 21:41:23.298513
4003	227	Menu item was hidden: bundle 1,2,3	2013-06-27 21:41:23.475823	2013-06-27 21:41:23.475823
4004	998	Menu item was shown: bundle 3,4	2013-06-27 21:41:23.500382	2013-06-27 21:41:23.500382
4005	1047	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:41:23.653461	2013-06-27 21:41:23.653461
4006	1113	Menu item was shown: bundle 2,3	2013-06-27 21:41:23.743512	2013-06-27 21:41:23.743512
4007	1084	Menu item was shown: bundle 1,2	2013-06-27 21:41:24.024859	2013-06-27 21:41:24.024859
4008	1113	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:24.164384	2013-06-27 21:41:24.164384
4009	227	Menu item was shown: bundle 1,2,4	2013-06-27 21:41:24.992478	2013-06-27 21:41:24.992478
4010	1084	Menu item was shown: bundle 1,3	2013-06-27 21:41:25.240737	2013-06-27 21:41:25.240737
4011	998	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:25.654429	2013-06-27 21:41:25.654429
4012	215	Good 3 was clicked. Value is now: true	2013-06-27 21:41:26.432266	2013-06-27 21:41:26.432266
4013	998	Good 1 was clicked. Value is now: true	2013-06-27 21:41:29.23898	2013-06-27 21:41:29.23898
4014	227	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:41:29.477818	2013-06-27 21:41:29.477818
4015	215	Menu item was shown: bundle 1,2	2013-06-27 21:41:30.582691	2013-06-27 21:41:30.582691
4016	998	Menu item was shown: bundle 1,2,4	2013-06-27 21:41:30.710021	2013-06-27 21:41:30.710021
4017	215	Menu item was hidden: bundle 1,2	2013-06-27 21:41:31.281332	2013-06-27 21:41:31.281332
4018	702	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:41:31.692627	2013-06-27 21:41:31.692627
4019	215	Menu item was shown: bundle 1,3	2013-06-27 21:41:31.729017	2013-06-27 21:41:31.729017
4020	1113	Menu item was shown: bundle 1,2	2013-06-27 21:41:32.00996	2013-06-27 21:41:32.00996
4021	215	Menu item was hidden: bundle 1,3	2013-06-27 21:41:32.27475	2013-06-27 21:41:32.27475
4022	215	Menu item was shown: bundle 1,4	2013-06-27 21:41:32.692832	2013-06-27 21:41:32.692832
4023	1084	Menu item was shown: bundle 1,4	2013-06-27 21:41:33.117448	2013-06-27 21:41:33.117448
4024	215	Menu item was hidden: bundle 1,4	2013-06-27 21:41:34.441298	2013-06-27 21:41:34.441298
4025	998	Menu item was shown: bundle 1,3,4	2013-06-27 21:41:34.734616	2013-06-27 21:41:34.734616
4026	215	Menu item was shown: bundle 1,5	2013-06-27 21:41:35.375691	2013-06-27 21:41:35.375691
4027	207	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:41:35.536529	2013-06-27 21:41:35.536529
4028	1113	Menu item was shown: bundle 1,3	2013-06-27 21:41:36.0757	2013-06-27 21:41:36.0757
4029	1084	Menu item was shown: bundle 1,2	2013-06-27 21:41:36.497041	2013-06-27 21:41:36.497041
4030	1047	Combo was clicked. Value is now: true	2013-06-27 21:41:36.841158	2013-06-27 21:41:36.841158
4031	215	Menu item was hidden: bundle 1,5	2013-06-27 21:41:37.21792	2013-06-27 21:41:37.21792
4032	215	Menu item was shown: bundle 2,3	2013-06-27 21:41:38.12562	2013-06-27 21:41:38.12562
4033	1113	Menu item was shown: bundle 2,3	2013-06-27 21:41:38.171253	2013-06-27 21:41:38.171253
4034	702	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:41:38.696548	2013-06-27 21:41:38.696548
4035	732	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:38.837031	2013-06-27 21:41:38.837031
4036	227	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:41:39.558996	2013-06-27 21:41:39.558996
4037	1084	Combo was clicked. Value is now: true	2013-06-27 21:41:39.980955	2013-06-27 21:41:39.980955
4038	732	Menu item was shown: bundle 2,3,4	2013-06-27 21:41:40.567966	2013-06-27 21:41:40.567966
4039	215	Good 2 was clicked. Value is now: true	2013-06-27 21:41:41.144805	2013-06-27 21:41:41.144805
4040	1113	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:41.974546	2013-06-27 21:41:41.974546
4041	998	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:42.291251	2013-06-27 21:41:42.291251
4042	215	Menu item was shown: bundle 2,4	2013-06-27 21:41:43.489576	2013-06-27 21:41:43.489576
4043	227	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:41:44.135724	2013-06-27 21:41:44.135724
4044	732	Menu item was shown: bundle 1,3,4	2013-06-27 21:41:44.571545	2013-06-27 21:41:44.571545
4045	1084	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:44.737332	2013-06-27 21:41:44.737332
4046	1084	Menu item was hidden: bundle 1,2,3	2013-06-27 21:41:45.117673	2013-06-27 21:41:45.117673
4047	732	Menu item was shown: bundle 1,2,4	2013-06-27 21:41:45.437164	2013-06-27 21:41:45.437164
4048	998	Menu item was shown: bundle 1,3,4	2013-06-27 21:41:45.508168	2013-06-27 21:41:45.508168
4049	1084	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:45.733772	2013-06-27 21:41:45.733772
4050	215	Menu item was hidden: bundle 2,4	2013-06-27 21:41:46.762338	2013-06-27 21:41:46.762338
4051	702	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:47.097969	2013-06-27 21:41:47.097969
4052	227	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:41:47.359659	2013-06-27 21:41:47.359659
4053	215	Menu item was shown: bundle 2,5	2013-06-27 21:41:47.525504	2013-06-27 21:41:47.525504
4054	953	Menu item was shown: bundle 1,2	2013-06-27 21:41:47.785146	2013-06-27 21:41:47.785146
4055	953	Menu item was shown: bundle 1,3	2013-06-27 21:41:48.67755	2013-06-27 21:41:48.67755
4056	998	Menu item was shown: bundle 2,3,4	2013-06-27 21:41:48.720971	2013-06-27 21:41:48.720971
4057	227	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:41:48.753411	2013-06-27 21:41:48.753411
4058	1084	Good 1 was clicked. Value is now: true	2013-06-27 21:41:49.467548	2013-06-27 21:41:49.467548
4059	1084	Good 2 was clicked. Value is now: true	2013-06-27 21:41:49.794251	2013-06-27 21:41:49.794251
4060	227	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:49.819978	2013-06-27 21:41:49.819978
4061	998	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:50.061369	2013-06-27 21:41:50.061369
4062	215	Menu item was hidden: bundle 2,5	2013-06-27 21:41:50.169077	2013-06-27 21:41:50.169077
4063	1084	Good 3 was clicked. Value is now: true	2013-06-27 21:41:50.250073	2013-06-27 21:41:50.250073
4064	953	Menu item was shown: bundle 1,4	2013-06-27 21:41:50.359642	2013-06-27 21:41:50.359642
4065	215	Menu item was shown: bundle 3,4	2013-06-27 21:41:51.036992	2013-06-27 21:41:51.036992
4066	1084	Menu item was shown: bundle 1,2,4	2013-06-27 21:41:51.319015	2013-06-27 21:41:51.319015
4067	702	Good 1 was clicked. Value is now: true	2013-06-27 21:41:52.295062	2013-06-27 21:41:52.295062
4068	732	Good 1 was clicked. Value is now: true	2013-06-27 21:41:52.378929	2013-06-27 21:41:52.378929
4069	702	Good 2 was clicked. Value is now: true	2013-06-27 21:41:52.577047	2013-06-27 21:41:52.577047
4070	732	Good 2 was clicked. Value is now: true	2013-06-27 21:41:52.712414	2013-06-27 21:41:52.712414
4071	1084	Menu item was shown: bundle 1,3,4	2013-06-27 21:41:53.004664	2013-06-27 21:41:53.004664
4072	702	Good 3 was clicked. Value is now: true	2013-06-27 21:41:53.025475	2013-06-27 21:41:53.025475
4073	702	Good 4 was clicked. Value is now: true	2013-06-27 21:41:53.465648	2013-06-27 21:41:53.465648
4074	953	Menu item was shown: bundle 2,3	2013-06-27 21:41:53.667298	2013-06-27 21:41:53.667298
4075	227	Menu item was shown: bundle 3,4,5	2013-06-27 21:41:53.963786	2013-06-27 21:41:53.963786
4076	732	Good 4 was clicked. Value is now: true	2013-06-27 21:41:54.085398	2013-06-27 21:41:54.085398
4077	227	Menu item was shown: bundle 2,4,5	2013-06-27 21:41:54.865543	2013-06-27 21:41:54.865543
4078	732	Menu item was shown: bundle 1,2,3	2013-06-27 21:41:55.058873	2013-06-27 21:41:55.058873
4079	1084	Menu item was shown: bundle 2,3,4	2013-06-27 21:41:55.204794	2013-06-27 21:41:55.204794
4080	1113	Menu item was shown: bundle 1,2	2013-06-27 21:41:55.874887	2013-06-27 21:41:55.874887
4081	1084	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:41:56.02872	2013-06-27 21:41:56.02872
4082	215	Menu item was shown: bundle 3,5	2013-06-27 21:41:56.728597	2013-06-27 21:41:56.728597
4083	732	Menu item was shown: bundle 3,4	2013-06-27 21:41:57.964233	2013-06-27 21:41:57.964233
4084	1084	Menu item was shown: bundle 1,2	2013-06-27 21:41:58.126226	2013-06-27 21:41:58.126226
4085	953	Menu item was shown: bundle 2,4	2013-06-27 21:41:59.221027	2013-06-27 21:41:59.221027
4086	215	Menu item was hidden: bundle 3,5	2013-06-27 21:41:59.400019	2013-06-27 21:41:59.400019
4087	227	Menu item was shown: bundle 2,3,5	2013-06-27 21:41:59.659154	2013-06-27 21:41:59.659154
4088	215	Menu item was shown: bundle 4,5	2013-06-27 21:42:00.143118	2013-06-27 21:42:00.143118
4089	215	Menu item was hidden: bundle 4,5	2013-06-27 21:42:00.746782	2013-06-27 21:42:00.746782
4090	732	Menu item was shown: bundle 2,4	2013-06-27 21:42:00.82846	2013-06-27 21:42:00.82846
4091	227	Menu item was shown: bundle 2,4,5	2013-06-27 21:42:00.93543	2013-06-27 21:42:00.93543
4092	998	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:01.011559	2013-06-27 21:42:01.011559
4093	215	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:01.377669	2013-06-27 21:42:01.377669
4094	732	Menu item was shown: bundle 2,3	2013-06-27 21:42:01.922677	2013-06-27 21:42:01.922677
4095	1084	Menu item was shown: bundle 1,3	2013-06-27 21:42:02.118252	2013-06-27 21:42:02.118252
4096	732	Menu item was hidden: bundle 2,3	2013-06-27 21:42:02.146771	2013-06-27 21:42:02.146771
4097	215	Menu item was hidden: bundle 1,2,3	2013-06-27 21:42:02.194644	2013-06-27 21:42:02.194644
4098	953	Menu item was shown: bundle 3,4	2013-06-27 21:42:02.503184	2013-06-27 21:42:02.503184
4099	732	Menu item was shown: bundle 1,4	2013-06-27 21:42:02.88804	2013-06-27 21:42:02.88804
4100	215	Menu item was shown: bundle 1,2,4	2013-06-27 21:42:02.913086	2013-06-27 21:42:02.913086
4101	1084	Menu item was shown: bundle 1,4	2013-06-27 21:42:04.861247	2013-06-27 21:42:04.861247
4102	953	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:05.29544	2013-06-27 21:42:05.29544
4103	732	Menu item was shown: bundle 1,3	2013-06-27 21:42:06.231375	2013-06-27 21:42:06.231375
4104	732	Menu item was shown: bundle 1,2	2013-06-27 21:42:06.949529	2013-06-27 21:42:06.949529
4105	207	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:42:07.463551	2013-06-27 21:42:07.463551
4106	215	Menu item was shown: bundle 1,2,5	2013-06-27 21:42:07.561315	2013-06-27 21:42:07.561315
4107	1084	Menu item was shown: bundle 2,3	2013-06-27 21:42:08.264237	2013-06-27 21:42:08.264237
4108	207	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:42:08.512387	2013-06-27 21:42:08.512387
4109	207	Menu item was shown: bundle 3,4,5	2013-06-27 21:42:09.526123	2013-06-27 21:42:09.526123
4110	732	Menu item was shown: bundle 1,3	2013-06-27 21:42:09.553521	2013-06-27 21:42:09.553521
4111	953	Good 1 was clicked. Value is now: true	2013-06-27 21:42:09.658055	2013-06-27 21:42:09.658055
4112	998	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:42:09.762038	2013-06-27 21:42:09.762038
4113	215	Menu item was shown: bundle 1,3,4	2013-06-27 21:42:10.196993	2013-06-27 21:42:10.196993
4114	207	Menu item was shown: bundle 2,4,5	2013-06-27 21:42:10.753001	2013-06-27 21:42:10.753001
4115	953	Good 3 was clicked. Value is now: true	2013-06-27 21:42:11.22139	2013-06-27 21:42:11.22139
4116	215	Menu item was shown: bundle 1,3,5	2013-06-27 21:42:11.302154	2013-06-27 21:42:11.302154
4117	953	Good 2 was clicked. Value is now: true	2013-06-27 21:42:11.782116	2013-06-27 21:42:11.782116
4118	732	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:12.088592	2013-06-27 21:42:12.088592
4119	732	Menu item was shown: bundle 1,2,4	2013-06-27 21:42:12.688169	2013-06-27 21:42:12.688169
4120	1084	Menu item was shown: bundle 2,4	2013-06-27 21:42:13.070075	2013-06-27 21:42:13.070075
4121	207	Menu item was shown: bundle 2,3,5	2013-06-27 21:42:13.090371	2013-06-27 21:42:13.090371
4122	953	Menu item was shown: bundle 1,2,4	2013-06-27 21:42:13.620519	2013-06-27 21:42:13.620519
4123	207	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:14.084785	2013-06-27 21:42:14.084785
4124	953	Menu item was shown: bundle 1,3,4	2013-06-27 21:42:14.835105	2013-06-27 21:42:14.835105
4125	227	Good 2 was clicked. Value is now: true	2013-06-27 21:42:15.843538	2013-06-27 21:42:15.843538
4126	1084	Menu item was shown: bundle 3,4	2013-06-27 21:42:15.870689	2013-06-27 21:42:15.870689
4127	207	Menu item was shown: bundle 1,4,5	2013-06-27 21:42:16.532939	2013-06-27 21:42:16.532939
4128	1113	Menu item was shown: bundle 1,3	2013-06-27 21:42:16.553281	2013-06-27 21:42:16.553281
4129	227	Good 4 was clicked. Value is now: true	2013-06-27 21:42:16.580392	2013-06-27 21:42:16.580392
4130	902	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:16.741597	2013-06-27 21:42:16.741597
4131	227	Good 5 was clicked. Value is now: true	2013-06-27 21:42:17.155101	2013-06-27 21:42:17.155101
4132	215	Menu item was shown: bundle 1,4,5	2013-06-27 21:42:17.64977	2013-06-27 21:42:17.64977
4133	1113	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:17.759163	2013-06-27 21:42:17.759163
4134	953	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:17.842399	2013-06-27 21:42:17.842399
4135	215	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:18.618392	2013-06-27 21:42:18.618392
4136	998	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:19.68871	2013-06-27 21:42:19.68871
4137	953	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:42:19.839452	2013-06-27 21:42:19.839452
4138	1084	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:19.913684	2013-06-27 21:42:19.913684
4139	732	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:21.410734	2013-06-27 21:42:21.410734
4140	1084	Menu item was shown: bundle 1,2,4	2013-06-27 21:42:21.976729	2013-06-27 21:42:21.976729
4141	732	Menu item was shown: bundle 3,4	2013-06-27 21:42:22.059086	2013-06-27 21:42:22.059086
4142	215	Good 4 was clicked. Value is now: true	2013-06-27 21:42:22.227495	2013-06-27 21:42:22.227495
4143	207	Menu item was shown: bundle 1,3,5	2013-06-27 21:42:22.891545	2013-06-27 21:42:22.891545
4144	953	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:23.103767	2013-06-27 21:42:23.103767
4145	1113	Menu item was shown: bundle 2,3	2013-06-27 21:42:23.340899	2013-06-27 21:42:23.340899
4146	998	Menu item was shown: bundle 1,3,4	2013-06-27 21:42:23.85741	2013-06-27 21:42:23.85741
4147	1084	Menu item was shown: bundle 1,3,4	2013-06-27 21:42:25.307472	2013-06-27 21:42:25.307472
4148	215	Menu item was shown: bundle 2,3,5	2013-06-27 21:42:25.488091	2013-06-27 21:42:25.488091
4149	215	Menu item was shown: bundle 2,4,5	2013-06-27 21:42:27.220617	2013-06-27 21:42:27.220617
4150	215	Menu item was shown: bundle 3,4,5	2013-06-27 21:42:28.327327	2013-06-27 21:42:28.327327
4151	1113	Menu item was shown: bundle 1,3	2013-06-27 21:42:28.561047	2013-06-27 21:42:28.561047
4152	1113	Menu item was shown: bundle 1,2	2013-06-27 21:42:29.231644	2013-06-27 21:42:29.231644
4153	1113	Menu item was shown: bundle 2,3	2013-06-27 21:42:29.627894	2013-06-27 21:42:29.627894
4154	1084	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:29.669938	2013-06-27 21:42:29.669938
4155	1113	Menu item was shown: bundle 1,2	2013-06-27 21:42:30.068902	2013-06-27 21:42:30.068902
4156	215	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:42:30.246132	2013-06-27 21:42:30.246132
4157	1084	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:42:30.982689	2013-06-27 21:42:30.982689
4158	1113	Menu item was shown: bundle 1,3	2013-06-27 21:42:31.027665	2013-06-27 21:42:31.027665
4159	215	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:42:31.181644	2013-06-27 21:42:31.181644
4160	207	Good 1 was clicked. Value is now: true	2013-06-27 21:42:32.683795	2013-06-27 21:42:32.683795
4161	215	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:42:33.13733	2013-06-27 21:42:33.13733
4162	207	Good 3 was clicked. Value is now: true	2013-06-27 21:42:33.455853	2013-06-27 21:42:33.455853
4163	207	Good 5 was clicked. Value is now: true	2013-06-27 21:42:33.992357	2013-06-27 21:42:33.992357
4164	998	Menu item was shown: bundle 1,2,3	2013-06-27 21:42:36.752691	2013-06-27 21:42:36.752691
4165	215	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:42:37.43036	2013-06-27 21:42:37.43036
4166	215	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:42:38.244127	2013-06-27 21:42:38.244127
4167	215	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:42:39.128231	2013-06-27 21:42:39.128231
4168	998	Menu item was shown: bundle 1,2,4	2013-06-27 21:42:40.771089	2013-06-27 21:42:40.771089
4169	998	Menu item was shown: bundle 1,3,4	2013-06-27 21:42:48.114449	2013-06-27 21:42:48.114449
4170	215	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:49.03693	2013-06-27 21:42:49.03693
4171	215	Menu item was hidden: bundle 2,3,4	2013-06-27 21:42:50.60362	2013-06-27 21:42:50.60362
4172	998	Menu item was shown: bundle 2,3,4	2013-06-27 21:42:56.373814	2013-06-27 21:42:56.373814
4173	899	Combo was clicked. Value is now: true	2013-06-27 21:43:00.63123	2013-06-27 21:43:00.63123
4174	949	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:43:01.775345	2013-06-27 21:43:01.775345
4175	899	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:03.524978	2013-06-27 21:43:03.524978
4176	949	Good 4 was clicked. Value is now: true	2013-06-27 21:43:03.673778	2013-06-27 21:43:03.673778
4177	998	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:43:03.863604	2013-06-27 21:43:03.863604
4178	949	Good 5 was clicked. Value is now: true	2013-06-27 21:43:04.47542	2013-06-27 21:43:04.47542
4179	899	Menu item was hidden: bundle 1,2,3	2013-06-27 21:43:04.744633	2013-06-27 21:43:04.744633
4180	949	Good 3 was clicked. Value is now: true	2013-06-27 21:43:04.963433	2013-06-27 21:43:04.963433
4181	949	Good 2 was clicked. Value is now: true	2013-06-27 21:43:05.407125	2013-06-27 21:43:05.407125
4182	949	Good 1 was clicked. Value is now: true	2013-06-27 21:43:05.858926	2013-06-27 21:43:05.858926
4183	899	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:06.563361	2013-06-27 21:43:06.563361
4184	899	Menu item was hidden: bundle 1,2,3	2013-06-27 21:43:07.087771	2013-06-27 21:43:07.087771
4185	899	Menu item was shown: bundle 1,2	2013-06-27 21:43:09.377833	2013-06-27 21:43:09.377833
4186	1003	Menu item was shown: bundle 1,2	2013-06-27 21:43:10.732928	2013-06-27 21:43:10.732928
4187	949	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:43:11.439922	2013-06-27 21:43:11.439922
4188	1003	Menu item was shown: bundle 1,3	2013-06-27 21:43:12.507618	2013-06-27 21:43:12.507618
4189	1003	Menu item was shown: bundle 2,3	2013-06-27 21:43:13.397058	2013-06-27 21:43:13.397058
4190	1104	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:43:13.510812	2013-06-27 21:43:13.510812
4191	1003	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:14.202269	2013-06-27 21:43:14.202269
4192	899	Menu item was shown: bundle 1,3	2013-06-27 21:43:14.955335	2013-06-27 21:43:14.955335
4193	1104	Combo was clicked. Value is now: true	2013-06-27 21:43:15.147674	2013-06-27 21:43:15.147674
4194	899	Menu item was shown: bundle 2,3	2013-06-27 21:43:18.809054	2013-06-27 21:43:18.809054
4195	1104	Menu item was shown: bundle 1,3,4	2013-06-27 21:43:20.655655	2013-06-27 21:43:20.655655
4196	949	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:43:22.190285	2013-06-27 21:43:22.190285
4197	701	Menu item was shown: bundle 1,2,5	2013-06-27 21:43:22.429975	2013-06-27 21:43:22.429975
4198	1003	Good 1 was clicked. Value is now: true	2013-06-27 21:43:22.617511	2013-06-27 21:43:22.617511
4199	1003	Good 2 was clicked. Value is now: true	2013-06-27 21:43:23.152343	2013-06-27 21:43:23.152343
4200	1003	Good 3 was clicked. Value is now: true	2013-06-27 21:43:23.404416	2013-06-27 21:43:23.404416
4201	1003	Menu item was shown: bundle 1,2	2013-06-27 21:43:25.243399	2013-06-27 21:43:25.243399
4202	1104	Menu item was shown: bundle 1,2	2013-06-27 21:43:25.736268	2013-06-27 21:43:25.736268
4203	1003	Menu item was shown: bundle 1,3	2013-06-27 21:43:26.067657	2013-06-27 21:43:26.067657
4204	972	Menu item was shown: bundle 1,2	2013-06-27 21:43:26.131	2013-06-27 21:43:26.131
4205	1104	Menu item was hidden: bundle 1,2	2013-06-27 21:43:26.431179	2013-06-27 21:43:26.431179
4206	972	Menu item was shown: bundle 1,3	2013-06-27 21:43:26.501872	2013-06-27 21:43:26.501872
4207	972	Menu item was shown: bundle 1,4	2013-06-27 21:43:27.101787	2013-06-27 21:43:27.101787
4208	1003	Menu item was shown: bundle 2,3	2013-06-27 21:43:27.327806	2013-06-27 21:43:27.327806
4209	701	Menu item was shown: bundle 1,2	2013-06-27 21:43:27.414091	2013-06-27 21:43:27.414091
4210	972	Menu item was shown: bundle 2,4	2013-06-27 21:43:27.574138	2013-06-27 21:43:27.574138
4211	972	Menu item was shown: bundle 1,4	2013-06-27 21:43:28.156699	2013-06-27 21:43:28.156699
4212	1003	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:28.23373	2013-06-27 21:43:28.23373
4213	701	Menu item was shown: bundle 1,3	2013-06-27 21:43:28.735933	2013-06-27 21:43:28.735933
4214	972	Menu item was shown: bundle 2,4	2013-06-27 21:43:29.967295	2013-06-27 21:43:29.967295
4215	1104	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:43:30.270146	2013-06-27 21:43:30.270146
4216	972	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:31.738146	2013-06-27 21:43:31.738146
4217	972	Menu item was shown: bundle 2,4	2013-06-27 21:43:32.110684	2013-06-27 21:43:32.110684
4218	701	Menu item was shown: bundle 1,4	2013-06-27 21:43:32.307954	2013-06-27 21:43:32.307954
4219	972	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:32.914615	2013-06-27 21:43:32.914615
4220	972	Menu item was shown: bundle 3,4	2013-06-27 21:43:33.713575	2013-06-27 21:43:33.713575
4221	972	Menu item was shown: bundle 1,2,4	2013-06-27 21:43:34.265291	2013-06-27 21:43:34.265291
4222	949	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:43:34.673515	2013-06-27 21:43:34.673515
4223	972	Menu item was shown: bundle 3,4	2013-06-27 21:43:34.892632	2013-06-27 21:43:34.892632
4224	972	Menu item was shown: bundle 1,3,4	2013-06-27 21:43:36.31903	2013-06-27 21:43:36.31903
4225	701	Menu item was shown: bundle 1,5	2013-06-27 21:43:36.597363	2013-06-27 21:43:36.597363
4226	972	Menu item was shown: bundle 1,2,4	2013-06-27 21:43:37.05181	2013-06-27 21:43:37.05181
4227	972	Menu item was shown: bundle 2,3,4	2013-06-27 21:43:37.632803	2013-06-27 21:43:37.632803
4228	1104	Menu item was shown: bundle 4,5	2013-06-27 21:43:37.736581	2013-06-27 21:43:37.736581
4229	972	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:43:38.556701	2013-06-27 21:43:38.556701
4230	1003	Menu item was shown: bundle 1,2	2013-06-27 21:43:38.791212	2013-06-27 21:43:38.791212
4231	1104	Menu item was shown: bundle 1,2,4	2013-06-27 21:43:39.018808	2013-06-27 21:43:39.018808
4232	1003	Menu item was shown: bundle 1,3	2013-06-27 21:43:39.876208	2013-06-27 21:43:39.876208
4233	701	Menu item was shown: bundle 2,3	2013-06-27 21:43:40.754019	2013-06-27 21:43:40.754019
4234	1003	Menu item was shown: bundle 2,3	2013-06-27 21:43:41.502587	2013-06-27 21:43:41.502587
4235	972	Combo was clicked. Value is now: true	2013-06-27 21:43:41.959173	2013-06-27 21:43:41.959173
4236	1003	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:45.240526	2013-06-27 21:43:45.240526
4237	701	Menu item was shown: bundle 2,4	2013-06-27 21:43:45.745646	2013-06-27 21:43:45.745646
4238	1104	Good 1 was clicked. Value is now: true	2013-06-27 21:43:45.948438	2013-06-27 21:43:45.948438
4239	1113	Good 2 was clicked. Value is now: true	2013-06-27 21:43:46.751458	2013-06-27 21:43:46.751458
4240	1104	Good 4 was clicked. Value is now: true	2013-06-27 21:43:46.899956	2013-06-27 21:43:46.899956
4241	1104	Good 2 was clicked. Value is now: true	2013-06-27 21:43:47.277322	2013-06-27 21:43:47.277322
4242	701	Menu item was shown: bundle 2,5	2013-06-27 21:43:47.665883	2013-06-27 21:43:47.665883
4243	701	Menu item was shown: bundle 3,4	2013-06-27 21:43:48.844032	2013-06-27 21:43:48.844032
4244	949	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:43:49.157239	2013-06-27 21:43:49.157239
4245	701	Menu item was shown: bundle 3,5	2013-06-27 21:43:50.547947	2013-06-27 21:43:50.547947
4246	701	Menu item was shown: bundle 4,5	2013-06-27 21:43:51.671294	2013-06-27 21:43:51.671294
4247	899	Combo was clicked. Value is now: false	2013-06-27 21:43:55.492031	2013-06-27 21:43:55.492031
4248	701	Menu item was shown: bundle 1,2,3	2013-06-27 21:43:56.10199	2013-06-27 21:43:56.10199
4249	899	Good 3 was clicked. Value is now: true	2013-06-27 21:43:57.732412	2013-06-27 21:43:57.732412
4250	290	Good 2 was clicked. Value is now: true	2013-06-27 21:43:57.870205	2013-06-27 21:43:57.870205
4251	899	Good 2 was clicked. Value is now: true	2013-06-27 21:43:58.039324	2013-06-27 21:43:58.039324
4252	290	Good 3 was clicked. Value is now: true	2013-06-27 21:43:58.51043	2013-06-27 21:43:58.51043
4253	986	Menu item was shown: bundle 1,2	2013-06-27 21:44:00.969222	2013-06-27 21:44:00.969222
4254	290	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:01.45803	2013-06-27 21:44:01.45803
4255	1113	Menu item was shown: bundle 1,2	2013-06-27 21:44:01.539138	2013-06-27 21:44:01.539138
4256	949	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:01.936406	2013-06-27 21:44:01.936406
4257	701	Menu item was shown: bundle 1,2,4	2013-06-27 21:44:02.264579	2013-06-27 21:44:02.264579
4258	949	Menu item was shown: bundle 3,4,5	2013-06-27 21:44:03.56129	2013-06-27 21:44:03.56129
4259	290	Menu item was shown: bundle 2,3,4	2013-06-27 21:44:05.691137	2013-06-27 21:44:05.691137
4260	1113	Menu item was shown: bundle 1,3	2013-06-27 21:44:06.241533	2013-06-27 21:44:06.241533
4261	290	Menu item was shown: bundle 1,3,4	2013-06-27 21:44:06.890865	2013-06-27 21:44:06.890865
4262	986	Menu item was shown: bundle 1,3	2013-06-27 21:44:07.400095	2013-06-27 21:44:07.400095
4263	986	Menu item was shown: bundle 2,3	2013-06-27 21:44:08.570605	2013-06-27 21:44:08.570605
4264	986	Menu item was shown: bundle 1,4	2013-06-27 21:44:09.851204	2013-06-27 21:44:09.851204
4265	949	Menu item was shown: bundle 2,4,5	2013-06-27 21:44:10.004228	2013-06-27 21:44:10.004228
4266	1113	Menu item was shown: bundle 2,3	2013-06-27 21:44:10.9799	2013-06-27 21:44:10.9799
4267	986	Menu item was shown: bundle 1,2,3	2013-06-27 21:44:11.613097	2013-06-27 21:44:11.613097
4268	701	Menu item was shown: bundle 1,3,4	2013-06-27 21:44:11.703145	2013-06-27 21:44:11.703145
4269	1113	Menu item was shown: bundle 1,2,3	2013-06-27 21:44:12.391294	2013-06-27 21:44:12.391294
4270	986	Menu item was shown: bundle 1,2,4	2013-06-27 21:44:12.444517	2013-06-27 21:44:12.444517
4271	986	Menu item was shown: bundle 1,3,4	2013-06-27 21:44:13.273711	2013-06-27 21:44:13.273711
4272	290	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:13.459524	2013-06-27 21:44:13.459524
4273	986	Menu item was shown: bundle 2,3,4	2013-06-27 21:44:14.12424	2013-06-27 21:44:14.12424
4274	701	Menu item was shown: bundle 1,3,5	2013-06-27 21:44:14.558852	2013-06-27 21:44:14.558852
4275	986	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:14.683805	2013-06-27 21:44:14.683805
4276	1104	Menu item was shown: bundle 1,3,4	2013-06-27 21:44:14.894947	2013-06-27 21:44:14.894947
4277	986	Good 1 was clicked. Value is now: true	2013-06-27 21:44:16.273395	2013-06-27 21:44:16.273395
4278	290	Menu item was shown: bundle 1,3,4	2013-06-27 21:44:16.302626	2013-06-27 21:44:16.302626
4279	899	Menu item was shown: bundle 1,3	2013-06-27 21:44:17.918915	2013-06-27 21:44:17.918915
4280	290	Good 1 was clicked. Value is now: true	2013-06-27 21:44:18.089561	2013-06-27 21:44:18.089561
4281	949	Menu item was shown: bundle 2,3,5	2013-06-27 21:44:18.199951	2013-06-27 21:44:18.199951
4282	290	Good 4 was clicked. Value is now: true	2013-06-27 21:44:19.355294	2013-06-27 21:44:19.355294
4283	701	Menu item was shown: bundle 1,4,5	2013-06-27 21:44:19.451662	2013-06-27 21:44:19.451662
4284	899	Menu item was shown: bundle 1,2	2013-06-27 21:44:21.146181	2013-06-27 21:44:21.146181
4285	290	Combo was clicked. Value is now: true	2013-06-27 21:44:21.187742	2013-06-27 21:44:21.187742
4286	1104	Menu item was shown: bundle 1,4	2013-06-27 21:44:22.388696	2013-06-27 21:44:22.388696
4287	701	Menu item was shown: bundle 2,3,4	2013-06-27 21:44:23.115947	2013-06-27 21:44:23.115947
4288	290	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:23.556707	2013-06-27 21:44:23.556707
4289	949	Menu item was shown: bundle 2,3,4	2013-06-27 21:44:23.74462	2013-06-27 21:44:23.74462
4290	701	Menu item was shown: bundle 2,3,5	2013-06-27 21:44:24.041812	2013-06-27 21:44:24.041812
4291	1104	Good 2 was clicked. Value is now: false	2013-06-27 21:44:25.831068	2013-06-27 21:44:25.831068
4292	290	Menu item was shown: bundle 1,2,4	2013-06-27 21:44:27.639033	2013-06-27 21:44:27.639033
4293	290	Menu item was shown: bundle 1,2,3	2013-06-27 21:44:28.519681	2013-06-27 21:44:28.519681
4294	290	Menu item was shown: bundle 3,4	2013-06-27 21:44:29.232548	2013-06-27 21:44:29.232548
4295	701	Menu item was shown: bundle 2,4,5	2013-06-27 21:44:30.058801	2013-06-27 21:44:30.058801
4296	949	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:44:31.389824	2013-06-27 21:44:31.389824
4297	290	Menu item was shown: bundle 2,4	2013-06-27 21:44:31.433725	2013-06-27 21:44:31.433725
4298	290	Menu item was shown: bundle 2,3	2013-06-27 21:44:34.888864	2013-06-27 21:44:34.888864
4299	410	Menu item was shown: bundle 1,2	2013-06-27 21:44:35.984774	2013-06-27 21:44:35.984774
4300	899	Menu item was shown: bundle 1,3	2013-06-27 21:44:36.525064	2013-06-27 21:44:36.525064
4301	410	Menu item was shown: bundle 1,3	2013-06-27 21:44:38.170715	2013-06-27 21:44:38.170715
4302	1042	Menu item was shown: bundle 1,2	2013-06-27 21:44:39.416868	2013-06-27 21:44:39.416868
4303	899	Menu item was shown: bundle 2,3	2013-06-27 21:44:39.531132	2013-06-27 21:44:39.531132
4304	410	Menu item was shown: bundle 1,4	2013-06-27 21:44:40.697822	2013-06-27 21:44:40.697822
4305	1042	Good 1 was clicked. Value is now: true	2013-06-27 21:44:44.811563	2013-06-27 21:44:44.811563
4306	1042	Good 2 was clicked. Value is now: true	2013-06-27 21:44:45.347657	2013-06-27 21:44:45.347657
4307	410	Good 1 was clicked. Value is now: true	2013-06-27 21:44:45.596546	2013-06-27 21:44:45.596546
4308	701	Good 2 was clicked. Value is now: true	2013-06-27 21:44:45.811959	2013-06-27 21:44:45.811959
4309	290	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:46.077737	2013-06-27 21:44:46.077737
4310	701	Good 4 was clicked. Value is now: true	2013-06-27 21:44:46.388038	2013-06-27 21:44:46.388038
4311	410	Good 4 was clicked. Value is now: true	2013-06-27 21:44:46.574526	2013-06-27 21:44:46.574526
4312	701	Good 5 was clicked. Value is now: true	2013-06-27 21:44:46.841025	2013-06-27 21:44:46.841025
4313	410	Menu item was shown: bundle 1,5	2013-06-27 21:44:47.517277	2013-06-27 21:44:47.517277
4314	1042	Menu item was shown: bundle 1,3	2013-06-27 21:44:47.636572	2013-06-27 21:44:47.636572
4315	949	Menu item was shown: bundle 2,3,4	2013-06-27 21:44:48.944564	2013-06-27 21:44:48.944564
4316	410	Menu item was shown: bundle 2,3	2013-06-27 21:44:49.70922	2013-06-27 21:44:49.70922
4317	1042	Menu item was shown: bundle 2,3	2013-06-27 21:44:50.953882	2013-06-27 21:44:50.953882
4318	290	Menu item was shown: bundle 2,3	2013-06-27 21:44:51.331733	2013-06-27 21:44:51.331733
4319	290	Menu item was shown: bundle 1,4	2013-06-27 21:44:51.812305	2013-06-27 21:44:51.812305
4320	1042	Menu item was shown: bundle 1,2,3	2013-06-27 21:44:52.951932	2013-06-27 21:44:52.951932
4321	949	Menu item was shown: bundle 1,4,5	2013-06-27 21:44:53.231016	2013-06-27 21:44:53.231016
4322	899	Menu item was shown: bundle 1,2,3	2013-06-27 21:44:53.415746	2013-06-27 21:44:53.415746
4323	290	Menu item was shown: bundle 1,3	2013-06-27 21:44:54.6901	2013-06-27 21:44:54.6901
4324	899	Menu item was shown: bundle 1,3	2013-06-27 21:44:55.485289	2013-06-27 21:44:55.485289
4325	410	Good 1 was clicked. Value is now: false	2013-06-27 21:44:55.540314	2013-06-27 21:44:55.540314
4326	899	Menu item was shown: bundle 2,3	2013-06-27 21:44:55.909443	2013-06-27 21:44:55.909443
4327	949	Menu item was shown: bundle 1,3,5	2013-06-27 21:44:55.976791	2013-06-27 21:44:55.976791
4328	410	Good 4 was clicked. Value is now: false	2013-06-27 21:44:56.046669	2013-06-27 21:44:56.046669
4329	410	Good 2 was clicked. Value is now: true	2013-06-27 21:44:56.66787	2013-06-27 21:44:56.66787
4330	410	Good 3 was clicked. Value is now: true	2013-06-27 21:44:57.090439	2013-06-27 21:44:57.090439
4331	1042	Menu item was shown: bundle 1,2	2013-06-27 21:44:57.53223	2013-06-27 21:44:57.53223
4332	546	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:44:58.013342	2013-06-27 21:44:58.013342
4333	290	Menu item was shown: bundle 1,2	2013-06-27 21:44:58.417159	2013-06-27 21:44:58.417159
4334	1130	Menu item was shown: bundle 1,2	2013-06-27 21:44:59.361517	2013-06-27 21:44:59.361517
4335	1130	Menu item was shown: bundle 1,3	2013-06-27 21:44:59.852299	2013-06-27 21:44:59.852299
4336	1130	Menu item was shown: bundle 1,4	2013-06-27 21:45:00.318306	2013-06-27 21:45:00.318306
4337	1130	Menu item was shown: bundle 1,5	2013-06-27 21:45:00.904073	2013-06-27 21:45:00.904073
4338	1130	Menu item was shown: bundle 2,3	2013-06-27 21:45:01.607893	2013-06-27 21:45:01.607893
4339	701	Menu item was shown: bundle 3,4,5	2013-06-27 21:45:01.861081	2013-06-27 21:45:01.861081
4340	1130	Menu item was shown: bundle 2,4	2013-06-27 21:45:02.029149	2013-06-27 21:45:02.029149
4341	949	Menu item was shown: bundle 1,3,4	2013-06-27 21:45:02.24821	2013-06-27 21:45:02.24821
4342	290	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:45:02.461031	2013-06-27 21:45:02.461031
4343	1130	Menu item was shown: bundle 2,5	2013-06-27 21:45:02.685753	2013-06-27 21:45:02.685753
4344	701	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:45:02.974409	2013-06-27 21:45:02.974409
4345	410	Menu item was shown: bundle 2,4	2013-06-27 21:45:03.427045	2013-06-27 21:45:03.427045
4346	1130	Menu item was shown: bundle 2,4	2013-06-27 21:45:03.472534	2013-06-27 21:45:03.472534
4347	701	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:45:03.906626	2013-06-27 21:45:03.906626
4348	410	Menu item was shown: bundle 2,5	2013-06-27 21:45:04.490881	2013-06-27 21:45:04.490881
4349	546	Menu item was shown: bundle 1,2	2013-06-27 21:45:04.589785	2013-06-27 21:45:04.589785
4350	410	Menu item was shown: bundle 3,4	2013-06-27 21:45:05.380516	2013-06-27 21:45:05.380516
4351	546	Menu item was shown: bundle 1,3	2013-06-27 21:45:05.404591	2013-06-27 21:45:05.404591
4352	546	Menu item was shown: bundle 1,4	2013-06-27 21:45:05.865698	2013-06-27 21:45:05.865698
4353	546	Menu item was shown: bundle 1,5	2013-06-27 21:45:06.282837	2013-06-27 21:45:06.282837
4354	410	Menu item was shown: bundle 3,5	2013-06-27 21:45:06.355886	2013-06-27 21:45:06.355886
4355	546	Menu item was shown: bundle 2,3	2013-06-27 21:45:06.792303	2013-06-27 21:45:06.792303
4356	546	Menu item was shown: bundle 2,4	2013-06-27 21:45:07.184701	2013-06-27 21:45:07.184701
4357	410	Menu item was shown: bundle 4,5	2013-06-27 21:45:07.567097	2013-06-27 21:45:07.567097
4358	1130	Good 2 was clicked. Value is now: true	2013-06-27 21:45:08.172762	2013-06-27 21:45:08.172762
4359	546	Menu item was shown: bundle 2,5	2013-06-27 21:45:08.609263	2013-06-27 21:45:08.609263
4360	1130	Good 4 was clicked. Value is now: true	2013-06-27 21:45:08.719949	2013-06-27 21:45:08.719949
4361	546	Menu item was shown: bundle 3,4	2013-06-27 21:45:09.276282	2013-06-27 21:45:09.276282
4362	949	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:09.517376	2013-06-27 21:45:09.517376
4363	546	Menu item was shown: bundle 3,5	2013-06-27 21:45:09.838338	2013-06-27 21:45:09.838338
4364	546	Menu item was shown: bundle 3,4	2013-06-27 21:45:10.645282	2013-06-27 21:45:10.645282
4365	410	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:14.235568	2013-06-27 21:45:14.235568
4366	1017	Menu item was shown: bundle 1,2	2013-06-27 21:45:14.435789	2013-06-27 21:45:14.435789
4367	410	Menu item was shown: bundle 1,2,4	2013-06-27 21:45:15.152142	2013-06-27 21:45:15.152142
4368	546	Menu item was shown: bundle 3,5	2013-06-27 21:45:15.447886	2013-06-27 21:45:15.447886
4369	949	Menu item was shown: bundle 1,2,4	2013-06-27 21:45:16.465862	2013-06-27 21:45:16.465862
4370	949	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:18.10583	2013-06-27 21:45:18.10583
4371	1017	Menu item was shown: bundle 1,3	2013-06-27 21:45:18.711078	2013-06-27 21:45:18.711078
4372	949	Menu item was shown: bundle 4,5	2013-06-27 21:45:19.027318	2013-06-27 21:45:19.027318
4373	546	Menu item was shown: bundle 4,5	2013-06-27 21:45:19.274713	2013-06-27 21:45:19.274713
4374	240	Menu item was shown: bundle 1,2	2013-06-27 21:45:21.09845	2013-06-27 21:45:21.09845
4375	546	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:21.289713	2013-06-27 21:45:21.289713
4376	701	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:45:21.64379	2013-06-27 21:45:21.64379
4377	949	Menu item was shown: bundle 3,5	2013-06-27 21:45:21.699265	2013-06-27 21:45:21.699265
4378	240	Menu item was shown: bundle 1,3	2013-06-27 21:45:21.840322	2013-06-27 21:45:21.840322
4379	546	Menu item was shown: bundle 1,2,4	2013-06-27 21:45:21.92386	2013-06-27 21:45:21.92386
4380	1017	Menu item was shown: bundle 2,3	2013-06-27 21:45:22.350801	2013-06-27 21:45:22.350801
4381	546	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:22.561002	2013-06-27 21:45:22.561002
4382	949	Menu item was shown: bundle 3,4	2013-06-27 21:45:22.742473	2013-06-27 21:45:22.742473
4383	1113	Combo was clicked. Value is now: true	2013-06-27 21:45:23.105342	2013-06-27 21:45:23.105342
4384	701	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:45:23.291334	2013-06-27 21:45:23.291334
4385	1113	Combo was clicked. Value is now: false	2013-06-27 21:45:24.099038	2013-06-27 21:45:24.099038
4386	701	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:45:24.579999	2013-06-27 21:45:24.579999
4387	1017	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:25.196688	2013-06-27 21:45:25.196688
4388	410	Good 1 was clicked. Value is now: true	2013-06-27 21:45:26.467089	2013-06-27 21:45:26.467089
4389	410	Good 3 was clicked. Value is now: false	2013-06-27 21:45:27.139915	2013-06-27 21:45:27.139915
4390	949	Menu item was shown: bundle 2,5	2013-06-27 21:45:27.22182	2013-06-27 21:45:27.22182
4391	546	Menu item was shown: bundle 1,3,4	2013-06-27 21:45:28.227495	2013-06-27 21:45:28.227495
4392	410	Good 4 was clicked. Value is now: true	2013-06-27 21:45:28.525487	2013-06-27 21:45:28.525487
4393	240	Menu item was shown: bundle 1,4	2013-06-27 21:45:28.572946	2013-06-27 21:45:28.572946
4394	1017	Menu item was shown: bundle 1,2	2013-06-27 21:45:30.490313	2013-06-27 21:45:30.490313
4395	240	Menu item was shown: bundle 1,5	2013-06-27 21:45:31.30433	2013-06-27 21:45:31.30433
4396	240	Menu item was shown: bundle 2,3	2013-06-27 21:45:32.527124	2013-06-27 21:45:32.527124
4397	240	Menu item was shown: bundle 2,4	2013-06-27 21:45:33.541116	2013-06-27 21:45:33.541116
4398	410	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:34.114509	2013-06-27 21:45:34.114509
4399	240	Menu item was shown: bundle 2,5	2013-06-27 21:45:34.581068	2013-06-27 21:45:34.581068
4400	546	Combo was clicked. Value is now: true	2013-06-27 21:45:34.654425	2013-06-27 21:45:34.654425
4401	410	Menu item was shown: bundle 1,3,4	2013-06-27 21:45:34.753747	2013-06-27 21:45:34.753747
4402	240	Menu item was shown: bundle 3,4	2013-06-27 21:45:35.699067	2013-06-27 21:45:35.699067
4403	1017	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:35.970539	2013-06-27 21:45:35.970539
4404	240	Menu item was shown: bundle 3,5	2013-06-27 21:45:37.141679	2013-06-27 21:45:37.141679
4405	949	Menu item was shown: bundle 1,4	2013-06-27 21:45:37.873312	2013-06-27 21:45:37.873312
4406	1017	Menu item was shown: bundle 1,2	2013-06-27 21:45:38.139224	2013-06-27 21:45:38.139224
4407	240	Menu item was shown: bundle 4,5	2013-06-27 21:45:39.363185	2013-06-27 21:45:39.363185
4408	701	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:45:40.175668	2013-06-27 21:45:40.175668
4409	546	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:45:40.450396	2013-06-27 21:45:40.450396
4410	240	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:40.852104	2013-06-27 21:45:40.852104
4411	1113	Good 2 was clicked. Value is now: true	2013-06-27 21:45:41.114811	2013-06-27 21:45:41.114811
4412	1017	Good 1 was clicked. Value is now: true	2013-06-27 21:45:41.25062	2013-06-27 21:45:41.25062
4413	949	Menu item was shown: bundle 1,2	2013-06-27 21:45:41.386441	2013-06-27 21:45:41.386441
4414	240	Menu item was shown: bundle 1,2,4	2013-06-27 21:45:41.742268	2013-06-27 21:45:41.742268
4415	410	Good 2 was clicked. Value is now: false	2013-06-27 21:45:42.301127	2013-06-27 21:45:42.301127
4416	1017	Good 2 was clicked. Value is now: true	2013-06-27 21:45:42.378743	2013-06-27 21:45:42.378743
4417	410	Good 3 was clicked. Value is now: true	2013-06-27 21:45:42.755731	2013-06-27 21:45:42.755731
4418	949	Menu item was shown: bundle 1,3	2013-06-27 21:45:42.827176	2013-06-27 21:45:42.827176
4419	410	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:43.842415	2013-06-27 21:45:43.842415
4420	240	Menu item was hidden: bundle 1,2,5	2013-06-27 21:45:44.070231	2013-06-27 21:45:44.070231
4421	240	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:44.38051	2013-06-27 21:45:44.38051
4422	240	Menu item was shown: bundle 1,2,5	2013-06-27 21:45:44.6864	2013-06-27 21:45:44.6864
4423	240	Menu item was shown: bundle 1,3,4	2013-06-27 21:45:45.378486	2013-06-27 21:45:45.378486
4424	240	Menu item was shown: bundle 1,3,5	2013-06-27 21:45:46.830379	2013-06-27 21:45:46.830379
4425	949	Menu item was shown: bundle 1,4	2013-06-27 21:45:48.17404	2013-06-27 21:45:48.17404
4426	240	Menu item was shown: bundle 1,4,5	2013-06-27 21:45:48.267337	2013-06-27 21:45:48.267337
4427	546	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:45:48.585877	2013-06-27 21:45:48.585877
4428	410	Menu item was shown: bundle 1,3,4	2013-06-27 21:45:49.377278	2013-06-27 21:45:49.377278
4429	240	Menu item was shown: bundle 2,3,4	2013-06-27 21:45:49.794837	2013-06-27 21:45:49.794837
4430	240	Menu item was shown: bundle 2,3,5	2013-06-27 21:45:51.693265	2013-06-27 21:45:51.693265
4431	204	Combo was clicked. Value is now: true	2013-06-27 21:45:52.535118	2013-06-27 21:45:52.535118
4432	240	Menu item was shown: bundle 2,4,5	2013-06-27 21:45:53.716078	2013-06-27 21:45:53.716078
4433	949	Menu item was shown: bundle 1,5	2013-06-27 21:45:54.376645	2013-06-27 21:45:54.376645
4434	546	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:45:54.468586	2013-06-27 21:45:54.468586
4435	204	Menu item was shown: bundle 1,2,3	2013-06-27 21:45:54.574097	2013-06-27 21:45:54.574097
4436	546	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:45:54.807512	2013-06-27 21:45:54.807512
4437	240	Menu item was shown: bundle 3,4,5	2013-06-27 21:45:55.097428	2013-06-27 21:45:55.097428
4438	410	Menu item was shown: bundle 1,3,5	2013-06-27 21:45:55.361066	2013-06-27 21:45:55.361066
4439	546	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:45:55.414677	2013-06-27 21:45:55.414677
4440	240	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:45:55.911151	2013-06-27 21:45:55.911151
4441	949	Menu item was shown: bundle 2,3	2013-06-27 21:45:55.986518	2013-06-27 21:45:55.986518
4442	204	Menu item was hidden: bundle 1,2,3	2013-06-27 21:45:56.021872	2013-06-27 21:45:56.021872
4443	546	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:45:56.059438	2013-06-27 21:45:56.059438
4444	410	Menu item was shown: bundle 1,4,5	2013-06-27 21:45:56.329191	2013-06-27 21:45:56.329191
4445	204	Menu item was shown: bundle 2,3	2013-06-27 21:45:56.581491	2013-06-27 21:45:56.581491
4446	410	Menu item was shown: bundle 2,3,4	2013-06-27 21:45:57.064306	2013-06-27 21:45:57.064306
4447	240	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:45:57.210909	2013-06-27 21:45:57.210909
4448	949	Menu item was shown: bundle 2,4	2013-06-27 21:45:57.704225	2013-06-27 21:45:57.704225
4449	992	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:45:58.616004	2013-06-27 21:45:58.616004
4450	240	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:45:58.736888	2013-06-27 21:45:58.736888
4451	204	Menu item was hidden: bundle 2,3	2013-06-27 21:45:59.525684	2013-06-27 21:45:59.525684
4452	949	Menu item was shown: bundle 2,5	2013-06-27 21:45:59.603775	2013-06-27 21:45:59.603775
4453	240	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:45:59.807223	2013-06-27 21:45:59.807223
4454	992	Combo was clicked. Value is now: true	2013-06-27 21:46:00.756194	2013-06-27 21:46:00.756194
4455	949	Menu item was shown: bundle 3,4	2013-06-27 21:46:00.951974	2013-06-27 21:46:00.951974
4456	240	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:46:01.238469	2013-06-27 21:46:01.238469
4457	204	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:01.455701	2013-06-27 21:46:01.455701
4458	546	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:46:01.82107	2013-06-27 21:46:01.82107
4459	992	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:02.166044	2013-06-27 21:46:02.166044
4460	410	Menu item was shown: bundle 2,3,5	2013-06-27 21:46:02.18986	2013-06-27 21:46:02.18986
4461	204	Menu item was hidden: bundle 1,2,3	2013-06-27 21:46:02.22634	2013-06-27 21:46:02.22634
4462	204	Menu item was shown: bundle 1,3	2013-06-27 21:46:02.827911	2013-06-27 21:46:02.827911
4463	410	Menu item was shown: bundle 2,4,5	2013-06-27 21:46:03.111376	2013-06-27 21:46:03.111376
4464	240	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:46:03.471317	2013-06-27 21:46:03.471317
4465	546	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:03.625965	2013-06-27 21:46:03.625965
4466	949	Menu item was shown: bundle 3,5	2013-06-27 21:46:04.047487	2013-06-27 21:46:04.047487
4467	410	Menu item was shown: bundle 3,4,5	2013-06-27 21:46:04.078795	2013-06-27 21:46:04.078795
4468	546	Menu item was shown: bundle 3,4,5	2013-06-27 21:46:04.105857	2013-06-27 21:46:04.105857
4469	546	Menu item was shown: bundle 2,4,5	2013-06-27 21:46:04.516602	2013-06-27 21:46:04.516602
4470	410	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:04.834448	2013-06-27 21:46:04.834448
4471	204	Menu item was hidden: bundle 1,3	2013-06-27 21:46:05.33819	2013-06-27 21:46:05.33819
4472	410	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:46:05.880429	2013-06-27 21:46:05.880429
4473	204	Good 1 was clicked. Value is now: true	2013-06-27 21:46:06.487784	2013-06-27 21:46:06.487784
4474	949	Menu item was shown: bundle 4,5	2013-06-27 21:46:06.943111	2013-06-27 21:46:06.943111
4475	204	Good 3 was clicked. Value is now: true	2013-06-27 21:46:07.010992	2013-06-27 21:46:07.010992
4476	992	Menu item was shown: bundle 1,3,4	2013-06-27 21:46:07.949407	2013-06-27 21:46:07.949407
4477	225	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:08.281452	2013-06-27 21:46:08.281452
4478	546	Menu item was shown: bundle 2,3,5	2013-06-27 21:46:08.400202	2013-06-27 21:46:08.400202
4479	204	Menu item was shown: bundle 1,2	2013-06-27 21:46:09.035823	2013-06-27 21:46:09.035823
4480	225	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:10.464583	2013-06-27 21:46:10.464583
4481	204	Menu item was hidden: bundle 1,2	2013-06-27 21:46:10.560513	2013-06-27 21:46:10.560513
4482	240	Combo was clicked. Value is now: true	2013-06-27 21:46:10.801121	2013-06-27 21:46:10.801121
4483	949	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:11.198366	2013-06-27 21:46:11.198366
4484	546	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:11.880258	2013-06-27 21:46:11.880258
4485	546	Menu item was shown: bundle 1,4,5	2013-06-27 21:46:12.468038	2013-06-27 21:46:12.468038
4486	949	Menu item was shown: bundle 1,2,4	2013-06-27 21:46:12.885255	2013-06-27 21:46:12.885255
4487	225	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:13.037399	2013-06-27 21:46:13.037399
4488	546	Menu item was shown: bundle 1,3,5	2013-06-27 21:46:13.068193	2013-06-27 21:46:13.068193
4489	225	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:13.951022	2013-06-27 21:46:13.951022
4490	410	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:46:15.718725	2013-06-27 21:46:15.718725
4491	992	Menu item was shown: bundle 1,2,4	2013-06-27 21:46:16.306585	2013-06-27 21:46:16.306585
4492	949	Menu item was shown: bundle 1,2,5	2013-06-27 21:46:16.706196	2013-06-27 21:46:16.706196
4493	410	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:46:16.752073	2013-06-27 21:46:16.752073
4494	546	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:46:16.977638	2013-06-27 21:46:16.977638
4495	949	Menu item was shown: bundle 1,3,4	2013-06-27 21:46:17.489478	2013-06-27 21:46:17.489478
4496	546	Good 1 was clicked. Value is now: true	2013-06-27 21:46:18.79214	2013-06-27 21:46:18.79214
4497	949	Menu item was shown: bundle 1,3,5	2013-06-27 21:46:19.281017	2013-06-27 21:46:19.281017
4498	204	Menu item was shown: bundle 1,3	2013-06-27 21:46:19.348845	2013-06-27 21:46:19.348845
4499	546	Good 2 was clicked. Value is now: true	2013-06-27 21:46:19.449292	2013-06-27 21:46:19.449292
4500	546	Good 3 was clicked. Value is now: true	2013-06-27 21:46:19.825755	2013-06-27 21:46:19.825755
4501	204	Menu item was hidden: bundle 1,3	2013-06-27 21:46:19.976443	2013-06-27 21:46:19.976443
4502	546	Good 4 was clicked. Value is now: true	2013-06-27 21:46:20.184385	2013-06-27 21:46:20.184385
4503	546	Good 5 was clicked. Value is now: true	2013-06-27 21:46:20.499648	2013-06-27 21:46:20.499648
4504	949	Menu item was shown: bundle 1,4,5	2013-06-27 21:46:20.700916	2013-06-27 21:46:20.700916
4505	225	Menu item was hidden: bundle 2,3,4	2013-06-27 21:46:21.156558	2013-06-27 21:46:21.156558
4506	949	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:22.130022	2013-06-27 21:46:22.130022
4507	225	Menu item was shown: bundle 1,3,4	2013-06-27 21:46:22.177887	2013-06-27 21:46:22.177887
4508	992	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:22.467989	2013-06-27 21:46:22.467989
4509	225	Menu item was shown: bundle 1,2,4	2013-06-27 21:46:23.835039	2013-06-27 21:46:23.835039
4510	949	Menu item was shown: bundle 2,3,5	2013-06-27 21:46:24.52258	2013-06-27 21:46:24.52258
4511	225	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:24.544471	2013-06-27 21:46:24.544471
4512	225	Menu item was shown: bundle 3,4	2013-06-27 21:46:25.22189	2013-06-27 21:46:25.22189
4513	225	Menu item was shown: bundle 2,4	2013-06-27 21:46:25.677354	2013-06-27 21:46:25.677354
4514	992	Menu item was shown: bundle 3,4	2013-06-27 21:46:26.072811	2013-06-27 21:46:26.072811
4515	225	Menu item was shown: bundle 3,4	2013-06-27 21:46:26.406715	2013-06-27 21:46:26.406715
4516	949	Menu item was shown: bundle 2,4,5	2013-06-27 21:46:28.782119	2013-06-27 21:46:28.782119
4517	225	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:29.96852	2013-06-27 21:46:29.96852
4518	949	Menu item was shown: bundle 3,4,5	2013-06-27 21:46:30.547944	2013-06-27 21:46:30.547944
4519	992	Menu item was shown: bundle 2,4	2013-06-27 21:46:31.522144	2013-06-27 21:46:31.522144
4520	949	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:33.076643	2013-06-27 21:46:33.076643
4521	701	Combo was clicked. Value is now: true	2013-06-27 21:46:33.835951	2013-06-27 21:46:33.835951
4522	992	Menu item was shown: bundle 2,3	2013-06-27 21:46:33.868548	2013-06-27 21:46:33.868548
4523	733	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:34.264399	2013-06-27 21:46:34.264399
4524	949	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:46:35.17104	2013-06-27 21:46:35.17104
4525	225	Good 2 was clicked. Value is now: true	2013-06-27 21:46:35.745548	2013-06-27 21:46:35.745548
4526	225	Good 3 was clicked. Value is now: true	2013-06-27 21:46:36.240405	2013-06-27 21:46:36.240405
4527	992	Menu item was shown: bundle 1,4	2013-06-27 21:46:36.292512	2013-06-27 21:46:36.292512
4528	225	Good 4 was clicked. Value is now: true	2013-06-27 21:46:37.054842	2013-06-27 21:46:37.054842
4529	949	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:46:37.208076	2013-06-27 21:46:37.208076
4530	733	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:37.462457	2013-06-27 21:46:37.462457
4531	949	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:46:38.186963	2013-06-27 21:46:38.186963
4532	1114	Menu item was shown: bundle 1,2	2013-06-27 21:46:39.590814	2013-06-27 21:46:39.590814
4533	217	Good 3 was clicked. Value is now: true	2013-06-27 21:46:39.61417	2013-06-27 21:46:39.61417
4534	1114	Menu item was shown: bundle 1,3	2013-06-27 21:46:40.327537	2013-06-27 21:46:40.327537
4535	992	Menu item was shown: bundle 1,3	2013-06-27 21:46:40.352639	2013-06-27 21:46:40.352639
4536	1114	Menu item was shown: bundle 2,3	2013-06-27 21:46:40.767221	2013-06-27 21:46:40.767221
4537	217	Menu item was shown: bundle 1,3	2013-06-27 21:46:40.793795	2013-06-27 21:46:40.793795
4538	1114	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:41.140964	2013-06-27 21:46:41.140964
4539	949	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:46:41.29806	2013-06-27 21:46:41.29806
4540	961	Menu item was shown: bundle 1,2	2013-06-27 21:46:41.824692	2013-06-27 21:46:41.824692
4541	217	Menu item was shown: bundle 1,2	2013-06-27 21:46:42.195552	2013-06-27 21:46:42.195552
4542	992	Menu item was shown: bundle 1,2	2013-06-27 21:46:42.908383	2013-06-27 21:46:42.908383
4543	410	Menu item was shown: bundle 1,3,4	2013-06-27 21:46:43.102308	2013-06-27 21:46:43.102308
4544	217	Menu item was shown: bundle 2,3	2013-06-27 21:46:43.134166	2013-06-27 21:46:43.134166
4545	733	Good 2 was clicked. Value is now: true	2013-06-27 21:46:43.895342	2013-06-27 21:46:43.895342
4546	961	Menu item was shown: bundle 1,3	2013-06-27 21:46:44.032934	2013-06-27 21:46:44.032934
4547	733	Good 3 was clicked. Value is now: true	2013-06-27 21:46:44.646199	2013-06-27 21:46:44.646199
4548	949	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:46:44.665632	2013-06-27 21:46:44.665632
4549	217	Good 2 was clicked. Value is now: true	2013-06-27 21:46:45.066192	2013-06-27 21:46:45.066192
4550	733	Good 4 was clicked. Value is now: true	2013-06-27 21:46:45.122541	2013-06-27 21:46:45.122541
4551	961	Menu item was shown: bundle 1,4	2013-06-27 21:46:45.205824	2013-06-27 21:46:45.205824
4552	992	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:45.65833	2013-06-27 21:46:45.65833
4553	217	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:45.846286	2013-06-27 21:46:45.846286
4554	961	Good 1 was clicked. Value is now: true	2013-06-27 21:46:46.990837	2013-06-27 21:46:46.990837
4555	217	Menu item was shown: bundle 2,3	2013-06-27 21:46:47.104109	2013-06-27 21:46:47.104109
4556	1114	Menu item was shown: bundle 2,3	2013-06-27 21:46:47.239294	2013-06-27 21:46:47.239294
4557	961	Good 4 was clicked. Value is now: true	2013-06-27 21:46:47.906048	2013-06-27 21:46:47.906048
4558	1114	Menu item was shown: bundle 1,3	2013-06-27 21:46:49.409046	2013-06-27 21:46:49.409046
4559	961	Menu item was shown: bundle 1,5	2013-06-27 21:46:49.519312	2013-06-27 21:46:49.519312
4560	1114	Menu item was shown: bundle 1,2	2013-06-27 21:46:51.587807	2013-06-27 21:46:51.587807
4561	733	Menu item was shown: bundle 1,3,4	2013-06-27 21:46:51.951575	2013-06-27 21:46:51.951575
4562	961	Menu item was shown: bundle 2,3	2013-06-27 21:46:53.4613	2013-06-27 21:46:53.4613
4563	961	Menu item was shown: bundle 2,4	2013-06-27 21:46:54.377021	2013-06-27 21:46:54.377021
4564	1114	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:55.033685	2013-06-27 21:46:55.033685
4565	961	Menu item was shown: bundle 2,5	2013-06-27 21:46:55.411183	2013-06-27 21:46:55.411183
4566	1114	Combo was clicked. Value is now: true	2013-06-27 21:46:56.447551	2013-06-27 21:46:56.447551
4567	961	Menu item was shown: bundle 3,4	2013-06-27 21:46:57.727663	2013-06-27 21:46:57.727663
4568	961	Menu item was shown: bundle 3,5	2013-06-27 21:46:58.528331	2013-06-27 21:46:58.528331
4569	410	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:46:58.695285	2013-06-27 21:46:58.695285
4570	1089	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:46:58.928329	2013-06-27 21:46:58.928329
4571	961	Menu item was shown: bundle 4,5	2013-06-27 21:46:59.061848	2013-06-27 21:46:59.061848
4572	410	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:46:59.335943	2013-06-27 21:46:59.335943
4573	733	Menu item was shown: bundle 2,3,4	2013-06-27 21:46:59.47736	2013-06-27 21:46:59.47736
4574	961	Menu item was shown: bundle 1,2,3	2013-06-27 21:46:59.935428	2013-06-27 21:46:59.935428
4575	410	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:47:00.14949	2013-06-27 21:47:00.14949
4576	410	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:47:01.220882	2013-06-27 21:47:01.220882
4577	410	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:47:02.026729	2013-06-27 21:47:02.026729
4578	1089	Combo was clicked. Value is now: true	2013-06-27 21:47:02.569005	2013-06-27 21:47:02.569005
4579	410	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:47:02.903844	2013-06-27 21:47:02.903844
4580	410	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:47:03.377807	2013-06-27 21:47:03.377807
4581	410	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:47:03.930017	2013-06-27 21:47:03.930017
4582	733	Menu item was shown: bundle 1,2,3	2013-06-27 21:47:05.274997	2013-06-27 21:47:05.274997
4583	410	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:47:05.324575	2013-06-27 21:47:05.324575
4584	949	Menu item was shown: bundle 1,2	2013-06-27 21:47:06.133151	2013-06-27 21:47:06.133151
4585	733	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:06.64914	2013-06-27 21:47:06.64914
4586	1089	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:09.020986	2013-06-27 21:47:09.020986
4587	949	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:47:09.276459	2013-06-27 21:47:09.276459
4588	733	Menu item was shown: bundle 1,2,3	2013-06-27 21:47:09.314374	2013-06-27 21:47:09.314374
4589	961	Combo was clicked. Value is now: true	2013-06-27 21:47:10.848026	2013-06-27 21:47:10.848026
4590	410	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:47:13.395746	2013-06-27 21:47:13.395746
4591	1089	Menu item was shown: bundle 1,3,4	2013-06-27 21:47:14.654495	2013-06-27 21:47:14.654495
4592	733	Good 4 was clicked. Value is now: false	2013-06-27 21:47:15.53336	2013-06-27 21:47:15.53336
4593	733	Good 1 was clicked. Value is now: true	2013-06-27 21:47:16.079461	2013-06-27 21:47:16.079461
4594	899	Menu item was hidden: bundle 2,3	2013-06-27 21:47:16.123855	2013-06-27 21:47:16.123855
4595	899	Menu item was shown: bundle 2,3	2013-06-27 21:47:17.220097	2013-06-27 21:47:17.220097
4596	961	Menu item was shown: bundle 1,2,4	2013-06-27 21:47:17.796709	2013-06-27 21:47:17.796709
4597	410	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:47:18.316578	2013-06-27 21:47:18.316578
4598	961	Menu item was shown: bundle 1,2,5	2013-06-27 21:47:19.067381	2013-06-27 21:47:19.067381
4599	961	Menu item was shown: bundle 1,3,4	2013-06-27 21:47:19.877608	2013-06-27 21:47:19.877608
4600	733	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:20.390492	2013-06-27 21:47:20.390492
4601	961	Menu item was shown: bundle 1,3,5	2013-06-27 21:47:20.781887	2013-06-27 21:47:20.781887
4602	733	Menu item was shown: bundle 1,3,4	2013-06-27 21:47:21.192598	2013-06-27 21:47:21.192598
4603	733	Menu item was shown: bundle 1,2,4	2013-06-27 21:47:22.011577	2013-06-27 21:47:22.011577
4604	961	Menu item was shown: bundle 1,4,5	2013-06-27 21:47:22.087902	2013-06-27 21:47:22.087902
4605	410	Good 1 was clicked. Value is now: false	2013-06-27 21:47:22.238853	2013-06-27 21:47:22.238853
4606	733	Menu item was hidden: bundle 1,2,4	2013-06-27 21:47:22.287899	2013-06-27 21:47:22.287899
4607	410	Good 3 was clicked. Value is now: false	2013-06-27 21:47:22.769785	2013-06-27 21:47:22.769785
4608	961	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:22.812792	2013-06-27 21:47:22.812792
4609	733	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:23.221565	2013-06-27 21:47:23.221565
4610	410	Good 4 was clicked. Value is now: false	2013-06-27 21:47:23.317949	2013-06-27 21:47:23.317949
4611	410	Combo was clicked. Value is now: true	2013-06-27 21:47:23.834283	2013-06-27 21:47:23.834283
4612	1089	Menu item was shown: bundle 1,2,4	2013-06-27 21:47:25.608445	2013-06-27 21:47:25.608445
4613	961	Good 2 was clicked. Value is now: true	2013-06-27 21:47:28.690295	2013-06-27 21:47:28.690295
4614	410	Good 1 was clicked. Value is now: true	2013-06-27 21:47:28.731651	2013-06-27 21:47:28.731651
4615	961	Good 3 was clicked. Value is now: true	2013-06-27 21:47:29.037127	2013-06-27 21:47:29.037127
4616	961	Good 4 was clicked. Value is now: true	2013-06-27 21:47:29.349769	2013-06-27 21:47:29.349769
4617	410	Good 1 was clicked. Value is now: false	2013-06-27 21:47:30.824126	2013-06-27 21:47:30.824126
4618	961	Menu item was shown: bundle 2,3,5	2013-06-27 21:47:31.023029	2013-06-27 21:47:31.023029
4619	961	Menu item was shown: bundle 2,4,5	2013-06-27 21:47:31.894895	2013-06-27 21:47:31.894895
4620	410	Combo was clicked. Value is now: true	2013-06-27 21:47:31.916919	2013-06-27 21:47:31.916919
4621	410	Combo was clicked. Value is now: false	2013-06-27 21:47:33.263929	2013-06-27 21:47:33.263929
4622	733	Menu item was shown: bundle 1,2,3	2013-06-27 21:47:33.30936	2013-06-27 21:47:33.30936
4623	410	Good 1 was clicked. Value is now: true	2013-06-27 21:47:34.013302	2013-06-27 21:47:34.013302
4624	410	Good 2 was clicked. Value is now: true	2013-06-27 21:47:34.609888	2013-06-27 21:47:34.609888
4625	410	Good 3 was clicked. Value is now: true	2013-06-27 21:47:34.857433	2013-06-27 21:47:34.857433
4626	410	Good 4 was clicked. Value is now: true	2013-06-27 21:47:35.357407	2013-06-27 21:47:35.357407
4627	410	Good 5 was clicked. Value is now: true	2013-06-27 21:47:35.954054	2013-06-27 21:47:35.954054
4628	942	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:47:37.375137	2013-06-27 21:47:37.375137
4629	961	Menu item was shown: bundle 3,4,5	2013-06-27 21:47:38.777755	2013-06-27 21:47:38.777755
4630	942	Good 5 was clicked. Value is now: true	2013-06-27 21:47:39.150646	2013-06-27 21:47:39.150646
4631	961	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:47:39.311598	2013-06-27 21:47:39.311598
4632	942	Good 4 was clicked. Value is now: true	2013-06-27 21:47:39.554327	2013-06-27 21:47:39.554327
4633	961	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:47:39.908242	2013-06-27 21:47:39.908242
4634	942	Good 3 was clicked. Value is now: true	2013-06-27 21:47:40.033332	2013-06-27 21:47:40.033332
4635	942	Good 2 was clicked. Value is now: true	2013-06-27 21:47:40.341198	2013-06-27 21:47:40.341198
4636	1089	Menu item was shown: bundle 3,4	2013-06-27 21:47:40.496139	2013-06-27 21:47:40.496139
4637	942	Good 1 was clicked. Value is now: true	2013-06-27 21:47:40.947354	2013-06-27 21:47:40.947354
4638	1089	Menu item was shown: bundle 1,2,3	2013-06-27 21:47:41.043472	2013-06-27 21:47:41.043472
4639	961	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:47:41.285952	2013-06-27 21:47:41.285952
4640	961	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:47:42.003753	2013-06-27 21:47:42.003753
4641	410	Good 1 was clicked. Value is now: false	2013-06-27 21:47:42.067885	2013-06-27 21:47:42.067885
4642	410	Good 2 was clicked. Value is now: false	2013-06-27 21:47:42.304775	2013-06-27 21:47:42.304775
4643	961	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:47:42.685079	2013-06-27 21:47:42.685079
4644	410	Good 3 was clicked. Value is now: false	2013-06-27 21:47:42.732702	2013-06-27 21:47:42.732702
4645	410	Good 4 was clicked. Value is now: false	2013-06-27 21:47:43.079831	2013-06-27 21:47:43.079831
4646	410	Good 5 was clicked. Value is now: false	2013-06-27 21:47:43.391697	2013-06-27 21:47:43.391697
4647	961	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:47:43.677469	2013-06-27 21:47:43.677469
4648	410	Combo was clicked. Value is now: true	2013-06-27 21:47:44.225789	2013-06-27 21:47:44.225789
4649	1097	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:47:44.712849	2013-06-27 21:47:44.712849
4650	1089	Menu item was shown: bundle 3,4	2013-06-27 21:47:45.720839	2013-06-27 21:47:45.720839
4651	942	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:47:45.786238	2013-06-27 21:47:45.786238
4652	733	Menu item was shown: bundle 3,4	2013-06-27 21:47:46.078692	2013-06-27 21:47:46.078692
4653	733	Menu item was shown: bundle 2,4	2013-06-27 21:47:46.492252	2013-06-27 21:47:46.492252
4654	733	Menu item was shown: bundle 2,3	2013-06-27 21:47:47.082094	2013-06-27 21:47:47.082094
4655	1097	Combo was clicked. Value is now: true	2013-06-27 21:47:47.246753	2013-06-27 21:47:47.246753
4656	733	Menu item was shown: bundle 1,4	2013-06-27 21:47:47.510064	2013-06-27 21:47:47.510064
4657	692	Menu item was shown: bundle 1,2,3	2013-06-27 21:47:48.231759	2013-06-27 21:47:48.231759
4658	1114	Menu item was shown: bundle 2,3	2013-06-27 21:47:48.624575	2013-06-27 21:47:48.624575
4659	1114	Menu item was shown: bundle 1,3	2013-06-27 21:47:49.155296	2013-06-27 21:47:49.155296
4660	1114	Menu item was shown: bundle 1,2	2013-06-27 21:47:49.397056	2013-06-27 21:47:49.397056
4661	1114	Menu item was shown: bundle 1,3	2013-06-27 21:47:49.781586	2013-06-27 21:47:49.781586
4662	1114	Menu item was shown: bundle 2,3	2013-06-27 21:47:50.266183	2013-06-27 21:47:50.266183
4663	1089	Menu item was shown: bundle 2,4	2013-06-27 21:47:50.331317	2013-06-27 21:47:50.331317
4664	733	Menu item was shown: bundle 1,2	2013-06-27 21:47:50.754561	2013-06-27 21:47:50.754561
4665	1114	Menu item was shown: bundle 1,2	2013-06-27 21:47:50.965787	2013-06-27 21:47:50.965787
4666	733	Menu item was shown: bundle 1,3	2013-06-27 21:47:51.211364	2013-06-27 21:47:51.211364
4667	1114	Menu item was shown: bundle 1,3	2013-06-27 21:47:52.071263	2013-06-27 21:47:52.071263
4668	1114	Menu item was shown: bundle 2,3	2013-06-27 21:47:52.439495	2013-06-27 21:47:52.439495
4669	961	Menu item was shown: bundle 2,3,4	2013-06-27 21:47:52.551229	2013-06-27 21:47:52.551229
4670	692	Menu item was shown: bundle 2,3	2013-06-27 21:47:52.909523	2013-06-27 21:47:52.909523
4671	942	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:47:53.538058	2013-06-27 21:47:53.538058
4672	692	Menu item was shown: bundle 1,3	2013-06-27 21:47:58.591457	2013-06-27 21:47:58.591457
4673	1089	Menu item was shown: bundle 1,3,4	2013-06-27 21:48:01.14486	2013-06-27 21:48:01.14486
4674	692	Menu item was shown: bundle 1,2	2013-06-27 21:48:01.499242	2013-06-27 21:48:01.499242
4675	1089	Menu item was shown: bundle 2,3,4	2013-06-27 21:48:02.722639	2013-06-27 21:48:02.722639
4676	692	Combo was clicked. Value is now: true	2013-06-27 21:48:04.397634	2013-06-27 21:48:04.397634
4677	1089	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:04.440492	2013-06-27 21:48:04.440492
4678	942	Good 2 was clicked. Value is now: false	2013-06-27 21:48:04.623899	2013-06-27 21:48:04.623899
4679	1089	Menu item was shown: bundle 3,4	2013-06-27 21:48:05.367496	2013-06-27 21:48:05.367496
4680	1089	Menu item was shown: bundle 2,4	2013-06-27 21:48:06.17326	2013-06-27 21:48:06.17326
4681	1010	Menu item was shown: bundle 1,2	2013-06-27 21:48:06.281699	2013-06-27 21:48:06.281699
4682	1010	Menu item was shown: bundle 1,3	2013-06-27 21:48:07.02254	2013-06-27 21:48:07.02254
4683	1010	Menu item was shown: bundle 2,3	2013-06-27 21:48:07.725795	2013-06-27 21:48:07.725795
4684	1010	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:08.463544	2013-06-27 21:48:08.463544
4685	942	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:48:09.898592	2013-06-27 21:48:09.898592
4686	1010	Good 1 was clicked. Value is now: true	2013-06-27 21:48:12.248591	2013-06-27 21:48:12.248591
4687	1010	Good 2 was clicked. Value is now: true	2013-06-27 21:48:12.535761	2013-06-27 21:48:12.535761
4688	1010	Good 3 was clicked. Value is now: true	2013-06-27 21:48:12.863269	2013-06-27 21:48:12.863269
4689	942	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:48:17.732297	2013-06-27 21:48:17.732297
4690	1089	Menu item was shown: bundle 2,3	2013-06-27 21:48:20.384515	2013-06-27 21:48:20.384515
4691	1089	Menu item was shown: bundle 1,2	2013-06-27 21:48:22.309143	2013-06-27 21:48:22.309143
4692	1089	Menu item was shown: bundle 1,3	2013-06-27 21:48:22.900177	2013-06-27 21:48:22.900177
4693	1089	Menu item was shown: bundle 1,4	2013-06-27 21:48:23.73867	2013-06-27 21:48:23.73867
4694	1089	Menu item was shown: bundle 2,3	2013-06-27 21:48:24.543791	2013-06-27 21:48:24.543791
4695	1089	Menu item was shown: bundle 2,4	2013-06-27 21:48:26.206239	2013-06-27 21:48:26.206239
4696	942	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:48:28.928267	2013-06-27 21:48:28.928267
4697	942	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:48:33.462582	2013-06-27 21:48:33.462582
4698	942	Menu item was shown: bundle 3,4,5	2013-06-27 21:48:37.714005	2013-06-27 21:48:37.714005
4699	970	Menu item was shown: bundle 1,2	2013-06-27 21:48:39.139342	2013-06-27 21:48:39.139342
4700	970	Menu item was shown: bundle 1,3	2013-06-27 21:48:39.956376	2013-06-27 21:48:39.956376
4701	970	Menu item was shown: bundle 2,3	2013-06-27 21:48:40.551874	2013-06-27 21:48:40.551874
4702	970	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:41.077965	2013-06-27 21:48:41.077965
4703	970	Menu item was shown: bundle 1,3	2013-06-27 21:48:41.97421	2013-06-27 21:48:41.97421
4704	289	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:42.132617	2013-06-27 21:48:42.132617
4705	942	Menu item was shown: bundle 2,4,5	2013-06-27 21:48:43.197528	2013-06-27 21:48:43.197528
4706	970	Good 1 was clicked. Value is now: true	2013-06-27 21:48:43.597125	2013-06-27 21:48:43.597125
4707	970	Good 3 was clicked. Value is now: true	2013-06-27 21:48:44.396196	2013-06-27 21:48:44.396196
4708	289	Combo was clicked. Value is now: true	2013-06-27 21:48:44.894932	2013-06-27 21:48:44.894932
4709	942	Menu item was shown: bundle 2,3,5	2013-06-27 21:48:45.317956	2013-06-27 21:48:45.317956
4710	942	Menu item was shown: bundle 2,3,4	2013-06-27 21:48:45.982057	2013-06-27 21:48:45.982057
4711	942	Menu item was shown: bundle 1,4,5	2013-06-27 21:48:46.589634	2013-06-27 21:48:46.589634
4712	289	Menu item was shown: bundle 2,3	2013-06-27 21:48:46.6942	2013-06-27 21:48:46.6942
4713	289	Menu item was shown: bundle 1,3	2013-06-27 21:48:48.09312	2013-06-27 21:48:48.09312
4714	970	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:50.449364	2013-06-27 21:48:50.449364
4715	970	Menu item was shown: bundle 1,3	2013-06-27 21:48:51.524923	2013-06-27 21:48:51.524923
4716	979	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:52.367972	2013-06-27 21:48:52.367972
4717	979	Menu item was shown: bundle 1,2,4	2013-06-27 21:48:53.924598	2013-06-27 21:48:53.924598
4718	289	Menu item was shown: bundle 1,2	2013-06-27 21:48:54.456491	2013-06-27 21:48:54.456491
4719	979	Menu item was shown: bundle 1,3,4	2013-06-27 21:48:55.721419	2013-06-27 21:48:55.721419
4720	289	Menu item was shown: bundle 1,3	2013-06-27 21:48:55.777595	2013-06-27 21:48:55.777595
4721	979	Menu item was shown: bundle 2,3,4	2013-06-27 21:48:55.94481	2013-06-27 21:48:55.94481
4722	289	Menu item was shown: bundle 1,2,3	2013-06-27 21:48:56.987759	2013-06-27 21:48:56.987759
4723	979	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:48:57.193183	2013-06-27 21:48:57.193183
4724	979	Menu item was shown: bundle 1,2	2013-06-27 21:48:59.338914	2013-06-27 21:48:59.338914
4725	942	Menu item was shown: bundle 1,3,5	2013-06-27 21:48:59.909186	2013-06-27 21:48:59.909186
4726	979	Menu item was shown: bundle 1,3	2013-06-27 21:49:00.658484	2013-06-27 21:49:00.658484
4727	979	Menu item was shown: bundle 1,4	2013-06-27 21:49:01.60673	2013-06-27 21:49:01.60673
4728	910	Combo was clicked. Value is now: true	2013-06-27 21:49:02.444273	2013-06-27 21:49:02.444273
4729	979	Menu item was shown: bundle 2,3	2013-06-27 21:49:02.707906	2013-06-27 21:49:02.707906
4730	979	Menu item was shown: bundle 2,4	2013-06-27 21:49:04.363849	2013-06-27 21:49:04.363849
4731	979	Menu item was shown: bundle 3,4	2013-06-27 21:49:05.539554	2013-06-27 21:49:05.539554
4732	910	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:49:06.131403	2013-06-27 21:49:06.131403
4733	979	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:06.496171	2013-06-27 21:49:06.496171
4734	979	Menu item was shown: bundle 1,2,4	2013-06-27 21:49:07.084819	2013-06-27 21:49:07.084819
4735	979	Good 1 was clicked. Value is now: true	2013-06-27 21:49:08.415738	2013-06-27 21:49:08.415738
4736	942	Menu item was shown: bundle 1,3,4	2013-06-27 21:49:08.627514	2013-06-27 21:49:08.627514
4737	910	Menu item was shown: bundle 1,2	2013-06-27 21:49:08.917294	2013-06-27 21:49:08.917294
4738	979	Menu item was shown: bundle 1,3,4	2013-06-27 21:49:09.179596	2013-06-27 21:49:09.179596
4739	979	Menu item was shown: bundle 2,3,4	2013-06-27 21:49:10.015326	2013-06-27 21:49:10.015326
4740	979	Menu item was shown: bundle 1,2,4	2013-06-27 21:49:10.436014	2013-06-27 21:49:10.436014
4741	979	Menu item was hidden: bundle 1,2,4	2013-06-27 21:49:11.962517	2013-06-27 21:49:11.962517
4742	979	Menu item was shown: bundle 1,2,4	2013-06-27 21:49:11.993079	2013-06-27 21:49:11.993079
4743	910	Menu item was shown: bundle 1,3	2013-06-27 21:49:12.019355	2013-06-27 21:49:12.019355
4744	979	Menu item was shown: bundle 1,3,4	2013-06-27 21:49:12.056366	2013-06-27 21:49:12.056366
4745	979	Menu item was shown: bundle 2,3,4	2013-06-27 21:49:12.319315	2013-06-27 21:49:12.319315
4746	910	Menu item was shown: bundle 1,4	2013-06-27 21:49:12.349868	2013-06-27 21:49:12.349868
4747	910	Menu item was shown: bundle 1,5	2013-06-27 21:49:13.317701	2013-06-27 21:49:13.317701
4748	979	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:49:13.868757	2013-06-27 21:49:13.868757
4749	910	Menu item was shown: bundle 2,3	2013-06-27 21:49:14.039282	2013-06-27 21:49:14.039282
4750	979	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:14.780101	2013-06-27 21:49:14.780101
4751	942	Good 5 was clicked. Value is now: false	2013-06-27 21:49:16.769194	2013-06-27 21:49:16.769194
4752	910	Menu item was shown: bundle 2,4	2013-06-27 21:49:24.080202	2013-06-27 21:49:24.080202
4753	910	Menu item was shown: bundle 2,5	2013-06-27 21:49:24.83855	2013-06-27 21:49:24.83855
4754	942	Menu item was shown: bundle 1,2,5	2013-06-27 21:49:25.439359	2013-06-27 21:49:25.439359
4755	910	Menu item was shown: bundle 3,4	2013-06-27 21:49:26.129562	2013-06-27 21:49:26.129562
4756	910	Menu item was shown: bundle 3,5	2013-06-27 21:49:26.991391	2013-06-27 21:49:26.991391
4757	942	Menu item was shown: bundle 1,2,4	2013-06-27 21:49:27.22017	2013-06-27 21:49:27.22017
4758	910	Menu item was shown: bundle 4,5	2013-06-27 21:49:33.144941	2013-06-27 21:49:33.144941
4759	405	Menu item was shown: bundle 1,2	2013-06-27 21:49:38.690416	2013-06-27 21:49:38.690416
4760	1043	Menu item was shown: bundle 1,2	2013-06-27 21:49:38.717651	2013-06-27 21:49:38.717651
4761	942	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:39.24137	2013-06-27 21:49:39.24137
4762	910	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:39.662515	2013-06-27 21:49:39.662515
4763	942	Menu item was shown: bundle 4,5	2013-06-27 21:49:40.232183	2013-06-27 21:49:40.232183
4764	1043	Good 1 was clicked. Value is now: true	2013-06-27 21:49:42.133262	2013-06-27 21:49:42.133262
4765	405	Menu item was shown: bundle 1,3	2013-06-27 21:49:42.400817	2013-06-27 21:49:42.400817
4766	1043	Good 2 was clicked. Value is now: true	2013-06-27 21:49:42.720394	2013-06-27 21:49:42.720394
4767	910	Menu item was shown: bundle 1,2,4	2013-06-27 21:49:44.241919	2013-06-27 21:49:44.241919
4768	942	Menu item was shown: bundle 3,5	2013-06-27 21:49:44.272019	2013-06-27 21:49:44.272019
4769	1043	Menu item was shown: bundle 1,3	2013-06-27 21:49:44.826315	2013-06-27 21:49:44.826315
4770	942	Menu item was shown: bundle 3,4	2013-06-27 21:49:45.184234	2013-06-27 21:49:45.184234
4771	1043	Menu item was shown: bundle 2,3	2013-06-27 21:49:45.736362	2013-06-27 21:49:45.736362
4772	405	Good 1 was clicked. Value is now: true	2013-06-27 21:49:46.235731	2013-06-27 21:49:46.235731
4773	942	Menu item was shown: bundle 3,5	2013-06-27 21:49:46.518582	2013-06-27 21:49:46.518582
4774	1043	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:46.919227	2013-06-27 21:49:46.919227
4775	405	Good 3 was clicked. Value is now: true	2013-06-27 21:49:46.996754	2013-06-27 21:49:46.996754
4776	942	Menu item was shown: bundle 3,4	2013-06-27 21:49:49.514738	2013-06-27 21:49:49.514738
4777	1043	Menu item was shown: bundle 1,2	2013-06-27 21:49:50.180088	2013-06-27 21:49:50.180088
4778	942	Menu item was shown: bundle 2,5	2013-06-27 21:49:50.234935	2013-06-27 21:49:50.234935
4779	405	Menu item was shown: bundle 2,3	2013-06-27 21:49:50.650767	2013-06-27 21:49:50.650767
4780	942	Menu item was shown: bundle 2,4	2013-06-27 21:49:50.985551	2013-06-27 21:49:50.985551
4781	942	Menu item was shown: bundle 2,3	2013-06-27 21:49:52.727272	2013-06-27 21:49:52.727272
4782	405	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:53.271076	2013-06-27 21:49:53.271076
4783	544	Menu item was shown: bundle 2,4	2013-06-27 21:49:53.419052	2013-06-27 21:49:53.419052
4784	1043	Menu item was shown: bundle 1,2,3	2013-06-27 21:49:54.924251	2013-06-27 21:49:54.924251
4785	942	Menu item was shown: bundle 1,5	2013-06-27 21:49:55.198768	2013-06-27 21:49:55.198768
4786	1131	Menu item was shown: bundle 3,4,5	2013-06-27 21:49:56.195972	2013-06-27 21:49:56.195972
4787	405	Combo was clicked. Value is now: true	2013-06-27 21:49:56.44104	2013-06-27 21:49:56.44104
4788	1131	Menu item was hidden: bundle 3,4,5	2013-06-27 21:49:57.049645	2013-06-27 21:49:57.049645
4789	910	Menu item was shown: bundle 1,2,5	2013-06-27 21:49:57.460667	2013-06-27 21:49:57.460667
4790	544	Good 2 was clicked. Value is now: true	2013-06-27 21:49:58.264143	2013-06-27 21:49:58.264143
4791	544	Good 4 was clicked. Value is now: true	2013-06-27 21:49:58.804477	2013-06-27 21:49:58.804477
4792	1043	Menu item was shown: bundle 1,2	2013-06-27 21:49:59.352015	2013-06-27 21:49:59.352015
4793	544	Menu item was shown: bundle 1,2	2013-06-27 21:49:59.531578	2013-06-27 21:49:59.531578
4794	1131	Combo was clicked. Value is now: true	2013-06-27 21:49:59.596087	2013-06-27 21:49:59.596087
4795	544	Menu item was shown: bundle 1,3	2013-06-27 21:50:00.1688	2013-06-27 21:50:00.1688
4796	942	Menu item was shown: bundle 1,4	2013-06-27 21:50:00.261343	2013-06-27 21:50:00.261343
4797	544	Menu item was shown: bundle 1,4	2013-06-27 21:50:00.577872	2013-06-27 21:50:00.577872
4798	544	Menu item was shown: bundle 1,3	2013-06-27 21:50:01.146005	2013-06-27 21:50:01.146005
4799	942	Menu item was shown: bundle 1,2	2013-06-27 21:50:02.145071	2013-06-27 21:50:02.145071
4800	942	Menu item was shown: bundle 1,3	2013-06-27 21:50:02.407835	2013-06-27 21:50:02.407835
4801	910	Menu item was shown: bundle 1,5	2013-06-27 21:50:02.714451	2013-06-27 21:50:02.714451
4802	910	Menu item was shown: bundle 1,2,5	2013-06-27 21:50:03.63269	2013-06-27 21:50:03.63269
4803	236	Menu item was shown: bundle 1,2	2013-06-27 21:50:04.501663	2013-06-27 21:50:04.501663
4804	544	Menu item was shown: bundle 1,4	2013-06-27 21:50:04.615434	2013-06-27 21:50:04.615434
4805	236	Menu item was shown: bundle 1,3	2013-06-27 21:50:05.617183	2013-06-27 21:50:05.617183
4806	236	Menu item was shown: bundle 2,3	2013-06-27 21:50:06.531427	2013-06-27 21:50:06.531427
4807	544	Menu item was shown: bundle 2,3	2013-06-27 21:50:07.467252	2013-06-27 21:50:07.467252
4808	236	Menu item was shown: bundle 1,2,3	2013-06-27 21:50:07.519172	2013-06-27 21:50:07.519172
4809	544	Menu item was shown: bundle 2,4	2013-06-27 21:50:08.139962	2013-06-27 21:50:08.139962
4810	544	Menu item was shown: bundle 3,4	2013-06-27 21:50:08.595159	2013-06-27 21:50:08.595159
4811	544	Menu item was shown: bundle 2,4	2013-06-27 21:50:09.108549	2013-06-27 21:50:09.108549
4812	236	Good 3 was clicked. Value is now: true	2013-06-27 21:50:10.654739	2013-06-27 21:50:10.654739
4813	910	Menu item was shown: bundle 1,3,4	2013-06-27 21:50:11.440734	2013-06-27 21:50:11.440734
4814	942	Menu item was shown: bundle 1,3	2013-06-27 21:50:11.508009	2013-06-27 21:50:11.508009
4815	942	Menu item was shown: bundle 1,4	2013-06-27 21:50:12.53341	2013-06-27 21:50:12.53341
4816	910	Menu item was shown: bundle 1,3,5	2013-06-27 21:50:12.665424	2013-06-27 21:50:12.665424
4817	910	Menu item was shown: bundle 1,4,5	2013-06-27 21:50:13.526853	2013-06-27 21:50:13.526853
4818	942	Menu item was shown: bundle 1,5	2013-06-27 21:50:13.946169	2013-06-27 21:50:13.946169
4819	942	Menu item was shown: bundle 2,3	2013-06-27 21:50:15.108296	2013-06-27 21:50:15.108296
4820	942	Menu item was shown: bundle 2,4	2013-06-27 21:50:16.647859	2013-06-27 21:50:16.647859
4821	942	Menu item was shown: bundle 2,5	2013-06-27 21:50:17.895149	2013-06-27 21:50:17.895149
4822	942	Menu item was shown: bundle 3,4	2013-06-27 21:50:19.128885	2013-06-27 21:50:19.128885
4823	942	Menu item was shown: bundle 3,5	2013-06-27 21:50:20.434524	2013-06-27 21:50:20.434524
4824	942	Menu item was shown: bundle 4,5	2013-06-27 21:50:21.908011	2013-06-27 21:50:21.908011
4825	942	Menu item was shown: bundle 1,2,3	2013-06-27 21:50:23.368088	2013-06-27 21:50:23.368088
4826	544	Menu item was shown: bundle 3,4	2013-06-27 21:50:23.570592	2013-06-27 21:50:23.570592
4827	910	Good 1 was clicked. Value is now: true	2013-06-27 21:50:23.739923	2013-06-27 21:50:23.739923
4828	910	Good 4 was clicked. Value is now: true	2013-06-27 21:50:24.389214	2013-06-27 21:50:24.389214
4829	544	Menu item was shown: bundle 1,2,3	2013-06-27 21:50:24.450465	2013-06-27 21:50:24.450465
4830	910	Good 5 was clicked. Value is now: true	2013-06-27 21:50:24.703636	2013-06-27 21:50:24.703636
4831	197	Menu item was shown: bundle 1,2,3	2013-06-27 21:50:25.019269	2013-06-27 21:50:25.019269
4832	942	Menu item was shown: bundle 1,2,4	2013-06-27 21:50:25.425618	2013-06-27 21:50:25.425618
4833	197	Menu item was hidden: bundle 1,2,3	2013-06-27 21:50:26.136127	2013-06-27 21:50:26.136127
4834	197	Menu item was shown: bundle 2,3	2013-06-27 21:50:26.581862	2013-06-27 21:50:26.581862
4835	1027	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:50:26.733615	2013-06-27 21:50:26.733615
4836	942	Menu item was shown: bundle 1,2,5	2013-06-27 21:50:27.258966	2013-06-27 21:50:27.258966
4837	197	Menu item was hidden: bundle 2,3	2013-06-27 21:50:27.422467	2013-06-27 21:50:27.422467
4838	197	Menu item was shown: bundle 1,3	2013-06-27 21:50:28.056288	2013-06-27 21:50:28.056288
4839	942	Menu item was shown: bundle 1,3,4	2013-06-27 21:50:29.381188	2013-06-27 21:50:29.381188
4840	910	Menu item was shown: bundle 2,3,4	2013-06-27 21:50:29.94316	2013-06-27 21:50:29.94316
4841	910	Menu item was shown: bundle 2,3,5	2013-06-27 21:50:30.623705	2013-06-27 21:50:30.623705
4842	942	Menu item was shown: bundle 1,3,5	2013-06-27 21:50:31.501226	2013-06-27 21:50:31.501226
4843	910	Menu item was shown: bundle 2,4,5	2013-06-27 21:50:31.72307	2013-06-27 21:50:31.72307
4844	1027	Combo was clicked. Value is now: true	2013-06-27 21:50:32.342199	2013-06-27 21:50:32.342199
4845	197	Menu item was hidden: bundle 1,3	2013-06-27 21:50:32.805152	2013-06-27 21:50:32.805152
4846	197	Menu item was shown: bundle 1,2	2013-06-27 21:50:33.282275	2013-06-27 21:50:33.282275
4847	942	Menu item was shown: bundle 1,4,5	2013-06-27 21:50:34.979522	2013-06-27 21:50:34.979522
4848	197	Menu item was hidden: bundle 1,2	2013-06-27 21:50:36.241095	2013-06-27 21:50:36.241095
4849	942	Menu item was shown: bundle 2,3,4	2013-06-27 21:50:36.661229	2013-06-27 21:50:36.661229
4850	197	Combo was clicked. Value is now: true	2013-06-27 21:50:37.523033	2013-06-27 21:50:37.523033
4851	942	Menu item was shown: bundle 2,3,5	2013-06-27 21:50:37.767901	2013-06-27 21:50:37.767901
4852	910	Menu item was shown: bundle 3,4,5	2013-06-27 21:50:38.581464	2013-06-27 21:50:38.581464
4853	942	Menu item was shown: bundle 2,4,5	2013-06-27 21:50:40.698418	2013-06-27 21:50:40.698418
4854	942	Menu item was shown: bundle 3,4,5	2013-06-27 21:50:41.992707	2013-06-27 21:50:41.992707
4855	1027	Menu item was shown: bundle 1,2	2013-06-27 21:50:42.147893	2013-06-27 21:50:42.147893
4856	942	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:50:44.351478	2013-06-27 21:50:44.351478
4857	544	Menu item was shown: bundle 2,4	2013-06-27 21:50:45.109591	2013-06-27 21:50:45.109591
4858	942	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:50:46.628887	2013-06-27 21:50:46.628887
4859	910	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:50:46.761415	2013-06-27 21:50:46.761415
4860	942	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:50:48.017404	2013-06-27 21:50:48.017404
4861	1027	Menu item was shown: bundle 1,3	2013-06-27 21:50:48.722536	2013-06-27 21:50:48.722536
4862	544	Menu item was shown: bundle 1,2,3	2013-06-27 21:50:49.713404	2013-06-27 21:50:49.713404
4863	942	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:50:49.841677	2013-06-27 21:50:49.841677
4864	942	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:50:51.708787	2013-06-27 21:50:51.708787
4865	1027	Menu item was shown: bundle 1,4	2013-06-27 21:50:51.829079	2013-06-27 21:50:51.829079
4866	942	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:50:53.061305	2013-06-27 21:50:53.061305
4867	544	Menu item was shown: bundle 1,2,4	2013-06-27 21:50:54.72519	2013-06-27 21:50:54.72519
4868	910	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:50:55.108247	2013-06-27 21:50:55.108247
4869	544	Menu item was shown: bundle 1,3,4	2013-06-27 21:50:55.546982	2013-06-27 21:50:55.546982
4870	1027	Menu item was shown: bundle 1,5	2013-06-27 21:50:56.205019	2013-06-27 21:50:56.205019
4871	942	Menu item was shown: bundle 1,3,4	2013-06-27 21:50:58.390683	2013-06-27 21:50:58.390683
4872	994	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:51:00.655147	2013-06-27 21:51:00.655147
4873	910	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:51:00.862764	2013-06-27 21:51:00.862764
4874	1027	Menu item was shown: bundle 2,3	2013-06-27 21:51:01.41335	2013-06-27 21:51:01.41335
4875	544	Menu item was shown: bundle 2,3,4	2013-06-27 21:51:01.562181	2013-06-27 21:51:01.562181
4876	910	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:51:01.89962	2013-06-27 21:51:01.89962
4877	544	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:51:02.529405	2013-06-27 21:51:02.529405
4878	994	Combo was clicked. Value is now: true	2013-06-27 21:51:03.143141	2013-06-27 21:51:03.143141
4879	994	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:51:05.183069	2013-06-27 21:51:05.183069
4880	1027	Menu item was shown: bundle 2,4	2013-06-27 21:51:05.217427	2013-06-27 21:51:05.217427
4881	231	Menu item was shown: bundle 1,2	2013-06-27 21:51:05.470177	2013-06-27 21:51:05.470177
4882	231	Menu item was hidden: bundle 1,2	2013-06-27 21:51:06.101886	2013-06-27 21:51:06.101886
4883	231	Menu item was shown: bundle 1,3	2013-06-27 21:51:06.824291	2013-06-27 21:51:06.824291
4884	231	Menu item was hidden: bundle 1,3	2013-06-27 21:51:09.687356	2013-06-27 21:51:09.687356
4885	544	Good 1 was clicked. Value is now: true	2013-06-27 21:51:11.252714	2013-06-27 21:51:11.252714
4886	910	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:51:12.093138	2013-06-27 21:51:12.093138
4887	544	Good 3 was clicked. Value is now: true	2013-06-27 21:51:12.473428	2013-06-27 21:51:12.473428
4888	231	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:51:12.639868	2013-06-27 21:51:12.639868
4889	1027	Menu item was shown: bundle 2,5	2013-06-27 21:51:12.768492	2013-06-27 21:51:12.768492
4890	994	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:51:15.600912	2013-06-27 21:51:15.600912
4891	955	Menu item was shown: bundle 1,2	2013-06-27 21:51:15.744439	2013-06-27 21:51:15.744439
4892	231	Menu item was hidden: bundle 1,2,3,4	2013-06-27 21:51:16.573289	2013-06-27 21:51:16.573289
4893	1027	Menu item was shown: bundle 3,4	2013-06-27 21:51:17.152565	2013-06-27 21:51:17.152565
4894	231	Menu item was shown: bundle 2,3,4	2013-06-27 21:51:17.503384	2013-06-27 21:51:17.503384
4895	955	Menu item was shown: bundle 1,4	2013-06-27 21:51:17.648736	2013-06-27 21:51:17.648736
4896	955	Menu item was shown: bundle 1,3	2013-06-27 21:51:18.125785	2013-06-27 21:51:18.125785
4897	1027	Menu item was shown: bundle 3,5	2013-06-27 21:51:19.271016	2013-06-27 21:51:19.271016
4898	231	Menu item was hidden: bundle 2,3,4	2013-06-27 21:51:19.381872	2013-06-27 21:51:19.381872
4899	231	Menu item was shown: bundle 1,3,4	2013-06-27 21:51:20.4038	2013-06-27 21:51:20.4038
4900	231	Menu item was shown: bundle 1,2,4	2013-06-27 21:51:21.973258	2013-06-27 21:51:21.973258
4901	955	Combo was clicked. Value is now: true	2013-06-27 21:51:22.530762	2013-06-27 21:51:22.530762
4902	1027	Menu item was shown: bundle 4,5	2013-06-27 21:51:22.776688	2013-06-27 21:51:22.776688
4903	994	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:51:23.297523	2013-06-27 21:51:23.297523
4904	910	Menu item was shown: bundle 1,4,5	2013-06-27 21:51:26.07393	2013-06-27 21:51:26.07393
4905	955	Menu item was shown: bundle 1,4	2013-06-27 21:51:26.206667	2013-06-27 21:51:26.206667
4906	231	Menu item was shown: bundle 1,2,3	2013-06-27 21:51:26.675006	2013-06-27 21:51:26.675006
4907	231	Menu item was shown: bundle 1,2,4	2013-06-27 21:51:28.941662	2013-06-27 21:51:28.941662
4908	1027	Menu item was shown: bundle 1,2,3	2013-06-27 21:51:28.983702	2013-06-27 21:51:28.983702
4909	955	Menu item was shown: bundle 1,5	2013-06-27 21:51:29.186991	2013-06-27 21:51:29.186991
4910	231	Menu item was shown: bundle 1,2,3	2013-06-27 21:51:29.727602	2013-06-27 21:51:29.727602
4911	955	Menu item was shown: bundle 2,3	2013-06-27 21:51:29.842732	2013-06-27 21:51:29.842732
4912	231	Menu item was shown: bundle 3,4	2013-06-27 21:51:30.422094	2013-06-27 21:51:30.422094
4913	955	Menu item was shown: bundle 2,4	2013-06-27 21:51:30.502185	2013-06-27 21:51:30.502185
4914	955	Menu item was shown: bundle 2,5	2013-06-27 21:51:31.021241	2013-06-27 21:51:31.021241
4915	231	Menu item was shown: bundle 2,4	2013-06-27 21:51:31.131609	2013-06-27 21:51:31.131609
4916	955	Menu item was shown: bundle 3,4	2013-06-27 21:51:34.224572	2013-06-27 21:51:34.224572
4917	231	Menu item was shown: bundle 2,3	2013-06-27 21:51:34.332933	2013-06-27 21:51:34.332933
4918	955	Menu item was shown: bundle 3,5	2013-06-27 21:51:34.914273	2013-06-27 21:51:34.914273
4919	231	Menu item was shown: bundle 1,4	2013-06-27 21:51:35.023672	2013-06-27 21:51:35.023672
4920	955	Menu item was shown: bundle 4,5	2013-06-27 21:51:35.547561	2013-06-27 21:51:35.547561
4921	231	Menu item was shown: bundle 1,3	2013-06-27 21:51:35.58586	2013-06-27 21:51:35.58586
4922	955	Menu item was shown: bundle 1,2,3	2013-06-27 21:51:36.258731	2013-06-27 21:51:36.258731
4923	231	Menu item was shown: bundle 1,2	2013-06-27 21:51:36.416041	2013-06-27 21:51:36.416041
4924	213	Good 3 was clicked. Value is now: true	2013-06-27 21:51:36.77835	2013-06-27 21:51:36.77835
4925	213	Good 4 was clicked. Value is now: true	2013-06-27 21:51:37.315582	2013-06-27 21:51:37.315582
4926	734	Menu item was shown: bundle 1,2	2013-06-27 21:51:37.611898	2013-06-27 21:51:37.611898
4927	231	Menu item was shown: bundle 1,3	2013-06-27 21:51:37.91889	2013-06-27 21:51:37.91889
4928	734	Menu item was hidden: bundle 1,2	2013-06-27 21:51:38.001979	2013-06-27 21:51:38.001979
4929	213	Menu item was shown: bundle 3,4	2013-06-27 21:51:38.036856	2013-06-27 21:51:38.036856
4930	213	Menu item was hidden: bundle 3,4	2013-06-27 21:51:38.497817	2013-06-27 21:51:38.497817
4931	734	Menu item was shown: bundle 1,3	2013-06-27 21:51:38.554599	2013-06-27 21:51:38.554599
4932	213	Good 4 was clicked. Value is now: false	2013-06-27 21:51:39.34746	2013-06-27 21:51:39.34746
4933	231	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:51:39.776321	2013-06-27 21:51:39.776321
4934	213	Menu item was shown: bundle 2,3,4	2013-06-27 21:51:41.918104	2013-06-27 21:51:41.918104
4935	734	Menu item was shown: bundle 1,4	2013-06-27 21:51:42.211571	2013-06-27 21:51:42.211571
4936	231	Good 1 was clicked. Value is now: true	2013-06-27 21:51:42.450095	2013-06-27 21:51:42.450095
4937	231	Good 2 was clicked. Value is now: true	2013-06-27 21:51:42.779319	2013-06-27 21:51:42.779319
4938	231	Good 3 was clicked. Value is now: true	2013-06-27 21:51:43.103177	2013-06-27 21:51:43.103177
4939	213	Menu item was hidden: bundle 2,3,4	2013-06-27 21:51:43.283248	2013-06-27 21:51:43.283248
4940	231	Good 4 was clicked. Value is now: true	2013-06-27 21:51:43.516725	2013-06-27 21:51:43.516725
4941	213	Good 2 was clicked. Value is now: true	2013-06-27 21:51:44.143355	2013-06-27 21:51:44.143355
4942	955	Menu item was shown: bundle 1,2,4	2013-06-27 21:51:44.824772	2013-06-27 21:51:44.824772
4943	213	Good 4 was clicked. Value is now: true	2013-06-27 21:51:44.924301	2013-06-27 21:51:44.924301
4944	955	Menu item was shown: bundle 1,2,5	2013-06-27 21:51:45.078485	2013-06-27 21:51:45.078485
4945	994	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:51:45.442975	2013-06-27 21:51:45.442975
4946	994	Menu item was hidden: bundle 1,3,4,5	2013-06-27 21:51:45.621325	2013-06-27 21:51:45.621325
4947	955	Menu item was shown: bundle 1,3,4	2013-06-27 21:51:45.678031	2013-06-27 21:51:45.678031
4948	994	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:51:46.127139	2013-06-27 21:51:46.127139
4949	213	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:51:47.064652	2013-06-27 21:51:47.064652
4950	994	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:51:47.92826	2013-06-27 21:51:47.92826
4951	213	Combo was clicked. Value is now: true	2013-06-27 21:51:48.676454	2013-06-27 21:51:48.676454
4952	734	Menu item was shown: bundle 1,5	2013-06-27 21:51:49.75247	2013-06-27 21:51:49.75247
4953	734	Menu item was hidden: bundle 1,5	2013-06-27 21:51:49.970134	2013-06-27 21:51:49.970134
4954	734	Menu item was shown: bundle 1,5	2013-06-27 21:51:50.551137	2013-06-27 21:51:50.551137
4955	955	Menu item was shown: bundle 1,3,5	2013-06-27 21:51:51.061039	2013-06-27 21:51:51.061039
4956	734	Menu item was shown: bundle 2,3	2013-06-27 21:51:53.391287	2013-06-27 21:51:53.391287
4957	213	Menu item was shown: bundle 1,2	2013-06-27 21:51:54.278422	2013-06-27 21:51:54.278422
4958	734	Menu item was shown: bundle 2,4	2013-06-27 21:51:56.617555	2013-06-27 21:51:56.617555
4959	955	Menu item was shown: bundle 1,4,5	2013-06-27 21:51:57.168533	2013-06-27 21:51:57.168533
4960	691	Menu item was shown: bundle 1,3	2013-06-27 21:51:57.376569	2013-06-27 21:51:57.376569
4961	734	Menu item was shown: bundle 2,5	2013-06-27 21:51:59.147379	2013-06-27 21:51:59.147379
4962	213	Menu item was shown: bundle 1,3	2013-06-27 21:51:59.417417	2013-06-27 21:51:59.417417
4963	691	Good 1 was clicked. Value is now: true	2013-06-27 21:51:59.997556	2013-06-27 21:51:59.997556
4964	213	Menu item was shown: bundle 1,4	2013-06-27 21:52:00.467641	2013-06-27 21:52:00.467641
4965	1027	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:52:00.499859	2013-06-27 21:52:00.499859
4966	691	Good 3 was clicked. Value is now: true	2013-06-27 21:52:00.586555	2013-06-27 21:52:00.586555
4967	213	Menu item was shown: bundle 2,3	2013-06-27 21:52:01.266968	2013-06-27 21:52:01.266968
4968	955	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:01.791528	2013-06-27 21:52:01.791528
4969	1027	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:52:02.021373	2013-06-27 21:52:02.021373
4970	213	Menu item was shown: bundle 2,4	2013-06-27 21:52:02.085232	2013-06-27 21:52:02.085232
4971	994	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:52:02.24324	2013-06-27 21:52:02.24324
4972	691	Menu item was shown: bundle 2,3	2013-06-27 21:52:03.093479	2013-06-27 21:52:03.093479
4973	213	Menu item was shown: bundle 3,4	2013-06-27 21:52:04.726163	2013-06-27 21:52:04.726163
4974	1110	Menu item was shown: bundle 1,2	2013-06-27 21:52:04.844608	2013-06-27 21:52:04.844608
4975	994	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:05.182606	2013-06-27 21:52:05.182606
4976	910	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:52:05.267926	2013-06-27 21:52:05.267926
4977	1110	Menu item was shown: bundle 1,3	2013-06-27 21:52:05.314075	2013-06-27 21:52:05.314075
4978	734	Good 2 was clicked. Value is now: true	2013-06-27 21:52:05.34704	2013-06-27 21:52:05.34704
4979	1110	Menu item was shown: bundle 1,4	2013-06-27 21:52:05.707685	2013-06-27 21:52:05.707685
4980	994	Menu item was shown: bundle 3,4,5	2013-06-27 21:52:06.049512	2013-06-27 21:52:06.049512
4981	1110	Menu item was shown: bundle 2,3	2013-06-27 21:52:06.202388	2013-06-27 21:52:06.202388
4982	955	Menu item was shown: bundle 2,3,5	2013-06-27 21:52:06.295796	2013-06-27 21:52:06.295796
4983	691	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:06.444288	2013-06-27 21:52:06.444288
4984	1110	Menu item was shown: bundle 2,4	2013-06-27 21:52:06.521103	2013-06-27 21:52:06.521103
4985	734	Good 5 was clicked. Value is now: true	2013-06-27 21:52:06.928225	2013-06-27 21:52:06.928225
4986	1110	Menu item was shown: bundle 3,4	2013-06-27 21:52:06.952625	2013-06-27 21:52:06.952625
4987	213	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:07.029432	2013-06-27 21:52:07.029432
4988	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:07.276279	2013-06-27 21:52:07.276279
4989	1110	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:07.754641	2013-06-27 21:52:07.754641
4990	1027	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:08.093766	2013-06-27 21:52:08.093766
4991	691	Menu item was shown: bundle 1,2	2013-06-27 21:52:08.273608	2013-06-27 21:52:08.273608
4992	1110	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:08.304553	2013-06-27 21:52:08.304553
4993	1110	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:08.814428	2013-06-27 21:52:08.814428
4994	1027	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:08.885277	2013-06-27 21:52:08.885277
4995	1110	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:09.16851	2013-06-27 21:52:09.16851
4996	994	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:52:09.531915	2013-06-27 21:52:09.531915
4997	1027	Menu item was shown: bundle 1,2,5	2013-06-27 21:52:09.786636	2013-06-27 21:52:09.786636
4998	1110	Menu item was shown: bundle 1,3	2013-06-27 21:52:09.978974	2013-06-27 21:52:09.978974
4999	1110	Menu item was shown: bundle 1,4	2013-06-27 21:52:10.837979	2013-06-27 21:52:10.837979
5000	955	Menu item was shown: bundle 2,4,5	2013-06-27 21:52:10.963047	2013-06-27 21:52:10.963047
5001	994	Menu item was shown: bundle 3,4,5	2013-06-27 21:52:11.006954	2013-06-27 21:52:11.006954
5002	213	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:11.041686	2013-06-27 21:52:11.041686
5003	994	Menu item was shown: bundle 2,4,5	2013-06-27 21:52:11.213518	2013-06-27 21:52:11.213518
5004	1027	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:11.836264	2013-06-27 21:52:11.836264
5005	1110	Menu item was shown: bundle 2,3	2013-06-27 21:52:12.10848	2013-06-27 21:52:12.10848
5006	1027	Menu item was shown: bundle 1,3,5	2013-06-27 21:52:12.736211	2013-06-27 21:52:12.736211
5007	1110	Menu item was shown: bundle 2,4	2013-06-27 21:52:12.824615	2013-06-27 21:52:12.824615
5008	213	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:12.894186	2013-06-27 21:52:12.894186
5009	994	Menu item was shown: bundle 2,3,5	2013-06-27 21:52:12.929355	2013-06-27 21:52:12.929355
5010	1110	Menu item was shown: bundle 1,3	2013-06-27 21:52:12.973703	2013-06-27 21:52:12.973703
5011	691	Menu item was shown: bundle 1,3	2013-06-27 21:52:13.037819	2013-06-27 21:52:13.037819
5012	1110	Menu item was shown: bundle 1,2	2013-06-27 21:52:13.643634	2013-06-27 21:52:13.643634
5013	213	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:13.725282	2013-06-27 21:52:13.725282
5014	213	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:14.58969	2013-06-27 21:52:14.58969
5015	213	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:15.316715	2013-06-27 21:52:15.316715
5016	734	Menu item was shown: bundle 3,4	2013-06-27 21:52:16.951389	2013-06-27 21:52:16.951389
5017	1094	Menu item was shown: bundle 1,2	2013-06-27 21:52:17.197886	2013-06-27 21:52:17.197886
5018	1110	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:17.478575	2013-06-27 21:52:17.478575
5019	955	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:17.877273	2013-06-27 21:52:17.877273
5020	994	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:18.8163	2013-06-27 21:52:18.8163
5021	1110	Menu item was shown: bundle 1,2	2013-06-27 21:52:19.906253	2013-06-27 21:52:19.906253
5022	1110	Menu item was shown: bundle 1,3	2013-06-27 21:52:20.511182	2013-06-27 21:52:20.511182
5023	941	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:20.547519	2013-06-27 21:52:20.547519
5024	1094	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:20.982119	2013-06-27 21:52:20.982119
5025	1027	Menu item was shown: bundle 1,4,5	2013-06-27 21:52:21.89883	2013-06-27 21:52:21.89883
5026	1094	Menu item was shown: bundle 2,3	2013-06-27 21:52:22.010561	2013-06-27 21:52:22.010561
5027	994	Menu item was shown: bundle 1,4,5	2013-06-27 21:52:22.42025	2013-06-27 21:52:22.42025
5028	734	Menu item was shown: bundle 3,5	2013-06-27 21:52:22.515122	2013-06-27 21:52:22.515122
5029	1094	Menu item was shown: bundle 1,3	2013-06-27 21:52:22.76481	2013-06-27 21:52:22.76481
5030	955	Menu item was shown: bundle 3,4,5	2013-06-27 21:52:22.896801	2013-06-27 21:52:22.896801
5031	1094	Menu item was shown: bundle 1,2	2013-06-27 21:52:23.457693	2013-06-27 21:52:23.457693
5032	941	Good 1 was clicked. Value is now: true	2013-06-27 21:52:23.647031	2013-06-27 21:52:23.647031
5033	1110	Menu item was shown: bundle 1,4	2013-06-27 21:52:23.833478	2013-06-27 21:52:23.833478
5034	941	Good 2 was clicked. Value is now: true	2013-06-27 21:52:24.052671	2013-06-27 21:52:24.052671
5035	941	Good 3 was clicked. Value is now: true	2013-06-27 21:52:24.381995	2013-06-27 21:52:24.381995
5036	955	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:52:24.453648	2013-06-27 21:52:24.453648
5037	941	Good 4 was clicked. Value is now: true	2013-06-27 21:52:24.808523	2013-06-27 21:52:24.808523
5038	1094	Good 1 was clicked. Value is now: true	2013-06-27 21:52:25.278196	2013-06-27 21:52:25.278196
5039	955	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:52:25.322127	2013-06-27 21:52:25.322127
5040	941	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:25.588109	2013-06-27 21:52:25.588109
5041	1094	Good 2 was clicked. Value is now: true	2013-06-27 21:52:25.627048	2013-06-27 21:52:25.627048
5042	734	Menu item was hidden: bundle 3,5	2013-06-27 21:52:25.871663	2013-06-27 21:52:25.871663
5043	910	Menu item was shown: bundle 1,4,5	2013-06-27 21:52:26.180207	2013-06-27 21:52:26.180207
5044	734	Menu item was shown: bundle 4,5	2013-06-27 21:52:26.43823	2013-06-27 21:52:26.43823
5045	955	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:52:26.731687	2013-06-27 21:52:26.731687
5046	1027	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:27.423499	2013-06-27 21:52:27.423499
5047	955	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:52:27.455952	2013-06-27 21:52:27.455952
5048	994	Menu item was shown: bundle 1,3,5	2013-06-27 21:52:27.546993	2013-06-27 21:52:27.546993
5049	1027	Menu item was shown: bundle 2,3,5	2013-06-27 21:52:28.089088	2013-06-27 21:52:28.089088
5050	1027	Menu item was shown: bundle 2,4,5	2013-06-27 21:52:28.631856	2013-06-27 21:52:28.631856
5051	734	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:29.044472	2013-06-27 21:52:29.044472
5052	1027	Menu item was shown: bundle 3,4,5	2013-06-27 21:52:29.430836	2013-06-27 21:52:29.430836
5053	1094	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:29.693128	2013-06-27 21:52:29.693128
5054	1110	Menu item was shown: bundle 2,3,4	2013-06-27 21:52:30.236087	2013-06-27 21:52:30.236087
5055	1094	Menu item was shown: bundle 2,3	2013-06-27 21:52:30.335679	2013-06-27 21:52:30.335679
5056	910	Menu item was shown: bundle 1,2	2013-06-27 21:52:30.433778	2013-06-27 21:52:30.433778
5057	1027	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:30.576058	2013-06-27 21:52:30.576058
5058	1094	Menu item was shown: bundle 1,3	2013-06-27 21:52:31.671267	2013-06-27 21:52:31.671267
5059	1110	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:32.309365	2013-06-27 21:52:32.309365
5060	1094	Menu item was shown: bundle 1,2	2013-06-27 21:52:34.031711	2013-06-27 21:52:34.031711
5061	734	Good 1 was clicked. Value is now: true	2013-06-27 21:52:34.796939	2013-06-27 21:52:34.796939
5062	941	Good 1 was clicked. Value is now: false	2013-06-27 21:52:35.066476	2013-06-27 21:52:35.066476
5063	734	Good 3 was clicked. Value is now: true	2013-06-27 21:52:35.172636	2013-06-27 21:52:35.172636
5064	734	Good 5 was clicked. Value is now: false	2013-06-27 21:52:35.707308	2013-06-27 21:52:35.707308
5065	955	Good 2 was clicked. Value is now: true	2013-06-27 21:52:35.931966	2013-06-27 21:52:35.931966
5066	941	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:52:36.131205	2013-06-27 21:52:36.131205
5067	955	Good 3 was clicked. Value is now: true	2013-06-27 21:52:36.285602	2013-06-27 21:52:36.285602
5068	910	Menu item was shown: bundle 1,3	2013-06-27 21:52:36.375094	2013-06-27 21:52:36.375094
5069	955	Good 4 was clicked. Value is now: true	2013-06-27 21:52:36.76711	2013-06-27 21:52:36.76711
5070	955	Good 5 was clicked. Value is now: true	2013-06-27 21:52:36.978442	2013-06-27 21:52:36.978442
5071	734	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:37.461782	2013-06-27 21:52:37.461782
5072	994	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:37.756653	2013-06-27 21:52:37.756653
5073	910	Menu item was shown: bundle 1,4	2013-06-27 21:52:38.05642	2013-06-27 21:52:38.05642
5074	955	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:52:38.313372	2013-06-27 21:52:38.313372
5075	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:39.34632	2013-06-27 21:52:39.34632
5076	994	Menu item was shown: bundle 1,2,5	2013-06-27 21:52:39.400931	2013-06-27 21:52:39.400931
5077	955	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:52:39.868779	2013-06-27 21:52:39.868779
5078	1027	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:52:39.972875	2013-06-27 21:52:39.972875
5079	910	Menu item was shown: bundle 1,5	2013-06-27 21:52:41.493248	2013-06-27 21:52:41.493248
5080	1088	Menu item was shown: bundle 2,3	2013-06-27 21:52:42.243491	2013-06-27 21:52:42.243491
5081	994	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:42.441169	2013-06-27 21:52:42.441169
5082	994	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:44.050562	2013-06-27 21:52:44.050562
5083	1088	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:44.346251	2013-06-27 21:52:44.346251
5084	994	Menu item was shown: bundle 4,5	2013-06-27 21:52:44.675466	2013-06-27 21:52:44.675466
5085	1088	Menu item was shown: bundle 2,3	2013-06-27 21:52:45.423047	2013-06-27 21:52:45.423047
5086	1088	Menu item was shown: bundle 1,3	2013-06-27 21:52:46.252781	2013-06-27 21:52:46.252781
5087	1027	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:52:48.01591	2013-06-27 21:52:48.01591
5088	994	Menu item was shown: bundle 3,5	2013-06-27 21:52:48.583195	2013-06-27 21:52:48.583195
5089	734	Menu item was shown: bundle 1,2,5	2013-06-27 21:52:48.842641	2013-06-27 21:52:48.842641
5090	910	Menu item was shown: bundle 2,3	2013-06-27 21:52:49.135761	2013-06-27 21:52:49.135761
5091	1088	Menu item was shown: bundle 1,2	2013-06-27 21:52:49.819695	2013-06-27 21:52:49.819695
5092	1027	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:52:50.024188	2013-06-27 21:52:50.024188
5093	1088	Menu item was shown: bundle 1,3	2013-06-27 21:52:51.536593	2013-06-27 21:52:51.536593
5094	1011	Menu item was shown: bundle 1,2	2013-06-27 21:52:52.054482	2013-06-27 21:52:52.054482
5095	994	Menu item was shown: bundle 3,4	2013-06-27 21:52:52.431562	2013-06-27 21:52:52.431562
5096	734	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:52.610879	2013-06-27 21:52:52.610879
5097	1011	Menu item was shown: bundle 1,3	2013-06-27 21:52:52.678784	2013-06-27 21:52:52.678784
5098	1088	Good 2 was clicked. Value is now: true	2013-06-27 21:52:53.387096	2013-06-27 21:52:53.387096
5099	1011	Menu item was shown: bundle 1,4	2013-06-27 21:52:53.42703	2013-06-27 21:52:53.42703
5100	1011	Menu item was shown: bundle 2,3	2013-06-27 21:52:54.074731	2013-06-27 21:52:54.074731
5101	1011	Menu item was shown: bundle 2,4	2013-06-27 21:52:54.739255	2013-06-27 21:52:54.739255
5102	994	Menu item was shown: bundle 2,5	2013-06-27 21:52:55.198441	2013-06-27 21:52:55.198441
5103	1011	Menu item was shown: bundle 3,4	2013-06-27 21:52:55.328216	2013-06-27 21:52:55.328216
5104	1088	Good 3 was clicked. Value is now: true	2013-06-27 21:52:55.364539	2013-06-27 21:52:55.364539
5105	1088	Menu item was shown: bundle 2,3	2013-06-27 21:52:56.514383	2013-06-27 21:52:56.514383
5106	1011	Menu item was shown: bundle 1,2,3	2013-06-27 21:52:56.763836	2013-06-27 21:52:56.763836
5107	1027	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:52:56.920051	2013-06-27 21:52:56.920051
5108	994	Menu item was shown: bundle 2,4	2013-06-27 21:52:57.083772	2013-06-27 21:52:57.083772
5109	1011	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:57.565099	2013-06-27 21:52:57.565099
5110	1011	Menu item was shown: bundle 1,3,4	2013-06-27 21:52:58.210301	2013-06-27 21:52:58.210301
5111	1011	Menu item was shown: bundle 1,2,4	2013-06-27 21:52:59.392451	2013-06-27 21:52:59.392451
5112	994	Menu item was shown: bundle 2,3	2013-06-27 21:52:59.88617	2013-06-27 21:52:59.88617
5113	1011	Menu item was shown: bundle 2,3,4	2013-06-27 21:53:00.536577	2013-06-27 21:53:00.536577
5114	994	Menu item was hidden: bundle 2,3	2013-06-27 21:53:00.817673	2013-06-27 21:53:00.817673
5115	994	Menu item was shown: bundle 1,5	2013-06-27 21:53:01.224488	2013-06-27 21:53:01.224488
5116	1011	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:53:01.344204	2013-06-27 21:53:01.344204
5117	910	Menu item was shown: bundle 2,4	2013-06-27 21:53:01.750244	2013-06-27 21:53:01.750244
5118	994	Menu item was shown: bundle 1,4	2013-06-27 21:53:02.122258	2013-06-27 21:53:02.122258
5119	994	Menu item was shown: bundle 1,3	2013-06-27 21:53:02.814329	2013-06-27 21:53:02.814329
5120	910	Menu item was shown: bundle 2,5	2013-06-27 21:53:04.299547	2013-06-27 21:53:04.299547
5121	1011	Good 1 was clicked. Value is now: true	2013-06-27 21:53:05.194817	2013-06-27 21:53:05.194817
5122	994	Menu item was shown: bundle 1,2	2013-06-27 21:53:05.272279	2013-06-27 21:53:05.272279
5123	1011	Good 2 was clicked. Value is now: true	2013-06-27 21:53:06.00373	2013-06-27 21:53:06.00373
5124	1011	Good 3 was clicked. Value is now: true	2013-06-27 21:53:06.361947	2013-06-27 21:53:06.361947
5125	1011	Good 4 was clicked. Value is now: true	2013-06-27 21:53:06.73889	2013-06-27 21:53:06.73889
5126	1110	Menu item was shown: bundle 1,2,3	2013-06-27 21:53:07.777711	2013-06-27 21:53:07.777711
5127	734	Menu item was shown: bundle 1,3,5	2013-06-27 21:53:08.570931	2013-06-27 21:53:08.570931
5128	734	Menu item was shown: bundle 1,4,5	2013-06-27 21:53:09.451199	2013-06-27 21:53:09.451199
5129	941	Menu item was shown: bundle 2,3,4	2013-06-27 21:53:10.484701	2013-06-27 21:53:10.484701
5130	910	Menu item was shown: bundle 3,4	2013-06-27 21:53:10.833495	2013-06-27 21:53:10.833495
5131	910	Menu item was shown: bundle 3,5	2013-06-27 21:53:13.511426	2013-06-27 21:53:13.511426
5132	1110	Menu item was shown: bundle 3,4	2013-06-27 21:53:14.609182	2013-06-27 21:53:14.609182
5133	734	Menu item was shown: bundle 2,3,4	2013-06-27 21:53:16.483242	2013-06-27 21:53:16.483242
5134	734	Menu item was shown: bundle 2,3,5	2013-06-27 21:53:17.33924	2013-06-27 21:53:17.33924
5135	734	Menu item was shown: bundle 2,4,5	2013-06-27 21:53:18.001835	2013-06-27 21:53:18.001835
5136	734	Menu item was shown: bundle 3,4,5	2013-06-27 21:53:18.626319	2013-06-27 21:53:18.626319
5137	910	Menu item was shown: bundle 4,5	2013-06-27 21:53:18.70444	2013-06-27 21:53:18.70444
5138	734	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:53:19.194677	2013-06-27 21:53:19.194677
5139	941	Menu item was shown: bundle 1,3,4	2013-06-27 21:53:20.397726	2013-06-27 21:53:20.397726
5140	1110	Menu item was shown: bundle 2,4	2013-06-27 21:53:20.600125	2013-06-27 21:53:20.600125
5141	734	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:53:20.627785	2013-06-27 21:53:20.627785
5142	910	Menu item was shown: bundle 1,2,3	2013-06-27 21:53:21.262097	2013-06-27 21:53:21.262097
5143	1110	Menu item was shown: bundle 2,3	2013-06-27 21:53:21.564334	2013-06-27 21:53:21.564334
5144	1110	Menu item was shown: bundle 1,4	2013-06-27 21:53:22.439078	2013-06-27 21:53:22.439078
5145	941	Menu item was shown: bundle 1,2,4	2013-06-27 21:53:24.295697	2013-06-27 21:53:24.295697
5146	1110	Menu item was shown: bundle 1,3	2013-06-27 21:53:26.015653	2013-06-27 21:53:26.015653
5147	910	Menu item was shown: bundle 1,2,4	2013-06-27 21:53:26.12825	2013-06-27 21:53:26.12825
5148	734	Good 5 was clicked. Value is now: true	2013-06-27 21:53:27.850118	2013-06-27 21:53:27.850118
5149	293	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:53:28.693792	2013-06-27 21:53:28.693792
5150	734	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:53:28.740176	2013-06-27 21:53:28.740176
5151	293	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:53:30.021734	2013-06-27 21:53:30.021734
5152	734	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:53:30.94612	2013-06-27 21:53:30.94612
5153	293	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:53:31.515019	2013-06-27 21:53:31.515019
5154	734	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:53:31.738594	2013-06-27 21:53:31.738594
5155	734	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:53:32.206329	2013-06-27 21:53:32.206329
5156	1110	Menu item was shown: bundle 1,2	2013-06-27 21:53:32.456994	2013-06-27 21:53:32.456994
5157	293	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:53:33.892828	2013-06-27 21:53:33.892828
5158	293	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:53:34.79459	2013-06-27 21:53:34.79459
5159	293	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:53:35.609833	2013-06-27 21:53:35.609833
5160	910	Menu item was shown: bundle 1,2,5	2013-06-27 21:53:35.753266	2013-06-27 21:53:35.753266
5161	293	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:53:36.674163	2013-06-27 21:53:36.674163
5162	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:53:36.925957	2013-06-27 21:53:36.925957
5163	293	Menu item was shown: bundle 3,4,5	2013-06-27 21:53:37.721934	2013-06-27 21:53:37.721934
5164	1110	Menu item was shown: bundle 1,2	2013-06-27 21:53:38.049579	2013-06-27 21:53:38.049579
5165	293	Menu item was shown: bundle 2,4,5	2013-06-27 21:53:38.532269	2013-06-27 21:53:38.532269
5166	293	Menu item was shown: bundle 2,3,5	2013-06-27 21:53:39.338637	2013-06-27 21:53:39.338637
5167	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:53:39.397879	2013-06-27 21:53:39.397879
5168	293	Menu item was shown: bundle 2,3,4	2013-06-27 21:53:40.172793	2013-06-27 21:53:40.172793
5169	910	Menu item was shown: bundle 1,3,4	2013-06-27 21:53:40.329352	2013-06-27 21:53:40.329352
5170	941	Menu item was shown: bundle 1,2,3	2013-06-27 21:53:40.409345	2013-06-27 21:53:40.409345
5171	941	Menu item was shown: bundle 3,4	2013-06-27 21:53:41.572055	2013-06-27 21:53:41.572055
5172	910	Menu item was shown: bundle 1,3,5	2013-06-27 21:53:41.661443	2013-06-27 21:53:41.661443
5173	941	Menu item was shown: bundle 2,4	2013-06-27 21:53:43.863677	2013-06-27 21:53:43.863677
5174	984	Menu item was shown: bundle 1,2	2013-06-27 21:53:43.895238	2013-06-27 21:53:43.895238
5175	910	Menu item was shown: bundle 1,4,5	2013-06-27 21:53:44.010261	2013-06-27 21:53:44.010261
5176	984	Menu item was shown: bundle 1,3	2013-06-27 21:53:44.629576	2013-06-27 21:53:44.629576
5177	984	Menu item was shown: bundle 2,3	2013-06-27 21:53:46.013396	2013-06-27 21:53:46.013396
5178	984	Menu item was shown: bundle 1,2,3	2013-06-27 21:53:46.830862	2013-06-27 21:53:46.830862
5179	964	Menu item was shown: bundle 1,2	2013-06-27 21:53:47.496299	2013-06-27 21:53:47.496299
5180	984	Menu item was shown: bundle 1,2	2013-06-27 21:53:47.855709	2013-06-27 21:53:47.855709
5181	1110	Good 1 was clicked. Value is now: true	2013-06-27 21:53:48.015188	2013-06-27 21:53:48.015188
5182	1110	Good 2 was clicked. Value is now: true	2013-06-27 21:53:48.371275	2013-06-27 21:53:48.371275
5183	941	Menu item was shown: bundle 2,3	2013-06-27 21:53:48.514792	2013-06-27 21:53:48.514792
5184	964	Menu item was hidden: bundle 1,2	2013-06-27 21:53:48.672159	2013-06-27 21:53:48.672159
5185	964	Menu item was shown: bundle 1,3	2013-06-27 21:53:48.971505	2013-06-27 21:53:48.971505
5186	984	Combo was clicked. Value is now: true	2013-06-27 21:53:49.010445	2013-06-27 21:53:49.010445
5187	1110	Good 4 was clicked. Value is now: true	2013-06-27 21:53:49.041777	2013-06-27 21:53:49.041777
5188	964	Menu item was hidden: bundle 1,3	2013-06-27 21:53:50.676885	2013-06-27 21:53:50.676885
5189	964	Menu item was shown: bundle 1,2,3	2013-06-27 21:53:51.204259	2013-06-27 21:53:51.204259
5190	964	Menu item was hidden: bundle 1,2,3	2013-06-27 21:53:51.66102	2013-06-27 21:53:51.66102
5191	293	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:53:52.079797	2013-06-27 21:53:52.079797
5192	964	Menu item was shown: bundle 2,3	2013-06-27 21:53:52.149678	2013-06-27 21:53:52.149678
5193	964	Menu item was hidden: bundle 2,3	2013-06-27 21:53:53.344558	2013-06-27 21:53:53.344558
5194	964	Menu item was shown: bundle 1,3	2013-06-27 21:53:54.039713	2013-06-27 21:53:54.039713
5195	941	Menu item was shown: bundle 1,4	2013-06-27 21:53:54.241483	2013-06-27 21:53:54.241483
5196	910	Menu item was shown: bundle 2,3,4	2013-06-27 21:53:55.647301	2013-06-27 21:53:55.647301
5197	964	Menu item was hidden: bundle 1,3	2013-06-27 21:53:55.699478	2013-06-27 21:53:55.699478
5198	964	Good 1 was clicked. Value is now: true	2013-06-27 21:53:56.915991	2013-06-27 21:53:56.915991
5199	964	Good 3 was clicked. Value is now: true	2013-06-27 21:53:57.632963	2013-06-27 21:53:57.632963
5200	293	Combo was clicked. Value is now: true	2013-06-27 21:53:58.176195	2013-06-27 21:53:58.176195
5201	941	Menu item was shown: bundle 1,3	2013-06-27 21:53:59.114015	2013-06-27 21:53:59.114015
5202	964	Menu item was shown: bundle 1,3	2013-06-27 21:53:59.699188	2013-06-27 21:53:59.699188
5203	964	Menu item was hidden: bundle 1,3	2013-06-27 21:54:00.128537	2013-06-27 21:54:00.128537
5204	293	Menu item was shown: bundle 2,3,5	2013-06-27 21:54:00.391697	2013-06-27 21:54:00.391697
5205	293	Menu item was shown: bundle 2,4,5	2013-06-27 21:54:01.703838	2013-06-27 21:54:01.703838
5206	293	Menu item was shown: bundle 2,3,4	2013-06-27 21:54:02.554511	2013-06-27 21:54:02.554511
5207	1110	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:54:03.056277	2013-06-27 21:54:03.056277
5208	1110	Menu item was shown: bundle 2,3,4	2013-06-27 21:54:04.558473	2013-06-27 21:54:04.558473
5209	941	Menu item was shown: bundle 1,2	2013-06-27 21:54:04.577765	2013-06-27 21:54:04.577765
5210	941	Menu item was shown: bundle 2,3,4	2013-06-27 21:54:08.716197	2013-06-27 21:54:08.716197
5211	1110	Menu item was shown: bundle 1,3,4	2013-06-27 21:54:11.274636	2013-06-27 21:54:11.274636
5212	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:54:12.241229	2013-06-27 21:54:12.241229
5213	293	Menu item was shown: bundle 1,4,5	2013-06-27 21:54:12.354302	2013-06-27 21:54:12.354302
5214	293	Menu item was shown: bundle 1,3,5	2013-06-27 21:54:13.346973	2013-06-27 21:54:13.346973
5215	941	Menu item was shown: bundle 1,2	2013-06-27 21:54:13.459414	2013-06-27 21:54:13.459414
5216	941	Menu item was shown: bundle 1,3	2013-06-27 21:54:14.309605	2013-06-27 21:54:14.309605
5217	941	Menu item was shown: bundle 1,4	2013-06-27 21:54:15.346964	2013-06-27 21:54:15.346964
5218	906	Combo was clicked. Value is now: true	2013-06-27 21:54:16.173855	2013-06-27 21:54:16.173855
5219	941	Menu item was shown: bundle 2,3	2013-06-27 21:54:16.966536	2013-06-27 21:54:16.966536
5220	906	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:17.616527	2013-06-27 21:54:17.616527
5221	941	Menu item was shown: bundle 2,4	2013-06-27 21:54:18.106642	2013-06-27 21:54:18.106642
5222	941	Menu item was shown: bundle 3,4	2013-06-27 21:54:19.390524	2013-06-27 21:54:19.390524
5223	941	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:20.529966	2013-06-27 21:54:20.529966
5224	941	Menu item was shown: bundle 1,2,4	2013-06-27 21:54:21.874608	2013-06-27 21:54:21.874608
5225	293	Good 1 was clicked. Value is now: true	2013-06-27 21:54:23.597551	2013-06-27 21:54:23.597551
5226	941	Menu item was shown: bundle 1,3,4	2013-06-27 21:54:23.90467	2013-06-27 21:54:23.90467
5227	293	Good 3 was clicked. Value is now: true	2013-06-27 21:54:24.167329	2013-06-27 21:54:24.167329
5228	293	Good 5 was clicked. Value is now: true	2013-06-27 21:54:24.900442	2013-06-27 21:54:24.900442
5229	906	Menu item was shown: bundle 1,3	2013-06-27 21:54:25.175912	2013-06-27 21:54:25.175912
5230	941	Menu item was shown: bundle 2,3,4	2013-06-27 21:54:25.801354	2013-06-27 21:54:25.801354
5231	906	Good 1 was clicked. Value is now: true	2013-06-27 21:54:26.769423	2013-06-27 21:54:26.769423
5232	906	Good 3 was clicked. Value is now: true	2013-06-27 21:54:27.121087	2013-06-27 21:54:27.121087
5233	293	Menu item was shown: bundle 1,3,4	2013-06-27 21:54:28.194251	2013-06-27 21:54:28.194251
5234	293	Menu item was shown: bundle 1,2,5	2013-06-27 21:54:29.82765	2013-06-27 21:54:29.82765
5235	941	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:54:31.123066	2013-06-27 21:54:31.123066
5236	906	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:35.127112	2013-06-27 21:54:35.127112
5237	293	Menu item was shown: bundle 1,2,4	2013-06-27 21:54:36.31885	2013-06-27 21:54:36.31885
5238	941	Combo was clicked. Value is now: true	2013-06-27 21:54:36.642628	2013-06-27 21:54:36.642628
5239	906	Menu item was shown: bundle 1,3	2013-06-27 21:54:37.310551	2013-06-27 21:54:37.310551
5240	1127	Menu item was shown: bundle 1,2	2013-06-27 21:54:37.576847	2013-06-27 21:54:37.576847
5241	1127	Menu item was hidden: bundle 1,2	2013-06-27 21:54:38.009482	2013-06-27 21:54:38.009482
5242	1127	Menu item was shown: bundle 1,3	2013-06-27 21:54:38.470621	2013-06-27 21:54:38.470621
5243	1127	Menu item was hidden: bundle 1,3	2013-06-27 21:54:38.861331	2013-06-27 21:54:38.861331
5244	941	Menu item was shown: bundle 1,2	2013-06-27 21:54:39.393845	2013-06-27 21:54:39.393845
5245	906	Menu item was shown: bundle 2,3	2013-06-27 21:54:39.673943	2013-06-27 21:54:39.673943
5246	293	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:40.039185	2013-06-27 21:54:40.039185
5247	1127	Menu item was shown: bundle 2,3	2013-06-27 21:54:40.248665	2013-06-27 21:54:40.248665
5248	407	Menu item was shown: bundle 1,2	2013-06-27 21:54:40.352608	2013-06-27 21:54:40.352608
5249	1051	Menu item was shown: bundle 1,2	2013-06-27 21:54:40.812376	2013-06-27 21:54:40.812376
5250	1127	Menu item was hidden: bundle 2,3	2013-06-27 21:54:40.881307	2013-06-27 21:54:40.881307
5251	941	Menu item was shown: bundle 1,3	2013-06-27 21:54:40.95207	2013-06-27 21:54:40.95207
5252	1127	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:41.424748	2013-06-27 21:54:41.424748
5253	1051	Menu item was shown: bundle 1,3	2013-06-27 21:54:41.884185	2013-06-27 21:54:41.884185
5254	1127	Menu item was hidden: bundle 1,2,3	2013-06-27 21:54:41.955812	2013-06-27 21:54:41.955812
5255	941	Menu item was shown: bundle 1,4	2013-06-27 21:54:42.205651	2013-06-27 21:54:42.205651
5256	536	Menu item was shown: bundle 2,3	2013-06-27 21:54:42.452951	2013-06-27 21:54:42.452951
5257	1127	Menu item was shown: bundle 1,3	2013-06-27 21:54:42.546695	2013-06-27 21:54:42.546695
5258	1127	Menu item was hidden: bundle 1,3	2013-06-27 21:54:43.112906	2013-06-27 21:54:43.112906
5259	941	Menu item was shown: bundle 2,3	2013-06-27 21:54:43.320615	2013-06-27 21:54:43.320615
5260	407	Good 1 was clicked. Value is now: true	2013-06-27 21:54:44.738406	2013-06-27 21:54:44.738406
5261	1127	Good 1 was clicked. Value is now: true	2013-06-27 21:54:44.761737	2013-06-27 21:54:44.761737
5262	941	Menu item was shown: bundle 2,4	2013-06-27 21:54:44.809195	2013-06-27 21:54:44.809195
5263	1051	Menu item was shown: bundle 1,4	2013-06-27 21:54:44.830054	2013-06-27 21:54:44.830054
5264	536	Good 2 was clicked. Value is now: true	2013-06-27 21:54:45.199799	2013-06-27 21:54:45.199799
5265	407	Good 2 was clicked. Value is now: true	2013-06-27 21:54:45.334404	2013-06-27 21:54:45.334404
5266	1127	Good 3 was clicked. Value is now: true	2013-06-27 21:54:45.467654	2013-06-27 21:54:45.467654
5267	536	Good 3 was clicked. Value is now: true	2013-06-27 21:54:45.54516	2013-06-27 21:54:45.54516
5268	536	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:46.601219	2013-06-27 21:54:46.601219
5269	407	Menu item was shown: bundle 1,3	2013-06-27 21:54:47.09694	2013-06-27 21:54:47.09694
5270	941	Menu item was shown: bundle 3,4	2013-06-27 21:54:47.769333	2013-06-27 21:54:47.769333
5271	941	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:48.686342	2013-06-27 21:54:48.686342
5272	906	Menu item was shown: bundle 1,3	2013-06-27 21:54:48.810806	2013-06-27 21:54:48.810806
5273	1051	Menu item was shown: bundle 2,3	2013-06-27 21:54:49.75449	2013-06-27 21:54:49.75449
5274	536	Good 1 was clicked. Value is now: true	2013-06-27 21:54:50.248821	2013-06-27 21:54:50.248821
5275	407	Good 2 was clicked. Value is now: false	2013-06-27 21:54:50.444165	2013-06-27 21:54:50.444165
5276	941	Menu item was shown: bundle 1,2,4	2013-06-27 21:54:50.784618	2013-06-27 21:54:50.784618
5277	407	Good 3 was clicked. Value is now: true	2013-06-27 21:54:50.810962	2013-06-27 21:54:50.810962
5278	536	Menu item was shown: bundle 1,3	2013-06-27 21:54:50.938086	2013-06-27 21:54:50.938086
5279	1051	Menu item was shown: bundle 2,4	2013-06-27 21:54:52.044026	2013-06-27 21:54:52.044026
5280	941	Menu item was shown: bundle 1,3,4	2013-06-27 21:54:52.752385	2013-06-27 21:54:52.752385
5281	906	Menu item was shown: bundle 2,3	2013-06-27 21:54:52.801625	2013-06-27 21:54:52.801625
5282	536	Menu item was shown: bundle 1,2	2013-06-27 21:54:53.575763	2013-06-27 21:54:53.575763
5283	407	Menu item was shown: bundle 1,4	2013-06-27 21:54:54.135327	2013-06-27 21:54:54.135327
5284	1051	Menu item was shown: bundle 3,4	2013-06-27 21:54:54.866095	2013-06-27 21:54:54.866095
5285	407	Menu item was shown: bundle 2,3	2013-06-27 21:54:55.112056	2013-06-27 21:54:55.112056
5286	208	Combo was clicked. Value is now: true	2013-06-27 21:54:55.353804	2013-06-27 21:54:55.353804
5287	1051	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:55.664947	2013-06-27 21:54:55.664947
5288	407	Menu item was shown: bundle 2,4	2013-06-27 21:54:55.823004	2013-06-27 21:54:55.823004
5289	941	Menu item was shown: bundle 2,3,4	2013-06-27 21:54:55.94656	2013-06-27 21:54:55.94656
5290	407	Menu item was shown: bundle 3,4	2013-06-27 21:54:56.811398	2013-06-27 21:54:56.811398
5291	941	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:54:57.587896	2013-06-27 21:54:57.587896
5292	407	Menu item was shown: bundle 1,2,3	2013-06-27 21:54:57.793481	2013-06-27 21:54:57.793481
5293	293	Menu item was shown: bundle 4,5	2013-06-27 21:54:58.417836	2013-06-27 21:54:58.417836
5294	407	Menu item was shown: bundle 1,2,4	2013-06-27 21:54:58.461633	2013-06-27 21:54:58.461633
5295	906	Menu item was shown: bundle 1,2	2013-06-27 21:54:58.945727	2013-06-27 21:54:58.945727
5296	293	Menu item was shown: bundle 3,5	2013-06-27 21:54:59.292386	2013-06-27 21:54:59.292386
5297	293	Menu item was shown: bundle 3,4	2013-06-27 21:54:59.949038	2013-06-27 21:54:59.949038
5298	293	Menu item was shown: bundle 2,5	2013-06-27 21:55:00.429615	2013-06-27 21:55:00.429615
5299	208	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:55:00.64539	2013-06-27 21:55:00.64539
5300	243	Menu item was shown: bundle 1,2	2013-06-27 21:55:01.217864	2013-06-27 21:55:01.217864
5301	208	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:55:02.071323	2013-06-27 21:55:02.071323
5302	243	Combo was clicked. Value is now: true	2013-06-27 21:55:02.383235	2013-06-27 21:55:02.383235
5303	243	Menu item was shown: bundle 1,3	2013-06-27 21:55:03.462876	2013-06-27 21:55:03.462876
5304	1051	Good 1 was clicked. Value is now: true	2013-06-27 21:55:03.499428	2013-06-27 21:55:03.499428
5305	407	Menu item was shown: bundle 1,3,4	2013-06-27 21:55:04.09382	2013-06-27 21:55:04.09382
5306	1051	Good 2 was clicked. Value is now: true	2013-06-27 21:55:04.255313	2013-06-27 21:55:04.255313
5307	243	Menu item was shown: bundle 2,3	2013-06-27 21:55:04.312695	2013-06-27 21:55:04.312695
5308	293	Menu item was shown: bundle 2,4	2013-06-27 21:55:04.570604	2013-06-27 21:55:04.570604
5309	1051	Good 3 was clicked. Value is now: true	2013-06-27 21:55:04.703623	2013-06-27 21:55:04.703623
5310	407	Menu item was shown: bundle 2,3,4	2013-06-27 21:55:04.953828	2013-06-27 21:55:04.953828
5311	243	Menu item was shown: bundle 1,2,3	2013-06-27 21:55:05.242553	2013-06-27 21:55:05.242553
5312	906	Good 2 was clicked. Value is now: true	2013-06-27 21:55:05.634046	2013-06-27 21:55:05.634046
5313	407	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:55:05.697849	2013-06-27 21:55:05.697849
5314	1051	Menu item was shown: bundle 1,2,4	2013-06-27 21:55:05.727689	2013-06-27 21:55:05.727689
5315	906	Good 3 was clicked. Value is now: false	2013-06-27 21:55:05.758284	2013-06-27 21:55:05.758284
5316	293	Menu item was shown: bundle 2,3	2013-06-27 21:55:06.660946	2013-06-27 21:55:06.660946
5317	243	Good 3 was clicked. Value is now: true	2013-06-27 21:55:07.167948	2013-06-27 21:55:07.167948
5318	293	Menu item was shown: bundle 1,5	2013-06-27 21:55:07.787744	2013-06-27 21:55:07.787744
5319	293	Menu item was shown: bundle 1,4	2013-06-27 21:55:08.45558	2013-06-27 21:55:08.45558
5320	407	Menu item was shown: bundle 1,3	2013-06-27 21:55:08.665754	2013-06-27 21:55:08.665754
5321	1051	Menu item was shown: bundle 1,3,4	2013-06-27 21:55:09.912341	2013-06-27 21:55:09.912341
5322	293	Menu item was shown: bundle 1,3	2013-06-27 21:55:11.120983	2013-06-27 21:55:11.120983
5323	243	Menu item was shown: bundle 2,3	2013-06-27 21:55:12.425345	2013-06-27 21:55:12.425345
5324	208	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:55:13.313496	2013-06-27 21:55:13.313496
5325	243	Menu item was shown: bundle 1,3	2013-06-27 21:55:13.769727	2013-06-27 21:55:13.769727
5326	293	Menu item was shown: bundle 1,2	2013-06-27 21:55:13.923178	2013-06-27 21:55:13.923178
5327	243	Menu item was shown: bundle 1,2	2013-06-27 21:55:14.684536	2013-06-27 21:55:14.684536
5328	293	Menu item was shown: bundle 1,3,5	2013-06-27 21:55:16.382766	2013-06-27 21:55:16.382766
5329	1025	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:55:17.962159	2013-06-27 21:55:17.962159
5330	906	Menu item was hidden: bundle 1,2	2013-06-27 21:55:18.906863	2013-06-27 21:55:18.906863
5331	208	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:55:18.92703	2013-06-27 21:55:18.92703
5332	1025	Menu item was shown: bundle 2,3,4	2013-06-27 21:55:20.288579	2013-06-27 21:55:20.288579
5333	1051	Menu item was shown: bundle 2,3,4	2013-06-27 21:55:23.485901	2013-06-27 21:55:23.485901
5334	1025	Menu item was shown: bundle 1,3,4	2013-06-27 21:55:26.37289	2013-06-27 21:55:26.37289
5335	906	Menu item was shown: bundle 1,2	2013-06-27 21:55:27.260484	2013-06-27 21:55:27.260484
5336	1051	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:55:29.277929	2013-06-27 21:55:29.277929
5337	293	Menu item was shown: bundle 1,2,3	2013-06-27 21:55:29.833067	2013-06-27 21:55:29.833067
5338	1025	Menu item was shown: bundle 1,2,4	2013-06-27 21:55:29.996327	2013-06-27 21:55:29.996327
5339	906	Menu item was shown: bundle 1,2,3	2013-06-27 21:55:32.313736	2013-06-27 21:55:32.313736
5340	1051	Menu item was shown: bundle 1,2,3	2013-06-27 21:55:33.331526	2013-06-27 21:55:33.331526
5341	906	Menu item was shown: bundle 1,2	2013-06-27 21:55:34.217517	2013-06-27 21:55:34.217517
5342	1025	Menu item was shown: bundle 1,2,3	2013-06-27 21:55:34.238761	2013-06-27 21:55:34.238761
5343	208	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:55:36.820152	2013-06-27 21:55:36.820152
5344	1025	Menu item was shown: bundle 3,4	2013-06-27 21:55:36.887051	2013-06-27 21:55:36.887051
5345	293	Menu item was shown: bundle 1,3,5	2013-06-27 21:55:38.649434	2013-06-27 21:55:38.649434
5346	208	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:55:38.891563	2013-06-27 21:55:38.891563
5347	906	Menu item was shown: bundle 1,3	2013-06-27 21:55:39.509694	2013-06-27 21:55:39.509694
5348	1025	Menu item was shown: bundle 2,4	2013-06-27 21:55:39.540445	2013-06-27 21:55:39.540445
5349	1025	Menu item was shown: bundle 2,3	2013-06-27 21:55:42.137681	2013-06-27 21:55:42.137681
5350	1025	Menu item was shown: bundle 1,4	2013-06-27 21:55:44.973647	2013-06-27 21:55:44.973647
5351	1025	Menu item was shown: bundle 1,3	2013-06-27 21:55:47.659726	2013-06-27 21:55:47.659726
5352	1025	Menu item was shown: bundle 1,2	2013-06-27 21:55:48.667675	2013-06-27 21:55:48.667675
5353	1025	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:55:49.730998	2013-06-27 21:55:49.730998
5354	1025	Combo was clicked. Value is now: true	2013-06-27 21:55:52.688074	2013-06-27 21:55:52.688074
5355	962	Menu item was shown: bundle 1,2	2013-06-27 21:55:53.276807	2013-06-27 21:55:53.276807
5356	962	Menu item was hidden: bundle 1,2	2013-06-27 21:55:55.047085	2013-06-27 21:55:55.047085
5357	906	Menu item was shown: bundle 2,3	2013-06-27 21:55:55.503734	2013-06-27 21:55:55.503734
5358	962	Combo was clicked. Value is now: true	2013-06-27 21:55:56.194668	2013-06-27 21:55:56.194668
5359	962	Menu item was shown: bundle 1,2	2013-06-27 21:55:57.819585	2013-06-27 21:55:57.819585
5360	208	Good 1 was clicked. Value is now: true	2013-06-27 21:55:57.969632	2013-06-27 21:55:57.969632
5361	208	Good 2 was clicked. Value is now: true	2013-06-27 21:55:58.573772	2013-06-27 21:55:58.573772
5362	208	Good 3 was clicked. Value is now: true	2013-06-27 21:55:59.135047	2013-06-27 21:55:59.135047
5363	208	Good 5 was clicked. Value is now: true	2013-06-27 21:55:59.694047	2013-06-27 21:55:59.694047
5364	208	Menu item was shown: bundle 1,3,5	2013-06-27 21:55:59.950503	2013-06-27 21:55:59.950503
5365	906	Menu item was shown: bundle 1,3	2013-06-27 21:56:00.077899	2013-06-27 21:56:00.077899
5366	962	Menu item was shown: bundle 1,3	2013-06-27 21:56:00.261279	2013-06-27 21:56:00.261279
5367	962	Menu item was shown: bundle 1,4	2013-06-27 21:56:01.209044	2013-06-27 21:56:01.209044
5368	208	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:56:03.574035	2013-06-27 21:56:03.574035
5369	906	Menu item was shown: bundle 2,3	2013-06-27 21:56:03.847072	2013-06-27 21:56:03.847072
5370	962	Menu item was shown: bundle 1,5	2013-06-27 21:56:04.367411	2013-06-27 21:56:04.367411
5371	228	Menu item was shown: bundle 2,3	2013-06-27 21:56:05.476258	2013-06-27 21:56:05.476258
5372	962	Menu item was shown: bundle 2,3	2013-06-27 21:56:06.935946	2013-06-27 21:56:06.935946
5373	906	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:07.168363	2013-06-27 21:56:07.168363
5374	962	Menu item was shown: bundle 2,4	2013-06-27 21:56:07.836798	2013-06-27 21:56:07.836798
5375	228	Menu item was hidden: bundle 2,3	2013-06-27 21:56:08.11324	2013-06-27 21:56:08.11324
5376	906	Menu item was shown: bundle 1,2	2013-06-27 21:56:08.39533	2013-06-27 21:56:08.39533
5377	695	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:56:08.643729	2013-06-27 21:56:08.643729
5378	962	Menu item was shown: bundle 1,5	2013-06-27 21:56:09.228413	2013-06-27 21:56:09.228413
5379	962	Menu item was shown: bundle 2,5	2013-06-27 21:56:10.076483	2013-06-27 21:56:10.076483
5380	962	Menu item was shown: bundle 3,4	2013-06-27 21:56:10.662979	2013-06-27 21:56:10.662979
5381	228	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:56:10.99817	2013-06-27 21:56:10.99817
5382	695	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 21:56:11.327453	2013-06-27 21:56:11.327453
5383	208	Menu item was shown: bundle 3,4,5	2013-06-27 21:56:12.894906	2013-06-27 21:56:12.894906
5384	208	Menu item was shown: bundle 2,4,5	2013-06-27 21:56:14.283871	2013-06-27 21:56:14.283871
5385	962	Menu item was shown: bundle 3,5	2013-06-27 21:56:16.362782	2013-06-27 21:56:16.362782
5386	208	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:56:17.166746	2013-06-27 21:56:17.166746
5387	962	Menu item was shown: bundle 4,5	2013-06-27 21:56:17.243253	2013-06-27 21:56:17.243253
5388	962	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:18.160322	2013-06-27 21:56:18.160322
5389	695	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:56:21.481118	2013-06-27 21:56:21.481118
5390	1110	Menu item was shown: bundle 1,2	2013-06-27 21:56:21.906394	2013-06-27 21:56:21.906394
5391	228	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:56:22.930466	2013-06-27 21:56:22.930466
5392	962	Menu item was shown: bundle 1,2,4	2013-06-27 21:56:23.048504	2013-06-27 21:56:23.048504
5393	208	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:56:24.168911	2013-06-27 21:56:24.168911
5394	695	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:56:25.534361	2013-06-27 21:56:25.534361
5395	1110	Menu item was shown: bundle 1,3	2013-06-27 21:56:25.951902	2013-06-27 21:56:25.951902
5396	695	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:56:26.799069	2013-06-27 21:56:26.799069
5397	1110	Menu item was shown: bundle 1,4	2013-06-27 21:56:27.386594	2013-06-27 21:56:27.386594
5398	228	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:56:27.424545	2013-06-27 21:56:27.424545
5399	997	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:27.507848	2013-06-27 21:56:27.507848
5400	1110	Menu item was shown: bundle 2,3	2013-06-27 21:56:27.772226	2013-06-27 21:56:27.772226
5401	695	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:56:27.916527	2013-06-27 21:56:27.916527
5402	1110	Menu item was shown: bundle 2,4	2013-06-27 21:56:27.995351	2013-06-27 21:56:27.995351
5403	997	Menu item was shown: bundle 2,3	2013-06-27 21:56:28.207435	2013-06-27 21:56:28.207435
5404	1110	Menu item was shown: bundle 3,4	2013-06-27 21:56:28.533139	2013-06-27 21:56:28.533139
5405	1110	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:28.61318	2013-06-27 21:56:28.61318
5406	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:56:29.169768	2013-06-27 21:56:29.169768
5407	1110	Menu item was shown: bundle 1,3,4	2013-06-27 21:56:29.400845	2013-06-27 21:56:29.400845
5408	997	Combo was clicked. Value is now: true	2013-06-27 21:56:29.457937	2013-06-27 21:56:29.457937
5409	1110	Menu item was shown: bundle 2,3,4	2013-06-27 21:56:29.665972	2013-06-27 21:56:29.665972
5410	1110	Menu item was hidden: bundle 2,3,4	2013-06-27 21:56:29.885641	2013-06-27 21:56:29.885641
5411	997	Menu item was hidden: bundle 2,3	2013-06-27 21:56:30.073839	2013-06-27 21:56:30.073839
5412	997	Menu item was shown: bundle 2,3	2013-06-27 21:56:30.927386	2013-06-27 21:56:30.927386
5413	1110	Menu item was shown: bundle 1,3	2013-06-27 21:56:31.294471	2013-06-27 21:56:31.294471
5414	214	Good 1 was clicked. Value is now: true	2013-06-27 21:56:31.502909	2013-06-27 21:56:31.502909
5415	997	Menu item was shown: bundle 1,3	2013-06-27 21:56:31.723055	2013-06-27 21:56:31.723055
5416	214	Good 3 was clicked. Value is now: true	2013-06-27 21:56:32.201216	2013-06-27 21:56:32.201216
5417	962	Menu item was shown: bundle 1,2,5	2013-06-27 21:56:32.294223	2013-06-27 21:56:32.294223
5418	1110	Menu item was shown: bundle 2,3	2013-06-27 21:56:33.931172	2013-06-27 21:56:33.931172
5419	962	Menu item was shown: bundle 1,3,4	2013-06-27 21:56:34.087672	2013-06-27 21:56:34.087672
5420	1110	Menu item was shown: bundle 2,4	2013-06-27 21:56:34.63767	2013-06-27 21:56:34.63767
5421	997	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:35.148027	2013-06-27 21:56:35.148027
5422	214	Menu item was shown: bundle 1,3,4	2013-06-27 21:56:36.150786	2013-06-27 21:56:36.150786
5423	997	Menu item was shown: bundle 1,3	2013-06-27 21:56:36.242913	2013-06-27 21:56:36.242913
5424	214	Menu item was hidden: bundle 1,3,4	2013-06-27 21:56:36.943988	2013-06-27 21:56:36.943988
5425	695	Good 1 was clicked. Value is now: true	2013-06-27 21:56:38.554517	2013-06-27 21:56:38.554517
5426	962	Menu item was shown: bundle 1,3,5	2013-06-27 21:56:38.724033	2013-06-27 21:56:38.724033
5427	695	Good 2 was clicked. Value is now: true	2013-06-27 21:56:38.902497	2013-06-27 21:56:38.902497
5428	962	Menu item was shown: bundle 1,4,5	2013-06-27 21:56:39.492555	2013-06-27 21:56:39.492555
5429	997	Menu item was shown: bundle 1,2	2013-06-27 21:56:39.57752	2013-06-27 21:56:39.57752
5430	962	Menu item was shown: bundle 2,3,4	2013-06-27 21:56:40.193881	2013-06-27 21:56:40.193881
5431	695	Good 3 was clicked. Value is now: true	2013-06-27 21:56:40.410101	2013-06-27 21:56:40.410101
5432	214	Menu item was shown: bundle 1,2	2013-06-27 21:56:40.983199	2013-06-27 21:56:40.983199
5433	695	Good 5 was clicked. Value is now: true	2013-06-27 21:56:41.121031	2013-06-27 21:56:41.121031
5434	962	Menu item was shown: bundle 2,3,5	2013-06-27 21:56:41.435859	2013-06-27 21:56:41.435859
5435	214	Good 3 was clicked. Value is now: false	2013-06-27 21:56:43.270647	2013-06-27 21:56:43.270647
5436	737	Menu item was shown: bundle 1,2	2013-06-27 21:56:43.548738	2013-06-27 21:56:43.548738
5437	214	Good 2 was clicked. Value is now: true	2013-06-27 21:56:43.66804	2013-06-27 21:56:43.66804
5438	1110	Menu item was shown: bundle 1,2,4	2013-06-27 21:56:45.287584	2013-06-27 21:56:45.287584
5439	695	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:56:45.873351	2013-06-27 21:56:45.873351
5440	228	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:56:46.052017	2013-06-27 21:56:46.052017
5441	214	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:56:46.736762	2013-06-27 21:56:46.736762
5442	997	Menu item was shown: bundle 1,3	2013-06-27 21:56:48.090659	2013-06-27 21:56:48.090659
5443	695	Menu item was shown: bundle 3,4,5	2013-06-27 21:56:48.464163	2013-06-27 21:56:48.464163
5444	737	Good 1 was clicked. Value is now: true	2013-06-27 21:56:48.634467	2013-06-27 21:56:48.634467
5445	737	Good 2 was clicked. Value is now: true	2013-06-27 21:56:48.814522	2013-06-27 21:56:48.814522
5446	737	Menu item was shown: bundle 1,2,3	2013-06-27 21:56:50.132281	2013-06-27 21:56:50.132281
5447	214	Combo was clicked. Value is now: true	2013-06-27 21:56:50.396375	2013-06-27 21:56:50.396375
5448	962	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:56:52.093591	2013-06-27 21:56:52.093591
5449	737	Good 3 was clicked. Value is now: true	2013-06-27 21:56:52.560576	2013-06-27 21:56:52.560576
5450	737	Menu item was shown: bundle 2,3	2013-06-27 21:56:53.301	2013-06-27 21:56:53.301
5451	962	Menu item was shown: bundle 3,4,5	2013-06-27 21:56:53.872319	2013-06-27 21:56:53.872319
5452	695	Menu item was shown: bundle 2,4,5	2013-06-27 21:56:55.724298	2013-06-27 21:56:55.724298
5453	228	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:56:56.30839	2013-06-27 21:56:56.30839
5454	214	Menu item was shown: bundle 1,2	2013-06-27 21:56:56.429846	2013-06-27 21:56:56.429846
5455	737	Menu item was shown: bundle 1,3	2013-06-27 21:56:58.014344	2013-06-27 21:56:58.014344
5456	214	Menu item was shown: bundle 1,3	2013-06-27 21:56:59.080214	2013-06-27 21:56:59.080214
5457	962	Menu item was shown: bundle 2,4,5	2013-06-27 21:56:59.634312	2013-06-27 21:56:59.634312
5458	997	Menu item was shown: bundle 1,2,3	2013-06-27 21:57:00.538634	2013-06-27 21:57:00.538634
5459	228	Good 1 was clicked. Value is now: true	2013-06-27 21:57:00.925194	2013-06-27 21:57:00.925194
5460	695	Menu item was shown: bundle 2,3,5	2013-06-27 21:57:01.03676	2013-06-27 21:57:01.03676
5461	997	Menu item was shown: bundle 2,3	2013-06-27 21:57:01.170469	2013-06-27 21:57:01.170469
5462	228	Good 2 was clicked. Value is now: true	2013-06-27 21:57:01.323445	2013-06-27 21:57:01.323445
5463	228	Good 3 was clicked. Value is now: true	2013-06-27 21:57:01.625367	2013-06-27 21:57:01.625367
5464	228	Good 4 was clicked. Value is now: true	2013-06-27 21:57:02.289354	2013-06-27 21:57:02.289354
5465	228	Good 5 was clicked. Value is now: true	2013-06-27 21:57:02.490931	2013-06-27 21:57:02.490931
5466	943	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:57:05.427748	2013-06-27 21:57:05.427748
5467	214	Menu item was shown: bundle 1,4	2013-06-27 21:57:05.747654	2013-06-27 21:57:05.747654
5468	214	Menu item was shown: bundle 1,5	2013-06-27 21:57:07.150941	2013-06-27 21:57:07.150941
5469	695	Menu item was shown: bundle 2,3,4	2013-06-27 21:57:07.651531	2013-06-27 21:57:07.651531
5470	1103	Combo was clicked. Value is now: true	2013-06-27 21:57:08.570785	2013-06-27 21:57:08.570785
5471	1103	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:57:09.725396	2013-06-27 21:57:09.725396
5472	943	Good 2 was clicked. Value is now: true	2013-06-27 21:57:09.902916	2013-06-27 21:57:09.902916
5473	962	Good 2 was clicked. Value is now: true	2013-06-27 21:57:10.069018	2013-06-27 21:57:10.069018
5474	943	Good 1 was clicked. Value is now: true	2013-06-27 21:57:10.132272	2013-06-27 21:57:10.132272
5475	943	Good 3 was clicked. Value is now: true	2013-06-27 21:57:10.278226	2013-06-27 21:57:10.278226
5476	962	Good 4 was clicked. Value is now: true	2013-06-27 21:57:10.725893	2013-06-27 21:57:10.725893
5477	943	Good 4 was clicked. Value is now: true	2013-06-27 21:57:10.981354	2013-06-27 21:57:10.981354
5478	943	Good 5 was clicked. Value is now: true	2013-06-27 21:57:11.326874	2013-06-27 21:57:11.326874
5479	962	Good 5 was clicked. Value is now: true	2013-06-27 21:57:11.415859	2013-06-27 21:57:11.415859
5480	962	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:57:13.00263	2013-06-27 21:57:13.00263
5481	695	Menu item was shown: bundle 1,4,5	2013-06-27 21:57:13.59668	2013-06-27 21:57:13.59668
5482	695	Menu item was shown: bundle 1,3,5	2013-06-27 21:57:14.310951	2013-06-27 21:57:14.310951
5483	962	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:57:14.40607	2013-06-27 21:57:14.40607
5484	214	Menu item was shown: bundle 2,3	2013-06-27 21:57:14.713265	2013-06-27 21:57:14.713265
5485	695	Menu item was shown: bundle 1,3,4	2013-06-27 21:57:15.008176	2013-06-27 21:57:15.008176
5486	695	Menu item was shown: bundle 1,2,5	2013-06-27 21:57:16.174086	2013-06-27 21:57:16.174086
5487	214	Menu item was shown: bundle 1,5	2013-06-27 21:57:16.290259	2013-06-27 21:57:16.290259
5488	962	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:57:16.321016	2013-06-27 21:57:16.321016
5489	943	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:57:16.36038	2013-06-27 21:57:16.36038
5490	962	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:57:18.454325	2013-06-27 21:57:18.454325
5491	962	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:57:19.385402	2013-06-27 21:57:19.385402
5492	943	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:57:19.417636	2013-06-27 21:57:19.417636
5493	214	Menu item was shown: bundle 2,3	2013-06-27 21:57:19.637421	2013-06-27 21:57:19.637421
5494	943	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:57:19.994243	2013-06-27 21:57:19.994243
5495	214	Menu item was shown: bundle 2,4	2013-06-27 21:57:20.07251	2013-06-27 21:57:20.07251
5496	962	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:57:20.211144	2013-06-27 21:57:20.211144
5497	214	Menu item was shown: bundle 2,5	2013-06-27 21:57:21.695286	2013-06-27 21:57:21.695286
5498	214	Menu item was shown: bundle 3,4	2013-06-27 21:57:22.136833	2013-06-27 21:57:22.136833
5499	695	Menu item was shown: bundle 1,2,4	2013-06-27 21:57:22.250587	2013-06-27 21:57:22.250587
5500	962	Menu item was shown: bundle 2,3,4	2013-06-27 21:57:22.660821	2013-06-27 21:57:22.660821
5501	962	Menu item was shown: bundle 1,4,5	2013-06-27 21:57:22.704049	2013-06-27 21:57:22.704049
5502	214	Menu item was shown: bundle 3,5	2013-06-27 21:57:22.944779	2013-06-27 21:57:22.944779
5503	695	Menu item was shown: bundle 1,2,3	2013-06-27 21:57:23.105044	2013-06-27 21:57:23.105044
5504	962	Menu item was shown: bundle 2,3,5	2013-06-27 21:57:23.142678	2013-06-27 21:57:23.142678
5505	962	Menu item was shown: bundle 2,4,5	2013-06-27 21:57:23.523034	2013-06-27 21:57:23.523034
5506	695	Menu item was shown: bundle 4,5	2013-06-27 21:57:23.560075	2013-06-27 21:57:23.560075
5507	214	Menu item was shown: bundle 4,5	2013-06-27 21:57:23.701962	2013-06-27 21:57:23.701962
5508	695	Menu item was shown: bundle 3,5	2013-06-27 21:57:24.132327	2013-06-27 21:57:24.132327
5509	943	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:57:25.345035	2013-06-27 21:57:25.345035
5510	695	Menu item was shown: bundle 3,4	2013-06-27 21:57:25.651817	2013-06-27 21:57:25.651817
5511	214	Menu item was shown: bundle 1,2,3	2013-06-27 21:57:26.909636	2013-06-27 21:57:26.909636
5512	214	Menu item was shown: bundle 1,2,4	2013-06-27 21:57:33.730063	2013-06-27 21:57:33.730063
5513	943	Menu item was shown: bundle 1,2	2013-06-27 21:57:34.321067	2013-06-27 21:57:34.321067
5514	943	Menu item was shown: bundle 1,3	2013-06-27 21:57:37.208465	2013-06-27 21:57:37.208465
5515	214	Menu item was shown: bundle 1,2,5	2013-06-27 21:57:37.919506	2013-06-27 21:57:37.919506
5516	214	Menu item was shown: bundle 1,3,4	2013-06-27 21:57:38.952072	2013-06-27 21:57:38.952072
5517	214	Menu item was shown: bundle 1,3,5	2013-06-27 21:57:39.568197	2013-06-27 21:57:39.568197
5518	1007	Menu item was shown: bundle 1,2	2013-06-27 21:57:39.770011	2013-06-27 21:57:39.770011
5519	214	Menu item was shown: bundle 1,4,5	2013-06-27 21:57:40.233589	2013-06-27 21:57:40.233589
5520	1007	Menu item was shown: bundle 1,3	2013-06-27 21:57:40.535957	2013-06-27 21:57:40.535957
5521	1007	Menu item was shown: bundle 1,4	2013-06-27 21:57:41.831213	2013-06-27 21:57:41.831213
5522	1007	Menu item was shown: bundle 1,5	2013-06-27 21:57:42.541497	2013-06-27 21:57:42.541497
5523	1007	Menu item was shown: bundle 2,3	2013-06-27 21:57:43.004698	2013-06-27 21:57:43.004698
5524	1007	Menu item was shown: bundle 2,4	2013-06-27 21:57:43.520489	2013-06-27 21:57:43.520489
5525	1007	Menu item was shown: bundle 2,5	2013-06-27 21:57:44.174487	2013-06-27 21:57:44.174487
5526	1007	Menu item was shown: bundle 3,4	2013-06-27 21:57:44.737672	2013-06-27 21:57:44.737672
5527	1007	Menu item was shown: bundle 3,5	2013-06-27 21:57:45.194171	2013-06-27 21:57:45.194171
5528	214	Menu item was shown: bundle 2,3,4	2013-06-27 21:57:45.657187	2013-06-27 21:57:45.657187
5529	214	Menu item was shown: bundle 2,3,5	2013-06-27 21:57:46.592956	2013-06-27 21:57:46.592956
5530	943	Menu item was shown: bundle 1,2	2013-06-27 21:57:46.864273	2013-06-27 21:57:46.864273
5531	214	Menu item was shown: bundle 2,4,5	2013-06-27 21:57:47.174742	2013-06-27 21:57:47.174742
5532	943	Menu item was shown: bundle 1,3	2013-06-27 21:57:47.3161	2013-06-27 21:57:47.3161
5533	943	Menu item was shown: bundle 1,4	2013-06-27 21:57:48.30075	2013-06-27 21:57:48.30075
5534	1007	Menu item was shown: bundle 4,5	2013-06-27 21:57:48.347715	2013-06-27 21:57:48.347715
5535	1007	Menu item was shown: bundle 1,2,3	2013-06-27 21:57:49.132053	2013-06-27 21:57:49.132053
5536	1007	Menu item was shown: bundle 1,2,4	2013-06-27 21:57:49.817694	2013-06-27 21:57:49.817694
5537	1007	Menu item was shown: bundle 1,2,5	2013-06-27 21:57:50.323329	2013-06-27 21:57:50.323329
5538	943	Menu item was shown: bundle 1,5	2013-06-27 21:57:50.92422	2013-06-27 21:57:50.92422
5539	214	Menu item was shown: bundle 3,4,5	2013-06-27 21:57:51.450917	2013-06-27 21:57:51.450917
5540	214	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:57:52.112159	2013-06-27 21:57:52.112159
5541	1115	Menu item was shown: bundle 1,2	2013-06-27 21:57:52.678056	2013-06-27 21:57:52.678056
5542	214	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:57:53.126503	2013-06-27 21:57:53.126503
5543	214	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:57:53.664839	2013-06-27 21:57:53.664839
5544	1007	Menu item was shown: bundle 1,3,4	2013-06-27 21:57:53.841756	2013-06-27 21:57:53.841756
5545	943	Menu item was shown: bundle 2,3	2013-06-27 21:57:53.942773	2013-06-27 21:57:53.942773
5546	1007	Menu item was shown: bundle 1,3,5	2013-06-27 21:57:54.362214	2013-06-27 21:57:54.362214
5547	214	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:57:54.467584	2013-06-27 21:57:54.467584
5548	1007	Menu item was shown: bundle 1,4,5	2013-06-27 21:57:55.015965	2013-06-27 21:57:55.015965
5549	1007	Menu item was shown: bundle 2,3,4	2013-06-27 21:57:55.501659	2013-06-27 21:57:55.501659
5550	214	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:57:55.653034	2013-06-27 21:57:55.653034
5551	943	Menu item was shown: bundle 2,4	2013-06-27 21:57:55.769873	2013-06-27 21:57:55.769873
5552	1007	Menu item was shown: bundle 2,3,5	2013-06-27 21:57:56.125017	2013-06-27 21:57:56.125017
5553	214	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:57:56.440799	2013-06-27 21:57:56.440799
5554	943	Menu item was shown: bundle 2,5	2013-06-27 21:57:58.216093	2013-06-27 21:57:58.216093
5555	1115	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:57:58.701168	2013-06-27 21:57:58.701168
5556	943	Menu item was shown: bundle 3,4	2013-06-27 21:57:58.866537	2013-06-27 21:57:58.866537
5557	943	Menu item was shown: bundle 3,5	2013-06-27 21:58:00.059213	2013-06-27 21:58:00.059213
5558	1115	Menu item was shown: bundle 1,3	2013-06-27 21:58:00.831913	2013-06-27 21:58:00.831913
5559	1115	Menu item was shown: bundle 1,4	2013-06-27 21:58:01.722756	2013-06-27 21:58:01.722756
5560	1115	Menu item was shown: bundle 2,3	2013-06-27 21:58:02.149274	2013-06-27 21:58:02.149274
5561	943	Menu item was shown: bundle 4,5	2013-06-27 21:58:02.328998	2013-06-27 21:58:02.328998
5562	1115	Menu item was shown: bundle 2,4	2013-06-27 21:58:02.576545	2013-06-27 21:58:02.576545
5563	1115	Menu item was shown: bundle 3,4	2013-06-27 21:58:03.063522	2013-06-27 21:58:03.063522
5564	943	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:04.918052	2013-06-27 21:58:04.918052
5565	1115	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:07.119025	2013-06-27 21:58:07.119025
5566	1085	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:07.27807	2013-06-27 21:58:07.27807
5567	943	Menu item was shown: bundle 1,2,4	2013-06-27 21:58:07.431488	2013-06-27 21:58:07.431488
5568	943	Menu item was shown: bundle 1,2,5	2013-06-27 21:58:08.75715	2013-06-27 21:58:08.75715
5569	288	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:11.001395	2013-06-27 21:58:11.001395
5570	1007	Menu item was shown: bundle 1,2,5	2013-06-27 21:58:11.339779	2013-06-27 21:58:11.339779
5571	943	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:11.720241	2013-06-27 21:58:11.720241
5572	1115	Menu item was shown: bundle 1,2,4	2013-06-27 21:58:12.638814	2013-06-27 21:58:12.638814
5573	1007	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:13.031009	2013-06-27 21:58:13.031009
5574	943	Menu item was shown: bundle 1,3,5	2013-06-27 21:58:13.446497	2013-06-27 21:58:13.446497
5575	288	Menu item was shown: bundle 2,3	2013-06-27 21:58:13.727472	2013-06-27 21:58:13.727472
5576	1007	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:58:13.828752	2013-06-27 21:58:13.828752
5577	1007	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:58:14.400144	2013-06-27 21:58:14.400144
5578	1007	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:14.784864	2013-06-27 21:58:14.784864
5579	943	Menu item was shown: bundle 1,4,5	2013-06-27 21:58:14.961156	2013-06-27 21:58:14.961156
5580	288	Menu item was shown: bundle 1,3	2013-06-27 21:58:15.025135	2013-06-27 21:58:15.025135
5581	1085	Good 1 was clicked. Value is now: true	2013-06-27 21:58:15.584714	2013-06-27 21:58:15.584714
5582	1007	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:15.940129	2013-06-27 21:58:15.940129
5583	1085	Good 2 was clicked. Value is now: true	2013-06-27 21:58:16.440966	2013-06-27 21:58:16.440966
5584	943	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:16.50167	2013-06-27 21:58:16.50167
5585	1007	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:16.611135	2013-06-27 21:58:16.611135
5586	1085	Good 3 was clicked. Value is now: true	2013-06-27 21:58:16.87021	2013-06-27 21:58:16.87021
5587	1085	Good 4 was clicked. Value is now: true	2013-06-27 21:58:17.278954	2013-06-27 21:58:17.278954
5588	1085	Good 5 was clicked. Value is now: true	2013-06-27 21:58:17.711958	2013-06-27 21:58:17.711958
5589	943	Menu item was shown: bundle 2,3,5	2013-06-27 21:58:18.083512	2013-06-27 21:58:18.083512
5590	1115	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:18.938364	2013-06-27 21:58:18.938364
5591	288	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:19.422315	2013-06-27 21:58:19.422315
5592	1115	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:19.717936	2013-06-27 21:58:19.717936
5593	1007	Menu item was shown: bundle 1,2,5	2013-06-27 21:58:19.880496	2013-06-27 21:58:19.880496
5594	1085	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:21.289083	2013-06-27 21:58:21.289083
5595	943	Menu item was shown: bundle 2,4,5	2013-06-27 21:58:22.440868	2013-06-27 21:58:22.440868
5596	288	Menu item was shown: bundle 1,3	2013-06-27 21:58:23.101959	2013-06-27 21:58:23.101959
5597	943	Menu item was shown: bundle 3,4,5	2013-06-27 21:58:24.232094	2013-06-27 21:58:24.232094
5598	288	Menu item was shown: bundle 1,2	2013-06-27 21:58:25.347653	2013-06-27 21:58:25.347653
5599	1007	Good 1 was clicked. Value is now: true	2013-06-27 21:58:27.899201	2013-06-27 21:58:27.899201
5600	1007	Good 2 was clicked. Value is now: true	2013-06-27 21:58:28.453003	2013-06-27 21:58:28.453003
5601	1007	Good 5 was clicked. Value is now: true	2013-06-27 21:58:29.250179	2013-06-27 21:58:29.250179
5602	288	Good 1 was clicked. Value is now: true	2013-06-27 21:58:29.277533	2013-06-27 21:58:29.277533
5603	1085	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:29.334298	2013-06-27 21:58:29.334298
5604	288	Good 2 was clicked. Value is now: true	2013-06-27 21:58:29.781232	2013-06-27 21:58:29.781232
5605	943	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:30.185624	2013-06-27 21:58:30.185624
5606	1085	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:58:30.836791	2013-06-27 21:58:30.836791
5607	288	Menu item was shown: bundle 1,3	2013-06-27 21:58:31.104195	2013-06-27 21:58:31.104195
5608	1085	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:58:31.948172	2013-06-27 21:58:31.948172
5609	288	Menu item was shown: bundle 1,2	2013-06-27 21:58:32.231094	2013-06-27 21:58:32.231094
5610	1115	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:32.673149	2013-06-27 21:58:32.673149
5611	943	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:58:33.075351	2013-06-27 21:58:33.075351
5612	1085	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:33.205147	2013-06-27 21:58:33.205147
5613	1115	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:34.350929	2013-06-27 21:58:34.350929
5614	288	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:34.689708	2013-06-27 21:58:34.689708
5615	1115	Menu item was shown: bundle 1,2,4	2013-06-27 21:58:35.172275	2013-06-27 21:58:35.172275
5616	943	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:58:35.443473	2013-06-27 21:58:35.443473
5617	288	Menu item was shown: bundle 1,2	2013-06-27 21:58:36.570947	2013-06-27 21:58:36.570947
5618	1115	Good 1 was clicked. Value is now: true	2013-06-27 21:58:38.686684	2013-06-27 21:58:38.686684
5619	1115	Good 2 was clicked. Value is now: true	2013-06-27 21:58:39.084207	2013-06-27 21:58:39.084207
5620	1115	Good 4 was clicked. Value is now: true	2013-06-27 21:58:39.75565	2013-06-27 21:58:39.75565
5621	988	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:42.059449	2013-06-27 21:58:42.059449
5622	988	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:43.344496	2013-06-27 21:58:43.344496
5623	988	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:44.152162	2013-06-27 21:58:44.152162
5624	988	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:45.132796	2013-06-27 21:58:45.132796
5625	1085	Menu item was shown: bundle 3,4,5	2013-06-27 21:58:46.056723	2013-06-27 21:58:46.056723
5626	943	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:46.097902	2013-06-27 21:58:46.097902
5627	988	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:46.120657	2013-06-27 21:58:46.120657
5628	967	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:46.746376	2013-06-27 21:58:46.746376
5629	988	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:46.987403	2013-06-27 21:58:46.987403
5630	943	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:47.848947	2013-06-27 21:58:47.848947
5631	1085	Menu item was shown: bundle 2,4,5	2013-06-27 21:58:48.385374	2013-06-27 21:58:48.385374
5632	1007	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:48.570036	2013-06-27 21:58:48.570036
5633	1115	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:48.73236	2013-06-27 21:58:48.73236
5634	988	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:58:49.168503	2013-06-27 21:58:49.168503
5635	1115	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:49.196438	2013-06-27 21:58:49.196438
5636	943	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:58:49.640991	2013-06-27 21:58:49.640991
5637	1115	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:49.734017	2013-06-27 21:58:49.734017
5638	1085	Menu item was shown: bundle 2,3,5	2013-06-27 21:58:49.876911	2013-06-27 21:58:49.876911
5639	988	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:58:50.070589	2013-06-27 21:58:50.070589
5640	1115	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:50.523703	2013-06-27 21:58:50.523703
5641	1007	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:58:50.776939	2013-06-27 21:58:50.776939
5642	1115	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:50.825612	2013-06-27 21:58:50.825612
5643	1085	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:50.992978	2013-06-27 21:58:50.992978
5644	1115	Menu item was shown: bundle 1,2,4	2013-06-27 21:58:51.248277	2013-06-27 21:58:51.248277
5645	1007	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:58:51.43306	2013-06-27 21:58:51.43306
5646	1085	Menu item was shown: bundle 1,4,5	2013-06-27 21:58:51.784593	2013-06-27 21:58:51.784593
5647	1007	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:58:52.018866	2013-06-27 21:58:52.018866
5648	1115	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:52.057855	2013-06-27 21:58:52.057855
5649	1007	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:58:52.475209	2013-06-27 21:58:52.475209
5650	1115	Menu item was shown: bundle 3,4	2013-06-27 21:58:52.522407	2013-06-27 21:58:52.522407
5651	943	Menu item was shown: bundle 1,2	2013-06-27 21:58:52.912485	2013-06-27 21:58:52.912485
5652	1115	Menu item was shown: bundle 2,4	2013-06-27 21:58:53.011869	2013-06-27 21:58:53.011869
5653	1007	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:53.085108	2013-06-27 21:58:53.085108
5654	988	Menu item was shown: bundle 1,2	2013-06-27 21:58:53.896992	2013-06-27 21:58:53.896992
5655	1007	Menu item was shown: bundle 3,4,5	2013-06-27 21:58:54.066886	2013-06-27 21:58:54.066886
5656	1115	Menu item was shown: bundle 3,4	2013-06-27 21:58:54.233633	2013-06-27 21:58:54.233633
5657	1007	Menu item was shown: bundle 2,4,5	2013-06-27 21:58:54.494509	2013-06-27 21:58:54.494509
5658	1115	Menu item was shown: bundle 2,3	2013-06-27 21:58:54.54217	2013-06-27 21:58:54.54217
5659	943	Menu item was shown: bundle 1,3	2013-06-27 21:58:54.621029	2013-06-27 21:58:54.621029
5660	988	Menu item was shown: bundle 1,3	2013-06-27 21:58:54.65325	2013-06-27 21:58:54.65325
5661	1115	Menu item was shown: bundle 1,4	2013-06-27 21:58:54.839924	2013-06-27 21:58:54.839924
5662	1007	Menu item was shown: bundle 3,4,5	2013-06-27 21:58:54.962309	2013-06-27 21:58:54.962309
5663	943	Menu item was shown: bundle 1,4	2013-06-27 21:58:55.016425	2013-06-27 21:58:55.016425
5664	1115	Menu item was shown: bundle 1,3	2013-06-27 21:58:55.241597	2013-06-27 21:58:55.241597
5665	988	Menu item was shown: bundle 1,4	2013-06-27 21:58:55.549574	2013-06-27 21:58:55.549574
5666	1115	Menu item was shown: bundle 1,2	2013-06-27 21:58:55.594779	2013-06-27 21:58:55.594779
5667	967	Menu item was shown: bundle 2,3,4	2013-06-27 21:58:56.073089	2013-06-27 21:58:56.073089
5668	943	Menu item was shown: bundle 1,5	2013-06-27 21:58:56.611377	2013-06-27 21:58:56.611377
5669	988	Menu item was shown: bundle 1,5	2013-06-27 21:58:56.800117	2013-06-27 21:58:56.800117
5670	967	Menu item was shown: bundle 1,3,4	2013-06-27 21:58:56.963711	2013-06-27 21:58:56.963711
5671	967	Menu item was hidden: bundle 1,3,4	2013-06-27 21:58:57.188975	2013-06-27 21:58:57.188975
5672	988	Menu item was shown: bundle 2,3	2013-06-27 21:58:57.481665	2013-06-27 21:58:57.481665
5673	943	Menu item was shown: bundle 2,3	2013-06-27 21:58:57.710146	2013-06-27 21:58:57.710146
5674	967	Menu item was shown: bundle 1,2,4	2013-06-27 21:58:57.754377	2013-06-27 21:58:57.754377
5675	988	Menu item was shown: bundle 2,4	2013-06-27 21:58:58.199839	2013-06-27 21:58:58.199839
5676	967	Menu item was shown: bundle 1,2,3	2013-06-27 21:58:58.352845	2013-06-27 21:58:58.352845
5677	967	Menu item was shown: bundle 3,4	2013-06-27 21:58:59.036693	2013-06-27 21:58:59.036693
5678	1115	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:58:59.110982	2013-06-27 21:58:59.110982
5679	967	Menu item was shown: bundle 2,4	2013-06-27 21:58:59.574107	2013-06-27 21:58:59.574107
5680	988	Menu item was shown: bundle 2,5	2013-06-27 21:58:59.645432	2013-06-27 21:58:59.645432
5681	1085	Menu item was shown: bundle 1,3,5	2013-06-27 21:59:00.055812	2013-06-27 21:59:00.055812
5682	988	Menu item was shown: bundle 3,4	2013-06-27 21:59:00.36007	2013-06-27 21:59:00.36007
5683	943	Menu item was shown: bundle 2,4	2013-06-27 21:59:00.631153	2013-06-27 21:59:00.631153
5684	988	Menu item was shown: bundle 3,5	2013-06-27 21:59:01.119515	2013-06-27 21:59:01.119515
5685	1085	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:01.23523	2013-06-27 21:59:01.23523
5686	1007	Menu item was shown: bundle 1,2,5	2013-06-27 21:59:01.684791	2013-06-27 21:59:01.684791
5687	967	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:01.720409	2013-06-27 21:59:01.720409
5688	988	Menu item was shown: bundle 4,5	2013-06-27 21:59:02.139177	2013-06-27 21:59:02.139177
5689	1085	Menu item was shown: bundle 1,2,5	2013-06-27 21:59:02.221265	2013-06-27 21:59:02.221265
5690	943	Menu item was shown: bundle 2,5	2013-06-27 21:59:02.735654	2013-06-27 21:59:02.735654
5691	1007	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:02.788881	2013-06-27 21:59:02.788881
5692	1007	Menu item was shown: bundle 1,3,5	2013-06-27 21:59:02.836949	2013-06-27 21:59:02.836949
5693	1085	Menu item was shown: bundle 1,2,4	2013-06-27 21:59:02.90771	2013-06-27 21:59:02.90771
5694	943	Menu item was shown: bundle 3,4	2013-06-27 21:59:03.366267	2013-06-27 21:59:03.366267
5695	1007	Menu item was shown: bundle 1,4,5	2013-06-27 21:59:03.603609	2013-06-27 21:59:03.603609
5696	967	Combo was clicked. Value is now: true	2013-06-27 21:59:03.704706	2013-06-27 21:59:03.704706
5697	988	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:03.999045	2013-06-27 21:59:03.999045
5698	1007	Menu item was shown: bundle 2,3,4	2013-06-27 21:59:04.158017	2013-06-27 21:59:04.158017
5699	1007	Menu item was shown: bundle 2,3,5	2013-06-27 21:59:04.811893	2013-06-27 21:59:04.811893
5700	988	Menu item was shown: bundle 1,2,4	2013-06-27 21:59:05.240534	2013-06-27 21:59:05.240534
5701	988	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:06.311922	2013-06-27 21:59:06.311922
5702	943	Menu item was shown: bundle 3,5	2013-06-27 21:59:06.364116	2013-06-27 21:59:06.364116
5703	988	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:07.117773	2013-06-27 21:59:07.117773
5704	967	Menu item was shown: bundle 1,2	2013-06-27 21:59:07.184159	2013-06-27 21:59:07.184159
5705	943	Menu item was shown: bundle 4,5	2013-06-27 21:59:07.857844	2013-06-27 21:59:07.857844
5706	988	Menu item was shown: bundle 1,3,5	2013-06-27 21:59:07.924738	2013-06-27 21:59:07.924738
5707	1085	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:08.118234	2013-06-27 21:59:08.118234
5708	967	Menu item was shown: bundle 1,3	2013-06-27 21:59:09.067774	2013-06-27 21:59:09.067774
5709	943	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:09.434422	2013-06-27 21:59:09.434422
5710	1007	Menu item was shown: bundle 4,5	2013-06-27 21:59:10.240582	2013-06-27 21:59:10.240582
5711	988	Menu item was shown: bundle 1,4,5	2013-06-27 21:59:10.291348	2013-06-27 21:59:10.291348
5712	1007	Menu item was shown: bundle 3,5	2013-06-27 21:59:10.73191	2013-06-27 21:59:10.73191
5713	943	Menu item was shown: bundle 1,2,4	2013-06-27 21:59:10.899168	2013-06-27 21:59:10.899168
5714	967	Menu item was shown: bundle 1,4	2013-06-27 21:59:11.472312	2013-06-27 21:59:11.472312
5715	943	Menu item was shown: bundle 1,2,5	2013-06-27 21:59:12.212739	2013-06-27 21:59:12.212739
5716	1085	Menu item was shown: bundle 4,5	2013-06-27 21:59:12.677085	2013-06-27 21:59:12.677085
5717	1007	Menu item was shown: bundle 3,4	2013-06-27 21:59:12.955507	2013-06-27 21:59:12.955507
5718	967	Menu item was shown: bundle 2,3	2013-06-27 21:59:13.32077	2013-06-27 21:59:13.32077
5719	943	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:13.469283	2013-06-27 21:59:13.469283
5720	1007	Menu item was shown: bundle 2,5	2013-06-27 21:59:13.731077	2013-06-27 21:59:13.731077
5721	988	Menu item was shown: bundle 2,3,4	2013-06-27 21:59:13.790764	2013-06-27 21:59:13.790764
5722	1007	Menu item was shown: bundle 2,4	2013-06-27 21:59:14.096588	2013-06-27 21:59:14.096588
5723	1007	Menu item was shown: bundle 1,5	2013-06-27 21:59:14.640115	2013-06-27 21:59:14.640115
5724	943	Menu item was shown: bundle 1,3,5	2013-06-27 21:59:14.757765	2013-06-27 21:59:14.757765
5725	1085	Menu item was shown: bundle 3,5	2013-06-27 21:59:14.811817	2013-06-27 21:59:14.811817
5726	1007	Menu item was shown: bundle 2,3	2013-06-27 21:59:15.232572	2013-06-27 21:59:15.232572
5727	1007	Menu item was shown: bundle 1,4	2013-06-27 21:59:16.02845	2013-06-27 21:59:16.02845
5728	967	Menu item was shown: bundle 2,4	2013-06-27 21:59:16.188985	2013-06-27 21:59:16.188985
5729	1007	Menu item was shown: bundle 1,3	2013-06-27 21:59:16.851589	2013-06-27 21:59:16.851589
5730	988	Menu item was shown: bundle 2,3,5	2013-06-27 21:59:17.017631	2013-06-27 21:59:17.017631
5731	943	Menu item was shown: bundle 1,4,5	2013-06-27 21:59:17.223564	2013-06-27 21:59:17.223564
5732	1007	Menu item was shown: bundle 1,2	2013-06-27 21:59:17.44102	2013-06-27 21:59:17.44102
5733	1085	Menu item was shown: bundle 3,4	2013-06-27 21:59:18.228999	2013-06-27 21:59:18.228999
5734	988	Menu item was shown: bundle 2,4,5	2013-06-27 21:59:18.286456	2013-06-27 21:59:18.286456
5735	988	Menu item was shown: bundle 3,4,5	2013-06-27 21:59:19.687744	2013-06-27 21:59:19.687744
5736	988	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:20.227194	2013-06-27 21:59:20.227194
5737	943	Menu item was shown: bundle 2,3,4	2013-06-27 21:59:20.977252	2013-06-27 21:59:20.977252
5738	909	Combo was clicked. Value is now: true	2013-06-27 21:59:21.549662	2013-06-27 21:59:21.549662
5739	967	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:21.735991	2013-06-27 21:59:21.735991
5740	988	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:59:22.001353	2013-06-27 21:59:22.001353
5741	988	Menu item was hidden: bundle 1,2,3,5	2013-06-27 21:59:22.530093	2013-06-27 21:59:22.530093
5742	1085	Menu item was shown: bundle 4,5	2013-06-27 21:59:22.655436	2013-06-27 21:59:22.655436
5743	988	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:59:22.980309	2013-06-27 21:59:22.980309
5744	943	Menu item was shown: bundle 2,3,5	2013-06-27 21:59:23.244287	2013-06-27 21:59:23.244287
5745	909	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:59:23.604495	2013-06-27 21:59:23.604495
5746	943	Menu item was shown: bundle 2,4,5	2013-06-27 21:59:24.86422	2013-06-27 21:59:24.86422
5747	1085	Menu item was shown: bundle 2,5	2013-06-27 21:59:25.33609	2013-06-27 21:59:25.33609
5748	988	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:59:26.31102	2013-06-27 21:59:26.31102
5749	1085	Menu item was shown: bundle 2,4	2013-06-27 21:59:26.623856	2013-06-27 21:59:26.623856
5750	198	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:26.702651	2013-06-27 21:59:26.702651
5751	988	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:59:26.767381	2013-06-27 21:59:26.767381
5752	198	Menu item was shown: bundle 2,3	2013-06-27 21:59:26.806447	2013-06-27 21:59:26.806447
5753	1085	Menu item was shown: bundle 2,3	2013-06-27 21:59:26.856838	2013-06-27 21:59:26.856838
5754	988	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:59:26.910168	2013-06-27 21:59:26.910168
5755	1085	Menu item was shown: bundle 1,5	2013-06-27 21:59:26.943641	2013-06-27 21:59:26.943641
5756	988	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:59:27.521372	2013-06-27 21:59:27.521372
5757	198	Menu item was shown: bundle 1,3	2013-06-27 21:59:27.706893	2013-06-27 21:59:27.706893
5758	943	Menu item was shown: bundle 3,4,5	2013-06-27 21:59:27.934933	2013-06-27 21:59:27.934933
5759	198	Menu item was shown: bundle 1,2	2013-06-27 21:59:28.313279	2013-06-27 21:59:28.313279
5760	1123	Menu item was shown: bundle 1,2	2013-06-27 21:59:28.95661	2013-06-27 21:59:28.95661
5761	1085	Menu item was shown: bundle 1,4	2013-06-27 21:59:29.425478	2013-06-27 21:59:29.425478
5762	1123	Menu item was hidden: bundle 1,2	2013-06-27 21:59:29.656489	2013-06-27 21:59:29.656489
5763	1085	Menu item was shown: bundle 1,3	2013-06-27 21:59:29.893122	2013-06-27 21:59:29.893122
5764	943	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:30.419897	2013-06-27 21:59:30.419897
5765	1085	Menu item was shown: bundle 1,2	2013-06-27 21:59:30.696735	2013-06-27 21:59:30.696735
5766	1123	Menu item was shown: bundle 1,3	2013-06-27 21:59:30.754706	2013-06-27 21:59:30.754706
5767	198	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:30.984057	2013-06-27 21:59:30.984057
5768	1085	Menu item was shown: bundle 1,4	2013-06-27 21:59:31.296504	2013-06-27 21:59:31.296504
5769	1085	Menu item was shown: bundle 1,2	2013-06-27 21:59:32.230447	2013-06-27 21:59:32.230447
5770	988	Menu item was shown: bundle 1,2	2013-06-27 21:59:32.402255	2013-06-27 21:59:32.402255
5771	198	Menu item was shown: bundle 2,3	2013-06-27 21:59:32.514723	2013-06-27 21:59:32.514723
5772	1085	Menu item was shown: bundle 1,3	2013-06-27 21:59:32.982428	2013-06-27 21:59:32.982428
5773	1123	Menu item was hidden: bundle 1,3	2013-06-27 21:59:33.049174	2013-06-27 21:59:33.049174
5774	943	Menu item was shown: bundle 1,2,3,5	2013-06-27 21:59:33.154267	2013-06-27 21:59:33.154267
5775	988	Menu item was shown: bundle 1,3	2013-06-27 21:59:33.466151	2013-06-27 21:59:33.466151
5776	1123	Menu item was shown: bundle 1,4	2013-06-27 21:59:33.950479	2013-06-27 21:59:33.950479
5777	988	Menu item was shown: bundle 1,4	2013-06-27 21:59:33.991343	2013-06-27 21:59:33.991343
5778	198	Good 3 was clicked. Value is now: true	2013-06-27 21:59:34.759366	2013-06-27 21:59:34.759366
5779	988	Menu item was shown: bundle 1,5	2013-06-27 21:59:35.28552	2013-06-27 21:59:35.28552
5780	1123	Menu item was hidden: bundle 1,4	2013-06-27 21:59:36.179141	2013-06-27 21:59:36.179141
5781	943	Menu item was shown: bundle 1,2,4,5	2013-06-27 21:59:36.302635	2013-06-27 21:59:36.302635
5782	198	Good 2 was clicked. Value is now: true	2013-06-27 21:59:36.494057	2013-06-27 21:59:36.494057
5783	1123	Menu item was shown: bundle 2,3	2013-06-27 21:59:36.70205	2013-06-27 21:59:36.70205
5784	988	Menu item was shown: bundle 2,3	2013-06-27 21:59:36.964288	2013-06-27 21:59:36.964288
5785	988	Menu item was shown: bundle 2,4	2013-06-27 21:59:37.539542	2013-06-27 21:59:37.539542
5786	909	Menu item was shown: bundle 1,2	2013-06-27 21:59:37.986183	2013-06-27 21:59:37.986183
5787	943	Menu item was shown: bundle 1,3,4,5	2013-06-27 21:59:38.544858	2013-06-27 21:59:38.544858
5788	988	Menu item was shown: bundle 2,5	2013-06-27 21:59:38.83914	2013-06-27 21:59:38.83914
5789	988	Menu item was shown: bundle 3,4	2013-06-27 21:59:39.753749	2013-06-27 21:59:39.753749
5790	909	Menu item was shown: bundle 1,3	2013-06-27 21:59:40.041582	2013-06-27 21:59:40.041582
5791	1049	Menu item was shown: bundle 1,2	2013-06-27 21:59:40.536401	2013-06-27 21:59:40.536401
5792	988	Menu item was shown: bundle 3,5	2013-06-27 21:59:40.66323	2013-06-27 21:59:40.66323
5793	537	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:41.126306	2013-06-27 21:59:41.126306
5794	909	Menu item was shown: bundle 1,4	2013-06-27 21:59:41.166894	2013-06-27 21:59:41.166894
5795	988	Menu item was shown: bundle 4,5	2013-06-27 21:59:41.382912	2013-06-27 21:59:41.382912
5796	909	Menu item was shown: bundle 1,5	2013-06-27 21:59:41.62952	2013-06-27 21:59:41.62952
5797	406	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:42.080273	2013-06-27 21:59:42.080273
5798	988	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:42.186663	2013-06-27 21:59:42.186663
5799	909	Menu item was shown: bundle 2,3	2013-06-27 21:59:42.27898	2013-06-27 21:59:42.27898
5800	406	Menu item was shown: bundle 2,3	2013-06-27 21:59:42.505065	2013-06-27 21:59:42.505065
5801	1123	Menu item was hidden: bundle 2,3	2013-06-27 21:59:42.563398	2013-06-27 21:59:42.563398
5802	909	Menu item was shown: bundle 2,4	2013-06-27 21:59:42.991639	2013-06-27 21:59:42.991639
5803	943	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:59:43.061344	2013-06-27 21:59:43.061344
5804	988	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:43.160834	2013-06-27 21:59:43.160834
5805	1123	Menu item was shown: bundle 2,4	2013-06-27 21:59:43.189579	2013-06-27 21:59:43.189579
5806	909	Menu item was shown: bundle 2,3	2013-06-27 21:59:43.503336	2013-06-27 21:59:43.503336
5807	988	Menu item was shown: bundle 3,4,5	2013-06-27 21:59:43.734379	2013-06-27 21:59:43.734379
5808	1123	Menu item was hidden: bundle 2,4	2013-06-27 21:59:43.792506	2013-06-27 21:59:43.792506
5809	988	Menu item was shown: bundle 2,4,5	2013-06-27 21:59:44.32734	2013-06-27 21:59:44.32734
5810	1123	Menu item was shown: bundle 3,4	2013-06-27 21:59:44.379982	2013-06-27 21:59:44.379982
5811	1123	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:45.655013	2013-06-27 21:59:45.655013
5812	406	Menu item was shown: bundle 1,3	2013-06-27 21:59:45.882618	2013-06-27 21:59:45.882618
5813	943	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 21:59:46.100497	2013-06-27 21:59:46.100497
5814	1123	Menu item was shown: bundle 1,2,4	2013-06-27 21:59:46.581556	2013-06-27 21:59:46.581556
5815	1049	Good 1 was clicked. Value is now: true	2013-06-27 21:59:46.702394	2013-06-27 21:59:46.702394
5816	1123	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:47.03496	2013-06-27 21:59:47.03496
5817	1049	Good 2 was clicked. Value is now: true	2013-06-27 21:59:47.110118	2013-06-27 21:59:47.110118
5818	1123	Menu item was hidden: bundle 1,3,4	2013-06-27 21:59:47.538018	2013-06-27 21:59:47.538018
5819	537	Good 1 was clicked. Value is now: true	2013-06-27 21:59:47.995702	2013-06-27 21:59:47.995702
5820	1123	Menu item was shown: bundle 2,3,4	2013-06-27 21:59:48.162083	2013-06-27 21:59:48.162083
5821	1049	Menu item was shown: bundle 1,3	2013-06-27 21:59:48.221701	2013-06-27 21:59:48.221701
5822	406	Menu item was shown: bundle 1,2	2013-06-27 21:59:48.312651	2013-06-27 21:59:48.312651
5823	537	Good 2 was clicked. Value is now: true	2013-06-27 21:59:48.392015	2013-06-27 21:59:48.392015
5824	1123	Menu item was shown: bundle 1,2,3,4	2013-06-27 21:59:48.741134	2013-06-27 21:59:48.741134
5825	537	Good 4 was clicked. Value is now: true	2013-06-27 21:59:49.106579	2013-06-27 21:59:49.106579
5826	988	Menu item was shown: bundle 1,2	2013-06-27 21:59:49.565142	2013-06-27 21:59:49.565142
5827	406	Menu item was shown: bundle 2,3	2013-06-27 21:59:49.975581	2013-06-27 21:59:49.975581
5828	1123	Menu item was shown: bundle 2,4	2013-06-27 21:59:50.134427	2013-06-27 21:59:50.134427
5829	909	Menu item was shown: bundle 2,4	2013-06-27 21:59:50.483674	2013-06-27 21:59:50.483674
5830	406	Good 2 was clicked. Value is now: true	2013-06-27 21:59:50.542812	2013-06-27 21:59:50.542812
5831	1123	Menu item was shown: bundle 2,3	2013-06-27 21:59:50.585122	2013-06-27 21:59:50.585122
5832	406	Good 3 was clicked. Value is now: true	2013-06-27 21:59:50.95585	2013-06-27 21:59:50.95585
5833	909	Menu item was shown: bundle 2,5	2013-06-27 21:59:51.264372	2013-06-27 21:59:51.264372
5834	1123	Menu item was shown: bundle 1,4	2013-06-27 21:59:51.445658	2013-06-27 21:59:51.445658
5835	1123	Menu item was shown: bundle 1,3	2013-06-27 21:59:51.859887	2013-06-27 21:59:51.859887
5836	909	Menu item was shown: bundle 3,4	2013-06-27 21:59:51.950813	2013-06-27 21:59:51.950813
5837	1049	Menu item was shown: bundle 2,3	2013-06-27 21:59:52.084618	2013-06-27 21:59:52.084618
5838	239	Good 3 was clicked. Value is now: true	2013-06-27 21:59:52.196603	2013-06-27 21:59:52.196603
5839	988	Menu item was shown: bundle 1,3	2013-06-27 21:59:52.471172	2013-06-27 21:59:52.471172
5840	1123	Menu item was shown: bundle 1,2	2013-06-27 21:59:52.783608	2013-06-27 21:59:52.783608
5841	537	Menu item was shown: bundle 1,2	2013-06-27 21:59:52.944332	2013-06-27 21:59:52.944332
5842	1049	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:53.122257	2013-06-27 21:59:53.122257
5843	239	Menu item was shown: bundle 1,2	2013-06-27 21:59:53.247077	2013-06-27 21:59:53.247077
5844	909	Menu item was shown: bundle 3,5	2013-06-27 21:59:53.525076	2013-06-27 21:59:53.525076
5845	537	Menu item was shown: bundle 1,3	2013-06-27 21:59:53.606205	2013-06-27 21:59:53.606205
5846	988	Menu item was shown: bundle 2,3	2013-06-27 21:59:53.717672	2013-06-27 21:59:53.717672
5847	1123	Combo was clicked. Value is now: true	2013-06-27 21:59:53.869056	2013-06-27 21:59:53.869056
5848	537	Menu item was shown: bundle 1,4	2013-06-27 21:59:54.225501	2013-06-27 21:59:54.225501
5849	909	Menu item was shown: bundle 4,5	2013-06-27 21:59:54.615897	2013-06-27 21:59:54.615897
5850	537	Menu item was shown: bundle 2,3	2013-06-27 21:59:54.721644	2013-06-27 21:59:54.721644
5851	537	Menu item was shown: bundle 1,4	2013-06-27 21:59:55.218162	2013-06-27 21:59:55.218162
5852	239	Menu item was shown: bundle 1,3	2013-06-27 21:59:55.411758	2013-06-27 21:59:55.411758
5853	988	Menu item was shown: bundle 2,4	2013-06-27 21:59:55.62572	2013-06-27 21:59:55.62572
5854	239	Menu item was shown: bundle 1,4	2013-06-27 21:59:56.39842	2013-06-27 21:59:56.39842
5855	988	Menu item was shown: bundle 2,5	2013-06-27 21:59:56.603398	2013-06-27 21:59:56.603398
5856	239	Menu item was shown: bundle 2,3	2013-06-27 21:59:57.859997	2013-06-27 21:59:57.859997
5857	1049	Menu item was shown: bundle 1,2	2013-06-27 21:59:57.961706	2013-06-27 21:59:57.961706
5858	239	Menu item was shown: bundle 2,4	2013-06-27 21:59:58.833756	2013-06-27 21:59:58.833756
5859	537	Menu item was shown: bundle 1,3,4	2013-06-27 21:59:58.85767	2013-06-27 21:59:58.85767
5860	988	Good 2 was clicked. Value is now: true	2013-06-27 21:59:59.000907	2013-06-27 21:59:59.000907
5861	943	Menu item was shown: bundle 2,3,4,5	2013-06-27 21:59:59.279967	2013-06-27 21:59:59.279967
5862	909	Menu item was shown: bundle 1,2,3	2013-06-27 21:59:59.371557	2013-06-27 21:59:59.371557
5863	537	Menu item was shown: bundle 2,3,4	2013-06-27 21:59:59.721937	2013-06-27 21:59:59.721937
5864	239	Menu item was shown: bundle 3,4	2013-06-27 21:59:59.934602	2013-06-27 21:59:59.934602
5865	537	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:00:00.30141	2013-06-27 22:00:00.30141
5866	909	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:00.394193	2013-06-27 22:00:00.394193
5867	239	Menu item was shown: bundle 1,2,3	2013-06-27 22:00:01.073541	2013-06-27 22:00:01.073541
5868	239	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:02.784409	2013-06-27 22:00:02.784409
5869	909	Menu item was shown: bundle 1,2,5	2013-06-27 22:00:03.967789	2013-06-27 22:00:03.967789
5870	239	Menu item was shown: bundle 1,3,4	2013-06-27 22:00:04.042822	2013-06-27 22:00:04.042822
5871	909	Menu item was shown: bundle 1,3,4	2013-06-27 22:00:04.970539	2013-06-27 22:00:04.970539
5872	239	Menu item was shown: bundle 2,3,4	2013-06-27 22:00:05.05354	2013-06-27 22:00:05.05354
5873	909	Menu item was shown: bundle 1,3,5	2013-06-27 22:00:05.611143	2013-06-27 22:00:05.611143
5874	239	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:00:06.222813	2013-06-27 22:00:06.222813
5875	909	Menu item was shown: bundle 1,4,5	2013-06-27 22:00:06.279186	2013-06-27 22:00:06.279186
5876	909	Menu item was shown: bundle 2,3,4	2013-06-27 22:00:07.555604	2013-06-27 22:00:07.555604
5877	909	Menu item was shown: bundle 2,3,5	2013-06-27 22:00:08.30132	2013-06-27 22:00:08.30132
5878	909	Menu item was shown: bundle 2,4,5	2013-06-27 22:00:08.674658	2013-06-27 22:00:08.674658
5879	537	Menu item was shown: bundle 2,3,4	2013-06-27 22:00:10.019436	2013-06-27 22:00:10.019436
5880	537	Menu item was shown: bundle 1,3,4	2013-06-27 22:00:13.091069	2013-06-27 22:00:13.091069
5881	943	Menu item was shown: bundle 2,4,5	2013-06-27 22:00:13.486045	2013-06-27 22:00:13.486045
5882	1021	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:00:16.108784	2013-06-27 22:00:16.108784
5883	909	Good 2 was clicked. Value is now: true	2013-06-27 22:00:17.241808	2013-06-27 22:00:17.241808
5884	909	Good 4 was clicked. Value is now: true	2013-06-27 22:00:18.022432	2013-06-27 22:00:18.022432
5885	909	Good 5 was clicked. Value is now: true	2013-06-27 22:00:18.462705	2013-06-27 22:00:18.462705
5886	1021	Menu item was shown: bundle 1,2	2013-06-27 22:00:21.300112	2013-06-27 22:00:21.300112
5887	909	Combo was clicked. Value is now: true	2013-06-27 22:00:21.993504	2013-06-27 22:00:21.993504
5888	1021	Menu item was shown: bundle 1,4	2013-06-27 22:00:23.020328	2013-06-27 22:00:23.020328
5889	909	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:00:23.618986	2013-06-27 22:00:23.618986
5890	1021	Menu item was shown: bundle 1,3	2013-06-27 22:00:24.191353	2013-06-27 22:00:24.191353
5891	1021	Menu item was shown: bundle 1,4	2013-06-27 22:00:26.561978	2013-06-27 22:00:26.561978
5892	909	Menu item was shown: bundle 2,4,5	2013-06-27 22:00:28.856822	2013-06-27 22:00:28.856822
5893	696	Menu item was shown: bundle 1,2	2013-06-27 22:00:30.30548	2013-06-27 22:00:30.30548
5894	537	Good 3 was clicked. Value is now: true	2013-06-27 22:00:30.787762	2013-06-27 22:00:30.787762
5895	537	Good 2 was clicked. Value is now: false	2013-06-27 22:00:31.271625	2013-06-27 22:00:31.271625
5896	696	Menu item was hidden: bundle 1,2	2013-06-27 22:00:32.421848	2013-06-27 22:00:32.421848
5897	696	Menu item was shown: bundle 1,3	2013-06-27 22:00:32.936531	2013-06-27 22:00:32.936531
5898	537	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:33.03185	2013-06-27 22:00:33.03185
5899	1021	Menu item was shown: bundle 1,5	2013-06-27 22:00:33.134325	2013-06-27 22:00:33.134325
5900	537	Menu item was shown: bundle 1,3,4	2013-06-27 22:00:33.757862	2013-06-27 22:00:33.757862
5901	954	Menu item was shown: bundle 1,2	2013-06-27 22:00:34.503351	2013-06-27 22:00:34.503351
5902	1021	Menu item was shown: bundle 2,3	2013-06-27 22:00:35.568976	2013-06-27 22:00:35.568976
5903	954	Menu item was shown: bundle 1,3	2013-06-27 22:00:35.893465	2013-06-27 22:00:35.893465
5904	1021	Menu item was shown: bundle 2,4	2013-06-27 22:00:36.387752	2013-06-27 22:00:36.387752
5905	954	Menu item was shown: bundle 1,4	2013-06-27 22:00:36.761554	2013-06-27 22:00:36.761554
5906	696	Menu item was shown: bundle 1,4	2013-06-27 22:00:37.692297	2013-06-27 22:00:37.692297
5907	1021	Menu item was shown: bundle 2,3	2013-06-27 22:00:38.551149	2013-06-27 22:00:38.551149
5908	537	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:39.277672	2013-06-27 22:00:39.277672
5909	1021	Menu item was shown: bundle 2,4	2013-06-27 22:00:39.299721	2013-06-27 22:00:39.299721
5910	954	Combo was clicked. Value is now: true	2013-06-27 22:00:39.422761	2013-06-27 22:00:39.422761
5911	909	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:00:39.503373	2013-06-27 22:00:39.503373
5912	1085	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:00:39.749759	2013-06-27 22:00:39.749759
5913	537	Menu item was shown: bundle 1,2,3	2013-06-27 22:00:39.925282	2013-06-27 22:00:39.925282
5914	537	Menu item was shown: bundle 3,4	2013-06-27 22:00:40.498267	2013-06-27 22:00:40.498267
5915	537	Menu item was shown: bundle 2,4	2013-06-27 22:00:41.127866	2013-06-27 22:00:41.127866
5916	696	Menu item was shown: bundle 1,5	2013-06-27 22:00:41.524214	2013-06-27 22:00:41.524214
5917	537	Menu item was shown: bundle 2,3	2013-06-27 22:00:41.653478	2013-06-27 22:00:41.653478
5918	537	Menu item was shown: bundle 1,4	2013-06-27 22:00:42.407246	2013-06-27 22:00:42.407246
5919	1021	Menu item was shown: bundle 2,5	2013-06-27 22:00:42.676999	2013-06-27 22:00:42.676999
5920	537	Menu item was shown: bundle 1,3	2013-06-27 22:00:42.847297	2013-06-27 22:00:42.847297
5921	537	Menu item was shown: bundle 1,2	2013-06-27 22:00:43.062094	2013-06-27 22:00:43.062094
5922	954	Menu item was shown: bundle 2,3	2013-06-27 22:00:43.134122	2013-06-27 22:00:43.134122
5923	696	Menu item was shown: bundle 2,3	2013-06-27 22:00:44.864247	2013-06-27 22:00:44.864247
5924	909	Menu item was shown: bundle 2,3,4	2013-06-27 22:00:45.702688	2013-06-27 22:00:45.702688
5925	1021	Menu item was shown: bundle 3,4	2013-06-27 22:00:46.054201	2013-06-27 22:00:46.054201
5926	696	Menu item was shown: bundle 2,4	2013-06-27 22:00:47.519759	2013-06-27 22:00:47.519759
5927	954	Good 2 was clicked. Value is now: true	2013-06-27 22:00:47.574681	2013-06-27 22:00:47.574681
5928	954	Good 3 was clicked. Value is now: true	2013-06-27 22:00:48.541645	2013-06-27 22:00:48.541645
5929	909	Menu item was shown: bundle 2,3,5	2013-06-27 22:00:48.837415	2013-06-27 22:00:48.837415
5930	954	Menu item was shown: bundle 2,4	2013-06-27 22:00:48.893107	2013-06-27 22:00:48.893107
5931	1021	Menu item was shown: bundle 3,5	2013-06-27 22:00:48.950839	2013-06-27 22:00:48.950839
5932	909	Menu item was shown: bundle 2,4,5	2013-06-27 22:00:49.667817	2013-06-27 22:00:49.667817
5933	696	Menu item was shown: bundle 2,5	2013-06-27 22:00:49.925945	2013-06-27 22:00:49.925945
5934	1021	Menu item was shown: bundle 4,5	2013-06-27 22:00:50.391129	2013-06-27 22:00:50.391129
5935	696	Menu item was shown: bundle 3,4	2013-06-27 22:00:51.317952	2013-06-27 22:00:51.317952
5936	954	Menu item was shown: bundle 3,4	2013-06-27 22:00:51.537919	2013-06-27 22:00:51.537919
5937	909	Menu item was shown: bundle 3,4,5	2013-06-27 22:00:52.028722	2013-06-27 22:00:52.028722
5938	954	Menu item was shown: bundle 1,2,3	2013-06-27 22:00:52.198965	2013-06-27 22:00:52.198965
5939	1021	Menu item was shown: bundle 1,2,3	2013-06-27 22:00:53.604126	2013-06-27 22:00:53.604126
5940	1021	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:54.420854	2013-06-27 22:00:54.420854
5941	954	Menu item was shown: bundle 1,2,4	2013-06-27 22:00:54.858703	2013-06-27 22:00:54.858703
5942	1021	Menu item was shown: bundle 1,2,5	2013-06-27 22:00:55.380683	2013-06-27 22:00:55.380683
5943	954	Menu item was shown: bundle 1,3,4	2013-06-27 22:00:55.477554	2013-06-27 22:00:55.477554
5944	909	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:00:57.806241	2013-06-27 22:00:57.806241
5945	909	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:00:58.269242	2013-06-27 22:00:58.269242
5946	696	Menu item was shown: bundle 3,5	2013-06-27 22:01:00.120584	2013-06-27 22:01:00.120584
5947	1021	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:00.517506	2013-06-27 22:01:00.517506
5948	696	Menu item was shown: bundle 4,5	2013-06-27 22:01:01.164515	2013-06-27 22:01:01.164515
5949	954	Good 1 was clicked. Value is now: true	2013-06-27 22:01:01.324822	2013-06-27 22:01:01.324822
5950	1021	Menu item was shown: bundle 1,3,5	2013-06-27 22:01:01.509384	2013-06-27 22:01:01.509384
5951	696	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:01.797815	2013-06-27 22:01:01.797815
5952	1021	Menu item was shown: bundle 1,4,5	2013-06-27 22:01:02.504789	2013-06-27 22:01:02.504789
5953	696	Menu item was shown: bundle 1,2,4	2013-06-27 22:01:02.537389	2013-06-27 22:01:02.537389
5954	954	Good 2 was clicked. Value is now: false	2013-06-27 22:01:02.733271	2013-06-27 22:01:02.733271
5955	954	Good 4 was clicked. Value is now: true	2013-06-27 22:01:02.803603	2013-06-27 22:01:02.803603
5956	1021	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:03.304799	2013-06-27 22:01:03.304799
5957	234	Menu item was shown: bundle 1,2	2013-06-27 22:01:03.554005	2013-06-27 22:01:03.554005
5958	234	Menu item was shown: bundle 1,4	2013-06-27 22:01:04.370023	2013-06-27 22:01:04.370023
5959	696	Menu item was shown: bundle 1,2,5	2013-06-27 22:01:04.830229	2013-06-27 22:01:04.830229
5960	234	Menu item was shown: bundle 1,2	2013-06-27 22:01:05.624183	2013-06-27 22:01:05.624183
5961	909	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:01:07.388952	2013-06-27 22:01:07.388952
5962	909	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:01:08.36207	2013-06-27 22:01:08.36207
5963	909	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:01:09.08256	2013-06-27 22:01:09.08256
5964	954	Combo was clicked. Value is now: true	2013-06-27 22:01:09.579855	2013-06-27 22:01:09.579855
5965	234	Menu item was shown: bundle 1,4	2013-06-27 22:01:10.25419	2013-06-27 22:01:10.25419
5966	234	Menu item was shown: bundle 1,5	2013-06-27 22:01:11.477915	2013-06-27 22:01:11.477915
5967	234	Menu item was shown: bundle 2,3	2013-06-27 22:01:11.958867	2013-06-27 22:01:11.958867
5968	954	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:15.030026	2013-06-27 22:01:15.030026
5969	954	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:15.964406	2013-06-27 22:01:15.964406
5970	909	Good 2 was clicked. Value is now: true	2013-06-27 22:01:16.391982	2013-06-27 22:01:16.391982
5971	909	Good 3 was clicked. Value is now: true	2013-06-27 22:01:16.794315	2013-06-27 22:01:16.794315
5972	954	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:01:17.043442	2013-06-27 22:01:17.043442
5973	909	Good 4 was clicked. Value is now: true	2013-06-27 22:01:17.076726	2013-06-27 22:01:17.076726
5974	696	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:17.97061	2013-06-27 22:01:17.97061
5975	1021	Good 2 was clicked. Value is now: true	2013-06-27 22:01:18.383753	2013-06-27 22:01:18.383753
5976	234	Menu item was shown: bundle 2,4	2013-06-27 22:01:18.47503	2013-06-27 22:01:18.47503
5977	909	Good 5 was clicked. Value is now: true	2013-06-27 22:01:18.620462	2013-06-27 22:01:18.620462
5978	1021	Good 3 was clicked. Value is now: true	2013-06-27 22:01:19.158124	2013-06-27 22:01:19.158124
5979	696	Menu item was shown: bundle 1,3,5	2013-06-27 22:01:19.334147	2013-06-27 22:01:19.334147
5980	1021	Good 4 was clicked. Value is now: true	2013-06-27 22:01:19.922351	2013-06-27 22:01:19.922351
5981	696	Menu item was shown: bundle 1,4,5	2013-06-27 22:01:20.151267	2013-06-27 22:01:20.151267
5982	696	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:20.984921	2013-06-27 22:01:20.984921
5983	1021	Menu item was shown: bundle 1,4	2013-06-27 22:01:21.948485	2013-06-27 22:01:21.948485
5984	954	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:22.831156	2013-06-27 22:01:22.831156
5985	954	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:24.024462	2013-06-27 22:01:24.024462
5986	234	Menu item was shown: bundle 2,5	2013-06-27 22:01:25.721879	2013-06-27 22:01:25.721879
5987	234	Menu item was shown: bundle 3,4	2013-06-27 22:01:26.617104	2013-06-27 22:01:26.617104
5988	954	Menu item was shown: bundle 1,2,4	2013-06-27 22:01:30.053954	2013-06-27 22:01:30.053954
5989	954	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:31.387011	2013-06-27 22:01:31.387011
5990	1021	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:31.616952	2013-06-27 22:01:31.616952
5991	219	Good 2 was clicked. Value is now: true	2013-06-27 22:01:32.274476	2013-06-27 22:01:32.274476
5992	954	Menu item was shown: bundle 3,4	2013-06-27 22:01:32.381712	2013-06-27 22:01:32.381712
5993	234	Menu item was shown: bundle 1,2,4	2013-06-27 22:01:32.402786	2013-06-27 22:01:32.402786
5994	954	Menu item was shown: bundle 2,4	2013-06-27 22:01:32.896074	2013-06-27 22:01:32.896074
5995	1000	Combo was clicked. Value is now: true	2013-06-27 22:01:33.070355	2013-06-27 22:01:33.070355
5996	219	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:01:34.222632	2013-06-27 22:01:34.222632
5997	1000	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:01:34.745228	2013-06-27 22:01:34.745228
5998	219	Menu item was hidden: bundle 1,2,3,4	2013-06-27 22:01:34.954171	2013-06-27 22:01:34.954171
5999	696	Menu item was shown: bundle 2,3,5	2013-06-27 22:01:34.985341	2013-06-27 22:01:34.985341
6000	234	Menu item was shown: bundle 1,2,5	2013-06-27 22:01:35.022392	2013-06-27 22:01:35.022392
6001	1000	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:01:35.537803	2013-06-27 22:01:35.537803
6002	219	Menu item was shown: bundle 1,2	2013-06-27 22:01:35.842658	2013-06-27 22:01:35.842658
6003	696	Menu item was shown: bundle 2,4,5	2013-06-27 22:01:36.323632	2013-06-27 22:01:36.323632
6004	234	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:36.399698	2013-06-27 22:01:36.399698
6005	219	Menu item was shown: bundle 1,3	2013-06-27 22:01:36.44775	2013-06-27 22:01:36.44775
6006	219	Menu item was shown: bundle 1,4	2013-06-27 22:01:36.7485	2013-06-27 22:01:36.7485
6007	234	Menu item was shown: bundle 1,3,5	2013-06-27 22:01:37.167655	2013-06-27 22:01:37.167655
6008	219	Menu item was shown: bundle 2,3	2013-06-27 22:01:37.23646	2013-06-27 22:01:37.23646
6009	696	Menu item was shown: bundle 3,4,5	2013-06-27 22:01:37.508818	2013-06-27 22:01:37.508818
6010	696	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:01:38.02523	2013-06-27 22:01:38.02523
6011	1000	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:01:38.789672	2013-06-27 22:01:38.789672
6012	696	Menu item was shown: bundle 3,4,5	2013-06-27 22:01:38.834628	2013-06-27 22:01:38.834628
6013	954	Menu item was shown: bundle 2,3	2013-06-27 22:01:38.874139	2013-06-27 22:01:38.874139
6014	219	Good 3 was clicked. Value is now: true	2013-06-27 22:01:39.248819	2013-06-27 22:01:39.248819
6015	1000	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:01:39.657976	2013-06-27 22:01:39.657976
6016	219	Menu item was shown: bundle 2,4	2013-06-27 22:01:40.644192	2013-06-27 22:01:40.644192
6017	219	Menu item was shown: bundle 3,4	2013-06-27 22:01:41.170937	2013-06-27 22:01:41.170937
6018	219	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:41.761629	2013-06-27 22:01:41.761629
6019	219	Menu item was shown: bundle 1,2,4	2013-06-27 22:01:42.112325	2013-06-27 22:01:42.112325
6020	1021	Menu item was shown: bundle 2,3,5	2013-06-27 22:01:42.545796	2013-06-27 22:01:42.545796
6021	219	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:42.599839	2013-06-27 22:01:42.599839
6022	954	Good 2 was clicked. Value is now: true	2013-06-27 22:01:43.015714	2013-06-27 22:01:43.015714
6023	939	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:43.069784	2013-06-27 22:01:43.069784
6024	219	Menu item was shown: bundle 1,2,4	2013-06-27 22:01:43.121556	2013-06-27 22:01:43.121556
6025	954	Good 3 was clicked. Value is now: true	2013-06-27 22:01:43.263543	2013-06-27 22:01:43.263543
6026	696	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:01:43.662716	2013-06-27 22:01:43.662716
6027	1021	Menu item was shown: bundle 2,4,5	2013-06-27 22:01:43.833625	2013-06-27 22:01:43.833625
6028	1021	Menu item was shown: bundle 3,4,5	2013-06-27 22:01:44.73387	2013-06-27 22:01:44.73387
6029	696	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:01:45.066655	2013-06-27 22:01:45.066655
6030	1021	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:01:45.217321	2013-06-27 22:01:45.217321
6031	1000	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:01:45.821611	2013-06-27 22:01:45.821611
6032	939	Menu item was shown: bundle 2,3	2013-06-27 22:01:45.928056	2013-06-27 22:01:45.928056
6033	1000	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:01:46.451663	2013-06-27 22:01:46.451663
6034	735	Menu item was shown: bundle 1,2	2013-06-27 22:01:46.479853	2013-06-27 22:01:46.479853
6035	234	Combo was clicked. Value is now: true	2013-06-27 22:01:46.667328	2013-06-27 22:01:46.667328
6036	219	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:46.800525	2013-06-27 22:01:46.800525
6037	1000	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:01:46.979151	2013-06-27 22:01:46.979151
6038	219	Menu item was shown: bundle 2,3,4	2013-06-27 22:01:47.48825	2013-06-27 22:01:47.48825
6039	939	Good 2 was clicked. Value is now: true	2013-06-27 22:01:49.127773	2013-06-27 22:01:49.127773
6040	939	Good 3 was clicked. Value is now: true	2013-06-27 22:01:49.452273	2013-06-27 22:01:49.452273
6041	735	Menu item was shown: bundle 1,3	2013-06-27 22:01:49.777868	2013-06-27 22:01:49.777868
6042	735	Menu item was shown: bundle 1,4	2013-06-27 22:01:50.329169	2013-06-27 22:01:50.329169
6043	219	Menu item was shown: bundle 2,3	2013-06-27 22:01:50.74589	2013-06-27 22:01:50.74589
6044	939	Menu item was shown: bundle 1,3	2013-06-27 22:01:51.681965	2013-06-27 22:01:51.681965
6045	1021	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:01:53.846007	2013-06-27 22:01:53.846007
6046	939	Menu item was shown: bundle 1,2	2013-06-27 22:01:54.378202	2013-06-27 22:01:54.378202
6047	735	Good 1 was clicked. Value is now: true	2013-06-27 22:01:54.698017	2013-06-27 22:01:54.698017
6048	1021	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:01:54.737722	2013-06-27 22:01:54.737722
6049	1000	Menu item was shown: bundle 1,3,4	2013-06-27 22:01:54.874518	2013-06-27 22:01:54.874518
6050	1095	Menu item was shown: bundle 1,2,3	2013-06-27 22:01:55.640979	2013-06-27 22:01:55.640979
6051	735	Good 4 was clicked. Value is now: true	2013-06-27 22:01:55.730992	2013-06-27 22:01:55.730992
6052	1021	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:01:55.96884	2013-06-27 22:01:55.96884
6053	735	Menu item was shown: bundle 1,5	2013-06-27 22:01:56.125677	2013-06-27 22:01:56.125677
6054	1095	Menu item was hidden: bundle 1,2,3	2013-06-27 22:01:56.462776	2013-06-27 22:01:56.462776
6055	1021	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:01:56.689994	2013-06-27 22:01:56.689994
6056	696	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:01:56.777586	2013-06-27 22:01:56.777586
6057	1095	Menu item was shown: bundle 1,2	2013-06-27 22:01:58.501772	2013-06-27 22:01:58.501772
6058	696	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:01:59.027501	2013-06-27 22:01:59.027501
6059	1095	Menu item was shown: bundle 1,3	2013-06-27 22:01:59.218583	2013-06-27 22:01:59.218583
6060	735	Menu item was shown: bundle 2,3	2013-06-27 22:01:59.361046	2013-06-27 22:01:59.361046
6061	1095	Menu item was shown: bundle 2,3	2013-06-27 22:01:59.745255	2013-06-27 22:01:59.745255
6062	696	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:02:00.197598	2013-06-27 22:02:00.197598
6063	1000	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:02:01.446268	2013-06-27 22:02:01.446268
6064	735	Menu item was shown: bundle 2,4	2013-06-27 22:02:01.644927	2013-06-27 22:02:01.644927
6065	735	Menu item was shown: bundle 2,5	2013-06-27 22:02:02.338284	2013-06-27 22:02:02.338284
6066	1095	Good 2 was clicked. Value is now: true	2013-06-27 22:02:02.849275	2013-06-27 22:02:02.849275
6067	696	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:02:03.477994	2013-06-27 22:02:03.477994
6068	1095	Good 3 was clicked. Value is now: true	2013-06-27 22:02:03.78508	2013-06-27 22:02:03.78508
6069	939	Menu item was shown: bundle 1,3	2013-06-27 22:02:03.942537	2013-06-27 22:02:03.942537
6070	735	Menu item was shown: bundle 3,4	2013-06-27 22:02:04.050938	2013-06-27 22:02:04.050938
6071	939	Menu item was shown: bundle 2,3	2013-06-27 22:02:06.451004	2013-06-27 22:02:06.451004
6072	735	Good 1 was clicked. Value is now: false	2013-06-27 22:02:08.211664	2013-06-27 22:02:08.211664
6073	939	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:08.427455	2013-06-27 22:02:08.427455
6074	735	Good 3 was clicked. Value is now: true	2013-06-27 22:02:09.1686	2013-06-27 22:02:09.1686
6075	696	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:02:09.6656	2013-06-27 22:02:09.6656
6076	1095	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:10.1858	2013-06-27 22:02:10.1858
6077	1000	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:02:10.212648	2013-06-27 22:02:10.212648
6078	696	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:02:10.275401	2013-06-27 22:02:10.275401
6079	1000	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:02:10.616369	2013-06-27 22:02:10.616369
6080	735	Menu item was shown: bundle 3,5	2013-06-27 22:02:10.663522	2013-06-27 22:02:10.663522
6081	1095	Menu item was shown: bundle 1,3	2013-06-27 22:02:10.752155	2013-06-27 22:02:10.752155
6082	1000	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:02:11.290295	2013-06-27 22:02:11.290295
6083	1095	Menu item was shown: bundle 1,2	2013-06-27 22:02:11.32194	2013-06-27 22:02:11.32194
6084	1095	Menu item was shown: bundle 2,3	2013-06-27 22:02:12.039233	2013-06-27 22:02:12.039233
6085	735	Menu item was shown: bundle 4,5	2013-06-27 22:02:13.107571	2013-06-27 22:02:13.107571
6086	939	Menu item was shown: bundle 2,3	2013-06-27 22:02:13.80605	2013-06-27 22:02:13.80605
6087	735	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:14.511804	2013-06-27 22:02:14.511804
6088	1095	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:16.02282	2013-06-27 22:02:16.02282
6089	735	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:16.342937	2013-06-27 22:02:16.342937
6090	735	Menu item was shown: bundle 1,2,5	2013-06-27 22:02:17.135201	2013-06-27 22:02:17.135201
6091	1095	Menu item was hidden: bundle 1,2,3	2013-06-27 22:02:18.001322	2013-06-27 22:02:18.001322
6092	735	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:18.12121	2013-06-27 22:02:18.12121
6093	1095	Menu item was hidden: bundle 2,3	2013-06-27 22:02:18.968834	2013-06-27 22:02:18.968834
6094	735	Menu item was shown: bundle 1,3,5	2013-06-27 22:02:19.045121	2013-06-27 22:02:19.045121
6095	1095	Menu item was shown: bundle 2,3	2013-06-27 22:02:19.115489	2013-06-27 22:02:19.115489
6096	1000	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:02:19.558554	2013-06-27 22:02:19.558554
6097	735	Menu item was shown: bundle 1,4,5	2013-06-27 22:02:19.721769	2013-06-27 22:02:19.721769
6098	735	Menu item was hidden: bundle 1,4,5	2013-06-27 22:02:20.152577	2013-06-27 22:02:20.152577
6099	696	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:02:20.220252	2013-06-27 22:02:20.220252
6100	696	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:02:20.531283	2013-06-27 22:02:20.531283
6101	735	Menu item was shown: bundle 2,3,5	2013-06-27 22:02:20.70668	2013-06-27 22:02:20.70668
6102	1000	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:02:20.882663	2013-06-27 22:02:20.882663
6103	735	Menu item was shown: bundle 2,3,4	2013-06-27 22:02:21.050532	2013-06-27 22:02:21.050532
6104	1000	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:02:21.882736	2013-06-27 22:02:21.882736
6105	1000	Menu item was shown: bundle 3,4,5	2013-06-27 22:02:22.774715	2013-06-27 22:02:22.774715
6106	1005	Menu item was shown: bundle 1,2	2013-06-27 22:02:23.051573	2013-06-27 22:02:23.051573
6107	1005	Menu item was shown: bundle 1,3	2013-06-27 22:02:23.686408	2013-06-27 22:02:23.686408
6108	1000	Menu item was shown: bundle 2,4,5	2013-06-27 22:02:23.960224	2013-06-27 22:02:23.960224
6109	1005	Menu item was shown: bundle 1,4	2013-06-27 22:02:24.170524	2013-06-27 22:02:24.170524
6110	1000	Menu item was shown: bundle 2,3,5	2013-06-27 22:02:24.892495	2013-06-27 22:02:24.892495
6111	939	Menu item was shown: bundle 1,2	2013-06-27 22:02:25.130175	2013-06-27 22:02:25.130175
6112	735	Menu item was shown: bundle 2,3,5	2013-06-27 22:02:25.372632	2013-06-27 22:02:25.372632
6113	1000	Menu item was shown: bundle 2,3,4	2013-06-27 22:02:25.598953	2013-06-27 22:02:25.598953
6114	1005	Menu item was shown: bundle 2,3	2013-06-27 22:02:26.147616	2013-06-27 22:02:26.147616
6115	1005	Menu item was shown: bundle 2,4	2013-06-27 22:02:27.249456	2013-06-27 22:02:27.249456
6116	1005	Menu item was shown: bundle 3,4	2013-06-27 22:02:28.141911	2013-06-27 22:02:28.141911
6117	696	Good 1 was clicked. Value is now: true	2013-06-27 22:02:28.788524	2013-06-27 22:02:28.788524
6118	1005	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:28.813221	2013-06-27 22:02:28.813221
6119	735	Menu item was shown: bundle 2,4,5	2013-06-27 22:02:29.436176	2013-06-27 22:02:29.436176
6120	1005	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:29.500158	2013-06-27 22:02:29.500158
6121	939	Menu item was shown: bundle 1,3	2013-06-27 22:02:29.694235	2013-06-27 22:02:29.694235
6122	1005	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:29.996626	2013-06-27 22:02:29.996626
6123	696	Good 2 was clicked. Value is now: true	2013-06-27 22:02:30.151763	2013-06-27 22:02:30.151763
6124	1005	Menu item was shown: bundle 2,3,4	2013-06-27 22:02:30.545956	2013-06-27 22:02:30.545956
6125	696	Good 3 was clicked. Value is now: true	2013-06-27 22:02:31.020756	2013-06-27 22:02:31.020756
6126	1000	Menu item was shown: bundle 1,4,5	2013-06-27 22:02:31.249112	2013-06-27 22:02:31.249112
6127	1005	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:02:31.401823	2013-06-27 22:02:31.401823
6128	696	Good 5 was clicked. Value is now: true	2013-06-27 22:02:31.956999	2013-06-27 22:02:31.956999
6129	1000	Menu item was shown: bundle 1,3,5	2013-06-27 22:02:32.836654	2013-06-27 22:02:32.836654
6130	939	Menu item was shown: bundle 2,3	2013-06-27 22:02:33.042464	2013-06-27 22:02:33.042464
6131	1005	Menu item was shown: bundle 1,4	2013-06-27 22:02:33.181781	2013-06-27 22:02:33.181781
6132	735	Good 3 was clicked. Value is now: false	2013-06-27 22:02:34.625612	2013-06-27 22:02:34.625612
6133	1000	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:34.94078	2013-06-27 22:02:34.94078
6134	735	Good 5 was clicked. Value is now: true	2013-06-27 22:02:35.276697	2013-06-27 22:02:35.276697
6135	939	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:35.373538	2013-06-27 22:02:35.373538
6136	1000	Menu item was shown: bundle 1,2,5	2013-06-27 22:02:35.478636	2013-06-27 22:02:35.478636
6137	1000	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:36.26602	2013-06-27 22:02:36.26602
6138	1000	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:36.830403	2013-06-27 22:02:36.830403
6139	735	Menu item was shown: bundle 3,4,5	2013-06-27 22:02:38.64744	2013-06-27 22:02:38.64744
6140	1000	Menu item was shown: bundle 4,5	2013-06-27 22:02:38.946715	2013-06-27 22:02:38.946715
6141	735	Menu item was shown: bundle 2,4,5	2013-06-27 22:02:39.521322	2013-06-27 22:02:39.521322
6142	1000	Menu item was shown: bundle 3,5	2013-06-27 22:02:39.670653	2013-06-27 22:02:39.670653
6143	735	Menu item was shown: bundle 3,4,5	2013-06-27 22:02:39.99603	2013-06-27 22:02:39.99603
6144	909	Menu item was shown: bundle 1,2	2013-06-27 22:02:40.104372	2013-06-27 22:02:40.104372
6145	939	Menu item was shown: bundle 1,2	2013-06-27 22:02:40.369031	2013-06-27 22:02:40.369031
6146	1000	Menu item was shown: bundle 3,4	2013-06-27 22:02:40.50461	2013-06-27 22:02:40.50461
6147	735	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:02:40.689085	2013-06-27 22:02:40.689085
6148	909	Menu item was shown: bundle 1,3	2013-06-27 22:02:41.068058	2013-06-27 22:02:41.068058
6149	939	Menu item was shown: bundle 1,3	2013-06-27 22:02:41.252166	2013-06-27 22:02:41.252166
6150	1000	Menu item was shown: bundle 2,5	2013-06-27 22:02:41.504841	2013-06-27 22:02:41.504841
6151	909	Menu item was shown: bundle 1,4	2013-06-27 22:02:41.618707	2013-06-27 22:02:41.618707
6152	1005	Menu item was shown: bundle 2,3	2013-06-27 22:02:41.985898	2013-06-27 22:02:41.985898
6153	909	Menu item was shown: bundle 1,5	2013-06-27 22:02:42.12962	2013-06-27 22:02:42.12962
6154	1000	Menu item was shown: bundle 2,4	2013-06-27 22:02:43.136597	2013-06-27 22:02:43.136597
6155	1005	Good 2 was clicked. Value is now: true	2013-06-27 22:02:43.993208	2013-06-27 22:02:43.993208
6156	939	Menu item was shown: bundle 2,3	2013-06-27 22:02:44.199804	2013-06-27 22:02:44.199804
6157	909	Menu item was shown: bundle 4,5	2013-06-27 22:02:44.250567	2013-06-27 22:02:44.250567
6158	735	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:02:44.292173	2013-06-27 22:02:44.292173
6159	1005	Good 3 was clicked. Value is now: true	2013-06-27 22:02:44.348407	2013-06-27 22:02:44.348407
6160	909	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:44.753612	2013-06-27 22:02:44.753612
6161	909	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:45.200958	2013-06-27 22:02:45.200958
6162	939	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:45.282001	2013-06-27 22:02:45.282001
6163	909	Menu item was shown: bundle 1,2,5	2013-06-27 22:02:45.528776	2013-06-27 22:02:45.528776
6164	909	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:46.094619	2013-06-27 22:02:46.094619
6165	909	Menu item was shown: bundle 1,3,5	2013-06-27 22:02:46.522813	2013-06-27 22:02:46.522813
6166	735	Combo was clicked. Value is now: true	2013-06-27 22:02:46.748503	2013-06-27 22:02:46.748503
6167	1000	Menu item was shown: bundle 2,3	2013-06-27 22:02:46.801741	2013-06-27 22:02:46.801741
6168	909	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:47.308678	2013-06-27 22:02:47.308678
6169	909	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:47.915391	2013-06-27 22:02:47.915391
6170	1000	Menu item was shown: bundle 1,5	2013-06-27 22:02:48.192022	2013-06-27 22:02:48.192022
6171	909	Menu item was shown: bundle 1,2,5	2013-06-27 22:02:48.313489	2013-06-27 22:02:48.313489
6172	909	Menu item was shown: bundle 1,3,5	2013-06-27 22:02:48.924303	2013-06-27 22:02:48.924303
6173	1000	Menu item was shown: bundle 1,4	2013-06-27 22:02:49.216579	2013-06-27 22:02:49.216579
6174	909	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:49.58043	2013-06-27 22:02:49.58043
6175	909	Menu item was shown: bundle 1,2,3	2013-06-27 22:02:50.200161	2013-06-27 22:02:50.200161
6176	909	Menu item was shown: bundle 1,2,4	2013-06-27 22:02:50.666272	2013-06-27 22:02:50.666272
6177	735	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:02:50.979187	2013-06-27 22:02:50.979187
6178	909	Menu item was shown: bundle 1,2,5	2013-06-27 22:02:51.004273	2013-06-27 22:02:51.004273
6179	909	Menu item was shown: bundle 1,3,4	2013-06-27 22:02:51.670686	2013-06-27 22:02:51.670686
6180	909	Menu item was shown: bundle 1,4,5	2013-06-27 22:02:51.931541	2013-06-27 22:02:51.931541
6181	939	Menu item was shown: bundle 2,3	2013-06-27 22:02:52.257027	2013-06-27 22:02:52.257027
6182	909	Menu item was shown: bundle 1,3,5	2013-06-27 22:02:52.684125	2013-06-27 22:02:52.684125
6183	1000	Menu item was shown: bundle 1,3	2013-06-27 22:02:52.734378	2013-06-27 22:02:52.734378
6184	909	Menu item was shown: bundle 1,4,5	2013-06-27 22:02:53.158271	2013-06-27 22:02:53.158271
6185	909	Menu item was shown: bundle 2,3,4	2013-06-27 22:02:54.134344	2013-06-27 22:02:54.134344
6186	735	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:02:55.624664	2013-06-27 22:02:55.624664
6187	1000	Menu item was shown: bundle 1,2	2013-06-27 22:02:55.774932	2013-06-27 22:02:55.774932
6188	909	Menu item was shown: bundle 2,3,5	2013-06-27 22:02:55.800108	2013-06-27 22:02:55.800108
6189	735	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:02:56.109678	2013-06-27 22:02:56.109678
6190	909	Menu item was shown: bundle 2,4,5	2013-06-27 22:02:56.336797	2013-06-27 22:02:56.336797
6191	735	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:02:56.611378	2013-06-27 22:02:56.611378
6192	909	Menu item was shown: bundle 3,4,5	2013-06-27 22:02:56.736051	2013-06-27 22:02:56.736051
6193	735	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:02:57.111136	2013-06-27 22:02:57.111136
6194	735	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:02:57.690111	2013-06-27 22:02:57.690111
6195	1000	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:02:58.456122	2013-06-27 22:02:58.456122
6196	735	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:02:59.631409	2013-06-27 22:02:59.631409
6197	294	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:00.443686	2013-06-27 22:03:00.443686
6198	294	Menu item was shown: bundle 2,3	2013-06-27 22:03:01.697587	2013-06-27 22:03:01.697587
6199	1109	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:03:02.720167	2013-06-27 22:03:02.720167
6200	1109	Menu item was hidden: bundle 1,2,3,4	2013-06-27 22:03:03.85032	2013-06-27 22:03:03.85032
6201	294	Menu item was shown: bundle 1,3	2013-06-27 22:03:04.525522	2013-06-27 22:03:04.525522
6202	735	Menu item was shown: bundle 3,4,5	2013-06-27 22:03:04.752455	2013-06-27 22:03:04.752455
6203	1109	Menu item was shown: bundle 2,3,4	2013-06-27 22:03:05.380845	2013-06-27 22:03:05.380845
6204	1109	Menu item was shown: bundle 1,3,4	2013-06-27 22:03:06.673727	2013-06-27 22:03:06.673727
6205	1109	Menu item was shown: bundle 1,2,4	2013-06-27 22:03:07.351094	2013-06-27 22:03:07.351094
6206	1109	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:08.136046	2013-06-27 22:03:08.136046
6207	294	Good 1 was clicked. Value is now: true	2013-06-27 22:03:08.221986	2013-06-27 22:03:08.221986
6208	1109	Menu item was shown: bundle 3,4	2013-06-27 22:03:08.543346	2013-06-27 22:03:08.543346
6209	294	Good 3 was clicked. Value is now: true	2013-06-27 22:03:09.164911	2013-06-27 22:03:09.164911
6210	909	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:03:09.275116	2013-06-27 22:03:09.275116
6211	909	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:03:10.918737	2013-06-27 22:03:10.918737
6212	909	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:03:11.444498	2013-06-27 22:03:11.444498
6213	294	Menu item was shown: bundle 1,2	2013-06-27 22:03:11.605012	2013-06-27 22:03:11.605012
6214	909	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:03:12.114408	2013-06-27 22:03:12.114408
6215	1109	Menu item was shown: bundle 2,4	2013-06-27 22:03:13.345702	2013-06-27 22:03:13.345702
6216	294	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:14.778635	2013-06-27 22:03:14.778635
6217	1109	Menu item was shown: bundle 2,3	2013-06-27 22:03:14.89101	2013-06-27 22:03:14.89101
6218	1109	Menu item was shown: bundle 1,4	2013-06-27 22:03:16.684424	2013-06-27 22:03:16.684424
6219	294	Menu item was shown: bundle 2,3	2013-06-27 22:03:18.809528	2013-06-27 22:03:18.809528
6220	909	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:03:19.063232	2013-06-27 22:03:19.063232
6221	1109	Menu item was shown: bundle 1,3	2013-06-27 22:03:19.650211	2013-06-27 22:03:19.650211
6222	1109	Menu item was shown: bundle 1,2	2013-06-27 22:03:19.766243	2013-06-27 22:03:19.766243
6223	909	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:03:20.769718	2013-06-27 22:03:20.769718
6224	909	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:03:22.398415	2013-06-27 22:03:22.398415
6225	1109	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:24.433576	2013-06-27 22:03:24.433576
6226	1109	Menu item was shown: bundle 3,4	2013-06-27 22:03:25.226312	2013-06-27 22:03:25.226312
6227	1109	Good 3 was clicked. Value is now: true	2013-06-27 22:03:28.787652	2013-06-27 22:03:28.787652
6228	1109	Good 4 was clicked. Value is now: true	2013-06-27 22:03:28.920338	2013-06-27 22:03:28.920338
6229	983	Menu item was shown: bundle 1,2	2013-06-27 22:03:29.247033	2013-06-27 22:03:29.247033
6230	294	Menu item was shown: bundle 1,3	2013-06-27 22:03:29.938965	2013-06-27 22:03:29.938965
6231	1109	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:03:30.848153	2013-06-27 22:03:30.848153
6232	1081	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:31.926229	2013-06-27 22:03:31.926229
6233	983	Menu item was shown: bundle 1,3	2013-06-27 22:03:32.372954	2013-06-27 22:03:32.372954
6234	1109	Menu item was shown: bundle 2,3,4	2013-06-27 22:03:32.601471	2013-06-27 22:03:32.601471
6235	1081	Menu item was shown: bundle 2,3	2013-06-27 22:03:33.452188	2013-06-27 22:03:33.452188
6236	983	Menu item was shown: bundle 2,3	2013-06-27 22:03:34.649863	2013-06-27 22:03:34.649863
6237	983	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:35.527642	2013-06-27 22:03:35.527642
6238	983	Menu item was shown: bundle 1,2	2013-06-27 22:03:36.353659	2013-06-27 22:03:36.353659
6239	1081	Good 3 was clicked. Value is now: true	2013-06-27 22:03:36.590644	2013-06-27 22:03:36.590644
6240	1081	Good 2 was clicked. Value is now: true	2013-06-27 22:03:37.147275	2013-06-27 22:03:37.147275
6241	983	Menu item was shown: bundle 1,3	2013-06-27 22:03:37.225152	2013-06-27 22:03:37.225152
6242	983	Menu item was shown: bundle 2,3	2013-06-27 22:03:37.626006	2013-06-27 22:03:37.626006
6243	1109	Menu item was shown: bundle 1,3,4	2013-06-27 22:03:38.317452	2013-06-27 22:03:38.317452
6244	983	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:38.637412	2013-06-27 22:03:38.637412
6245	1081	Menu item was shown: bundle 1,3	2013-06-27 22:03:38.755192	2013-06-27 22:03:38.755192
6246	1081	Menu item was shown: bundle 2,3	2013-06-27 22:03:42.112775	2013-06-27 22:03:42.112775
6247	983	Menu item was shown: bundle 2,3	2013-06-27 22:03:42.474426	2013-06-27 22:03:42.474426
6248	1081	Menu item was shown: bundle 1,3	2013-06-27 22:03:43.328909	2013-06-27 22:03:43.328909
6249	983	Menu item was shown: bundle 1,3	2013-06-27 22:03:43.495945	2013-06-27 22:03:43.495945
6250	983	Menu item was shown: bundle 1,2	2013-06-27 22:03:44.002983	2013-06-27 22:03:44.002983
6251	1109	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:44.864346	2013-06-27 22:03:44.864346
6252	1081	Menu item was shown: bundle 1,2	2013-06-27 22:03:46.489886	2013-06-27 22:03:46.489886
6253	1109	Menu item was shown: bundle 1,2,4	2013-06-27 22:03:46.694435	2013-06-27 22:03:46.694435
6254	1081	Menu item was shown: bundle 1,3	2013-06-27 22:03:48.010728	2013-06-27 22:03:48.010728
6255	971	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:48.960227	2013-06-27 22:03:48.960227
6256	971	Menu item was shown: bundle 2,3	2013-06-27 22:03:49.965937	2013-06-27 22:03:49.965937
6257	971	Menu item was shown: bundle 1,3	2013-06-27 22:03:50.561159	2013-06-27 22:03:50.561159
6258	971	Menu item was shown: bundle 1,2	2013-06-27 22:03:50.922667	2013-06-27 22:03:50.922667
6259	971	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:51.731914	2013-06-27 22:03:51.731914
6260	1109	Menu item was shown: bundle 1,3,4	2013-06-27 22:03:52.439128	2013-06-27 22:03:52.439128
6261	971	Menu item was shown: bundle 1,2	2013-06-27 22:03:53.293542	2013-06-27 22:03:53.293542
6262	971	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:54.044015	2013-06-27 22:03:54.044015
6263	971	Combo was clicked. Value is now: true	2013-06-27 22:03:54.884476	2013-06-27 22:03:54.884476
6264	1109	Menu item was shown: bundle 2,3,4	2013-06-27 22:03:57.764581	2013-06-27 22:03:57.764581
6265	1109	Menu item was shown: bundle 1,2,3	2013-06-27 22:03:58.496738	2013-06-27 22:03:58.496738
6266	1109	Menu item was shown: bundle 3,4	2013-06-27 22:03:59.291238	2013-06-27 22:03:59.291238
6267	1109	Menu item was shown: bundle 2,4	2013-06-27 22:04:02.642759	2013-06-27 22:04:02.642759
6268	1109	Menu item was shown: bundle 2,3	2013-06-27 22:04:06.723801	2013-06-27 22:04:06.723801
6269	1109	Menu item was shown: bundle 1,4	2013-06-27 22:04:09.267921	2013-06-27 22:04:09.267921
6270	203	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:09.705101	2013-06-27 22:04:09.705101
6271	1109	Menu item was shown: bundle 1,3	2013-06-27 22:04:12.466058	2013-06-27 22:04:12.466058
6272	203	Good 1 was clicked. Value is now: true	2013-06-27 22:04:12.575352	2013-06-27 22:04:12.575352
6273	203	Good 2 was clicked. Value is now: true	2013-06-27 22:04:12.954997	2013-06-27 22:04:12.954997
6274	203	Good 3 was clicked. Value is now: true	2013-06-27 22:04:13.251468	2013-06-27 22:04:13.251468
6275	1109	Menu item was shown: bundle 1,2	2013-06-27 22:04:19.370725	2013-06-27 22:04:19.370725
6276	907	Combo was clicked. Value is now: true	2013-06-27 22:04:22.441082	2013-06-27 22:04:22.441082
6277	907	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:04:24.084136	2013-06-27 22:04:24.084136
6278	1109	Menu item was shown: bundle 1,2,4	2013-06-27 22:04:25.329707	2013-06-27 22:04:25.329707
6279	1109	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:25.840736	2013-06-27 22:04:25.840736
6280	1121	Menu item was shown: bundle 1,2	2013-06-27 22:04:25.894738	2013-06-27 22:04:25.894738
6281	1109	Menu item was shown: bundle 3,4	2013-06-27 22:04:26.424842	2013-06-27 22:04:26.424842
6282	1121	Menu item was hidden: bundle 1,2	2013-06-27 22:04:26.717335	2013-06-27 22:04:26.717335
6283	1121	Menu item was shown: bundle 1,3	2013-06-27 22:04:27.22654	2013-06-27 22:04:27.22654
6284	1121	Menu item was hidden: bundle 1,3	2013-06-27 22:04:27.866172	2013-06-27 22:04:27.866172
6285	1121	Menu item was shown: bundle 2,3	2013-06-27 22:04:28.208667	2013-06-27 22:04:28.208667
6286	1121	Menu item was hidden: bundle 2,3	2013-06-27 22:04:28.72996	2013-06-27 22:04:28.72996
6287	1121	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:29.632988	2013-06-27 22:04:29.632988
6288	1121	Menu item was hidden: bundle 1,2,3	2013-06-27 22:04:30.404023	2013-06-27 22:04:30.404023
6289	1121	Menu item was shown: bundle 1,2	2013-06-27 22:04:30.984509	2013-06-27 22:04:30.984509
6290	907	Menu item was shown: bundle 2,4	2013-06-27 22:04:31.067788	2013-06-27 22:04:31.067788
6291	1121	Menu item was hidden: bundle 1,2	2013-06-27 22:04:31.629012	2013-06-27 22:04:31.629012
6292	1121	Good 1 was clicked. Value is now: true	2013-06-27 22:04:33.208219	2013-06-27 22:04:33.208219
6293	1121	Good 2 was clicked. Value is now: true	2013-06-27 22:04:33.497714	2013-06-27 22:04:33.497714
6294	907	Good 4 was clicked. Value is now: true	2013-06-27 22:04:34.005016	2013-06-27 22:04:34.005016
6295	907	Good 2 was clicked. Value is now: true	2013-06-27 22:04:34.404104	2013-06-27 22:04:34.404104
6296	535	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:37.147492	2013-06-27 22:04:37.147492
6297	1045	Menu item was shown: bundle 1,2	2013-06-27 22:04:37.176356	2013-06-27 22:04:37.176356
6298	907	Menu item was shown: bundle 1,2	2013-06-27 22:04:39.285851	2013-06-27 22:04:39.285851
6299	535	Menu item was shown: bundle 2,3	2013-06-27 22:04:40.948902	2013-06-27 22:04:40.948902
6300	535	Menu item was shown: bundle 1,3	2013-06-27 22:04:42.040455	2013-06-27 22:04:42.040455
6301	1045	Menu item was shown: bundle 1,3	2013-06-27 22:04:42.304845	2013-06-27 22:04:42.304845
6302	907	Good 1 was clicked. Value is now: true	2013-06-27 22:04:42.641272	2013-06-27 22:04:42.641272
6303	1045	Menu item was shown: bundle 1,4	2013-06-27 22:04:43.148119	2013-06-27 22:04:43.148119
6304	907	Good 4 was clicked. Value is now: false	2013-06-27 22:04:44.020814	2013-06-27 22:04:44.020814
6305	535	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:45.962805	2013-06-27 22:04:45.962805
6306	693	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:04:46.197988	2013-06-27 22:04:46.197988
6307	907	Menu item was shown: bundle 1,3	2013-06-27 22:04:46.935344	2013-06-27 22:04:46.935344
6308	693	Menu item was shown: bundle 2,3,4	2013-06-27 22:04:47.508749	2013-06-27 22:04:47.508749
6309	1045	Menu item was shown: bundle 2,3	2013-06-27 22:04:47.932318	2013-06-27 22:04:47.932318
6310	907	Menu item was shown: bundle 1,2	2013-06-27 22:04:49.34241	2013-06-27 22:04:49.34241
6311	907	Menu item was hidden: bundle 1,2	2013-06-27 22:04:49.952114	2013-06-27 22:04:49.952114
6312	1045	Menu item was shown: bundle 2,4	2013-06-27 22:04:49.990455	2013-06-27 22:04:49.990455
6313	907	Menu item was shown: bundle 1,2	2013-06-27 22:04:50.984041	2013-06-27 22:04:50.984041
6314	907	Menu item was shown: bundle 1,4	2013-06-27 22:04:52.020626	2013-06-27 22:04:52.020626
6315	1045	Menu item was shown: bundle 3,4	2013-06-27 22:04:53.430496	2013-06-27 22:04:53.430496
6316	535	Menu item was shown: bundle 2,3	2013-06-27 22:04:54.168263	2013-06-27 22:04:54.168263
6317	907	Menu item was shown: bundle 2,3	2013-06-27 22:04:54.266526	2013-06-27 22:04:54.266526
6318	535	Menu item was shown: bundle 1,3	2013-06-27 22:04:54.833147	2013-06-27 22:04:54.833147
6319	907	Menu item was shown: bundle 2,4	2013-06-27 22:04:55.23942	2013-06-27 22:04:55.23942
6320	907	Menu item was shown: bundle 2,3	2013-06-27 22:04:56.20989	2013-06-27 22:04:56.20989
6321	1045	Menu item was shown: bundle 1,2,3	2013-06-27 22:04:56.905872	2013-06-27 22:04:56.905872
6322	412	Good 1 was clicked. Value is now: true	2013-06-27 22:04:56.947821	2013-06-27 22:04:56.947821
6323	412	Menu item was shown: bundle 1,2	2013-06-27 22:04:57.656244	2013-06-27 22:04:57.656244
6324	412	Good 2 was clicked. Value is now: true	2013-06-27 22:04:59.445596	2013-06-27 22:04:59.445596
6325	907	Menu item was shown: bundle 2,4	2013-06-27 22:04:59.563265	2013-06-27 22:04:59.563265
6326	535	Menu item was shown: bundle 1,2	2013-06-27 22:05:00.855536	2013-06-27 22:05:00.855536
6327	412	Menu item was shown: bundle 1,3	2013-06-27 22:05:00.944503	2013-06-27 22:05:00.944503
6328	247	Good 4 was clicked. Value is now: true	2013-06-27 22:05:01.441362	2013-06-27 22:05:01.441362
6329	535	Good 1 was clicked. Value is now: true	2013-06-27 22:05:02.431732	2013-06-27 22:05:02.431732
6330	412	Menu item was shown: bundle 2,3	2013-06-27 22:05:02.524902	2013-06-27 22:05:02.524902
6331	535	Good 3 was clicked. Value is now: true	2013-06-27 22:05:02.950365	2013-06-27 22:05:02.950365
6332	1045	Menu item was shown: bundle 1,2,4	2013-06-27 22:05:03.103476	2013-06-27 22:05:03.103476
6333	247	Combo was clicked. Value is now: true	2013-06-27 22:05:03.18108	2013-06-27 22:05:03.18108
6334	412	Menu item was shown: bundle 1,2,3	2013-06-27 22:05:03.366228	2013-06-27 22:05:03.366228
6335	535	Menu item was shown: bundle 2,3	2013-06-27 22:05:03.784312	2013-06-27 22:05:03.784312
6336	247	Menu item was shown: bundle 1,2	2013-06-27 22:05:04.023783	2013-06-27 22:05:04.023783
6337	535	Menu item was shown: bundle 1,3	2013-06-27 22:05:04.366115	2013-06-27 22:05:04.366115
6338	1045	Menu item was shown: bundle 1,3,4	2013-06-27 22:05:04.795872	2013-06-27 22:05:04.795872
6339	247	Menu item was shown: bundle 1,3	2013-06-27 22:05:05.321737	2013-06-27 22:05:05.321737
6340	1045	Menu item was shown: bundle 2,3,4	2013-06-27 22:05:05.668573	2013-06-27 22:05:05.668573
6341	247	Menu item was shown: bundle 1,4	2013-06-27 22:05:06.281704	2013-06-27 22:05:06.281704
6342	1045	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:05:06.462686	2013-06-27 22:05:06.462686
6343	247	Menu item was shown: bundle 1,5	2013-06-27 22:05:07.42431	2013-06-27 22:05:07.42431
6344	412	Menu item was shown: bundle 1,2	2013-06-27 22:05:07.722077	2013-06-27 22:05:07.722077
6345	907	Menu item was shown: bundle 3,4	2013-06-27 22:05:07.98596	2013-06-27 22:05:07.98596
6346	247	Menu item was shown: bundle 2,3	2013-06-27 22:05:08.123449	2013-06-27 22:05:08.123449
6347	247	Menu item was shown: bundle 2,4	2013-06-27 22:05:09.178909	2013-06-27 22:05:09.178909
6348	952	Menu item was shown: bundle 1,2	2013-06-27 22:05:09.428132	2013-06-27 22:05:09.428132
6349	247	Menu item was shown: bundle 2,5	2013-06-27 22:05:10.319112	2013-06-27 22:05:10.319112
6350	907	Menu item was shown: bundle 1,2,3	2013-06-27 22:05:10.574946	2013-06-27 22:05:10.574946
6351	247	Menu item was shown: bundle 3,4	2013-06-27 22:05:12.105911	2013-06-27 22:05:12.105911
6352	247	Menu item was shown: bundle 3,5	2013-06-27 22:05:12.806661	2013-06-27 22:05:12.806661
6353	952	Menu item was shown: bundle 1,3	2013-06-27 22:05:13.281313	2013-06-27 22:05:13.281313
6354	247	Menu item was shown: bundle 4,5	2013-06-27 22:05:13.936862	2013-06-27 22:05:13.936862
6355	1045	Good 1 was clicked. Value is now: true	2013-06-27 22:05:14.137589	2013-06-27 22:05:14.137589
6356	1045	Good 2 was clicked. Value is now: true	2013-06-27 22:05:14.660327	2013-06-27 22:05:14.660327
6357	1045	Good 3 was clicked. Value is now: true	2013-06-27 22:05:15.257961	2013-06-27 22:05:15.257961
6358	1045	Good 4 was clicked. Value is now: true	2013-06-27 22:05:15.663625	2013-06-27 22:05:15.663625
6359	952	Menu item was shown: bundle 2,3	2013-06-27 22:05:16.008487	2013-06-27 22:05:16.008487
6360	247	Good 4 was clicked. Value is now: true	2013-06-27 22:05:16.82448	2013-06-27 22:05:16.82448
6361	1020	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:05:16.875785	2013-06-27 22:05:16.875785
6362	952	Menu item was shown: bundle 1,2,3	2013-06-27 22:05:18.41161	2013-06-27 22:05:18.41161
6363	907	Menu item was shown: bundle 1,2,4	2013-06-27 22:05:18.847591	2013-06-27 22:05:18.847591
6364	247	Menu item was shown: bundle 1,2,3	2013-06-27 22:05:18.880519	2013-06-27 22:05:18.880519
6365	1020	Menu item was shown: bundle 1,2	2013-06-27 22:05:20.037346	2013-06-27 22:05:20.037346
6366	247	Menu item was shown: bundle 1,2,4	2013-06-27 22:05:20.257559	2013-06-27 22:05:20.257559
6367	412	Menu item was shown: bundle 1,3	2013-06-27 22:05:20.613597	2013-06-27 22:05:20.613597
6368	1020	Menu item was shown: bundle 1,3	2013-06-27 22:05:20.699804	2013-06-27 22:05:20.699804
6369	247	Menu item was shown: bundle 1,2,5	2013-06-27 22:05:21.076157	2013-06-27 22:05:21.076157
6370	247	Menu item was shown: bundle 1,3,4	2013-06-27 22:05:22.018558	2013-06-27 22:05:22.018558
6371	907	Menu item was shown: bundle 1,3,4	2013-06-27 22:05:22.215975	2013-06-27 22:05:22.215975
6372	952	Menu item was shown: bundle 1,2	2013-06-27 22:05:22.301047	2013-06-27 22:05:22.301047
6373	412	Menu item was shown: bundle 1,2	2013-06-27 22:05:23.445473	2013-06-27 22:05:23.445473
6374	1020	Menu item was shown: bundle 1,4	2013-06-27 22:05:23.476704	2013-06-27 22:05:23.476704
6375	952	Combo was clicked. Value is now: true	2013-06-27 22:05:23.7942	2013-06-27 22:05:23.7942
6376	952	Menu item was shown: bundle 1,3	2013-06-27 22:05:24.894927	2013-06-27 22:05:24.894927
6377	247	Menu item was shown: bundle 1,3,5	2013-06-27 22:05:25.368878	2013-06-27 22:05:25.368878
6378	247	Menu item was shown: bundle 1,4,5	2013-06-27 22:05:26.316617	2013-06-27 22:05:26.316617
6379	907	Menu item was shown: bundle 2,3,4	2013-06-27 22:05:28.165883	2013-06-27 22:05:28.165883
6380	247	Menu item was shown: bundle 2,3,4	2013-06-27 22:05:28.492599	2013-06-27 22:05:28.492599
6381	1020	Good 1 was clicked. Value is now: true	2013-06-27 22:05:28.602613	2013-06-27 22:05:28.602613
6382	907	Menu item was shown: bundle 1,3,4	2013-06-27 22:05:28.816951	2013-06-27 22:05:28.816951
6383	247	Menu item was shown: bundle 2,3,5	2013-06-27 22:05:29.614034	2013-06-27 22:05:29.614034
6384	1020	Good 4 was clicked. Value is now: true	2013-06-27 22:05:29.659	2013-06-27 22:05:29.659
6385	1020	Menu item was shown: bundle 1,5	2013-06-27 22:05:31.063199	2013-06-27 22:05:31.063199
6386	1020	Menu item was shown: bundle 2,3	2013-06-27 22:05:32.181537	2013-06-27 22:05:32.181537
6387	247	Menu item was shown: bundle 2,4,5	2013-06-27 22:05:32.232695	2013-06-27 22:05:32.232695
6388	1020	Menu item was shown: bundle 2,4	2013-06-27 22:05:33.55702	2013-06-27 22:05:33.55702
6389	247	Menu item was shown: bundle 3,4,5	2013-06-27 22:05:34.07102	2013-06-27 22:05:34.07102
6390	1020	Menu item was shown: bundle 2,5	2013-06-27 22:05:34.614876	2013-06-27 22:05:34.614876
6391	247	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:05:35.026294	2013-06-27 22:05:35.026294
6392	247	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:05:36.186667	2013-06-27 22:05:36.186667
6393	1020	Menu item was shown: bundle 3,4	2013-06-27 22:05:36.481305	2013-06-27 22:05:36.481305
6394	247	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:05:37.721309	2013-06-27 22:05:37.721309
6395	1020	Menu item was shown: bundle 2,5	2013-06-27 22:05:37.862918	2013-06-27 22:05:37.862918
6396	247	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:05:37.995841	2013-06-27 22:05:37.995841
6397	247	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:05:38.774397	2013-06-27 22:05:38.774397
6398	247	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:05:39.645015	2013-06-27 22:05:39.645015
6399	952	Menu item was shown: bundle 2,3	2013-06-27 22:05:40.085896	2013-06-27 22:05:40.085896
6400	1020	Menu item was shown: bundle 3,4	2013-06-27 22:05:41.150657	2013-06-27 22:05:41.150657
6401	952	Menu item was shown: bundle 1,2,3	2013-06-27 22:05:42.13056	2013-06-27 22:05:42.13056
6402	1020	Menu item was shown: bundle 3,5	2013-06-27 22:05:44.117846	2013-06-27 22:05:44.117846
6403	1020	Menu item was shown: bundle 4,5	2013-06-27 22:05:44.951833	2013-06-27 22:05:44.951833
6404	1020	Good 5 was clicked. Value is now: true	2013-06-27 22:05:50.910533	2013-06-27 22:05:50.910533
6405	907	Menu item was shown: bundle 1,2	2013-06-27 22:05:51.438687	2013-06-27 22:05:51.438687
6406	1020	Good 1 was clicked. Value is now: false	2013-06-27 22:05:51.661182	2013-06-27 22:05:51.661182
6407	1020	Menu item was shown: bundle 1,4	2013-06-27 22:05:54.267992	2013-06-27 22:05:54.267992
6408	1020	Menu item was shown: bundle 4,5	2013-06-27 22:05:59.53631	2013-06-27 22:05:59.53631
6409	1020	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:01.858174	2013-06-27 22:06:01.858174
6410	233	Menu item was shown: bundle 1,2	2013-06-27 22:06:04.454118	2013-06-27 22:06:04.454118
6411	1020	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:06.24437	2013-06-27 22:06:06.24437
6412	1020	Menu item was shown: bundle 1,2,5	2013-06-27 22:06:08.002739	2013-06-27 22:06:08.002739
6413	233	Menu item was shown: bundle 1,3	2013-06-27 22:06:08.803172	2013-06-27 22:06:08.803172
6414	907	Menu item was shown: bundle 1,3	2013-06-27 22:06:10.41511	2013-06-27 22:06:10.41511
6415	907	Menu item was shown: bundle 1,2	2013-06-27 22:06:11.246551	2013-06-27 22:06:11.246551
6416	233	Menu item was shown: bundle 1,4	2013-06-27 22:06:11.845641	2013-06-27 22:06:11.845641
6417	907	Menu item was shown: bundle 1,3	2013-06-27 22:06:12.019673	2013-06-27 22:06:12.019673
6418	1020	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:13.194771	2013-06-27 22:06:13.194771
6419	1020	Menu item was shown: bundle 1,3,5	2013-06-27 22:06:14.59452	2013-06-27 22:06:14.59452
6420	233	Menu item was shown: bundle 1,5	2013-06-27 22:06:14.621781	2013-06-27 22:06:14.621781
6421	1020	Menu item was shown: bundle 1,4,5	2013-06-27 22:06:15.655344	2013-06-27 22:06:15.655344
6422	907	Menu item was shown: bundle 1,4	2013-06-27 22:06:16.279708	2013-06-27 22:06:16.279708
6423	233	Menu item was shown: bundle 2,3	2013-06-27 22:06:16.4801	2013-06-27 22:06:16.4801
6424	907	Menu item was shown: bundle 2,3	2013-06-27 22:06:17.251702	2013-06-27 22:06:17.251702
6425	233	Menu item was shown: bundle 2,4	2013-06-27 22:06:19.802893	2013-06-27 22:06:19.802893
6426	907	Menu item was shown: bundle 2,4	2013-06-27 22:06:20.536719	2013-06-27 22:06:20.536719
6427	233	Menu item was shown: bundle 2,5	2013-06-27 22:06:21.006117	2013-06-27 22:06:21.006117
6428	940	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:21.776154	2013-06-27 22:06:21.776154
6429	233	Menu item was shown: bundle 3,4	2013-06-27 22:06:23.166567	2013-06-27 22:06:23.166567
6430	1020	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:24.208706	2013-06-27 22:06:24.208706
6431	940	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:24.305099	2013-06-27 22:06:24.305099
6432	1020	Menu item was shown: bundle 2,3,5	2013-06-27 22:06:24.825962	2013-06-27 22:06:24.825962
6433	907	Menu item was shown: bundle 3,4	2013-06-27 22:06:25.174261	2013-06-27 22:06:25.174261
6434	1020	Menu item was shown: bundle 2,4,5	2013-06-27 22:06:25.461978	2013-06-27 22:06:25.461978
6435	999	Combo was clicked. Value is now: true	2013-06-27 22:06:25.659601	2013-06-27 22:06:25.659601
6436	999	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:26.68041	2013-06-27 22:06:26.68041
6437	999	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:27.510303	2013-06-27 22:06:27.510303
6438	233	Menu item was shown: bundle 3,5	2013-06-27 22:06:28.009591	2013-06-27 22:06:28.009591
6439	999	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:28.646323	2013-06-27 22:06:28.646323
6440	907	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:29.208494	2013-06-27 22:06:29.208494
6441	940	Good 2 was clicked. Value is now: true	2013-06-27 22:06:29.339826	2013-06-27 22:06:29.339826
6442	999	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:29.574293	2013-06-27 22:06:29.574293
6443	233	Menu item was shown: bundle 4,5	2013-06-27 22:06:29.614249	2013-06-27 22:06:29.614249
6444	1020	Menu item was shown: bundle 3,4,5	2013-06-27 22:06:29.720793	2013-06-27 22:06:29.720793
6445	940	Good 3 was clicked. Value is now: true	2013-06-27 22:06:29.769938	2013-06-27 22:06:29.769938
6446	999	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:30.022728	2013-06-27 22:06:30.022728
6447	940	Good 4 was clicked. Value is now: true	2013-06-27 22:06:30.10832	2013-06-27 22:06:30.10832
6448	1020	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:30.4012	2013-06-27 22:06:30.4012
6449	1020	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:06:31.50442	2013-06-27 22:06:31.50442
6450	233	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:32.231571	2013-06-27 22:06:32.231571
6451	1020	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:06:33.668609	2013-06-27 22:06:33.668609
6452	907	Menu item was shown: bundle 1,2	2013-06-27 22:06:35.229428	2013-06-27 22:06:35.229428
6453	218	Good 1 was clicked. Value is now: true	2013-06-27 22:06:35.957847	2013-06-27 22:06:35.957847
6454	1020	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:06:36.020031	2013-06-27 22:06:36.020031
6455	218	Good 2 was clicked. Value is now: true	2013-06-27 22:06:36.267523	2013-06-27 22:06:36.267523
6456	233	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:36.337194	2013-06-27 22:06:36.337194
6457	907	Menu item was shown: bundle 3,4	2013-06-27 22:06:36.569428	2013-06-27 22:06:36.569428
6458	218	Good 3 was clicked. Value is now: true	2013-06-27 22:06:36.624745	2013-06-27 22:06:36.624745
6459	907	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:36.896247	2013-06-27 22:06:36.896247
6460	940	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:36.952433	2013-06-27 22:06:36.952433
6461	907	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:37.689403	2013-06-27 22:06:37.689403
6462	999	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:37.757628	2013-06-27 22:06:37.757628
6463	907	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:38.329456	2013-06-27 22:06:38.329456
6464	218	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:38.756235	2013-06-27 22:06:38.756235
6465	999	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:40.090648	2013-06-27 22:06:40.090648
6466	999	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:40.414336	2013-06-27 22:06:40.414336
6467	907	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:41.194796	2013-06-27 22:06:41.194796
6468	999	Menu item was shown: bundle 3,4	2013-06-27 22:06:41.240329	2013-06-27 22:06:41.240329
6469	1020	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:06:41.85913	2013-06-27 22:06:41.85913
6470	999	Menu item was shown: bundle 2,4	2013-06-27 22:06:41.898458	2013-06-27 22:06:41.898458
6471	999	Menu item was shown: bundle 2,3	2013-06-27 22:06:42.732723	2013-06-27 22:06:42.732723
6472	218	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:43.010723	2013-06-27 22:06:43.010723
6473	218	Menu item was hidden: bundle 1,2,3,4	2013-06-27 22:06:43.517494	2013-06-27 22:06:43.517494
6474	233	Menu item was shown: bundle 1,2,5	2013-06-27 22:06:44.401051	2013-06-27 22:06:44.401051
6475	736	Menu item was shown: bundle 1,2	2013-06-27 22:06:44.723451	2013-06-27 22:06:44.723451
6476	999	Menu item was shown: bundle 1,4	2013-06-27 22:06:45.33889	2013-06-27 22:06:45.33889
6477	218	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:46.244278	2013-06-27 22:06:46.244278
6478	999	Menu item was shown: bundle 1,3	2013-06-27 22:06:46.289798	2013-06-27 22:06:46.289798
6479	940	Good 1 was clicked. Value is now: true	2013-06-27 22:06:46.651876	2013-06-27 22:06:46.651876
6480	218	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:46.73761	2013-06-27 22:06:46.73761
6481	999	Menu item was shown: bundle 1,2	2013-06-27 22:06:47.052909	2013-06-27 22:06:47.052909
6482	940	Good 2 was clicked. Value is now: false	2013-06-27 22:06:47.232086	2013-06-27 22:06:47.232086
6483	233	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:49.497313	2013-06-27 22:06:49.497313
6484	736	Menu item was shown: bundle 1,3	2013-06-27 22:06:49.797656	2013-06-27 22:06:49.797656
6485	736	Menu item was shown: bundle 2,3	2013-06-27 22:06:50.27768	2013-06-27 22:06:50.27768
6486	999	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:06:50.816573	2013-06-27 22:06:50.816573
6487	736	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:50.954977	2013-06-27 22:06:50.954977
6488	940	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:52.351055	2013-06-27 22:06:52.351055
6489	218	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:53.066846	2013-06-27 22:06:53.066846
6490	233	Menu item was shown: bundle 1,3,5	2013-06-27 22:06:53.421174	2013-06-27 22:06:53.421174
6491	999	Menu item was shown: bundle 2,3,4	2013-06-27 22:06:55.782313	2013-06-27 22:06:55.782313
6492	999	Menu item was shown: bundle 1,3,4	2013-06-27 22:06:57.568745	2013-06-27 22:06:57.568745
6493	940	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:58.149755	2013-06-27 22:06:58.149755
6494	999	Menu item was shown: bundle 1,2,4	2013-06-27 22:06:58.771812	2013-06-27 22:06:58.771812
6495	218	Menu item was shown: bundle 1,2,3	2013-06-27 22:06:59.508075	2013-06-27 22:06:59.508075
6496	907	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:07:00.539528	2013-06-27 22:07:00.539528
6497	999	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:02.475414	2013-06-27 22:07:02.475414
6498	736	Good 1 was clicked. Value is now: true	2013-06-27 22:07:02.534582	2013-06-27 22:07:02.534582
6499	736	Good 2 was clicked. Value is now: true	2013-06-27 22:07:03.038632	2013-06-27 22:07:03.038632
6500	940	Menu item was shown: bundle 3,4	2013-06-27 22:07:03.36698	2013-06-27 22:07:03.36698
6501	736	Good 3 was clicked. Value is now: true	2013-06-27 22:07:03.479874	2013-06-27 22:07:03.479874
6502	999	Menu item was shown: bundle 3,4	2013-06-27 22:07:03.52716	2013-06-27 22:07:03.52716
6503	999	Menu item was shown: bundle 2,4	2013-06-27 22:07:04.188995	2013-06-27 22:07:04.188995
6504	218	Good 2 was clicked. Value is now: false	2013-06-27 22:07:04.666865	2013-06-27 22:07:04.666865
6505	999	Menu item was shown: bundle 2,3	2013-06-27 22:07:04.995834	2013-06-27 22:07:04.995834
6506	218	Good 4 was clicked. Value is now: true	2013-06-27 22:07:05.145352	2013-06-27 22:07:05.145352
6507	218	Menu item was shown: bundle 1,3,4	2013-06-27 22:07:06.54145	2013-06-27 22:07:06.54145
6508	940	Menu item was shown: bundle 2,4	2013-06-27 22:07:06.962642	2013-06-27 22:07:06.962642
6509	999	Menu item was shown: bundle 1,4	2013-06-27 22:07:07.071053	2013-06-27 22:07:07.071053
6510	999	Menu item was shown: bundle 1,3	2013-06-27 22:07:08.387913	2013-06-27 22:07:08.387913
6511	1004	Menu item was shown: bundle 1,2	2013-06-27 22:07:09.354126	2013-06-27 22:07:09.354126
6512	999	Menu item was shown: bundle 1,2	2013-06-27 22:07:09.440251	2013-06-27 22:07:09.440251
6513	1004	Menu item was shown: bundle 1,3	2013-06-27 22:07:09.842062	2013-06-27 22:07:09.842062
6514	940	Menu item was shown: bundle 2,3	2013-06-27 22:07:10.346917	2013-06-27 22:07:10.346917
6515	1004	Menu item was shown: bundle 2,3	2013-06-27 22:07:10.398628	2013-06-27 22:07:10.398628
6516	218	Menu item was shown: bundle 1,2,4	2013-06-27 22:07:11.239876	2013-06-27 22:07:11.239876
6517	218	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:11.615344	2013-06-27 22:07:11.615344
6518	1004	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:11.677292	2013-06-27 22:07:11.677292
6519	218	Menu item was shown: bundle 1,2,4	2013-06-27 22:07:12.181476	2013-06-27 22:07:12.181476
6520	940	Menu item was shown: bundle 1,4	2013-06-27 22:07:12.969791	2013-06-27 22:07:12.969791
6521	233	Menu item was shown: bundle 2,4,5	2013-06-27 22:07:13.607304	2013-06-27 22:07:13.607304
6522	1004	Menu item was shown: bundle 1,2	2013-06-27 22:07:15.14447	2013-06-27 22:07:15.14447
6523	218	Good 2 was clicked. Value is now: true	2013-06-27 22:07:15.270938	2013-06-27 22:07:15.270938
6524	940	Menu item was shown: bundle 1,3	2013-06-27 22:07:15.307594	2013-06-27 22:07:15.307594
6525	218	Good 3 was clicked. Value is now: false	2013-06-27 22:07:15.559507	2013-06-27 22:07:15.559507
6526	1004	Menu item was shown: bundle 1,3	2013-06-27 22:07:16.582082	2013-06-27 22:07:16.582082
6527	1004	Menu item was shown: bundle 2,3	2013-06-27 22:07:17.522987	2013-06-27 22:07:17.522987
6528	233	Menu item was shown: bundle 2,3,5	2013-06-27 22:07:17.970989	2013-06-27 22:07:17.970989
6529	940	Menu item was shown: bundle 1,2	2013-06-27 22:07:18.004334	2013-06-27 22:07:18.004334
6530	218	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:19.227591	2013-06-27 22:07:19.227591
6531	1004	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:20.042915	2013-06-27 22:07:20.042915
6532	218	Menu item was shown: bundle 2,4	2013-06-27 22:07:20.379771	2013-06-27 22:07:20.379771
6533	218	Menu item was shown: bundle 2,3	2013-06-27 22:07:20.713253	2013-06-27 22:07:20.713253
6534	218	Menu item was shown: bundle 1,4	2013-06-27 22:07:21.330152	2013-06-27 22:07:21.330152
6535	1004	Combo was clicked. Value is now: true	2013-06-27 22:07:21.64325	2013-06-27 22:07:21.64325
6536	218	Menu item was shown: bundle 1,3	2013-06-27 22:07:21.794604	2013-06-27 22:07:21.794604
6537	218	Menu item was shown: bundle 1,4	2013-06-27 22:07:22.268297	2013-06-27 22:07:22.268297
6538	940	Menu item was shown: bundle 1,3	2013-06-27 22:07:23.264891	2013-06-27 22:07:23.264891
6539	940	Menu item was shown: bundle 1,4	2013-06-27 22:07:24.201133	2013-06-27 22:07:24.201133
6540	940	Menu item was shown: bundle 2,3	2013-06-27 22:07:25.316752	2013-06-27 22:07:25.316752
6541	233	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:07:25.589224	2013-06-27 22:07:25.589224
6542	940	Menu item was shown: bundle 2,4	2013-06-27 22:07:26.377664	2013-06-27 22:07:26.377664
6543	940	Menu item was shown: bundle 3,4	2013-06-27 22:07:27.088411	2013-06-27 22:07:27.088411
6544	233	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:07:27.417949	2013-06-27 22:07:27.417949
6545	1100	Combo was clicked. Value is now: true	2013-06-27 22:07:29.249246	2013-06-27 22:07:29.249246
6546	1100	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:30.349849	2013-06-27 22:07:30.349849
6547	940	Menu item was shown: bundle 1,2,3	2013-06-27 22:07:30.998486	2013-06-27 22:07:30.998486
6548	1100	Menu item was hidden: bundle 1,2,3	2013-06-27 22:07:31.158377	2013-06-27 22:07:31.158377
6549	1100	Menu item was shown: bundle 1,2	2013-06-27 22:07:33.347083	2013-06-27 22:07:33.347083
6550	1100	Menu item was shown: bundle 1,3	2013-06-27 22:07:34.05716	2013-06-27 22:07:34.05716
6551	1100	Menu item was shown: bundle 2,3	2013-06-27 22:07:34.334347	2013-06-27 22:07:34.334347
6552	940	Menu item was shown: bundle 1,2,4	2013-06-27 22:07:34.690264	2013-06-27 22:07:34.690264
6553	233	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:07:35.128123	2013-06-27 22:07:35.128123
6554	1100	Menu item was shown: bundle 1,3	2013-06-27 22:07:35.869124	2013-06-27 22:07:35.869124
6555	1100	Good 1 was clicked. Value is now: true	2013-06-27 22:07:36.348965	2013-06-27 22:07:36.348965
6556	940	Menu item was shown: bundle 1,3,4	2013-06-27 22:07:36.654659	2013-06-27 22:07:36.654659
6557	1100	Good 3 was clicked. Value is now: true	2013-06-27 22:07:37.01855	2013-06-27 22:07:37.01855
6558	940	Menu item was shown: bundle 2,3,4	2013-06-27 22:07:40.431204	2013-06-27 22:07:40.431204
6559	233	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:07:42.085728	2013-06-27 22:07:42.085728
6560	940	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:07:42.361354	2013-06-27 22:07:42.361354
6561	907	Menu item was shown: bundle 2,3,4	2013-06-27 22:07:46.894601	2013-06-27 22:07:46.894601
6562	233	Menu item was shown: bundle 1,3,5	2013-06-27 22:07:48.130809	2013-06-27 22:07:48.130809
6563	296	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:07:48.167599	2013-06-27 22:07:48.167599
6564	296	Combo was clicked. Value is now: true	2013-06-27 22:07:51.114718	2013-06-27 22:07:51.114718
6565	296	Menu item was shown: bundle 2,3,4	2013-06-27 22:07:53.04244	2013-06-27 22:07:53.04244
6566	940	Menu item was shown: bundle 1,3,4	2013-06-27 22:07:53.957751	2013-06-27 22:07:53.957751
6567	296	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:07:56.101057	2013-06-27 22:07:56.101057
6568	940	Menu item was shown: bundle 1,2	2013-06-27 22:07:56.731327	2013-06-27 22:07:56.731327
6569	296	Menu item was shown: bundle 2,3,4	2013-06-27 22:07:58.69444	2013-06-27 22:07:58.69444
6570	233	Menu item was shown: bundle 2,3,5	2013-06-27 22:08:02.365193	2013-06-27 22:08:02.365193
6571	940	Menu item was shown: bundle 1,3	2013-06-27 22:08:02.785348	2013-06-27 22:08:02.785348
6572	940	Menu item was shown: bundle 1,4	2013-06-27 22:08:03.998933	2013-06-27 22:08:03.998933
6573	296	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:04.774795	2013-06-27 22:08:04.774795
6574	233	Good 2 was clicked. Value is now: true	2013-06-27 22:08:05.161098	2013-06-27 22:08:05.161098
6575	940	Menu item was hidden: bundle 1,4	2013-06-27 22:08:05.368864	2013-06-27 22:08:05.368864
6576	233	Good 3 was clicked. Value is now: true	2013-06-27 22:08:05.674642	2013-06-27 22:08:05.674642
6577	233	Good 5 was clicked. Value is now: true	2013-06-27 22:08:05.714029	2013-06-27 22:08:05.714029
6578	296	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:05.757981	2013-06-27 22:08:05.757981
6579	940	Menu item was shown: bundle 2,3	2013-06-27 22:08:05.876409	2013-06-27 22:08:05.876409
6580	940	Menu item was shown: bundle 2,4	2013-06-27 22:08:10.04788	2013-06-27 22:08:10.04788
6581	940	Menu item was shown: bundle 3,4	2013-06-27 22:08:10.87124	2013-06-27 22:08:10.87124
6582	940	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:12.176939	2013-06-27 22:08:12.176939
6583	1108	Menu item was shown: bundle 1,2	2013-06-27 22:08:13.251003	2013-06-27 22:08:13.251003
6584	940	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:14.122207	2013-06-27 22:08:14.122207
6585	940	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:14.79283	2013-06-27 22:08:14.79283
6586	1108	Menu item was shown: bundle 1,3	2013-06-27 22:08:15.231136	2013-06-27 22:08:15.231136
6587	1108	Menu item was shown: bundle 2,3	2013-06-27 22:08:16.048803	2013-06-27 22:08:16.048803
6588	940	Menu item was shown: bundle 2,3,4	2013-06-27 22:08:16.433185	2013-06-27 22:08:16.433185
6589	1108	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:16.548898	2013-06-27 22:08:16.548898
6590	978	Menu item was shown: bundle 1,2	2013-06-27 22:08:17.628448	2013-06-27 22:08:17.628448
6591	296	Good 1 was clicked. Value is now: true	2013-06-27 22:08:18.474226	2013-06-27 22:08:18.474226
6592	296	Good 2 was clicked. Value is now: true	2013-06-27 22:08:18.783895	2013-06-27 22:08:18.783895
6593	978	Menu item was shown: bundle 1,3	2013-06-27 22:08:18.849043	2013-06-27 22:08:18.849043
6594	296	Good 4 was clicked. Value is now: true	2013-06-27 22:08:19.487932	2013-06-27 22:08:19.487932
6595	978	Menu item was shown: bundle 2,3	2013-06-27 22:08:19.674511	2013-06-27 22:08:19.674511
6596	1108	Combo was clicked. Value is now: true	2013-06-27 22:08:20.524404	2013-06-27 22:08:20.524404
6597	296	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:20.691565	2013-06-27 22:08:20.691565
6598	978	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:20.784547	2013-06-27 22:08:20.784547
6599	978	Menu item was shown: bundle 2,3	2013-06-27 22:08:21.414391	2013-06-27 22:08:21.414391
6600	940	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:21.586462	2013-06-27 22:08:21.586462
6601	296	Menu item was shown: bundle 3,4	2013-06-27 22:08:21.616852	2013-06-27 22:08:21.616852
6602	978	Menu item was shown: bundle 1,3	2013-06-27 22:08:22.214642	2013-06-27 22:08:22.214642
6603	978	Menu item was shown: bundle 1,2	2013-06-27 22:08:23.154614	2013-06-27 22:08:23.154614
6604	1108	Menu item was shown: bundle 1,2	2013-06-27 22:08:23.935038	2013-06-27 22:08:23.935038
6605	978	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:24.201285	2013-06-27 22:08:24.201285
6606	940	Menu item was shown: bundle 1,2	2013-06-27 22:08:24.797579	2013-06-27 22:08:24.797579
6607	296	Menu item was shown: bundle 2,4	2013-06-27 22:08:24.907644	2013-06-27 22:08:24.907644
6608	978	Menu item was shown: bundle 2,3	2013-06-27 22:08:24.950938	2013-06-27 22:08:24.950938
6609	940	Menu item was shown: bundle 1,3	2013-06-27 22:08:25.549861	2013-06-27 22:08:25.549861
6610	978	Menu item was shown: bundle 1,2	2013-06-27 22:08:26.557615	2013-06-27 22:08:26.557615
6611	940	Menu item was shown: bundle 2,3	2013-06-27 22:08:26.855493	2013-06-27 22:08:26.855493
6612	940	Menu item was shown: bundle 1,4	2013-06-27 22:08:26.923337	2013-06-27 22:08:26.923337
6613	296	Menu item was shown: bundle 2,3	2013-06-27 22:08:27.065849	2013-06-27 22:08:27.065849
6614	940	Menu item was shown: bundle 2,4	2013-06-27 22:08:27.694617	2013-06-27 22:08:27.694617
6615	296	Menu item was shown: bundle 1,4	2013-06-27 22:08:28.163699	2013-06-27 22:08:28.163699
6616	940	Menu item was shown: bundle 3,4	2013-06-27 22:08:28.443694	2013-06-27 22:08:28.443694
6617	296	Menu item was shown: bundle 1,3	2013-06-27 22:08:28.839368	2013-06-27 22:08:28.839368
6618	978	Menu item was shown: bundle 1,3	2013-06-27 22:08:29.25108	2013-06-27 22:08:29.25108
6619	296	Menu item was shown: bundle 1,2	2013-06-27 22:08:29.78781	2013-06-27 22:08:29.78781
6620	978	Menu item was shown: bundle 1,2	2013-06-27 22:08:30.357582	2013-06-27 22:08:30.357582
6621	940	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:30.447749	2013-06-27 22:08:30.447749
6622	1108	Menu item was shown: bundle 1,3	2013-06-27 22:08:30.789431	2013-06-27 22:08:30.789431
6623	1108	Menu item was shown: bundle 2,3	2013-06-27 22:08:31.559835	2013-06-27 22:08:31.559835
6624	940	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:31.772503	2013-06-27 22:08:31.772503
6625	1108	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:32.173199	2013-06-27 22:08:32.173199
6626	940	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:32.85069	2013-06-27 22:08:32.85069
6627	296	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:33.751307	2013-06-27 22:08:33.751307
6628	940	Menu item was shown: bundle 2,3,4	2013-06-27 22:08:35.106371	2013-06-27 22:08:35.106371
6629	1108	Menu item was shown: bundle 1,2	2013-06-27 22:08:36.839467	2013-06-27 22:08:36.839467
6630	296	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:38.10059	2013-06-27 22:08:38.10059
6631	940	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:38.264148	2013-06-27 22:08:38.264148
6632	978	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:38.610314	2013-06-27 22:08:38.610314
6633	978	Combo was clicked. Value is now: true	2013-06-27 22:08:39.618695	2013-06-27 22:08:39.618695
6634	1083	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:40.349919	2013-06-27 22:08:40.349919
6635	1108	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:40.851819	2013-06-27 22:08:40.851819
6636	296	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:44.886548	2013-06-27 22:08:44.886548
6637	1083	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:49.16511	2013-06-27 22:08:49.16511
6638	1083	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:49.746432	2013-06-27 22:08:49.746432
6639	969	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:08:50.067983	2013-06-27 22:08:50.067983
6640	1083	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:50.501029	2013-06-27 22:08:50.501029
6641	969	Menu item was hidden: bundle 1,2,3,4,5	2013-06-27 22:08:50.737104	2013-06-27 22:08:50.737104
6642	296	Menu item was shown: bundle 1,2,4	2013-06-27 22:08:50.946066	2013-06-27 22:08:50.946066
6643	1083	Menu item was shown: bundle 1,2,3	2013-06-27 22:08:51.327797	2013-06-27 22:08:51.327797
6644	205	Combo was clicked. Value is now: true	2013-06-27 22:08:53.142203	2013-06-27 22:08:53.142203
6645	969	Menu item was shown: bundle 1,2	2013-06-27 22:08:53.751618	2013-06-27 22:08:53.751618
6646	969	Menu item was shown: bundle 1,3	2013-06-27 22:08:54.449235	2013-06-27 22:08:54.449235
6647	205	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:08:54.829955	2013-06-27 22:08:54.829955
6648	969	Menu item was shown: bundle 1,4	2013-06-27 22:08:55.094135	2013-06-27 22:08:55.094135
6649	205	Menu item was hidden: bundle 1,2,3,4	2013-06-27 22:08:56.869581	2013-06-27 22:08:56.869581
6650	205	Menu item was shown: bundle 2,3,4	2013-06-27 22:08:57.392521	2013-06-27 22:08:57.392521
6651	969	Menu item was shown: bundle 1,5	2013-06-27 22:08:57.691	2013-06-27 22:08:57.691
6652	205	Menu item was hidden: bundle 2,3,4	2013-06-27 22:08:58.026224	2013-06-27 22:08:58.026224
6653	969	Menu item was shown: bundle 2,3	2013-06-27 22:08:58.467638	2013-06-27 22:08:58.467638
6654	1083	Combo was clicked. Value is now: true	2013-06-27 22:08:58.825878	2013-06-27 22:08:58.825878
6655	205	Menu item was shown: bundle 1,3,4	2013-06-27 22:08:58.848048	2013-06-27 22:08:58.848048
6656	969	Menu item was shown: bundle 2,5	2013-06-27 22:08:59.199416	2013-06-27 22:08:59.199416
6657	205	Menu item was hidden: bundle 1,3,4	2013-06-27 22:08:59.503958	2013-06-27 22:08:59.503958
6658	1083	Menu item was shown: bundle 1,2	2013-06-27 22:08:59.904674	2013-06-27 22:08:59.904674
6659	205	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:00.089108	2013-06-27 22:09:00.089108
6660	969	Menu item was shown: bundle 3,4	2013-06-27 22:09:03.44745	2013-06-27 22:09:03.44745
6661	969	Menu item was shown: bundle 3,5	2013-06-27 22:09:04.114365	2013-06-27 22:09:04.114365
6662	1083	Menu item was shown: bundle 1,3	2013-06-27 22:09:04.206172	2013-06-27 22:09:04.206172
6663	205	Menu item was hidden: bundle 1,2,4	2013-06-27 22:09:04.835161	2013-06-27 22:09:04.835161
6664	205	Good 1 was clicked. Value is now: true	2013-06-27 22:09:06.247837	2013-06-27 22:09:06.247837
6665	205	Good 2 was clicked. Value is now: true	2013-06-27 22:09:06.787991	2013-06-27 22:09:06.787991
6666	969	Menu item was shown: bundle 4,5	2013-06-27 22:09:07.258139	2013-06-27 22:09:07.258139
6667	205	Good 4 was clicked. Value is now: true	2013-06-27 22:09:07.372704	2013-06-27 22:09:07.372704
6668	1083	Good 1 was clicked. Value is now: true	2013-06-27 22:09:08.119321	2013-06-27 22:09:08.119321
6669	1083	Good 3 was clicked. Value is now: true	2013-06-27 22:09:08.727543	2013-06-27 22:09:08.727543
6670	1083	Menu item was shown: bundle 1,4	2013-06-27 22:09:09.909751	2013-06-27 22:09:09.909751
6671	969	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:10.367893	2013-06-27 22:09:10.367893
6672	205	Menu item was shown: bundle 1,2	2013-06-27 22:09:13.500577	2013-06-27 22:09:13.500577
6673	969	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:14.118264	2013-06-27 22:09:14.118264
6674	1083	Menu item was shown: bundle 2,3	2013-06-27 22:09:14.429087	2013-06-27 22:09:14.429087
6675	205	Menu item was hidden: bundle 1,2	2013-06-27 22:09:14.773481	2013-06-27 22:09:14.773481
6676	969	Menu item was shown: bundle 1,2,5	2013-06-27 22:09:14.831081	2013-06-27 22:09:14.831081
6677	205	Menu item was shown: bundle 1,3	2013-06-27 22:09:15.153841	2013-06-27 22:09:15.153841
6678	205	Menu item was hidden: bundle 1,3	2013-06-27 22:09:15.71585	2013-06-27 22:09:15.71585
6679	205	Menu item was shown: bundle 1,4	2013-06-27 22:09:16.281058	2013-06-27 22:09:16.281058
6680	1083	Menu item was shown: bundle 2,4	2013-06-27 22:09:17.1917	2013-06-27 22:09:17.1917
6681	969	Menu item was shown: bundle 1,3,4	2013-06-27 22:09:18.082516	2013-06-27 22:09:18.082516
6682	1083	Menu item was shown: bundle 3,4	2013-06-27 22:09:18.261592	2013-06-27 22:09:18.261592
6683	969	Menu item was shown: bundle 1,3,5	2013-06-27 22:09:18.812326	2013-06-27 22:09:18.812326
6684	1083	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:19.101107	2013-06-27 22:09:19.101107
6685	205	Menu item was hidden: bundle 1,4	2013-06-27 22:09:19.207873	2013-06-27 22:09:19.207873
6686	969	Menu item was shown: bundle 1,4,5	2013-06-27 22:09:22.633121	2013-06-27 22:09:22.633121
6687	1108	Menu item was shown: bundle 1,2	2013-06-27 22:09:23.186301	2013-06-27 22:09:23.186301
6688	1108	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:24.199128	2013-06-27 22:09:24.199128
6689	1108	Menu item was shown: bundle 1,3	2013-06-27 22:09:24.964948	2013-06-27 22:09:24.964948
6690	1108	Menu item was shown: bundle 2,3	2013-06-27 22:09:25.414045	2013-06-27 22:09:25.414045
6691	1083	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:26.592776	2013-06-27 22:09:26.592776
6692	969	Menu item was shown: bundle 2,3,4	2013-06-27 22:09:28.759617	2013-06-27 22:09:28.759617
6693	903	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:09:29.220674	2013-06-27 22:09:29.220674
6694	1083	Menu item was shown: bundle 1,3,4	2013-06-27 22:09:29.246606	2013-06-27 22:09:29.246606
6695	969	Menu item was shown: bundle 2,3,5	2013-06-27 22:09:30.192552	2013-06-27 22:09:30.192552
6696	1083	Menu item was hidden: bundle 1,3,4	2013-06-27 22:09:30.235542	2013-06-27 22:09:30.235542
6697	1083	Menu item was shown: bundle 2,3,4	2013-06-27 22:09:30.706196	2013-06-27 22:09:30.706196
6698	969	Menu item was shown: bundle 2,4,5	2013-06-27 22:09:30.803417	2013-06-27 22:09:30.803417
6699	1124	Menu item was shown: bundle 1,2	2013-06-27 22:09:31.600334	2013-06-27 22:09:31.600334
6700	1124	Menu item was hidden: bundle 1,2	2013-06-27 22:09:32.649679	2013-06-27 22:09:32.649679
6701	903	Combo was clicked. Value is now: true	2013-06-27 22:09:33.068557	2013-06-27 22:09:33.068557
6702	1124	Menu item was shown: bundle 1,2	2013-06-27 22:09:33.273404	2013-06-27 22:09:33.273404
6703	1124	Menu item was hidden: bundle 1,2	2013-06-27 22:09:33.900999	2013-06-27 22:09:33.900999
6704	903	Menu item was shown: bundle 1,2	2013-06-27 22:09:33.952061	2013-06-27 22:09:33.952061
6705	1124	Menu item was shown: bundle 1,3	2013-06-27 22:09:34.362818	2013-06-27 22:09:34.362818
6706	903	Menu item was shown: bundle 1,3	2013-06-27 22:09:35.573636	2013-06-27 22:09:35.573636
6707	1124	Menu item was shown: bundle 1,4	2013-06-27 22:09:36.078742	2013-06-27 22:09:36.078742
6708	969	Menu item was shown: bundle 3,4,5	2013-06-27 22:09:36.691635	2013-06-27 22:09:36.691635
6709	1124	Menu item was shown: bundle 1,5	2013-06-27 22:09:37.180009	2013-06-27 22:09:37.180009
6710	969	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:09:37.353851	2013-06-27 22:09:37.353851
6711	1124	Menu item was shown: bundle 2,3	2013-06-27 22:09:37.787993	2013-06-27 22:09:37.787993
6712	1124	Menu item was shown: bundle 2,4	2013-06-27 22:09:38.411686	2013-06-27 22:09:38.411686
6713	959	Combo was clicked. Value is now: true	2013-06-27 22:09:38.439362	2013-06-27 22:09:38.439362
6714	903	Menu item was shown: bundle 1,4	2013-06-27 22:09:38.591119	2013-06-27 22:09:38.591119
6715	1124	Menu item was shown: bundle 2,5	2013-06-27 22:09:38.948851	2013-06-27 22:09:38.948851
6716	1124	Menu item was shown: bundle 3,4	2013-06-27 22:09:39.575063	2013-06-27 22:09:39.575063
6717	903	Menu item was shown: bundle 1,5	2013-06-27 22:09:39.702833	2013-06-27 22:09:39.702833
6718	959	Menu item was shown: bundle 1,2	2013-06-27 22:09:40.00841	2013-06-27 22:09:40.00841
6719	1124	Menu item was shown: bundle 3,5	2013-06-27 22:09:40.301137	2013-06-27 22:09:40.301137
6720	1124	Menu item was shown: bundle 4,5	2013-06-27 22:09:41.675997	2013-06-27 22:09:41.675997
6721	1124	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:42.585622	2013-06-27 22:09:42.585622
6722	969	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:09:42.624837	2013-06-27 22:09:42.624837
6723	959	Menu item was shown: bundle 1,3	2013-06-27 22:09:43.033514	2013-06-27 22:09:43.033514
6724	1124	Menu item was shown: bundle 4,5	2013-06-27 22:09:43.383016	2013-06-27 22:09:43.383016
6725	959	Menu item was shown: bundle 1,4	2013-06-27 22:09:43.894509	2013-06-27 22:09:43.894509
6726	238	Menu item was shown: bundle 1,2	2013-06-27 22:09:44.109892	2013-06-27 22:09:44.109892
6727	959	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:09:45.4079	2013-06-27 22:09:45.4079
6728	238	Menu item was shown: bundle 1,3	2013-06-27 22:09:45.745525	2013-06-27 22:09:45.745525
6729	1048	Menu item was shown: bundle 1,2	2013-06-27 22:09:45.930619	2013-06-27 22:09:45.930619
6730	903	Good 5 was clicked. Value is now: true	2013-06-27 22:09:46.03547	2013-06-27 22:09:46.03547
6731	959	Menu item was shown: bundle 2,3,4	2013-06-27 22:09:46.211555	2013-06-27 22:09:46.211555
6732	1048	Menu item was shown: bundle 1,3	2013-06-27 22:09:46.588777	2013-06-27 22:09:46.588777
6733	903	Good 1 was clicked. Value is now: true	2013-06-27 22:09:46.649271	2013-06-27 22:09:46.649271
6734	238	Menu item was shown: bundle 1,4	2013-06-27 22:09:46.900751	2013-06-27 22:09:46.900751
6735	969	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:09:47.213299	2013-06-27 22:09:47.213299
6736	238	Menu item was shown: bundle 2,3	2013-06-27 22:09:47.912734	2013-06-27 22:09:47.912734
6737	969	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:09:48.367356	2013-06-27 22:09:48.367356
6738	969	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:09:48.918912	2013-06-27 22:09:48.918912
6739	238	Menu item was shown: bundle 2,4	2013-06-27 22:09:49.075447	2013-06-27 22:09:49.075447
6740	1124	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:49.242308	2013-06-27 22:09:49.242308
6741	969	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:09:49.564118	2013-06-27 22:09:49.564118
6742	1124	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:50.031326	2013-06-27 22:09:50.031326
6743	238	Menu item was shown: bundle 3,4	2013-06-27 22:09:50.6435	2013-06-27 22:09:50.6435
6744	959	Good 2 was clicked. Value is now: true	2013-06-27 22:09:50.677339	2013-06-27 22:09:50.677339
6745	1124	Menu item was shown: bundle 1,2,5	2013-06-27 22:09:50.702284	2013-06-27 22:09:50.702284
6746	1124	Menu item was shown: bundle 1,3,4	2013-06-27 22:09:51.471539	2013-06-27 22:09:51.471539
6747	959	Good 3 was clicked. Value is now: true	2013-06-27 22:09:51.582616	2013-06-27 22:09:51.582616
6748	238	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:51.911126	2013-06-27 22:09:51.911126
6749	969	Good 1 was clicked. Value is now: true	2013-06-27 22:09:51.983477	2013-06-27 22:09:51.983477
6750	959	Good 4 was clicked. Value is now: true	2013-06-27 22:09:52.085462	2013-06-27 22:09:52.085462
6751	1124	Menu item was shown: bundle 1,3,5	2013-06-27 22:09:52.349191	2013-06-27 22:09:52.349191
6752	969	Good 2 was clicked. Value is now: true	2013-06-27 22:09:52.473663	2013-06-27 22:09:52.473663
6753	238	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:53.007203	2013-06-27 22:09:53.007203
6754	969	Good 3 was clicked. Value is now: true	2013-06-27 22:09:53.083374	2013-06-27 22:09:53.083374
6755	969	Good 4 was clicked. Value is now: true	2013-06-27 22:09:53.564939	2013-06-27 22:09:53.564939
6756	1124	Menu item was shown: bundle 1,4,5	2013-06-27 22:09:53.866831	2013-06-27 22:09:53.866831
6757	959	Menu item was shown: bundle 1,3,4	2013-06-27 22:09:53.966638	2013-06-27 22:09:53.966638
6758	1124	Menu item was shown: bundle 2,3,4	2013-06-27 22:09:54.460113	2013-06-27 22:09:54.460113
6759	903	Menu item was shown: bundle 2,3	2013-06-27 22:09:54.532148	2013-06-27 22:09:54.532148
6760	238	Menu item was shown: bundle 1,3,4	2013-06-27 22:09:54.667997	2013-06-27 22:09:54.667997
6761	1124	Menu item was shown: bundle 2,3,5	2013-06-27 22:09:55.049151	2013-06-27 22:09:55.049151
6762	959	Menu item was shown: bundle 1,2,4	2013-06-27 22:09:55.608768	2013-06-27 22:09:55.608768
6763	1048	Good 1 was clicked. Value is now: true	2013-06-27 22:09:55.788504	2013-06-27 22:09:55.788504
6764	1124	Menu item was shown: bundle 2,4,5	2013-06-27 22:09:56.015434	2013-06-27 22:09:56.015434
6765	959	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:56.159491	2013-06-27 22:09:56.159491
6766	238	Menu item was shown: bundle 2,3,4	2013-06-27 22:09:56.301067	2013-06-27 22:09:56.301067
6767	1124	Menu item was shown: bundle 3,4,5	2013-06-27 22:09:56.401455	2013-06-27 22:09:56.401455
6768	1048	Good 3 was clicked. Value is now: true	2013-06-27 22:09:56.539181	2013-06-27 22:09:56.539181
6769	1124	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:09:57.074965	2013-06-27 22:09:57.074965
6770	959	Menu item was shown: bundle 3,4	2013-06-27 22:09:57.295723	2013-06-27 22:09:57.295723
6771	903	Menu item was shown: bundle 2,4	2013-06-27 22:09:57.409804	2013-06-27 22:09:57.409804
6772	1048	Menu item was shown: bundle 2,3	2013-06-27 22:09:57.495685	2013-06-27 22:09:57.495685
6773	238	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:09:57.582819	2013-06-27 22:09:57.582819
6774	1124	Menu item was shown: bundle 3,4,5	2013-06-27 22:09:57.666145	2013-06-27 22:09:57.666145
6775	959	Menu item was shown: bundle 2,4	2013-06-27 22:09:57.993802	2013-06-27 22:09:57.993802
6776	959	Menu item was shown: bundle 2,3	2013-06-27 22:09:59.236578	2013-06-27 22:09:59.236578
6777	1048	Menu item was shown: bundle 1,2,3	2013-06-27 22:09:59.485397	2013-06-27 22:09:59.485397
6778	539	Menu item was shown: bundle 2,3,4	2013-06-27 22:10:00.203812	2013-06-27 22:10:00.203812
6779	238	Good 4 was clicked. Value is now: true	2013-06-27 22:10:00.28698	2013-06-27 22:10:00.28698
6780	959	Menu item was shown: bundle 1,4	2013-06-27 22:10:00.348186	2013-06-27 22:10:00.348186
6781	903	Menu item was shown: bundle 2,5	2013-06-27 22:10:00.611106	2013-06-27 22:10:00.611106
6782	1124	Good 3 was clicked. Value is now: true	2013-06-27 22:10:00.997587	2013-06-27 22:10:00.997587
6783	1124	Good 4 was clicked. Value is now: true	2013-06-27 22:10:01.819767	2013-06-27 22:10:01.819767
6784	959	Menu item was shown: bundle 1,3	2013-06-27 22:10:01.927533	2013-06-27 22:10:01.927533
6785	1124	Good 5 was clicked. Value is now: true	2013-06-27 22:10:02.066359	2013-06-27 22:10:02.066359
6786	409	Good 2 was clicked. Value is now: true	2013-06-27 22:10:02.604521	2013-06-27 22:10:02.604521
6787	409	Good 3 was clicked. Value is now: true	2013-06-27 22:10:02.857524	2013-06-27 22:10:02.857524
6788	409	Good 4 was clicked. Value is now: true	2013-06-27 22:10:03.180614	2013-06-27 22:10:03.180614
6789	1048	Menu item was shown: bundle 1,2	2013-06-27 22:10:03.31328	2013-06-27 22:10:03.31328
6790	959	Menu item was shown: bundle 2,3,4	2013-06-27 22:10:03.387952	2013-06-27 22:10:03.387952
6791	409	Good 5 was clicked. Value is now: true	2013-06-27 22:10:03.581031	2013-06-27 22:10:03.581031
6792	1048	Menu item was shown: bundle 1,3	2013-06-27 22:10:04.919059	2013-06-27 22:10:04.919059
6793	903	Menu item was shown: bundle 3,4	2013-06-27 22:10:04.999324	2013-06-27 22:10:04.999324
6794	539	Menu item was shown: bundle 1,2	2013-06-27 22:10:06.649132	2013-06-27 22:10:06.649132
6795	903	Menu item was shown: bundle 3,5	2013-06-27 22:10:06.958122	2013-06-27 22:10:06.958122
6796	539	Menu item was shown: bundle 1,3	2013-06-27 22:10:07.230416	2013-06-27 22:10:07.230416
6797	539	Menu item was shown: bundle 1,4	2013-06-27 22:10:07.608516	2013-06-27 22:10:07.608516
6798	903	Menu item was shown: bundle 4,5	2013-06-27 22:10:07.702399	2013-06-27 22:10:07.702399
6799	539	Menu item was shown: bundle 1,5	2013-06-27 22:10:08.199314	2013-06-27 22:10:08.199314
6800	959	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:10:09.143489	2013-06-27 22:10:09.143489
6801	959	Menu item was shown: bundle 1,3,4	2013-06-27 22:10:10.39434	2013-06-27 22:10:10.39434
6802	903	Menu item was shown: bundle 1,2,3	2013-06-27 22:10:10.939428	2013-06-27 22:10:10.939428
6803	409	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:10:11.198776	2013-06-27 22:10:11.198776
6804	959	Menu item was shown: bundle 1,2,4	2013-06-27 22:10:11.600402	2013-06-27 22:10:11.600402
6805	959	Menu item was shown: bundle 1,2,3	2013-06-27 22:10:12.449786	2013-06-27 22:10:12.449786
6806	959	Menu item was shown: bundle 3,4	2013-06-27 22:10:12.807348	2013-06-27 22:10:12.807348
6807	959	Menu item was shown: bundle 2,4	2013-06-27 22:10:13.394043	2013-06-27 22:10:13.394043
6808	409	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:10:13.525075	2013-06-27 22:10:13.525075
6809	539	Combo was clicked. Value is now: true	2013-06-27 22:10:13.668981	2013-06-27 22:10:13.668981
6810	959	Menu item was shown: bundle 2,3	2013-06-27 22:10:14.058542	2013-06-27 22:10:14.058542
6811	539	Menu item was shown: bundle 2,3	2013-06-27 22:10:14.350764	2013-06-27 22:10:14.350764
6812	539	Menu item was shown: bundle 2,4	2013-06-27 22:10:14.93357	2013-06-27 22:10:14.93357
6813	539	Menu item was shown: bundle 2,5	2013-06-27 22:10:15.344688	2013-06-27 22:10:15.344688
6814	903	Menu item was shown: bundle 1,2,4	2013-06-27 22:10:15.625148	2013-06-27 22:10:15.625148
6815	539	Menu item was shown: bundle 3,4	2013-06-27 22:10:15.71067	2013-06-27 22:10:15.71067
6816	959	Menu item was shown: bundle 2,3,4	2013-06-27 22:10:16.228749	2013-06-27 22:10:16.228749
6817	409	Menu item was shown: bundle 1,2	2013-06-27 22:10:17.244393	2013-06-27 22:10:17.244393
6818	1023	Menu item was shown: bundle 1,2,3	2013-06-27 22:10:18.424259	2013-06-27 22:10:18.424259
6819	1023	Menu item was shown: bundle 2,3	2013-06-27 22:10:19.53099	2013-06-27 22:10:19.53099
6820	903	Menu item was shown: bundle 1,2,5	2013-06-27 22:10:19.938051	2013-06-27 22:10:19.938051
6821	409	Good 2 was clicked. Value is now: false	2013-06-27 22:10:20.11139	2013-06-27 22:10:20.11139
6822	409	Good 3 was clicked. Value is now: false	2013-06-27 22:10:20.35056	2013-06-27 22:10:20.35056
6823	409	Good 4 was clicked. Value is now: false	2013-06-27 22:10:20.649165	2013-06-27 22:10:20.649165
6824	409	Good 5 was clicked. Value is now: false	2013-06-27 22:10:21.304419	2013-06-27 22:10:21.304419
6825	539	Good 4 was clicked. Value is now: true	2013-06-27 22:10:24.63017	2013-06-27 22:10:24.63017
6826	539	Good 3 was clicked. Value is now: true	2013-06-27 22:10:25.177309	2013-06-27 22:10:25.177309
6827	409	Menu item was shown: bundle 1,3	2013-06-27 22:10:26.034926	2013-06-27 22:10:26.034926
6828	1023	Menu item was shown: bundle 1,3	2013-06-27 22:10:26.351768	2013-06-27 22:10:26.351768
6829	539	Menu item was shown: bundle 3,5	2013-06-27 22:10:27.010969	2013-06-27 22:10:27.010969
6830	409	Menu item was shown: bundle 1,4	2013-06-27 22:10:27.591074	2013-06-27 22:10:27.591074
6831	539	Menu item was shown: bundle 4,5	2013-06-27 22:10:27.648654	2013-06-27 22:10:27.648654
6832	1023	Menu item was shown: bundle 1,2	2013-06-27 22:10:28.058079	2013-06-27 22:10:28.058079
6833	409	Menu item was shown: bundle 1,5	2013-06-27 22:10:28.725969	2013-06-27 22:10:28.725969
6834	409	Menu item was shown: bundle 2,3	2013-06-27 22:10:29.367365	2013-06-27 22:10:29.367365
6835	903	Menu item was shown: bundle 1,3,4	2013-06-27 22:10:31.31019	2013-06-27 22:10:31.31019
6836	1023	Menu item was shown: bundle 1,3	2013-06-27 22:10:32.925707	2013-06-27 22:10:32.925707
6837	539	Menu item was shown: bundle 3,4	2013-06-27 22:10:33.285902	2013-06-27 22:10:33.285902
6838	409	Good 2 was clicked. Value is now: true	2013-06-27 22:10:33.406682	2013-06-27 22:10:33.406682
6839	409	Good 3 was clicked. Value is now: true	2013-06-27 22:10:33.684294	2013-06-27 22:10:33.684294
6840	539	Menu item was shown: bundle 4,5	2013-06-27 22:10:34.871677	2013-06-27 22:10:34.871677
6841	1023	Menu item was shown: bundle 2,3	2013-06-27 22:10:36.3164	2013-06-27 22:10:36.3164
6842	903	Menu item was shown: bundle 1,3,5	2013-06-27 22:10:36.346607	2013-06-27 22:10:36.346607
6843	1023	Menu item was shown: bundle 1,2,3	2013-06-27 22:10:38.100956	2013-06-27 22:10:38.100956
6844	903	Menu item was shown: bundle 1,4,5	2013-06-27 22:10:38.214382	2013-06-27 22:10:38.214382
6845	409	Menu item was shown: bundle 2,4	2013-06-27 22:10:38.814271	2013-06-27 22:10:38.814271
6846	539	Menu item was shown: bundle 3,5	2013-06-27 22:10:42.034824	2013-06-27 22:10:42.034824
6847	903	Menu item was shown: bundle 2,3,4	2013-06-27 22:10:42.082544	2013-06-27 22:10:42.082544
6848	539	Menu item was shown: bundle 3,4	2013-06-27 22:10:43.057695	2013-06-27 22:10:43.057695
6849	409	Menu item was shown: bundle 2,5	2013-06-27 22:10:43.37707	2013-06-27 22:10:43.37707
6850	409	Menu item was shown: bundle 3,4	2013-06-27 22:10:46.120348	2013-06-27 22:10:46.120348
6851	1023	Combo was clicked. Value is now: true	2013-06-27 22:10:46.203688	2013-06-27 22:10:46.203688
6852	903	Menu item was shown: bundle 2,3,5	2013-06-27 22:10:47.022316	2013-06-27 22:10:47.022316
6853	539	Menu item was shown: bundle 1,2,3	2013-06-27 22:10:47.084694	2013-06-27 22:10:47.084694
6854	539	Menu item was shown: bundle 1,2,4	2013-06-27 22:10:48.603235	2013-06-27 22:10:48.603235
6855	903	Menu item was shown: bundle 2,4,5	2013-06-27 22:10:52.681106	2013-06-27 22:10:52.681106
6856	539	Menu item was shown: bundle 1,2,5	2013-06-27 22:10:55.064523	2013-06-27 22:10:55.064523
6857	409	Menu item was shown: bundle 2,3	2013-06-27 22:10:56.093617	2013-06-27 22:10:56.093617
6858	539	Menu item was shown: bundle 1,3,4	2013-06-27 22:10:56.190045	2013-06-27 22:10:56.190045
6859	409	Menu item was shown: bundle 2,5	2013-06-27 22:10:59.704384	2013-06-27 22:10:59.704384
6860	903	Menu item was shown: bundle 3,4,5	2013-06-27 22:10:59.939281	2013-06-27 22:10:59.939281
6861	938	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:00.494682	2013-06-27 22:11:00.494682
6862	224	Menu item was shown: bundle 1,2	2013-06-27 22:11:00.643863	2013-06-27 22:11:00.643863
6863	409	Menu item was shown: bundle 3,4	2013-06-27 22:11:02.335983	2013-06-27 22:11:02.335983
6864	224	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:03.495557	2013-06-27 22:11:03.495557
6865	409	Menu item was shown: bundle 3,5	2013-06-27 22:11:03.574224	2013-06-27 22:11:03.574224
6866	224	Menu item was shown: bundle 2,3	2013-06-27 22:11:04.53059	2013-06-27 22:11:04.53059
6867	224	Menu item was shown: bundle 1,3	2013-06-27 22:11:05.807225	2013-06-27 22:11:05.807225
6868	938	Menu item was shown: bundle 2,3	2013-06-27 22:11:05.862777	2013-06-27 22:11:05.862777
6869	539	Menu item was shown: bundle 3,4	2013-06-27 22:11:06.207472	2013-06-27 22:11:06.207472
6870	409	Good 2 was clicked. Value is now: false	2013-06-27 22:11:06.344152	2013-06-27 22:11:06.344152
6871	409	Good 5 was clicked. Value is now: true	2013-06-27 22:11:07.125759	2013-06-27 22:11:07.125759
6872	224	Menu item was shown: bundle 1,2	2013-06-27 22:11:07.36388	2013-06-27 22:11:07.36388
6873	224	Combo was clicked. Value is now: true	2013-06-27 22:11:08.525621	2013-06-27 22:11:08.525621
6874	938	Menu item was shown: bundle 1,3	2013-06-27 22:11:08.699147	2013-06-27 22:11:08.699147
6875	903	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:09.226624	2013-06-27 22:11:09.226624
6876	938	Menu item was shown: bundle 1,2	2013-06-27 22:11:09.784028	2013-06-27 22:11:09.784028
6877	938	Good 2 was clicked. Value is now: true	2013-06-27 22:11:12.299653	2013-06-27 22:11:12.299653
6878	938	Good 3 was clicked. Value is now: true	2013-06-27 22:11:12.523324	2013-06-27 22:11:12.523324
6879	539	Menu item was shown: bundle 1,3,5	2013-06-27 22:11:12.850998	2013-06-27 22:11:12.850998
6880	409	Menu item was shown: bundle 4,5	2013-06-27 22:11:13.301078	2013-06-27 22:11:13.301078
6881	409	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:15.133894	2013-06-27 22:11:15.133894
6882	903	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:11:15.446922	2013-06-27 22:11:15.446922
6883	409	Menu item was shown: bundle 1,2,4	2013-06-27 22:11:16.807655	2013-06-27 22:11:16.807655
6884	903	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:11:17.161471	2013-06-27 22:11:17.161471
6885	993	Combo was clicked. Value is now: true	2013-06-27 22:11:19.075397	2013-06-27 22:11:19.075397
6886	993	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:20.024907	2013-06-27 22:11:20.024907
6887	938	Menu item was shown: bundle 1,3	2013-06-27 22:11:20.70996	2013-06-27 22:11:20.70996
6888	993	Menu item was shown: bundle 2,3,4	2013-06-27 22:11:21.166688	2013-06-27 22:11:21.166688
6889	993	Menu item was shown: bundle 1,3,4	2013-06-27 22:11:22.050921	2013-06-27 22:11:22.050921
6890	539	Menu item was shown: bundle 1,4,5	2013-06-27 22:11:22.336952	2013-06-27 22:11:22.336952
6891	409	Menu item was shown: bundle 1,2,5	2013-06-27 22:11:22.865019	2013-06-27 22:11:22.865019
6892	409	Menu item was shown: bundle 1,3,4	2013-06-27 22:11:23.646544	2013-06-27 22:11:23.646544
6893	409	Menu item was shown: bundle 1,3,5	2013-06-27 22:11:25.003533	2013-06-27 22:11:25.003533
6894	409	Menu item was shown: bundle 2,3,4	2013-06-27 22:11:25.640695	2013-06-27 22:11:25.640695
6895	938	Menu item was shown: bundle 2,3	2013-06-27 22:11:27.191266	2013-06-27 22:11:27.191266
6896	993	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:27.414478	2013-06-27 22:11:27.414478
6897	539	Menu item was shown: bundle 2,3,4	2013-06-27 22:11:27.490574	2013-06-27 22:11:27.490574
6898	993	Menu item was hidden: bundle 1,2,3,4	2013-06-27 22:11:27.537002	2013-06-27 22:11:27.537002
6899	539	Menu item was shown: bundle 2,3,5	2013-06-27 22:11:27.991976	2013-06-27 22:11:27.991976
6900	539	Menu item was shown: bundle 2,4,5	2013-06-27 22:11:28.630854	2013-06-27 22:11:28.630854
6901	220	Good 2 was clicked. Value is now: true	2013-06-27 22:11:28.785682	2013-06-27 22:11:28.785682
6902	993	Menu item was shown: bundle 1,3,4	2013-06-27 22:11:28.831204	2013-06-27 22:11:28.831204
6903	220	Good 4 was clicked. Value is now: true	2013-06-27 22:11:29.145913	2013-06-27 22:11:29.145913
6904	993	Menu item was shown: bundle 1,2,4	2013-06-27 22:11:29.51102	2013-06-27 22:11:29.51102
6905	938	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:30.046307	2013-06-27 22:11:30.046307
6906	220	Menu item was shown: bundle 2,4	2013-06-27 22:11:30.389022	2013-06-27 22:11:30.389022
6907	903	Good 2 was clicked. Value is now: true	2013-06-27 22:11:30.445427	2013-06-27 22:11:30.445427
6908	220	Menu item was hidden: bundle 2,4	2013-06-27 22:11:31.137825	2013-06-27 22:11:31.137825
6909	903	Good 4 was clicked. Value is now: true	2013-06-27 22:11:31.451379	2013-06-27 22:11:31.451379
6910	993	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:32.922218	2013-06-27 22:11:32.922218
6911	409	Menu item was shown: bundle 1,4,5	2013-06-27 22:11:33.0695	2013-06-27 22:11:33.0695
6912	220	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:11:33.227999	2013-06-27 22:11:33.227999
6913	539	Menu item was shown: bundle 3,4,5	2013-06-27 22:11:33.537061	2013-06-27 22:11:33.537061
6914	938	Menu item was shown: bundle 1,2	2013-06-27 22:11:34.15206	2013-06-27 22:11:34.15206
6915	539	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:34.609727	2013-06-27 22:11:34.609727
6916	220	Combo was clicked. Value is now: true	2013-06-27 22:11:34.671384	2013-06-27 22:11:34.671384
6917	938	Menu item was shown: bundle 1,3	2013-06-27 22:11:35.048127	2013-06-27 22:11:35.048127
6918	993	Good 1 was clicked. Value is now: true	2013-06-27 22:11:35.645992	2013-06-27 22:11:35.645992
6919	938	Menu item was shown: bundle 2,3	2013-06-27 22:11:36.181027	2013-06-27 22:11:36.181027
6920	993	Good 2 was clicked. Value is now: true	2013-06-27 22:11:36.304379	2013-06-27 22:11:36.304379
6921	993	Good 4 was clicked. Value is now: true	2013-06-27 22:11:37.598838	2013-06-27 22:11:37.598838
6922	539	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:11:37.832551	2013-06-27 22:11:37.832551
6923	539	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:11:38.303162	2013-06-27 22:11:38.303162
6924	409	Menu item was shown: bundle 2,4,5	2013-06-27 22:11:38.451893	2013-06-27 22:11:38.451893
6925	993	Menu item was shown: bundle 1,2,4	2013-06-27 22:11:38.505274	2013-06-27 22:11:38.505274
6926	539	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:11:38.952144	2013-06-27 22:11:38.952144
6927	409	Menu item was shown: bundle 2,3,5	2013-06-27 22:11:39.126213	2013-06-27 22:11:39.126213
6928	539	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:11:39.23395	2013-06-27 22:11:39.23395
6929	903	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:11:39.388409	2013-06-27 22:11:39.388409
6930	539	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:11:39.727708	2013-06-27 22:11:39.727708
6931	938	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:40.137434	2013-06-27 22:11:40.137434
6932	220	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:11:40.392289	2013-06-27 22:11:40.392289
6933	220	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:11:40.758209	2013-06-27 22:11:40.758209
6934	409	Menu item was shown: bundle 2,4,5	2013-06-27 22:11:41.189734	2013-06-27 22:11:41.189734
6935	220	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:11:41.408998	2013-06-27 22:11:41.408998
6936	220	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:11:42.139697	2013-06-27 22:11:42.139697
6937	220	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:42.714426	2013-06-27 22:11:42.714426
6938	220	Menu item was shown: bundle 3,4,5	2013-06-27 22:11:43.223482	2013-06-27 22:11:43.223482
6939	938	Menu item was shown: bundle 1,2	2013-06-27 22:11:43.748451	2013-06-27 22:11:43.748451
6940	220	Menu item was shown: bundle 2,4,5	2013-06-27 22:11:43.952357	2013-06-27 22:11:43.952357
6941	903	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:11:45.579198	2013-06-27 22:11:45.579198
6942	993	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:45.827825	2013-06-27 22:11:45.827825
6943	409	Menu item was shown: bundle 3,4,5	2013-06-27 22:11:46.532072	2013-06-27 22:11:46.532072
6944	409	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:11:47.452901	2013-06-27 22:11:47.452901
6945	409	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:11:48.254334	2013-06-27 22:11:48.254334
6946	731	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:48.40743	2013-06-27 22:11:48.40743
6947	993	Good 3 was clicked. Value is now: true	2013-06-27 22:11:49.335219	2013-06-27 22:11:49.335219
6948	993	Good 4 was clicked. Value is now: false	2013-06-27 22:11:49.709485	2013-06-27 22:11:49.709485
6949	993	Menu item was shown: bundle 3,4	2013-06-27 22:11:50.482955	2013-06-27 22:11:50.482955
6950	220	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:11:52.01002	2013-06-27 22:11:52.01002
6951	731	Combo was clicked. Value is now: true	2013-06-27 22:11:52.277914	2013-06-27 22:11:52.277914
6952	993	Menu item was shown: bundle 2,4	2013-06-27 22:11:52.426119	2013-06-27 22:11:52.426119
6953	220	Menu item was shown: bundle 2,4,5	2013-06-27 22:11:52.710856	2013-06-27 22:11:52.710856
6954	731	Menu item was shown: bundle 1,2	2013-06-27 22:11:53.174792	2013-06-27 22:11:53.174792
6955	993	Menu item was shown: bundle 2,3	2013-06-27 22:11:53.329342	2013-06-27 22:11:53.329342
6956	731	Menu item was shown: bundle 1,3	2013-06-27 22:11:53.481897	2013-06-27 22:11:53.481897
6957	731	Menu item was shown: bundle 2,3	2013-06-27 22:11:53.888174	2013-06-27 22:11:53.888174
6958	220	Menu item was shown: bundle 2,3,5	2013-06-27 22:11:53.945904	2013-06-27 22:11:53.945904
6959	993	Menu item was shown: bundle 1,4	2013-06-27 22:11:54.141893	2013-06-27 22:11:54.141893
6960	220	Menu item was shown: bundle 2,3,4	2013-06-27 22:11:54.670668	2013-06-27 22:11:54.670668
6961	220	Menu item was shown: bundle 1,4,5	2013-06-27 22:11:55.28519	2013-06-27 22:11:55.28519
6962	731	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:55.987633	2013-06-27 22:11:55.987633
6963	1006	Menu item was shown: bundle 1,3	2013-06-27 22:11:57.927222	2013-06-27 22:11:57.927222
6964	1006	Menu item was shown: bundle 1,2	2013-06-27 22:11:58.166836	2013-06-27 22:11:58.166836
6965	993	Menu item was shown: bundle 1,2,3	2013-06-27 22:11:58.319073	2013-06-27 22:11:58.319073
6966	1006	Menu item was shown: bundle 1,4	2013-06-27 22:12:00.048579	2013-06-27 22:12:00.048579
6967	1006	Menu item was shown: bundle 2,3	2013-06-27 22:12:00.420077	2013-06-27 22:12:00.420077
6968	938	Menu item was shown: bundle 1,3	2013-06-27 22:12:00.633799	2013-06-27 22:12:00.633799
6969	1006	Menu item was shown: bundle 2,4	2013-06-27 22:12:01.189845	2013-06-27 22:12:01.189845
6970	1096	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:12:01.397636	2013-06-27 22:12:01.397636
6971	539	Menu item was shown: bundle 3,4	2013-06-27 22:12:01.486951	2013-06-27 22:12:01.486951
6972	1006	Menu item was shown: bundle 3,4	2013-06-27 22:12:01.641568	2013-06-27 22:12:01.641568
6973	993	Menu item was shown: bundle 1,3	2013-06-27 22:12:02.004008	2013-06-27 22:12:02.004008
6974	1006	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:02.199872	2013-06-27 22:12:02.199872
6975	1096	Menu item was shown: bundle 2,3,4	2013-06-27 22:12:02.376012	2013-06-27 22:12:02.376012
6976	220	Menu item was shown: bundle 1,2,4	2013-06-27 22:12:02.514856	2013-06-27 22:12:02.514856
6977	1006	Menu item was shown: bundle 1,3,4	2013-06-27 22:12:02.874176	2013-06-27 22:12:02.874176
6978	1096	Menu item was shown: bundle 1,3,4	2013-06-27 22:12:03.113719	2013-06-27 22:12:03.113719
6979	993	Menu item was shown: bundle 1,2	2013-06-27 22:12:03.564776	2013-06-27 22:12:03.564776
6980	1006	Menu item was shown: bundle 1,2,4	2013-06-27 22:12:04.255354	2013-06-27 22:12:04.255354
6981	409	Menu item was shown: bundle 3,5	2013-06-27 22:12:06.111939	2013-06-27 22:12:06.111939
6982	993	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:07.114255	2013-06-27 22:12:07.114255
6983	1006	Menu item was shown: bundle 2,3,4	2013-06-27 22:12:07.665249	2013-06-27 22:12:07.665249
6984	1096	Good 1 was clicked. Value is now: true	2013-06-27 22:12:08.127309	2013-06-27 22:12:08.127309
6985	1096	Good 3 was clicked. Value is now: true	2013-06-27 22:12:08.325539	2013-06-27 22:12:08.325539
6986	539	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:12:08.422048	2013-06-27 22:12:08.422048
6987	938	Menu item was shown: bundle 2,3	2013-06-27 22:12:08.465133	2013-06-27 22:12:08.465133
6988	1096	Good 4 was clicked. Value is now: true	2013-06-27 22:12:08.514815	2013-06-27 22:12:08.514815
6989	1006	Menu item was shown: bundle 1,3,4	2013-06-27 22:12:08.590548	2013-06-27 22:12:08.590548
6990	1006	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:12:08.879793	2013-06-27 22:12:08.879793
6991	409	Menu item was hidden: bundle 3,5	2013-06-27 22:12:09.50445	2013-06-27 22:12:09.50445
6992	993	Menu item was shown: bundle 3,4	2013-06-27 22:12:10.37086	2013-06-27 22:12:10.37086
6993	409	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:12:12.435937	2013-06-27 22:12:12.435937
6994	993	Menu item was shown: bundle 2,4	2013-06-27 22:12:12.50704	2013-06-27 22:12:12.50704
6995	409	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:12:12.605464	2013-06-27 22:12:12.605464
6996	938	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:12.685173	2013-06-27 22:12:12.685173
6997	993	Menu item was shown: bundle 2,3	2013-06-27 22:12:12.795038	2013-06-27 22:12:12.795038
6998	993	Menu item was shown: bundle 1,4	2013-06-27 22:12:13.818498	2013-06-27 22:12:13.818498
6999	1096	Menu item was shown: bundle 1,2,4	2013-06-27 22:12:14.86109	2013-06-27 22:12:14.86109
7000	1096	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:15.419964	2013-06-27 22:12:15.419964
7001	938	Menu item was shown: bundle 1,2	2013-06-27 22:12:16.035034	2013-06-27 22:12:16.035034
7002	1096	Menu item was shown: bundle 2,4	2013-06-27 22:12:16.084739	2013-06-27 22:12:16.084739
7003	1006	Good 1 was clicked. Value is now: true	2013-06-27 22:12:16.162021	2013-06-27 22:12:16.162021
7004	539	Good 1 was clicked. Value is now: true	2013-06-27 22:12:16.229998	2013-06-27 22:12:16.229998
7005	938	Menu item was shown: bundle 1,3	2013-06-27 22:12:16.464961	2013-06-27 22:12:16.464961
7006	1006	Good 2 was clicked. Value is now: true	2013-06-27 22:12:16.543262	2013-06-27 22:12:16.543262
7007	1096	Menu item was shown: bundle 3,4	2013-06-27 22:12:16.606214	2013-06-27 22:12:16.606214
7008	539	Good 2 was clicked. Value is now: true	2013-06-27 22:12:16.702066	2013-06-27 22:12:16.702066
7009	1006	Good 3 was clicked. Value is now: true	2013-06-27 22:12:16.869172	2013-06-27 22:12:16.869172
7010	938	Menu item was shown: bundle 2,3	2013-06-27 22:12:17.175113	2013-06-27 22:12:17.175113
7011	1096	Menu item was shown: bundle 2,3	2013-06-27 22:12:17.47842	2013-06-27 22:12:17.47842
7012	1006	Good 4 was clicked. Value is now: true	2013-06-27 22:12:17.576886	2013-06-27 22:12:17.576886
7013	993	Menu item was shown: bundle 1,3	2013-06-27 22:12:17.709203	2013-06-27 22:12:17.709203
7014	1096	Menu item was shown: bundle 1,4	2013-06-27 22:12:17.925019	2013-06-27 22:12:17.925019
7015	1096	Menu item was shown: bundle 1,3	2013-06-27 22:12:18.226935	2013-06-27 22:12:18.226935
7016	539	Good 5 was clicked. Value is now: true	2013-06-27 22:12:18.331222	2013-06-27 22:12:18.331222
7017	938	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:18.399524	2013-06-27 22:12:18.399524
7018	993	Menu item was shown: bundle 1,2	2013-06-27 22:12:18.620775	2013-06-27 22:12:18.620775
7019	1096	Menu item was shown: bundle 1,2	2013-06-27 22:12:18.674538	2013-06-27 22:12:18.674538
7020	1006	Menu item was shown: bundle 2,3,4	2013-06-27 22:12:18.73154	2013-06-27 22:12:18.73154
7021	409	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:12:19.169894	2013-06-27 22:12:19.169894
7022	409	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:12:19.910594	2013-06-27 22:12:19.910594
7023	1006	Menu item was shown: bundle 1,3,4	2013-06-27 22:12:20.373663	2013-06-27 22:12:20.373663
7024	1006	Menu item was shown: bundle 1,2,4	2013-06-27 22:12:21.222779	2013-06-27 22:12:21.222779
7025	1096	Menu item was shown: bundle 1,3,4	2013-06-27 22:12:23.76853	2013-06-27 22:12:23.76853
7026	1006	Good 3 was clicked. Value is now: false	2013-06-27 22:12:28.480094	2013-06-27 22:12:28.480094
7027	1006	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:31.186087	2013-06-27 22:12:31.186087
7028	903	Menu item was hidden: bundle 2,3,4,5	2013-06-27 22:12:31.620535	2013-06-27 22:12:31.620535
7029	295	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:32.207834	2013-06-27 22:12:32.207834
7030	903	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:12:32.440895	2013-06-27 22:12:32.440895
7031	295	Combo was clicked. Value is now: true	2013-06-27 22:12:34.23611	2013-06-27 22:12:34.23611
7032	903	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:12:34.870229	2013-06-27 22:12:34.870229
7033	295	Menu item was shown: bundle 1,2	2013-06-27 22:12:35.68325	2013-06-27 22:12:35.68325
7034	903	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:12:36.550358	2013-06-27 22:12:36.550358
7035	295	Menu item was shown: bundle 1,3	2013-06-27 22:12:38.003851	2013-06-27 22:12:38.003851
7036	295	Menu item was shown: bundle 2,3	2013-06-27 22:12:38.992912	2013-06-27 22:12:38.992912
7037	295	Menu item was shown: bundle 1,2	2013-06-27 22:12:40.232779	2013-06-27 22:12:40.232779
7038	295	Menu item was shown: bundle 1,2,3	2013-06-27 22:12:41.071931	2013-06-27 22:12:41.071931
7039	903	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:13:00.486975	2013-06-27 22:13:00.486975
7040	981	Menu item was shown: bundle 1,2	2013-06-27 22:13:09.399467	2013-06-27 22:13:09.399467
7041	981	Menu item was shown: bundle 1,3	2013-06-27 22:13:10.016416	2013-06-27 22:13:10.016416
7042	981	Menu item was shown: bundle 1,4	2013-06-27 22:13:10.445912	2013-06-27 22:13:10.445912
7043	903	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:13:10.837836	2013-06-27 22:13:10.837836
7044	981	Menu item was shown: bundle 1,5	2013-06-27 22:13:11.057457	2013-06-27 22:13:11.057457
7045	903	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:13:12.3325	2013-06-27 22:13:12.3325
7046	981	Menu item was shown: bundle 1,3,5	2013-06-27 22:13:12.718765	2013-06-27 22:13:12.718765
7047	903	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:13:12.967733	2013-06-27 22:13:12.967733
7048	981	Menu item was shown: bundle 1,3,4	2013-06-27 22:13:13.091212	2013-06-27 22:13:13.091212
7049	903	Menu item was shown: bundle 3,4,5	2013-06-27 22:13:13.312495	2013-06-27 22:13:13.312495
7050	981	Menu item was shown: bundle 2,5	2013-06-27 22:13:14.060291	2013-06-27 22:13:14.060291
7051	981	Menu item was shown: bundle 2,4	2013-06-27 22:13:14.560089	2013-06-27 22:13:14.560089
7052	981	Menu item was shown: bundle 1,5	2013-06-27 22:13:15.022298	2013-06-27 22:13:15.022298
7053	981	Menu item was shown: bundle 1,4	2013-06-27 22:13:15.604392	2013-06-27 22:13:15.604392
7054	981	Menu item was shown: bundle 1,3	2013-06-27 22:13:16.426672	2013-06-27 22:13:16.426672
7055	981	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:13:17.868709	2013-06-27 22:13:17.868709
7056	981	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:13:18.384188	2013-06-27 22:13:18.384188
7057	981	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:13:19.251347	2013-06-27 22:13:19.251347
7058	981	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:13:19.981395	2013-06-27 22:13:19.981395
7059	981	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:13:20.445818	2013-06-27 22:13:20.445818
7060	903	Menu item was shown: bundle 2,4,5	2013-06-27 22:13:20.507712	2013-06-27 22:13:20.507712
7061	981	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:13:21.174341	2013-06-27 22:13:21.174341
7062	981	Combo was clicked. Value is now: true	2013-06-27 22:13:22.446567	2013-06-27 22:13:22.446567
7063	1118	Menu item was shown: bundle 1,2	2013-06-27 22:13:23.104237	2013-06-27 22:13:23.104237
7064	1118	Menu item was shown: bundle 1,3	2013-06-27 22:13:23.836675	2013-06-27 22:13:23.836675
7065	903	Menu item was shown: bundle 2,3,5	2013-06-27 22:13:25.724013	2013-06-27 22:13:25.724013
7066	1118	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:13:26.445954	2013-06-27 22:13:26.445954
7067	1118	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:13:27.314286	2013-06-27 22:13:27.314286
7068	1118	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:13:28.018301	2013-06-27 22:13:28.018301
7069	1118	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:13:28.683608	2013-06-27 22:13:28.683608
7070	1118	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:13:29.060896	2013-06-27 22:13:29.060896
7071	1118	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:13:29.605479	2013-06-27 22:13:29.605479
7072	1118	Menu item was shown: bundle 3,4,5	2013-06-27 22:13:30.04555	2013-06-27 22:13:30.04555
7073	1118	Menu item was shown: bundle 2,4,5	2013-06-27 22:13:30.528458	2013-06-27 22:13:30.528458
7074	1118	Menu item was shown: bundle 3,4,5	2013-06-27 22:13:31.315545	2013-06-27 22:13:31.315545
7075	1118	Menu item was shown: bundle 2,4,5	2013-06-27 22:13:35.337415	2013-06-27 22:13:35.337415
7076	1118	Menu item was shown: bundle 2,3,5	2013-06-27 22:13:35.933909	2013-06-27 22:13:35.933909
7077	1118	Menu item was shown: bundle 2,3,4	2013-06-27 22:13:36.382973	2013-06-27 22:13:36.382973
7078	1118	Menu item was shown: bundle 1,4,5	2013-06-27 22:13:36.84439	2013-06-27 22:13:36.84439
7079	1118	Menu item was shown: bundle 1,3,5	2013-06-27 22:13:42.542082	2013-06-27 22:13:42.542082
7080	1118	Menu item was shown: bundle 1,3,4	2013-06-27 22:13:43.169847	2013-06-27 22:13:43.169847
7081	903	Menu item was shown: bundle 2,3,4	2013-06-27 22:13:45.28427	2013-06-27 22:13:45.28427
7082	965	Menu item was shown: bundle 1,2,3	2013-06-27 22:13:46.83568	2013-06-27 22:13:46.83568
7083	965	Menu item was shown: bundle 2,3	2013-06-27 22:13:48.527696	2013-06-27 22:13:48.527696
7084	965	Menu item was shown: bundle 1,3	2013-06-27 22:13:48.994212	2013-06-27 22:13:48.994212
7085	965	Menu item was shown: bundle 1,2	2013-06-27 22:13:49.395745	2013-06-27 22:13:49.395745
7086	965	Menu item was shown: bundle 1,3	2013-06-27 22:13:50.754177	2013-06-27 22:13:50.754177
7087	1118	Menu item was shown: bundle 1,2,5	2013-06-27 22:13:51.297957	2013-06-27 22:13:51.297957
7088	965	Menu item was shown: bundle 2,3	2013-06-27 22:13:51.45076	2013-06-27 22:13:51.45076
7089	1082	Menu item was shown: bundle 1,2,3	2013-06-27 22:13:51.686906	2013-06-27 22:13:51.686906
7090	1118	Menu item was shown: bundle 1,2,4	2013-06-27 22:13:51.87175	2013-06-27 22:13:51.87175
7091	965	Menu item was shown: bundle 1,2	2013-06-27 22:13:52.140808	2013-06-27 22:13:52.140808
7092	1118	Menu item was shown: bundle 1,2,3	2013-06-27 22:13:52.41382	2013-06-27 22:13:52.41382
7093	965	Menu item was shown: bundle 1,3	2013-06-27 22:13:52.872441	2013-06-27 22:13:52.872441
7094	1082	Menu item was shown: bundle 2,3	2013-06-27 22:13:52.945863	2013-06-27 22:13:52.945863
7095	1118	Menu item was shown: bundle 4,5	2013-06-27 22:13:52.991788	2013-06-27 22:13:52.991788
7096	1118	Menu item was shown: bundle 3,5	2013-06-27 22:13:53.55725	2013-06-27 22:13:53.55725
7097	1118	Menu item was shown: bundle 3,4	2013-06-27 22:13:53.996609	2013-06-27 22:13:53.996609
7098	1118	Menu item was shown: bundle 2,5	2013-06-27 22:13:54.464438	2013-06-27 22:13:54.464438
7099	1118	Menu item was shown: bundle 2,4	2013-06-27 22:13:55.017737	2013-06-27 22:13:55.017737
7100	965	Menu item was shown: bundle 1,2,3	2013-06-27 22:13:55.661796	2013-06-27 22:13:55.661796
7101	1118	Menu item was shown: bundle 2,3	2013-06-27 22:13:55.70298	2013-06-27 22:13:55.70298
7102	1118	Menu item was shown: bundle 1,5	2013-06-27 22:13:56.348172	2013-06-27 22:13:56.348172
7103	1082	Good 3 was clicked. Value is now: true	2013-06-27 22:13:56.486248	2013-06-27 22:13:56.486248
7104	1118	Menu item was shown: bundle 1,4	2013-06-27 22:13:56.835458	2013-06-27 22:13:56.835458
7105	1082	Good 2 was clicked. Value is now: true	2013-06-27 22:13:56.975026	2013-06-27 22:13:56.975026
7106	903	Menu item was shown: bundle 1,4,5	2013-06-27 22:13:57.077634	2013-06-27 22:13:57.077634
7107	1118	Menu item was shown: bundle 1,3	2013-06-27 22:13:57.306692	2013-06-27 22:13:57.306692
7108	1118	Menu item was shown: bundle 1,2	2013-06-27 22:13:57.781229	2013-06-27 22:13:57.781229
7109	965	Combo was clicked. Value is now: true	2013-06-27 22:13:57.835694	2013-06-27 22:13:57.835694
7110	1082	Menu item was shown: bundle 1,3	2013-06-27 22:13:58.380967	2013-06-27 22:13:58.380967
7111	1082	Menu item was shown: bundle 1,2	2013-06-27 22:13:59.248918	2013-06-27 22:13:59.248918
7112	1118	Menu item was shown: bundle 1,3,4	2013-06-27 22:14:02.967063	2013-06-27 22:14:02.967063
7113	1118	Good 1 was clicked. Value is now: true	2013-06-27 22:14:07.954278	2013-06-27 22:14:07.954278
7114	1118	Good 3 was clicked. Value is now: true	2013-06-27 22:14:08.530994	2013-06-27 22:14:08.530994
7115	1118	Good 4 was clicked. Value is now: true	2013-06-27 22:14:08.953784	2013-06-27 22:14:08.953784
7116	1118	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:14:21.029202	2013-06-27 22:14:21.029202
7117	1118	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:14:22.264578	2013-06-27 22:14:22.264578
7118	1118	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:14:23.934985	2013-06-27 22:14:23.934985
7119	1118	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:14:25.216175	2013-06-27 22:14:25.216175
7120	1118	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:14:26.070518	2013-06-27 22:14:26.070518
7121	1118	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:14:26.89465	2013-06-27 22:14:26.89465
7122	904	Combo was clicked. Value is now: true	2013-06-27 22:14:29.739257	2013-06-27 22:14:29.739257
7123	1118	Menu item was shown: bundle 3,4,5	2013-06-27 22:14:30.737288	2013-06-27 22:14:30.737288
7124	904	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:14:32.196798	2013-06-27 22:14:32.196798
7125	1126	Menu item was shown: bundle 1,2	2013-06-27 22:14:35.285706	2013-06-27 22:14:35.285706
7126	1126	Menu item was hidden: bundle 1,2	2013-06-27 22:14:36.100158	2013-06-27 22:14:36.100158
7127	1126	Menu item was shown: bundle 1,3	2013-06-27 22:14:36.53462	2013-06-27 22:14:36.53462
7128	1126	Menu item was hidden: bundle 1,3	2013-06-27 22:14:37.099026	2013-06-27 22:14:37.099026
7129	1126	Menu item was shown: bundle 2,3	2013-06-27 22:14:37.562698	2013-06-27 22:14:37.562698
7130	1118	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:14:38.064642	2013-06-27 22:14:38.064642
7131	1126	Menu item was hidden: bundle 2,3	2013-06-27 22:14:38.154875	2013-06-27 22:14:38.154875
7132	904	Menu item was shown: bundle 1,2	2013-06-27 22:14:38.240734	2013-06-27 22:14:38.240734
7133	1126	Menu item was shown: bundle 1,2,3	2013-06-27 22:14:38.521732	2013-06-27 22:14:38.521732
7134	1126	Menu item was hidden: bundle 1,2,3	2013-06-27 22:14:39.341512	2013-06-27 22:14:39.341512
7135	1126	Menu item was shown: bundle 1,2	2013-06-27 22:14:39.580193	2013-06-27 22:14:39.580193
7136	1118	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:14:39.60514	2013-06-27 22:14:39.60514
7137	1118	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:14:40.290376	2013-06-27 22:14:40.290376
7138	1126	Menu item was hidden: bundle 1,2	2013-06-27 22:14:40.684835	2013-06-27 22:14:40.684835
7139	1126	Good 1 was clicked. Value is now: true	2013-06-27 22:14:41.941445	2013-06-27 22:14:41.941445
7140	1126	Good 2 was clicked. Value is now: true	2013-06-27 22:14:42.343389	2013-06-27 22:14:42.343389
7141	1118	Menu item was shown: bundle 3,4,5	2013-06-27 22:14:43.115358	2013-06-27 22:14:43.115358
7142	904	Menu item was shown: bundle 1,3	2013-06-27 22:14:46.011656	2013-06-27 22:14:46.011656
7143	1118	Menu item was shown: bundle 2,4,5	2013-06-27 22:14:47.240217	2013-06-27 22:14:47.240217
7144	1118	Menu item was shown: bundle 2,3,5	2013-06-27 22:14:47.998434	2013-06-27 22:14:47.998434
7145	1046	Menu item was shown: bundle 1,2	2013-06-27 22:14:50.032314	2013-06-27 22:14:50.032314
7146	1046	Menu item was shown: bundle 1,3	2013-06-27 22:14:52.566207	2013-06-27 22:14:52.566207
7147	1046	Menu item was shown: bundle 1,4	2013-06-27 22:14:53.637009	2013-06-27 22:14:53.637009
7148	904	Menu item was shown: bundle 1,4	2013-06-27 22:14:56.289281	2013-06-27 22:14:56.289281
7149	1118	Menu item was shown: bundle 2,3,4	2013-06-27 22:14:56.614369	2013-06-27 22:14:56.614369
7150	904	Menu item was shown: bundle 1,5	2013-06-27 22:14:57.152743	2013-06-27 22:14:57.152743
7151	904	Menu item was shown: bundle 2,3	2013-06-27 22:14:58.120843	2013-06-27 22:14:58.120843
7152	904	Menu item was shown: bundle 2,4	2013-06-27 22:15:00.600389	2013-06-27 22:15:00.600389
7153	1046	Menu item was shown: bundle 1,5	2013-06-27 22:15:01.398319	2013-06-27 22:15:01.398319
7154	1118	Menu item was shown: bundle 1,4,5	2013-06-27 22:15:02.948225	2013-06-27 22:15:02.948225
7155	1046	Menu item was shown: bundle 2,3	2013-06-27 22:15:03.046372	2013-06-27 22:15:03.046372
7156	904	Menu item was shown: bundle 2,5	2013-06-27 22:15:03.586982	2013-06-27 22:15:03.586982
7157	414	Good 2 was clicked. Value is now: true	2013-06-27 22:15:03.732229	2013-06-27 22:15:03.732229
7158	414	Menu item was shown: bundle 1,2	2013-06-27 22:15:04.424104	2013-06-27 22:15:04.424104
7159	414	Menu item was shown: bundle 1,3	2013-06-27 22:15:05.014306	2013-06-27 22:15:05.014306
7160	1046	Menu item was shown: bundle 2,4	2013-06-27 22:15:05.49904	2013-06-27 22:15:05.49904
7161	1046	Menu item was shown: bundle 2,5	2013-06-27 22:15:06.715618	2013-06-27 22:15:06.715618
7162	904	Menu item was shown: bundle 3,4	2013-06-27 22:15:06.915681	2013-06-27 22:15:06.915681
7163	1046	Menu item was shown: bundle 3,4	2013-06-27 22:15:07.367893	2013-06-27 22:15:07.367893
7164	414	Menu item was shown: bundle 1,4	2013-06-27 22:15:07.544906	2013-06-27 22:15:07.544906
7165	904	Menu item was shown: bundle 3,5	2013-06-27 22:15:08.007496	2013-06-27 22:15:08.007496
7166	414	Menu item was shown: bundle 2,3	2013-06-27 22:15:08.193808	2013-06-27 22:15:08.193808
7167	414	Menu item was shown: bundle 2,4	2013-06-27 22:15:09.32674	2013-06-27 22:15:09.32674
7168	1046	Menu item was shown: bundle 3,5	2013-06-27 22:15:09.361099	2013-06-27 22:15:09.361099
7169	414	Menu item was shown: bundle 3,4	2013-06-27 22:15:10.206669	2013-06-27 22:15:10.206669
7170	1046	Menu item was shown: bundle 4,5	2013-06-27 22:15:10.280869	2013-06-27 22:15:10.280869
7171	414	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:10.741855	2013-06-27 22:15:10.741855
7172	1046	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:11.065137	2013-06-27 22:15:11.065137
7173	414	Menu item was shown: bundle 3,4	2013-06-27 22:15:11.28074	2013-06-27 22:15:11.28074
7174	1118	Menu item was shown: bundle 1,3,5	2013-06-27 22:15:11.408019	2013-06-27 22:15:11.408019
7175	904	Menu item was shown: bundle 4,5	2013-06-27 22:15:11.59624	2013-06-27 22:15:11.59624
7176	1118	Menu item was shown: bundle 1,3,4	2013-06-27 22:15:12.091068	2013-06-27 22:15:12.091068
7177	1022	Menu item was shown: bundle 1,2	2013-06-27 22:15:13.905492	2013-06-27 22:15:13.905492
7178	414	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:13.95285	2013-06-27 22:15:13.95285
7179	1046	Menu item was shown: bundle 1,2,4	2013-06-27 22:15:15.137951	2013-06-27 22:15:15.137951
7180	904	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:15.162702	2013-06-27 22:15:15.162702
7181	414	Good 1 was clicked. Value is now: true	2013-06-27 22:15:15.716111	2013-06-27 22:15:15.716111
7182	1046	Menu item was shown: bundle 1,2,5	2013-06-27 22:15:16.187962	2013-06-27 22:15:16.187962
7183	414	Good 3 was clicked. Value is now: true	2013-06-27 22:15:16.610115	2013-06-27 22:15:16.610115
7184	1046	Menu item was shown: bundle 1,3,4	2013-06-27 22:15:16.999428	2013-06-27 22:15:16.999428
7185	1046	Menu item was shown: bundle 1,3,5	2013-06-27 22:15:18.521016	2013-06-27 22:15:18.521016
7186	1118	Menu item was shown: bundle 1,2,5	2013-06-27 22:15:18.584045	2013-06-27 22:15:18.584045
7187	1022	Menu item was shown: bundle 1,3	2013-06-27 22:15:18.992793	2013-06-27 22:15:18.992793
7188	1118	Menu item was shown: bundle 1,2,4	2013-06-27 22:15:19.189381	2013-06-27 22:15:19.189381
7189	1118	Menu item was shown: bundle 1,2,5	2013-06-27 22:15:19.824588	2013-06-27 22:15:19.824588
7190	904	Menu item was shown: bundle 1,2,4	2013-06-27 22:15:20.227654	2013-06-27 22:15:20.227654
7191	414	Menu item was shown: bundle 1,2,4	2013-06-27 22:15:20.772767	2013-06-27 22:15:20.772767
7192	1118	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:21.138876	2013-06-27 22:15:21.138876
7193	1118	Menu item was shown: bundle 4,5	2013-06-27 22:15:21.834349	2013-06-27 22:15:21.834349
7194	1022	Menu item was shown: bundle 2,3	2013-06-27 22:15:21.922564	2013-06-27 22:15:21.922564
7195	1118	Menu item was shown: bundle 3,5	2013-06-27 22:15:23.062047	2013-06-27 22:15:23.062047
7196	1046	Menu item was shown: bundle 1,4,5	2013-06-27 22:15:23.482482	2013-06-27 22:15:23.482482
7197	1118	Menu item was shown: bundle 3,4	2013-06-27 22:15:24.413857	2013-06-27 22:15:24.413857
7198	1022	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:24.602002	2013-06-27 22:15:24.602002
7199	1118	Menu item was shown: bundle 2,5	2013-06-27 22:15:25.361122	2013-06-27 22:15:25.361122
7200	414	Menu item was shown: bundle 1,3,4	2013-06-27 22:15:25.807566	2013-06-27 22:15:25.807566
7201	414	Menu item was shown: bundle 2,3,4	2013-06-27 22:15:26.726274	2013-06-27 22:15:26.726274
7202	1022	Menu item was shown: bundle 1,2	2013-06-27 22:15:27.299172	2013-06-27 22:15:27.299172
7203	414	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:15:27.534813	2013-06-27 22:15:27.534813
7204	1022	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:28.790836	2013-06-27 22:15:28.790836
7205	1046	Menu item was shown: bundle 2,3,4	2013-06-27 22:15:28.857623	2013-06-27 22:15:28.857623
7206	414	Menu item was shown: bundle 1,2,4	2013-06-27 22:15:29.294428	2013-06-27 22:15:29.294428
7207	1046	Menu item was shown: bundle 2,3,5	2013-06-27 22:15:29.538857	2013-06-27 22:15:29.538857
7208	1046	Menu item was shown: bundle 2,4,5	2013-06-27 22:15:30.327702	2013-06-27 22:15:30.327702
7209	1022	Menu item was shown: bundle 1,2	2013-06-27 22:15:30.425331	2013-06-27 22:15:30.425331
7210	904	Menu item was shown: bundle 1,2,5	2013-06-27 22:15:30.519001	2013-06-27 22:15:30.519001
7211	1118	Menu item was shown: bundle 2,4	2013-06-27 22:15:30.601697	2013-06-27 22:15:30.601697
7212	1046	Menu item was shown: bundle 3,4,5	2013-06-27 22:15:30.993826	2013-06-27 22:15:30.993826
7213	1118	Menu item was shown: bundle 2,3	2013-06-27 22:15:31.552755	2013-06-27 22:15:31.552755
7214	1118	Menu item was shown: bundle 1,5	2013-06-27 22:15:32.679337	2013-06-27 22:15:32.679337
7215	1118	Menu item was shown: bundle 1,4	2013-06-27 22:15:33.360071	2013-06-27 22:15:33.360071
7216	1022	Menu item was shown: bundle 1,3	2013-06-27 22:15:34.255317	2013-06-27 22:15:34.255317
7217	904	Menu item was shown: bundle 1,3,4	2013-06-27 22:15:34.426432	2013-06-27 22:15:34.426432
7218	414	Menu item was shown: bundle 1,2,3	2013-06-27 22:15:34.720141	2013-06-27 22:15:34.720141
7219	1118	Menu item was shown: bundle 1,3	2013-06-27 22:15:35.547149	2013-06-27 22:15:35.547149
7220	1046	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:15:36.869768	2013-06-27 22:15:36.869768
7221	1022	Menu item was shown: bundle 1,2	2013-06-27 22:15:36.959072	2013-06-27 22:15:36.959072
7222	1118	Menu item was shown: bundle 1,2	2013-06-27 22:15:38.319	2013-06-27 22:15:38.319
7223	1022	Good 1 was clicked. Value is now: true	2013-06-27 22:15:39.188919	2013-06-27 22:15:39.188919
7224	1022	Good 2 was clicked. Value is now: true	2013-06-27 22:15:40.035649	2013-06-27 22:15:40.035649
7225	904	Menu item was shown: bundle 1,3,5	2013-06-27 22:15:44.448839	2013-06-27 22:15:44.448839
7226	1046	Good 1 was clicked. Value is now: true	2013-06-27 22:15:45.033311	2013-06-27 22:15:45.033311
7227	1046	Good 2 was clicked. Value is now: true	2013-06-27 22:15:46.349197	2013-06-27 22:15:46.349197
7228	1046	Good 3 was clicked. Value is now: true	2013-06-27 22:15:47.143338	2013-06-27 22:15:47.143338
7229	1046	Good 4 was clicked. Value is now: true	2013-06-27 22:15:48.0107	2013-06-27 22:15:48.0107
7230	1046	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:15:49.257951	2013-06-27 22:15:49.257951
7231	904	Menu item was shown: bundle 1,4,5	2013-06-27 22:15:49.530396	2013-06-27 22:15:49.530396
7232	904	Menu item was shown: bundle 2,3,4	2013-06-27 22:15:54.655267	2013-06-27 22:15:54.655267
7233	1046	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:15:57.504246	2013-06-27 22:15:57.504246
7234	904	Menu item was shown: bundle 2,3,5	2013-06-27 22:16:00.084366	2013-06-27 22:16:00.084366
7235	904	Menu item was shown: bundle 2,4,5	2013-06-27 22:16:01.83811	2013-06-27 22:16:01.83811
7236	1046	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:16:06.934449	2013-06-27 22:16:06.934449
7237	1046	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:16:08.009504	2013-06-27 22:16:08.009504
7238	1046	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:16:13.89095	2013-06-27 22:16:13.89095
7239	1001	Combo was clicked. Value is now: true	2013-06-27 22:16:14.178444	2013-06-27 22:16:14.178444
7240	1001	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:16:15.568817	2013-06-27 22:16:15.568817
7241	1001	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:16:16.266452	2013-06-27 22:16:16.266452
7242	904	Menu item was shown: bundle 3,4,5	2013-06-27 22:16:16.9896	2013-06-27 22:16:16.9896
7243	1001	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:16:17.027481	2013-06-27 22:16:17.027481
7244	1001	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:16:17.653864	2013-06-27 22:16:17.653864
7245	1001	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:16:18.562686	2013-06-27 22:16:18.562686
7246	1001	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:16:18.964307	2013-06-27 22:16:18.964307
7247	1001	Menu item was shown: bundle 3,4,5	2013-06-27 22:16:19.730485	2013-06-27 22:16:19.730485
7248	1001	Menu item was shown: bundle 2,4,5	2013-06-27 22:16:20.433724	2013-06-27 22:16:20.433724
7249	904	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:16:22.1321	2013-06-27 22:16:22.1321
7250	211	Good 1 was clicked. Value is now: true	2013-06-27 22:16:22.194703	2013-06-27 22:16:22.194703
7251	211	Menu item was shown: bundle 1,2,3	2013-06-27 22:16:23.552754	2013-06-27 22:16:23.552754
7252	211	Menu item was hidden: bundle 1,2,3	2013-06-27 22:16:24.1767	2013-06-27 22:16:24.1767
7253	1046	Good 5 was clicked. Value is now: true	2013-06-27 22:16:24.573704	2013-06-27 22:16:24.573704
7254	211	Combo was clicked. Value is now: true	2013-06-27 22:16:25.334055	2013-06-27 22:16:25.334055
7255	211	Menu item was shown: bundle 1,2	2013-06-27 22:16:26.279799	2013-06-27 22:16:26.279799
7256	211	Menu item was shown: bundle 1,3	2013-06-27 22:16:27.200835	2013-06-27 22:16:27.200835
7257	211	Menu item was shown: bundle 2,3	2013-06-27 22:16:27.625688	2013-06-27 22:16:27.625688
7258	1001	Good 2 was clicked. Value is now: true	2013-06-27 22:16:29.50415	2013-06-27 22:16:29.50415
7259	904	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:16:29.563677	2013-06-27 22:16:29.563677
7260	1001	Good 4 was clicked. Value is now: true	2013-06-27 22:16:30.537947	2013-06-27 22:16:30.537947
7261	1001	Good 5 was clicked. Value is now: true	2013-06-27 22:16:30.834333	2013-06-27 22:16:30.834333
7262	1001	Menu item was shown: bundle 2,3,5	2013-06-27 22:16:41.271583	2013-06-27 22:16:41.271583
7263	904	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:16:41.53644	2013-06-27 22:16:41.53644
7264	1001	Menu item was shown: bundle 2,3,4	2013-06-27 22:16:44.548691	2013-06-27 22:16:44.548691
7265	1001	Menu item was shown: bundle 1,4,5	2013-06-27 22:16:45.857346	2013-06-27 22:16:45.857346
7266	1001	Menu item was shown: bundle 1,3,5	2013-06-27 22:16:46.455057	2013-06-27 22:16:46.455057
7267	1001	Menu item was shown: bundle 1,3,4	2013-06-27 22:16:47.401422	2013-06-27 22:16:47.401422
7268	1001	Menu item was shown: bundle 1,2,5	2013-06-27 22:16:48.258971	2013-06-27 22:16:48.258971
7269	1001	Menu item was shown: bundle 1,2,4	2013-06-27 22:16:49.06358	2013-06-27 22:16:49.06358
7270	904	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:16:49.613432	2013-06-27 22:16:49.613432
7271	1118	Menu item was shown: bundle 1,3,4	2013-06-27 22:16:53.259965	2013-06-27 22:16:53.259965
7272	1001	Good 5 was clicked. Value is now: false	2013-06-27 22:17:01.212674	2013-06-27 22:17:01.212674
7273	1001	Good 1 was clicked. Value is now: true	2013-06-27 22:17:01.747601	2013-06-27 22:17:01.747601
7274	904	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:17:02.470792	2013-06-27 22:17:02.470792
7275	1001	Menu item was shown: bundle 1,2,3	2013-06-27 22:17:09.44766	2013-06-27 22:17:09.44766
7276	1001	Menu item was shown: bundle 4,5	2013-06-27 22:17:10.131051	2013-06-27 22:17:10.131051
7277	1001	Menu item was shown: bundle 3,5	2013-06-27 22:17:10.644562	2013-06-27 22:17:10.644562
7278	1001	Menu item was shown: bundle 3,4	2013-06-27 22:17:11.468355	2013-06-27 22:17:11.468355
7279	1001	Menu item was shown: bundle 2,5	2013-06-27 22:17:12.177417	2013-06-27 22:17:12.177417
7280	1001	Menu item was shown: bundle 2,4	2013-06-27 22:17:13.011539	2013-06-27 22:17:13.011539
7281	1001	Menu item was shown: bundle 2,3	2013-06-27 22:17:15.179939	2013-06-27 22:17:15.179939
7282	1001	Menu item was shown: bundle 1,5	2013-06-27 22:17:15.595671	2013-06-27 22:17:15.595671
7283	1001	Menu item was shown: bundle 1,4	2013-06-27 22:17:16.089633	2013-06-27 22:17:16.089633
7284	1001	Menu item was shown: bundle 1,3	2013-06-27 22:17:16.600922	2013-06-27 22:17:16.600922
7285	1001	Menu item was shown: bundle 1,2	2013-06-27 22:17:17.028943	2013-06-27 22:17:17.028943
7286	904	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:17:27.681957	2013-06-27 22:17:27.681957
7287	1107	Menu item was shown: bundle 1,2	2013-06-27 22:18:27.340331	2013-06-27 22:18:27.340331
7288	1107	Menu item was shown: bundle 1,3	2013-06-27 22:18:27.77087	2013-06-27 22:18:27.77087
7289	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:28.174844	2013-06-27 22:18:28.174844
7290	1107	Menu item was shown: bundle 1,2,3	2013-06-27 22:18:28.629227	2013-06-27 22:18:28.629227
7291	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:29.427586	2013-06-27 22:18:29.427586
7292	1107	Menu item was shown: bundle 1,3	2013-06-27 22:18:31.918268	2013-06-27 22:18:31.918268
7293	1107	Menu item was shown: bundle 1,2	2013-06-27 22:18:35.161101	2013-06-27 22:18:35.161101
7294	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:39.956478	2013-06-27 22:18:39.956478
7295	1107	Menu item was shown: bundle 1,2	2013-06-27 22:18:43.350718	2013-06-27 22:18:43.350718
7296	1107	Menu item was shown: bundle 1,2,3	2013-06-27 22:18:45.114388	2013-06-27 22:18:45.114388
7297	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:46.908522	2013-06-27 22:18:46.908522
7298	1107	Menu item was shown: bundle 1,2	2013-06-27 22:18:47.572457	2013-06-27 22:18:47.572457
7299	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:48.216803	2013-06-27 22:18:48.216803
7300	1090	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:18:51.005761	2013-06-27 22:18:51.005761
7301	1107	Menu item was shown: bundle 1,2	2013-06-27 22:18:54.267386	2013-06-27 22:18:54.267386
7302	1090	Good 1 was clicked. Value is now: true	2013-06-27 22:18:55.791624	2013-06-27 22:18:55.791624
7303	1090	Good 2 was clicked. Value is now: true	2013-06-27 22:18:56.204187	2013-06-27 22:18:56.204187
7304	1090	Good 3 was clicked. Value is now: true	2013-06-27 22:18:57.060117	2013-06-27 22:18:57.060117
7305	1090	Good 4 was clicked. Value is now: true	2013-06-27 22:18:57.44255	2013-06-27 22:18:57.44255
7306	1090	Menu item was shown: bundle 2,3,4	2013-06-27 22:18:59.225847	2013-06-27 22:18:59.225847
7307	1107	Menu item was shown: bundle 2,3	2013-06-27 22:18:59.49327	2013-06-27 22:18:59.49327
7308	1090	Menu item was shown: bundle 1,3,4	2013-06-27 22:19:00.620334	2013-06-27 22:19:00.620334
7309	1090	Menu item was shown: bundle 1,2,4	2013-06-27 22:19:06.475094	2013-06-27 22:19:06.475094
7310	1090	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:07.366069	2013-06-27 22:19:07.366069
7311	1090	Menu item was shown: bundle 1,2,4	2013-06-27 22:19:08.084178	2013-06-27 22:19:08.084178
7312	1090	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:09.251103	2013-06-27 22:19:09.251103
7313	1090	Menu item was shown: bundle 1,2,4	2013-06-27 22:19:10.083433	2013-06-27 22:19:10.083433
7314	1090	Menu item was shown: bundle 2,3,4	2013-06-27 22:19:11.564684	2013-06-27 22:19:11.564684
7315	1090	Menu item was shown: bundle 1,3,4	2013-06-27 22:19:11.994578	2013-06-27 22:19:11.994578
7316	1107	Menu item was shown: bundle 1,3	2013-06-27 22:19:24.63617	2013-06-27 22:19:24.63617
7317	905	Combo was clicked. Value is now: true	2013-06-27 22:19:28.91553	2013-06-27 22:19:28.91553
7318	905	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:30.570601	2013-06-27 22:19:30.570601
7319	1107	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:32.95459	2013-06-27 22:19:32.95459
7320	905	Menu item was shown: bundle 2,3	2013-06-27 22:19:33.057882	2013-06-27 22:19:33.057882
7321	905	Menu item was shown: bundle 1,3	2013-06-27 22:19:34.418404	2013-06-27 22:19:34.418404
7322	1107	Menu item was shown: bundle 1,2	2013-06-27 22:19:34.758484	2013-06-27 22:19:34.758484
7323	905	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:39.113108	2013-06-27 22:19:39.113108
7324	905	Menu item was shown: bundle 1,3	2013-06-27 22:19:39.894697	2013-06-27 22:19:39.894697
7325	905	Good 1 was clicked. Value is now: true	2013-06-27 22:19:41.313124	2013-06-27 22:19:41.313124
7326	905	Good 3 was clicked. Value is now: true	2013-06-27 22:19:42.00488	2013-06-27 22:19:42.00488
7327	905	Menu item was shown: bundle 1,2	2013-06-27 22:19:43.930007	2013-06-27 22:19:43.930007
7328	905	Menu item was shown: bundle 1,3	2013-06-27 22:19:45.451393	2013-06-27 22:19:45.451393
7329	905	Menu item was shown: bundle 2,3	2013-06-27 22:19:46.087681	2013-06-27 22:19:46.087681
7330	905	Menu item was shown: bundle 1,2,3	2013-06-27 22:19:47.124842	2013-06-27 22:19:47.124842
7331	905	Menu item was shown: bundle 2,3	2013-06-27 22:20:01.218177	2013-06-27 22:20:01.218177
7332	905	Menu item was shown: bundle 1,3	2013-06-27 22:20:02.103893	2013-06-27 22:20:02.103893
7333	1107	Menu item was shown: bundle 2,3	2013-06-27 22:20:29.250779	2013-06-27 22:20:29.250779
7334	1107	Good 2 was clicked. Value is now: true	2013-06-27 22:20:30.627549	2013-06-27 22:20:30.627549
7335	1107	Good 3 was clicked. Value is now: true	2013-06-27 22:20:31.333811	2013-06-27 22:20:31.333811
7336	1111	Menu item was shown: bundle 1,2	2013-06-27 22:23:34.091257	2013-06-27 22:23:34.091257
7337	1111	Menu item was shown: bundle 1,3	2013-06-27 22:23:34.717224	2013-06-27 22:23:34.717224
7338	1111	Menu item was shown: bundle 1,4	2013-06-27 22:23:38.121058	2013-06-27 22:23:38.121058
7339	1111	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:23:40.824768	2013-06-27 22:23:40.824768
7340	1111	Menu item was shown: bundle 2,3,4,5	2013-06-27 22:23:45.930348	2013-06-27 22:23:45.930348
7341	1111	Menu item was shown: bundle 1,3,4,5	2013-06-27 22:23:46.577117	2013-06-27 22:23:46.577117
7342	1111	Menu item was shown: bundle 1,2,4,5	2013-06-27 22:23:47.324129	2013-06-27 22:23:47.324129
7343	1111	Menu item was shown: bundle 1,2,3,5	2013-06-27 22:23:47.717772	2013-06-27 22:23:47.717772
7344	1111	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:23:48.092952	2013-06-27 22:23:48.092952
7345	1111	Menu item was shown: bundle 3,4,5	2013-06-27 22:23:52.706065	2013-06-27 22:23:52.706065
7346	1111	Menu item was shown: bundle 2,4,5	2013-06-27 22:23:56.861064	2013-06-27 22:23:56.861064
7347	1111	Menu item was shown: bundle 2,3,5	2013-06-27 22:24:00.590612	2013-06-27 22:24:00.590612
7348	1111	Menu item was shown: bundle 2,3,4	2013-06-27 22:24:01.226683	2013-06-27 22:24:01.226683
7349	1111	Menu item was shown: bundle 1,4,5	2013-06-27 22:24:01.89084	2013-06-27 22:24:01.89084
7350	1111	Menu item was shown: bundle 1,3,5	2013-06-27 22:24:02.359584	2013-06-27 22:24:02.359584
7351	1111	Menu item was shown: bundle 1,2,3,4,5	2013-06-27 22:24:08.275696	2013-06-27 22:24:08.275696
7352	1111	Menu item was shown: bundle 1,2	2013-06-27 22:24:10.024572	2013-06-27 22:24:10.024572
7353	1111	Menu item was shown: bundle 1,3	2013-06-27 22:24:10.436388	2013-06-27 22:24:10.436388
7354	1111	Menu item was shown: bundle 1,4	2013-06-27 22:24:10.958259	2013-06-27 22:24:10.958259
7355	1111	Menu item was shown: bundle 1,3	2013-06-27 22:24:11.760215	2013-06-27 22:24:11.760215
7356	1111	Menu item was shown: bundle 1,5	2013-06-27 22:24:13.591415	2013-06-27 22:24:13.591415
7357	1111	Menu item was shown: bundle 2,3	2013-06-27 22:24:13.940484	2013-06-27 22:24:13.940484
7358	1111	Menu item was shown: bundle 2,4	2013-06-27 22:24:14.300938	2013-06-27 22:24:14.300938
7359	1111	Menu item was shown: bundle 2,5	2013-06-27 22:24:14.899224	2013-06-27 22:24:14.899224
7360	1111	Menu item was shown: bundle 3,4	2013-06-27 22:24:15.296108	2013-06-27 22:24:15.296108
7361	1111	Menu item was shown: bundle 3,5	2013-06-27 22:24:15.713001	2013-06-27 22:24:15.713001
7362	1111	Menu item was shown: bundle 4,5	2013-06-27 22:24:16.148643	2013-06-27 22:24:16.148643
7363	1111	Menu item was shown: bundle 1,2,3	2013-06-27 22:24:16.646589	2013-06-27 22:24:16.646589
7364	1111	Menu item was shown: bundle 1,2,4	2013-06-27 22:24:17.735446	2013-06-27 22:24:17.735446
7365	1111	Menu item was shown: bundle 1,2,5	2013-06-27 22:24:18.152137	2013-06-27 22:24:18.152137
7366	1111	Menu item was shown: bundle 1,3,4	2013-06-27 22:24:18.517158	2013-06-27 22:24:18.517158
7367	1111	Menu item was shown: bundle 1,2,5	2013-06-27 22:24:19.279579	2013-06-27 22:24:19.279579
7368	1111	Menu item was shown: bundle 1,3,5	2013-06-27 22:24:20.056401	2013-06-27 22:24:20.056401
7369	1111	Combo was clicked. Value is now: true	2013-06-27 22:24:21.297889	2013-06-27 22:24:21.297889
7370	1111	Menu item was shown: bundle 1,4,5	2013-06-27 22:24:22.808741	2013-06-27 22:24:22.808741
7371	1111	Menu item was shown: bundle 2,3,4	2013-06-27 22:24:24.312758	2013-06-27 22:24:24.312758
7372	1111	Menu item was shown: bundle 2,3,5	2013-06-27 22:24:24.72892	2013-06-27 22:24:24.72892
7373	1111	Menu item was shown: bundle 2,4,5	2013-06-27 22:24:25.171253	2013-06-27 22:24:25.171253
7374	1111	Menu item was shown: bundle 3,4,5	2013-06-27 22:24:25.626166	2013-06-27 22:24:25.626166
7375	1111	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:24:26.017283	2013-06-27 22:24:26.017283
7376	1111	Menu item was shown: bundle 3,4,5	2013-06-27 22:24:26.480842	2013-06-27 22:24:26.480842
7377	1116	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:29:10.911664	2013-06-27 22:29:10.911664
7378	1116	Combo was clicked. Value is now: true	2013-06-27 22:29:13.598728	2013-06-27 22:29:13.598728
7379	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:29:14.799698	2013-06-27 22:29:14.799698
7380	1116	Menu item was shown: bundle 1,3,4	2013-06-27 22:29:15.542138	2013-06-27 22:29:15.542138
7381	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:29:16.144686	2013-06-27 22:29:16.144686
7382	1116	Menu item was shown: bundle 1,3,4	2013-06-27 22:29:28.063987	2013-06-27 22:29:28.063987
7383	1116	Menu item was hidden: bundle 1,3,4	2013-06-27 22:29:28.575198	2013-06-27 22:29:28.575198
7384	1116	Menu item was shown: bundle 1,2,4	2013-06-27 22:29:29.091909	2013-06-27 22:29:29.091909
7385	1116	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:29:30.164432	2013-06-27 22:29:30.164432
7386	1116	Menu item was shown: bundle 1,2,3	2013-06-27 22:29:30.931883	2013-06-27 22:29:30.931883
7387	1116	Menu item was shown: bundle 3,4	2013-06-27 22:29:32.029861	2013-06-27 22:29:32.029861
7388	1116	Menu item was shown: bundle 2,4	2013-06-27 22:29:32.749384	2013-06-27 22:29:32.749384
7389	1116	Menu item was shown: bundle 2,3	2013-06-27 22:29:33.238273	2013-06-27 22:29:33.238273
7390	1116	Menu item was shown: bundle 1,4	2013-06-27 22:29:33.702974	2013-06-27 22:29:33.702974
7391	1116	Menu item was shown: bundle 1,3	2013-06-27 22:29:34.171014	2013-06-27 22:29:34.171014
7392	1116	Menu item was shown: bundle 1,2	2013-06-27 22:29:34.58441	2013-06-27 22:29:34.58441
7393	1116	Menu item was shown: bundle 1,3	2013-06-27 22:29:35.12152	2013-06-27 22:29:35.12152
7394	1116	Menu item was shown: bundle 1,2	2013-06-27 22:29:37.767399	2013-06-27 22:29:37.767399
7395	1116	Menu item was shown: bundle 1,3	2013-06-27 22:29:41.774403	2013-06-27 22:29:41.774403
7396	1116	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:29:44.397633	2013-06-27 22:29:44.397633
7397	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:29:46.219047	2013-06-27 22:29:46.219047
7398	1116	Menu item was shown: bundle 1,3,4	2013-06-27 22:29:51.578977	2013-06-27 22:29:51.578977
7399	1116	Menu item was shown: bundle 1,2,4	2013-06-27 22:29:52.113093	2013-06-27 22:29:52.113093
7400	1116	Menu item was shown: bundle 1,2,3	2013-06-27 22:29:52.487571	2013-06-27 22:29:52.487571
7401	1116	Menu item was shown: bundle 3,4	2013-06-27 22:29:53.048268	2013-06-27 22:29:53.048268
7402	1116	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:31:23.020096	2013-06-27 22:31:23.020096
7403	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:31:25.827183	2013-06-27 22:31:25.827183
7404	1116	Menu item was shown: bundle 2,3	2013-06-27 22:31:26.340497	2013-06-27 22:31:26.340497
7405	1116	Menu item was shown: bundle 1,3,4	2013-06-27 22:31:27.389592	2013-06-27 22:31:27.389592
7406	1116	Menu item was shown: bundle 1,2,3	2013-06-27 22:31:27.784125	2013-06-27 22:31:27.784125
7407	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:31:29.557818	2013-06-27 22:31:29.557818
7408	1116	Menu item was shown: bundle 1,2,3,4	2013-06-27 22:31:30.559512	2013-06-27 22:31:30.559512
7409	1116	Menu item was shown: bundle 2,3,4	2013-06-27 22:33:18.208536	2013-06-27 22:33:18.208536
7410	1116	Menu item was shown: bundle 1,3,4	2013-06-27 22:33:20.556031	2013-06-27 22:33:20.556031
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: good
--

COPY questions (id, user_id, previous_question_id, duration, time_started, "values", effects, created_at, updated_at, instruction_id, display_timer, display_formula) FROM stdin;
222	27	\N	300	2013-06-27 21:10:17.891	{"1":2,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":3,"[2, 3]":0,"[1, 2, 3]":0}	2013-06-27 21:06:24.848935	2013-06-27 21:10:26.254793	1	t	f
404	41	\N	300	2013-06-27 21:10:54.235	{"1":1,"2":1,"3":1}	{"[1, 2]":2,"[1, 3]":-4,"[2, 3]":-3,"[1, 2, 3]":-4}	2013-06-27 21:06:37.504426	2013-06-27 21:10:59.621524	1	t	f
196	25	\N	300	2013-06-27 21:11:15.484	{"1":0,"2":0,"3":0}	{"[1, 2]":3,"[1, 3]":2,"[2, 3]":2,"[1, 2, 3]":1}	2013-06-27 21:06:22.337389	2013-06-27 21:11:55.691628	1	t	f
697	63	690	136	2013-06-27 21:15:37.271	{"1":2,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":-2,"[2, 3]":4,"[1, 2, 3]":4}	2013-06-27 21:06:47.169981	2013-06-27 21:16:37.038004	5	f	f
226	27	232	300	2013-06-27 21:20:27.293	{"1":2,"2":2,"3":2,"4":0}	{"[1, 2]":1,"[1, 3]":-1,"[1, 4]":-1,"[2, 3]":4,"[2, 4]":3,"[3, 4]":2,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 3, 4]":-3,"[2, 3, 4]":-4,"[1, 2, 3, 4]":1}	2013-06-27 21:06:24.917284	2013-06-27 21:20:35.376442	3	t	f
698	63	694	92	2013-06-27 21:24:30.938	{"1":2,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":4}	2013-06-27 21:06:47.17929	2013-06-27 21:25:30.649099	5	f	f
215	26	212	300	2013-06-27 21:41:07.991	{"1":0,"2":0,"3":2,"4":0,"5":0}	{"[1, 2]":-3,"[1, 3]":-1,"[1, 4]":2,"[1, 5]":1,"[2, 3]":2,"[2, 4]":4,"[2, 5]":3,"[3, 4]":1,"[3, 5]":1,"[4, 5]":0,"[1, 2, 3]":-4,"[1, 2, 4]":1,"[1, 2, 5]":1,"[1, 3, 4]":-2,"[1, 3, 5]":2,"[1, 4, 5]":0,"[2, 3, 4]":4,"[2, 3, 5]":-2,"[2, 4, 5]":-3,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:23.627315	2013-06-27 21:41:22.64929	4	t	f
232	27	222	84	2013-06-27 21:15:27.735	{"1":1,"2":1,"3":1,"4":1}	{"[1, 2]":-3,"[1, 3]":-4,"[1, 4]":-3,"[2, 3]":2,"[2, 4]":0,"[3, 4]":2,"[1, 2, 3]":-3,"[1, 2, 4]":4,"[1, 3, 4]":-2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:25.094534	2013-06-27 21:15:35.942788	6	f	f
297	32	292	85	2013-06-27 21:33:57.903	{"1":0,"2":0,"3":0,"4":2}	{"[1, 2]":-1,"[1, 3]":3,"[1, 4]":-2,"[2, 3]":-1,"[2, 4]":0,"[3, 4]":4,"[1, 2, 3]":0,"[1, 2, 4]":-3,"[1, 3, 4]":-3,"[2, 3, 4]":-1,"[1, 2, 3, 4]":0}	2013-06-27 21:06:29.697545	2013-06-27 21:34:18.486601	6	f	f
202	25	206	300	2013-06-27 21:21:31.054	{"1":0,"2":1,"3":2,"4":0,"5":2}	{"[1, 2]":3,"[1, 3]":-2,"[1, 4]":-3,"[1, 5]":-1,"[2, 3]":3,"[2, 4]":4,"[2, 5]":0,"[3, 4]":-4,"[3, 5]":-2,"[4, 5]":1,"[1, 2, 3]":2,"[1, 2, 4]":-4,"[1, 2, 5]":4,"[1, 3, 4]":2,"[1, 3, 5]":-1,"[1, 4, 5]":3,"[2, 3, 4]":-3,"[2, 3, 5]":-4,"[2, 4, 5]":0,"[3, 4, 5]":1,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:22.542438	2013-06-27 21:22:10.685864	4	t	f
203	25	198	144	2013-06-27 22:03:27.463	{"1":0,"2":2,"3":1}	{"[1, 2]":2,"[1, 3]":-1,"[2, 3]":1,"[1, 2, 3]":4}	2013-06-27 21:06:22.570007	2013-06-27 22:04:06.905613	5	f	f
206	25	196	50	2013-06-27 21:16:51.28	{"1":1,"2":2,"3":1,"4":2}	{"[1, 2]":-3,"[1, 3]":-1,"[1, 4]":-4,"[2, 3]":4,"[2, 4]":-4,"[3, 4]":0,"[1, 2, 3]":-4,"[1, 2, 4]":4,"[1, 3, 4]":1,"[2, 3, 4]":0,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:22.642411	2013-06-27 21:17:30.960617	6	f	f
199	25	202	300	2013-06-27 21:26:18.385	{"1":2,"2":2,"3":1,"4":2}	{"[1, 2]":0,"[1, 3]":2,"[1, 4]":0,"[2, 3]":-3,"[2, 4]":-3,"[3, 4]":0,"[1, 2, 3]":-4,"[1, 2, 4]":-3,"[1, 3, 4]":2,"[2, 3, 4]":3,"[1, 2, 3, 4]":1}	2013-06-27 21:06:22.448635	2013-06-27 21:26:57.983927	3	t	f
204	25	207	235	2013-06-27 21:45:11.973	{"1":1,"2":0,"3":2}	{"[1, 2]":4,"[1, 3]":4,"[2, 3]":1,"[1, 2, 3]":0}	2013-06-27 21:06:22.598407	2013-06-27 21:45:52.070979	5	f	f
209	26	\N	300	2013-06-27 21:13:22.391	{"1":2,"2":0,"3":1}	{"[1, 2]":2,"[1, 3]":-3,"[2, 3]":4,"[1, 2, 3]":1}	2013-06-27 21:06:23.420687	2013-06-27 21:13:37.181067	1	t	f
210	26	221	300	2013-06-27 21:24:54.286	{"1":1,"2":0,"3":1}	{"[1, 2]":2,"[1, 3]":0,"[2, 3]":-2,"[1, 2, 3]":1}	2013-06-27 21:06:23.493234	2013-06-27 21:25:09.013197	2	t	f
131	20	\N	300	2013-04-11 19:12:38.438	{"1":2,"2":2,"3":0}	{"[1, 2]":3,"[1, 3]":1,"[2, 3]":4,"[1, 2, 3]":-4}	2013-04-11 19:08:02.590026	2013-04-11 19:13:27.675196	1	t	f
133	20	131	300	2013-04-11 19:17:16.112	{"1":0,"2":2,"3":2}	{"[1, 2]":3,"[1, 3]":-3,"[2, 3]":-4,"[1, 2, 3]":4}	2013-04-11 19:08:02.598962	2013-04-11 19:18:05.044916	2	t	f
139	20	133	49	2013-04-11 19:22:41.685	{"1":1,"2":2,"3":2}	{"[1, 2]":4,"[1, 3]":0,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-04-11 19:08:02.685394	2013-04-11 19:23:30.621655	5	f	f
132	20	139	300	2013-04-11 19:27:05.094	{"1":0,"2":1,"3":0}	{"[1, 2]":-1,"[1, 3]":1,"[2, 3]":1,"[1, 2, 3]":-1}	2013-04-11 19:08:02.595359	2013-04-11 19:27:53.873463	2	t	f
142	20	132	103	2013-04-11 19:31:32.752	{"1":0,"2":0,"3":2,"4":2,"5":1}	{"[1, 2]":-4,"[1, 3]":1,"[1, 4]":-3,"[1, 5]":1,"[2, 3]":0,"[2, 4]":1,"[2, 5]":-1,"[3, 4]":-3,"[3, 5]":-2,"[4, 5]":0,"[1, 2, 3]":-1,"[1, 2, 4]":0,"[1, 2, 5]":-4,"[1, 3, 4]":-4,"[1, 3, 5]":4,"[1, 4, 5]":1,"[2, 3, 4]":0,"[2, 3, 5]":0,"[2, 4, 5]":3,"[3, 4, 5]":-2,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":3}	2013-04-11 19:08:02.700641	2013-04-11 19:32:21.519791	7	f	f
143	20	142	79	2013-04-11 19:35:53.325	{"1":1,"2":0,"3":0,"4":0,"5":2}	{"[1, 2]":4,"[1, 3]":4,"[1, 4]":-1,"[1, 5]":4,"[2, 3]":-4,"[2, 4]":0,"[2, 5]":-4,"[3, 4]":4,"[3, 5]":2,"[4, 5]":-4,"[1, 2, 3]":2,"[1, 2, 4]":1,"[1, 2, 5]":3,"[1, 3, 4]":-2,"[1, 3, 5]":3,"[1, 4, 5]":4,"[2, 3, 4]":4,"[2, 3, 5]":-1,"[2, 4, 5]":1,"[3, 4, 5]":4,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":3}	2013-04-11 19:08:02.704835	2013-04-11 19:36:42.28464	7	f	f
138	20	143	187	2013-04-11 19:40:12.024	{"1":1,"2":2,"3":1}	{"[1, 2]":-2,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":0}	2013-04-11 19:08:02.680481	2013-04-11 19:41:00.848827	5	f	f
134	20	138	300	2013-04-11 19:44:30.047	{"1":1,"2":1,"3":0,"4":0}	{"[1, 2]":0,"[1, 3]":-3,"[1, 4]":-2,"[2, 3]":-1,"[2, 4]":-3,"[3, 4]":-3,"[1, 2, 3]":-3,"[1, 2, 4]":1,"[1, 3, 4]":2,"[2, 3, 4]":-3,"[1, 2, 3, 4]":3}	2013-04-11 19:08:02.603042	2013-04-11 19:45:19.03959	3	t	f
135	20	134	300	2013-04-11 19:48:46.876	{"1":0,"2":2,"3":2,"4":1}	{"[1, 2]":2,"[1, 3]":4,"[1, 4]":1,"[2, 3]":3,"[2, 4]":2,"[3, 4]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":-4,"[1, 3, 4]":-3,"[2, 3, 4]":0,"[1, 2, 3, 4]":1}	2013-04-11 19:08:02.607112	2013-04-11 19:49:35.875666	3	t	f
141	20	135	201	2013-04-11 19:53:11.401	{"1":2,"2":1,"3":2,"4":0}	{"[1, 2]":2,"[1, 3]":-2,"[1, 4]":-4,"[2, 3]":3,"[2, 4]":2,"[3, 4]":3,"[1, 2, 3]":-2,"[1, 2, 4]":-1,"[1, 3, 4]":-2,"[2, 3, 4]":-2,"[1, 2, 3, 4]":2}	2013-04-11 19:08:02.696354	2013-04-11 19:54:00.347201	6	f	f
140	20	137	79	2013-04-11 20:06:04.713	{"1":0,"2":0,"3":2,"4":2}	{"[1, 2]":-3,"[1, 3]":4,"[1, 4]":-1,"[2, 3]":2,"[2, 4]":0,"[3, 4]":-2,"[1, 2, 3]":0,"[1, 2, 4]":4,"[1, 3, 4]":-2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-3}	2013-04-11 19:08:02.690658	2013-04-11 20:06:53.547635	6	f	f
201	25	199	300	2013-06-27 21:31:15.927	{"1":1,"2":1,"3":2,"4":2,"5":2}	{"[1, 2]":3,"[1, 3]":-3,"[1, 4]":-4,"[1, 5]":-1,"[2, 3]":4,"[2, 4]":2,"[2, 5]":-4,"[3, 4]":1,"[3, 5]":-4,"[4, 5]":1,"[1, 2, 3]":-4,"[1, 2, 4]":-4,"[1, 2, 5]":4,"[1, 3, 4]":-1,"[1, 3, 5]":-1,"[1, 4, 5]":1,"[2, 3, 4]":4,"[2, 3, 5]":-4,"[2, 4, 5]":2,"[3, 4, 5]":2,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:22.50108	2013-06-27 21:31:55.897549	4	t	f
200	25	201	300	2013-06-27 21:35:44.563	{"1":1,"2":2,"3":2,"4":0}	{"[1, 2]":4,"[1, 3]":-3,"[1, 4]":1,"[2, 3]":-2,"[2, 4]":-1,"[3, 4]":4,"[1, 2, 3]":3,"[1, 2, 4]":-3,"[1, 3, 4]":-4,"[2, 3, 4]":-1,"[1, 2, 3, 4]":4}	2013-06-27 21:06:22.46493	2013-06-27 21:36:24.16152	3	t	f
207	25	200	79	2013-06-27 21:40:30.413	{"1":1,"2":1,"3":2,"4":1,"5":2}	{"[1, 2]":-2,"[1, 3]":-3,"[1, 4]":2,"[1, 5]":-1,"[2, 3]":-1,"[2, 4]":-4,"[2, 5]":-4,"[3, 4]":4,"[3, 5]":-2,"[4, 5]":2,"[1, 2, 3]":-1,"[1, 2, 4]":1,"[1, 2, 5]":-3,"[1, 3, 4]":-4,"[1, 3, 5]":4,"[1, 4, 5]":4,"[2, 3, 4]":1,"[2, 3, 5]":3,"[2, 4, 5]":3,"[3, 4, 5]":0,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-4,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:22.680652	2013-06-27 21:41:10.030421	7	f	f
197	25	204	300	2013-06-27 21:49:40.856	{"1":1,"2":1,"3":2}	{"[1, 2]":3,"[1, 3]":2,"[2, 3]":-4,"[1, 2, 3]":0}	2013-06-27 21:06:22.382757	2013-06-27 21:50:20.468557	2	t	f
208	25	197	161	2013-06-27 21:54:14.239	{"1":1,"2":2,"3":1,"4":0,"5":2}	{"[1, 2]":-4,"[1, 3]":-2,"[1, 4]":-1,"[1, 5]":-2,"[2, 3]":-2,"[2, 4]":-2,"[2, 5]":4,"[3, 4]":2,"[3, 5]":-3,"[4, 5]":-3,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 2, 5]":1,"[1, 3, 4]":1,"[1, 3, 5]":-2,"[1, 4, 5]":-4,"[2, 3, 4]":-3,"[2, 3, 5]":1,"[2, 4, 5]":-1,"[3, 4, 5]":-3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:22.716254	2013-06-27 21:54:53.868726	7	f	f
198	25	208	300	2013-06-27 21:58:42.793	{"1":0,"2":0,"3":0}	{"[1, 2]":2,"[1, 3]":-4,"[2, 3]":2,"[1, 2, 3]":1}	2013-06-27 21:06:22.424994	2013-06-27 21:59:22.396534	2	t	f
205	25	203	36	2013-06-27 22:08:09.125	{"1":1,"2":1,"3":0,"4":0}	{"[1, 2]":0,"[1, 3]":0,"[1, 4]":3,"[2, 3]":-2,"[2, 4]":4,"[3, 4]":-1,"[1, 2, 3]":-1,"[1, 2, 4]":2,"[1, 3, 4]":0,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:22.618858	2013-06-27 22:08:48.62466	6	f	f
211	26	220	300	2013-06-27 22:16:06.024	{"1":2,"2":0,"3":0}	{"[1, 2]":-2,"[1, 3]":2,"[2, 3]":-2,"[1, 2, 3]":4}	2013-06-27 21:06:23.546957	2013-06-27 22:16:20.745247	2	t	f
221	26	209	108	2013-06-27 21:19:38.795	{"1":0,"2":2,"3":0,"4":0,"5":0}	{"[1, 2]":0,"[1, 3]":-3,"[1, 4]":-1,"[1, 5]":2,"[2, 3]":3,"[2, 4]":-4,"[2, 5]":4,"[3, 4]":2,"[3, 5]":1,"[4, 5]":4,"[1, 2, 3]":3,"[1, 2, 4]":3,"[1, 2, 5]":2,"[1, 3, 4]":0,"[1, 3, 5]":1,"[1, 4, 5]":1,"[2, 3, 4]":-4,"[2, 3, 5]":3,"[2, 4, 5]":3,"[3, 4, 5]":-2,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:23.742157	2013-06-27 21:19:53.446965	7	f	f
156	21	154	21	2013-04-11 20:01:40.56	{"1":1,"2":2,"3":0,"4":2,"5":2}	{"[1, 2]":-4,"[1, 3]":4,"[1, 4]":-2,"[1, 5]":4,"[2, 3]":3,"[2, 4]":-2,"[2, 5]":4,"[3, 4]":3,"[3, 5]":4,"[4, 5]":3,"[1, 2, 3]":-1,"[1, 2, 4]":-3,"[1, 2, 5]":3,"[1, 3, 4]":-1,"[1, 3, 5]":-4,"[1, 4, 5]":0,"[2, 3, 4]":-1,"[2, 3, 5]":4,"[2, 4, 5]":2,"[3, 4, 5]":2,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":-1}	2013-04-11 19:08:04.939404	2013-04-11 20:02:31.338896	7	f	f
137	20	136	300	2013-04-11 20:01:47.543	{"1":2,"2":2,"3":1,"4":1,"5":2}	{"[1, 2]":4,"[1, 3]":-1,"[1, 4]":2,"[1, 5]":-4,"[2, 3]":0,"[2, 4]":-2,"[2, 5]":3,"[3, 4]":-4,"[3, 5]":-1,"[4, 5]":4,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 2, 5]":1,"[1, 3, 4]":2,"[1, 3, 5]":2,"[1, 4, 5]":0,"[2, 3, 4]":3,"[2, 3, 5]":2,"[2, 4, 5]":4,"[3, 4, 5]":3,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":3}	2013-04-11 19:08:02.676414	2013-04-11 20:02:36.569556	4	t	f
216	26	210	73	2013-06-27 21:30:51.695	{"1":0,"2":1,"3":0}	{"[1, 2]":4,"[1, 3]":0,"[2, 3]":1,"[1, 2, 3]":0}	2013-06-27 21:06:23.6437	2013-06-27 21:31:06.403535	5	f	f
212	26	216	300	2013-06-27 21:35:57.337	{"1":0,"2":0,"3":2,"4":1}	{"[1, 2]":4,"[1, 3]":-4,"[1, 4]":2,"[2, 3]":1,"[2, 4]":-4,"[3, 4]":2,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 3, 4]":-2,"[2, 3, 4]":3,"[1, 2, 3, 4]":3}	2013-06-27 21:06:23.568096	2013-06-27 21:36:11.986938	3	t	f
144	21	\N	300	2013-04-11 19:11:59.675	{"1":0,"2":0,"3":0}	{"[1, 2]":-1,"[1, 3]":4,"[2, 3]":4,"[1, 2, 3]":3}	2013-04-11 19:08:04.873815	2013-04-11 19:12:50.440017	1	t	f
147	21	144	300	2013-04-11 19:17:20.085	{"1":2,"2":1,"3":2,"4":1}	{"[1, 2]":3,"[1, 3]":-4,"[1, 4]":3,"[2, 3]":-1,"[2, 4]":-4,"[3, 4]":4,"[1, 2, 3]":4,"[1, 2, 4]":-3,"[1, 3, 4]":-2,"[2, 3, 4]":1,"[1, 2, 3, 4]":-2}	2013-04-11 19:08:04.886983	2013-04-11 19:18:10.858473	3	t	f
152	21	147	23	2013-04-11 19:22:26.028	{"1":2,"2":0,"3":1}	{"[1, 2]":2,"[1, 3]":2,"[2, 3]":3,"[1, 2, 3]":-4}	2013-04-11 19:08:04.906921	2013-04-11 19:23:16.749703	5	f	f
153	21	152	171	2013-04-11 19:26:48.287	{"1":2,"2":1,"3":1,"4":1}	{"[1, 2]":0,"[1, 3]":2,"[1, 4]":-3,"[2, 3]":4,"[2, 4]":2,"[3, 4]":-2,"[1, 2, 3]":-4,"[1, 2, 4]":3,"[1, 3, 4]":-1,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-1}	2013-04-11 19:08:04.910852	2013-04-11 19:27:38.834756	6	f	f
155	21	153	55	2013-04-11 19:31:34.318	{"1":0,"2":0,"3":0,"4":0,"5":1}	{"[1, 2]":2,"[1, 3]":2,"[1, 4]":-1,"[1, 5]":-4,"[2, 3]":-3,"[2, 4]":2,"[2, 5]":-2,"[3, 4]":4,"[3, 5]":-2,"[4, 5]":-4,"[1, 2, 3]":-3,"[1, 2, 4]":-2,"[1, 2, 5]":3,"[1, 3, 4]":-2,"[1, 3, 5]":-2,"[1, 4, 5]":-4,"[2, 3, 4]":4,"[2, 3, 5]":3,"[2, 4, 5]":-1,"[3, 4, 5]":-4,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":1}	2013-04-11 19:08:04.934864	2013-04-11 19:32:24.884507	7	f	f
145	21	155	300	2013-04-11 19:35:56.12	{"1":1,"2":2,"3":0}	{"[1, 2]":2,"[1, 3]":-2,"[2, 3]":4,"[1, 2, 3]":4}	2013-04-11 19:08:04.879124	2013-04-11 19:36:46.779174	2	t	f
151	21	145	80	2013-04-11 19:40:14.996	{"1":2,"2":0,"3":0}	{"[1, 2]":-3,"[1, 3]":-1,"[2, 3]":-2,"[1, 2, 3]":3}	2013-04-11 19:08:04.902984	2013-04-11 19:41:05.766377	5	f	f
146	21	151	300	2013-04-11 19:44:35.199	{"1":0,"2":0,"3":1}	{"[1, 2]":-2,"[1, 3]":3,"[2, 3]":-2,"[1, 2, 3]":4}	2013-04-11 19:08:04.88317	2013-04-11 19:45:26.413969	2	t	f
148	21	146	300	2013-04-11 19:48:51.965	{"1":2,"2":1,"3":0,"4":1}	{"[1, 2]":3,"[1, 3]":3,"[1, 4]":-4,"[2, 3]":2,"[2, 4]":-1,"[3, 4]":0,"[1, 2, 3]":4,"[1, 2, 4]":1,"[1, 3, 4]":-2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-3}	2013-04-11 19:08:04.890698	2013-04-11 19:49:42.754003	3	t	f
150	21	148	300	2013-04-11 19:53:06.145	{"1":1,"2":0,"3":2,"4":1,"5":0}	{"[1, 2]":3,"[1, 3]":4,"[1, 4]":3,"[1, 5]":2,"[2, 3]":-3,"[2, 4]":4,"[2, 5]":0,"[3, 4]":3,"[3, 5]":-2,"[4, 5]":0,"[1, 2, 3]":-4,"[1, 2, 4]":3,"[1, 2, 5]":3,"[1, 3, 4]":-2,"[1, 3, 5]":3,"[1, 4, 5]":-2,"[2, 3, 4]":-2,"[2, 3, 5]":2,"[2, 4, 5]":1,"[3, 4, 5]":0,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":4}	2013-04-11 19:08:04.89875	2013-04-11 19:53:56.90993	4	t	f
154	21	150	129	2013-04-11 19:57:23.987	{"1":0,"2":1,"3":2,"4":0}	{"[1, 2]":-1,"[1, 3]":-3,"[1, 4]":1,"[2, 3]":2,"[2, 4]":-4,"[3, 4]":3,"[1, 2, 3]":-3,"[1, 2, 4]":3,"[1, 3, 4]":-3,"[2, 3, 4]":1,"[1, 2, 3, 4]":2}	2013-04-11 19:08:04.91511	2013-04-11 19:58:14.641441	6	f	f
136	20	141	300	2013-04-11 19:57:31.421	{"1":2,"2":2,"3":0,"4":1,"5":1}	{"[1, 2]":1,"[1, 3]":3,"[1, 4]":-3,"[1, 5]":4,"[2, 3]":3,"[2, 4]":4,"[2, 5]":1,"[3, 4]":-2,"[3, 5]":0,"[4, 5]":-1,"[1, 2, 3]":-4,"[1, 2, 4]":-1,"[1, 2, 5]":3,"[1, 3, 4]":4,"[1, 3, 5]":2,"[1, 4, 5]":2,"[2, 3, 4]":-4,"[2, 3, 5]":4,"[2, 4, 5]":-4,"[3, 4, 5]":-1,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":-3}	2013-04-11 19:08:02.672012	2013-04-11 19:58:20.393556	4	t	f
217	26	215	118	2013-06-27 21:46:23.6	{"1":0,"2":0,"3":1}	{"[1, 2]":-3,"[1, 3]":-3,"[2, 3]":4,"[1, 2, 3]":-4}	2013-06-27 21:06:23.657429	2013-06-27 21:46:38.390176	5	f	f
163	22	161	300	2013-04-11 20:03:00.271	{"1":1,"2":0,"3":1,"4":1,"5":2}	{"[1, 2]":-2,"[1, 3]":-1,"[1, 4]":2,"[1, 5]":-4,"[2, 3]":3,"[2, 4]":2,"[2, 5]":4,"[3, 4]":2,"[3, 5]":1,"[4, 5]":0,"[1, 2, 3]":4,"[1, 2, 4]":4,"[1, 2, 5]":4,"[1, 3, 4]":-4,"[1, 3, 5]":2,"[1, 4, 5]":1,"[2, 3, 4]":-1,"[2, 3, 5]":-1,"[2, 4, 5]":-2,"[3, 4, 5]":-3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":3}	2013-04-11 19:08:09.365283	2013-04-11 20:04:05.19429	4	t	f
149	21	156	300	2013-04-11 20:05:54.741	{"1":1,"2":1,"3":0,"4":0,"5":1}	{"[1, 2]":0,"[1, 3]":3,"[1, 4]":1,"[1, 5]":-1,"[2, 3]":2,"[2, 4]":0,"[2, 5]":-4,"[3, 4]":2,"[3, 5]":2,"[4, 5]":-1,"[1, 2, 3]":4,"[1, 2, 4]":4,"[1, 2, 5]":4,"[1, 3, 4]":3,"[1, 3, 5]":2,"[1, 4, 5]":1,"[2, 3, 4]":-3,"[2, 3, 5]":2,"[2, 4, 5]":-4,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-1,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":-2}	2013-04-11 19:08:04.894879	2013-04-11 20:06:45.584403	4	t	f
157	22	\N	300	2013-04-11 19:12:23.402	{"1":0,"2":2,"3":2}	{"[1, 2]":-4,"[1, 3]":1,"[2, 3]":-4,"[1, 2, 3]":-3}	2013-04-11 19:08:09.338891	2013-04-11 19:13:28.280977	1	t	f
166	22	157	91	2013-04-11 19:17:54.637	{"1":2,"2":2,"3":2,"4":1}	{"[1, 2]":3,"[1, 3]":1,"[1, 4]":0,"[2, 3]":-3,"[2, 4]":0,"[3, 4]":-1,"[1, 2, 3]":-4,"[1, 2, 4]":-4,"[1, 3, 4]":-4,"[2, 3, 4]":2,"[1, 2, 3, 4]":-4}	2013-04-11 19:08:09.377553	2013-04-11 19:18:59.549397	6	f	f
158	22	166	300	2013-04-11 19:22:06.773	{"1":2,"2":2,"3":1}	{"[1, 2]":1,"[1, 3]":-2,"[2, 3]":-3,"[1, 2, 3]":-2}	2013-04-11 19:08:09.345513	2013-04-11 19:23:11.623297	2	t	f
164	22	158	23	2013-04-11 19:26:13.269	{"1":0,"2":2,"3":1}	{"[1, 2]":1,"[1, 3]":2,"[2, 3]":3,"[1, 2, 3]":3}	2013-04-11 19:08:09.369238	2013-04-11 19:27:18.117215	5	f	f
167	22	164	68	2013-04-11 19:30:18.934	{"1":2,"2":0,"3":0,"4":1}	{"[1, 2]":4,"[1, 3]":2,"[1, 4]":-1,"[2, 3]":0,"[2, 4]":4,"[3, 4]":-2,"[1, 2, 3]":0,"[1, 2, 4]":3,"[1, 3, 4]":3,"[2, 3, 4]":4,"[1, 2, 3, 4]":2}	2013-04-11 19:08:09.381727	2013-04-11 19:31:23.800124	6	f	f
159	22	167	300	2013-04-11 19:34:32.521	{"1":2,"2":1,"3":0}	{"[1, 2]":2,"[1, 3]":-2,"[2, 3]":4,"[1, 2, 3]":1}	2013-04-11 19:08:09.34959	2013-04-11 19:35:37.238024	2	t	f
168	22	159	92	2013-04-11 19:38:37.1	{"1":2,"2":0,"3":1,"4":1,"5":0}	{"[1, 2]":-1,"[1, 3]":0,"[1, 4]":-4,"[1, 5]":-1,"[2, 3]":4,"[2, 4]":4,"[2, 5]":0,"[3, 4]":0,"[3, 5]":2,"[4, 5]":4,"[1, 2, 3]":-2,"[1, 2, 4]":3,"[1, 2, 5]":4,"[1, 3, 4]":-2,"[1, 3, 5]":3,"[1, 4, 5]":-2,"[2, 3, 4]":4,"[2, 3, 5]":2,"[2, 4, 5]":1,"[3, 4, 5]":2,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":-3}	2013-04-11 19:08:09.414148	2013-04-11 19:39:42.048997	7	f	f
165	22	168	12	2013-04-11 19:42:38.552	{"1":1,"2":1,"3":2}	{"[1, 2]":-2,"[1, 3]":3,"[2, 3]":2,"[1, 2, 3]":-2}	2013-04-11 19:08:09.373375	2013-04-11 19:43:43.42196	5	f	f
169	22	165	52	2013-04-11 19:46:48.004	{"1":2,"2":0,"3":1,"4":1,"5":2}	{"[1, 2]":3,"[1, 3]":0,"[1, 4]":-3,"[1, 5]":2,"[2, 3]":4,"[2, 4]":4,"[2, 5]":3,"[3, 4]":1,"[3, 5]":-1,"[4, 5]":0,"[1, 2, 3]":-4,"[1, 2, 4]":3,"[1, 2, 5]":-1,"[1, 3, 4]":4,"[1, 3, 5]":-1,"[1, 4, 5]":-3,"[2, 3, 4]":2,"[2, 3, 5]":4,"[2, 4, 5]":1,"[3, 4, 5]":1,"[1, 2, 3, 4]":-1,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-3}	2013-04-11 19:08:09.419245	2013-04-11 19:47:52.745437	7	f	f
162	22	169	300	2013-04-11 19:50:50.465	{"1":0,"2":2,"3":2,"4":1,"5":2}	{"[1, 2]":4,"[1, 3]":1,"[1, 4]":-1,"[1, 5]":2,"[2, 3]":-3,"[2, 4]":1,"[2, 5]":-2,"[3, 4]":-1,"[3, 5]":1,"[4, 5]":2,"[1, 2, 3]":-1,"[1, 2, 4]":-3,"[1, 2, 5]":4,"[1, 3, 4]":1,"[1, 3, 5]":1,"[1, 4, 5]":2,"[2, 3, 4]":-1,"[2, 3, 5]":4,"[2, 4, 5]":-2,"[3, 4, 5]":2,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":0}	2013-04-11 19:08:09.361771	2013-04-11 19:51:55.401726	4	t	f
160	22	162	300	2013-04-11 19:54:52.37	{"1":1,"2":1,"3":2,"4":2}	{"[1, 2]":2,"[1, 3]":0,"[1, 4]":-3,"[2, 3]":-3,"[2, 4]":1,"[3, 4]":-3,"[1, 2, 3]":0,"[1, 2, 4]":-3,"[1, 3, 4]":0,"[2, 3, 4]":-2,"[1, 2, 3, 4]":1}	2013-04-11 19:08:09.353949	2013-04-11 19:55:57.26871	3	t	f
161	22	160	300	2013-04-11 19:58:53.892	{"1":1,"2":1,"3":0,"4":2}	{"[1, 2]":4,"[1, 3]":0,"[1, 4]":-2,"[2, 3]":-4,"[2, 4]":1,"[3, 4]":-2,"[1, 2, 3]":-1,"[1, 2, 4]":-4,"[1, 3, 4]":3,"[2, 3, 4]":-3,"[1, 2, 3, 4]":2}	2013-04-11 19:08:09.358005	2013-04-11 19:59:58.782039	3	t	f
213	26	217	300	2013-06-27 21:51:18.946	{"1":0,"2":1,"3":2,"4":2}	{"[1, 2]":1,"[1, 3]":-4,"[1, 4]":-4,"[2, 3]":-4,"[2, 4]":1,"[3, 4]":-1,"[1, 2, 3]":3,"[1, 2, 4]":-2,"[1, 3, 4]":-2,"[2, 3, 4]":1,"[1, 2, 3, 4]":2}	2013-06-27 21:06:23.588175	2013-06-27 21:51:33.667427	3	t	f
214	26	213	300	2013-06-27 21:56:12.326	{"1":2,"2":0,"3":2,"4":1,"5":0}	{"[1, 2]":4,"[1, 3]":4,"[1, 4]":-4,"[1, 5]":3,"[2, 3]":-1,"[2, 4]":-2,"[2, 5]":-2,"[3, 4]":-1,"[3, 5]":-1,"[4, 5]":3,"[1, 2, 3]":4,"[1, 2, 4]":4,"[1, 2, 5]":0,"[1, 3, 4]":-1,"[1, 3, 5]":-1,"[1, 4, 5]":3,"[2, 3, 4]":1,"[2, 3, 5]":-2,"[2, 4, 5]":3,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-1,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:23.608347	2013-06-27 21:56:27.257556	4	t	f
219	26	214	73	2013-06-27 22:01:15.609	{"1":0,"2":2,"3":1,"4":1}	{"[1, 2]":-4,"[1, 3]":-4,"[1, 4]":1,"[2, 3]":4,"[2, 4]":-2,"[3, 4]":0,"[1, 2, 3]":-2,"[1, 2, 4]":4,"[1, 3, 4]":2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:23.698994	2013-06-27 22:01:30.26641	6	f	f
218	26	219	43	2013-06-27 22:06:19.282	{"1":2,"2":1,"3":1,"4":1}	{"[1, 2]":-2,"[1, 3]":1,"[1, 4]":3,"[2, 3]":-1,"[2, 4]":1,"[3, 4]":0,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 3, 4]":2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:23.684044	2013-06-27 22:06:34.074545	6	f	f
220	26	218	85	2013-06-27 22:11:11.495	{"1":1,"2":2,"3":0,"4":2,"5":0}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":2,"[1, 5]":-3,"[2, 3]":-4,"[2, 4]":0,"[2, 5]":2,"[3, 4]":1,"[3, 5]":1,"[4, 5]":1,"[1, 2, 3]":-4,"[1, 2, 4]":-2,"[1, 2, 5]":-2,"[1, 3, 4]":1,"[1, 3, 5]":2,"[1, 4, 5]":-2,"[2, 3, 4]":-2,"[2, 3, 5]":3,"[2, 4, 5]":4,"[3, 4, 5]":0,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:23.718908	2013-06-27 22:11:27.35654	7	f	f
233	27	234	98	2013-06-27 22:05:49.187	{"1":0,"2":1,"3":1,"4":0,"5":2}	{"[1, 2]":4,"[1, 3]":1,"[1, 4]":-1,"[1, 5]":-2,"[2, 3]":3,"[2, 4]":-2,"[2, 5]":-1,"[3, 4]":2,"[3, 5]":-4,"[4, 5]":1,"[1, 2, 3]":2,"[1, 2, 4]":4,"[1, 2, 5]":3,"[1, 3, 4]":3,"[1, 3, 5]":1,"[1, 4, 5]":-3,"[2, 3, 4]":1,"[2, 3, 5]":1,"[2, 4, 5]":3,"[3, 4, 5]":-1,"[1, 2, 3, 4]":4,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:25.123428	2013-06-27 22:05:57.568504	7	f	f
235	28	\N	300	2013-06-27 21:09:13.748	{"1":1,"2":1,"3":0}	{"[1, 2]":0,"[1, 3]":0,"[2, 3]":3,"[1, 2, 3]":2}	2013-06-27 21:06:25.559287	2013-06-27 21:09:39.241593	1	t	f
237	28	246	300	2013-06-27 21:20:21.421	{"1":0,"2":0,"3":0}	{"[1, 2]":0,"[1, 3]":-2,"[2, 3]":0,"[1, 2, 3]":0}	2013-06-27 21:06:25.686311	2013-06-27 21:20:46.754946	2	t	f
230	27	229	187	2013-06-27 21:30:51.529	{"1":1,"2":1,"3":2}	{"[1, 2]":4,"[1, 3]":-3,"[2, 3]":0,"[1, 2, 3]":-2}	2013-06-27 21:06:25.04374	2013-06-27 21:30:59.589988	5	f	f
223	27	230	300	2013-06-27 21:35:56.868	{"1":1,"2":1,"3":2}	{"[1, 2]":-4,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":-2}	2013-06-27 21:06:24.86636	2013-06-27 21:36:04.887912	2	t	f
244	28	241	89	2013-06-27 21:39:59.787	{"1":2,"2":0,"3":1,"4":1}	{"[1, 2]":-2,"[1, 3]":4,"[1, 4]":-3,"[2, 3]":3,"[2, 4]":0,"[3, 4]":0,"[1, 2, 3]":-2,"[1, 2, 4]":1,"[1, 3, 4]":3,"[2, 3, 4]":1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:25.863589	2013-06-27 21:40:25.206837	6	f	f
225	27	227	300	2013-06-27 21:45:53.156	{"1":0,"2":1,"3":0,"4":2}	{"[1, 2]":-1,"[1, 3]":-2,"[1, 4]":-1,"[2, 3]":0,"[2, 4]":3,"[3, 4]":4,"[1, 2, 3]":-1,"[1, 2, 4]":0,"[1, 3, 4]":2,"[2, 3, 4]":3,"[1, 2, 3, 4]":1}	2013-06-27 21:06:24.896422	2013-06-27 21:46:01.404548	3	t	f
228	27	231	300	2013-06-27 21:55:50.821	{"1":0,"2":2,"3":2,"4":1,"5":1}	{"[1, 2]":3,"[1, 3]":1,"[1, 4]":-4,"[1, 5]":-1,"[2, 3]":1,"[2, 4]":3,"[2, 5]":-3,"[3, 4]":-4,"[3, 5]":0,"[4, 5]":-2,"[1, 2, 3]":1,"[1, 2, 4]":-1,"[1, 2, 5]":2,"[1, 3, 4]":-4,"[1, 3, 5]":3,"[1, 4, 5]":-4,"[2, 3, 4]":-2,"[2, 3, 5]":-3,"[2, 4, 5]":1,"[3, 4, 5]":-1,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:24.973134	2013-06-27 21:55:59.183807	4	t	f
246	28	235	84	2013-06-27 21:15:27.826	{"1":2,"2":1,"3":1,"4":0,"5":0}	{"[1, 2]":0,"[1, 3]":-3,"[1, 4]":-1,"[1, 5]":1,"[2, 3]":-2,"[2, 4]":-4,"[2, 5]":2,"[3, 4]":2,"[3, 5]":3,"[4, 5]":2,"[1, 2, 3]":-1,"[1, 2, 4]":-2,"[1, 2, 5]":1,"[1, 3, 4]":-2,"[1, 3, 5]":-2,"[1, 4, 5]":-1,"[2, 3, 4]":-2,"[2, 3, 5]":0,"[2, 4, 5]":-1,"[3, 4, 5]":-1,"[1, 2, 3, 4]":4,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:26.124698	2013-06-27 21:15:53.247087	7	f	f
229	27	226	123	2013-06-27 21:25:37.506	{"1":2,"2":1,"3":0}	{"[1, 2]":3,"[1, 3]":1,"[2, 3]":0,"[1, 2, 3]":4}	2013-06-27 21:06:25.003044	2013-06-27 21:25:45.629777	5	f	f
242	28	237	98	2013-06-27 21:25:22.343	{"1":0,"2":0,"3":1}	{"[1, 2]":-3,"[1, 3]":1,"[2, 3]":1,"[1, 2, 3]":3}	2013-06-27 21:06:25.828535	2013-06-27 21:25:47.509598	5	f	f
245	28	242	44	2013-06-27 21:30:12.327	{"1":2,"2":1,"3":0,"4":2}	{"[1, 2]":-2,"[1, 3]":4,"[1, 4]":2,"[2, 3]":2,"[2, 4]":-4,"[3, 4]":-1,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 3, 4]":4,"[2, 3, 4]":-3,"[1, 2, 3, 4]":0}	2013-06-27 21:06:25.878797	2013-06-27 21:30:37.765149	6	f	f
227	27	223	300	2013-06-27 21:40:55.365	{"1":1,"2":1,"3":1,"4":2,"5":2}	{"[1, 2]":-1,"[1, 3]":0,"[1, 4]":-2,"[1, 5]":-4,"[2, 3]":4,"[2, 4]":3,"[2, 5]":3,"[3, 4]":4,"[3, 5]":-1,"[4, 5]":-3,"[1, 2, 3]":0,"[1, 2, 4]":0,"[1, 2, 5]":-1,"[1, 3, 4]":0,"[1, 3, 5]":-3,"[1, 4, 5]":2,"[2, 3, 4]":-3,"[2, 3, 5]":-2,"[2, 4, 5]":3,"[3, 4, 5]":0,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:24.942743	2013-06-27 21:41:03.412682	4	t	f
236	28	240	300	2013-06-27 21:49:35.95	{"1":1,"2":0,"3":2}	{"[1, 2]":-2,"[1, 3]":0,"[2, 3]":-3,"[1, 2, 3]":-3}	2013-06-27 21:06:25.674428	2013-06-27 21:50:01.53237	2	t	f
231	27	225	148	2013-06-27 21:50:51.245	{"1":2,"2":1,"3":0,"4":0}	{"[1, 2]":-2,"[1, 3]":2,"[1, 4]":-3,"[2, 3]":-1,"[2, 4]":3,"[3, 4]":1,"[1, 2, 3]":0,"[1, 2, 4]":2,"[1, 3, 4]":0,"[2, 3, 4]":2,"[1, 2, 3, 4]":4}	2013-06-27 21:06:25.071154	2013-06-27 21:50:59.481598	6	f	f
234	27	228	119	2013-06-27 22:00:49.454	{"1":2,"2":1,"3":1,"4":2,"5":1}	{"[1, 2]":3,"[1, 3]":4,"[1, 4]":-2,"[1, 5]":0,"[2, 3]":4,"[2, 4]":4,"[2, 5]":-3,"[3, 4]":2,"[3, 5]":3,"[4, 5]":2,"[1, 2, 3]":-4,"[1, 2, 4]":3,"[1, 2, 5]":-2,"[1, 3, 4]":-4,"[1, 3, 5]":0,"[1, 4, 5]":-3,"[2, 3, 4]":-4,"[2, 3, 5]":3,"[2, 4, 5]":0,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-1,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:25.149377	2013-06-27 22:00:57.855006	7	f	f
224	27	233	300	2013-06-27 22:10:47.477	{"1":2,"2":2,"3":0}	{"[1, 2]":1,"[1, 3]":4,"[2, 3]":-3,"[1, 2, 3]":-3}	2013-06-27 21:06:24.882344	2013-06-27 22:10:55.927179	2	t	f
241	28	245	300	2013-06-27 21:35:11.239	{"1":0,"2":0,"3":0,"4":1,"5":2}	{"[1, 2]":1,"[1, 3]":-3,"[1, 4]":2,"[1, 5]":1,"[2, 3]":-2,"[2, 4]":-1,"[2, 5]":0,"[3, 4]":3,"[3, 5]":-4,"[4, 5]":-2,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 2, 5]":-4,"[1, 3, 4]":1,"[1, 3, 5]":4,"[1, 4, 5]":-4,"[2, 3, 4]":-2,"[2, 3, 5]":-4,"[2, 4, 5]":2,"[3, 4, 5]":4,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:25.801572	2013-06-27 21:35:37.488955	4	t	f
240	28	244	300	2013-06-27 21:44:52.032	{"1":0,"2":0,"3":0,"4":0,"5":0}	{"[1, 2]":-3,"[1, 3]":4,"[1, 4]":-2,"[1, 5]":-1,"[2, 3]":2,"[2, 4]":3,"[2, 5]":0,"[3, 4]":-1,"[3, 5]":4,"[4, 5]":-4,"[1, 2, 3]":0,"[1, 2, 4]":-3,"[1, 2, 5]":0,"[1, 3, 4]":-4,"[1, 3, 5]":1,"[1, 4, 5]":-2,"[2, 3, 4]":2,"[2, 3, 5]":4,"[2, 4, 5]":4,"[3, 4, 5]":4,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:25.76941	2013-06-27 21:45:17.42125	4	t	f
243	28	236	120	2013-06-27 21:54:32.641	{"1":1,"2":1,"3":1}	{"[1, 2]":1,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":-4}	2013-06-27 21:06:25.843721	2013-06-27 21:54:57.938255	5	f	f
239	28	243	300	2013-06-27 21:59:21.824	{"1":1,"2":0,"3":2,"4":0}	{"[1, 2]":-3,"[1, 3]":2,"[1, 4]":-3,"[2, 3]":4,"[2, 4]":-3,"[3, 4]":1,"[1, 2, 3]":-1,"[1, 2, 4]":3,"[1, 3, 4]":-4,"[2, 3, 4]":4,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:25.744997	2013-06-27 21:59:47.294927	3	t	f
247	28	239	126	2013-06-27 22:04:33.264	{"1":1,"2":2,"3":1,"4":2,"5":0}	{"[1, 2]":-4,"[1, 3]":4,"[1, 4]":3,"[1, 5]":-4,"[2, 3]":-3,"[2, 4]":2,"[2, 5]":-1,"[3, 4]":-2,"[3, 5]":-1,"[4, 5]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":0,"[1, 2, 5]":-1,"[1, 3, 4]":3,"[1, 3, 5]":3,"[1, 4, 5]":1,"[2, 3, 4]":3,"[2, 3, 5]":-1,"[2, 4, 5]":-4,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:26.243366	2013-06-27 22:04:58.670587	7	f	f
238	28	247	300	2013-06-27 22:09:15.793	{"1":0,"2":2,"3":1,"4":2}	{"[1, 2]":-4,"[1, 3]":-4,"[1, 4]":1,"[2, 3]":2,"[2, 4]":-4,"[3, 4]":-4,"[1, 2, 3]":2,"[1, 2, 4]":-4,"[1, 3, 4]":4,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:25.714881	2013-06-27 22:09:41.300777	3	t	f
287	32	\N	300	2013-06-27 21:13:17.975	{"1":1,"2":1,"3":0}	{"[1, 2]":1,"[1, 3]":4,"[2, 3]":3,"[1, 2, 3]":2}	2013-06-27 21:06:29.461893	2013-06-27 21:13:38.634619	1	t	f
289	32	290	300	2013-06-27 21:48:17.554	{"1":1,"2":1,"3":1}	{"[1, 2]":-2,"[1, 3]":4,"[2, 3]":-2,"[1, 2, 3]":3}	2013-06-27 21:06:29.505328	2013-06-27 21:48:38.621943	2	t	f
288	32	293	300	2013-06-27 21:57:46.993	{"1":1,"2":1,"3":1}	{"[1, 2]":3,"[1, 3]":3,"[2, 3]":-1,"[1, 2, 3]":0}	2013-06-27 21:06:29.491923	2013-06-27 21:58:07.354455	2	t	f
299	32	298	96	2013-06-27 21:24:15.959	{"1":2,"2":2,"3":2,"4":2,"5":0}	{"[1, 2]":-4,"[1, 3]":3,"[1, 4]":-4,"[1, 5]":-2,"[2, 3]":-1,"[2, 4]":-4,"[2, 5]":3,"[3, 4]":0,"[3, 5]":-1,"[4, 5]":-1,"[1, 2, 3]":1,"[1, 2, 4]":4,"[1, 2, 5]":-2,"[1, 3, 4]":2,"[1, 3, 5]":2,"[1, 4, 5]":3,"[2, 3, 4]":0,"[2, 3, 5]":2,"[2, 4, 5]":-4,"[3, 4, 5]":0,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:29.768049	2013-06-27 21:24:36.463397	7	f	f
292	32	299	300	2013-06-27 21:29:08.769	{"1":0,"2":2,"3":0,"4":1,"5":0}	{"[1, 2]":-2,"[1, 3]":-1,"[1, 4]":-4,"[1, 5]":-1,"[2, 3]":-3,"[2, 4]":2,"[2, 5]":1,"[3, 4]":3,"[3, 5]":2,"[4, 5]":0,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 2, 5]":2,"[1, 3, 4]":3,"[1, 3, 5]":0,"[1, 4, 5]":0,"[2, 3, 4]":-3,"[2, 3, 5]":4,"[2, 4, 5]":4,"[3, 4, 5]":-1,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:29.557088	2013-06-27 21:29:29.182728	4	t	f
298	32	287	93	2013-06-27 21:19:28.088	{"1":1,"2":2,"3":2,"4":0,"5":2}	{"[1, 2]":2,"[1, 3]":-4,"[1, 4]":-2,"[1, 5]":3,"[2, 3]":-4,"[2, 4]":1,"[2, 5]":2,"[3, 4]":-4,"[3, 5]":-4,"[4, 5]":4,"[1, 2, 3]":-1,"[1, 2, 4]":3,"[1, 2, 5]":-3,"[1, 3, 4]":2,"[1, 3, 5]":-4,"[1, 4, 5]":-2,"[2, 3, 4]":-3,"[2, 3, 5]":-1,"[2, 4, 5]":2,"[3, 4, 5]":-1,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:29.744958	2013-06-27 21:19:48.746088	7	f	f
291	32	297	300	2013-06-27 21:38:46.181	{"1":0,"2":1,"3":2,"4":2}	{"[1, 2]":-4,"[1, 3]":-4,"[1, 4]":4,"[2, 3]":1,"[2, 4]":-3,"[3, 4]":2,"[1, 2, 3]":0,"[1, 2, 4]":3,"[1, 3, 4]":2,"[2, 3, 4]":1,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:29.544531	2013-06-27 21:39:06.68632	3	t	f
290	32	291	300	2013-06-27 21:43:32.152	{"1":0,"2":1,"3":2,"4":0}	{"[1, 2]":-2,"[1, 3]":4,"[1, 4]":3,"[2, 3]":3,"[2, 4]":2,"[3, 4]":1,"[1, 2, 3]":-2,"[1, 2, 4]":-2,"[1, 3, 4]":4,"[2, 3, 4]":-1,"[1, 2, 3, 4]":3}	2013-06-27 21:06:29.52676	2013-06-27 21:43:52.669711	3	t	f
293	32	289	300	2013-06-27 21:53:02.418	{"1":1,"2":1,"3":2,"4":0,"5":1}	{"[1, 2]":-2,"[1, 3]":2,"[1, 4]":4,"[1, 5]":0,"[2, 3]":1,"[2, 4]":2,"[2, 5]":3,"[3, 4]":1,"[3, 5]":-1,"[4, 5]":1,"[1, 2, 3]":4,"[1, 2, 4]":2,"[1, 2, 5]":1,"[1, 3, 4]":-2,"[1, 3, 5]":4,"[1, 4, 5]":-4,"[2, 3, 4]":4,"[2, 3, 5]":-3,"[2, 4, 5]":-1,"[3, 4, 5]":0,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:29.576861	2013-06-27 21:53:23.012894	4	t	f
294	32	288	52	2013-06-27 22:02:36.762	{"1":2,"2":0,"3":1}	{"[1, 2]":0,"[1, 3]":1,"[2, 3]":2,"[1, 2, 3]":-1}	2013-06-27 21:06:29.595843	2013-06-27 22:02:57.314491	5	f	f
296	32	294	24	2013-06-27 22:07:23.161	{"1":2,"2":1,"3":1,"4":1}	{"[1, 2]":2,"[1, 3]":-1,"[1, 4]":-1,"[2, 3]":-3,"[2, 4]":0,"[3, 4]":3,"[1, 2, 3]":-3,"[1, 2, 4]":3,"[1, 3, 4]":-1,"[2, 3, 4]":3,"[1, 2, 3, 4]":0}	2013-06-27 21:06:29.643923	2013-06-27 22:07:43.795273	6	f	f
295	32	296	146	2013-06-27 22:12:08.824	{"1":0,"2":0,"3":0}	{"[1, 2]":3,"[1, 3]":0,"[2, 3]":-1,"[1, 2, 3]":4}	2013-06-27 21:06:29.616342	2013-06-27 22:12:29.381129	5	f	f
405	41	410	300	2013-06-27 21:49:31.941	{"1":2,"2":1,"3":0}	{"[1, 2]":0,"[1, 3]":2,"[2, 3]":2,"[1, 2, 3]":2}	2013-06-27 21:06:37.543901	2013-06-27 21:49:36.676111	2	t	f
736	66	735	49	2013-06-27 22:06:27.329	{"1":1,"2":2,"3":2}	{"[1, 2]":4,"[1, 3]":2,"[2, 3]":1,"[1, 2, 3]":3}	2013-06-27 21:06:48.004354	2013-06-27 22:06:40.367508	5	f	f
408	41	413	300	2013-06-27 21:39:24.949	{"1":1,"2":1,"3":2,"4":2}	{"[1, 2]":3,"[1, 3]":-2,"[1, 4]":4,"[2, 3]":-2,"[2, 4]":3,"[3, 4]":-3,"[1, 2, 3]":1,"[1, 2, 4]":-1,"[1, 3, 4]":-4,"[2, 3, 4]":1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:37.639545	2013-06-27 21:39:29.660743	3	t	f
410	41	408	300	2013-06-27 21:44:27.287	{"1":1,"2":0,"3":2,"4":2,"5":2}	{"[1, 2]":2,"[1, 3]":0,"[1, 4]":2,"[1, 5]":-4,"[2, 3]":4,"[2, 4]":-1,"[2, 5]":-4,"[3, 4]":-2,"[3, 5]":-3,"[4, 5]":2,"[1, 2, 3]":-4,"[1, 2, 4]":4,"[1, 2, 5]":1,"[1, 3, 4]":4,"[1, 3, 5]":-4,"[1, 4, 5]":0,"[2, 3, 4]":3,"[2, 3, 5]":-1,"[2, 4, 5]":1,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:37.901871	2013-06-27 21:44:32.282936	4	t	f
407	41	405	300	2013-06-27 21:54:33.433	{"1":2,"2":0,"3":1,"4":1}	{"[1, 2]":1,"[1, 3]":4,"[1, 4]":-4,"[2, 3]":-2,"[2, 4]":-4,"[3, 4]":-4,"[1, 2, 3]":-3,"[1, 2, 4]":4,"[1, 3, 4]":-3,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:37.575276	2013-06-27 21:54:38.427549	3	t	f
406	41	407	300	2013-06-27 21:59:34.259	{"1":1,"2":1,"3":2}	{"[1, 2]":-4,"[1, 3]":1,"[2, 3]":2,"[1, 2, 3]":-3}	2013-06-27 21:06:37.556496	2013-06-27 21:59:39.162836	2	t	f
409	41	412	300	2013-06-27 22:09:51.709	{"1":0,"2":1,"3":2,"4":1,"5":2}	{"[1, 2]":3,"[1, 3]":-1,"[1, 4]":-3,"[1, 5]":-3,"[2, 3]":4,"[2, 4]":4,"[2, 5]":1,"[3, 4]":4,"[3, 5]":4,"[4, 5]":4,"[1, 2, 3]":-3,"[1, 2, 4]":1,"[1, 2, 5]":-1,"[1, 3, 4]":-3,"[1, 3, 5]":-3,"[1, 4, 5]":4,"[2, 3, 4]":2,"[2, 3, 5]":1,"[2, 4, 5]":2,"[3, 4, 5]":0,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-4,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:37.785722	2013-06-27 22:09:56.631064	4	t	f
414	41	409	99	2013-06-27 22:14:57.345	{"1":0,"2":1,"3":0,"4":0}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":-3,"[2, 3]":-2,"[2, 4]":-4,"[3, 4]":1,"[1, 2, 3]":3,"[1, 2, 4]":3,"[1, 3, 4]":-3,"[2, 3, 4]":-1,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:38.098018	2013-06-27 22:15:02.081637	6	f	f
411	41	404	110	2013-06-27 21:17:54.372	{"1":1,"2":0,"3":2}	{"[1, 2]":3,"[1, 3]":-4,"[2, 3]":3,"[1, 2, 3]":-1}	2013-06-27 21:06:37.979986	2013-06-27 21:17:59.139927	5	f	f
416	41	411	70	2013-06-27 21:23:34.105	{"1":1,"2":1,"3":0,"4":0,"5":2}	{"[1, 2]":1,"[1, 3]":4,"[1, 4]":3,"[1, 5]":-2,"[2, 3]":3,"[2, 4]":3,"[2, 5]":1,"[3, 4]":0,"[3, 5]":-1,"[4, 5]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-4,"[1, 2, 5]":-1,"[1, 3, 4]":-4,"[1, 3, 5]":-1,"[1, 4, 5]":-3,"[2, 3, 4]":-2,"[2, 3, 5]":2,"[2, 4, 5]":1,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:38.124979	2013-06-27 21:23:38.875051	7	f	f
415	41	416	60	2013-06-27 21:28:49.776	{"1":1,"2":0,"3":0,"4":1,"5":0}	{"[1, 2]":-3,"[1, 3]":4,"[1, 4]":-1,"[1, 5]":-3,"[2, 3]":4,"[2, 4]":-3,"[2, 5]":2,"[3, 4]":-2,"[3, 5]":-1,"[4, 5]":0,"[1, 2, 3]":-1,"[1, 2, 4]":-2,"[1, 2, 5]":3,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":2,"[2, 3, 4]":-1,"[2, 3, 5]":-3,"[2, 4, 5]":0,"[3, 4, 5]":3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":-4,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:38.11262	2013-06-27 21:28:54.699715	7	f	f
413	41	415	138	2013-06-27 21:34:02.416	{"1":2,"2":0,"3":2,"4":0}	{"[1, 2]":2,"[1, 3]":2,"[1, 4]":-2,"[2, 3]":-1,"[2, 4]":2,"[3, 4]":-1,"[1, 2, 3]":3,"[1, 2, 4]":-4,"[1, 3, 4]":-4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:38.089201	2013-06-27 21:34:07.171923	6	f	f
412	41	406	110	2013-06-27 22:04:50.378	{"1":2,"2":0,"3":0}	{"[1, 2]":2,"[1, 3]":0,"[2, 3]":0,"[1, 2, 3]":-1}	2013-06-27 21:06:38.002881	2013-06-27 22:04:55.287409	5	f	f
731	66	736	300	2013-06-27 22:11:29.507	{"1":0,"2":0,"3":0}	{"[1, 2]":-1,"[1, 3]":2,"[2, 3]":4,"[1, 2, 3]":4}	2013-06-27 21:06:47.941384	2013-06-27 22:11:42.678436	2	t	f
538	51	540	300	2013-06-27 21:39:43.859	{"1":0,"2":2,"3":1,"4":0}	{"[1, 2]":0,"[1, 3]":1,"[1, 4]":0,"[2, 3]":-4,"[2, 4]":2,"[3, 4]":-4,"[1, 2, 3]":2,"[1, 2, 4]":-1,"[1, 3, 4]":1,"[2, 3, 4]":-1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:43.068732	2013-06-27 21:39:58.168852	3	t	f
536	51	544	300	2013-06-27 21:54:25.431	{"1":0,"2":1,"3":1}	{"[1, 2]":3,"[1, 3]":2,"[2, 3]":2,"[1, 2, 3]":4}	2013-06-27 21:06:43.001423	2013-06-27 21:54:39.763448	2	t	f
537	51	536	300	2013-06-27 21:59:18.842	{"1":2,"2":0,"3":1,"4":1}	{"[1, 2]":-3,"[1, 3]":-2,"[1, 4]":2,"[2, 3]":-1,"[2, 4]":0,"[3, 4]":-2,"[1, 2, 3]":0,"[1, 2, 4]":3,"[1, 3, 4]":4,"[2, 3, 4]":2,"[1, 2, 3, 4]":4}	2013-06-27 21:06:43.012396	2013-06-27 21:59:33.43224	3	t	f
535	51	537	300	2013-06-27 22:04:19.42	{"1":2,"2":1,"3":2}	{"[1, 2]":-4,"[1, 3]":4,"[2, 3]":-1,"[1, 2, 3]":1}	2013-06-27 21:06:42.956596	2013-06-27 22:04:33.960601	2	t	f
534	51	\N	300	2013-06-27 21:09:34.745	{"1":1,"2":1,"3":1}	{"[1, 2]":-1,"[1, 3]":1,"[2, 3]":-2,"[1, 2, 3]":3}	2013-06-27 21:06:42.938037	2013-06-27 21:09:49.310067	1	t	f
543	51	534	83	2013-06-27 21:14:41.297	{"1":0,"2":2,"3":2,"4":0}	{"[1, 2]":0,"[1, 3]":-1,"[1, 4]":-2,"[2, 3]":0,"[2, 4]":-4,"[3, 4]":1,"[1, 2, 3]":0,"[1, 2, 4]":4,"[1, 3, 4]":-2,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:43.122081	2013-06-27 21:14:55.719914	6	f	f
542	51	545	95	2013-06-27 21:25:03.196	{"1":1,"2":1,"3":2}	{"[1, 2]":1,"[1, 3]":-1,"[2, 3]":2,"[1, 2, 3]":4}	2013-06-27 21:06:43.112302	2013-06-27 21:25:17.775638	5	f	f
541	51	542	59	2013-06-27 21:29:55.751	{"1":2,"2":1,"3":0}	{"[1, 2]":2,"[1, 3]":0,"[2, 3]":-1,"[1, 2, 3]":-4}	2013-06-27 21:06:43.103607	2013-06-27 21:30:10.252775	5	f	f
540	51	541	300	2013-06-27 21:34:53.09	{"1":0,"2":0,"3":2,"4":2,"5":0}	{"[1, 2]":2,"[1, 3]":-4,"[1, 4]":-2,"[1, 5]":-3,"[2, 3]":1,"[2, 4]":-2,"[2, 5]":-3,"[3, 4]":2,"[3, 5]":-3,"[4, 5]":2,"[1, 2, 3]":3,"[1, 2, 4]":-2,"[1, 2, 5]":2,"[1, 3, 4]":0,"[1, 3, 5]":-2,"[1, 4, 5]":3,"[2, 3, 4]":-1,"[2, 3, 5]":-1,"[2, 4, 5]":-2,"[3, 4, 5]":-1,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:43.093637	2013-06-27 21:35:07.859405	4	t	f
539	51	535	300	2013-06-27 22:09:23.964	{"1":0,"2":1,"3":1,"4":2,"5":0}	{"[1, 2]":0,"[1, 3]":-2,"[1, 4]":-3,"[1, 5]":4,"[2, 3]":-1,"[2, 4]":-3,"[2, 5]":-4,"[3, 4]":3,"[3, 5]":-3,"[4, 5]":4,"[1, 2, 3]":0,"[1, 2, 4]":1,"[1, 2, 5]":-3,"[1, 3, 4]":3,"[1, 3, 5]":3,"[1, 4, 5]":2,"[2, 3, 4]":-3,"[2, 3, 5]":-3,"[2, 4, 5]":2,"[3, 4, 5]":0,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:43.083233	2013-06-27 22:09:38.489084	4	t	f
690	63	\N	300	2013-06-27 21:10:42.292	{"1":0,"2":1,"3":0}	{"[1, 2]":0,"[1, 3]":1,"[2, 3]":-4,"[1, 2, 3]":1}	2013-06-27 21:06:47.103659	2013-06-27 21:11:42.245186	1	t	f
545	51	543	81	2013-06-27 21:20:09.546	{"1":1,"2":1,"3":2,"4":1,"5":0}	{"[1, 2]":0,"[1, 3]":3,"[1, 4]":1,"[1, 5]":-3,"[2, 3]":3,"[2, 4]":-4,"[2, 5]":2,"[3, 4]":-1,"[3, 5]":0,"[4, 5]":3,"[1, 2, 3]":4,"[1, 2, 4]":-1,"[1, 2, 5]":-2,"[1, 3, 4]":-2,"[1, 3, 5]":2,"[1, 4, 5]":1,"[2, 3, 4]":-1,"[2, 3, 5]":-2,"[2, 4, 5]":1,"[3, 4, 5]":3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:43.143728	2013-06-27 21:20:24.132886	7	f	f
546	51	538	170	2013-06-27 21:44:37.687	{"1":1,"2":2,"3":1,"4":1,"5":0}	{"[1, 2]":0,"[1, 3]":0,"[1, 4]":0,"[1, 5]":-2,"[2, 3]":1,"[2, 4]":-1,"[2, 5]":-4,"[3, 4]":3,"[3, 5]":3,"[4, 5]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":0,"[1, 2, 5]":1,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":-1,"[2, 3, 4]":-4,"[2, 3, 5]":4,"[2, 4, 5]":4,"[3, 4, 5]":-3,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:43.159336	2013-06-27 21:44:52.047599	7	f	f
692	63	701	300	2013-06-27 21:46:38.299	{"1":1,"2":1,"3":1}	{"[1, 2]":-2,"[1, 3]":1,"[2, 3]":-1,"[1, 2, 3]":-1}	2013-06-27 21:06:47.125157	2013-06-27 21:47:38.073579	2	t	f
544	51	546	9	2013-06-27 21:49:35.076	{"1":0,"2":1,"3":0,"4":2}	{"[1, 2]":0,"[1, 3]":2,"[1, 4]":1,"[2, 3]":-4,"[2, 4]":3,"[3, 4]":-2,"[1, 2, 3]":4,"[1, 2, 4]":-1,"[1, 3, 4]":2,"[2, 3, 4]":0,"[1, 2, 3, 4]":4}	2013-06-27 21:06:43.133007	2013-06-27 21:49:49.55965	6	f	f
691	63	692	300	2013-06-27 21:50:45.652	{"1":1,"2":0,"3":2}	{"[1, 2]":-4,"[1, 3]":2,"[2, 3]":1,"[1, 2, 3]":-2}	2013-06-27 21:06:47.116356	2013-06-27 21:51:45.566059	2	t	f
693	63	696	300	2013-06-27 22:03:32.284	{"1":1,"2":1,"3":1,"4":1}	{"[1, 2]":2,"[1, 3]":0,"[1, 4]":-4,"[2, 3]":0,"[2, 4]":-1,"[3, 4]":2,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 3, 4]":0,"[2, 3, 4]":-4,"[1, 2, 3, 4]":0}	2013-06-27 21:06:47.132854	2013-06-27 22:04:32.009902	3	t	f
694	63	697	300	2013-06-27 21:20:10.28	{"1":0,"2":0,"3":0,"4":2}	{"[1, 2]":2,"[1, 3]":3,"[1, 4]":-1,"[2, 3]":1,"[2, 4]":-1,"[3, 4]":-2,"[1, 2, 3]":-1,"[1, 2, 4]":-4,"[1, 3, 4]":1,"[2, 3, 4]":2,"[1, 2, 3, 4]":2}	2013-06-27 21:06:47.141772	2013-06-27 21:21:10.149111	3	t	f
700	63	698	170	2013-06-27 21:28:44.149	{"1":1,"2":1,"3":1,"4":2}	{"[1, 2]":4,"[1, 3]":4,"[1, 4]":-3,"[2, 3]":3,"[2, 4]":0,"[3, 4]":-3,"[1, 2, 3]":-1,"[1, 2, 4]":1,"[1, 3, 4]":4,"[2, 3, 4]":3,"[1, 2, 3, 4]":2}	2013-06-27 21:06:47.201748	2013-06-27 21:29:44.037466	6	f	f
699	63	700	120	2013-06-27 21:33:21.881	{"1":2,"2":2,"3":2,"4":2}	{"[1, 2]":0,"[1, 3]":2,"[1, 4]":2,"[2, 3]":3,"[2, 4]":-4,"[3, 4]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 3, 4]":-2,"[2, 3, 4]":-1,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:47.187932	2013-06-27 21:34:21.644601	6	f	f
702	63	699	88	2013-06-27 21:38:00.098	{"1":1,"2":2,"3":2,"4":0,"5":0}	{"[1, 2]":0,"[1, 3]":1,"[1, 4]":3,"[1, 5]":3,"[2, 3]":1,"[2, 4]":-2,"[2, 5]":2,"[3, 4]":3,"[3, 5]":3,"[4, 5]":0,"[1, 2, 3]":2,"[1, 2, 4]":3,"[1, 2, 5]":-3,"[1, 3, 4]":-3,"[1, 3, 5]":-3,"[1, 4, 5]":-1,"[2, 3, 4]":-1,"[2, 3, 5]":-3,"[2, 4, 5]":4,"[3, 4, 5]":1,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:47.225855	2013-06-27 21:39:00.008376	7	f	f
701	63	702	139	2013-06-27 21:42:12.801	{"1":2,"2":2,"3":0,"4":0,"5":2}	{"[1, 2]":1,"[1, 3]":-3,"[1, 4]":-2,"[1, 5]":0,"[2, 3]":4,"[2, 4]":-3,"[2, 5]":-4,"[3, 4]":-3,"[3, 5]":0,"[4, 5]":1,"[1, 2, 3]":2,"[1, 2, 4]":1,"[1, 2, 5]":-3,"[1, 3, 4]":-4,"[1, 3, 5]":1,"[1, 4, 5]":-3,"[2, 3, 4]":-2,"[2, 3, 5]":1,"[2, 4, 5]":4,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:47.210101	2013-06-27 21:43:12.911057	7	f	f
971	84	967	53	2013-06-27 22:03:38.074	{"1":0,"2":0,"3":1}	{"[1, 2]":-4,"[1, 3]":-2,"[2, 3]":-1,"[1, 2, 3]":3}	2013-06-27 21:06:54.891066	2013-06-27 22:03:46.427911	5	f	f
695	63	691	300	2013-06-27 21:54:51.561	{"1":1,"2":2,"3":2,"4":2,"5":0}	{"[1, 2]":3,"[1, 3]":-4,"[1, 4]":1,"[1, 5]":0,"[2, 3]":2,"[2, 4]":4,"[2, 5]":-1,"[3, 4]":2,"[3, 5]":1,"[4, 5]":1,"[1, 2, 3]":0,"[1, 2, 4]":-3,"[1, 2, 5]":4,"[1, 3, 4]":0,"[1, 3, 5]":-2,"[1, 4, 5]":-1,"[2, 3, 4]":-4,"[2, 3, 5]":4,"[2, 4, 5]":1,"[3, 4, 5]":2,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:47.150125	2013-06-27 21:55:51.922048	4	t	f
696	63	695	300	2013-06-27 21:59:19.648	{"1":0,"2":2,"3":2,"4":2,"5":1}	{"[1, 2]":2,"[1, 3]":2,"[1, 4]":4,"[1, 5]":-3,"[2, 3]":2,"[2, 4]":-3,"[2, 5]":0,"[3, 4]":-4,"[3, 5]":0,"[4, 5]":-2,"[1, 2, 3]":-3,"[1, 2, 4]":-4,"[1, 2, 5]":1,"[1, 3, 4]":-2,"[1, 3, 5]":-1,"[1, 4, 5]":-1,"[2, 3, 4]":1,"[2, 3, 5]":-1,"[2, 4, 5]":-4,"[3, 4, 5]":2,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":-4,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:47.158508	2013-06-27 22:00:19.611314	4	t	f
729	66	\N	300	2013-06-27 21:09:59.126	{"1":0,"2":1,"3":0}	{"[1, 2]":0,"[1, 3]":-2,"[2, 3]":2,"[1, 2, 3]":-4}	2013-06-27 21:06:47.91623	2013-06-27 21:10:12.410872	1	t	f
739	66	729	78	2013-06-27 21:16:01.622	{"1":2,"2":2,"3":1,"4":2}	{"[1, 2]":-3,"[1, 3]":-4,"[1, 4]":-3,"[2, 3]":-3,"[2, 4]":1,"[3, 4]":-4,"[1, 2, 3]":-3,"[1, 2, 4]":0,"[1, 3, 4]":4,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:48.031763	2013-06-27 21:16:14.813771	6	f	f
737	66	734	52	2013-06-27 21:56:27.717	{"1":2,"2":2,"3":1}	{"[1, 2]":3,"[1, 3]":-1,"[2, 3]":4,"[1, 2, 3]":4}	2013-06-27 21:06:48.013876	2013-06-27 21:56:40.945305	5	f	f
735	66	737	300	2013-06-27 22:01:24.923	{"1":0,"2":0,"3":0,"4":2,"5":1}	{"[1, 2]":2,"[1, 3]":-2,"[1, 4]":1,"[1, 5]":-2,"[2, 3]":2,"[2, 4]":-1,"[2, 5]":-1,"[3, 4]":3,"[3, 5]":-1,"[4, 5]":-4,"[1, 2, 3]":1,"[1, 2, 4]":0,"[1, 2, 5]":0,"[1, 3, 4]":-3,"[1, 3, 5]":-2,"[1, 4, 5]":-2,"[2, 3, 4]":3,"[2, 3, 5]":3,"[2, 4, 5]":3,"[3, 4, 5]":3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:47.995673	2013-06-27 22:01:38.269617	4	t	f
730	66	739	300	2013-06-27 21:21:04.769	{"1":1,"2":1,"3":1}	{"[1, 2]":2,"[1, 3]":-1,"[2, 3]":-4,"[1, 2, 3]":-1}	2013-06-27 21:06:47.930027	2013-06-27 21:21:17.702588	2	t	f
740	66	730	8	2013-06-27 21:26:18.314	{"1":0,"2":2,"3":1,"4":1,"5":2}	{"[1, 2]":1,"[1, 3]":4,"[1, 4]":-3,"[1, 5]":-3,"[2, 3]":-3,"[2, 4]":2,"[2, 5]":-4,"[3, 4]":1,"[3, 5]":-2,"[4, 5]":-3,"[1, 2, 3]":-3,"[1, 2, 4]":4,"[1, 2, 5]":2,"[1, 3, 4]":-4,"[1, 3, 5]":1,"[1, 4, 5]":2,"[2, 3, 4]":-2,"[2, 3, 5]":3,"[2, 4, 5]":3,"[3, 4, 5]":1,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":-4,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:48.040578	2013-06-27 21:26:31.57669	7	f	f
738	66	740	40	2013-06-27 21:31:15.918	{"1":1,"2":0,"3":0,"4":1}	{"[1, 2]":-2,"[1, 3]":2,"[1, 4]":-2,"[2, 3]":-2,"[2, 4]":0,"[3, 4]":0,"[1, 2, 3]":-4,"[1, 2, 4]":-2,"[1, 3, 4]":-3,"[2, 3, 4]":1,"[1, 2, 3, 4]":4}	2013-06-27 21:06:48.021336	2013-06-27 21:31:29.238097	6	f	f
741	66	738	5	2013-06-27 21:36:17.124	{"1":2,"2":0,"3":1,"4":2,"5":1}	{"[1, 2]":4,"[1, 3]":-1,"[1, 4]":-3,"[1, 5]":2,"[2, 3]":3,"[2, 4]":-2,"[2, 5]":-3,"[3, 4]":-1,"[3, 5]":-4,"[4, 5]":-1,"[1, 2, 3]":-4,"[1, 2, 4]":2,"[1, 2, 5]":1,"[1, 3, 4]":2,"[1, 3, 5]":-3,"[1, 4, 5]":4,"[2, 3, 4]":0,"[2, 3, 5]":-2,"[2, 4, 5]":4,"[3, 4, 5]":-1,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:48.048997	2013-06-27 21:36:30.298236	7	f	f
732	66	741	300	2013-06-27 21:41:21.851	{"1":1,"2":0,"3":1,"4":0}	{"[1, 2]":2,"[1, 3]":-2,"[1, 4]":3,"[2, 3]":-3,"[2, 4]":0,"[3, 4]":4,"[1, 2, 3]":0,"[1, 2, 4]":4,"[1, 3, 4]":-3,"[2, 3, 4]":-3,"[1, 2, 3, 4]":0}	2013-06-27 21:06:47.952145	2013-06-27 21:41:35.072054	3	t	f
733	66	732	300	2013-06-27 21:46:18.125	{"1":0,"2":1,"3":2,"4":0}	{"[1, 2]":1,"[1, 3]":2,"[1, 4]":2,"[2, 3]":-2,"[2, 4]":0,"[3, 4]":-1,"[1, 2, 3]":3,"[1, 2, 4]":-4,"[1, 3, 4]":-2,"[2, 3, 4]":2,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:47.964673	2013-06-27 21:46:31.336608	3	t	f
734	66	733	300	2013-06-27 21:51:20.191	{"1":2,"2":2,"3":1,"4":1,"5":1}	{"[1, 2]":0,"[1, 3]":-2,"[1, 4]":-1,"[1, 5]":-3,"[2, 3]":0,"[2, 4]":-3,"[2, 5]":1,"[3, 4]":-1,"[3, 5]":-1,"[4, 5]":0,"[1, 2, 3]":3,"[1, 2, 4]":-3,"[1, 2, 5]":-3,"[1, 3, 4]":3,"[1, 3, 5]":-1,"[1, 4, 5]":3,"[2, 3, 4]":-4,"[2, 3, 5]":-4,"[2, 4, 5]":-3,"[3, 4, 5]":1,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:47.985153	2013-06-27 21:51:33.488161	4	t	f
985	85	987	72	2013-06-27 21:33:42.076	{"1":1,"2":1,"3":2,"4":2}	{"[1, 2]":1,"[1, 3]":2,"[1, 4]":-3,"[2, 3]":-4,"[2, 4]":-4,"[3, 4]":-3,"[1, 2, 3]":-2,"[1, 2, 4]":4,"[1, 3, 4]":2,"[2, 3, 4]":0,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:55.132322	2013-06-27 21:34:00.18839	6	f	f
898	79	\N	300	2013-06-27 21:13:16.864	{"1":1,"2":2,"3":0}	{"[1, 2]":-3,"[1, 3]":-1,"[2, 3]":0,"[1, 2, 3]":-4}	2013-06-27 21:06:53.107614	2013-06-27 21:13:24.236962	1	t	f
904	79	903	300	2013-06-27 22:14:20.224	{"1":2,"2":0,"3":2,"4":1,"5":0}	{"[1, 2]":1,"[1, 3]":3,"[1, 4]":-3,"[1, 5]":-3,"[2, 3]":4,"[2, 4]":0,"[2, 5]":2,"[3, 4]":0,"[3, 5]":-2,"[4, 5]":-1,"[1, 2, 3]":-4,"[1, 2, 4]":-1,"[1, 2, 5]":0,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":-3,"[2, 3, 4]":0,"[2, 3, 5]":-1,"[2, 4, 5]":3,"[3, 4, 5]":-1,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:53.276275	2013-06-27 22:14:27.431136	4	t	f
900	79	898	300	2013-06-27 21:18:57.18	{"1":1,"2":2,"3":2}	{"[1, 2]":-2,"[1, 3]":1,"[2, 3]":2,"[1, 2, 3]":-1}	2013-06-27 21:06:53.153253	2013-06-27 21:19:04.38804	2	t	f
901	79	900	300	2013-06-27 21:24:28.394	{"1":2,"2":2,"3":0,"4":2}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":0,"[2, 3]":0,"[2, 4]":0,"[3, 4]":4,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 3, 4]":-1,"[2, 3, 4]":0,"[1, 2, 3, 4]":0}	2013-06-27 21:06:53.166314	2013-06-27 21:24:35.505827	3	t	f
908	79	901	82	2013-06-27 21:32:34.81	{"1":2,"2":2,"3":1,"4":0}	{"[1, 2]":-4,"[1, 3]":1,"[1, 4]":3,"[2, 3]":1,"[2, 4]":1,"[3, 4]":-1,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 3, 4]":-4,"[2, 3, 4]":-1,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:53.369992	2013-06-27 21:32:42.026239	6	f	f
902	79	908	300	2013-06-27 21:37:42.28	{"1":2,"2":2,"3":2,"4":2}	{"[1, 2]":-3,"[1, 3]":-3,"[1, 4]":0,"[2, 3]":-4,"[2, 4]":4,"[3, 4]":3,"[1, 2, 3]":2,"[1, 2, 4]":1,"[1, 3, 4]":1,"[2, 3, 4]":0,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:53.243779	2013-06-27 21:37:49.40799	3	t	f
899	79	902	300	2013-06-27 21:42:48.93	{"1":2,"2":0,"3":1}	{"[1, 2]":-1,"[1, 3]":-3,"[2, 3]":1,"[1, 2, 3]":-4}	2013-06-27 21:06:53.13205	2013-06-27 21:42:55.988889	2	t	f
910	79	899	16	2013-06-27 21:48:54.121	{"1":2,"2":0,"3":0,"4":1,"5":2}	{"[1, 2]":-2,"[1, 3]":0,"[1, 4]":-4,"[1, 5]":0,"[2, 3]":-1,"[2, 4]":-3,"[2, 5]":-2,"[3, 4]":-1,"[3, 5]":4,"[4, 5]":3,"[1, 2, 3]":3,"[1, 2, 4]":2,"[1, 2, 5]":-2,"[1, 3, 4]":-4,"[1, 3, 5]":-3,"[1, 4, 5]":4,"[2, 3, 4]":0,"[2, 3, 5]":-3,"[2, 4, 5]":2,"[3, 4, 5]":4,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:53.387083	2013-06-27 21:49:01.171715	7	f	f
906	79	910	6	2013-06-27 21:54:07.903	{"1":2,"2":0,"3":2}	{"[1, 2]":3,"[1, 3]":0,"[2, 3]":2,"[1, 2, 3]":-2}	2013-06-27 21:06:53.350164	2013-06-27 21:54:15.015864	5	f	f
984	85	979	39	2013-06-27 21:53:23.903	{"1":2,"2":1,"3":0}	{"[1, 2]":1,"[1, 3]":-1,"[2, 3]":-4,"[1, 2, 3]":2}	2013-06-27 21:06:55.1225	2013-06-27 21:53:41.832561	5	f	f
1088	93	1089	144	2013-06-27 21:52:25.513	{"1":0,"2":2,"3":1}	{"[1, 2]":-4,"[1, 3]":1,"[2, 3]":4,"[1, 2, 3]":-4}	2013-06-27 21:06:57.189149	2013-06-27 21:52:31.151357	5	f	f
909	79	906	96	2013-06-27 21:59:13.507	{"1":1,"2":2,"3":1,"4":2,"5":2}	{"[1, 2]":-3,"[1, 3]":-1,"[1, 4]":-1,"[1, 5]":-3,"[2, 3]":1,"[2, 4]":-1,"[2, 5]":0,"[3, 4]":0,"[3, 5]":-1,"[4, 5]":3,"[1, 2, 3]":0,"[1, 2, 4]":-4,"[1, 2, 5]":-3,"[1, 3, 4]":-3,"[1, 3, 5]":-4,"[1, 4, 5]":-3,"[2, 3, 4]":-3,"[2, 3, 5]":-1,"[2, 4, 5]":4,"[3, 4, 5]":4,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:53.37743	2013-06-27 21:59:20.726481	7	f	f
907	79	909	47	2013-06-27 22:04:14.667	{"1":0,"2":2,"3":0,"4":1}	{"[1, 2]":3,"[1, 3]":-1,"[1, 4]":-2,"[2, 3]":1,"[2, 4]":1,"[3, 4]":2,"[1, 2, 3]":3,"[1, 2, 4]":-1,"[1, 3, 4]":1,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:53.360372	2013-06-27 22:04:21.582386	6	f	f
903	79	907	300	2013-06-27 22:09:14.275	{"1":1,"2":1,"3":0,"4":0,"5":2}	{"[1, 2]":-2,"[1, 3]":-2,"[1, 4]":-4,"[1, 5]":4,"[2, 3]":3,"[2, 4]":1,"[2, 5]":-2,"[3, 4]":-1,"[3, 5]":0,"[4, 5]":2,"[1, 2, 3]":-2,"[1, 2, 4]":0,"[1, 2, 5]":2,"[1, 3, 4]":2,"[1, 3, 5]":0,"[1, 4, 5]":1,"[2, 3, 4]":3,"[2, 3, 5]":1,"[2, 4, 5]":2,"[3, 4, 5]":4,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:53.266145	2013-06-27 22:09:21.425852	4	t	f
905	79	904	67	2013-06-27 22:19:20.678	{"1":0,"2":0,"3":0}	{"[1, 2]":-4,"[1, 3]":4,"[2, 3]":-2,"[1, 2, 3]":2}	2013-06-27 21:06:53.292581	2013-06-27 22:19:27.777803	5	f	f
937	82	\N	300	2013-06-27 21:11:41.534	{"1":1,"2":1,"3":0}	{"[1, 2]":2,"[1, 3]":-3,"[2, 3]":1,"[1, 2, 3]":2}	2013-06-27 21:06:54.210038	2013-06-27 21:12:11.164809	1	t	f
944	82	947	66	2013-06-27 21:28:22.708	{"1":0,"2":0,"3":1}	{"[1, 2]":4,"[1, 3]":1,"[2, 3]":3,"[1, 2, 3]":2}	2013-06-27 21:06:54.273818	2013-06-27 21:28:51.82866	5	f	f
942	82	949	300	2013-06-27 21:47:06.45	{"1":2,"2":0,"3":2,"4":2,"5":1}	{"[1, 2]":3,"[1, 3]":-1,"[1, 4]":-2,"[1, 5]":-1,"[2, 3]":2,"[2, 4]":-2,"[2, 5]":0,"[3, 4]":-1,"[3, 5]":1,"[4, 5]":2,"[1, 2, 3]":-3,"[1, 2, 4]":2,"[1, 2, 5]":-3,"[1, 3, 4]":4,"[1, 3, 5]":-4,"[1, 4, 5]":4,"[2, 3, 4]":0,"[2, 3, 5]":-2,"[2, 4, 5]":0,"[3, 4, 5]":2,"[1, 2, 3, 4]":-1,"[1, 2, 3, 5]":-1,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:54.254471	2013-06-27 21:47:35.607559	4	t	f
941	82	942	300	2013-06-27 21:51:44.35	{"1":1,"2":2,"3":1,"4":1}	{"[1, 2]":0,"[1, 3]":3,"[1, 4]":3,"[2, 3]":-2,"[2, 4]":1,"[3, 4]":1,"[1, 2, 3]":-3,"[1, 2, 4]":2,"[1, 3, 4]":-3,"[2, 3, 4]":3,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:54.245572	2013-06-27 21:52:13.584234	3	t	f
943	82	941	300	2013-06-27 21:56:31.817	{"1":0,"2":2,"3":0,"4":2,"5":1}	{"[1, 2]":2,"[1, 3]":4,"[1, 4]":-4,"[1, 5]":-2,"[2, 3]":-3,"[2, 4]":2,"[2, 5]":0,"[3, 4]":4,"[3, 5]":-1,"[4, 5]":-3,"[1, 2, 3]":3,"[1, 2, 4]":1,"[1, 2, 5]":-3,"[1, 3, 4]":-2,"[1, 3, 5]":-3,"[1, 4, 5]":1,"[2, 3, 4]":3,"[2, 3, 5]":-2,"[2, 4, 5]":2,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:54.264095	2013-06-27 21:57:00.983643	4	t	f
939	82	943	300	2013-06-27 22:01:10.937	{"1":0,"2":1,"3":0}	{"[1, 2]":-3,"[1, 3]":1,"[2, 3]":4,"[1, 2, 3]":-4}	2013-06-27 21:06:54.228906	2013-06-27 22:01:40.129287	2	t	f
940	82	939	300	2013-06-27 22:05:50.008	{"1":0,"2":1,"3":2,"4":1}	{"[1, 2]":0,"[1, 3]":1,"[1, 4]":0,"[2, 3]":-3,"[2, 4]":0,"[3, 4]":-1,"[1, 2, 3]":4,"[1, 2, 4]":-3,"[1, 3, 4]":4,"[2, 3, 4]":-1,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:54.237915	2013-06-27 22:06:19.172273	3	t	f
938	82	940	300	2013-06-27 22:10:27.715	{"1":1,"2":0,"3":2}	{"[1, 2]":0,"[1, 3]":-2,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-06-27 21:06:54.221255	2013-06-27 22:10:56.932827	2	t	f
949	82	946	173	2013-06-27 21:42:29.068	{"1":2,"2":1,"3":1,"4":2,"5":1}	{"[1, 2]":-3,"[1, 3]":-3,"[1, 4]":-3,"[1, 5]":-4,"[2, 3]":-3,"[2, 4]":4,"[2, 5]":2,"[3, 4]":4,"[3, 5]":-1,"[4, 5]":2,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 2, 5]":0,"[1, 3, 4]":-2,"[1, 3, 5]":-4,"[1, 4, 5]":-2,"[2, 3, 4]":4,"[2, 3, 5]":-2,"[2, 4, 5]":-2,"[3, 4, 5]":2,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:54.319524	2013-06-27 21:42:58.31044	7	f	f
961	83	953	133	2013-06-27 21:46:02.13	{"1":1,"2":2,"3":1,"4":1,"5":1}	{"[1, 2]":-1,"[1, 3]":-3,"[1, 4]":4,"[1, 5]":2,"[2, 3]":1,"[2, 4]":-3,"[2, 5]":2,"[3, 4]":-1,"[3, 5]":2,"[4, 5]":1,"[1, 2, 3]":3,"[1, 2, 4]":1,"[1, 2, 5]":-3,"[1, 3, 4]":-1,"[1, 3, 5]":1,"[1, 4, 5]":-3,"[2, 3, 4]":4,"[2, 3, 5]":-1,"[2, 4, 5]":4,"[3, 4, 5]":0,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":1,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:54.637458	2013-06-27 21:46:39.787236	7	f	f
955	83	961	300	2013-06-27 21:50:36.378	{"1":0,"2":2,"3":2,"4":2,"5":0}	{"[1, 2]":2,"[1, 3]":1,"[1, 4]":1,"[1, 5]":-2,"[2, 3]":-2,"[2, 4]":-4,"[2, 5]":2,"[3, 4]":0,"[3, 5]":-1,"[4, 5]":-4,"[1, 2, 3]":1,"[1, 2, 4]":0,"[1, 2, 5]":1,"[1, 3, 4]":3,"[1, 3, 5]":4,"[1, 4, 5]":2,"[2, 3, 4]":1,"[2, 3, 5]":-1,"[2, 4, 5]":1,"[3, 4, 5]":0,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:54.585101	2013-06-27 21:51:13.713128	4	t	f
954	83	962	300	2013-06-27 21:59:55.168	{"1":2,"2":2,"3":1,"4":0}	{"[1, 2]":-3,"[1, 3]":-1,"[1, 4]":2,"[2, 3]":4,"[2, 4]":3,"[3, 4]":0,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 3, 4]":2,"[2, 3, 4]":-3,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:54.577337	2013-06-27 22:00:32.739909	3	t	f
950	83	\N	300	2013-06-27 21:11:00.348	{"1":2,"2":0,"3":1}	{"[1, 2]":-3,"[1, 3]":-2,"[2, 3]":1,"[1, 2, 3]":-2}	2013-06-27 21:06:54.539463	2013-06-27 21:11:38.687097	1	t	f
960	83	950	28	2013-06-27 21:16:28.928	{"1":1,"2":1,"3":2,"4":1}	{"[1, 2]":1,"[1, 3]":4,"[1, 4]":1,"[2, 3]":1,"[2, 4]":2,"[3, 4]":-2,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 3, 4]":4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:54.629352	2013-06-27 21:17:06.512979	6	f	f
952	83	954	300	2013-06-27 22:04:26.89	{"1":1,"2":0,"3":0}	{"[1, 2]":-2,"[1, 3]":1,"[2, 3]":1,"[1, 2, 3]":-3}	2013-06-27 21:06:54.56154	2013-06-27 22:05:04.32077	2	t	f
948	82	937	118	2013-06-27 21:17:48.993	{"1":0,"2":2,"3":2,"4":1,"5":2}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":2,"[1, 5]":-2,"[2, 3]":1,"[2, 4]":0,"[2, 5]":-1,"[3, 4]":-1,"[3, 5]":0,"[4, 5]":-3,"[1, 2, 3]":0,"[1, 2, 4]":-1,"[1, 2, 5]":3,"[1, 3, 4]":0,"[1, 3, 5]":1,"[1, 4, 5]":2,"[2, 3, 4]":-3,"[2, 3, 5]":-3,"[2, 4, 5]":-4,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:54.308821	2013-06-27 21:18:18.286668	7	f	f
956	83	960	300	2013-06-27 21:21:26.613	{"1":1,"2":2,"3":2,"4":0,"5":0}	{"[1, 2]":1,"[1, 3]":-3,"[1, 4]":0,"[1, 5]":-1,"[2, 3]":4,"[2, 4]":0,"[2, 5]":4,"[3, 4]":-3,"[3, 5]":-2,"[4, 5]":-1,"[1, 2, 3]":-2,"[1, 2, 4]":-4,"[1, 2, 5]":4,"[1, 3, 4]":-1,"[1, 3, 5]":-3,"[1, 4, 5]":1,"[2, 3, 4]":4,"[2, 3, 5]":0,"[2, 4, 5]":-3,"[3, 4, 5]":2,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:54.593585	2013-06-27 21:22:04.232516	4	t	f
947	82	948	166	2013-06-27 21:23:11.816	{"1":2,"2":2,"3":2,"4":2}	{"[1, 2]":-2,"[1, 3]":1,"[1, 4]":-2,"[2, 3]":4,"[2, 4]":0,"[3, 4]":-2,"[1, 2, 3]":-3,"[1, 2, 4]":0,"[1, 3, 4]":-2,"[2, 3, 4]":1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:54.300195	2013-06-27 21:23:41.019175	6	f	f
957	83	956	61	2013-06-27 21:26:59.863	{"1":0,"2":1,"3":2}	{"[1, 2]":-4,"[1, 3]":-2,"[2, 3]":0,"[1, 2, 3]":1}	2013-06-27 21:06:54.602521	2013-06-27 21:27:37.354704	5	f	f
951	83	957	300	2013-06-27 21:31:34.908	{"1":2,"2":1,"3":1}	{"[1, 2]":3,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-06-27 21:06:54.551939	2013-06-27 21:32:12.546633	2	t	f
945	82	944	123	2013-06-27 21:33:02.278	{"1":1,"2":0,"3":1}	{"[1, 2]":2,"[1, 3]":1,"[2, 3]":-2,"[1, 2, 3]":0}	2013-06-27 21:06:54.28269	2013-06-27 21:33:31.45626	5	f	f
958	83	951	62	2013-06-27 21:36:19.104	{"1":1,"2":0,"3":2}	{"[1, 2]":-3,"[1, 3]":4,"[2, 3]":-2,"[1, 2, 3]":-3}	2013-06-27 21:06:54.611037	2013-06-27 21:36:56.602495	5	f	f
946	82	945	128	2013-06-27 21:37:47.573	{"1":0,"2":0,"3":0,"4":2}	{"[1, 2]":-4,"[1, 3]":2,"[1, 4]":-4,"[2, 3]":0,"[2, 4]":-2,"[3, 4]":1,"[1, 2, 3]":3,"[1, 2, 4]":2,"[1, 3, 4]":2,"[2, 3, 4]":1,"[1, 2, 3, 4]":0}	2013-06-27 21:06:54.292082	2013-06-27 21:38:16.560583	6	f	f
953	83	958	300	2013-06-27 21:41:08.156	{"1":0,"2":0,"3":1,"4":0}	{"[1, 2]":-3,"[1, 3]":-4,"[1, 4]":2,"[2, 3]":2,"[2, 4]":-1,"[3, 4]":-2,"[1, 2, 3]":4,"[1, 2, 4]":-2,"[1, 3, 4]":-3,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:54.569982	2013-06-27 21:41:45.701565	3	t	f
962	83	955	32	2013-06-27 21:55:13.363	{"1":2,"2":2,"3":0,"4":0,"5":1}	{"[1, 2]":-2,"[1, 3]":-2,"[1, 4]":4,"[1, 5]":-3,"[2, 3]":-3,"[2, 4]":-2,"[2, 5]":-2,"[3, 4]":3,"[3, 5]":-3,"[4, 5]":-4,"[1, 2, 3]":2,"[1, 2, 4]":4,"[1, 2, 5]":-4,"[1, 3, 4]":4,"[1, 3, 5]":-4,"[1, 4, 5]":-1,"[2, 3, 4]":2,"[2, 3, 5]":3,"[2, 4, 5]":4,"[3, 4, 5]":1,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":-1,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:54.645865	2013-06-27 21:55:50.94712	7	f	f
967	84	964	300	2013-06-27 21:58:35.151	{"1":0,"2":0,"3":2,"4":1}	{"[1, 2]":1,"[1, 3]":-1,"[1, 4]":0,"[2, 3]":2,"[2, 4]":3,"[3, 4]":2,"[1, 2, 3]":-2,"[1, 2, 4]":0,"[1, 3, 4]":-3,"[2, 3, 4]":-4,"[1, 2, 3, 4]":4}	2013-06-27 21:06:54.859123	2013-06-27 21:58:43.684536	3	t	f
969	84	971	300	2013-06-27 22:08:37.671	{"1":1,"2":1,"3":0,"4":1,"5":0}	{"[1, 2]":-2,"[1, 3]":-3,"[1, 4]":1,"[1, 5]":-4,"[2, 3]":-2,"[2, 4]":0,"[2, 5]":4,"[3, 4]":0,"[3, 5]":2,"[4, 5]":4,"[1, 2, 3]":2,"[1, 2, 4]":-3,"[1, 2, 5]":3,"[1, 3, 4]":-2,"[1, 3, 5]":3,"[1, 4, 5]":3,"[2, 3, 4]":-1,"[2, 3, 5]":-1,"[2, 4, 5]":4,"[3, 4, 5]":-2,"[1, 2, 3, 4]":4,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:54.874685	2013-06-27 22:08:46.265111	4	t	f
959	83	952	134	2013-06-27 22:08:58.804	{"1":2,"2":2,"3":2,"4":1}	{"[1, 2]":2,"[1, 3]":-3,"[1, 4]":0,"[2, 3]":-2,"[2, 4]":-4,"[3, 4]":2,"[1, 2, 3]":-2,"[1, 2, 4]":-4,"[1, 3, 4]":-1,"[2, 3, 4]":4,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:54.621173	2013-06-27 22:09:36.49076	6	f	f
965	84	969	300	2013-06-27 22:13:36.592	{"1":2,"2":2,"3":2}	{"[1, 2]":3,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":4}	2013-06-27 21:06:54.813375	2013-06-27 22:13:44.912942	2	t	f
963	84	\N	300	2013-06-27 21:11:46.563	{"1":1,"2":1,"3":0}	{"[1, 2]":-3,"[1, 3]":1,"[2, 3]":-1,"[1, 2, 3]":3}	2013-06-27 21:06:54.793311	2013-06-27 21:11:55.034273	1	t	f
976	85	\N	300	2013-06-27 21:11:37.943	{"1":1,"2":0,"3":1}	{"[1, 2]":0,"[1, 3]":0,"[2, 3]":0,"[1, 2, 3]":-2}	2013-06-27 21:06:55.04591	2013-06-27 21:11:56.357087	1	t	f
975	84	963	140	2013-06-27 21:17:30.948	{"1":1,"2":0,"3":0,"4":1,"5":2}	{"[1, 2]":2,"[1, 3]":-1,"[1, 4]":-1,"[1, 5]":3,"[2, 3]":1,"[2, 4]":2,"[2, 5]":3,"[3, 4]":4,"[3, 5]":-3,"[4, 5]":-3,"[1, 2, 3]":-2,"[1, 2, 4]":1,"[1, 2, 5]":4,"[1, 3, 4]":1,"[1, 3, 5]":3,"[1, 4, 5]":1,"[2, 3, 4]":-1,"[2, 3, 5]":-1,"[2, 4, 5]":1,"[3, 4, 5]":-2,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:54.923069	2013-06-27 21:17:39.629282	7	f	f
974	84	975	58	2013-06-27 21:22:38.803	{"1":2,"2":2,"3":1,"4":1,"5":0}	{"[1, 2]":-3,"[1, 3]":0,"[1, 4]":3,"[1, 5]":2,"[2, 3]":1,"[2, 4]":0,"[2, 5]":-4,"[3, 4]":-4,"[3, 5]":2,"[4, 5]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 2, 5]":-4,"[1, 3, 4]":3,"[1, 3, 5]":-2,"[1, 4, 5]":4,"[2, 3, 4]":-4,"[2, 3, 5]":3,"[2, 4, 5]":-3,"[3, 4, 5]":2,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:54.914924	2013-06-27 21:22:47.265014	7	f	f
966	84	974	300	2013-06-27 21:27:51.242	{"1":0,"2":1,"3":1,"4":0}	{"[1, 2]":3,"[1, 3]":-1,"[1, 4]":-2,"[2, 3]":-2,"[2, 4]":-3,"[3, 4]":-2,"[1, 2, 3]":4,"[1, 2, 4]":2,"[1, 3, 4]":0,"[2, 3, 4]":-1,"[1, 2, 3, 4]":0}	2013-06-27 21:06:54.822136	2013-06-27 21:27:59.679991	3	t	f
973	84	966	126	2013-06-27 21:33:11.599	{"1":0,"2":2,"3":0,"4":1}	{"[1, 2]":0,"[1, 3]":2,"[1, 4]":-1,"[2, 3]":4,"[2, 4]":-1,"[3, 4]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 3, 4]":-1,"[2, 3, 4]":-1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:54.907006	2013-06-27 21:33:20.016965	6	f	f
968	84	973	300	2013-06-27 21:38:11.676	{"1":2,"2":1,"3":0,"4":1,"5":1}	{"[1, 2]":4,"[1, 3]":-3,"[1, 4]":0,"[1, 5]":0,"[2, 3]":4,"[2, 4]":4,"[2, 5]":-4,"[3, 4]":0,"[3, 5]":-3,"[4, 5]":-1,"[1, 2, 3]":3,"[1, 2, 4]":-3,"[1, 2, 5]":-4,"[1, 3, 4]":-3,"[1, 3, 5]":4,"[1, 4, 5]":2,"[2, 3, 4]":-2,"[2, 3, 5]":0,"[2, 4, 5]":4,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:54.866862	2013-06-27 21:38:20.244078	4	t	f
972	84	968	161	2013-06-27 21:43:15.627	{"1":2,"2":0,"3":0,"4":0}	{"[1, 2]":-1,"[1, 3]":-4,"[1, 4]":1,"[2, 3]":-4,"[2, 4]":2,"[3, 4]":3,"[1, 2, 3]":-1,"[1, 2, 4]":-3,"[1, 3, 4]":0,"[2, 3, 4]":0,"[1, 2, 3, 4]":4}	2013-06-27 21:06:54.899174	2013-06-27 21:43:23.928789	6	f	f
970	84	972	62	2013-06-27 21:48:29.211	{"1":0,"2":0,"3":0}	{"[1, 2]":-4,"[1, 3]":3,"[2, 3]":-3,"[1, 2, 3]":-3}	2013-06-27 21:06:54.882477	2013-06-27 21:48:37.812464	5	f	f
964	84	970	300	2013-06-27 21:53:36.991	{"1":1,"2":0,"3":2}	{"[1, 2]":-3,"[1, 3]":2,"[2, 3]":2,"[1, 2, 3]":-2}	2013-06-27 21:06:54.804575	2013-06-27 21:53:45.487912	2	t	f
990	86	996	300	2013-06-27 21:35:32.557	{"1":2,"2":1,"3":0}	{"[1, 2]":4,"[1, 3]":-2,"[2, 3]":-4,"[1, 2, 3]":-2}	2013-06-27 21:06:55.35368	2013-06-27 21:35:47.75049	2	t	f
980	85	985	300	2013-06-27 21:38:45.899	{"1":2,"2":1,"3":1,"4":1}	{"[1, 2]":-3,"[1, 3]":1,"[1, 4]":2,"[2, 3]":3,"[2, 4]":-3,"[3, 4]":-2,"[1, 2, 3]":0,"[1, 2, 4]":3,"[1, 3, 4]":3,"[2, 3, 4]":4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:55.089726	2013-06-27 21:39:03.817742	3	t	f
986	85	980	90	2013-06-27 21:43:39.029	{"1":2,"2":2,"3":2,"4":1}	{"[1, 2]":3,"[1, 3]":3,"[1, 4]":3,"[2, 3]":-3,"[2, 4]":-3,"[3, 4]":-3,"[1, 2, 3]":4,"[1, 2, 4]":-3,"[1, 3, 4]":3,"[2, 3, 4]":1,"[1, 2, 3, 4]":1}	2013-06-27 21:06:55.140967	2013-06-27 21:43:57.125068	6	f	f
992	86	998	300	2013-06-27 21:45:39.696	{"1":1,"2":2,"3":0,"4":1}	{"[1, 2]":2,"[1, 3]":-4,"[1, 4]":3,"[2, 3]":-1,"[2, 4]":2,"[3, 4]":0,"[1, 2, 3]":2,"[1, 2, 4]":-1,"[1, 3, 4]":3,"[2, 3, 4]":4,"[1, 2, 3, 4]":2}	2013-06-27 21:06:55.373152	2013-06-27 21:45:55.056153	3	t	f
983	85	988	83	2013-06-27 22:03:08.952	{"1":2,"2":0,"3":2}	{"[1, 2]":1,"[1, 3]":-3,"[2, 3]":-1,"[1, 2, 3]":1}	2013-06-27 21:06:55.113927	2013-06-27 22:03:26.954529	5	f	f
978	85	983	300	2013-06-27 22:07:57.16	{"1":2,"2":1,"3":0}	{"[1, 2]":-1,"[1, 3]":1,"[2, 3]":4,"[1, 2, 3]":0}	2013-06-27 21:06:55.072046	2013-06-27 22:08:15.106357	2	t	f
993	86	999	300	2013-06-27 22:11:00.785	{"1":1,"2":2,"3":0,"4":1}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":4,"[2, 3]":-1,"[2, 4]":-3,"[3, 4]":-3,"[1, 2, 3]":3,"[1, 2, 4]":1,"[1, 3, 4]":1,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:55.384139	2013-06-27 22:11:16.209247	3	t	f
981	85	978	300	2013-06-27 22:12:46.491	{"1":2,"2":0,"3":0,"4":0,"5":0}	{"[1, 2]":3,"[1, 3]":0,"[1, 4]":3,"[1, 5]":0,"[2, 3]":-4,"[2, 4]":0,"[2, 5]":2,"[3, 4]":1,"[3, 5]":-3,"[4, 5]":-4,"[1, 2, 3]":-1,"[1, 2, 4]":4,"[1, 2, 5]":-3,"[1, 3, 4]":-4,"[1, 3, 5]":2,"[1, 4, 5]":1,"[2, 3, 4]":-4,"[2, 3, 5]":2,"[2, 4, 5]":4,"[3, 4, 5]":4,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:55.096933	2013-06-27 22:13:04.654416	4	t	f
979	85	986	300	2013-06-27 21:48:32.387	{"1":2,"2":2,"3":0,"4":0}	{"[1, 2]":2,"[1, 3]":0,"[1, 4]":-1,"[2, 3]":-3,"[2, 4]":-4,"[3, 4]":2,"[1, 2, 3]":4,"[1, 2, 4]":2,"[1, 3, 4]":2,"[2, 3, 4]":4,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:55.081355	2013-06-27 21:48:50.644989	3	t	f
1022	88	1023	127	2013-06-27 22:15:03.95	{"1":1,"2":2,"3":0}	{"[1, 2]":0,"[1, 3]":-1,"[2, 3]":-3,"[1, 2, 3]":-4}	2013-06-27 21:06:55.900211	2013-06-27 22:15:09.750082	5	f	f
989	86	\N	300	2013-06-27 21:12:51.228	{"1":1,"2":0,"3":2}	{"[1, 2]":1,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":4}	2013-06-27 21:06:55.341106	2013-06-27 21:13:06.777492	1	t	f
982	85	976	300	2013-06-27 21:17:03.937	{"1":0,"2":0,"3":1,"4":1,"5":0}	{"[1, 2]":-1,"[1, 3]":0,"[1, 4]":-3,"[1, 5]":2,"[2, 3]":4,"[2, 4]":0,"[2, 5]":1,"[3, 4]":-4,"[3, 5]":1,"[4, 5]":4,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 2, 5]":3,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":-4,"[2, 3, 4]":1,"[2, 3, 5]":-2,"[2, 4, 5]":-2,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:55.105476	2013-06-27 21:17:22.07401	4	t	f
991	86	989	300	2013-06-27 21:19:02.355	{"1":0,"2":1,"3":2}	{"[1, 2]":-2,"[1, 3]":2,"[2, 3]":3,"[1, 2, 3]":2}	2013-06-27 21:06:55.363615	2013-06-27 21:19:17.546934	2	t	f
977	85	982	300	2013-06-27 21:22:25.362	{"1":1,"2":0,"3":1}	{"[1, 2]":0,"[1, 3]":-4,"[2, 3]":1,"[1, 2, 3]":4}	2013-06-27 21:06:55.059327	2013-06-27 21:22:43.442753	2	t	f
987	85	977	42	2013-06-27 21:28:15.296	{"1":1,"2":2,"3":2,"4":1,"5":1}	{"[1, 2]":2,"[1, 3]":2,"[1, 4]":1,"[1, 5]":1,"[2, 3]":3,"[2, 4]":4,"[2, 5]":0,"[3, 4]":3,"[3, 5]":-4,"[4, 5]":-4,"[1, 2, 3]":2,"[1, 2, 4]":4,"[1, 2, 5]":3,"[1, 3, 4]":1,"[1, 3, 5]":-1,"[1, 4, 5]":0,"[2, 3, 4]":-3,"[2, 3, 5]":1,"[2, 4, 5]":-4,"[3, 4, 5]":-3,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:55.15136	2013-06-27 21:28:33.461411	7	f	f
988	85	984	76	2013-06-27 21:58:20.18	{"1":2,"2":2,"3":1,"4":0,"5":2}	{"[1, 2]":-2,"[1, 3]":-1,"[1, 4]":1,"[1, 5]":-2,"[2, 3]":4,"[2, 4]":-1,"[2, 5]":0,"[3, 4]":2,"[3, 5]":-4,"[4, 5]":-4,"[1, 2, 3]":2,"[1, 2, 4]":-1,"[1, 2, 5]":-2,"[1, 3, 4]":-1,"[1, 3, 5]":3,"[1, 4, 5]":-1,"[2, 3, 4]":2,"[2, 3, 5]":-2,"[2, 4, 5]":4,"[3, 4, 5]":-4,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:55.162213	2013-06-27 21:58:38.254106	7	f	f
1003	87	1009	300	2013-06-27 21:42:47.111	{"1":1,"2":0,"3":0}	{"[1, 2]":-2,"[1, 3]":0,"[2, 3]":-4,"[1, 2, 3]":3}	2013-06-27 21:06:55.635356	2013-06-27 21:43:08.004672	2	t	f
1010	87	1003	79	2013-06-27 21:47:39.223	{"1":1,"2":2,"3":1}	{"[1, 2]":-4,"[1, 3]":-4,"[2, 3]":3,"[1, 2, 3]":4}	2013-06-27 21:06:55.696822	2013-06-27 21:48:00.149492	5	f	f
994	86	992	300	2013-06-27 21:50:40.709	{"1":1,"2":0,"3":0,"4":1,"5":2}	{"[1, 2]":2,"[1, 3]":3,"[1, 4]":-3,"[1, 5]":-2,"[2, 3]":-4,"[2, 4]":4,"[2, 5]":-1,"[3, 4]":4,"[3, 5]":3,"[4, 5]":4,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 2, 5]":3,"[1, 3, 4]":2,"[1, 3, 5]":4,"[1, 4, 5]":3,"[2, 3, 4]":1,"[2, 3, 5]":4,"[2, 4, 5]":-1,"[3, 4, 5]":3,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:55.395125	2013-06-27 21:50:56.185367	4	t	f
1005	87	1007	300	2013-06-27 22:01:58.345	{"1":1,"2":1,"3":1,"4":1}	{"[1, 2]":-4,"[1, 3]":3,"[1, 4]":4,"[2, 3]":4,"[2, 4]":-2,"[3, 4]":-2,"[1, 2, 3]":-3,"[1, 2, 4]":-2,"[1, 3, 4]":-2,"[2, 3, 4]":1,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:55.653891	2013-06-27 22:02:19.272615	3	t	f
999	86	1000	15	2013-06-27 22:06:09.055	{"1":0,"2":2,"3":2,"4":2}	{"[1, 2]":0,"[1, 3]":-1,"[1, 4]":-2,"[2, 3]":1,"[2, 4]":-1,"[3, 4]":0,"[1, 2, 3]":-3,"[1, 2, 4]":1,"[1, 3, 4]":-4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:55.44817	2013-06-27 22:06:24.255736	6	f	f
1011	87	1010	141	2013-06-27 21:52:25.766	{"1":2,"2":1,"3":0,"4":1}	{"[1, 2]":-1,"[1, 3]":-3,"[1, 4]":-4,"[2, 3]":-2,"[2, 4]":-1,"[3, 4]":-1,"[1, 2, 3]":2,"[1, 2, 4]":0,"[1, 3, 4]":-1,"[2, 3, 4]":-4,"[1, 2, 3, 4]":4}	2013-06-27 21:06:55.705994	2013-06-27 21:52:46.911988	6	f	f
997	86	994	97	2013-06-27 21:56:09.705	{"1":2,"2":2,"3":1}	{"[1, 2]":-2,"[1, 3]":1,"[2, 3]":-2,"[1, 2, 3]":-1}	2013-06-27 21:06:55.424967	2013-06-27 21:56:25.106327	5	f	f
1007	87	1011	300	2013-06-27 21:57:12.302	{"1":2,"2":2,"3":0,"4":1,"5":2}	{"[1, 2]":2,"[1, 3]":-1,"[1, 4]":-2,"[1, 5]":-2,"[2, 3]":2,"[2, 4]":0,"[2, 5]":2,"[3, 4]":1,"[3, 5]":3,"[4, 5]":-4,"[1, 2, 3]":2,"[1, 2, 4]":0,"[1, 2, 5]":4,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":-1,"[2, 3, 4]":-2,"[2, 3, 5]":4,"[2, 4, 5]":-3,"[3, 4, 5]":3,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":-2,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:55.671408	2013-06-27 21:57:34.085411	4	t	f
1004	87	1005	300	2013-06-27 22:06:45.497	{"1":0,"2":0,"3":2}	{"[1, 2]":1,"[1, 3]":-1,"[2, 3]":-1,"[1, 2, 3]":1}	2013-06-27 21:06:55.643427	2013-06-27 22:07:06.719895	2	t	f
1006	87	1004	300	2013-06-27 22:11:30.942	{"1":0,"2":2,"3":1,"4":1}	{"[1, 2]":-1,"[1, 3]":4,"[1, 4]":-1,"[2, 3]":-2,"[2, 4]":1,"[3, 4]":-2,"[1, 2, 3]":-4,"[1, 2, 4]":4,"[1, 3, 4]":0,"[2, 3, 4]":-3,"[1, 2, 3, 4]":2}	2013-06-27 21:06:55.662724	2013-06-27 22:11:52.235504	3	t	f
1001	86	993	112	2013-06-27 22:15:57.242	{"1":2,"2":1,"3":1,"4":1,"5":1}	{"[1, 2]":1,"[1, 3]":-3,"[1, 4]":-3,"[1, 5]":-4,"[2, 3]":-3,"[2, 4]":3,"[2, 5]":-1,"[3, 4]":2,"[3, 5]":-4,"[4, 5]":-2,"[1, 2, 3]":-2,"[1, 2, 4]":4,"[1, 2, 5]":0,"[1, 3, 4]":-2,"[1, 3, 5]":-4,"[1, 4, 5]":1,"[2, 3, 4]":-2,"[2, 3, 5]":2,"[2, 4, 5]":4,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:55.466789	2013-06-27 22:16:12.796092	7	f	f
1002	87	\N	300	2013-06-27 21:12:14.255	{"1":1,"2":0,"3":0}	{"[1, 2]":4,"[1, 3]":-1,"[2, 3]":-4,"[1, 2, 3]":1}	2013-06-27 21:06:55.624303	2013-06-27 21:12:35.37384	1	t	f
1008	87	1014	300	2013-06-27 21:22:57.795	{"1":1,"2":0,"3":0,"4":2,"5":1}	{"[1, 2]":-1,"[1, 3]":-4,"[1, 4]":3,"[1, 5]":-4,"[2, 3]":-4,"[2, 4]":4,"[2, 5]":-4,"[3, 4]":4,"[3, 5]":0,"[4, 5]":1,"[1, 2, 3]":-2,"[1, 2, 4]":4,"[1, 2, 5]":-4,"[1, 3, 4]":2,"[1, 3, 5]":1,"[1, 4, 5]":4,"[2, 3, 4]":4,"[2, 3, 5]":3,"[2, 4, 5]":-3,"[3, 4, 5]":3,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:55.679811	2013-06-27 21:23:18.680513	4	t	f
995	86	991	300	2013-06-27 21:24:25.936	{"1":0,"2":1,"3":1,"4":1,"5":1}	{"[1, 2]":1,"[1, 3]":3,"[1, 4]":-3,"[1, 5]":0,"[2, 3]":4,"[2, 4]":-1,"[2, 5]":1,"[3, 4]":-1,"[3, 5]":1,"[4, 5]":0,"[1, 2, 3]":-4,"[1, 2, 4]":4,"[1, 2, 5]":2,"[1, 3, 4]":4,"[1, 3, 5]":0,"[1, 4, 5]":0,"[2, 3, 4]":4,"[2, 3, 5]":1,"[2, 4, 5]":1,"[3, 4, 5]":-1,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:55.404029	2013-06-27 21:24:41.281776	4	t	f
1012	87	1008	53	2013-06-27 21:27:51.482	{"1":2,"2":2,"3":1,"4":1}	{"[1, 2]":-3,"[1, 3]":2,"[1, 4]":-2,"[2, 3]":-1,"[2, 4]":-4,"[3, 4]":4,"[1, 2, 3]":-4,"[1, 2, 4]":-4,"[1, 3, 4]":4,"[2, 3, 4]":4,"[1, 2, 3, 4]":3}	2013-06-27 21:06:55.713312	2013-06-27 21:28:12.552458	6	f	f
996	86	995	48	2013-06-27 21:30:24.813	{"1":2,"2":0,"3":2}	{"[1, 2]":0,"[1, 3]":3,"[2, 3]":2,"[1, 2, 3]":-4}	2013-06-27 21:06:55.414631	2013-06-27 21:30:40.18793	5	f	f
1009	87	1013	90	2013-06-27 21:37:51.815	{"1":1,"2":2,"3":2}	{"[1, 2]":4,"[1, 3]":-3,"[2, 3]":1,"[1, 2, 3]":0}	2013-06-27 21:06:55.687891	2013-06-27 21:38:12.684851	5	f	f
998	86	990	97	2013-06-27 21:40:38.874	{"1":1,"2":0,"3":0,"4":2}	{"[1, 2]":-4,"[1, 3]":1,"[1, 4]":-2,"[2, 3]":4,"[2, 4]":0,"[3, 4]":-4,"[1, 2, 3]":4,"[1, 2, 4]":1,"[1, 3, 4]":2,"[2, 3, 4]":0,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:55.439006	2013-06-27 21:40:54.400722	6	f	f
1000	86	997	146	2013-06-27 22:01:15.916	{"1":2,"2":0,"3":2,"4":2,"5":0}	{"[1, 2]":4,"[1, 3]":2,"[1, 4]":2,"[1, 5]":-2,"[2, 3]":-2,"[2, 4]":4,"[2, 5]":-3,"[3, 4]":1,"[3, 5]":-2,"[4, 5]":-3,"[1, 2, 3]":0,"[1, 2, 4]":1,"[1, 2, 5]":2,"[1, 3, 4]":1,"[1, 3, 5]":0,"[1, 4, 5]":-1,"[2, 3, 4]":4,"[2, 3, 5]":0,"[2, 4, 5]":-3,"[3, 4, 5]":1,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:55.458538	2013-06-27 22:01:31.425973	7	f	f
1025	88	1027	20	2013-06-27 21:55:06.715	{"1":2,"2":1,"3":0,"4":0}	{"[1, 2]":-1,"[1, 3]":-1,"[1, 4]":-3,"[2, 3]":-4,"[2, 4]":0,"[3, 4]":-1,"[1, 2, 3]":-2,"[1, 2, 4]":-2,"[1, 3, 4]":2,"[2, 3, 4]":3,"[1, 2, 3, 4]":2}	2013-06-27 21:06:55.924842	2013-06-27 21:55:12.492083	6	f	f
1021	88	1025	300	2013-06-27 22:00:06.137	{"1":1,"2":0,"3":2,"4":1,"5":0}	{"[1, 2]":0,"[1, 3]":-1,"[1, 4]":3,"[1, 5]":-4,"[2, 3]":-2,"[2, 4]":-2,"[2, 5]":-3,"[3, 4]":0,"[3, 5]":-3,"[4, 5]":-3,"[1, 2, 3]":-4,"[1, 2, 4]":0,"[1, 2, 5]":-3,"[1, 3, 4]":0,"[1, 3, 5]":-2,"[1, 4, 5]":-1,"[2, 3, 4]":3,"[2, 3, 5]":1,"[2, 4, 5]":-2,"[3, 4, 5]":-3,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-3,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:55.891954	2013-06-27 22:00:11.954568	4	t	f
1015	88	\N	300	2013-06-27 21:12:58.165	{"1":0,"2":0,"3":1}	{"[1, 2]":-4,"[1, 3]":2,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-06-27 21:06:55.840673	2013-06-27 21:13:04.191436	1	t	f
1020	88	1021	300	2013-06-27 22:05:05.403	{"1":0,"2":0,"3":0,"4":1,"5":1}	{"[1, 2]":-3,"[1, 3]":0,"[1, 4]":4,"[1, 5]":-4,"[2, 3]":1,"[2, 4]":-3,"[2, 5]":2,"[3, 4]":2,"[3, 5]":-3,"[4, 5]":4,"[1, 2, 3]":-4,"[1, 2, 4]":1,"[1, 2, 5]":4,"[1, 3, 4]":0,"[1, 3, 5]":0,"[1, 4, 5]":4,"[2, 3, 4]":-2,"[2, 3, 5]":-2,"[2, 4, 5]":4,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:55.88364	2013-06-27 22:05:11.567091	4	t	f
1023	88	1020	51	2013-06-27 22:10:04.835	{"1":0,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-06-27 21:06:55.908733	2013-06-27 22:10:10.542587	5	f	f
1014	87	1002	148	2013-06-27 21:18:00.679	{"1":0,"2":2,"3":2,"4":2,"5":0}	{"[1, 2]":4,"[1, 3]":1,"[1, 4]":2,"[1, 5]":-4,"[2, 3]":1,"[2, 4]":1,"[2, 5]":-2,"[3, 4]":2,"[3, 5]":0,"[4, 5]":2,"[1, 2, 3]":1,"[1, 2, 4]":-1,"[1, 2, 5]":-4,"[1, 3, 4]":4,"[1, 3, 5]":-2,"[1, 4, 5]":4,"[2, 3, 4]":0,"[2, 3, 5]":-2,"[2, 4, 5]":1,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":-3,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":4,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:55.729239	2013-06-27 21:18:21.585457	7	f	f
1094	94	1097	300	2013-06-27 21:51:33.342	{"1":1,"2":1,"3":1}	{"[1, 2]":3,"[1, 3]":-3,"[2, 3]":-3,"[1, 2, 3]":-2}	2013-06-27 21:06:57.358565	2013-06-27 21:52:09.943827	2	t	f
1026	88	1015	15	2013-06-27 21:19:03.265	{"1":0,"2":0,"3":0,"4":1,"5":2}	{"[1, 2]":4,"[1, 3]":1,"[1, 4]":1,"[1, 5]":0,"[2, 3]":-3,"[2, 4]":3,"[2, 5]":-3,"[3, 4]":-3,"[3, 5]":-2,"[4, 5]":-3,"[1, 2, 3]":-1,"[1, 2, 4]":1,"[1, 2, 5]":2,"[1, 3, 4]":1,"[1, 3, 5]":-4,"[1, 4, 5]":3,"[2, 3, 4]":3,"[2, 3, 5]":-2,"[2, 4, 5]":3,"[3, 4, 5]":-3,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:55.933313	2013-06-27 21:19:09.136219	7	f	f
1019	88	1026	300	2013-06-27 21:24:18.597	{"1":0,"2":2,"3":0,"4":2}	{"[1, 2]":4,"[1, 3]":1,"[1, 4]":1,"[2, 3]":2,"[2, 4]":2,"[3, 4]":3,"[1, 2, 3]":-1,"[1, 2, 4]":4,"[1, 3, 4]":4,"[2, 3, 4]":3,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:55.875391	2013-06-27 21:24:24.26593	3	t	f
1018	88	1019	300	2013-06-27 21:29:33.342	{"1":0,"2":0,"3":0,"4":1}	{"[1, 2]":2,"[1, 3]":-3,"[1, 4]":3,"[2, 3]":-2,"[2, 4]":1,"[3, 4]":-3,"[1, 2, 3]":-2,"[1, 2, 4]":-4,"[1, 3, 4]":4,"[2, 3, 4]":3,"[1, 2, 3, 4]":-1}	2013-06-27 21:06:55.86789	2013-06-27 21:29:39.085819	3	t	f
1013	87	1012	102	2013-06-27 21:32:46.099	{"1":2,"2":1,"3":2,"4":1,"5":0}	{"[1, 2]":4,"[1, 3]":-3,"[1, 4]":3,"[1, 5]":3,"[2, 3]":-1,"[2, 4]":1,"[2, 5]":-1,"[3, 4]":0,"[3, 5]":0,"[4, 5]":1,"[1, 2, 3]":-1,"[1, 2, 4]":-4,"[1, 2, 5]":-3,"[1, 3, 4]":-3,"[1, 3, 5]":-4,"[1, 4, 5]":-2,"[2, 3, 4]":-4,"[2, 3, 5]":4,"[2, 4, 5]":4,"[3, 4, 5]":-2,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:55.720812	2013-06-27 21:33:07.159905	7	f	f
1024	88	1018	115	2013-06-27 21:34:49.699	{"1":1,"2":1,"3":0,"4":1}	{"[1, 2]":-2,"[1, 3]":-2,"[1, 4]":2,"[2, 3]":4,"[2, 4]":4,"[3, 4]":-4,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 3, 4]":2,"[2, 3, 4]":1,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:55.916602	2013-06-27 21:34:55.282662	6	f	f
1016	88	1024	300	2013-06-27 21:39:57.882	{"1":0,"2":1,"3":0}	{"[1, 2]":3,"[1, 3]":-1,"[2, 3]":3,"[1, 2, 3]":-4}	2013-06-27 21:06:55.852268	2013-06-27 21:40:03.614792	2	t	f
1017	88	1016	300	2013-06-27 21:45:05.074	{"1":2,"2":0,"3":1}	{"[1, 2]":4,"[1, 3]":-3,"[2, 3]":0,"[1, 2, 3]":-2}	2013-06-27 21:06:55.860135	2013-06-27 21:45:10.756393	2	t	f
1027	88	1017	165	2013-06-27 21:50:06.961	{"1":2,"2":1,"3":2,"4":2,"5":2}	{"[1, 2]":4,"[1, 3]":2,"[1, 4]":1,"[1, 5]":2,"[2, 3]":2,"[2, 4]":0,"[2, 5]":-3,"[3, 4]":-3,"[3, 5]":-2,"[4, 5]":4,"[1, 2, 3]":3,"[1, 2, 4]":0,"[1, 2, 5]":-4,"[1, 3, 4]":-3,"[1, 3, 5]":4,"[1, 4, 5]":3,"[2, 3, 4]":-1,"[2, 3, 5]":-1,"[2, 4, 5]":0,"[3, 4, 5]":2,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:55.941656	2013-06-27 21:50:12.791182	7	f	f
1041	90	\N	300	2013-06-27 21:11:48.398	{"1":2,"2":2,"3":0}	{"[1, 2]":-3,"[1, 3]":-3,"[2, 3]":3,"[1, 2, 3]":-4}	2013-06-27 21:06:56.388946	2013-06-27 21:12:00.649618	1	t	f
1052	90	1041	133	2013-06-27 21:18:10.106	{"1":1,"2":2,"3":2,"4":0,"5":0}	{"[1, 2]":0,"[1, 3]":-2,"[1, 4]":-1,"[1, 5]":-3,"[2, 3]":2,"[2, 4]":0,"[2, 5]":0,"[3, 4]":-4,"[3, 5]":2,"[4, 5]":-2,"[1, 2, 3]":-2,"[1, 2, 4]":-1,"[1, 2, 5]":2,"[1, 3, 4]":-4,"[1, 3, 5]":3,"[1, 4, 5]":1,"[2, 3, 4]":0,"[2, 3, 5]":-3,"[2, 4, 5]":1,"[3, 4, 5]":-2,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:56.486859	2013-06-27 21:18:22.427229	7	f	f
1044	90	1052	300	2013-06-27 21:23:30.965	{"1":2,"2":1,"3":2,"4":2}	{"[1, 2]":2,"[1, 3]":0,"[1, 4]":2,"[2, 3]":1,"[2, 4]":1,"[3, 4]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":1,"[1, 3, 4]":4,"[2, 3, 4]":-1,"[1, 2, 3, 4]":2}	2013-06-27 21:06:56.414496	2013-06-27 21:23:43.042917	3	t	f
1053	90	1044	22	2013-06-27 21:28:59.885	{"1":0,"2":0,"3":2,"4":1,"5":1}	{"[1, 2]":-3,"[1, 3]":1,"[1, 4]":2,"[1, 5]":4,"[2, 3]":-1,"[2, 4]":-3,"[2, 5]":-1,"[3, 4]":3,"[3, 5]":0,"[4, 5]":3,"[1, 2, 3]":1,"[1, 2, 4]":-2,"[1, 2, 5]":1,"[1, 3, 4]":-3,"[1, 3, 5]":-1,"[1, 4, 5]":3,"[2, 3, 4]":3,"[2, 3, 5]":2,"[2, 4, 5]":3,"[3, 4, 5]":-4,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:56.495201	2013-06-27 21:29:12.233957	7	f	f
1050	90	1053	60	2013-06-27 21:34:08.102	{"1":1,"2":0,"3":0,"4":0}	{"[1, 2]":0,"[1, 3]":-4,"[1, 4]":3,"[2, 3]":1,"[2, 4]":-1,"[3, 4]":-1,"[1, 2, 3]":3,"[1, 2, 4]":-4,"[1, 3, 4]":2,"[2, 3, 4]":0,"[1, 2, 3, 4]":2}	2013-06-27 21:06:56.468388	2013-06-27 21:34:20.519565	6	f	f
1042	90	1047	300	2013-06-27 21:44:24.779	{"1":0,"2":1,"3":1}	{"[1, 2]":4,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":1}	2013-06-27 21:06:56.398782	2013-06-27 21:44:37.236163	2	t	f
1043	90	1042	300	2013-06-27 21:49:22.639	{"1":1,"2":0,"3":1}	{"[1, 2]":3,"[1, 3]":-3,"[2, 3]":-2,"[1, 2, 3]":2}	2013-06-27 21:06:56.406008	2013-06-27 21:49:34.818035	2	t	f
1047	90	1050	300	2013-06-27 21:39:23.723	{"1":1,"2":1,"3":2,"4":2,"5":1}	{"[1, 2]":0,"[1, 3]":-2,"[1, 4]":-1,"[1, 5]":3,"[2, 3]":2,"[2, 4]":-2,"[2, 5]":4,"[3, 4]":-4,"[3, 5]":-4,"[4, 5]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-3,"[1, 2, 5]":-1,"[1, 3, 4]":2,"[1, 3, 5]":0,"[1, 4, 5]":-4,"[2, 3, 4]":-3,"[2, 3, 5]":2,"[2, 4, 5]":3,"[3, 4, 5]":2,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-1}	2013-06-27 21:06:56.44166	2013-06-27 21:39:36.002114	4	t	f
1051	90	1043	126	2013-06-27 21:54:24.064	{"1":2,"2":2,"3":2,"4":1}	{"[1, 2]":-4,"[1, 3]":1,"[1, 4]":3,"[2, 3]":2,"[2, 4]":1,"[3, 4]":-1,"[1, 2, 3]":3,"[1, 2, 4]":1,"[1, 3, 4]":4,"[2, 3, 4]":4,"[1, 2, 3, 4]":0}	2013-06-27 21:06:56.476951	2013-06-27 21:54:36.292408	6	f	f
1049	90	1051	99	2013-06-27 21:59:24.57	{"1":1,"2":1,"3":0}	{"[1, 2]":3,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":2}	2013-06-27 21:06:56.459872	2013-06-27 21:59:36.631407	5	f	f
1045	90	1049	300	2013-06-27 22:04:21.246	{"1":1,"2":0,"3":1,"4":2}	{"[1, 2]":-4,"[1, 3]":-2,"[1, 4]":2,"[2, 3]":-3,"[2, 4]":2,"[3, 4]":1,"[1, 2, 3]":3,"[1, 2, 4]":-4,"[1, 3, 4]":-4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":3}	2013-06-27 21:06:56.42316	2013-06-27 22:04:33.383029	3	t	f
1048	90	1045	45	2013-06-27 22:09:30.973	{"1":0,"2":1,"3":2}	{"[1, 2]":-2,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":0}	2013-06-27 21:06:56.451315	2013-06-27 22:09:43.002417	5	f	f
1046	90	1048	300	2013-06-27 22:14:33.617	{"1":2,"2":1,"3":1,"4":2,"5":1}	{"[1, 2]":4,"[1, 3]":-2,"[1, 4]":4,"[1, 5]":-1,"[2, 3]":2,"[2, 4]":-1,"[2, 5]":-1,"[3, 4]":1,"[3, 5]":-1,"[4, 5]":-2,"[1, 2, 3]":2,"[1, 2, 4]":-3,"[1, 2, 5]":0,"[1, 3, 4]":-3,"[1, 3, 5]":1,"[1, 4, 5]":1,"[2, 3, 4]":-1,"[2, 3, 5]":-2,"[2, 4, 5]":0,"[3, 4, 5]":2,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:56.432536	2013-06-27 22:14:45.970985	4	t	f
1085	93	1088	300	2013-06-27 21:57:50.279	{"1":1,"2":1,"3":1,"4":1,"5":2}	{"[1, 2]":-2,"[1, 3]":-2,"[1, 4]":2,"[1, 5]":-3,"[2, 3]":3,"[2, 4]":0,"[2, 5]":1,"[3, 4]":-4,"[3, 5]":4,"[4, 5]":1,"[1, 2, 3]":-4,"[1, 2, 4]":4,"[1, 2, 5]":-4,"[1, 3, 4]":0,"[1, 3, 5]":-2,"[1, 4, 5]":2,"[2, 3, 4]":-1,"[2, 3, 5]":-2,"[2, 4, 5]":-3,"[3, 4, 5]":-4,"[1, 2, 3, 4]":4,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":0,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":2}	2013-06-27 21:06:57.158038	2013-06-27 21:57:56.061071	4	t	f
1095	94	1103	300	2013-06-27 22:01:14.136	{"1":2,"2":0,"3":0}	{"[1, 2]":-3,"[1, 3]":-4,"[2, 3]":3,"[1, 2, 3]":-3}	2013-06-27 21:06:57.366918	2013-06-27 22:01:50.52967	2	t	f
1081	93	1085	300	2013-06-27 22:03:21.876	{"1":0,"2":1,"3":1}	{"[1, 2]":-3,"[1, 3]":1,"[2, 3]":2,"[1, 2, 3]":-3}	2013-06-27 21:06:57.126779	2013-06-27 22:03:27.472704	2	t	f
1080	93	\N	300	2013-06-27 21:12:27.039	{"1":0,"2":1,"3":0}	{"[1, 2]":-3,"[1, 3]":-1,"[2, 3]":1,"[1, 2, 3]":0}	2013-06-27 21:06:57.11533	2013-06-27 21:12:32.838461	1	t	f
1093	94	\N	300	2013-06-27 21:13:08.892	{"1":2,"2":0,"3":2}	{"[1, 2]":-2,"[1, 3]":-3,"[2, 3]":-4,"[1, 2, 3]":-3}	2013-06-27 21:06:57.344967	2013-06-27 21:13:45.541662	1	t	f
1087	93	1080	75	2013-06-27 21:18:43.589	{"1":0,"2":2,"3":0}	{"[1, 2]":-1,"[1, 3]":-4,"[2, 3]":2,"[1, 2, 3]":2}	2013-06-27 21:06:57.177696	2013-06-27 21:18:49.178964	5	f	f
1092	93	1087	51	2013-06-27 21:25:05.344	{"1":0,"2":2,"3":1,"4":0,"5":2}	{"[1, 2]":-1,"[1, 3]":-1,"[1, 4]":-3,"[1, 5]":-3,"[2, 3]":3,"[2, 4]":-4,"[2, 5]":0,"[3, 4]":4,"[3, 5]":4,"[4, 5]":2,"[1, 2, 3]":1,"[1, 2, 4]":0,"[1, 2, 5]":4,"[1, 3, 4]":0,"[1, 3, 5]":4,"[1, 4, 5]":-3,"[2, 3, 4]":-3,"[2, 3, 5]":0,"[2, 4, 5]":4,"[3, 4, 5]":4,"[1, 2, 3, 4]":-3,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:57.234528	2013-06-27 21:25:10.993275	7	f	f
1086	93	1092	300	2013-06-27 21:30:41.068	{"1":1,"2":2,"3":1,"4":2,"5":2}	{"[1, 2]":-1,"[1, 3]":4,"[1, 4]":1,"[1, 5]":-1,"[2, 3]":-3,"[2, 4]":-4,"[2, 5]":-3,"[3, 4]":4,"[3, 5]":-3,"[4, 5]":-1,"[1, 2, 3]":-3,"[1, 2, 4]":1,"[1, 2, 5]":4,"[1, 3, 4]":2,"[1, 3, 5]":-4,"[1, 4, 5]":-2,"[2, 3, 4]":4,"[2, 3, 5]":-1,"[2, 4, 5]":-4,"[3, 4, 5]":3,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:57.166281	2013-06-27 21:30:46.632496	4	t	f
1091	93	1086	133	2013-06-27 21:35:56.205	{"1":0,"2":1,"3":1,"4":1,"5":0}	{"[1, 2]":1,"[1, 3]":0,"[1, 4]":-2,"[1, 5]":0,"[2, 3]":1,"[2, 4]":-2,"[2, 5]":1,"[3, 4]":-2,"[3, 5]":4,"[4, 5]":0,"[1, 2, 3]":4,"[1, 2, 4]":3,"[1, 2, 5]":2,"[1, 3, 4]":3,"[1, 3, 5]":-3,"[1, 4, 5]":2,"[2, 3, 4]":0,"[2, 3, 5]":2,"[2, 4, 5]":-2,"[3, 4, 5]":-2,"[1, 2, 3, 4]":0,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-1,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:57.222492	2013-06-27 21:36:01.832865	7	f	f
1084	93	1091	300	2013-06-27 21:41:09.897	{"1":2,"2":2,"3":0,"4":0}	{"[1, 2]":-2,"[1, 3]":-1,"[1, 4]":2,"[2, 3]":-2,"[2, 4]":1,"[3, 4]":-4,"[1, 2, 3]":3,"[1, 2, 4]":1,"[1, 3, 4]":-3,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:57.149986	2013-06-27 21:41:15.749572	3	t	f
1089	93	1084	165	2013-06-27 21:46:48.861	{"1":1,"2":1,"3":2,"4":2}	{"[1, 2]":2,"[1, 3]":3,"[1, 4]":1,"[2, 3]":-4,"[2, 4]":3,"[3, 4]":-1,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 3, 4]":2,"[2, 3, 4]":-1,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:57.199108	2013-06-27 21:46:54.202561	6	f	f
1097	94	1104	300	2013-06-27 21:47:01.049	{"1":1,"2":2,"3":0,"4":2}	{"[1, 2]":1,"[1, 3]":2,"[1, 4]":-1,"[2, 3]":-1,"[2, 4]":-1,"[3, 4]":-4,"[1, 2, 3]":2,"[1, 2, 4]":-3,"[1, 3, 4]":-2,"[2, 3, 4]":3,"[1, 2, 3, 4]":3}	2013-06-27 21:06:57.387761	2013-06-27 21:47:37.555588	3	t	f
1083	93	1081	300	2013-06-27 22:08:27.551	{"1":2,"2":1,"3":1,"4":1}	{"[1, 2]":3,"[1, 3]":4,"[1, 4]":0,"[2, 3]":-4,"[2, 4]":0,"[3, 4]":0,"[1, 2, 3]":2,"[1, 2, 4]":-1,"[1, 3, 4]":0,"[2, 3, 4]":2,"[1, 2, 3, 4]":1}	2013-06-27 21:06:57.14212	2013-06-27 22:08:32.96082	3	t	f
1096	94	1100	300	2013-06-27 22:11:20.187	{"1":2,"2":1,"3":1,"4":2}	{"[1, 2]":4,"[1, 3]":-2,"[1, 4]":0,"[2, 3]":-2,"[2, 4]":-2,"[3, 4]":3,"[1, 2, 3]":0,"[1, 2, 4]":-1,"[1, 3, 4]":3,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:57.376399	2013-06-27 22:11:56.742854	3	t	f
1082	93	1083	300	2013-06-27 22:13:30.758	{"1":0,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":0,"[2, 3]":3,"[1, 2, 3]":-1}	2013-06-27 21:06:57.134541	2013-06-27 22:13:36.331101	2	t	f
1090	93	1082	143	2013-06-27 22:18:36.361	{"1":2,"2":2,"3":2,"4":2}	{"[1, 2]":-1,"[1, 3]":2,"[1, 4]":-1,"[2, 3]":-1,"[2, 4]":-2,"[3, 4]":4,"[1, 2, 3]":-2,"[1, 2, 4]":2,"[1, 3, 4]":4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":3}	2013-06-27 21:06:57.212398	2013-06-27 22:18:42.000659	6	f	f
1102	94	1099	188	2013-06-27 21:37:27.866	{"1":2,"2":1,"3":0,"4":0}	{"[1, 2]":4,"[1, 3]":0,"[1, 4]":0,"[2, 3]":0,"[2, 4]":1,"[3, 4]":-2,"[1, 2, 3]":4,"[1, 2, 4]":-4,"[1, 3, 4]":-2,"[2, 3, 4]":-3,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:57.438726	2013-06-27 21:38:04.223622	6	f	f
1113	95	1117	114	2013-06-27 21:41:17.778	{"1":1,"2":1,"3":1}	{"[1, 2]":-2,"[1, 3]":-2,"[2, 3]":-2,"[1, 2, 3]":-3}	2013-06-27 21:06:57.705586	2013-06-27 21:41:19.487034	5	f	f
1104	94	1102	88	2013-06-27 21:42:31.354	{"1":1,"2":0,"3":1,"4":2,"5":0}	{"[1, 2]":-1,"[1, 3]":3,"[1, 4]":4,"[1, 5]":-2,"[2, 3]":2,"[2, 4]":-4,"[2, 5]":1,"[3, 4]":4,"[3, 5]":3,"[4, 5]":-1,"[1, 2, 3]":2,"[1, 2, 4]":3,"[1, 2, 5]":0,"[1, 3, 4]":0,"[1, 3, 5]":-4,"[1, 4, 5]":1,"[2, 3, 4]":-2,"[2, 3, 5]":3,"[2, 4, 5]":-3,"[3, 4, 5]":1,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":0,"[1, 3, 4, 5]":3,"[2, 3, 4, 5]":0,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:57.504351	2013-06-27 21:43:07.869178	7	f	f
1114	95	1113	35	2013-06-27 21:46:35.889	{"1":0,"2":0,"3":2}	{"[1, 2]":2,"[1, 3]":1,"[2, 3]":1,"[1, 2, 3]":3}	2013-06-27 21:06:57.711757	2013-06-27 21:46:37.333006	5	f	f
1109	95	1115	300	2013-06-27 22:02:56.857	{"1":2,"2":2,"3":2,"4":1}	{"[1, 2]":1,"[1, 3]":-4,"[1, 4]":-2,"[2, 3]":-1,"[2, 4]":-1,"[3, 4]":3,"[1, 2, 3]":-2,"[1, 2, 4]":-4,"[1, 3, 4]":-1,"[2, 3, 4]":0,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:57.678098	2013-06-27 22:02:58.519604	3	t	f
1100	94	1095	40	2013-06-27 22:06:51.607	{"1":0,"2":1,"3":0}	{"[1, 2]":-1,"[1, 3]":4,"[2, 3]":-3,"[1, 2, 3]":-1}	2013-06-27 21:06:57.413941	2013-06-27 22:07:27.982727	5	f	f
1108	95	1109	300	2013-06-27 22:08:09.058	{"1":2,"2":0,"3":1}	{"[1, 2]":4,"[1, 3]":-4,"[2, 3]":-2,"[1, 2, 3]":2}	2013-06-27 21:06:57.671658	2013-06-27 22:08:10.606639	2	t	f
1110	95	1114	300	2013-06-27 21:51:59.396	{"1":0,"2":1,"3":0,"4":1}	{"[1, 2]":4,"[1, 3]":-2,"[1, 4]":2,"[2, 3]":-1,"[2, 4]":1,"[3, 4]":1,"[1, 2, 3]":1,"[1, 2, 4]":3,"[1, 3, 4]":2,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:57.685399	2013-06-27 21:52:00.874885	3	t	f
1107	95	1118	300	2013-06-27 22:18:24.649	{"1":2,"2":1,"3":0}	{"[1, 2]":1,"[1, 3]":1,"[2, 3]":3,"[1, 2, 3]":-3}	2013-06-27 21:06:57.664411	2013-06-27 22:18:26.172412	2	t	f
1111	95	1107	300	2013-06-27 22:23:30.206	{"1":0,"2":0,"3":0,"4":0,"5":1}	{"[1, 2]":-4,"[1, 3]":3,"[1, 4]":3,"[1, 5]":1,"[2, 3]":2,"[2, 4]":-3,"[2, 5]":0,"[3, 4]":1,"[3, 5]":2,"[4, 5]":3,"[1, 2, 3]":2,"[1, 2, 4]":2,"[1, 2, 5]":-4,"[1, 3, 4]":-3,"[1, 3, 5]":3,"[1, 4, 5]":-1,"[2, 3, 4]":3,"[2, 3, 5]":-4,"[2, 4, 5]":3,"[3, 4, 5]":4,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":-1,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":4}	2013-06-27 21:06:57.692449	2013-06-27 22:23:31.977965	4	t	f
1116	95	1111	124	2013-06-27 22:29:05.721	{"1":2,"2":1,"3":2,"4":2}	{"[1, 2]":4,"[1, 3]":4,"[1, 4]":-2,"[2, 3]":-3,"[2, 4]":-4,"[3, 4]":-4,"[1, 2, 3]":0,"[1, 2, 4]":-1,"[1, 3, 4]":1,"[2, 3, 4]":2,"[1, 2, 3, 4]":4}	2013-06-27 21:06:57.725501	2013-06-27 22:29:07.183862	6	f	f
1098	94	1093	300	2013-06-27 21:17:54.763	{"1":2,"2":2,"3":0,"4":1,"5":2}	{"[1, 2]":3,"[1, 3]":-4,"[1, 4]":-4,"[1, 5]":2,"[2, 3]":-4,"[2, 4]":-1,"[2, 5]":-1,"[3, 4]":-1,"[3, 5]":1,"[4, 5]":-3,"[1, 2, 3]":4,"[1, 2, 4]":3,"[1, 2, 5]":4,"[1, 3, 4]":3,"[1, 3, 5]":4,"[1, 4, 5]":-2,"[2, 3, 4]":4,"[2, 3, 5]":4,"[2, 4, 5]":4,"[3, 4, 5]":4,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":-1,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":-4,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-4}	2013-06-27 21:06:57.396238	2013-06-27 21:18:31.408917	4	t	f
1106	95	\N	300	2013-06-27 21:23:11.188	{"1":1,"2":2,"3":2}	{"[1, 2]":3,"[1, 3]":-2,"[2, 3]":2,"[1, 2, 3]":-4}	2013-06-27 21:06:57.654422	2013-06-27 21:23:12.785576	1	t	f
1105	94	1098	78	2013-06-27 21:22:53.15	{"1":2,"2":1,"3":1,"4":1,"5":0}	{"[1, 2]":2,"[1, 3]":2,"[1, 4]":-3,"[1, 5]":4,"[2, 3]":2,"[2, 4]":3,"[2, 5]":2,"[3, 4]":-4,"[3, 5]":-2,"[4, 5]":3,"[1, 2, 3]":-3,"[1, 2, 4]":-4,"[1, 2, 5]":-3,"[1, 3, 4]":2,"[1, 3, 5]":2,"[1, 4, 5]":3,"[2, 3, 4]":3,"[2, 3, 5]":4,"[2, 4, 5]":0,"[3, 4, 5]":-2,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":-2,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:57.51783	2013-06-27 21:23:30.383393	7	f	f
1101	94	1105	79	2013-06-27 21:27:52.822	{"1":2,"2":1,"3":1}	{"[1, 2]":-3,"[1, 3]":-1,"[2, 3]":-1,"[1, 2, 3]":2}	2013-06-27 21:06:57.424212	2013-06-27 21:28:29.157151	5	f	f
1112	95	1106	300	2013-06-27 21:29:39.852	{"1":0,"2":1,"3":1,"4":0,"5":0}	{"[1, 2]":4,"[1, 3]":4,"[1, 4]":-1,"[1, 5]":2,"[2, 3]":-1,"[2, 4]":-3,"[2, 5]":1,"[3, 4]":4,"[3, 5]":3,"[4, 5]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":-2,"[1, 2, 5]":1,"[1, 3, 4]":4,"[1, 3, 5]":1,"[1, 4, 5]":-3,"[2, 3, 4]":-3,"[2, 3, 5]":2,"[2, 4, 5]":-3,"[3, 4, 5]":1,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":4,"[1, 3, 4, 5]":2,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":-2}	2013-06-27 21:06:57.699131	2013-06-27 21:29:41.639263	4	t	f
1099	94	1101	300	2013-06-27 21:32:41.007	{"1":0,"2":1,"3":1,"4":0,"5":2}	{"[1, 2]":-3,"[1, 3]":0,"[1, 4]":2,"[1, 5]":1,"[2, 3]":-1,"[2, 4]":-3,"[2, 5]":-3,"[3, 4]":2,"[3, 5]":-4,"[4, 5]":2,"[1, 2, 3]":-3,"[1, 2, 4]":4,"[1, 2, 5]":-4,"[1, 3, 4]":1,"[1, 3, 5]":4,"[1, 4, 5]":-3,"[2, 3, 4]":-1,"[2, 3, 5]":3,"[2, 4, 5]":-2,"[3, 4, 5]":0,"[1, 2, 3, 4]":2,"[1, 2, 3, 5]":1,"[1, 2, 4, 5]":-4,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:57.404915	2013-06-27 21:33:17.521572	4	t	f
1103	94	1094	58	2013-06-27 21:56:30.482	{"1":2,"2":0,"3":1,"4":0}	{"[1, 2]":3,"[1, 3]":4,"[1, 4]":-1,"[2, 3]":-2,"[2, 4]":-1,"[3, 4]":-1,"[1, 2, 3]":2,"[1, 2, 4]":-4,"[1, 3, 4]":-2,"[2, 3, 4]":2,"[1, 2, 3, 4]":4}	2013-06-27 21:06:57.477759	2013-06-27 21:57:06.972943	6	f	f
1115	95	1110	94	2013-06-27 21:57:45.34	{"1":2,"2":2,"3":1,"4":2}	{"[1, 2]":4,"[1, 3]":-4,"[1, 4]":-4,"[2, 3]":-1,"[2, 4]":1,"[3, 4]":3,"[1, 2, 3]":0,"[1, 2, 4]":4,"[1, 3, 4]":-1,"[2, 3, 4]":3,"[1, 2, 3, 4]":0}	2013-06-27 21:06:57.718655	2013-06-27 21:57:46.969682	6	f	f
1127	96	1131	50	2013-06-27 21:54:18.371	{"1":0,"2":0,"3":2}	{"[1, 2]":1,"[1, 3]":4,"[2, 3]":-1,"[1, 2, 3]":-1}	2013-06-27 21:06:58.078945	2013-06-27 21:54:34.232535	5	f	f
1119	96	\N	300	2013-06-27 21:13:44.982	{"1":1,"2":0,"3":0}	{"[1, 2]":1,"[1, 3]":2,"[2, 3]":3,"[1, 2, 3]":1}	2013-06-27 21:06:58.018394	2013-06-27 21:14:01.27994	1	t	f
1123	96	1127	300	2013-06-27 21:59:09.469	{"1":1,"2":0,"3":1,"4":2}	{"[1, 2]":0,"[1, 3]":-1,"[1, 4]":-1,"[2, 3]":1,"[2, 4]":0,"[3, 4]":0,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 3, 4]":-2,"[2, 3, 4]":-2,"[1, 2, 3, 4]":-4}	2013-06-27 21:06:58.050484	2013-06-27 21:59:26.130835	3	t	f
1121	96	1123	300	2013-06-27 22:04:07.192	{"1":0,"2":2,"3":1}	{"[1, 2]":4,"[1, 3]":-4,"[2, 3]":1,"[1, 2, 3]":-1}	2013-06-27 21:06:58.036704	2013-06-27 22:04:22.934466	2	t	f
1124	96	1121	300	2013-06-27 22:09:12.369	{"1":0,"2":2,"3":2,"4":1,"5":1}	{"[1, 2]":4,"[1, 3]":0,"[1, 4]":4,"[1, 5]":0,"[2, 3]":-2,"[2, 4]":-4,"[2, 5]":3,"[3, 4]":-2,"[3, 5]":3,"[4, 5]":4,"[1, 2, 3]":0,"[1, 2, 4]":-2,"[1, 2, 5]":2,"[1, 3, 4]":-1,"[1, 3, 5]":-1,"[1, 4, 5]":-2,"[2, 3, 4]":-3,"[2, 3, 5]":3,"[2, 4, 5]":-1,"[3, 4, 5]":4,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":3,"[1, 2, 4, 5]":3,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:58.057133	2013-06-27 22:09:28.253752	4	t	f
1118	95	1108	62	2013-06-27 22:13:16.963	{"1":0,"2":1,"3":2,"4":0,"5":0}	{"[1, 2]":3,"[1, 3]":1,"[1, 4]":0,"[1, 5]":-4,"[2, 3]":-4,"[2, 4]":-4,"[2, 5]":2,"[3, 4]":0,"[3, 5]":-2,"[4, 5]":-2,"[1, 2, 3]":1,"[1, 2, 4]":0,"[1, 2, 5]":1,"[1, 3, 4]":4,"[1, 3, 5]":-1,"[1, 4, 5]":4,"[2, 3, 4]":-1,"[2, 3, 5]":1,"[2, 4, 5]":-3,"[3, 4, 5]":3,"[1, 2, 3, 4]":1,"[1, 2, 3, 5]":-4,"[1, 2, 4, 5]":-2,"[1, 3, 4, 5]":-2,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":0}	2013-06-27 21:06:57.739257	2013-06-27 22:13:18.686676	7	f	f
1129	96	1119	95	2013-06-27 21:19:24.37	{"1":0,"2":2,"3":0,"4":2}	{"[1, 2]":-4,"[1, 3]":0,"[1, 4]":4,"[2, 3]":-3,"[2, 4]":-2,"[3, 4]":2,"[1, 2, 3]":-4,"[1, 2, 4]":1,"[1, 3, 4]":-4,"[2, 3, 4]":-4,"[1, 2, 3, 4]":-2}	2013-06-27 21:06:58.098587	2013-06-27 21:19:40.229766	6	f	f
1128	96	1129	60	2013-06-27 21:24:32.011	{"1":2,"2":0,"3":1,"4":0}	{"[1, 2]":1,"[1, 3]":1,"[1, 4]":-1,"[2, 3]":-4,"[2, 4]":3,"[3, 4]":0,"[1, 2, 3]":4,"[1, 2, 4]":-2,"[1, 3, 4]":2,"[2, 3, 4]":0,"[1, 2, 3, 4]":1}	2013-06-27 21:06:58.087995	2013-06-27 21:24:47.750003	6	f	f
1122	96	1128	300	2013-06-27 21:29:38.204	{"1":1,"2":2,"3":2,"4":2}	{"[1, 2]":0,"[1, 3]":-4,"[1, 4]":2,"[2, 3]":-1,"[2, 4]":0,"[3, 4]":2,"[1, 2, 3]":0,"[1, 2, 4]":4,"[1, 3, 4]":-2,"[2, 3, 4]":4,"[1, 2, 3, 4]":-3}	2013-06-27 21:06:58.044206	2013-06-27 21:29:54.085098	3	t	f
1120	96	1122	300	2013-06-27 21:34:26.693	{"1":1,"2":2,"3":0}	{"[1, 2]":3,"[1, 3]":3,"[2, 3]":-4,"[1, 2, 3]":1}	2013-06-27 21:06:58.029034	2013-06-27 21:34:42.683386	2	t	f
1117	95	1112	165	2013-06-27 21:35:50.012	{"1":1,"2":0,"3":2,"4":1,"5":2}	{"[1, 2]":-1,"[1, 3]":1,"[1, 4]":4,"[1, 5]":1,"[2, 3]":4,"[2, 4]":-2,"[2, 5]":-1,"[3, 4]":-3,"[3, 5]":-4,"[4, 5]":1,"[1, 2, 3]":-2,"[1, 2, 4]":-3,"[1, 2, 5]":0,"[1, 3, 4]":4,"[1, 3, 5]":0,"[1, 4, 5]":1,"[2, 3, 4]":-4,"[2, 3, 5]":-2,"[2, 4, 5]":2,"[3, 4, 5]":-2,"[1, 2, 3, 4]":3,"[1, 2, 3, 5]":4,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":2,"[1, 2, 3, 4, 5]":3}	2013-06-27 21:06:57.732359	2013-06-27 21:35:52.210351	7	f	f
1125	96	1120	300	2013-06-27 21:39:44.79	{"1":0,"2":1,"3":1,"4":0,"5":1}	{"[1, 2]":-4,"[1, 3]":4,"[1, 4]":0,"[1, 5]":4,"[2, 3]":0,"[2, 4]":-2,"[2, 5]":4,"[3, 4]":0,"[3, 5]":-2,"[4, 5]":-1,"[1, 2, 3]":1,"[1, 2, 4]":-2,"[1, 2, 5]":-4,"[1, 3, 4]":4,"[1, 3, 5]":-2,"[1, 4, 5]":1,"[2, 3, 4]":-2,"[2, 3, 5]":3,"[2, 4, 5]":-4,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-4,"[1, 2, 3, 5]":0,"[1, 2, 4, 5]":-1,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":1,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:58.063903	2013-06-27 21:40:00.483114	4	t	f
1130	96	1125	144	2013-06-27 21:44:36.287	{"1":0,"2":2,"3":1,"4":2,"5":0}	{"[1, 2]":-3,"[1, 3]":3,"[1, 4]":0,"[1, 5]":-3,"[2, 3]":-1,"[2, 4]":4,"[2, 5]":4,"[3, 4]":-3,"[3, 5]":0,"[4, 5]":-2,"[1, 2, 3]":2,"[1, 2, 4]":-1,"[1, 2, 5]":2,"[1, 3, 4]":-2,"[1, 3, 5]":4,"[1, 4, 5]":3,"[2, 3, 4]":3,"[2, 3, 5]":-1,"[2, 4, 5]":-3,"[3, 4, 5]":-3,"[1, 2, 3, 4]":-2,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":-3,"[1, 3, 4, 5]":4,"[2, 3, 4, 5]":3,"[1, 2, 3, 4, 5]":-3}	2013-06-27 21:06:58.111106	2013-06-27 21:44:52.131442	7	f	f
1131	96	1130	34	2013-06-27 21:49:27.437	{"1":1,"2":1,"3":2,"4":2,"5":0}	{"[1, 2]":1,"[1, 3]":3,"[1, 4]":1,"[1, 5]":-1,"[2, 3]":-4,"[2, 4]":2,"[2, 5]":4,"[3, 4]":1,"[3, 5]":0,"[4, 5]":-4,"[1, 2, 3]":-2,"[1, 2, 4]":-1,"[1, 2, 5]":4,"[1, 3, 4]":2,"[1, 3, 5]":-3,"[1, 4, 5]":4,"[2, 3, 4]":4,"[2, 3, 5]":-1,"[2, 4, 5]":3,"[3, 4, 5]":0,"[1, 2, 3, 4]":-1,"[1, 2, 3, 5]":2,"[1, 2, 4, 5]":2,"[1, 3, 4, 5]":1,"[2, 3, 4, 5]":-3,"[1, 2, 3, 4, 5]":1}	2013-06-27 21:06:58.123982	2013-06-27 21:49:43.302262	7	f	f
1126	96	1124	158	2013-06-27 22:14:16.656	{"1":1,"2":0,"3":0}	{"[1, 2]":3,"[1, 3]":-1,"[2, 3]":-3,"[1, 2, 3]":0}	2013-06-27 21:06:58.07173	2013-06-27 22:14:32.414193	5	f	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: good
--

COPY schema_migrations (version) FROM stdin;
20121114042055
20121114043742
20121114044020
20121129014233
20121129014358
20121202234602
20121203001929
20121210225325
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: good
--

COPY users (id, lab_number, age, current_question_id, year, major, gender, created_at, updated_at, chosen_question_id) FROM stdin;
26	11	21	\N	2013	International Business/Marketing	Female	2013-06-27 21:06:23.37604	2013-06-27 22:17:03.928535	219
87	2	20	\N	2014	Chemistry	Female	2013-06-27 21:06:55.616519	2013-06-27 22:12:46.154499	1006
32	13	24	\N	2014	Scientific Computing	Female	2013-06-27 21:06:29.439583	2013-06-27 22:13:33.794049	294
84	17	22	\N	2013	Economics	Male	2013-06-27 21:06:54.78426	2013-06-27 22:14:19.673173	975
86	14	22	\N	2014	Finance and math 	Female	2013-06-27 21:06:55.329084	2013-06-27 22:17:36.887522	993
85	16	22	\N	2013	communications	female	2013-06-27 21:06:55.037586	2013-06-27 22:13:44.658294	980
82	4	22	\N	2013	Finance & Accounting	Female	2013-06-27 21:06:54.201524	2013-06-27 22:12:39.303445	946
22	3	19	\N				2013-04-11 19:08:09.334506	2013-04-11 20:05:52.264288	160
93	10	20	\N	2015	Psychology	Female	2013-06-27 21:06:57.107394	2013-06-27 22:19:53.78917	1090
20	5	19	\N	2016	East Asian Studies and French Studies	Male	2013-04-11 19:08:02.585746	2013-04-11 20:08:01.402457	141
21	2	19	\N	2015	Psychology	F	2013-04-11 19:08:04.868263	2013-04-11 20:08:06.657321	145
63	3	20	\N	2015	Economics	Female	2013-06-27 21:06:47.095515	2013-06-27 22:09:14.458086	701
90	18	22	\N	2013	metropolitan studies	female	2013-06-27 21:06:56.351341	2013-06-27 22:17:06.391208	1043
94	09	20	\N	2014	Finance	Male	2013-06-27 21:06:57.336552	2013-06-27 22:12:44.306024	1103
96	7	21	\N	2014	gallatin - art and business	F	2013-06-27 21:06:58.010301	2013-06-27 22:15:13.933392	1120
95	6	20	\N	2014	Economics	Male	2013-06-27 21:06:57.647077	2013-06-27 22:34:12.319482	1109
28	5	22	\N	2013	film	male	2013-06-27 21:06:25.548829	2013-06-27 22:10:29.544578	247
25	1	20	\N	2015	Russian	Female	2013-06-27 21:06:22.307225	2013-06-27 22:09:43.830337	206
83	12	20	\N	2015	Biology 	Female	2013-06-27 21:06:54.5301	2013-06-27 22:10:33.975117	953
51	22	20	\N	2014	neuroscience	f	2013-06-27 21:06:42.916774	2013-06-27 22:12:55.854825	537
79	19	22	\N	2013	Accounting	Female	2013-06-27 21:06:53.089683	2013-06-27 22:20:45.87759	908
66	20	20	\N	2014	mcc	female	2013-06-27 21:06:47.908009	2013-06-27 22:12:10.6402	733
88	21	22	\N	2014	Math and Econ	Female	2013-06-27 21:06:55.833156	2013-06-27 22:15:54.991364	1023
27	8	22	\N	2012	Social Work	female	2013-06-27 21:06:24.841543	2013-06-27 22:11:25.776022	231
41	15	21	\N	2014	Nursing	female	2013-06-27 21:06:37.476983	2013-06-27 22:15:56.901901	412
\.


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: good; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: instructions_pkey; Type: CONSTRAINT; Schema: public; Owner: good; Tablespace: 
--

ALTER TABLE ONLY instructions
    ADD CONSTRAINT instructions_pkey PRIMARY KEY (id);


--
-- Name: question_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: good; Tablespace: 
--

ALTER TABLE ONLY question_stats
    ADD CONSTRAINT question_stats_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: good; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: good; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE INDEX index_answers_on_question_id ON answers USING btree (question_id);


--
-- Name: index_instructions_on_number; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE UNIQUE INDEX index_instructions_on_number ON instructions USING btree (number);


--
-- Name: index_question_stats_on_question_id; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE INDEX index_question_stats_on_question_id ON question_stats USING btree (question_id);


--
-- Name: index_questions_on_instruction_id; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE INDEX index_questions_on_instruction_id ON questions USING btree (instruction_id);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE INDEX index_questions_on_user_id ON questions USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: good; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

