--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-18 18:55:18 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 51239)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliacao (
    cod_aval character varying NOT NULL,
    ds_email_aval character varying,
    cod_post character varying
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 51245)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    comentario character varying NOT NULL,
    titulo character varying,
    data_hora timestamp with time zone,
    id_postagem integer,
    id_comentario integer NOT NULL,
    id_usuario integer
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 51251)
-- Name: denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE denuncia (
    usuario integer,
    titulo character varying,
    data_hora timestamp with time zone,
    conteudod character varying,
    id_denuncia integer NOT NULL,
    postagem integer
);


ALTER TABLE denuncia OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 51312)
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE denuncia_id_postagem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE denuncia_id_postagem_seq OWNER TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 190
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE denuncia_id_postagem_seq OWNED BY denuncia.id_denuncia;


--
-- TOC entry 184 (class 1259 OID 51257)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    conteudo character varying NOT NULL,
    titulo character varying,
    data_hora timestamp with time zone,
    id_usuario integer NOT NULL,
    id_postagem integer NOT NULL,
    foto bytea,
    extensao character varying
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 51263)
-- Name: sq_comentario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_comentario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_comentario OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 51265)
-- Name: sq_postagem; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_postagem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_postagem OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 51267)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 51269)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tema (
    cod_tema character varying,
    cod_subtema character varying,
    ds_descricao character varying
);


ALTER TABLE tema OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 51275)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying NOT NULL,
    nm_nome character varying,
    ds_senha character varying,
    nr_cpf numeric(11,0),
    id_usuario numeric NOT NULL,
    admin boolean
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2051 (class 2604 OID 51314)
-- Name: id_denuncia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncia_id_postagem_seq'::regclass);


--
-- TOC entry 2188 (class 0 OID 51239)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (cod_aval, ds_email_aval, cod_post) FROM stdin;
\.


--
-- TOC entry 2189 (class 0 OID 51245)
-- Dependencies: 182
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario (comentario, titulo, data_hora, id_postagem, id_comentario, id_usuario) FROM stdin;
\.


--
-- TOC entry 2190 (class 0 OID 51251)
-- Dependencies: 183
-- Data for Name: denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denuncia (usuario, titulo, data_hora, conteudod, id_denuncia, postagem) FROM stdin;
\N	\N	\N	\N	1	\N
\.


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 190
-- Name: denuncia_id_postagem_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('denuncia_id_postagem_seq', 1, true);


