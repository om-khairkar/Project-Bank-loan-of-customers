use kpi;
select* from f1;
select* from f2;
/*  KPI_1 */
select str_to_date(concat('01-', issue_d),'%d-%b-%y') as d from f1;
select date_format(str_to_date(concat('01-',issue_d),'%d-%b-%y'),'%Y') as years ,sum(loan_amnt) as loan_amount 
from f1 group by years
order by years;
SELECT DATE_FORMAT(issue_d, '%y') AS year, SUM(loan_amnt) AS total_loan_amount FROM f1
GROUP BY year;

/*  KPI_2*/
 select f1.grade,f1.sub_grade,sum(f2.revol_bal) from f1
 inner join f2 on f1.id=f2.id
 group by f1.grade,f1.sub_grade
 order by f1.grade,f1.sub_grade;
 
 
 /*  KPI_3*/
 select  f1.verification_status as verified_status,sum(f2.total_pymnt) as total_pymt from f1
 join f2 on f1.id=f2.id
 group by verified_status;
 
 /*  KPI_4*/

 select date_format(str_to_date(CONCAT('01-', issue_d), '%d-%b-%y'),'%b') from f1;  
 
 SELECT addr_state AS state, DATE_FORMAT(STR_TO_DATE(CONCAT('01-', issue_d), '%d-%b-%y'), '%b')
 AS Month, loan_status
FROM f1 GROUP BY addr_state, month, loan_status ORDER BY addr_state, month;

  /*  KPI_5*/
  
select home_ownership,last_pymnt_d ,COUNT(home_ownership) AS Count
FROM f1
JOIN f2 ON f1.id = f2.id
GROUP BY home_ownership,last_pymnt_d;
