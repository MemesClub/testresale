--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-24 15:55:17 UTC

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

--
-- TOC entry 914 (class 1247 OID 19595)
-- Name: enum_0; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_0 AS ENUM (
    'На проверке',
    'На упаковке',
    'Упакован',
    'Брак'
);


ALTER TYPE public.enum_0 OWNER TO "user";

--
-- TOC entry 917 (class 1247 OID 19604)
-- Name: enum_1; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_1 AS ENUM (
    'Не готов к продаже',
    'На складе',
    'Продан',
    'Возврат',
    'Гарантийный ремонт'
);


ALTER TYPE public.enum_1 OWNER TO "user";

--
-- TOC entry 920 (class 1247 OID 19616)
-- Name: enum_2; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_2 AS ENUM (
    'Склад',
    'Витрина'
);


ALTER TYPE public.enum_2 OWNER TO "user";

--
-- TOC entry 926 (class 1247 OID 19622)
-- Name: enum_3; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_3 AS ENUM (
    'На проверке',
    'Тест аккумулятора',
    'Готов к упаковке',
    'Брак'
);


ALTER TYPE public.enum_3 OWNER TO "user";

--
-- TOC entry 929 (class 1247 OID 19632)
-- Name: enum_4; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_4 AS ENUM (
    'Работает',
    'Не работает'
);


ALTER TYPE public.enum_4 OWNER TO "user";

--
-- TOC entry 932 (class 1247 OID 19638)
-- Name: enum_5; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.enum_5 AS ENUM (
    'Рубль',
    'Доллар',
    'Евро',
    'Юань',
    'USDT'
);


ALTER TYPE public.enum_5 OWNER TO "user";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 246 (class 1259 OID 19760)
-- Name: battery_test; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.battery_test (
    id integer NOT NULL,
    device_inspection_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    start_battery_level integer NOT NULL,
    end_time timestamp without time zone NOT NULL,
    end_battery_level integer NOT NULL,
    test_duration interval NOT NULL,
    battery_drain numeric NOT NULL
);


ALTER TABLE public.battery_test OWNER TO "user";

--
-- TOC entry 245 (class 1259 OID 19759)
-- Name: battery_test_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.battery_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.battery_test_id_seq OWNER TO "user";

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 245
-- Name: battery_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.battery_test_id_seq OWNED BY public.battery_test.id;


--
-- TOC entry 249 (class 1259 OID 19802)
-- Name: battery_test_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.battery_test ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.battery_test_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 19734)
-- Name: device_inspection; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.device_inspection (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    inspection_date date NOT NULL,
    user_id integer NOT NULL,
    condition public.enum_3 NOT NULL
);


ALTER TABLE public.device_inspection OWNER TO "user";

--
-- TOC entry 241 (class 1259 OID 19733)
-- Name: device_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.device_inspection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_inspection_id_seq OWNER TO "user";

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 241
-- Name: device_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.device_inspection_id_seq OWNED BY public.device_inspection.id;


--
-- TOC entry 264 (class 1259 OID 19820)
-- Name: device_inspection_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.device_inspection ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.device_inspection_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 19494)
-- Name: iphone_catalog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.iphone_catalog (
    id integer NOT NULL,
    name character(255) NOT NULL,
    storage_capacity character(255) NOT NULL
);


ALTER TABLE public.iphone_catalog OWNER TO "user";

--
-- TOC entry 225 (class 1259 OID 19493)
-- Name: iPhone_catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."iPhone_catalog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."iPhone_catalog_id_seq" OWNER TO "user";

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 225
-- Name: iPhone_catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."iPhone_catalog_id_seq" OWNED BY public.iphone_catalog.id;


--
-- TOC entry 224 (class 1259 OID 19486)
-- Name: iphone_colors; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.iphone_colors (
    id integer NOT NULL,
    color character(255) NOT NULL
);


ALTER TABLE public.iphone_colors OWNER TO "user";

--
-- TOC entry 223 (class 1259 OID 19485)
-- Name: iPhone_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."iPhone_colors_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."iPhone_colors_id_seq" OWNER TO "user";

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 223
-- Name: iPhone_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."iPhone_colors_id_seq" OWNED BY public.iphone_colors.id;


