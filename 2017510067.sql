CREATE DATABASE db_2017510067;
--Universities table attributes
Create table universities(
       "University id" serial,
       "University Name" VARCHAR (50) UNIQUE NOT NULL,
       "University Address" VARCHAR(100)NOT NULL,
       "University eposta" VARCHAR(20) UNIQUE NOT NULL,
       "CITY" VARCHAR(15) NOT NULL,
       "University_type" VARCHAR(10) NOT NULL,
       CONSTRAINT CHK_universities CHECK("University_type" IN('State','Private')),
       "Universtiy_offoundation" VARCHAR(10)NOT NULL,
        CONSTRAINT PK_universities PRIMARY KEY ("University id")
);
--Faculties table attributes
Create table faculties(
     "University id" int,
     "University Name" VARCHAR(50) NOT NULL,
     "Faculty id" serial,
     "Faculty Name" VARCHAR(100) NOT NULL,
     "Faculty_eposta" VARCHAR(50) UNIQUE NOT NULL,
      CONSTRAINT PK_faculties PRIMARY KEY ("Faculty id"),
      FOREIGN KEY ("University id") REFERENCES universities("University id") ON DELETE CASCADE
);
--Departments table attributes
Create table departments(
   "Faculty id" int,
   "Faculty Name" VARCHAR(100) NOT NULL,
   "Department id" serial UNIQUE NOT NULL,
   "Department Name" VARCHAR(100) NOT NULL,
   "Deparment email" VARCHAR(100) UNIQUE NOT NULL,
   "Department Language" VARCHAR(20),
   "Department educationtype" VARCHAR(20),
   "Department quota" int,
   "Department_degreequota" VARCHAR(15) NOT NULL,
   "Department_educationperiod" int,
   "Department Scoretype" VARCHAR(20),
   "Department_minScore" float,
   "Department_minOrder" int,
   PRIMARY KEY("Department id","Department Name"),
   FOREIGN KEY ("Faculty id")REFERENCES faculties("Faculty id") ON DELETE CASCADE
);
--Students table attributes
Create table students(
   "Student Id" serial,
   "Student Name" VARCHAR(15)NOT NULL,
   "Student Surname" VARCHAR(15) NOT NULL,
   "Student ExaminationScore" float NOT NULL,
   "Student Rank" int,
   "Position in Highschool" VARCHAR(5) ,
   CONSTRAINT CHK_students CHECK("Position in Highschool" IN('YES','NO')),
   CONSTRAINT PK_students PRIMARY KEY ("Student Id")
 );
--Preferences table attributes
 Create table preferences(
   "Prefer order" VARCHAR(1) NOT NULL,
   "Prefer id" serial,
   "Student Id" int NOT NULL,
   "Department id" int,
   "Department Name" VARCHAR(100) NOT NULL,
   CONSTRAINT CHK_preferences CHECK("Prefer order" IN('1','2','3')),
   CONSTRAINT PK_preferences PRIMARY KEY("Prefer id"),
   FOREIGN KEY ("Department id","Department Name")REFERENCES departments("Department id","Department Name") ON DELETE CASCADE,
   FOREIGN KEY ("Student Id")REFERENCES students("Student Id") 
 );


insert into universities("University Name","University Address","University eposta","CITY","University_type","Universtiy_offoundation")
values
  ('Akdeniz University','Pınarbaşı, Akdeniz Unv., 07070 Konyaaltı/Antalya','@akdeniz.edu.tr','ANTALYA','State','1982'),
  ('Afyon Kocatepe University','Erenler Gazlıgöl Yolu, 03200 Merkez/Afyonkarahisar','@aku.edu.tr','AFYONKARAHISAR','State','1992'),
  ('Anadolu University','Yeşiltepe Yunus Emre Kampüsü, 26470 Tepebaşı/Eskişehir','@anadolu.edu.tr','ESKİŞEHİR','State','1958'),
  ('Ankara University','Dögol Caddesi Beşevler/Ankara','@ankara.edu.tr','ANKARA','State','1946'),
  ('Boğaziçi University','Bebek, 34342 Beşiktaş/İstanbul','@boun.edu.tr','İSTANBUL','State','1863'),
  ('Çanakkale 18 Mart University','Barbaros, 17100 Kepez/Çanakkale','@comu.edu.tr','ÇANAKKALE','State','1992'),
  ('Dokuz Eylül University','Alsancak, NO:144,35210 Cumhuriyet Bulvarı,35220 Konak/İzmir','@deu.edu.tr','İZMİR','State','1982'),
  ('Ege University','Erzene,Ege Üniversitesi Rektörlüğü,Gençlik Cad.,35040 Bornova/İzmir','@ege.edu.tr','İZMİR','State','1955'),
  ('Galatasaray University','Ortaköy, Çağıran Cad., NO:36, 34349 Beşiktaş/İstanbul','@gsu.edu.tr','İSTANBUL','State','1992'),
  ('Gazi University','Emniyet Mah., Bandırma Cad., NO:6/1 Yenimahalle/Ankara','@gazi.edu.tr','ANKARA','State','1926'),
  ('Hacettepe University','Hacettepe Unv.Rektörlüğü, Sıhhiye/Ankara','@hacettepe.edu.tr','ANKARA','State','1967'),
  ('İstanbul Teknik University','Maslak, 34467 Sarıyer/İstanbul','@itu.edu.tr','İSTANBUL','State','1773'),
  ('İstanbul University','Beyazıt, 34452 Fatih/İstanbul','@iu.edu.tr','İSTANBUL','State','1453'),
  ('19 Mayıs Üniversitesi','Körfez, 19 Mayıs Unv., 55270 Atakum/Samsun','@omu.edu.tr','SAMSUN','State','1975'),
  ('Beykent University','Ayazağa, Hadım Karayolu Cad., NO:19, 34398 Sarıyer/İstanbul','@beykent.edu.tr','İSTANBUL','Private','1997'),
  ('Koç University','RumeliScienceeri, 34450 Sarıyer/İstanbul','@ku.edu.tr','İSTANBUL','Private','1993'),
  ('Yaşar University','Kazımdirik Mah., 35100 Bornova/İzmir','@yasar.edu.tr','İZMİR','Private','2001'),
  ('İzmir University','Balçova/İzmir','@izmir.edu.tr','İZMİR','State','2010');
    
