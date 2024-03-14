'Подготовка к экзамену'

----------'Создание таблиц'
CREATE TABLE kind_burner (
  kind_id INT NOT NULL,
  kind_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (kind_id)
);


CREATE TABLE burner (
  burn_sn VARCHAR(16) NOT NULL,
  kind_id INT NOT NULL,
  burn_ver VARCHAR(5) NOT NULL,
  burn_date_prod DATE NOT NULL,
  PRIMARY KEY (burn_sn),
  FOREIGN KEY (kind_id) REFERENCES kind_burner (kind_id)
);


CREATE TABLE customer (
  cust_id INT NOT NULL,
  cust_name VARCHAR(40) NOT NULL,
  cust_tell VARCHAR(12) NOT NULL,
  cust_email VARCHAR(40),
  PRIMARY KEY (cust_id)
);

CREATE TABLE registration (
  cust_id INT NOT NULL,
  burn_sn VARCHAR(16) NOT NULL,
  reg_data DATE NOT NULL,
  PRIMARY KEY (cust_id, burn_sn),
  FOREIGN KEY (burn_sn) REFERENCES burner (burn_sn),
  FOREIGN KEY (cust_id) REFERENCES customer (cust_id)
);


CREATE TABLE repair (
  invoice_id VARCHAR(20) NOT NULL,
  burn_sn VARCHAR(16) NOT NULL,
  cust_id INT NOT NULL,
  rep_date DATE NOT NULL,
  rep_desc VARCHAR(256) NOT NULL,
  rep_cost DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
  FOREIGN KEY (burn_sn) REFERENCES burner (burn_sn)
);

------------------'Добавление данных'


begin
INSERT INTO kind_burner(kind_id, kind_name) VALUES(1,'FiredNow');
INSERT INTO kind_burner(kind_id, kind_name) VALUES(2,'FiredAlways');
INSERT INTO kind_burner(kind_id, kind_name) VALUES(3,'FiredAtCamp');
end;

