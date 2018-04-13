DROP TABLE IF EXISTS dokument;
CREATE TABLE dokument (
hangar_id int,
dok_id nvarchar(255),
rm nvarchar(255),
beteckning nvarchar(255),
doktyp nvarchar(255),
typ nvarchar(255),
subtyp nvarchar(255),
tempbeteckning nvarchar(255),
organ nvarchar(255),
mottagare nvarchar(255),
nummer int,
slutnummer int,
datum datetime,
systemdatum datetime,
publicerad datetime,
titel nvarchar(255),
subtitel nvarchar(255),
status nvarchar(255),
htmlformat nvarchar(255),
relaterat_id nvarchar(255),
source nvarchar(255),
sourceid nvarchar(255),
dokument_url_text nvarchar(255),
dokument_url_html nvarchar(255),
dokumentstatus_url_xml nvarchar(255),
utskottsforslag_url_xml nvarchar(255),
html text
);


DROP TABLE IF EXISTS dokutskottsforslag;
CREATE TABLE dokutskottsforslag (
rm nvarchar(255),
bet nvarchar(255),
punkt int,
beteckning nvarchar(255),
rubrik nvarchar(255),
forslag nvarchar(255),
forslag_del2 nvarchar(255),
beslutstyp nvarchar(255),
beslut nvarchar(255),
motforslag_nummer int,
motforslag_partier nvarchar(255),
votering_id nvarchar(255),
votering_sammanfattning_html nvarchar(255),
votering_ledamot_url_xml nvarchar(255),
vinnare nvarchar(255)
);


DROP TABLE IF EXISTS dokmotforslag;
CREATE TABLE dokmotforslag (
nummer int,
rubrik nvarchar(255),
forslag nvarchar(255),
partier nvarchar(255),
typ nvarchar(255),
utskottsforslag_punkt int,
id nvarchar(255)
);


DROP TABLE IF EXISTS dokaktivitet;
CREATE TABLE dokaktivitet (
hangar_id int,
kod nvarchar(255),
namn nvarchar(255),
datum datetime,
status nvarchar(255),
ordning nvarchar(255),
process nvarchar(255)
);


DROP TABLE IF EXISTS dokintressent;
CREATE TABLE dokintressent (
hangar_id int,
intressent_id nvarchar(255),
namn nvarchar(255),
partibet nvarchar(255),
ordning int,
roll nvarchar(255)
);


DROP TABLE IF EXISTS dokforslag;
CREATE TABLE dokforslag (
hangar_id int,
nummer int,
beteckning nvarchar(255),
lydelse nvarchar(255),
lydelse2 nvarchar(255),
utskottet nvarchar(255),
kammaren nvarchar(255),
behandlas_i nvarchar(255),
kammarbeslutstyp nvarchar(255)
);

DROP TABLE IF EXISTS dokuppgift;
CREATE TABLE dokuppgift (
hangar_id int,
kod nvarchar(255),
namn nvarchar(255),
text text
);


DROP TABLE IF EXISTS dokbilaga;
CREATE TABLE dokbilaga (
hangar_id int,
dok_id nvarchar(255),
titel nvarchar(255),
subtitel nvarchar(255),
filnamn nvarchar(255),
filstorlek int,
filtyp nvarchar(255),
fil_url nvarchar(255)
);


DROP TABLE IF EXISTS dokreferens;
CREATE TABLE dokreferens (
hangar_id int,
referenstyp nvarchar(255),
uppgift nvarchar(255),
ref_dok_id nvarchar(255),
ref_dok_typ nvarchar(255),
ref_dok_rm nvarchar(255),
ref_dok_bet nvarchar(255),
ref_dok_titel nvarchar(255),
ref_dok_subtitel nvarchar(255)
);


DROP TABLE IF EXISTS debatt;
CREATE TABLE debatt (
hangar_id int,
video_id nvarchar(255),
video_url nvarchar(255),
tumnagel nvarchar(255),
anf_video_id nvarchar(255),
anf_hangar_id int,
anf_sekunder int,
anf_klockslag nvarchar(255),
datumtid datetime,
talare nvarchar(255),
anf_datum datetime,
anf_typ nvarchar(255),
anf_text nvarchar(255),
anf_beteckning nvarchar(255),
anf_nummer nvarchar(255),
intressent_id nvarchar(255),
parti nvarchar(255),
anf_rm nvarchar(255)
);