insert into faculties("University id","University Name","Faculty Name","Faculty_eposta")
values
 ('1','Akdeniz University','Faculty of Medicine','tipdekanlık@akdeniz.edu.tr'),
 ('1','Akdeniz University','Faculty of Dentist','dishekimligi@akdeniz.edu.tr'),
 ('1','Akdeniz University','Faculty of Law','Lawdekan@akdeniz.edu.tr'),
 ('1','Akdeniz University','Faculty of Education','egitimdekan@akdeniz.edu.tr'),
 ('1','Akdeniz University','Faculty of Science','Sciencedekanlik@akdeniz.edu.tr'),
 ('2','Afyon Kocatepe University','Faculty of Engineering','Engineering@aku.edu.tr'),
 ('2','Afyon Kocatepe University','Faculty of Science-Literature','Scienceedfak@aku.edu.tr'),
 ('2','Afyon Kocatepe University','Faculty of Law','Lawfak@aku.edu.tr'),
 ('2','Afyon Kocatepe University','Faculty of Education','egitm@aku.edu.tr'),
 ('3','Anadolu University','Faculty of Education','egtdekanlık@anadolu.edu.tr'),
 ('3','Anadolu University','Faculty of Law','hukfak@anadolu.edu.tr'),
 ('3','Anadolu University','Faculty of Pharmacy','eczfak@anadolu.edu.tr'),
 ('3','Anadolu University','Faculty of Economic and Administrative Sciences','iibf@anadolu.edu.tr'),
 ('4','Ankara University','Faculty of Engineering','muhendislikfak@ankara.edu.tr'),
 ('4','Ankara University','Faculty of Science','Science@ankara.edu.tr'),
 ('4','Ankara University','Faculty of Law','Law@ankara.edu.tr'),
 ('4','Ankara University','Faculty of Medicine','tip@ankara.edu.tr'),
 ('5','Boğaziçi University','Faculty of Education','ed@boun.edu.tr'),
 ('5','Boğaziçi University','Faculty of Science-Literature','fas@boun.edu.tr'),
 ('5','Boğaziçi University','Faculty of Engineering','eng@boun.edu.tr'),
 ('6','Çanakkale 18 Mart University','Faculty of Architecture and Design','mtf@comu.edu.tr'),
 ('6','Çanakkale 18 Mart University','Faculty of Health Sciences','sagbilen@comu.edu.tr'),
 ('6','Çanakkale 18 Mart University','Faculty of Education','egitim@comu.edu.tr'),
 ('6','Çanakkale 18 Mart University','Faculty of Dentist','dishek@comu.edu.tr'),
 ('7','Dokuz Eylül University','Faculty of Medicine','tip@deu.edu.tr'),
 ('7','Dokuz Eylül University','Faculty of Engineering','eng@deu.edu.tr'),
 ('7','Dokuz Eylül University','Faculty of Architecture','Architecture@deu.edu.tr'),
 ('7','Dokuz Eylül University','Faculty of Management','isletme@deu.edu.tr'),
 ('7','Dokuz Eylül University','Faculty of Law','Law@deu.edu.tr'),
 ('8','Ege University','Faculty of Medicine','tip@ege.edu.tr'),
 ('8','Ege University','Faculty of Education','Education@ege.edu.tr'),
 ('8','Ege University','Faculty of Literature','Literature@ege.edu.tr'),
 ('8','Ege University','Faculty of Science','Science@ege.edu.tr'),
 ('9','Galatasaray University','Faculty of Law','Law@gsu.edu.tr'),
 ('9','Galatasaray University','Faculty of Engineering and Technology','mf@gsu.edu.tr'),
 ('9','Galatasaray University','Faculty of Economic and Administrative Sciences','iibf@gsu.edu.tr'),
 ('10','Gazi University','Faculty of Dentist','dent@gazi.edu.tr'),
 ('10','Gazi University','Faculty of Pharmacy','pharmacy@gazi.edu.tr'),
 ('10','Gazi University','Faculty of Architecture','mim@gazi.edu.tr'),
 ('10','Gazi University','Faculty of Engineering','muh@gazi.edu.tr'),
 ('10','Gazi University','Faculty of Medicine','tip@gazi.edu.tr'),
 ('11','Hacettepe University','Faculty of Medicine','tipmaster@hacettepe.edu.tr'),
 ('11','Hacettepe University','Faculty of Engineering','muhfak@hacettepe.edu.tr'),
 ('11','Hacettepe University','Faculty of Dentist','dentistry@hacettepe.edu.tr'),
 ('11','Hacettepe University','Faculty of Pharmacy','eczdekan@hacettepe.edu.tr'),
 ('11','Hacettepe University','Faculty of Law','Law@hacettepe.edu.tr'),
 ('12','İstanbul Teknik University','Faculty of Engineering and Electrical-Electronics','elk@itu.edu.tr'),
 ('12','İstanbul Teknik University','Faculty of Computer and Informatics','bb@itu.edu.tr'),
 ('12','İstanbul Teknik University','Faculty of Construction','insaat@itu.edu.tr'),
 ('12','İstanbul Teknik University','Faculty of Shipbuilding and Marine Sciences','gemi.dekanlık@itu.edu.tr'),
 ('12','İstanbul Teknik University','Faculty of Chemistry Metallurgy','kmg@itu.edu.tr'),
 ('13','İstanbul University','Faculty of Law','Law@istanbul.edu.tr'),
 ('13','İstanbul University','Faculty of Science','Science@istanbul.edu.tr'),
 ('13','İstanbul University','Faculty of Medicine','tip@istanbul.edu.tr'),
 ('13','İstanbul University','Faculty of Pharmacy','ecz@istanbul.edu.tr'),
 ('14','19 Mayıs Üniversitesi','Faculty of Agriculture','Agriculture@omu.edu.tr'),
 ('14','19 Mayıs Üniversitesi','Faculty of Fine Arts','gsf@omu.edu.tr'),
 ('14','19 Mayıs Üniversitesi','Faculty of Veterinary','Veterinary@omu.edu.tr'),
 ('15','Beykent University','Faculty of Engineering-Architecture','mmf@beykent.edu.tr'),
 ('15','Beykent University','Faculty of Dentist','dis@beykent.edu.tr'),
 ('15','Beykent University','Faculty of Law','Law@beykent.edu.tr'),
 ('15','Beykent University','Faculty of Communication','if@beykent.edu.tr'),
 ('16','Koç University','Faculty of Nursing','nursing@ku.edu.tr'),
 ('16','Koç University','Faculty of Law','law@ku.edu.tr'),
 ('16','Koç University','Faculty of Medicine','medicine@ku.edu.tr'),
 ('17','Yaşar University','Faculty of Engineering','Scienceg@yasar.edu.tr'),
 ('17','Yaşar University','Faculty of Law','flaw@yasar.edu.tr'),
 ('18','İzmir University','Faculty of Medicine','medicine@izmir.edu.tr'),
 ('18','İzmir University','Faculty of Engineering','eng@izmir.edu.tr');