begin
INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('1010-12SN', 1, 'V1', to_date('01-JAN-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('1010-13SN', 1, 'V1', to_date('10-JAN-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('1010-14SN', 1, 'V2', to_date('20-JAN-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('2010-15SN', 2, 'V1', to_date('06-FEB-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('2010-16SN', 2, 'V3', to_date('10-FEB-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('2010-17SN', 2, 'V1', to_date('11-FEB-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('3010-18SN', 3, 'V1', to_date('04-MAR-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('3010-19SN', 3, 'V3', to_date('14-MAR-2022', 'DD-MON-YYYY'));

INSERT INTO burner(burn_sn, kind_id, burn_ver, burn_date_prod) 
VALUES('4010-20SN', 3, 'V4', to_date('20-MAR-2022', 'DD-MON-YYYY'));
end;

begin
INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(12, 'Dmitri Rzevski', '37222052931', 'dmitri@gmail.com');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(13, 'Natasha Rostova', '37238072145', 'natasha@gmail.com');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(14, 'Pierre Bezukhov', '37238172045', 'pierre@gmail.com');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(15, 'Andrei Bolkonsky', '37232077045', 'a.bolkonsky@gmail.com');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(16, 'Maria Bolkonskaya', '37222187133', '');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(17, 'Nikolai Rostov', '37221082033', 'nik@gmail.com');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(18, 'Yelena Prekrasnaja', '37221182133', '');

INSERT INTO customer(cust_id, cust_name, cust_tell, cust_email) 
VALUES(19, 'Vasilisa Mudraja', '37211052911', 'vasilisa@mail.ru');
end;

begin
INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(12, '1010-12SN', to_date('11-MAR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(13, '1010-13SN', to_date('21-MAR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(14, '1010-14SN', to_date('30-MAR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(15, '2010-15SN', to_date('06-APR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(16, '2010-16SN', to_date('07-APR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(17, '2010-17SN', to_date('21-APR-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(18, '3010-18SN', to_date('08-JUN-2022', 'DD-MON-YYYY'));

INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(19, '3010-19SN', to_date('09-JUN-2022', 'DD-MON-YYYY'));
end;


begin
INSERT INTO repair(invoice_id,burn_sn,cust_id,rep_date,rep_desc,rep_cost) 
VALUES(1001,'1010-12SN',12, to_date('09-JUN-2022', 'DD-MON-YYYY'), 'Fix an element',50.00);

INSERT INTO repair(invoice_id,burn_sn,cust_id,rep_date,rep_desc,rep_cost) 
VALUES(1002,'1010-13SN',13, to_date('09-JUN-2022', 'DD-MON-YYYY'), 'Repair an element',160.60);

INSERT INTO repair(invoice_id,burn_sn,cust_id,rep_date,rep_desc,rep_cost) 
VALUES(1003,'1010-14SN',14, to_date('09-JUN-2022', 'DD-MON-YYYY'), 'Fix 3 elements',200.50);

INSERT INTO repair(invoice_id,burn_sn,cust_id,rep_date,rep_desc,rep_cost) 
VALUES(1004,'2010-15SN',15, to_date('09-JUN-2022', 'DD-MON-YYYY'), 'Change an element',100.00);
end;

---------------------'SQL операторы'

'1. Выведите список версий всех горелок типа «FiredNow». '
SELECT burn_ver  
from burner 
JOIN kind_burner
ON kind_burner.kind_id = burner.kind_id
WHERE kind_name = 'FiredNow';

'Result'
BURN_VER
V1
V1
V2

'2. Выведите серийный номер и дату регистрации для продуктов, зарегистрированных в
феврале.'
select burn_sn, reg_data
from registration
where to_char(reg_data, 'MON') = 'MAR';

------
select burn_sn, reg_data
from registration 
WHERE reg_data LIKE '03________';

'Result'

BURN_SN	     REG_DATA
1010-12SN	03/11/2022
1010-13SN	03/21/2022
1010-14SN	03/30/2022

'3. Выведите список имен покупателей, не имеющих электронной почты; отсортируйте
результаты в обратном алфавитном порядке.'

select cust_name
from customer
where cust_email is null
Order by cust_name desc;

'Result'
CUST_NAME
Yelena Prekrasnaja
Maria Bolkonskaya

'4. Определите среднюю стоимость ремонта горелки.'
select AVG(rep_cost) as Average
from repair;

'Result'
AVERAGE
127.775

'5. Определите количество горелок каждого типа и выведите тип и количество.'
select kind_name, count(*) as quant
from burner
INNER JOIN kind_burner ON burner.kind_id = kind_burner.kind_id
GROUP BY kind_name;

'Result'

KIND_NAME	QUANT
FiredAlways	3
FiredAtCamp	3
FiredNow	3

'6. Выведите имена и адреса электронной почты всех покупателей, на которых
зарегистрирована горелка типа «FiredNow». Используйте вложенный запрос. '

select cust_name, cust_email 
from customer 
where cust_id in 
(select cust_id from registration where burn_sn in
(select burn_sn from burner where kind_id in
(select kind_id FROM kind_burner WHERE kind_name = 'FiredNow'
)));

'Result'

CUST_NAME	      CUST_EMAIL
Dmitri Rzevski	dmitri@gmail.com
Natasha Rostova	natasha@gmail.com
Pierre Bezukhov	pierre@gmail.com

'7. Выведите имена и адреса электронной почты всех покупателей, на которых
зарегистрирована горелка типа «FiredNow». Используйте объединение.'
SELECT cust_name, cust_email
FROM customer
INNER JOIN registration ON customer.cust_id = registration.cust_id
INNER JOIN burner ON registration.burn_sn = burner.burn_sn
INNER JOIN kind_burner ON burner.kind_id = kind_burner.kind_id
WHERE kind_burner.kind_name = 'FiredNow';

'Result'
CUST_NAME	      CUST_EMAIL
Dmitri Rzevski	dmitri@gmail.com
Natasha Rostova	natasha@gmail.com
Pierre Bezukhov	pierre@gmail.com

'8. Выведите имена и адреса электронной почты покупателей, имеющих зарегистрированную
горелку, но не сдававших ни одной горелки в ремонт. '
Select cust_name, cust_email
from customer
where cust_id IN(select cust_id from registration)
AND cust_id Not IN (select cust_id from repair);

'Result'
CUST_NAME	        CUST_EMAIL
Maria Bolkonskaya	-
Nikolai Rostov	    nik@gmail.com
Yelena Prekrasnaja	-
Vasilisa Mudraja	vasilisa@mail.ru

'9. Постройте представление, начинающееся с таблицы ГОРЕЛКА и содержащее все данные
из всех таблиц. Назовите это представление ГОРЕЛКА_ПР. '
CREATE VIEW burner_pr AS
SELECT b.*, 
r.reg_data, 
c.cust_name, c.cust_tell, c.cust_email, 
re.invoice_id, re.rep_date, re.rep_desc, re.rep_cost
FROM burner b
LEFT JOIN registration r ON r.burn_sn = b.burn_sn
LEFT JOIN customer c ON c.cust_id = r.cust_id
LEFT JOIN repair re ON b.burn_sn = re.burn_sn;


'Result'
BURN_SN	KIND_ID	BURN_VER	BURN_DATE_PROD	REG_DATA	CUST_NAME	CUST_TELL	CUST_EMAIL	INVOICE_ID	REP_DATE	REP_DESC	REP_COST
1010-12SN	1	V1	01/01/2022	03/11/2022	Dmitri Rzevski	37222052931	dmitri@gmail.com	1001	06/09/2022	Fix an element	50
1010-13SN	1	V1	01/10/2022	03/21/2022	Natasha Rostova	37238072145	natasha@gmail.com	1002	06/09/2022	Repair an element	160.6
1010-14SN	1	V2	01/20/2022	03/30/2022	Pierre Bezukhov	37238172045	pierre@gmail.com	1003	06/09/2022	Fix 3 elements	200.5
2010-15SN	2	V1	02/06/2022	04/06/2022	Andrei Bolkonsky	37232077045	a.bolkonsky@gmail.com	1004	06/09/2022	Change an element	100
2010-16SN	2	V3	02/10/2022	04/07/2022	Maria Bolkonskaya	37222187133	-	-	-	-	-
2010-17SN	2	V1	02/11/2022	04/21/2022	Nikolai Rostov	37221082033	nik@gmail.com	-	-	-	-
3010-18SN	3	V1	03/04/2022	06/08/2022	Yelena Prekrasnaja	37221182133	-	-	-	-	-
3010-19SN	3	V3	03/14/2022	06/09/2022	Vasilisa Mudraja	37211052911	vasilisa@mail.ru	-	-	-	-
4010-20SN	3	V4	03/20/2022	-	-	-	-	-	-	-	-


'10. Напишите SQL-операторы, необходимые для чтения представления
ГОРЕЛКА_ПР. Начните с некоторого серийного номера. '
SELECT * FROM burner_pr
WHERE burn_sn > '2010-17SN';

'Result'
BURN_SN	KIND_ID	BURN_VER	BURN_DATE_PROD	REG_DATA	CUST_NAME	CUST_TELL	CUST_EMAIL	INVOICE_ID	REP_DATE	REP_DESC	REP_COST
3010-18SN	3	V1	03/04/2022	06/08/2022	Yelena Prekrasnaja	37221182133	-	-	-	-	-
3010-19SN	3	V3	03/14/2022	06/09/2022	Vasilisa Mudraja	37211052911	vasilisa@mail.ru	-	-	-	-
4010-20SN	3	V4	03/20/2022	-	-	-	-	-	-	-	-