--
-- TOC entry 244 (class 1259 OID 19751)
-- Name: inspection_checklist; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.inspection_checklist (
    id integer NOT NULL,
    checklist_item character(255) NOT NULL,
    notes text
);


ALTER TABLE public.inspection_checklist OWNER TO "user";

--
-- TOC entry 243 (class 1259 OID 19750)
-- Name: inspection_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.inspection_checklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inspection_checklist_id_seq OWNER TO "user";

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 243
-- Name: inspection_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.inspection_checklist_id_seq OWNED BY public.inspection_checklist.id;


--
-- TOC entry 263 (class 1259 OID 19819)
-- Name: inspection_checklist_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.inspection_checklist ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.inspection_checklist_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 19774)
-- Name: inspection_result; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.inspection_result (
    id integer NOT NULL,
    device_inspection_id integer NOT NULL,
    inspection_checklist_id integer NOT NULL,
    "boolean" boolean,
    notes text
);


ALTER TABLE public.inspection_result OWNER TO "user";

--
-- TOC entry 247 (class 1259 OID 19773)
-- Name: inspection_result_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.inspection_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inspection_result_id_seq OWNER TO "user";

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 247
-- Name: inspection_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.inspection_result_id_seq OWNED BY public.inspection_result.id;


--
-- TOC entry 262 (class 1259 OID 19818)
-- Name: inspection_result_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.inspection_result ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.inspection_result_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 19717)
-- Name: inventory; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.inventory (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    storage_location public.enum_2,
    added_date date NOT NULL,
    retail_price_id integer NOT NULL
);


ALTER TABLE public.inventory OWNER TO "user";

--
-- TOC entry 239 (class 1259 OID 19716)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_id_seq OWNER TO "user";

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 239
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 261 (class 1259 OID 19817)
-- Name: inventory_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.inventory ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.inventory_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 19816)
-- Name: iphone_catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.iphone_catalog ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.iphone_catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 19815)
-- Name: iphone_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.iphone_colors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.iphone_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 19503)
-- Name: model_colors; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.model_colors (
    id integer NOT NULL,
    model_id integer NOT NULL,
    color_id integer NOT NULL
);


ALTER TABLE public.model_colors OWNER TO "user";

--
-- TOC entry 227 (class 1259 OID 19502)
-- Name: model_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.model_colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model_colors_id_seq OWNER TO "user";

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 227
-- Name: model_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.model_colors_id_seq OWNED BY public.model_colors.id;


--
-- TOC entry 258 (class 1259 OID 19814)
-- Name: model_colors_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.model_colors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.model_colors_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 19650)
-- Name: phones; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    serial_number character(255) NOT NULL,
    model_name character(255) NOT NULL,
    model_id integer NOT NULL,
    color_id integer NOT NULL,
    supplier_id integer NOT NULL,
    technical_status public.enum_0 DEFAULT 'На проверке'::public.enum_0 NOT NULL,
    commercial_status public.enum_1 DEFAULT 'Не готов к продаже'::public.enum_1 NOT NULL,
    added_date date NOT NULL,
    user_id integer NOT NULL,
    checked_date date NOT NULL
);


ALTER TABLE public.phones OWNER TO "user";

--
-- TOC entry 235 (class 1259 OID 19649)
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phones_id_seq OWNER TO "user";

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 235
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- TOC entry 257 (class 1259 OID 19813)
-- Name: phones_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.phones ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.phones_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 19679)
-- Name: price_history; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.price_history (
    id integer NOT NULL,
    model_id integer NOT NULL,
    old_price numeric(10,0) NOT NULL,
    new_price numeric(10,0) NOT NULL,
    changed_date date NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.price_history OWNER TO "user";

--
-- TOC entry 237 (class 1259 OID 19678)
-- Name: price_history_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.price_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.price_history_id_seq OWNER TO "user";

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 237
-- Name: price_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.price_history_id_seq OWNED BY public.price_history.id;


--
-- TOC entry 256 (class 1259 OID 19812)
-- Name: price_history_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.price_history ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.price_history_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 19472)
-- Name: purchases_payments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchases_payments (
    id integer NOT NULL,
    supplier_order_id integer NOT NULL,
    cash_flow_id integer NOT NULL,
    amount_paid numeric NOT NULL,
    payment_date date NOT NULL
);