DROP TABLE IF EXISTS votering;
CREATE TABLE votering (
rm nvarchar(255),
beteckning nvarchar(255),
hangar_id int,
votering_id nvarchar(255),
punkt int,
namn nvarchar(255),
intressent_id nvarchar(255),
parti nvarchar(255),
valkrets nvarchar(255),
valkretsnummer int,
iort nvarchar(255),
rost nvarchar(255),
avser nvarchar(255),
votering nvarchar(255),
banknummer int,
fornamn nvarchar(255),
efternamn nvarchar(255),
kon nvarchar(255),
fodd int,
datum datetime
);


DROP TABLE IF EXISTS anforande;
CREATE TABLE anforande (
pk int,
dok_id varchar(50),
dok_titel varchar(255),
dok_hangar_id int,
dok_rm varchar(20),
dok_nummer int,
dok_datum datetime,
avsnittsrubrik varchar(255),
kammaraktivitet varchar(250),
justerat char(1),
anf_id varchar(50),
anf_nummer int,
talare varchar(250),
rel_dok_id varchar(50),
parti varchar(50),
lydelse text,
intressent_id varchar(50),
intressent_hangar_id int,
replik char(1),
systemdatum datetime,
källa varchar(50),
anf_hangar_id int,
rel_dok_hangar_id int
);


DROP TABLE IF EXISTS person;
CREATE TABLE person (
id int,
hangar_id int,
intressent_id varchar(20),
kontrollsumma varchar(50),
född_år smallint,
född datetime,
avliden datetime,
kön varchar(6),
förnamn varchar(50),
efternamn nvarchar(50),
tilltalsnamn nvarchar(50),
sorteringsnamn varchar(80),
iort varchar(40),
parti varchar(40),
valkrets varchar(50),
bänknummer int,
invalsordning int,
status varchar(100),
källa varchar(20),
källa_id varchar(40),
statsråd varchar(50),
timestamp datetime,
personid int
);


DROP TABLE IF EXISTS personuppdrag;
CREATE TABLE personuppdrag (
id int,
organ_kod varchar(20),
hangar_id int,
intressent_id varchar(20),
ordningsnummer int,
roll_kod varchar(40),
status varchar(20),
typ varchar(20),
`from` datetime,
tom datetime,
källa varchar(30),
källa_id varchar(40),
uppgift varchar(500)
);


DROP TABLE IF EXISTS personuppgift;
CREATE TABLE personuppgift (
id int,
hangar_id int,
intressent_id varchar(50),
uppgift_kod varchar(50),
uppgift text,
källa varchar(50),
källa_id varchar(50),
uppgift_typ varchar(50)
);


DROP TABLE IF EXISTS planering;
CREATE TABLE planering (
nyckel int,
id varchar(50),
rm varchar(12),
typ varchar(40),
dokserie_id char(2),
subtyp varchar(40),
bet varchar(40),
tempbet varchar(40),
intressent varchar(80),
nummer int,
slutnummer int,
datum datetime,
publicerad datetime,
status varchar(40),
titel nvarchar(300),
subtitel nvarchar(255),
html text,
toc text,
refcss nvarchar(66),
url nvarchar(100),
uppdaterad datetime,
storlek int,
source varchar(20),
wn_expires datetime,
wn_cachekey varchar(50),
wn_status varchar(20),
wn_checksum varchar(40),
wn_nid int,
wn_RawUrl varchar(255),
wn_SourceID varchar(80),
timestamp datetime,
rel_id varchar(50),
klockslag varchar(10),
grupp varchar(20),
format varchar(20),
intressent_id char(13),
mottagare_id char(13),
mottagare varchar(80),
hangar_id int,
plats varchar(150),
slutdatum datetime,
webbtvlive tinyint
);


DROP TABLE IF EXISTS organ;
CREATE TABLE organ (
id int,
kod varchar(50),
namn varchar(100),
typ varchar(50),
status varchar(12),
sortering int,
namn_en varchar(100),
domän varchar(50),
beskrivning varchar(1000)
);


DROP TABLE IF EXISTS roll;
CREATE TABLE roll (
pk int,
kod varchar(50),
namn varchar(100),
sort int
);


DROP TABLE IF EXISTS riksmote;
CREATE TABLE riksmote (
pk int,
riksmote varchar(20),
id varchar(3),
start datetime,
slut datetime,
mandatperiod varchar(20)
);
