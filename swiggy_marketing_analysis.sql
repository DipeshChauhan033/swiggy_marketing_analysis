use swiggy;

select * from marketing_details;

select month from marketing_details where profit<500000;

select MAX(profit)as profit,year from marketing_details group by year;

select MAX(profit)as profit from marketing_details where year = 2022;

select month,profit from marketing_details where profit = (select max(profit) from marketing_details where year = 2024);


select min(revenue),year from marketing_details group by year;

select avg(return_on_investment) from marketing_details;

select year,sum(traffic)as total_traffic from marketing_details group by year order by total_traffic desc;

select month,return_on_investment from marketing_details where return_on_investment < (select AVG(return_on_investment) from marketing_details);

select year,round(avg(interactions),2) as interaction from marketing_details group by year order by avg(interactions) desc limit 5;

select max(click_through_rate) from marketing_details;

select year,click_through_rate from marketing_details where click_through_rate = (select max(click_through_rate) from marketing_details); 

select year,click_per_rate from marketing_details where click_per_rate = (select max(click_per_rate) from mark
eting_details);

#select performance_by_month,avg(purchases) from marketing_details where performance_by_month in ('bad_month','average_month') group by performance_by_month; 

select year,sum(ad_spend) as Total_Ad_Spends,sum(profit)as Total_Profit from marketing_details group by year order by total_ad_spends desc;

select year, count(performance_by_month) as good_month from marketing_details where performance_by_month='good_month' group by year;

select year,round(100*sum(case when performance_by_month = 'good_month' then 1 else 0 end)/count(*),2) as good_month_rate
from marketing_details group by year;

with top_purchases as(
select month,year,purchases,row_number() over (partition by year order by purchases desc) as sr from marketing_details)

select sr,month,purchases,year from top_purchases where sr<=3;

with highest_lead as(
select year,sum(leads) as leads from marketing_details group by year
)

select year,leads from highest_lead where leads = (select max(marketing_detailleads) from highest_lead);