ALTER TABLE public.purchases_payments OWNER TO "user";

--
-- TOC entry 221 (class 1259 OID 19471)
-- Name: purchases_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.purchases_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_payments_id_seq OWNER TO "user";

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 221
-- Name: purchases_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.purchases_payments_id_seq OWNED BY public.purchases_payments.id;


--
-- TOC entry 255 (class 1259 OID 19811)
-- Name: purchases_payments_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.purchases_payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchases_payments_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 19572)
-- Name: roles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character(255) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO "user";

--
-- TOC entry 231 (class 1259 OID 19571)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO "user";

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 231
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 254 (class 1259 OID 19810)
-- Name: roles_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 19548)
-- Name: supplier_order_details; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.supplier_order_details (
    id integer NOT NULL,
    model_id integer NOT NULL,
    color_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    supplier_order_id integer NOT NULL
);


ALTER TABLE public.supplier_order_details OWNER TO "user";

--
-- TOC entry 229 (class 1259 OID 19547)
-- Name: supplier_order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.supplier_order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_order_details_id_seq OWNER TO "user";

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 229
-- Name: supplier_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.supplier_order_details_id_seq OWNED BY public.supplier_order_details.id;


--
-- TOC entry 253 (class 1259 OID 19809)
-- Name: supplier_order_details_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.supplier_order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supplier_order_details_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 19458)
-- Name: supplier_orders; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.supplier_orders (
    id integer NOT NULL,
    supplier_id integer NOT NULL,
    order_date date NOT NULL,
    status character(255) NOT NULL,
    total_cost numeric
);


ALTER TABLE public.supplier_orders OWNER TO "user";

--
-- TOC entry 219 (class 1259 OID 19457)
-- Name: supplier_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.supplier_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_orders_id_seq OWNER TO "user";

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 219
-- Name: supplier_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.supplier_orders_id_seq OWNED BY public.supplier_orders.id;


--
-- TOC entry 252 (class 1259 OID 19808)
-- Name: supplier_orders_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.supplier_orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supplier_orders_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 19449)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name character(255) NOT NULL,
    contact_info character(255) NOT NULL
);


ALTER TABLE public.suppliers OWNER TO "user";

--
-- TOC entry 217 (class 1259 OID 19448)
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_id_seq OWNER TO "user";

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 217
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- TOC entry 250 (class 1259 OID 19804)
-- Name: suppliers_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.suppliers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.suppliers_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 19581)
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character(255) NOT NULL,
    password character(255) NOT NULL,
    email character(255) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- TOC entry 233 (class 1259 OID 19580)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "user";

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 251 (class 1259 OID 19807)
-- Name: users_id_seq1; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 2606 OID 19767)
-- Name: battery_test battery_test_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.battery_test
    ADD CONSTRAINT battery_test_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 19739)
-- Name: device_inspection device_inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.device_inspection
    ADD CONSTRAINT device_inspection_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 19501)
-- Name: iphone_catalog iPhone_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.iphone_catalog
    ADD CONSTRAINT "iPhone_catalog_pkey" PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 19491)
-- Name: iphone_colors iPhone_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.iphone_colors
    ADD CONSTRAINT "iPhone_colors_pkey" PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 19758)
-- Name: inspection_checklist inspection_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inspection_checklist
    ADD CONSTRAINT inspection_checklist_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 19781)
-- Name: inspection_result inspection_result_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inspection_result
    ADD CONSTRAINT inspection_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 19722)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 19508)
-- Name: model_colors model_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.model_colors
    ADD CONSTRAINT model_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 19715)
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 19684)
-- Name: price_history price_history_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.price_history
    ADD CONSTRAINT price_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 19479)
-- Name: purchases_payments purchases_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.purchases_payments
    ADD CONSTRAINT purchases_payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 19579)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 19555)
-- Name: supplier_order_details supplier_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_order_details
    ADD CONSTRAINT supplier_order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 19465)
-- Name: supplier_orders supplier_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_orders
    ADD CONSTRAINT supplier_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 19456)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 19588)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3355 (class 2606 OID 19514)