insert into departments("Faculty id","Faculty Name","Department Name","Deparment email","Department Language","Department educationtype","Department quota","Department_degreequota","Department_educationperiod","Department Scoretype","Department_minScore","Department_minOrder")
  values
 ('1','Faculty of Medicine','Medicine','tipdekanlık@akdeniz.edu.tr','Turkısh','Formal Education','270','7','6 ','SAY','503.97136','5881'),
 ('2','Faculty of Dentist','Dentist','dishekimligi@akdeniz.edu.tr','Turkısh','Formal Education','110','3','5 ','SAY','466.74087','20713'),
 ('3','Faculty of Law','Law','Lawdekan@akdeniz.edu.tr','Turkısh','Formal Education','240','6','5 ','EA','410.1624','17798'),
 ('4','Faculty of Education','English Teaching','egitimingögr@akdeniz.edu.tr','English','Formal Education','70','2','4 ','DİL','421.8645','9767'),
 ('4','Faculty of Education','Pre-School Teaching','okuloncesi@akdeniz.edu.tr','Turkısh','Formal Education','70','2','4 ','SÖZ','398.6990','15703'),
 ('4','Faculty of Education','Turkısh Teaching','turkogr@akdeniz.edu.tr','Turkısh','Formal Education','65','2','4 ','SÖZ','396.01508','17580'),
 ('5','Faculty of Science','Biology','biyo.Science@akdeniz.edu.tr','Turkısh','Formal Education','55','2','4 ','SAY','250.9658','342584'),
 ('5','Faculty of Science','Physics','Physics.Science@akdeniz.edu.tr','Turkısh','Formal Education','20','1','4 ','SAY','246.6508','358490'),
 ('5','Faculty of Science','Chemistry','Chemistry.Science@akdeniz.edu.tr','Turkısh','Formal Education','20','1','4 ','SAY','256.3108','316490'),
 ('6','Faculty of Engineering','Biomedical Engineering','biyo.eng@aku.edu.tr','Turkısh','Secondary Education','60','2','4 ','SAY','261.97136','295635'),
 ('6','Faculty of Engineering','Biomedical Engineering','biy.eng@aku.edu.tr','Turkısh','Formal Education','50','3','4 ','SAY','266.74087','279467'),
 ('6','Faculty of Engineering','Electrical Engineering','e.muh@aku.edu.tr','Turkısh','Formal Education','70','2','4 ','SAY','262.4376','293173'),
 ('6','Faculty of Engineering','Map Engineering','Map.muh@aku.edu.tr','Turkısh','Secondary Education','40','1','4 ','SAY','221.8645','329767'),
 ('6','Faculty of Engineering','Construction Engineering','insaat@aku.edu.tr','Turkısh','Formal Education','70','2','4 ','SAY','313.6990','163103'),
 ('7','Faculty of Science-Literature','Chemistry','Chemistry@aku.edu.tr','Turkısh','Formal Education','20','1','4 ','SAY','238.31508','400493'),
 ('7','Faculty of Science-Literature','Turkish Language and Literature','tdle@aku.edu.tr','Turkısh','Secondary Education','70','2','2 ','SÖZ','284.9658','359564'),
 ('7','Faculty of Science-Literature','Sociology','sosyo@aku.edu.tr','Turkısh','Formal Education','70','2','2 ','EA','242.6508','592618'),
 ('8','Faculty of Law','Law','Lawfak@aku.edu.tr','Turkısh','Formal Education','140','4','5 ','EA','390.826','34790'),
 ('9','Faculty of Education','Science  Teaching','Science.ogr@aku.edu.tr','Turkısh','Formal Education','30','1','4 ','SAY','275.2326','251211'),
 ('9','Faculty of Education','Elementary Mathematics Teaching','iok.ogr@aku.edu.tr','Turkısh','Formal Education','50','2','4 ','SAY','367.51221','92827'),
 ('9','Faculty of Education','Class Teaching Teaching','Class Teaching.ogr@aku.edu.tr','Turkısh','Formal Education','60','2','4 ','EA','337.3268','122920'),
 ('10','Faculty of Education','German Teaching Teaching','alm.ogr@anadolu.edu.tr','German Teaching','Formal Education','60','2','4 ','DİL','353.0695','27675'),
 ('10','Faculty of Education','French Teaching Teaching','fra.ogr@anadolu.edu.tr','French Teaching','Formal Education','35','1','4 ','DİL','344.91769','30150'),
 ('10','Faculty of Education','Elementary Mathematics Teaching','mat.ogr@anadolu.edu.tr','Turkısh','Formal Education','60','2','4 ','SAY','396.57741','67371'),
 ('11','Faculty of Law','Law','Law@anadolu.edu.tr','Turkısh','Formal Education','350','9','5','EA','413.38275','15758'),
 ('12','Faculty of Pharmacy','Pharmacy','ecz@anadolu.edu.tr','Turkısh','Formal Education','140','4','4 ','SAY','440.82802','35852'),
 ('13','Faculty of Economic and Administrative Sciences','Labor Economics and Industrial Relations','iibfe@anadolu.edu.tr','Turkısh','Formal Education','80','1','2 ','EA','269.55804','386400'),
 ('13','Faculty of Economic and Administrative Sciences','Finance','iibfml@anadolu.edu.tr','Turkısh','Formal Education','100','3','2 ','EA','293.44889','262170'),
 ('13','Faculty of Economic and Administrative Sciences','Management','isletme@anadolu.edu.tr','English','Formal Education','80','2','4 ','EA','323.73768','157177'),
 ('14','Faculty of Engineering','Computer Engineering','bilmuh@ankara.edu.tr','Turkısh','Formal Education','80','2','4 ','SAY','431.16736','42183'),
 ('14','Faculty of Engineering','Computer Engineering','ceng@ankara.edu.tr','English','Formal Education','35','1','4 ','DİL','344.91769','30214'),
 ('14','Faculty of Engineering','Electrical-Electronics Engineering','eeng@ankara.edu.tr','English','Formal Education','60','2','4 ','SAY','442.96581','34535'),
 ('14','Faculty of Engineering','Physics Engineering','phyeng@ankara.edu.tr','English','Formal Education','40','1','4 ','SAY','276.77886','246718'),
 ('14','Faculty of Engineering','Geology Engineering','jeo@ankara.edu.tr','Turkısh','Secondary Education','40','1','4 ','SAY','270.42096','266103'),
 ('15','Faculty of Science','Astronomy and Space Sciences','uzay@ankara.edu.tr','Turkısh','Formal Education','40','1','2 ','SAY','254.17426','325282'),
 ('15','Faculty of Science','Chemistry','chemistry@ankara.edu.tr','English','Formal Education','20','1','4 ','SAY','290.48216','210391'),
 ('15','Faculty of Science','Math','math@ankara.edu.tr','English','Formal Education','60','2','4 ','SAY','292.65693','205209'),
 ('15','Faculty of Science','Math','mat@ankara.edu.tr','Turkısh','Formal Education','60','2','4 ','SAY','304.18706','180348'),
 ('16','Faculty of Law','Law','Law@ankara.edu.tr','Turkısh','Formal Education','550','14','5 ','EA','449.55270','3469'),
 ('17','Faculty of Medicine','Medicine','Medicine@ankara.edu.tr','Turkısh','Formal Education','320','8','6 ','SAY','515.12096','3305'),
 ('17','Faculty of Medicine','Medicine','medicine@ankara.edu.tr','English','Formal Education','320','8','7 ','SAY','520.65196','1181'),
 ('18','Faculty of Education','Science Teaching','scietec@boun.edu.tr','English','Formal Education','50','2','4 ','SAY','366.89115','93473'),
 ('18','Faculty of Education','Physics Teaching','phys@boun.edu.tr','English','Formal Education','20','1','4 ','SAY','398.15680','66104'),
 ('18','Faculty of Education','Math Teaching','mathtec@boun.edu.tr','English','Formal Education','20','1','4 ','SAY','447.04984','32044'),
 ('18','Faculty of Education','Guidance and Psychological Counseling ','pdr@boun.edu.tr','English','Formal Education','70','2','4 ','EA','423.40016','10462'),
 ('19','Faculty of Science-Literature','History ','hist@boun.edu.tr','English','Formal Education','60','2','4 ','SÖZ','471.05048','669'),
 ('19','Faculty of Science-Literature','Turkish Language and Literature','literature@boun.edu.tr','English','Formal Education','60','2','4 ','SÖZ','457.85569','1185'),
 ('19','Faculty of Science-Literature','Psikoloji','psi@boun.edu.tr','English','Formal Education','90','3','4 ','EA','479.6563','1084'),
 ('19','Faculty of Science-Literature','Molecular Biology and Genetics','mbg@boun.edu.tr','English','Formal Education','70','2','4 ','SAY','471.54953','18215'),
 ('20','Faculty of Engineering','Machine Engineering','engmach@boun.edu.tr','English','Formal Education','70','2','4 ','SAY','524.25913','1831'),
 ('20','Faculty of Engineering','Chemistry Engineering','engchem@boun.edu.tr','English','Secondary Education','70','2','4 ','SAY','492.72120','9299'),
 ('20','Faculty of Engineering','Electrical-Electronics Engineering','eeng@boun.edu.tr','Turkısh','Formal Education','320','8','4 ','SAY','515.12096','3305'),
 ('20','Faculty of Engineering','Computer Engineering','ceng@boun.edu.tr','English','Formal Education','80','2','4 ','SAY','538.75084','429'),
 ('21','Faculty of Architecture and Design','Landspace Architecture','peyzaj@comu.edu.tr','English','Formal Education','60','2','4 ','SAY','238.38115','219473'),
 ('22','Faculty of Health Sciences','Nursing','hemsire@comu.edu.tr','Turkısh','Formal Education','130','4','4 ','SAY','312.42963','164919'),
 ('22','Faculty of Health Sciences','Midwifery','Midwifery@comu.edu.tr','Turkısh','Formal Education','80','2','4 ','SAY','287.13105','218686'),
 ('23','Faculty of Education','Geography Teaching','cogeg@comu.edu.tr','Turkısh','Formal Education','20','1','4 ','SÖZ','372.23966','6576'),
 ('23','Faculty of Education','Science Teaching','Scienceogr@comu.edu.tr','Turkısh','Formal Education','50','2','4 ','SAY','265.36112','282830'),
 ('23','Faculty of Education','Elementary Mathematics Teaching','matogr@comu.edu.tr','Turkısh','Formal Education','40','1','4 ','SAY','372.20222','88416'),
 ('23','Faculty of Education','English Teaching','ingogr@comu.edu.tr','Turkısh','Formal Education','90','3','4 ','DİL','413.42031','11587'),
 ('24','Faculty of Dentist','Dentist','dishek@comu.edu.tr','Turkısh','Formal Education','70','2','5','SAY','459.78741','24560'),
 ('25','Faculty of Medicine','Medicine','tip@deu.edu.tr','Turkısh','Formal Education','250','7','6 ','SAY','507.56468','1771'),
 ('26','Faculty of Engineering','Computer Engineering','ceng@deu.edu.tr','English','Formal Education','90','3','4 ','SAY','444.50264','33624'),
 ('26','Faculty of Engineering','Electrical-Electronics Engineering','eeng@deu.edu.tr','English','Formal Education','90','3','4 ','SAY','430.99222','42308'),
 ('26','Faculty of Engineering','Endustry Engineering','endustri@deu.edu.tr','Turkısh','Formal Education','90','3','4 ','SAY','413.31359','54655'),
 ('26','Faculty of Engineering','Construction Engineering','insaat@deu.edu.tr','Turkısh','Secondary Education','90','3','4 ','SAY','310.33033','168736'),
 ('27','Faculty of Architecture','Architecture','mim@deu.edu.tr','Turkısh','Formal Education','100','3','4 ','SAY','408.03893','58602'),
 ('28','Faculty of Management','International Relations','ui@deu.edu.tr','English','Formal Education','60','2','4 ','EA','356.74158','83644'),
 ('28','Faculty of Management','International Management and Trade','uit@deu.edu.tr','Turkısh','Formal Education','60','2','4 ','EA','333.08232','132908'),
 ('28','Faculty of Management','Economy','iktisat@deu.edu.tr','English','Formal Education','80','2','4 ','EA','324.24752','155787'),
 ('29','Faculty of Law','Law','Law@deu.edu.tr','Turkısh','Formal Education','460','12','5 ','EA','418.27088','12971'),
 ('30','Faculty of Medicine','Medicine','tip@ege.edu.tr','Turkısh','Formal Education','340','9','6 ','SAY','513.00249','3730'),
 ('31','Faculty of Education','Science Teaching','Scienceogr@ege.edu.tr','Turkısh','Formal Education','50','2','4 ','SAY','291.93974','206939'),
 ('31','Faculty of Education','Social Studies Teaching','sosogr@ege.edu.tr','English','Formal Education','60','2','4 ','SÖZ','367.25661','49252'),
 ('31','Faculty of Education','Turkısh Teaching','turkogr@ege.edu.tr','Turkısh','Formal Education','60','2','4 ','SÖZ','408.18359','10530'),
 ('32','Faculty of Literature','Turkish Language and Literature','tdle@ege.edu.tr','Turkısh','Formal Education','80','2','4 ','SÖZ','366.35620','50705'),
 ('32','Faculty of Literature','History ','History @ege.edu.tr','Turkısh','Formal Education','80','2','4 ','SÖZ','361.99649','58085'),
 ('32','Faculty of Literature','Craft History','Craft@ege.edu.tr','Turkısh','Formal Education','70','2','4 ','SÖZ','325.40643','155281'),
 ('33','Faculty of Science','Math','mat@ege.edu.tr','Turkısh','Secondary Education','100','3','4 ','SAY','268.99727','270644'),
 ('33','Faculty of Science','Chemistry','kim@ege.edu.tr','Turkısh','Formal Education','80','2','4 ','SAY','259.68996','303449'),
 ('34','Faculty of Law','Law','Law@gsu.edu.tr','French Teaching','Formal Education','25','1','5 ','EA','526.1886','89'),
 ('35','Faculty of Engineering and Technology','Computer Engineering','bilmuh@gsu.edu.tr','French Teaching','Formal Education','30','1','4 ','SAY','501.69453','6507'),
 ('35','Faculty of Engineering and Technology','Endustry Engineering','endmuh@gsu.edu.tr','French Teaching','Formal Education','30','1','4 ','SAY','489.44272','10522'),
 ('36','Faculty of Economic and Administrative Sciences','Economy','ikt@gsu.edu.tr','French Teaching','Formal Education','30','1','4 ','EA','469.48136','1669'),
 ('36','Faculty of Economic and Administrative Sciences','Political Science','siyasi@gsu.edu.tr','French Teaching','Formal Education','30','1','4 ','EA','447.15304','3773'),
 ('37','Faculty of Dentist','Dentist','denti@gazi.edu.tr','Turkısh','Formal Education','120','3','5 ','SAY','467.94750','20069'),
 ('38','Faculty of Pharmacy','Pharmacy','pharmacy@gazi.edu.tr','Turkısh','Formal Education','110','3','4 ','SAY','442.08033','35075'),
 ('39','Faculty of Architecture','Architecture','mim@gazi.edu.tr','Turkısh','Formal Education','100','3','4 ','SAY','417.48648','51600'),
 ('40','Faculty of Engineering','Computer Engineering','bilmuh@gazi.edu.tr','Turkısh','Secondary Education','90','3','4 ','SAY','429.30889','43449'),
 ('40','Faculty of Engineering','Electrical-Electronics Engineering','eemuh@gazi.edu.tr','Turkısh','Formal Education','80','2','4 ','SAY','429.90555','43044'),
 ('40','Faculty of Engineering','Machine Engineering','Machine@gazi.edu.tr','English','Formal Education','40','1','4 ','SAY','437.81912','37773'),
 ('39','Faculty of Architecture','Endustry Products Design','eüt@gazi.edu.tr','Turkısh','Formal Education','90','3','4 ','SAY','294.39010','201240'),
 ('41','Faculty of Medicine','Medicine','tip@gazi.edu.tr','English','Formal Education','100','3','6 ','SAY','506.73558','5176'),
 ('42','Faculty of Medicine','Medicine','medicine@hacettepe.edu.tr','English','Formal Education','160','4','7 ','SAY','532.21498','904'),
 ('43','Faculty of Engineering','Computer Engineering','ceng@hacettepe.edu.tr','English','Formal Education','100','3','4 ','SAY','486.25401','11743'),
 ('44','Faculty of Dentist','Dentist','dentistry@hacettepe.edu.tr','Turkısh','Formal Education','140','4','5','SAY','483.09837','13017'),
 ('45','Faculty of Pharmacy','Pharmacy','eczdekan@hacettepe.edu.tr','Turkısh','Formal Education','140','4','4 ','SAY','449.99201','30238'),
 ('46','Faculty of Law','Law','Law@hacettepe.edu.tr','Turkısh','Formal Education','230','6','5 ','EA','439.49177','5094'),
 ('47','Faculty of Engineering and Electrical-Electronics','Electronics and Communications','ehmuh@itu.edu.tr','Turkısh','Formal Education','110','3','4 ','SAY','501.77771','6483'),
 ('47','Faculty of Engineering and Electrical-Electronics','Kontrol ve Otomasyon Engineering','kotomuh@itu.edu.tr','Turkısh','Formal Education','60','2','4 ','SAY','479.67136','14448'),
 ('48','Faculty of Computer and Informatics','Computer Engineering','bilgmuh@itu.edu.tr','English','Formal Education','110','3','4 ','SAY','519.20048','2580'),
 ('49','Faculty of Construction','Environment Engineering','cevmuh@itu.edu.tr','Turkısh','Formal Education','70','2','4 ','SAY','376.16260','84711'),
 ('49','Faculty of Construction','Geomatics Engineering','geomuh@itu.edu.tr','Turkısh','Formal Education','70','2','4 ','SAY','367.04258','93311'),
 ('50','Faculty of Shipbuilding and Marine Sciences','Ship and Marine Engineering','gemimuh@itu.edu.tr','Turkısh','Formal Education','60','2','4 ','SAY','378.19614','82933'),
 ('49','Faculty of Construction','Construction Engineering','insmuh@itu.edu.tr','English','Formal Education','60','2','4 ','SAY','454.44985','27614'),
 ('51','Faculty of Chemistry Metallurgy','Chemistry Engineering','kim@itu.edu.tr','Turkısh','Formal Education','80','2','4 ','SAY','445.25093','33135'),      
 ('52','Faculty of Law','Law','Law@istanbul.edu.tr','Turkısh','Formal Education','500','13','5 ','EA','444.99667','4090'),
 ('52','Faculty of Law','Law','Lawio@istanbul.edu.tr','Turkısh','Secondary Education','360','9','5 ','EA','431.64826','7232'),
 ('53','Faculty of Science','Molecular Biology and Genetics','mbg@istanbul.edu.tr','Turkısh','Formal Education','60','2','4 ','SAY','385.0136','76998'),
 ('54','Faculty of Medicine','Medicine','tip@istanbul.edu.tr','Turkısh','Formal Education','300','8','6 ','SAY','519.0446','2609'),
 ('54','Faculty of Medicine','Medicine','tip.ing@istanbul.edu.tr','English','Formal Education','60','2','6 ','SAY','524.00223','1863'),
 ('55','Faculty of Pharmacy','Pharmacy','ecz@istanbul.edu.tr','English','Formal Education','40','1','4 ','SAY','448.8987','30894'),     
 ('56','Faculty of Agriculture','Agriculture Machines ve Technologies Engineering','tarım@omu.edu.tr','Turkısh','Formal Education','20','1','2 ','SAY','239.36148','394775'),
 ('56','Faculty of Agriculture','Soil Science and Plant Nutrition','toprak@omu.edu.tr','Turkısh','Formal Education','20','1','2 ','SAY','228.1396','453320'),
 ('57','Faculty of Fine Arts','Image Communication Design','gorsel@omu.edu.tr','Turkısh','Formal Education','30','1','4 ','SÖZ','328.4536','144323'),
 ('58','Faculty of Veterinary','Veterinary','Veterinary@omu.edu.tr','Turkısh','Formal Education','75','2','4 ','SAY','370.3564','90158'),
 ('59','Faculty of Engineering-Architecture','Interior Architecture','icmim@beykent.edu.tr','Turkısh','Formal Education','10','-','4 ','SAY','327.44148','140621'),
 ('59','Faculty of Engineering-Architecture','Computer Engineering','bilmuh@beykent.edu.tr','Turkısh','Formal Education','16','1','4 ','SAY','409.5955','57435'),
 ('60','Faculty of Dentist','Dentist','dis@beykent.edu.tr','Turkısh','Formal Education','36','-','5','SAY','437.12559','38222'),
 ('61','Faculty of Law','Law','Law@beykent.edu.tr','Turkısh','Formal Education','12','-','5 ','EA','412.1824','17788'),
 ('62','Faculty of Communication','Public Relations and Advertising','halk@beykent.edu.tr','Turkısh','Formal Education','31','-','5 ','SÖZ','237.870704','710667'),               
 ('63','Faculty of Nursing','Nursing','nursing@ku.edu.tr','Turkısh','Formal Education','30','-','4 ','SAY','393.44548','69925'),
 ('64','Faculty of Law','Law','law@ku.edu.tr','Turkısh','Formal Education','113','-','5 ','EA','353.10563','90310'),
 ('65','Faculty of Medicine','Medicine','medicine@ku.edu.tr','English','Formal Education','14','-','7 ','SAY','546.37277','108'),
 ('66','Faculty of Engineering','Computer Engineering','ceng@yasar.edu.tr','English','Formal Education','22','-','4 ','SAY','298.87548','191490'),
 ('66','Faculty of Engineering','Construction Engineering','insaat@yasar.edu.tr','English','Formal Education','11','-','4 ','SAY','295.10563','198838'),
 ('66','Faculty of Engineering','Software Engineering','softw@yasar.edu.tr','English','Formal Education','24','-','4 ','SAY','441.23153','35603'),
 ('67','Faculty of Law','Law','flaw@yasar.edu.tr','English','Formal Education','18','-','5','EA','410.71263','13260'),
 ('68','Faculty of Medicine','Medicine','medicine@izmir.edu.tr','English','Formal Education','60','2','6','SAY','480.71263','11260'),
 ('69','Faculty of Engineering','Computer Engineering','ceng@izmir.edu.tr','English','Formal Education','80','4','4 ','SAY','412.71263','42136'),
 ('69','Faculty of Engineering','Machine Engineering','meng@izmir.edu.tr','English','Formal Education','80','4','4 ','SAY','416.71263','40108'),
 ('69','Faculty of Engineering','Electrical-Electronics Engineering','eeng@izmir.edu.tr','English','Formal Education','80','4','4 ','SAY','420.71263','36201');

 insert into students("Student Name","Student Surname","Student ExaminationScore","Student Rank","Position in Highschool")
 values
  ('Şefika Özlem','PUL','415.326','40132','NO'),
  ('Seçil','ÖZTÜRK','413.235','67235','YES'),
  ('Büşra','ÖZDEMİR','386.469','110108','NO'),
  ('Mert','BİLDİRİCİ','450.234','17823','NO'),
  ('Kaan','YILDIRIM','332.657','197635','NO'),
  ('Pınar','EROĞLU','302.420','256364','NO'),
  ('Furkan','AYDIN','235.450','412224','NO'),
  ('Özge','EROL','474.254','12987','YES'),
  ('Ceren','AYSAN','486.987','9897','YES'),
  ('Alperen','USLU','420.785','36224','NO'),
  ('Emine','GÜNDÜZ','276.548','356264','YES'),
  ('Gülden','BOZKURT','436.852','33976','YES'),
  ('Batuhan','ŞENYÜZ','539.666','2114','YES'),
  ('Merve Şevval','ARSLAN','512.498','1100','NO');

  insert into preferences("Prefer order","Student Id","Department id","Department Name")
   values
    ('1','1','63','Computer Engineering'),
    ('2','1','91','Machine Engineering'),
    ('3','1','67','Architecture'),
    ('1','2','55','Nursing'),
    ('2','2','119','Dentist'),
    ('3','2','113','Agriculture Machines ve Technologies Engineering'),
    ('1','3','112','Pharmacy'),
    ('2','3','85','Political Science'),
    ('3','3','65','Endustry Engineering'),
    ('1','4','30','Computer Engineering'),
    ('2','4','61','Dentist'),
    ('3','4','44','Math Teaching'),
    ('1','5','36','Chemistry'),
    ('2','5','29','Management'),
    ('3','5','123','Law'),
    ('1','6','125','Computer Engineering'),
    ('2','6','84','Economy'),
    ('3','6','78','Craft History'),
    ('1','7','73','Science Teaching'),
    ('2','7','105','Construction Engineering'),
    ('3','7','5','Pre-School Teaching'),
    ('1','8','89','Computer Engineering'),
    ('2','8','94','Medicine'),
    ('3','8','119','Dentist'),
    ('1','9','2','Dentist'),
    ('2','9','11','Biomedical Engineering'),
    ('3','9','49','Molecular Biology and Genetics'),
    ('1','10','71','Law'),
    ('2','10','99','Electronics and Communications'),
    ('3','10','127','Software Engineering'),
    ('1','11','82','Computer Engineering'),
    ('2','11','114','Soil Science and Plant Nutrition'),
    ('3','11','57','Geography Teaching'),
    ('1','12','66','Construction Engineering'),
    ('2','12','126','Construction Engineering'),
    ('3','12','50','Machine Engineering'),
    ('1','13','53','Computer Engineering'),
    ('2','13','94','Medicine'),
    ('3','13','124','Medicine'),
    ('1','14','1','Medicine'),
    ('2','14','96','Dentist'),
    ('3','14','90','Electrical-Electronics Engineering');
    