--
-- TOC entry 2191 (class 0 OID 51257)
-- Dependencies: 184
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (conteudo, titulo, data_hora, id_usuario, id_postagem, foto, extensao) FROM stdin;
ibics	ibics	2019-11-18 18:49:33.955-02	10	550	\\xffd8ffe000104a46494600010100000100010000ffdb00840009060713131215121212151515171817181517151615151618151615181817161617181d2820181a251d151521312125292b2e2e2e171f3338332c37282d2e2b010a0a0a0e0d0e1b10101b2d2520252d2d2d2d2d2e2d2f2d2d2d2f2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110800b1011c03012200021101031101ffc4001c0000020203010100000000000000000000030504060002070108ffc4004410000103020403060501050505090000000100021103210405123141516106132271819132a1b1c1f0d114234272e133526282f107437392a21524345383b2b3c2d2ffc4001b01000203010101000000000000000000000304010205000607ffc4002f1100020201040103030108030000000000000102031104122131410513225171813214336191b1c1d1e142a1f0ffda000c03010002110311003f00e3ed08cd0b56046685638f5a115a178d08ad6ae20d9a115a178d6a335aa483d6845685e35a8ad0a4e31a111a16d469c98dbcf65bb5aa09c7931ad46635631a8ec62920f18c476316d4e9a934e9a838d194d4865244a74948653504e01369a2b69a2b5ab7017120c535b062dd7a171383c0d5bb5a86faed1b945a5501d9464b28846354963505955a0c1709e5227d948a755a76214649da785a10cd4130bdaefb1849c979e7e8a52c895d74a3d0df58d978f6a0e0b0c772898baa19ba87fc0ef7928e67c0af318093bf1303747cdb1b361c5407513125113c2303535abadf8728838dc62495eba698ea400d922c4b48e6812690ed1a5da81d7af2a13deb67ba505e15226842091a54958da051994092253ac3e04168e099824c6ea71c722f6845685ab423342820d98119816ac6a335ab8e3d68520d22227889f4286d6a300a483d6844685e3422b42938f5a1198d5ab5a8ec6ae38d98d52a9b169498a65262838f695352a9d35e536a90d0a0b18d6ad7178a6d2617bcc0103d4984568487b55543e93a97125b1e84195c5a2b2c7dde8899b2062332a6cddd7e42e5559952ab80926dc16dfb138993baa39a4163564618acfcea10040e04ee7d14539fbafc49f6fe8143ab85010aab03401cd0fdd430a8075f34a85d3337999f6b745bb339abfdf27a0b0feaa351a06a3f4b6ffa4c0f5572c2f675b49b2f02636de27a9f6f7eb149dca3d8c42b2bb87cdb11b300ff0097fd07b84639b6289bd623ca23e499bb0464889e82c3cc95a3300e26409f216f754f793e83fb1c7447a799571fef49e7e194d32bc755377091fcb1fa23e0b0878b76e727f3d94fa782993aa3a285379ecc2f53bfd98e1432ff0004fc1e2350e0a3e63872f13c949c3611d1623870521f477930ad2b7dbe4c04a5ad834d3453ab500e31cbdd1c6064594fa982871238a9986a56b84296a5cba2fa2d3fb19deca9e2b2b332764971f940b9055f31edd2d27a1552cc71834db750e6e48a6a6567babdb6541f842d7195e8cb0c179b00e0238c904fdbe614dc562f5088bad5b549d2c1c093ea77fa47900895b93c0d427369b976099839d959f2dc35514c0d41a380d20d8de656613297168ab12de437f38e29ae19cdd3c4a7e29a4574ee539e1f5839db023d36a1b02954ad7506a8c2a53636981bbcdcf20387aa8a02d45ee8ad0a231c17b27bba46cd08ad0bc68446857066cd08ad0b5684563571c6ec6a934d8874c2914c2838353629749a8548239786892a0b241459653ab693b44ca4d89c63aa186d80db9eebc707d31178234fb90555cd20b1adb1862332866a0226cd0627cc84aa9d173cea324f328c291790002605ad2a454aeda2d25d36de52d65eba4315d0cd29508e1f9d16f8c76968037373e7c07924f5bb54c04c34741f593f6493139ed4a8e267483f0b45bfd7d50942737c875b6233ab8905d13b1b99b08fc950715882e30ddcf847af0f385a55c2bdac06e4bb60a452c13a8ba99744ccf91fcfa2270822cb2e9d94cac528060bec5c7fba39f9dfe7ea9ee3407383780bbbd39fe702ab394e701a0dfe22493c66ff00741ab993decd2cdcfc5e4d2607bacf9c6729e58ed75a2cb86a22a38c091361fc23cffbc7a6c997ec078dfa04a7b3753c00ea93fe23004725617619ee1301dd03adeb0832724f08bcd24f1e05d56806989ba2e1e88e2b6ab87adfdd6b074127de508d170e67dd4c67211d5e8e372c121d5436cd2b3bc05b737297622ac22e13c637fd503537b8af93c215afd32152ca5c86a65b305798820031ba8b88a45bb0fe8a2e2f17a46f7fba5e3ac4e588f427a9d1cb6f5c9033ec67874cc46fcd50f115ae649833f5561cdb161d326eab2696a7c4adbd24bdde0c9ab452ab74e6ff0007b468982f3e87afe49f658c681b27eec3b1c1a1b0d6b447f33b892a2e1308d754222406cf3e22e3c96c474cd2c89d9a88b6d47c1372ac6d4634b5cd7df6107dc1473893ca3a29f5db64aaa36eaaf8e0d1d256e31ce4ab30233421b423b02e4366ed08cd0b46046685271bb1ab7685e3422342e38d9a11e9b568c099651872fa80013173e42e55672514db262b2f0005323747a414acd2b07be408e1ec82c0ab093714d969c52784143a0494b2ad63509236d91b33c4696c0dca52cc458fd956c6fa42da8bdd31ca434c3d46076e368f5dfec9d50c2fed155807c0d00b8f3274e903d6573f38e0c7c9048e36e0bacf675eca94a93a9d9a4785a041db89e42e7ad921a8dd08ee347436a9a331b85a749848b01b9fb2e6bda0cd0557436cd1b73279f44ffb4f9e1ab5dd86a2cd45b68e647117e69ef667b02c0455acdf16e1a761b2a515e3e72fc0fce492c239b603b235ab104b4869e2eb7c939afd956b64b3f81bc7726483f285d6b1d846b1860016293665978a34b5cdcdcf32131ee4e4c0a51473ac7e602937486f8dd0298e33693d23faa83ff6462ab3a5d60d924f28fc8417612ad4c6c17101ae25a62d11223aefecba7e4d903cd30d7543d7a9dff3cd4b5ede31d8453dcb929995646f0c2620f0946ca9a69543ab63c62c0f2f256fc460fb92ed9ced8823a7fa7ba4f8d7b4c991ab6036bff85bc551add919aecc12a962430cb62ff10b6e37dec9fe5999308be8f660f98715cd712f7b00693b926c49927cf84291431d5234b59a8ede38227a02d83e40a4e7a692e875b84e074ea98d60fe8e3faa835f16de5ef23eaa9b86cc1c3c151ad63f71a439a0f503f43e885533d2cb1ab4c8e1bfe8ad5c1f4c0a824f82cb5a0f928389ef2937531c627a484b68676c71e0df2dbe6a68c535c0b77077081a8a233ec6d45e0f69676e20071bf349737c5174c6ca3d50f63dcd3c363cc6e0fb4223a9970494698d72c8b5f04d15bc73dc79a5f4eb10e12ad35f0569891e5694ace5d2f885e8f4189630796f51b362e7a1be16b0a9460882df9a69d9d6c0775800f94cfd5578d32c6c2b0f64a8bbbb738ec4dbd16d4dfc793ce5153959f0eb24ac525154dd38c708496a6e9267a28d7b515c60476042604760507046046685a3022b42938dda115a16ad08cc0b8e36604df2991316917f2e495031bf3007994d29bb4b7a9fa20d9f2582d1ecf311baf18178d128c042ba58582b27e4af67b4f4d56b893a5c36e123f02df0d426e04a698faf4f4e97099f651708ed0205f979205b9f02974e37c7645f241cc304c23c2d74cdc1f6b2bacbf0b84a549a436b3db30770d3d39c15ef65301dfd50f7821adbdf8941edb5173f1ecdb4b5ad23a9bdbcac7d92d776a0feec3fa3d32ae3294bf03aecd767da3f7cf12f75cf113cc0e099679da9c361086d6aad69f3e5c3f392995315dd61fbc00921848004f0e0170fc0e4aec4d7ad531da839c09a65ad7b981e4dc4305f4c445a512b8a69b66a4e4f2771c8736c363a6a52707165880646dcb8eeb7c7e5bdec836bfaf45cebb1395b70d9800054650769226585cf631c4173776b5c41b1dc4735d66b621a01248bfd15dc52e7f2429339076c329a943154dedbb0b606fb8dcdb8fe8b66f6a2a5082e8730d8116bf23cbe69976df31ef2a0686cb1b2756c67ecb9ce7189925a6debd66ea211537c9794dc62746a7993ebba9bdc3bbd6e0d60900bcc4dcf0092768f2e22ad4753a8caba3fb468749613cc46caa9db4ce353685164f85ad702d3c088811c6c3d92cc360ebb62b61e9576bb931955d6e378dbce5155585c1557f259e8b83ac4e93f546a397550e0fa6fdb8024823e89461b16e30eaad735c7791a41f6b7a27d93e2c6b01c047a0fb21d9178e0d1a6d5e4b23705ded197b0736982208f2b8f31eaab18e02ed25d49e383c07b0f93c0fb2b8d4c4359f18227e1f1123d05956b32c400ee058eb78848693c0ff84f3e1e8908ac31cad6ee8ac38bb541dc72d8fb04f32d25a2494b3b91aa402d13b6e27a23d5ac00e33f9b2eb16e638ded8e1929d8b0eaced4350802262fa605fa1ba9a5874754a3094c825ef8bee54919a0692679797bf0e0b3ed8b94be22d2595c93e8c31be3b71bf1e1faa5f5ebb43b85fd7d127ccf389b6abfac0bec9354c6175b7fd16e7a7d96d78ca3cc7aa7a6c2e4deee47f52b073ac642b9f67b0a5942488d44b87910003f25ceb03a8705d3b24c41341bab6d87905b5296e88afa7e9214bc4bb21e3db292d4a774ff0016e49aabae80d0e5bb4ab3023b0213023b0210a046046685a3023302938dd8119a17948c22b028382536ec8e4c9426233028c1215a2c97e3b147e11645af888df648b30c590752246262d96d96dfb23c21a53a61f127652a95182070e0555b0b9b5e1c63914c3038a2fa848261bcf994bcda530b5d337a98c60b1f57fc3c9d33b3d8a0c6c0e08188a1ded724ee04b7f94807fa7a94bb26d4d0d3eaeff3100cf9029e301d408e80f9701f259f6bcccf4f5c7db581bbf51a513a79f3039049aa63ea533e303bb901a034347913b9f3567140bf4b47189fa9f92076970b4fbbeeb88f1136863799f9fcd1631693646e4f82bb8bc4b6b16c01a89d40817b0027cb80f30a2e6f9d398d317b4c6d1ebc1118ed20864ea7c5a01d204c367c893cfc47c842c76168323f69ac19aa65ae300ec6c4f1b70eaab1839bc9326a28475f32159a5be11fe21cb8413b9ebd3d154739af4c10c31b9d4ed306e77e6af19ae2b2fa4dd46ab4b8c4012d7c0b5c71fcb715cff3f6d3738398f0756cd00edea374ed50698bd924c898ac0774e6bf58734c1691fc245e08f9aed7d8fed28ad87631ada4d703e20001bdc100755c4a8be1a5844ded7983c937ecfe62fa2f05bc3f5d91a4b31c3291ef25efb619ed37eaa3528b4386ce0003e6aa7878817e923e454fcfebfed6def1a3c4d13d7ab4fd525a3521850250c21cae65829639dddb98e01c0703b1e44723e48397d4151863870e638a5f46b78875b1fb7cd1b25796d5102c1d7f7495913674a7a6996c8991c142c3b89719bc2b7e272f6b8973369b8f9fdd2bed1617433532d362425673f18ec6e525910e658e3a4341483158d2662c394cfa4a363889f099b0f78b8f794baa04dd1545232f5763f04ac60a70d7537b9d3f107000b5de60f14e72eca1e59af4a4794d02eaa0348179bed65d43050294bace00f913ccf0dd3f0e5e11e2fd535f669e518279e79fae0aee072ca9ac3749990af2ca3ddb03390f9a83d9dc6121e5c38800da080a656ab29addc60d2a6d8ce0a68878a4aaa36e9e63980b45a0f39dedbfd52570564b3ce05ad9b4f192b2c08ec082c521812c8385604660436047605c7046046605a3023342e38352300d85fe5e4b60b568452cb284449f047ae1b1323ec91e7aea668975c3f603840993d10738716bf435d6e9f74beb385521a5c18d8804cc5b89f3457628c1a23d3e31946727159ebfd884492af791e0f431b3b9dd5770782e8af787c393a48d92b6278c95d35f176607597878a8d00134dccf147f0904697795c83e9c93ec10e27611fa9fb28996b7c223783eca2d6c616b4b7693e513c12728729b353394745c04359acee761e6a2b708d792f75c389df686ee7d4dbc824bd9dcc0d6a6d32769f21174febdc064c340831bf97dd32dac67c2fea557656f35ecd3abd3070f58d3769aa2c601ef2e1db6e2de8b9966ff00ecb31d4077fdebaac4b8e8f89a4096c173a49981204aeeb85a600b08f995be6589a74a9ebace01a39f1e91c4f456d3b7b4a5b86cf92b14ca8f3dd060d6d73b596c92e74d801307a0013ec17fb34c6bda1ef68a60de1d3a80e6442ba6559f6170d99e2316683cd0ab259518cd5a2a4343ce91702ee33bf88ae8587cf7078c66ba159afe60121c3982db11b8f74c4bec0124fc9c4aaf67696169b83dfadc48dad1cadc38ad3b3ef632b80ebb5f1a4916bf03f2bf45d273ca2d25c1bbd886bc07b7df70a9f99e0e8eb87d334cff000b99b19e36b1084ace7918d9c7049a981342af78d6f81c61cde5cc7ce47a84b73ba74b5cd23c46a1d0ef6e69be4199b5c5d86c419b00d71fe21c0827f887ea93e75870cad0083d4711317ebbab49f016b8f3c909ac8207231f9f9c138cbf0de39e0e36f555fc457d2fbdc6abc6fe43e4adb91e25af697917b6903613f9ee90bb2964dbd335819e4b3add4c8b387fd6de3ea8f99619ba0b48066d747c3bc6aa2f60b4b5aef683f75ee72c9635e2ed260f42edbe76f548d91cfe025af2d339163e8789c07027e4973dbbf2562ce30d155c22d33cb7012a7e149d9395d9c0bdd5a6b27997618c3aa682e6b3e2238719b704cf17da7d6cd0d045a3745ecfe06b375b037c35187a8300e9f9a594fb3b55a7c4de304489f41e4998a4f94cf1faea2a95ae73f1d175ec79ff00bbf1de6fcd34152f2a260a8b69530c6cc75fd17bde71476fe8174d16a0b3ff00b937cc31126762973aa2cc4d692a3928f5b78c01ba49cb22ea740a90cc39511854861431ccc3e84b661ca92da161b284c2a430aee09dd0fa12998728cdc3951e8b49dbcd1e985d9446e87d0934f0c7a283da0ac194f43491526641b06f2f544cc312ea74f5b786f3d7faaa6e2eb39ee2e33ccf247aa9f7056dbe39d8a3f70350384ceff92a33fc4e0070467537112b3094483308af4c9cb08a3be11af6c0699753e6ba2e0f04dd9b200023e4aa39650902226615e32d741e804a2db428c7183ced9af9d36fc704f6e1b443f8090e8b10091e21e4403e52879b619b54384454d23a1206ce03c8edb84ca8e2807f76459cd241e16b41f74a31c0b6b9d46ce0343a6e1cde1e7137e21615eb07a9d1ea5dab2c4797e6b530e344868ddeee8368f75d1fb3d88d787a6fd8b86a33bdf9f5549cdf2bef5bada017b6ee6f07758e07e454cc97382ca658649171d4c155df989a6a25dabe634a8b1d56a3a1addcfd001c493023c95130f43119a3ce22b0eef0b714584cf7ad07e3747fbb8bff008e07f0812e687677f6f6d37e29c7b96bb5770df85f121a2a9e238968dd5b312c01b1168d85879797e898adbd806696e28f8dc85ae6b58d610600643b496b9a1ef690781f009fe654eed07646ad2151f876fef0135b54013aada5ae64169171d49049b05d441fdf92efe10d701c03b43811f351b38cbb5dcb8c1a7a6248b3a01b8bf117e92acb288691c5f2aed639c0d2c488a8c3126ce306f31fc43a6e991c7eb1061c06d3bc1e04f1b83753bb4bd98655a6daa5b2f12d71d9da871b7199f9aa252754a45ec24c36e0f36b881f23a7e6ba70cbca2f54bc318e68fd5534c5f7a6e1c48dd8791dbd639a8eeae4817249e696d1c51739dabfbd23a386de5b396f8bac5c750e04c8ea3f8879efeaa31c60623247b89a9241ea2e37d95a320ab148f3dbeff7555c3692e6eb716b49b91720472f356fece539a85b10db691eb61d4a575185034b4bde596f73bbba1488deee8e70c27eae6a25aa522c6f83536403fc2e224474e23fa281da6aaeef69d268b69127800e7489e566354ec1629a4318f669744027796dac791005baaccb24e31fc0d6731cff0011067b94cf8b8968b4753292603272fa9a0b4c731c3aabde7760001b489e86e140a2fd23540d5b2421aa945fc85aeb330c2ec9186c10a745ac041d2224714a2b5683d533c3d796106c6e7d125ac4389d2663785b7a69ee8e4c1b6715f17d82ad88516a626d0858a7c18fad9417d59365a30e44acb31c124d55a9aca33de83df2614b021665b08c524b20dd6b81a60bafc2e8f505d0777cb068e79c1eb0290c4263548a6cdbcd589245108ad5e52a2780525b867710a3009cd1073cfec1d78b8f5bedf9c954c568bdae2083c655df12fa7569d4a4d73756970d2480e91b183d61739a27c529fd35feda22c6a397e4b2e5b85fddcc1266de48f87c01d8b77d91fb3cfbdd5a28532e0e3a0436e6e36db8efe8988589fc8f25a8d4ce13714b257f0b4b4c74fb2b11ada7e487472c24cc597b9a53d23d94d93dd2c15f667656ecc0c9f58d4a7e130f025a79185269e09d5a837be10fe0e1d3e170e476b7a24381c416a974b31a94cb60eb6171f00bb86f31d22eb27534fd07fd3fd41c6c59fb7fb21e2b3a7616a8ef478418744cc7170e638c71f30a5e38b69d56542468a80b9b1b1b44fb3a56ddb1c332ae1fbed3ab4098d8c47fa7b2a4e1f37755c18933dd3e3d26c3da3e693857986e5f63d8577373dad718ce7fb1de726a83ba6c7208b8ab92790b7c954bb319d02c6871d80fac7d9592be20776f2394fc934b09609ede45586a935ccf16827d442cc6d5d74c3c1dbc3fe575bea3e4abcccd43716ebdbbb803a8bfff009ff994efdac330f4e4efdd7ceb347dd4449904c7501aaa03b3a1e3fcd73ede25c8bb62f6d2acf645c883eb7fa81ecbaa54c587d2049bb5b5693bce9b8c9ffa4ae1fdafc7f7d5438ee0693d4b6d3ee0a23592b1781697ddc7c8fad81fa94761b9e7f76edf291eaa1d137f311ee8f4aa71e3bfaeff00aa1c862ae58cf2ca61d51a0b9ad69932fd80d24ff4f656ec95f3568b8581968e85bb7eaa9b846dfe63c889fcf2569c96b780c6ec22ab7fca61c3d41f9252d595834e32518f032ed166a1b8e0edda5d4c471d2d06437fc4761d48568cbb12dd9ccef0101cd711f15375db5699e362246e0f9db95f69f1c46229d6699048781c039ae1623d07baeb9d898a9847619a7c547f79409bfee2acbe99eb12e691cacabfb32b222d66a36bff00a27547532d01dd2f1edf749730635a0c71fcb2362319a985ed6da74b9bfc54ea35c2587a784c25e6a6ab72d979ed47a7baac4db17b753e1093178b23e1e36f35230f872ca7acda666dd2debfa044ad870db917fa25b5f18e748d5e11668e03893e7b2d2a9e128c7f267fb2da95d3f1d7dc858ca93364be88f109da7e4a6630d9422775b7573130ddad5996695eacb8edc7a0510d45b55515c51b08229b9725a7078708fdc025466626029182a8088e27dca2aa97643d63c8665264fc56f652194401378e6547ab14cc9f848f651ebe61a87d15dc2084e7afbdb6b034fda47745cd2010e00026e45a52ccc71a1c469294d5c5f040fdad5be0906aefbd45acf645cddf73c4f150b05f126589607c755230182136dd2b39c77602bd462bf9763cca6958474573c972f920ba6156729669024715d2324a6dd0df245dfb61c18fa6a56a35387d2e4934b2e102cabbda3c2413f9c15d1c4424d99e175efc175337bb2cf4d769e1ed34505816f42bb9ae91b836ebcc4f3852f1d434ba22ca3d168d6d9b806e9fb2b4d1e262f6dbf91d51c40ab4dd1b3b9f0d5cfd42e6998d2ee4d6a0d11a8eb1ca41903a5beeba2d161b965f791cc25599e1185e5c5bf134883cc0597552f7b8af27b07acd952b1ace0ad76773178204900e91ecd33f357e6768b5f7d4e60f76e8f3d2d88f754876145333699e1103a05129e2cebd4371e13e5103efec89769bdb8e73c84d17a87ed13c63826d0c71f1d43bf771fe6f003ffc7f352bb659c9a4d0c07fb2d063ff00543bedf251b04039d045b5343b95c03f5007aa41da0c4f7a2a03b901ded508703e51f348c26d3c1bd2ad3591be3bb4e1aea85a7c06ab63a87fc5ff00dcfa85cf7195753c9ebf65ed6aa74961e0efa08082130298e4dc3a208fc845260fd3c8dc7d5475beab03cadfa7e745561632c0e32f7ddbec7dedf584d720c44570de05ae6fbf0f9a4d80a8dd312664f941001f59011b0b588ae0f277dd2f25cb1eddc2e4ccea818da74548f475bea07babc763f3e75260732f530d12dffccc33dd0f60f222479854fed1b881560ff1327a83fd404cbb3598b6938b4825ce2d88df4e97b5cd8eb2b94b6f253629c24bce57f73a7f6a5c30f55b8ca5e2c3d7f0d70360e81a1fd2769e60712a3be9340d6dbb4899e6787970b25d975473b0f5b0af24b7613c03aec701e9b744add9b8a4dee89d40723c7a24f57b66f6f901b62d7c8db1f89326763bf925ef6889d87e4a558ecd0bcc027741ab8d3100a1535493466eaec6a0d67824e22aca8b55cb283d15ed90b520f079ee9f22ca8e40715231144a8c699464c721868735b121a2082645a143a18a7020dd28a95e39fe6ebdfda8262524bc931d2e160b156cd0bece923d96b5b136955f6628231c588fb714395b16fb28f498e9129f8a0826bca80eae17adae14ef8fd461518199c544426996e677880ab9df7253706eb8281249c805d445c7945ef0388957fece552593d1731ca5fb0577c8f1b034fb2652cc308c7d34e346a32fa2df4df2515d4e6540c1d794ce83ac7aa96b07a4ab5319ac22a99de1e27f38aad553a4fd55e337a72e23acfd08557cdb09e21637988bad0aed4e291e6b5da29d763b3c1a60715a614fccd82ad22e6fc4dfa8dd25a34c8317853f09574542d3f0bc7cc0fd212fb313dc8342fcd7b24b87c15ec610472207b93c7a2542946a8e608f74fb30c3438d8d8a58fa5631f979fb262e86f59477a75eab9ed6cd291d34cd4e80fa83fa1f92ade68dd359cd9b4c8eb4ea7fa4ab1d7a9fb97083631f9ea9457c30aa5ae1b81a4ffcc5cd584ebdb2793ded73df0582a7569dc8e56f65a369d93cc560c073adc7ea54675111308c9a0728722a7356a0a995a85a4031312a296aec147168978272918592f9f5fa28f801323984c7034a01772fcfd1067c05836cd735ae1fde09ebeac1fd0a69d9514dee797b831e031cc7880416874c7cbcd57d8d8709db8fdd5a323c93ba6d4ab598eef29b9a1ad311a34ea73c8e367363d792aca2ba0b09779f3feffc8e6866b500fde08739a0870100b770ee96954fcd716e2e333bc9e4784ab6e639932ad3d4db16c88e522081d082553eb50d4e943f6e2b3215d55918accb8002b10dfcfaad69d424af2ad0772527014373136b7456584b2674a4ae7b506a2f852db552e22e8ec7a22899974137c120ba101cf5e17d900b8a91aa57c45559042c5889676311e8dd8b672c5880fb3bc833b7afeab18b162b22de03d14d305c162c5d1ec5351d167caf82b764ff0010fce0b1627eae8f2da9fdeafba2d197ee9f61562c5d69b9e9a2ccdfe33fe5fa25b89f89be47e8162c56afa5f61df50fd1fc84add9ff00cdf75e633e26798fa058b132bf51e69fe8fe5fd40665f19fce0921e2b162657eeff0529fdfbfbff720d7f81fe9f550328f89de8b162c4d4793e87a4fd288d99fc6f4bea7c07f38ac588111999ed4ff00c31ff883ff0069491cb162eafcfdc9d4751fb1272ff8826d83d9deabc58ab60381129fc43f987d02e9dda7feceaffc0fd162c559f82f129953e13e43eea261f758b155fe8666fab7e97f6ff066278ad705f054fe53f50b162eff008ff233b43dfe1ff4023ecb02f562685e7d9e14172c5887e46eafd28fffd9	image/jpeg
\.


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_comentario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_comentario', 1, false);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_postagem', 11, true);


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 14, true);


