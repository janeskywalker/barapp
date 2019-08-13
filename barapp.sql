--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO janeskywalker;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO janeskywalker;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO janeskywalker;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO janeskywalker;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO janeskywalker;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO janeskywalker;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO janeskywalker;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO janeskywalker;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO janeskywalker;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO janeskywalker;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO janeskywalker;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO janeskywalker;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: barapp_category; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.barapp_category OWNER TO janeskywalker;

--
-- Name: barapp_category_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_category_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_category_id_seq OWNED BY public.barapp_category.id;


--
-- Name: barapp_drink; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_drink (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.barapp_drink OWNER TO janeskywalker;

--
-- Name: barapp_drink_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_drink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_drink_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_drink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_drink_id_seq OWNED BY public.barapp_drink.id;


--
-- Name: barapp_drink_ingredients; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_drink_ingredients (
    id integer NOT NULL,
    drink_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.barapp_drink_ingredients OWNER TO janeskywalker;

--
-- Name: barapp_drink_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_drink_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_drink_ingredients_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_drink_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_drink_ingredients_id_seq OWNED BY public.barapp_drink_ingredients.id;


--
-- Name: barapp_ingredient; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_ingredient (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.barapp_ingredient OWNER TO janeskywalker;

--
-- Name: barapp_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_ingredient_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_ingredient_id_seq OWNED BY public.barapp_ingredient.id;


--
-- Name: barapp_tab; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_tab (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    open_date_time timestamp with time zone NOT NULL,
    close_date_time timestamp with time zone
);


ALTER TABLE public.barapp_tab OWNER TO janeskywalker;

--
-- Name: barapp_tab_drinks; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_tab_drinks (
    id integer NOT NULL,
    tab_id integer NOT NULL,
    drink_id integer NOT NULL
);


ALTER TABLE public.barapp_tab_drinks OWNER TO janeskywalker;

--
-- Name: barapp_tab_drinks_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_tab_drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_tab_drinks_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_tab_drinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_tab_drinks_id_seq OWNED BY public.barapp_tab_drinks.id;


--
-- Name: barapp_tab_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_tab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_tab_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_tab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_tab_id_seq OWNED BY public.barapp_tab.id;


--
-- Name: barapp_tab_ingredients; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.barapp_tab_ingredients (
    id integer NOT NULL,
    tab_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.barapp_tab_ingredients OWNER TO janeskywalker;

--
-- Name: barapp_tab_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.barapp_tab_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barapp_tab_ingredients_id_seq OWNER TO janeskywalker;

--
-- Name: barapp_tab_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.barapp_tab_ingredients_id_seq OWNED BY public.barapp_tab_ingredients.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO janeskywalker;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO janeskywalker;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO janeskywalker;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO janeskywalker;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO janeskywalker;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: janeskywalker
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO janeskywalker;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: janeskywalker
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: janeskywalker
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO janeskywalker;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: barapp_category id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_category ALTER COLUMN id SET DEFAULT nextval('public.barapp_category_id_seq'::regclass);


--
-- Name: barapp_drink id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink ALTER COLUMN id SET DEFAULT nextval('public.barapp_drink_id_seq'::regclass);


--
-- Name: barapp_drink_ingredients id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink_ingredients ALTER COLUMN id SET DEFAULT nextval('public.barapp_drink_ingredients_id_seq'::regclass);


--
-- Name: barapp_ingredient id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_ingredient ALTER COLUMN id SET DEFAULT nextval('public.barapp_ingredient_id_seq'::regclass);


--
-- Name: barapp_tab id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab ALTER COLUMN id SET DEFAULT nextval('public.barapp_tab_id_seq'::regclass);


--
-- Name: barapp_tab_drinks id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_drinks ALTER COLUMN id SET DEFAULT nextval('public.barapp_tab_drinks_id_seq'::regclass);


--
-- Name: barapp_tab_ingredients id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_ingredients ALTER COLUMN id SET DEFAULT nextval('public.barapp_tab_ingredients_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add drink	8	add_drink
30	Can change drink	8	change_drink
31	Can delete drink	8	delete_drink
32	Can view drink	8	view_drink
33	Can add ingredient	9	add_ingredient
34	Can change ingredient	9	change_ingredient
35	Can delete ingredient	9	delete_ingredient
36	Can view ingredient	9	view_ingredient
37	Can add tab	10	add_tab
38	Can change tab	10	change_tab
39	Can delete tab	10	delete_tab
40	Can view tab	10	view_tab
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$vAo638AHMKvV$RErtXx7y4PbhAtHx5bSszsd+Aqa6QmeWXF5Cuex/NFo=	2019-08-10 21:56:37.563867-07	t	jane			jane@jane.com	t	t	2019-08-10 21:30:00.414348-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: barapp_category; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_category (id, name) FROM stdin;
1	Beer
2	Rum
3	Whiskey
5	Mixers
6	Vodka
7	Tequila
8	Wine
9	Liqueur
11	Gin
\.


--
-- Data for Name: barapp_drink; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_drink (id, name, category_id) FROM stdin;
1	Oktoberfest	1
2	Rum and Coke	2
3	Mojito	2
4	Bloddy Mary	6
6	Guinness	1
7	Gin and Tonic	11
8	Manhattan	3
9	Margarita	7
10	Moscow Mule	6
11	House Red	8
12	House White	8
13	Martini	11
\.


--
-- Data for Name: barapp_drink_ingredients; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_drink_ingredients (id, drink_id, ingredient_id) FROM stdin;
1	1	1
2	2	2
3	2	3
5	3	4
6	3	5
7	3	6
8	3	7
9	4	8
10	4	9
11	4	10
14	6	11
15	7	13
16	7	14
17	8	16
18	8	15
19	9	17
20	9	4
21	10	18
22	10	19
23	10	4
24	11	20
25	12	21
26	13	16
27	13	22
\.


--
-- Data for Name: barapp_ingredient; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_ingredient (id, name, price, category_id) FROM stdin;
1	Spaten Oktoberfest	8	1
3	Coke	2	5
4	Lime Juice	1	5
5	Club Soda	1	5
6	Mint Leaves	0	5
7	Bacardi	12	2
8	Absolute	8	6
9	Tomato Juice	1	5
10	Tabasco Sauce	0	5
11	Guinness Drought	8	1
13	Tanqueray Gin	12	11
14	Tonic Water	1	5
15	Crown Royal	10	3
16	Vermouth	2	9
2	Captain Morgan	10	2
17	Patron Silver	12	7
18	Ginger Beer	2	5
19	Belvedere Vodka	10	6
20	Portovenere Cabernet	5	8
21	Venezia Chardonnay	6	8
22	Hendrick's	8	11
23	Dalmor 12 year	18	3
24	MacCallan 18	25	3
\.


--
-- Data for Name: barapp_tab; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_tab (id, name, open_date_time, close_date_time) FROM stdin;
11	Customer Jim	2019-08-11 18:12:49.021396-07	\N
17	Bob	2019-08-11 21:08:45.085927-07	2019-08-11 21:10:07.423411-07
16	Ted	2019-08-11 18:40:50.748191-07	2019-08-11 21:13:25.715004-07
12	Kevin	2019-08-11 18:21:52.287727-07	2019-08-11 21:13:58.145674-07
13	Bob	2019-08-11 18:22:28.933317-07	2019-08-11 21:20:53.607425-07
18	Larry	2019-08-11 21:28:46.072396-07	\N
15	Rachel	2019-08-11 18:25:03.834795-07	2019-08-12 11:31:46.801583-07
1	Customer James	2019-08-10 21:32:52.247692-07	2019-08-12 11:34:51.188373-07
14	Larry	2019-08-11 18:24:00.687997-07	2019-08-12 21:30:17.779374-07
19	Kevin	2019-08-12 21:34:34.942481-07	\N
\.


--
-- Data for Name: barapp_tab_drinks; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_tab_drinks (id, tab_id, drink_id) FROM stdin;
1	1	1
2	16	1
3	16	2
4	16	6
5	16	4
6	18	1
7	18	6
8	18	2
11	14	1
12	14	6
13	14	7
14	19	8
\.


--
-- Data for Name: barapp_tab_ingredients; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.barapp_tab_ingredients (id, tab_id, ingredient_id) FROM stdin;
1	1	1
2	16	3
3	16	9
4	16	6
11	14	1
12	14	11
13	19	15
14	19	24
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-10 21:30:33.95306-07	1	Beer	1	[{"added": {}}]	7	1
2	2019-08-10 21:30:39.532481-07	2	Rum	1	[{"added": {}}]	7	1
3	2019-08-10 21:30:44.84514-07	3	Whiskey	1	[{"added": {}}]	7	1
4	2019-08-10 21:30:46.357497-07	4		1	[{"added": {}}]	7	1
5	2019-08-10 21:31:10.315183-07	4		3		7	1
6	2019-08-10 21:31:42.711728-07	1	Spaten Oktoberfest	1	[{"added": {}}]	9	1
7	2019-08-10 21:31:45.28182-07	1	Oktoberfest	1	[{"added": {}}]	8	1
8	2019-08-10 21:32:52.255828-07	1	Customer James	1	[{"added": {}}]	10	1
9	2019-08-10 21:32:59.841746-07	1	Customer James	2	[]	10	1
10	2019-08-10 21:34:44.219968-07	2	Captain Morgan	1	[{"added": {}}]	9	1
11	2019-08-10 21:35:30.018773-07	5	Mixers	1	[{"added": {}}]	7	1
12	2019-08-10 21:35:33.090929-07	3	Coke	1	[{"added": {}}]	9	1
13	2019-08-10 21:35:55.895065-07	2	Rum and Coke	1	[{"added": {}}]	8	1
14	2019-08-10 21:37:29.294823-07	4	Lime Juice	1	[{"added": {}}]	9	1
15	2019-08-10 21:38:26.345667-07	5	Club Soda	1	[{"added": {}}]	9	1
16	2019-08-10 21:39:32.930006-07	6	Mint Leaves	1	[{"added": {}}]	9	1
17	2019-08-10 21:40:00.075625-07	3	Mojito	1	[{"added": {}}]	8	1
18	2019-08-10 21:42:03.383738-07	7	Bacardi	1	[{"added": {}}]	9	1
19	2019-08-10 21:42:13.368272-07	3	Mojito	2	[{"changed": {"fields": ["ingredients"]}}]	8	1
20	2019-08-10 21:42:50.86758-07	6	Vodka	1	[{"added": {}}]	7	1
21	2019-08-10 21:43:23.391657-07	8	Absolute	1	[{"added": {}}]	9	1
22	2019-08-10 21:44:00.698675-07	9	Tomato Juice	1	[{"added": {}}]	9	1
23	2019-08-10 21:44:27.442384-07	10	Tabasco Sauce	1	[{"added": {}}]	9	1
24	2019-08-10 21:44:35.015228-07	4	Bloddy Mary	1	[{"added": {}}]	8	1
25	2019-08-11 09:31:57.800303-07	11	Guinness Drought	1	[{"added": {}}]	9	1
26	2019-08-11 09:32:01.664199-07	5	Guinness	1	[{"added": {}}]	8	1
27	2019-08-11 09:42:26.193837-07	5	Guinness	3		8	1
28	2019-08-11 09:43:47.549194-07	12	Guinness Drought	1	[{"added": {}}]	9	1
29	2019-08-11 09:44:53.059172-07	6	Guinness	1	[{"added": {}}]	8	1
30	2019-08-11 16:24:52.463329-07	12	Guinness Drought	3		9	1
31	2019-08-11 18:13:34.160582-07	10	Customer Jim	3		10	1
32	2019-08-11 18:13:34.167737-07	9	Customer Jim	3		10	1
33	2019-08-11 18:13:34.169305-07	8	Customer Jim	3		10	1
34	2019-08-11 18:13:34.170238-07	7	Customer Jim	3		10	1
35	2019-08-11 18:13:34.171229-07	6	Customer Jim	3		10	1
36	2019-08-11 18:13:34.172581-07	5	Customer Jim	3		10	1
37	2019-08-11 18:13:34.173881-07	4	Customer Jim	3		10	1
38	2019-08-11 18:13:34.175158-07	3	Customer Jim	3		10	1
39	2019-08-11 18:13:34.176339-07	2	Customer Jim	3		10	1
40	2019-08-11 18:58:34.606323-07	16	Ted	2	[{"changed": {"fields": ["drinks"]}}]	10	1
41	2019-08-11 19:05:49.236464-07	16	Ted	2	[{"changed": {"fields": ["ingredients"]}}]	10	1
42	2019-08-12 18:41:53.637156-07	14	Larry	2	[]	10	1
43	2019-08-12 18:58:20.427733-07	14	Larry	2	[{"changed": {"fields": ["ingredients"]}}]	10	1
44	2019-08-12 21:02:10.226251-07	14	Larry	2	[{"changed": {"fields": ["drinks", "ingredients"]}}]	10	1
45	2019-08-12 21:02:42.523718-07	6	Guinness	2	[{"changed": {"fields": ["ingredients"]}}]	8	1
46	2019-08-12 21:08:34.032999-07	7	Tequila	1	[{"added": {}}]	7	1
47	2019-08-12 21:09:01.174663-07	8	Wine	1	[{"added": {}}]	7	1
48	2019-08-12 21:10:40.227035-07	9	Liqueur	1	[{"added": {}}]	7	1
49	2019-08-12 21:10:55.170265-07	10	Sake	1	[{"added": {}}]	7	1
50	2019-08-12 21:11:41.484251-07	10	Sake	3		7	1
51	2019-08-12 21:11:57.720702-07	11	Gin	1	[{"added": {}}]	7	1
52	2019-08-12 21:13:00.542997-07	13	Tanqueray Gin	1	[{"added": {}}]	9	1
53	2019-08-12 21:13:50.24779-07	14	Tonic Water	1	[{"added": {}}]	9	1
54	2019-08-12 21:13:53.33001-07	7	Gin and Tonic	1	[{"added": {}}]	8	1
55	2019-08-12 21:15:15.063973-07	15	Crown Royal	1	[{"added": {}}]	9	1
56	2019-08-12 21:15:40.522675-07	16	Vermouth	1	[{"added": {}}]	9	1
57	2019-08-12 21:15:49.010484-07	8	Manhattan	1	[{"added": {}}]	8	1
58	2019-08-12 21:16:10.31498-07	16	Vermouth	2	[{"changed": {"fields": ["category"]}}]	9	1
59	2019-08-12 21:16:30.593914-07	2	Captain Morgan	2	[]	9	1
60	2019-08-12 21:17:48.6725-07	17	Patron Silver	1	[{"added": {}}]	9	1
61	2019-08-12 21:18:09.857483-07	9	Margarita	1	[{"added": {}}]	8	1
62	2019-08-12 21:19:57.903244-07	18	Ginger Beer	1	[{"added": {}}]	9	1
63	2019-08-12 21:21:07.046441-07	19	Belvedere Vodka	1	[{"added": {}}]	9	1
64	2019-08-12 21:21:57.066118-07	10	Moscow Mule	1	[{"added": {}}]	8	1
65	2019-08-12 21:25:29.31427-07	20	Portovenere Cabernet	1	[{"added": {}}]	9	1
66	2019-08-12 21:25:36.178673-07	11	House Red	1	[{"added": {}}]	8	1
67	2019-08-12 21:28:11.986836-07	21	Venezia Chardonnay	1	[{"added": {}}]	9	1
68	2019-08-12 21:28:20.61551-07	12	House White	1	[{"added": {}}]	8	1
69	2019-08-12 21:29:41.593612-07	22	Hendrick's	1	[{"added": {}}]	9	1
70	2019-08-12 21:29:51.375736-07	13	Martini	1	[{"added": {}}]	8	1
71	2019-08-12 21:35:03.669861-07	23	Dalmor 12 year	1	[{"added": {}}]	9	1
72	2019-08-12 21:35:32.16637-07	24	McCallan 18	1	[{"added": {}}]	9	1
73	2019-08-12 21:36:00.168925-07	24	MacCallan 18	2	[{"changed": {"fields": ["name"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	barapp	category
8	barapp	drink
9	barapp	ingredient
10	barapp	tab
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-10 21:29:45.087154-07
2	auth	0001_initial	2019-08-10 21:29:45.132565-07
3	admin	0001_initial	2019-08-10 21:29:45.16571-07
4	admin	0002_logentry_remove_auto_add	2019-08-10 21:29:45.178924-07
5	admin	0003_logentry_add_action_flag_choices	2019-08-10 21:29:45.187401-07
6	contenttypes	0002_remove_content_type_name	2019-08-10 21:29:45.204684-07
7	auth	0002_alter_permission_name_max_length	2019-08-10 21:29:45.20967-07
8	auth	0003_alter_user_email_max_length	2019-08-10 21:29:45.21896-07
9	auth	0004_alter_user_username_opts	2019-08-10 21:29:45.227194-07
10	auth	0005_alter_user_last_login_null	2019-08-10 21:29:45.234391-07
11	auth	0006_require_contenttypes_0002	2019-08-10 21:29:45.23623-07
12	auth	0007_alter_validators_add_error_messages	2019-08-10 21:29:45.244193-07
13	auth	0008_alter_user_username_max_length	2019-08-10 21:29:45.254546-07
14	auth	0009_alter_user_last_name_max_length	2019-08-10 21:29:45.262683-07
15	auth	0010_alter_group_name_max_length	2019-08-10 21:29:45.271565-07
16	auth	0011_update_proxy_permissions	2019-08-10 21:29:45.279256-07
17	barapp	0001_initial	2019-08-10 21:29:45.31346-07
18	sessions	0001_initial	2019-08-10 21:29:45.339442-07
19	barapp	0002_auto_20190812_0157	2019-08-11 18:57:58.741698-07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: janeskywalker
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ruvf11clmas4qqk8k3v8ytbm5ow0ttxt	NmVlMGU2YTk2NTE2YWQzMDFiZGQxMDgyMmFiYzU5ZTRlOGNlNzNjMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMzY1OGJiOTg2NzI4OTc0OTdlZTllNWE5Y2RiMzEyODgyOGI1NzUyIn0=	2019-08-26 21:38:32.635498-07
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: barapp_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_category_id_seq', 11, true);


--
-- Name: barapp_drink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_drink_id_seq', 13, true);


--
-- Name: barapp_drink_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_drink_ingredients_id_seq', 27, true);


--
-- Name: barapp_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_ingredient_id_seq', 24, true);


--
-- Name: barapp_tab_drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_tab_drinks_id_seq', 14, true);


--
-- Name: barapp_tab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_tab_id_seq', 19, true);


--
-- Name: barapp_tab_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.barapp_tab_ingredients_id_seq', 14, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 73, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: janeskywalker
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: barapp_category barapp_category_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_category
    ADD CONSTRAINT barapp_category_pkey PRIMARY KEY (id);


--
-- Name: barapp_drink_ingredients barapp_drink_ingredients_drink_id_ingredient_id_e942e277_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink_ingredients
    ADD CONSTRAINT barapp_drink_ingredients_drink_id_ingredient_id_e942e277_uniq UNIQUE (drink_id, ingredient_id);


--
-- Name: barapp_drink_ingredients barapp_drink_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink_ingredients
    ADD CONSTRAINT barapp_drink_ingredients_pkey PRIMARY KEY (id);


--
-- Name: barapp_drink barapp_drink_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink
    ADD CONSTRAINT barapp_drink_pkey PRIMARY KEY (id);


--
-- Name: barapp_ingredient barapp_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_ingredient
    ADD CONSTRAINT barapp_ingredient_pkey PRIMARY KEY (id);


--
-- Name: barapp_tab_drinks barapp_tab_drinks_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_drinks
    ADD CONSTRAINT barapp_tab_drinks_pkey PRIMARY KEY (id);


--
-- Name: barapp_tab_drinks barapp_tab_drinks_tab_id_drink_id_37484559_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_drinks
    ADD CONSTRAINT barapp_tab_drinks_tab_id_drink_id_37484559_uniq UNIQUE (tab_id, drink_id);


--
-- Name: barapp_tab_ingredients barapp_tab_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_ingredients
    ADD CONSTRAINT barapp_tab_ingredients_pkey PRIMARY KEY (id);


--
-- Name: barapp_tab_ingredients barapp_tab_ingredients_tab_id_ingredient_id_4c10352c_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_ingredients
    ADD CONSTRAINT barapp_tab_ingredients_tab_id_ingredient_id_4c10352c_uniq UNIQUE (tab_id, ingredient_id);


--
-- Name: barapp_tab barapp_tab_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab
    ADD CONSTRAINT barapp_tab_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: barapp_drink_category_id_225c83f6; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_drink_category_id_225c83f6 ON public.barapp_drink USING btree (category_id);


--
-- Name: barapp_drink_ingredients_drink_id_e140bc6d; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_drink_ingredients_drink_id_e140bc6d ON public.barapp_drink_ingredients USING btree (drink_id);


--
-- Name: barapp_drink_ingredients_ingredient_id_72fee1e6; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_drink_ingredients_ingredient_id_72fee1e6 ON public.barapp_drink_ingredients USING btree (ingredient_id);


--
-- Name: barapp_ingredient_category_id_ccdffc4b; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_ingredient_category_id_ccdffc4b ON public.barapp_ingredient USING btree (category_id);


--
-- Name: barapp_tab_drinks_drink_id_31dc228b; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_tab_drinks_drink_id_31dc228b ON public.barapp_tab_drinks USING btree (drink_id);


--
-- Name: barapp_tab_drinks_tab_id_5aceb30a; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_tab_drinks_tab_id_5aceb30a ON public.barapp_tab_drinks USING btree (tab_id);


--
-- Name: barapp_tab_ingredients_ingredient_id_88d29921; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_tab_ingredients_ingredient_id_88d29921 ON public.barapp_tab_ingredients USING btree (ingredient_id);


--
-- Name: barapp_tab_ingredients_tab_id_df10e8fc; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX barapp_tab_ingredients_tab_id_df10e8fc ON public.barapp_tab_ingredients USING btree (tab_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: janeskywalker
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_drink barapp_drink_category_id_225c83f6_fk_barapp_category_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink
    ADD CONSTRAINT barapp_drink_category_id_225c83f6_fk_barapp_category_id FOREIGN KEY (category_id) REFERENCES public.barapp_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_drink_ingredients barapp_drink_ingredi_ingredient_id_72fee1e6_fk_barapp_in; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink_ingredients
    ADD CONSTRAINT barapp_drink_ingredi_ingredient_id_72fee1e6_fk_barapp_in FOREIGN KEY (ingredient_id) REFERENCES public.barapp_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_drink_ingredients barapp_drink_ingredients_drink_id_e140bc6d_fk_barapp_drink_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_drink_ingredients
    ADD CONSTRAINT barapp_drink_ingredients_drink_id_e140bc6d_fk_barapp_drink_id FOREIGN KEY (drink_id) REFERENCES public.barapp_drink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_ingredient barapp_ingredient_category_id_ccdffc4b_fk_barapp_category_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_ingredient
    ADD CONSTRAINT barapp_ingredient_category_id_ccdffc4b_fk_barapp_category_id FOREIGN KEY (category_id) REFERENCES public.barapp_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_tab_drinks barapp_tab_drinks_drink_id_31dc228b_fk_barapp_drink_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_drinks
    ADD CONSTRAINT barapp_tab_drinks_drink_id_31dc228b_fk_barapp_drink_id FOREIGN KEY (drink_id) REFERENCES public.barapp_drink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_tab_drinks barapp_tab_drinks_tab_id_5aceb30a_fk_barapp_tab_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_drinks
    ADD CONSTRAINT barapp_tab_drinks_tab_id_5aceb30a_fk_barapp_tab_id FOREIGN KEY (tab_id) REFERENCES public.barapp_tab(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_tab_ingredients barapp_tab_ingredien_ingredient_id_88d29921_fk_barapp_in; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_ingredients
    ADD CONSTRAINT barapp_tab_ingredien_ingredient_id_88d29921_fk_barapp_in FOREIGN KEY (ingredient_id) REFERENCES public.barapp_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: barapp_tab_ingredients barapp_tab_ingredients_tab_id_df10e8fc_fk_barapp_tab_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.barapp_tab_ingredients
    ADD CONSTRAINT barapp_tab_ingredients_tab_id_df10e8fc_fk_barapp_tab_id FOREIGN KEY (tab_id) REFERENCES public.barapp_tab(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: janeskywalker
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