--Question #1
Select uni.* from universities uni WHERE "CITY" LIKE 'İ%' AND "Universtiy_offoundation">'1990';

--Question #2
Select F."University id",F."University Name" from faculties F WHERE "Faculty Name" LIKE '%Engineering%' 
INTERSECT Select F."University id", F."University Name" from faculties F WHERE "Faculty Name" LIKE '%Medicine%'
  
--Question #3
Select COUNT("Faculty id")from faculties F,universities U  WHERE F."University id"=U."University id" AND U."University_type"='State'
UNION ALL Select COUNT("Faculty id")from faculties F,universities U  WHERE F."University id"=U."University id" AND U."University_type"='Private'

--Question #4
SELECT D.* FROM departments D WHERE  D."Department Name" LIKE '%Engineering%' AND D."Department educationtype" LIKE 'Secondary Education'

--Question #5
SELECT  D.* from departments D  ORDER BY (D."Department_educationperiod",D."Department_minScore") DESC LIMIT 5

--Question #6
Select p."Department Name" from preferences p, departments d WHERE d."Department_educationperiod"='4' AND d."Department Name"=p."Department Name" GROUP BY(p."Department Name") ORDER BY COUNT(p.*) DESC 

--Question #7
Select S."Student Id" ,"Student ExaminationScore" from students S,preferences p  WHERE "Prefer order"='1' AND "Department Name"='Computer Engineering' AND S."Student Id"=p."Student Id" ORDER BY "Student ExaminationScore" DESC

--Question #8
UPDATE faculties SET "University Name"='İzmir Technical University'WHERE "University Name"='Dokuz Eylül University' AND "Faculty Name"='Faculty of Engineering'

--Question #9
UPDATE departments SET "Department_educationperiod"="Department_educationperiod"+1 WHERE "Faculty Name"='Faculty of Law'

--Question #10
DELETE from faculties D WHERE D."University Name"='İzmir University'  

--TABLES 
Select * from universities
Select * from faculties
Select * from departments
Select * from students
Select * from preferences
