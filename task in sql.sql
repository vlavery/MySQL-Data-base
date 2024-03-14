1. Введите список версий всех горелок.

SELECT DISTINCT burn_ver
FROM burner;

Ответ: 
BURN_VER
V1
V4
V2
V3

2. Введите серийный номер и дату регистрации для продуктов, зарегистрированных в 2022 году.

SELECT burn_sn, reg_data
FROM registration
WHERE EXTRACT(YEAR FROM reg_data) = 2022;

Ответ:
BURN_SN	     REG_DATA
1010-12SN	03/11/2022
1010-13SN	03/21/2022
1010-14SN	03/30/2022
2010-15SN	04/06/2022
2010-16SN	04/07/2022
2010-17SN	04/21/2022
3010-18SN	06/08/2022
3010-19SN	06/09/2022

3. Введите список имен и адресов электонной почты покупателей, у которых есть электронная почта.

SELECT cust_name, cust_email
FROM customer
WHERE cust_email IS NOT NULL;


Ответ:
CUST_NAME	       CUST_EMAIL
Dmitri Rzevski	  dmitri@gmail.com
Natasha Rostova	  natasha@gmail.com
Pierre Bezukhov	  pierre@gmail.com
Andrei Bolkonsky	a.bolkonsky@gmail.com
Nikolai Rostov	  nik@gmail.com
Vasilisa Mudraja	vasilisa@mail.ru

4. Определите максимальную стоимость ремонта горелки.

SELECT MAX(rep_cost) as max_repair_cost
FROM repair;


Ответ:
MAX_REPAIR_COST
200.5

5. Определите максимальную стоимость всех горелок.

SELECT MAX(rep_cost) as max_burner_cost
FROM repair
JOIN burner ON repair.burn_sn = burner.burn_sn;


Ответ:
MAX_BURNER_COST
200.5

6. Введите имена и адреса электронной почты всех покупателей, для которых производился ремонт горелки на сумму более 50 евро. Используйте внешний запрос.

SELECT cust_name, cust_email
FROM customer
WHERE cust_id IN (
  SELECT DISTINCT cust_id
  FROM repair
  WHERE rep_cost > 50
);


Ответ:
CUST_NAME	      CUST_EMAIL
Natasha Rostova	  natasha@gmail.com
Pierre Bezukhov	  pierre@gmail.com
Andrei Bolkonsky  a.bolkonsky@gmail.com

7. Введите имена и адреса электронной почты всех покупателей, для которых производился ремонт горелки на сумму более 50 евро. Используйте объединение.

SELECT cust_name, cust_email
FROM customer
JOIN repair ON customer.cust_id = repair.cust_id
WHERE rep_cost > 50;


Ответ:
CUST_NAME	      CUST_EMAIL
Natasha Rostova	  natasha@gmail.com
Pierre Bezukhov	  pierre@gmail.com
Andrei Bolkonsky  a.bolkonsky@gmail.com

8. Введите имена и адреса электронной почты покупателей, имеющих зарегистрированную горелку, но не сдававших данную горелку в ремонт.

SELECT cust_name, cust_email
FROM customer
WHERE cust_id IN (
  SELECT DISTINCT c.cust_id
  FROM customer c
  JOIN registration r ON c.cust_id = r.cust_id
  LEFT JOIN repair re ON r.burn_sn = re.burn_sn
  WHERE re.burn_sn IS NULL
);


Ответ:
CUST_NAME	         CUST_EMAIL
Maria Bolkonskaya	    -
Nikolai Rostov      nik@gmail.com
Yelena Prekrasnaja	     -
Vasilisa Mudraja	vasilisa@mail.ru

9. Постройте представление, начинающееся с таблицы РЕМОНТ_ГОРЕЛКИ и содержащее все данные из всех таблиц. НАзовите это представление РЕМОНТ_ГОРЕЛКИ_ПР.

CREATE VIEW repair_burner_pr AS
SELECT re.invoice_id, re.burn_sn as re_burn_sn, re.cust_id as re_cust_id, re.rep_date, re.rep_desc, re.rep_cost,
       b.burn_sn as b_burn_sn, b.kind_id, b.burn_ver, b.burn_date_prod,
       c.cust_id as c_cust_id, c.cust_name, c.cust_tell, c.cust_email
FROM repair re
JOIN burner b ON re.burn_sn = b.burn_sn
JOIN customer c ON re.cust_id = c.cust_id;

Ответ:
INVOICE_ID	RE_BURN_SN	RE_CUST_ID	REP_DATE	REP_DESC	REP_COST	B_BURN_SN	KIND_ID	BURN_VER	BURN_DATE_PROD	C_CUST_ID	CUST_NAME	CUST_TELL	CUST_EMAIL
1001	1010-12SN	12	06/09/2022	Fix an element	50	1010-12SN	1	V1	01/01/2022	12	Dmitri Rzevski	37222052931	dmitri@gmail.com
1002	1010-13SN	13	06/09/2022	Repair an element	160.6	1010-13SN	1	V1	01/10/2022	13	Natasha Rostova	37238072145	natasha@gmail.com
1003	1010-14SN	14	06/09/2022	Fix 3 elements	200.5	1010-14SN	1	V2	01/20/2022	14	Pierre Bezukhov	37238172045	pierre@gmail.com
1004	2010-15SN	15	06/09/2022	Change an element	100	2010-15SN	2	V1	02/06/2022	15	Andrei Bolkonsky	37232077045	a.bolkonsky@gmail.com

10.  В предположении, что необходимые данные о горелке уже имеются в базе дынных, а данные о покупателе -нет. Зарегистрируйте горелку в процессе записи информации о ремонте.
INSERT INTO registration(cust_id, burn_sn, reg_data) 
VALUES(20, '2023-01SN', CURRENT_DATE);

INSERT INTO repair(invoice_id, burn_sn, cust_id, rep_date, rep_desc, rep_cost) 
VALUES(1005, '2023-01SN', 20, CURRENT_DATE, 'Regular maintenance', 80.00);

