--
-- PostgreSQL database dump
--

\restrict aGBwfUNN4hySNuBu6HQugDpFQkF2RTfr3moz1tKHXSX4djzCaA0lyAR2NvtLq2u

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: netly_schema; Type: SCHEMA; Schema: -; Owner: netly_app_user
--

CREATE SCHEMA netly_schema;


ALTER SCHEMA netly_schema OWNER TO netly_app_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asset_snapshots; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.asset_snapshots (
    id bigint NOT NULL,
    portfolio_snapshot_id bigint NOT NULL,
    asset_id bigint,
    asset_name character varying(255) NOT NULL,
    asset_type_name character varying(100) NOT NULL,
    current_value numeric(15,2) NOT NULL,
    gain_loss numeric(15,2),
    currency character varying(10),
    value_in_inr numeric(15,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.asset_snapshots OWNER TO postgres;

--
-- Name: asset_snapshots_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.asset_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.asset_snapshots_id_seq OWNER TO postgres;

--
-- Name: asset_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.asset_snapshots_id_seq OWNED BY netly_schema.asset_snapshots.id;


--
-- Name: assets; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.assets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    custom_asset_type_id bigint,
    current_value numeric(15,2) NOT NULL,
    purchase_price numeric(15,2),
    purchase_date date,
    quantity numeric(10,2),
    description text,
    location character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    illiquid boolean DEFAULT false
);


ALTER TABLE netly_schema.assets OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.assets_id_seq OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.assets_id_seq OWNED BY netly_schema.assets.id;


--
-- Name: budget_items; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.budget_items (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    item_type character varying(20) NOT NULL,
    item_name character varying(255) NOT NULL,
    amount numeric(15,2) NOT NULL,
    is_investment boolean DEFAULT false NOT NULL,
    description text,
    display_order integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.budget_items OWNER TO postgres;

--
-- Name: budget_items_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.budget_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.budget_items_id_seq OWNER TO postgres;

--
-- Name: budget_items_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.budget_items_id_seq OWNED BY netly_schema.budget_items.id;


--
-- Name: custom_asset_types; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.custom_asset_types (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_name character varying(100) NOT NULL,
    display_name character varying(100) NOT NULL,
    description character varying(500),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.custom_asset_types OWNER TO postgres;

--
-- Name: custom_asset_types_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.custom_asset_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.custom_asset_types_id_seq OWNER TO postgres;

--
-- Name: custom_asset_types_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.custom_asset_types_id_seq OWNED BY netly_schema.custom_asset_types.id;


--
-- Name: custom_liability_types; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.custom_liability_types (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_name character varying(100) NOT NULL,
    display_name character varying(100) NOT NULL,
    description character varying(500),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.custom_liability_types OWNER TO postgres;

--
-- Name: custom_liability_types_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.custom_liability_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.custom_liability_types_id_seq OWNER TO postgres;

--
-- Name: custom_liability_types_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.custom_liability_types_id_seq OWNED BY netly_schema.custom_liability_types.id;


--
-- Name: liabilities; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.liabilities (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    custom_liability_type_id bigint,
    current_balance numeric(15,2) NOT NULL,
    original_amount numeric(15,2),
    start_date date,
    end_date date,
    interest_rate numeric(5,2),
    monthly_payment numeric(15,2),
    lender character varying(255),
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.liabilities OWNER TO postgres;

--
-- Name: liabilities_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.liabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.liabilities_id_seq OWNER TO postgres;

--
-- Name: liabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.liabilities_id_seq OWNED BY netly_schema.liabilities.id;


--
-- Name: liability_snapshots; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.liability_snapshots (
    id bigint NOT NULL,
    portfolio_snapshot_id bigint NOT NULL,
    liability_id bigint,
    liability_name character varying(255) NOT NULL,
    liability_type_name character varying(100) NOT NULL,
    current_balance numeric(15,2) NOT NULL,
    currency character varying(10),
    balance_in_inr numeric(15,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.liability_snapshots OWNER TO postgres;

--
-- Name: liability_snapshots_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.liability_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.liability_snapshots_id_seq OWNER TO postgres;

--
-- Name: liability_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.liability_snapshots_id_seq OWNED BY netly_schema.liability_snapshots.id;


--
-- Name: portfolio_snapshots; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.portfolio_snapshots (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    snapshot_date date NOT NULL,
    total_assets numeric(15,2) NOT NULL,
    total_liabilities numeric(15,2) NOT NULL,
    net_worth numeric(15,2) NOT NULL,
    total_gains numeric(15,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE netly_schema.portfolio_snapshots OWNER TO postgres;

--
-- Name: portfolio_snapshots_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.portfolio_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.portfolio_snapshots_id_seq OWNER TO postgres;

--
-- Name: portfolio_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.portfolio_snapshots_id_seq OWNED BY netly_schema.portfolio_snapshots.id;


--
-- Name: users; Type: TABLE; Schema: netly_schema; Owner: postgres
--

CREATE TABLE netly_schema.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    secondary_emails text
);


ALTER TABLE netly_schema.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: netly_schema; Owner: postgres
--

CREATE SEQUENCE netly_schema.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE netly_schema.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: netly_schema; Owner: postgres
--

ALTER SEQUENCE netly_schema.users_id_seq OWNED BY netly_schema.users.id;


--
-- Name: asset_snapshots id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.asset_snapshots ALTER COLUMN id SET DEFAULT nextval('netly_schema.asset_snapshots_id_seq'::regclass);


--
-- Name: assets id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.assets ALTER COLUMN id SET DEFAULT nextval('netly_schema.assets_id_seq'::regclass);


--
-- Name: budget_items id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.budget_items ALTER COLUMN id SET DEFAULT nextval('netly_schema.budget_items_id_seq'::regclass);


--
-- Name: custom_asset_types id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_asset_types ALTER COLUMN id SET DEFAULT nextval('netly_schema.custom_asset_types_id_seq'::regclass);


--
-- Name: custom_liability_types id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_liability_types ALTER COLUMN id SET DEFAULT nextval('netly_schema.custom_liability_types_id_seq'::regclass);


--
-- Name: liabilities id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liabilities ALTER COLUMN id SET DEFAULT nextval('netly_schema.liabilities_id_seq'::regclass);


--
-- Name: liability_snapshots id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liability_snapshots ALTER COLUMN id SET DEFAULT nextval('netly_schema.liability_snapshots_id_seq'::regclass);


--
-- Name: portfolio_snapshots id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.portfolio_snapshots ALTER COLUMN id SET DEFAULT nextval('netly_schema.portfolio_snapshots_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.users ALTER COLUMN id SET DEFAULT nextval('netly_schema.users_id_seq'::regclass);


--
-- Data for Name: asset_snapshots; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.asset_snapshots (id, portfolio_snapshot_id, asset_id, asset_name, asset_type_name, current_value, gain_loss, currency, value_in_inr, created_at) FROM stdin;
1	1	3	K Shire	Real Estate	11500000.00	1300000.00	INR	11500000.00	2025-12-29 12:00:00.043165
2	1	10	NPS	NPS	155000.00	53000.00	INR	155000.00	2025-12-29 12:00:00.045168
3	1	7	Prajakta Demat	Equity	1586264.00	105747.00	INR	1586264.00	2025-12-29 12:00:00.045946
4	1	6	Yogesh Demat	Equity	936970.00	56081.00	INR	936970.00	2025-12-29 12:00:00.046687
5	1	5	HUF Demat	Equity	685000.00	85000.00	INR	685000.00	2025-12-29 12:00:00.047453
6	1	4	EPF	EPFO	1041000.00	0.00	INR	1041000.00	2025-12-29 12:00:00.048306
7	1	1	Akamai RSU	Foreign Stocks	7427.00	321.44	USD	665459.20	2025-12-29 12:00:00.051802
8	1	11	Saving Accounts	Cash	100000.00	0.00	INR	100000.00	2025-12-29 12:00:00.052711
9	1	9	ESPP	ESPP	0.00	0.00	INR	0.00	2025-12-29 12:00:00.05344
10	1	12	PPF SBI	PPF	44000.00	0.00	INR	44000.00	2025-12-29 12:00:00.054103
11	1	8	Physical Gold	Gold	1000000.00	400000.00	INR	1000000.00	2025-12-29 12:00:00.055381
12	1	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	INR	9000000.00	2025-12-29 12:00:00.056172
13	3	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-01-05 12:00:00.092968
14	3	1	Akamai RSU	RSU	639700.00	-1388.00	\N	639700.00	2026-01-05 12:00:00.095117
15	3	6	Yogesh Demat	Equity	942205.00	61316.00	\N	942205.00	2026-01-05 12:00:00.096422
16	3	7	Prajakta Demat	Equity	1600748.00	111931.00	\N	1600748.00	2026-01-05 12:00:00.097587
17	3	5	HUF Demat	Equity	686000.00	86000.00	\N	686000.00	2026-01-05 12:00:00.098661
18	3	9	ESPP	ESPP	44700.00	0.00	\N	44700.00	2026-01-05 12:00:00.100279
19	3	3	K Shire	Real Estate	11000000.00	800000.00	\N	11000000.00	2026-01-05 12:00:00.101486
20	3	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-01-05 12:00:00.102508
21	3	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-01-05 12:00:00.103578
22	3	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-01-05 12:00:00.104518
23	3	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-01-05 12:00:00.105551
24	3	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-01-05 12:00:00.106501
25	5	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-01-12 12:00:00.275463
26	5	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-01-12 12:00:00.283725
27	5	1	Akamai RSU	RSU	639700.00	-1388.00	\N	639700.00	2026-01-12 12:00:00.284698
28	5	6	Yogesh Demat	Equity	942205.00	61316.00	\N	942205.00	2026-01-12 12:00:00.285827
29	5	7	Prajakta Demat	Equity	1600748.00	111931.00	\N	1600748.00	2026-01-12 12:00:00.286737
30	5	5	HUF Demat	Equity	686000.00	86000.00	\N	686000.00	2026-01-12 12:00:00.288063
31	5	9	ESPP	ESPP	44700.00	0.00	\N	44700.00	2026-01-12 12:00:00.289036
32	5	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-01-12 12:00:00.289926
33	5	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-01-12 12:00:00.290744
34	5	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-01-12 12:00:00.291544
35	5	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-01-12 12:00:00.292373
36	5	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-01-12 12:00:00.293159
37	7	1	Akamai RSU	RSU	700000.00	58912.00	\N	700000.00	2026-01-19 12:00:00.129017
38	7	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-01-19 12:00:00.135276
39	7	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-01-19 12:00:00.136331
40	7	6	Yogesh Demat	Equity	942205.00	61316.00	\N	942205.00	2026-01-19 12:00:00.137231
41	7	7	Prajakta Demat	Equity	1600748.00	111931.00	\N	1600748.00	2026-01-19 12:00:00.138154
42	7	5	HUF Demat	Equity	686000.00	86000.00	\N	686000.00	2026-01-19 12:00:00.139907
43	7	9	ESPP	ESPP	44700.00	0.00	\N	44700.00	2026-01-19 12:00:00.140896
44	7	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-01-19 12:00:00.141671
45	7	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-01-19 12:00:00.142446
46	7	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-01-19 12:00:00.143176
47	7	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-01-19 12:00:00.143933
48	7	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-01-19 12:00:00.14462
49	9	1	Akamai RSU	RSU	735000.00	93912.00	\N	735000.00	2026-01-26 12:00:00.329608
50	9	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-01-26 12:00:00.337607
51	9	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-01-26 12:00:00.339032
52	9	6	Yogesh Demat	Equity	942205.00	61316.00	\N	942205.00	2026-01-26 12:00:00.340548
53	9	7	Prajakta Demat	Equity	1600748.00	111931.00	\N	1600748.00	2026-01-26 12:00:00.341729
54	9	5	HUF Demat	Equity	686000.00	86000.00	\N	686000.00	2026-01-26 12:00:00.34348
55	9	9	ESPP	ESPP	44700.00	0.00	\N	44700.00	2026-01-26 12:00:00.344576
56	9	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-01-26 12:00:00.355062
57	9	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-01-26 12:00:00.356203
58	9	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-01-26 12:00:00.357216
59	9	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-01-26 12:00:00.358228
60	9	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-01-26 12:00:00.359181
61	11	9	ESPP	ESPP	89400.00	0.00	\N	89400.00	2026-02-02 12:00:00.732183
62	11	1	Akamai RSU	RSU	735000.00	93912.00	\N	735000.00	2026-02-02 12:00:00.740388
63	11	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-02-02 12:00:00.741613
64	11	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-02-02 12:00:00.74267
65	11	6	Yogesh Demat	Equity	942205.00	61316.00	\N	942205.00	2026-02-02 12:00:00.743666
66	11	7	Prajakta Demat	Equity	1600748.00	111931.00	\N	1600748.00	2026-02-02 12:00:00.745316
67	11	5	HUF Demat	Equity	686000.00	86000.00	\N	686000.00	2026-02-02 12:00:00.746642
68	11	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-02-02 12:00:00.747632
69	11	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-02-02 12:00:00.748573
70	11	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-02-02 12:00:00.749399
71	11	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-02-02 12:00:00.750311
72	11	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-02-02 12:00:00.751119
73	12	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-02-02 12:00:00.782304
74	12	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-02-02 12:00:00.783299
75	12	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-02-02 12:00:00.784138
76	14	1	Akamai RSU	RSU	359370.00	58314.00	\N	359370.00	2026-02-09 12:00:00.132786
77	14	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-02-09 12:00:00.139691
78	14	7	Prajakta Demat	Equity	1675275.00	103462.00	\N	1675275.00	2026-02-09 12:00:00.141232
79	14	6	Yogesh Demat	Equity	1340033.00	59086.00	\N	1340033.00	2026-02-09 12:00:00.142257
80	14	9	ESPP	ESPP	89400.00	0.00	\N	89400.00	2026-02-09 12:00:00.14315
81	14	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-02-09 12:00:00.144684
82	14	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-02-09 12:00:00.146
83	14	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-02-09 12:00:00.146824
84	14	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-02-09 12:00:00.147574
85	14	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-02-09 12:00:00.148336
86	14	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-02-09 12:00:00.149103
87	14	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-02-09 12:00:00.150051
88	15	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-02-09 12:00:00.178157
89	15	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-02-09 12:00:00.179221
90	15	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-02-09 12:00:00.179944
91	17	1	Akamai RSU	RSU	492800.00	141568.00	\N	492800.00	2026-02-16 12:00:00.362459
92	17	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-02-16 12:00:00.369176
93	17	7	Prajakta Demat	Equity	1675275.00	103462.00	\N	1675275.00	2026-02-16 12:00:00.37026
94	17	6	Yogesh Demat	Equity	1340033.00	59086.00	\N	1340033.00	2026-02-16 12:00:00.371352
95	17	9	ESPP	ESPP	89400.00	0.00	\N	89400.00	2026-02-16 12:00:00.372272
96	17	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-02-16 12:00:00.374276
97	17	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-02-16 12:00:00.375258
98	17	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-02-16 12:00:00.376075
99	17	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-02-16 12:00:00.376815
100	17	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-02-16 12:00:00.377518
101	17	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-02-16 12:00:00.378225
102	17	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-02-16 12:00:00.378987
103	18	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-02-16 12:00:00.407555
104	18	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-02-16 12:00:00.408708
105	18	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-02-16 12:00:00.409423
106	20	1	Akamai RSU	RSU	492800.00	141568.00	\N	492800.00	2026-02-23 12:00:00.305751
107	20	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-02-23 12:00:00.314417
108	20	7	Prajakta Demat	Equity	1675275.00	103462.00	\N	1675275.00	2026-02-23 12:00:00.316007
109	20	6	Yogesh Demat	Equity	1340033.00	59086.00	\N	1340033.00	2026-02-23 12:00:00.317171
110	20	9	ESPP	ESPP	89400.00	0.00	\N	89400.00	2026-02-23 12:00:00.318255
111	20	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-02-23 12:00:00.320446
112	20	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-02-23 12:00:00.322009
113	20	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-02-23 12:00:00.32307
114	20	4	EPF	EPFO	1041000.00	0.00	\N	1041000.00	2026-02-23 12:00:00.32409
115	20	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-02-23 12:00:00.325088
116	20	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-02-23 12:00:00.326104
117	20	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-02-23 12:00:00.327055
118	21	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-02-23 12:00:00.366382
119	21	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-02-23 12:00:00.367625
120	21	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-02-23 12:00:00.385047
121	23	4	EPF	EPFO	1100000.00	0.00	\N	1100000.00	2026-03-02 12:00:00.150018
122	23	6	Yogesh Demat	Equity	1343612.00	62724.00	\N	1343612.00	2026-03-02 12:00:00.161679
123	23	7	Prajakta Demat	Equity	1749200.00	102700.00	\N	1749200.00	2026-03-02 12:00:00.164732
124	23	1	Akamai RSU	RSU	440550.00	89318.00	\N	440550.00	2026-03-02 12:00:00.166536
125	23	9	ESPP	ESPP	133412.00	44012.00	\N	133412.00	2026-03-02 12:00:00.167573
126	23	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-03-02 12:00:00.170361
127	23	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-03-02 12:00:00.172095
128	23	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-03-02 12:00:00.173073
129	23	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-03-02 12:00:00.17396
130	23	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-03-02 12:00:00.174732
131	23	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-03-02 12:00:00.175438
132	23	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-03-02 12:00:00.176396
133	24	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-03-02 12:00:00.221635
134	24	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-03-02 12:00:00.223488
135	24	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-03-02 12:00:00.224222
136	26	4	EPF	EPFO	1100000.00	0.00	\N	1100000.00	2026-03-09 12:00:00.772585
137	26	6	Yogesh Demat	Equity	1343612.00	62724.00	\N	1343612.00	2026-03-09 12:00:00.788392
138	26	7	Prajakta Demat	Equity	1749200.00	102700.00	\N	1749200.00	2026-03-09 12:00:00.790257
139	26	1	Akamai RSU	RSU	440550.00	89318.00	\N	440550.00	2026-03-09 12:00:00.791544
140	26	9	ESPP	ESPP	133412.00	44012.00	\N	133412.00	2026-03-09 12:00:00.793262
141	26	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-03-09 12:00:00.795516
142	26	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-03-09 12:00:00.797249
143	26	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-03-09 12:00:00.799392
144	26	10	NPS	NPS	155000.00	53000.00	\N	155000.00	2026-03-09 12:00:00.80066
145	26	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-03-09 12:00:00.801583
146	26	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-03-09 12:00:00.802453
147	26	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-03-09 12:00:00.803411
148	27	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-03-09 12:00:00.848773
149	27	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-03-09 12:00:00.850546
150	27	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-03-09 12:00:00.851687
151	29	10	NPS	NPS	150000.00	43000.00	\N	150000.00	2026-03-16 12:00:00.098863
152	29	9	ESPP	ESPP	133412.00	0.00	\N	133412.00	2026-03-16 12:00:00.1069
153	29	7	Prajakta Demat	Equity	1731366.00	46836.00	\N	1731366.00	2026-03-16 12:00:00.108323
154	29	6	Yogesh Demat	Equity	1313612.00	32724.00	\N	1313612.00	2026-03-16 12:00:00.109279
155	29	1	Akamai RSU	RSU	1003000.00	127424.00	\N	1003000.00	2026-03-16 12:00:00.114361
156	29	4	EPF	EPFO	1100000.00	0.00	\N	1100000.00	2026-03-16 12:00:00.116298
157	29	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-03-16 12:00:00.117315
158	29	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-03-16 12:00:00.118635
159	29	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-03-16 12:00:00.119892
160	29	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-03-16 12:00:00.121377
161	29	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-03-16 12:00:00.122421
162	29	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-03-16 12:00:00.123219
163	30	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-03-16 12:00:00.154843
164	30	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-03-16 12:00:00.155816
165	30	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-03-16 12:00:00.156481
166	32	10	NPS	NPS	150000.00	43000.00	\N	150000.00	2026-03-23 12:00:01.158216
167	32	9	ESPP	ESPP	133412.00	0.00	\N	133412.00	2026-03-23 12:00:01.164889
168	32	7	Prajakta Demat	Equity	1731366.00	46836.00	\N	1731366.00	2026-03-23 12:00:01.166
169	32	6	Yogesh Demat	Equity	1313612.00	32724.00	\N	1313612.00	2026-03-23 12:00:01.166815
170	32	1	Akamai RSU	RSU	1003000.00	127424.00	\N	1003000.00	2026-03-23 12:00:01.167596
171	32	4	EPF	EPFO	1100000.00	0.00	\N	1100000.00	2026-03-23 12:00:01.168936
172	32	5	HUF Demat	Equity	692600.00	92600.00	\N	692600.00	2026-03-23 12:00:01.169899
173	32	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-03-23 12:00:01.170695
174	32	11	Saving Accounts	Cash	90000.00	0.00	\N	90000.00	2026-03-23 12:00:01.171468
175	32	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-03-23 12:00:01.172355
176	32	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-03-23 12:00:01.17331
177	32	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-03-23 12:00:01.174096
178	33	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-03-23 12:00:01.204985
179	33	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-03-23 12:00:01.207753
180	33	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-03-23 12:00:01.208686
181	35	11	Saving Accounts	Cash	30000.00	0.00	\N	30000.00	2026-03-30 12:00:03.763954
182	35	4	EPF	EPFO	1101800.00	0.00	\N	1101800.00	2026-03-30 12:00:03.854068
183	35	5	HUF Demat	Equity	650200.00	50200.00	\N	650200.00	2026-03-30 12:00:03.856991
184	35	10	NPS	NPS	152429.00	39429.00	\N	152429.00	2026-03-30 12:00:03.859653
185	35	1	Akamai RSU	RSU	604796.00	87044.00	\N	604796.00	2026-03-30 12:00:03.861824
186	35	9	ESPP	ESPP	175883.00	0.00	\N	175883.00	2026-03-30 12:00:03.864374
187	35	7	Prajakta Demat	Equity	1772799.00	-1204.00	\N	1772799.00	2026-03-30 12:00:03.865645
188	35	6	Yogesh Demat	Equity	1773467.00	-7509.00	\N	1773467.00	2026-03-30 12:00:03.866597
189	35	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-03-30 12:00:03.867454
190	35	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-03-30 12:00:03.868314
191	35	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-03-30 12:00:03.869163
192	35	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-03-30 12:00:03.870055
193	36	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-03-30 12:00:04.161454
194	36	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-03-30 12:00:04.163451
195	36	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-03-30 12:00:04.165028
196	38	11	Saving Accounts	Cash	30000.00	0.00	\N	30000.00	2026-04-06 12:00:01.908001
197	38	4	EPF	EPFO	1101800.00	0.00	\N	1101800.00	2026-04-06 12:00:01.99932
198	38	5	HUF Demat	Equity	650200.00	50200.00	\N	650200.00	2026-04-06 12:00:02.004704
199	38	10	NPS	NPS	152429.00	39429.00	\N	152429.00	2026-04-06 12:00:02.007243
200	38	1	Akamai RSU	RSU	604796.00	87044.00	\N	604796.00	2026-04-06 12:00:02.009904
201	38	9	ESPP	ESPP	175883.00	0.00	\N	175883.00	2026-04-06 12:00:02.015642
202	38	7	Prajakta Demat	Equity	1772799.00	-1204.00	\N	1772799.00	2026-04-06 12:00:02.018394
203	38	6	Yogesh Demat	Equity	1773467.00	-7509.00	\N	1773467.00	2026-04-06 12:00:02.021559
204	38	3	K Shire	Real Estate	11500000.00	1300000.00	\N	11500000.00	2026-04-06 12:00:02.023771
205	38	12	PPF SBI	PPF	44000.00	0.00	\N	44000.00	2026-04-06 12:00:02.025455
206	38	8	Physical Gold	Gold	1000000.00	400000.00	\N	1000000.00	2026-04-06 12:00:02.100724
207	38	2	Sukhwani Sepia	Real Estate	9000000.00	2800000.00	\N	9000000.00	2026-04-06 12:00:02.102741
208	39	15	Bella Rosa	Real Estate	7500000.00	1800000.00	\N	7500000.00	2026-04-06 12:00:02.316885
209	39	14	ELSS	Equity	400000.00	0.00	\N	400000.00	2026-04-06 12:00:02.318589
210	39	13	Mayuri Regency	Real Estate	9000000.00	4000000.00	\N	9000000.00	2026-04-06 12:00:02.320794
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.assets (id, user_id, name, custom_asset_type_id, current_value, purchase_price, purchase_date, quantity, description, location, created_at, updated_at, illiquid) FROM stdin;
2	1	Sukhwani Sepia	1	9000000.00	6200000.00	2018-01-08	1.00	\N	Tathawade Pune	2025-11-11 09:28:52.866346	2025-11-12 10:13:06.05828	t
8	1	Physical Gold	9	1000000.00	600000.00	2018-01-01	1.00	\N	\N	2025-11-11 09:43:22.483327	2025-11-12 10:13:27.017525	t
12	1	PPF SBI	4	44000.00	44000.00	\N	1.00	Bank: SBI\nAccount No.: 34329724791	\N	2025-11-12 10:21:21.04399	2025-11-13 16:33:23.422296	t
3	1	K Shire	1	11500000.00	10200000.00	2024-01-04	1.00	\N	Punawale Pune	2025-11-11 09:29:33.383725	2026-01-10 08:32:09.1148	t
13	3	Mayuri Regency	29	9000000.00	5000000.00	2017-10-27	1.00	\N	Wakad Pune	2026-01-27 14:42:34.653452	2026-01-27 14:42:34.653478	\N
14	3	ELSS	28	400000.00	400000.00	\N	1.00	\N	\N	2026-01-27 14:43:15.363592	2026-01-27 14:43:15.36362	\N
15	3	Bella Rosa	29	7500000.00	5700000.00	2022-01-27	1.00	\N	Punawale Pune	2026-01-27 14:45:24.770342	2026-01-27 14:45:24.770358	\N
6	1	Yogesh Demat	2	1773467.00	1780976.00	\N	1.00	Broker: Zerodha\nAccount ID: HPC546		2025-11-11 09:37:47.052402	2026-03-26 02:51:48.537075	f
7	1	Prajakta Demat	2	1772799.00	1774003.00	\N	1.00	Broker: Zerodha\nAccount ID: GCM446		2025-11-11 09:41:53.742809	2026-03-26 02:52:13.142131	f
9	1	ESPP	12	175883.00	175883.00	\N	1.00	\N	\N	2025-11-11 09:45:38.943349	2026-03-26 02:54:33.905205	f
1	1	Akamai RSU	10	604796.00	9588.00	\N	54.00	Broker: Charles Schwab\nUsername: yogsonawane28		2025-11-11 09:27:19.822262	2026-03-26 02:56:05.103593	f
10	1	NPS	13	152429.00	113000.00	2021-01-02	1.00	PRAN: 110156723241	\N	2025-11-11 09:47:59.403435	2026-03-26 02:59:43.291916	t
5	1	HUF Demat	2	650200.00	600000.00	\N	1.00	Broker: Zerodha\nAccount ID: TLY206		2025-11-11 09:35:38.88947	2026-03-26 03:01:40.963806	f
4	1	EPF	11	1101800.00	1101800.00	\N	1.00	UAN: 100416096220	\N	2025-11-11 09:34:29.627396	2026-03-26 03:03:40.048318	t
11	1	Saving Accounts	7	30000.00	30000.00	\N	1.00	\N	\N	2025-11-11 09:54:42.501036	2026-03-26 03:04:25.996366	f
\.


--
-- Data for Name: budget_items; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.budget_items (id, user_id, item_type, item_name, amount, is_investment, description, display_order, created_at, updated_at) FROM stdin;
2	1	INCOME	Rent	31000.00	f	Sukhwani Sepia Pune	\N	2025-12-29 11:18:03.790639	2025-12-29 11:18:03.790653
5	1	EXPENSE	Parent Support	10000.00	f		\N	2025-12-29 11:19:19.985782	2025-12-29 11:19:19.985792
6	1	EXPENSE	EPF	29900.00	t	Akamai EPF	\N	2025-12-29 11:19:29.668501	2025-12-29 11:19:35.919882
7	1	INCOME	Trading Income	1000.00	f	TLY206	\N	2025-12-29 11:20:01.480204	2025-12-29 11:20:01.480219
8	1	EXPENSE	Rent	7000.00	f	Yeola	\N	2025-12-29 11:22:11.180535	2025-12-29 11:22:11.180547
9	1	EXPENSE	ESPP	44700.00	t	Akamai	\N	2025-12-29 11:22:38.611043	2025-12-29 11:22:38.611055
15	1	EXPENSE	Recurring Expenses	10000.00	f	Property Tax, Health Insurance, Term Insurance, Flat Maintenance, Car Insurance & Maintenance 	\N	2025-12-29 11:28:54.768318	2025-12-29 11:29:18.126075
16	1	EXPENSE	Unforeseen Expenses	10000.00	f		\N	2025-12-29 11:29:59.480887	2025-12-29 11:29:59.4809
11	1	EXPENSE	SIP - Rent Investment	31000.00	t	GCM446	\N	2025-12-29 11:23:34.561355	2025-12-29 11:35:57.705611
3	1	EXPENSE	Home Loan EMI	47000.00	f	K Shire Pune	\N	2025-12-29 11:18:24.103001	2026-01-30 10:47:32.259409
1	1	INCOME	Salary	255000.00	f	Akamai	\N	2025-12-29 11:17:28.897989	2026-01-30 13:49:10.362311
10	1	EXPENSE	SIP - Retirement	60000.00	t	GCM446	\N	2025-12-29 11:23:17.026788	2026-02-28 09:30:40.148532
14	1	EXPENSE	Daily Expenses	35000.00	f	Day to day life expense	\N	2025-12-29 11:27:42.365533	2026-02-28 09:31:13.451777
\.


--
-- Data for Name: custom_asset_types; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.custom_asset_types (id, user_id, type_name, display_name, description, is_active, created_at, updated_at) FROM stdin;
1	1	REAL_ESTATE	Real Estate	Default Real Estate type	t	2025-11-11 09:24:23.056201	2025-11-11 09:24:23.056219
2	1	EQUITY	Equity	Default Equity type	t	2025-11-11 09:24:23.060632	2025-11-11 09:24:23.060648
3	1	OTHER	Other	Default Other type	t	2025-11-11 09:24:23.063433	2025-11-11 09:24:23.063444
6	1	CRYPTOCURRENCY	Cryptocurrency	Default Cryptocurrency type	t	2025-11-11 09:24:23.071395	2025-11-11 09:24:23.071405
7	1	CASH	Cash	Default Cash type	t	2025-11-11 09:24:23.074125	2025-11-11 09:24:23.074137
9	1	GOLD	Gold	Default Gold type	t	2025-11-11 09:24:23.080482	2025-11-11 09:24:23.08049
11	1	EPFO	EPFO	EPFO	t	2025-11-11 09:34:09.491474	2025-11-11 09:34:09.491512
12	1	ESPP	ESPP	Employee Stock Purchase Plan	t	2025-11-11 09:46:35.804342	2025-11-11 09:46:35.804359
13	1	NPS	NPS	National Pention Scheme	t	2025-11-11 09:47:37.1311	2025-11-11 09:47:37.131124
4	1	MUTUAL_FUND	PPF	PPF	t	2025-11-11 09:24:23.065995	2025-11-12 10:20:55.542414
10	1	FOREIGN_STOCKS	RSU	RSU	t	2025-11-11 09:26:48.714394	2025-12-29 14:47:30.932763
14	2	GOLD	Gold	Default Gold type	t	2025-12-30 02:34:03.434643	2025-12-30 02:34:03.434657
15	2	CRYPTOCURRENCY	Cryptocurrency	Default Cryptocurrency type	t	2025-12-30 02:34:03.437527	2025-12-30 02:34:03.437536
16	2	DEBT	Debt	Default Debt type	t	2025-12-30 02:34:03.439367	2025-12-30 02:34:03.439375
17	2	CASH	Cash	Default Cash type	t	2025-12-30 02:34:03.441173	2025-12-30 02:34:03.441181
18	2	OTHER	Other	Default Other type	t	2025-12-30 02:34:03.443018	2025-12-30 02:34:03.443025
19	2	BONDS	Bonds	Default Bonds type	t	2025-12-30 02:34:03.445584	2025-12-30 02:34:03.445592
20	2	MUTUAL_FUND	Mutual Fund	Default Mutual Fund type	t	2025-12-30 02:34:03.447555	2025-12-30 02:34:03.447562
21	2	REAL_ESTATE	Real Estate	Default Real Estate type	t	2025-12-30 02:34:03.449339	2025-12-30 02:34:03.449346
22	2	EQUITY	Equity	Default Equity type	t	2025-12-30 02:34:03.451104	2025-12-30 02:34:03.451113
23	2	RSU	RSU	Employer RSU	t	2025-12-31 09:10:48.247565	2025-12-31 09:10:48.247604
24	3	GOLD	Gold	Default Gold type	t	2026-01-27 14:41:20.505285	2026-01-27 14:41:20.505301
25	3	BONDS	Bonds	Default Bonds type	t	2026-01-27 14:41:20.510114	2026-01-27 14:41:20.510129
26	3	CRYPTOCURRENCY	Cryptocurrency	Default Cryptocurrency type	t	2026-01-27 14:41:20.511746	2026-01-27 14:41:20.511756
27	3	CASH	Cash	Default Cash type	t	2026-01-27 14:41:20.513307	2026-01-27 14:41:20.513315
28	3	EQUITY	Equity	Default Equity type	t	2026-01-27 14:41:20.514687	2026-01-27 14:41:20.514695
29	3	REAL_ESTATE	Real Estate	Default Real Estate type	t	2026-01-27 14:41:20.516174	2026-01-27 14:41:20.516181
30	3	DEBT	Debt	Default Debt type	t	2026-01-27 14:41:20.517752	2026-01-27 14:41:20.517761
31	3	MUTUAL_FUND	Mutual Fund	Default Mutual Fund type	t	2026-01-27 14:41:20.519242	2026-01-27 14:41:20.51925
32	3	OTHER	Other	Default Other type	t	2026-01-27 14:41:20.520718	2026-01-27 14:41:20.520726
\.


--
-- Data for Name: custom_liability_types; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.custom_liability_types (id, user_id, type_name, display_name, description, is_active, created_at, updated_at) FROM stdin;
1	1	OTHER	Other	Default Other type	t	2025-11-11 09:24:43.458496	2025-11-11 09:24:43.458512
2	1	BUSINESS_LOAN	Business Loan	Default Business Loan type	t	2025-11-11 09:24:43.462659	2025-11-11 09:24:43.462674
3	1	CREDIT_CARD	Credit Card	Default Credit Card type	t	2025-11-11 09:24:43.465396	2025-11-11 09:24:43.465404
4	1	EDUCATION_LOAN	Education Loan	Default Education Loan type	t	2025-11-11 09:24:43.467956	2025-11-11 09:24:43.467963
5	1	CAR_LOAN	Car Loan	Default Car Loan type	t	2025-11-11 09:24:43.470625	2025-11-11 09:24:43.470644
6	1	HOME_LOAN	Home Loan	Default Home Loan type	t	2025-11-11 09:24:43.473459	2025-11-11 09:24:43.473469
7	1	PERSONAL_LOAN	Personal Loan	Default Personal Loan type	t	2025-11-11 09:24:43.476122	2025-11-11 09:24:43.476139
8	2	EDUCATION_LOAN	Education Loan	Default Education Loan type	t	2025-12-30 02:34:07.964538	2025-12-30 02:34:07.964555
9	2	OTHER	Other	Default Other type	t	2025-12-30 02:34:07.969473	2025-12-30 02:34:07.969495
10	2	BUSINESS_LOAN	Business Loan	Default Business Loan type	t	2025-12-30 02:34:07.97376	2025-12-30 02:34:07.973773
11	2	PERSONAL_LOAN	Personal Loan	Default Personal Loan type	t	2025-12-30 02:34:07.975989	2025-12-30 02:34:07.975999
12	2	CAR_LOAN	Car Loan	Default Car Loan type	t	2025-12-30 02:34:07.977833	2025-12-30 02:34:07.977844
13	2	CREDIT_CARD	Credit Card	Default Credit Card type	t	2025-12-30 02:34:07.979851	2025-12-30 02:34:07.979859
14	2	HOME_LOAN	Home Loan	Default Home Loan type	t	2025-12-30 02:34:07.981746	2025-12-30 02:34:07.981755
15	3	HOME_LOAN	Home Loan	Default Home Loan type	t	2026-01-27 14:43:54.128298	2026-01-27 14:43:54.128322
16	3	EDUCATION_LOAN	Education Loan	Default Education Loan type	t	2026-01-27 14:43:54.133335	2026-01-27 14:43:54.133353
17	3	CAR_LOAN	Car Loan	Default Car Loan type	t	2026-01-27 14:43:54.13544	2026-01-27 14:43:54.135453
18	3	PERSONAL_LOAN	Personal Loan	Default Personal Loan type	t	2026-01-27 14:43:54.137813	2026-01-27 14:43:54.137823
19	3	BUSINESS_LOAN	Business Loan	Default Business Loan type	t	2026-01-27 14:43:54.139742	2026-01-27 14:43:54.139753
20	3	OTHER	Other	Default Other type	t	2026-01-27 14:43:54.141549	2026-01-27 14:43:54.141558
21	3	CREDIT_CARD	Credit Card	Default Credit Card type	t	2026-01-27 14:43:54.143339	2026-01-27 14:43:54.143351
\.


--
-- Data for Name: liabilities; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.liabilities (id, user_id, name, custom_liability_type_id, current_balance, original_amount, start_date, end_date, interest_rate, monthly_payment, lender, description, created_at, updated_at) FROM stdin;
3	1	Sukhwani Sepia Home Loan	6	0.00	2950000.00	2021-02-25	2025-03-04	6.50	30000.00	SBI	\N	2025-11-12 10:38:21.930188	2025-11-12 12:26:00.019951
2	1	Nexon Car Loan	5	0.00	700000.00	2022-08-31	\N	8.50	22000.00	SBI	\N	2025-11-12 10:37:15.263524	2025-11-13 16:34:46.219992
4	3	Bella Rosa Home Loan	15	2500000.00	3500000.00	\N	\N	7.20	28500.00	SBI	\N	2026-01-27 14:44:35.253541	2026-01-27 14:44:35.253558
1	1	K Shire Home Loan	6	3741900.00	5500000.00	2024-04-01	\N	7.40	46900.00	SBI	\N	2025-11-11 09:28:20.315329	2026-03-15 03:40:38.437751
\.


--
-- Data for Name: liability_snapshots; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.liability_snapshots (id, portfolio_snapshot_id, liability_id, liability_name, liability_type_name, current_balance, currency, balance_in_inr, created_at) FROM stdin;
1	1	1	K Shire Home Loan	Home Loan	3809448.00	INR	3809448.00	2025-12-29 12:00:00.060061
2	1	2	Nexon Car Loan	Car Loan	0.00	INR	0.00	2025-12-29 12:00:00.062
3	1	3	Sukhwani Sepia Home Loan	Home Loan	0.00	INR	0.00	2025-12-29 12:00:00.062762
4	3	1	K Shire Home Loan	Home Loan	3809448.00	\N	3809448.00	2026-01-05 12:00:00.111587
5	3	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-01-05 12:00:00.114121
6	3	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-01-05 12:00:00.115393
7	5	1	K Shire Home Loan	Home Loan	3788000.00	\N	3788000.00	2026-01-12 12:00:00.297763
8	5	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-01-12 12:00:00.303001
9	5	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-01-12 12:00:00.303921
10	7	1	K Shire Home Loan	Home Loan	3788000.00	\N	3788000.00	2026-01-19 12:00:00.149018
11	7	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-01-19 12:00:00.154365
12	7	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-01-19 12:00:00.155143
13	9	1	K Shire Home Loan	Home Loan	3788000.00	\N	3788000.00	2026-01-26 12:00:00.365182
14	9	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-01-26 12:00:00.372627
15	9	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-01-26 12:00:00.374137
16	11	1	K Shire Home Loan	Home Loan	3788000.00	\N	3788000.00	2026-02-02 12:00:00.756356
17	11	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-02-02 12:00:00.762691
18	11	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-02-02 12:00:00.763638
19	12	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-02-02 12:00:00.787154
20	14	1	K Shire Home Loan	Home Loan	3766200.00	\N	3766200.00	2026-02-09 12:00:00.154958
21	14	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-02-09 12:00:00.160578
22	14	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-02-09 12:00:00.161813
23	15	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-02-09 12:00:00.182734
24	17	1	K Shire Home Loan	Home Loan	3766200.00	\N	3766200.00	2026-02-16 12:00:00.385872
25	17	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-02-16 12:00:00.391139
26	17	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-02-16 12:00:00.39208
27	18	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-02-16 12:00:00.412274
28	20	1	K Shire Home Loan	Home Loan	3766200.00	\N	3766200.00	2026-02-23 12:00:00.333258
29	20	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-02-23 12:00:00.340318
30	20	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-02-23 12:00:00.341617
31	21	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-02-23 12:00:00.390089
32	23	1	K Shire Home Loan	Home Loan	3766200.00	\N	3766200.00	2026-03-02 12:00:00.185619
33	23	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-03-02 12:00:00.194487
34	23	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-03-02 12:00:00.195843
35	24	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-03-02 12:00:00.228602
36	26	1	K Shire Home Loan	Home Loan	3766200.00	\N	3766200.00	2026-03-09 12:00:00.808877
37	26	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-03-09 12:00:00.817839
38	26	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-03-09 12:00:00.819841
39	27	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-03-09 12:00:00.857041
40	29	1	K Shire Home Loan	Home Loan	3741900.00	\N	3741900.00	2026-03-16 12:00:00.128755
41	29	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-03-16 12:00:00.136419
42	29	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-03-16 12:00:00.137593
43	30	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-03-16 12:00:00.159808
44	32	1	K Shire Home Loan	Home Loan	3741900.00	\N	3741900.00	2026-03-23 12:00:01.179094
45	32	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-03-23 12:00:01.185645
46	32	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-03-23 12:00:01.186644
47	33	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-03-23 12:00:01.224027
48	35	1	K Shire Home Loan	Home Loan	3741900.00	\N	3741900.00	2026-03-30 12:00:03.958852
49	35	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-03-30 12:00:03.968807
50	35	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-03-30 12:00:03.970306
51	36	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-03-30 12:00:04.169563
52	38	1	K Shire Home Loan	Home Loan	3741900.00	\N	3741900.00	2026-04-06 12:00:02.111245
53	38	2	Nexon Car Loan	Car Loan	0.00	\N	0.00	2026-04-06 12:00:02.119162
54	38	3	Sukhwani Sepia Home Loan	Home Loan	0.00	\N	0.00	2026-04-06 12:00:02.201182
55	39	4	Bella Rosa Home Loan	Home Loan	2500000.00	\N	2500000.00	2026-04-06 12:00:02.4025
\.


--
-- Data for Name: portfolio_snapshots; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.portfolio_snapshots (id, user_id, snapshot_date, total_assets, total_liabilities, net_worth, total_gains, created_at) FROM stdin;
1	1	2025-12-29	26713693.20	3809448.00	22904245.20	4828629.02	2025-12-29 12:00:00.036329
2	2	2026-01-05	0.00	0.00	0.00	0.00	2026-01-05 12:00:00.034729
3	1	2026-01-05	26243353.00	3809448.00	22433905.00	4310859.00	2026-01-05 12:00:00.087315
4	2	2026-01-12	0.00	0.00	0.00	0.00	2026-01-12 12:00:00.199606
5	1	2026-01-12	26743353.00	3788000.00	22955353.00	4810859.00	2026-01-12 12:00:00.270475
6	2	2026-01-19	0.00	0.00	0.00	0.00	2026-01-19 12:00:00.054571
7	1	2026-01-19	26803653.00	3788000.00	23015653.00	4871159.00	2026-01-19 12:00:00.123322
8	2	2026-01-26	0.00	0.00	0.00	0.00	2026-01-26 12:00:00.231064
9	1	2026-01-26	26838653.00	3788000.00	23050653.00	4906159.00	2026-01-26 12:00:00.32109
10	2	2026-02-02	0.00	0.00	0.00	0.00	2026-02-02 12:00:00.66791
11	1	2026-02-02	26883353.00	3788000.00	23095353.00	4906159.00	2026-02-02 12:00:00.723486
12	3	2026-02-02	16900000.00	2500000.00	14400000.00	5800000.00	2026-02-02 12:00:00.778602
13	2	2026-02-09	0.00	0.00	0.00	0.00	2026-02-09 12:00:00.049659
14	1	2026-02-09	26986678.00	3766200.00	23220478.00	4866462.00	2026-02-09 12:00:00.125979
15	3	2026-02-09	16900000.00	2500000.00	14400000.00	5800000.00	2026-02-09 12:00:00.175048
16	2	2026-02-16	0.00	0.00	0.00	0.00	2026-02-16 12:00:00.213119
17	1	2026-02-16	27120108.00	3766200.00	23353908.00	4949716.00	2026-02-16 12:00:00.355087
18	3	2026-02-16	16900000.00	2500000.00	14400000.00	5800000.00	2026-02-16 12:00:00.403928
19	2	2026-02-23	0.00	0.00	0.00	0.00	2026-02-23 12:00:00.220951
20	1	2026-02-23	27120108.00	3766200.00	23353908.00	4949716.00	2026-02-23 12:00:00.2989
21	3	2026-02-23	16900000.00	2500000.00	14400000.00	5800000.00	2026-02-23 12:00:00.362035
22	2	2026-03-02	0.00	0.00	0.00	0.00	2026-03-02 12:00:00.056023
23	1	2026-03-02	27248374.00	3766200.00	23482174.00	4944354.00	2026-03-02 12:00:00.140469
24	3	2026-03-02	16900000.00	2500000.00	14400000.00	5800000.00	2026-03-02 12:00:00.216459
25	2	2026-03-09	0.00	0.00	0.00	0.00	2026-03-09 12:00:00.690833
26	1	2026-03-09	27248374.00	3766200.00	23482174.00	4944354.00	2026-03-09 12:00:00.766757
27	3	2026-03-09	16900000.00	2500000.00	14400000.00	5800000.00	2026-03-09 12:00:00.843777
28	2	2026-03-16	0.00	0.00	0.00	0.00	2026-03-16 12:00:00.035391
29	1	2026-03-16	27757990.00	3741900.00	24016090.00	4842584.00	2026-03-16 12:00:00.092297
30	3	2026-03-16	16900000.00	2500000.00	14400000.00	5800000.00	2026-03-16 12:00:00.151737
31	2	2026-03-23	0.00	0.00	0.00	0.00	2026-03-23 12:00:01.071964
32	1	2026-03-23	27757990.00	3741900.00	24016090.00	4842584.00	2026-03-23 12:00:01.152819
33	3	2026-03-23	16900000.00	2500000.00	14400000.00	5800000.00	2026-03-23 12:00:01.20076
34	2	2026-03-30	0.00	0.00	0.00	0.00	2026-03-30 12:00:03.155645
35	1	2026-03-30	27805374.00	3741900.00	24063474.00	4667960.00	2026-03-30 12:00:03.755117
36	3	2026-03-30	16900000.00	2500000.00	14400000.00	5800000.00	2026-03-30 12:00:04.155808
37	2	2026-04-06	0.00	0.00	0.00	0.00	2026-04-06 12:00:01.005785
38	1	2026-04-06	27805374.00	3741900.00	24063474.00	4667960.00	2026-04-06 12:00:01.81996
39	3	2026-04-06	16900000.00	2500000.00	14400000.00	5800000.00	2026-04-06 12:00:02.310841
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: netly_schema; Owner: postgres
--

COPY netly_schema.users (id, name, email, password, created_at, secondary_emails) FROM stdin;
2	Prajakta Sonawane	sonawane.prajakta@outlook.com	$2a$10$bzSSBI/G.LxnXgwFi4YYuOWHc0bLSw1fM6XZI9Mc8s62qmUBdAq0m	2025-12-30 02:34:03.252892	\N
1	Yogesh Sonawane	sonawane.yogesh.huf@outlook.com	$2a$10$DP.XinUnZKlYj.E9WDsf1eHrLSBgNsa9DXSqJAI0OFFJofz9Gz4Wy	2025-11-11 09:24:22.783571	sonawane.yogesh@outlook.com,sonawane.prajakta@outlook.com
3	Rushikesh Kardile	rushikardile8952@gmail.com	$2a$10$ZfCp01dZDvIl0CoFi4lvXuq/AuMc6Dz1xxduoDUDBzXBL9lWrncmO	2026-01-27 14:41:20.4538	\N
\.


--
-- Name: asset_snapshots_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.asset_snapshots_id_seq', 210, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.assets_id_seq', 15, true);


--
-- Name: budget_items_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.budget_items_id_seq', 16, true);


--
-- Name: custom_asset_types_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.custom_asset_types_id_seq', 32, true);


--
-- Name: custom_liability_types_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.custom_liability_types_id_seq', 21, true);


--
-- Name: liabilities_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.liabilities_id_seq', 4, true);


--
-- Name: liability_snapshots_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.liability_snapshots_id_seq', 55, true);


--
-- Name: portfolio_snapshots_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.portfolio_snapshots_id_seq', 39, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: netly_schema; Owner: postgres
--

SELECT pg_catalog.setval('netly_schema.users_id_seq', 3, true);


--
-- Name: asset_snapshots asset_snapshots_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.asset_snapshots
    ADD CONSTRAINT asset_snapshots_pkey PRIMARY KEY (id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: budget_items budget_items_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.budget_items
    ADD CONSTRAINT budget_items_pkey PRIMARY KEY (id);


--
-- Name: custom_asset_types custom_asset_types_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_asset_types
    ADD CONSTRAINT custom_asset_types_pkey PRIMARY KEY (id);


--
-- Name: custom_asset_types custom_asset_types_user_id_type_name_key; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_asset_types
    ADD CONSTRAINT custom_asset_types_user_id_type_name_key UNIQUE (user_id, type_name);


--
-- Name: custom_liability_types custom_liability_types_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_liability_types
    ADD CONSTRAINT custom_liability_types_pkey PRIMARY KEY (id);


--
-- Name: custom_liability_types custom_liability_types_user_id_type_name_key; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_liability_types
    ADD CONSTRAINT custom_liability_types_user_id_type_name_key UNIQUE (user_id, type_name);


--
-- Name: liabilities liabilities_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liabilities
    ADD CONSTRAINT liabilities_pkey PRIMARY KEY (id);


--
-- Name: liability_snapshots liability_snapshots_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liability_snapshots
    ADD CONSTRAINT liability_snapshots_pkey PRIMARY KEY (id);


--
-- Name: portfolio_snapshots portfolio_snapshots_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.portfolio_snapshots
    ADD CONSTRAINT portfolio_snapshots_pkey PRIMARY KEY (id);


--
-- Name: portfolio_snapshots portfolio_snapshots_user_id_snapshot_date_key; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.portfolio_snapshots
    ADD CONSTRAINT portfolio_snapshots_user_id_snapshot_date_key UNIQUE (user_id, snapshot_date);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_asset_snapshots_asset_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_asset_snapshots_asset_id ON netly_schema.asset_snapshots USING btree (asset_id);


--
-- Name: idx_asset_snapshots_portfolio_snapshot_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_asset_snapshots_portfolio_snapshot_id ON netly_schema.asset_snapshots USING btree (portfolio_snapshot_id);


--
-- Name: idx_assets_created_at; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_assets_created_at ON netly_schema.assets USING btree (created_at);


--
-- Name: idx_assets_custom_asset_type_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_assets_custom_asset_type_id ON netly_schema.assets USING btree (custom_asset_type_id);


--
-- Name: idx_assets_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_assets_user_id ON netly_schema.assets USING btree (user_id);


--
-- Name: idx_budget_items_item_type; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_budget_items_item_type ON netly_schema.budget_items USING btree (item_type);


--
-- Name: idx_budget_items_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_budget_items_user_id ON netly_schema.budget_items USING btree (user_id);


--
-- Name: idx_budget_items_user_type; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_budget_items_user_type ON netly_schema.budget_items USING btree (user_id, item_type);


--
-- Name: idx_custom_asset_types_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_custom_asset_types_user_id ON netly_schema.custom_asset_types USING btree (user_id);


--
-- Name: idx_custom_liability_types_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_custom_liability_types_user_id ON netly_schema.custom_liability_types USING btree (user_id);


--
-- Name: idx_liabilities_created_at; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_liabilities_created_at ON netly_schema.liabilities USING btree (created_at);


--
-- Name: idx_liabilities_custom_liability_type_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_liabilities_custom_liability_type_id ON netly_schema.liabilities USING btree (custom_liability_type_id);


--
-- Name: idx_liabilities_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_liabilities_user_id ON netly_schema.liabilities USING btree (user_id);


--
-- Name: idx_liability_snapshots_liability_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_liability_snapshots_liability_id ON netly_schema.liability_snapshots USING btree (liability_id);


--
-- Name: idx_liability_snapshots_portfolio_snapshot_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_liability_snapshots_portfolio_snapshot_id ON netly_schema.liability_snapshots USING btree (portfolio_snapshot_id);


--
-- Name: idx_portfolio_snapshots_snapshot_date; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_portfolio_snapshots_snapshot_date ON netly_schema.portfolio_snapshots USING btree (snapshot_date);


--
-- Name: idx_portfolio_snapshots_user_date; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_portfolio_snapshots_user_date ON netly_schema.portfolio_snapshots USING btree (user_id, snapshot_date);


--
-- Name: idx_portfolio_snapshots_user_id; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_portfolio_snapshots_user_id ON netly_schema.portfolio_snapshots USING btree (user_id);


--
-- Name: idx_users_email; Type: INDEX; Schema: netly_schema; Owner: postgres
--

CREATE INDEX idx_users_email ON netly_schema.users USING btree (email);


--
-- Name: asset_snapshots asset_snapshots_portfolio_snapshot_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.asset_snapshots
    ADD CONSTRAINT asset_snapshots_portfolio_snapshot_id_fkey FOREIGN KEY (portfolio_snapshot_id) REFERENCES netly_schema.portfolio_snapshots(id) ON DELETE CASCADE;


--
-- Name: assets assets_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.assets
    ADD CONSTRAINT assets_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: budget_items budget_items_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.budget_items
    ADD CONSTRAINT budget_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: custom_asset_types custom_asset_types_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_asset_types
    ADD CONSTRAINT custom_asset_types_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: custom_liability_types custom_liability_types_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.custom_liability_types
    ADD CONSTRAINT custom_liability_types_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: assets fk_assets_custom_asset_type; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.assets
    ADD CONSTRAINT fk_assets_custom_asset_type FOREIGN KEY (custom_asset_type_id) REFERENCES netly_schema.custom_asset_types(id);


--
-- Name: liabilities fk_liabilities_custom_liability_type; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liabilities
    ADD CONSTRAINT fk_liabilities_custom_liability_type FOREIGN KEY (custom_liability_type_id) REFERENCES netly_schema.custom_liability_types(id);


--
-- Name: liabilities liabilities_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liabilities
    ADD CONSTRAINT liabilities_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: liability_snapshots liability_snapshots_portfolio_snapshot_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.liability_snapshots
    ADD CONSTRAINT liability_snapshots_portfolio_snapshot_id_fkey FOREIGN KEY (portfolio_snapshot_id) REFERENCES netly_schema.portfolio_snapshots(id) ON DELETE CASCADE;


--
-- Name: portfolio_snapshots portfolio_snapshots_user_id_fkey; Type: FK CONSTRAINT; Schema: netly_schema; Owner: postgres
--

ALTER TABLE ONLY netly_schema.portfolio_snapshots
    ADD CONSTRAINT portfolio_snapshots_user_id_fkey FOREIGN KEY (user_id) REFERENCES netly_schema.users(id) ON DELETE CASCADE;


--
-- Name: TABLE asset_snapshots; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.asset_snapshots TO netly_app_user;


--
-- Name: SEQUENCE asset_snapshots_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.asset_snapshots_id_seq TO netly_app_user;


--
-- Name: TABLE assets; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.assets TO netly_app_user;


--
-- Name: SEQUENCE assets_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.assets_id_seq TO netly_app_user;


--
-- Name: TABLE budget_items; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.budget_items TO netly_app_user;


--
-- Name: SEQUENCE budget_items_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.budget_items_id_seq TO netly_app_user;


--
-- Name: TABLE custom_asset_types; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.custom_asset_types TO netly_app_user;


--
-- Name: SEQUENCE custom_asset_types_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.custom_asset_types_id_seq TO netly_app_user;


--
-- Name: TABLE custom_liability_types; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.custom_liability_types TO netly_app_user;


--
-- Name: SEQUENCE custom_liability_types_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.custom_liability_types_id_seq TO netly_app_user;


--
-- Name: TABLE liabilities; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.liabilities TO netly_app_user;


--
-- Name: SEQUENCE liabilities_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.liabilities_id_seq TO netly_app_user;


--
-- Name: TABLE liability_snapshots; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.liability_snapshots TO netly_app_user;


--
-- Name: SEQUENCE liability_snapshots_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.liability_snapshots_id_seq TO netly_app_user;


--
-- Name: TABLE portfolio_snapshots; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.portfolio_snapshots TO netly_app_user;


--
-- Name: SEQUENCE portfolio_snapshots_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.portfolio_snapshots_id_seq TO netly_app_user;


--
-- Name: TABLE users; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE netly_schema.users TO netly_app_user;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: netly_schema; Owner: postgres
--

GRANT ALL ON SEQUENCE netly_schema.users_id_seq TO netly_app_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: netly_schema; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA netly_schema GRANT SELECT ON SEQUENCES TO netly_app_user;


--
-- PostgreSQL database dump complete
--

\unrestrict aGBwfUNN4hySNuBu6HQugDpFQkF2RTfr3moz1tKHXSX4djzCaA0lyAR2NvtLq2u