-- Name: model_colors color_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.model_colors
    ADD CONSTRAINT color_id FOREIGN KEY (color_id) REFERENCES public.iphone_colors(id);


--
-- TOC entry 3357 (class 2606 OID 19561)
-- Name: supplier_order_details color_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_order_details
    ADD CONSTRAINT color_id FOREIGN KEY (color_id) REFERENCES public.model_colors(id);


--
-- TOC entry 3361 (class 2606 OID 19663)
-- Name: phones color_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT color_id FOREIGN KEY (color_id) REFERENCES public.model_colors(id);


--
-- TOC entry 3371 (class 2606 OID 19768)
-- Name: battery_test device_inspection_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.battery_test
    ADD CONSTRAINT device_inspection_id FOREIGN KEY (device_inspection_id) REFERENCES public.device_inspection(id);


--
-- TOC entry 3372 (class 2606 OID 19782)
-- Name: inspection_result inspection_result_device_inspection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inspection_result
    ADD CONSTRAINT inspection_result_device_inspection_id_fkey FOREIGN KEY (device_inspection_id) REFERENCES public.device_inspection(id);


--
-- TOC entry 3373 (class 2606 OID 19787)
-- Name: inspection_result inspection_result_inspection_checklist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inspection_result
    ADD CONSTRAINT inspection_result_inspection_checklist_id_fkey FOREIGN KEY (inspection_checklist_id) REFERENCES public.inspection_checklist(id);


--
-- TOC entry 3356 (class 2606 OID 19509)
-- Name: model_colors model_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.model_colors
    ADD CONSTRAINT model_id FOREIGN KEY (model_id) REFERENCES public.iphone_catalog(id);


--
-- TOC entry 3358 (class 2606 OID 19556)
-- Name: supplier_order_details model_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_order_details
    ADD CONSTRAINT model_id FOREIGN KEY (model_id) REFERENCES public.iphone_catalog(id);


--
-- TOC entry 3362 (class 2606 OID 19658)
-- Name: phones model_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT model_id FOREIGN KEY (model_id) REFERENCES public.iphone_catalog(id);


--
-- TOC entry 3365 (class 2606 OID 19685)
-- Name: price_history model_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.price_history
    ADD CONSTRAINT model_id FOREIGN KEY (model_id) REFERENCES public.iphone_catalog(id);


--
-- TOC entry 3367 (class 2606 OID 19728)
-- Name: inventory phone; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT phone FOREIGN KEY (phone_id) REFERENCES public.phones(id);


--
-- TOC entry 3369 (class 2606 OID 19740)
-- Name: device_inspection phone; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.device_inspection
    ADD CONSTRAINT phone FOREIGN KEY (phone_id) REFERENCES public.phones(id);


--
-- TOC entry 3368 (class 2606 OID 19723)
-- Name: inventory price; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT price FOREIGN KEY (retail_price_id) REFERENCES public.price_history(id);


--
-- TOC entry 3360 (class 2606 OID 19589)
-- Name: users role_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3353 (class 2606 OID 19466)
-- Name: supplier_orders supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_orders
    ADD CONSTRAINT supplier_id FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- TOC entry 3363 (class 2606 OID 19668)
-- Name: phones supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT supplier_id FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- TOC entry 3354 (class 2606 OID 19480)
-- Name: purchases_payments supplier_order_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.purchases_payments
    ADD CONSTRAINT supplier_order_id FOREIGN KEY (supplier_order_id) REFERENCES public.supplier_orders(id);


--
-- TOC entry 3359 (class 2606 OID 19566)
-- Name: supplier_order_details supplier_order_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.supplier_order_details
    ADD CONSTRAINT supplier_order_id FOREIGN KEY (supplier_order_id) REFERENCES public.supplier_orders(id);


--
-- TOC entry 3370 (class 2606 OID 19745)
-- Name: device_inspection user; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.device_inspection
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3364 (class 2606 OID 19673)
-- Name: phones user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3366 (class 2606 OID 19690)
-- Name: price_history user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.price_history
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-05-24 15:55:17 UTC

--
-- PostgreSQL database dump complete
--