--
-- TOC entry 2195 (class 0 OID 51269)
-- Dependencies: 188
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tema (cod_tema, cod_subtema, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2196 (class 0 OID 51275)
-- Dependencies: 189
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (ds_email, nm_nome, ds_senha, nr_cpf, id_usuario, admin) FROM stdin;
sa@gmail.com	sandy	000	\N	10	t
\.


--
-- TOC entry 2055 (class 2606 OID 51282)
-- Name: pk_cod_aval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT pk_cod_aval PRIMARY KEY (cod_aval);


--
-- TOC entry 2068 (class 2606 OID 51286)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- TOC entry 2059 (class 2606 OID 51288)
-- Name: pk_id_comentario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT pk_id_comentario PRIMARY KEY (id_comentario);


--
-- TOC entry 2063 (class 2606 OID 51322)
-- Name: pk_id_denuncia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_id_denuncia PRIMARY KEY (id_denuncia);


--
-- TOC entry 2066 (class 2606 OID 51290)
-- Name: pk_id_postagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_id_postagem PRIMARY KEY (id_postagem);


--
-- TOC entry 2052 (class 1259 OID 51291)
-- Name: fk_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2053 (class 1259 OID 51292)
-- Name: fki_email_aval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_aval ON avaliacao USING btree (ds_email_aval);


--
-- TOC entry 2056 (class 1259 OID 51293)
-- Name: fki_id_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_postagem ON comentario USING btree (id_postagem);


--
-- TOC entry 2064 (class 1259 OID 51294)
-- Name: fki_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario ON postagem USING btree (id_usuario);


--
-- TOC entry 2057 (class 1259 OID 51295)
-- Name: fki_id_usuario_comentario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario_comentario ON comentario USING btree (id_usuario);


--
-- TOC entry 2060 (class 1259 OID 51334)
-- Name: fki_pk_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_usuario ON denuncia USING btree (usuario);


--
-- TOC entry 2061 (class 1259 OID 51328)
-- Name: fki_postagem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_postagem ON denuncia USING btree (postagem);


--
-- TOC entry 2069 (class 2606 OID 51296)
-- Name: fk_id_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_postagem FOREIGN KEY (id_postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2073 (class 2606 OID 51301)
-- Name: fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2070 (class 2606 OID 51306)
-- Name: fk_id_usuario_comentario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_id_usuario_comentario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2071 (class 2606 OID 51323)
-- Name: fk_postagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT fk_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem);


--
-- TOC entry 2072 (class 2606 OID 51329)
-- Name: pk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY denuncia
    ADD CONSTRAINT pk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-18 18:55:18 BRST

--
-- PostgreSQL database dump complete
--

