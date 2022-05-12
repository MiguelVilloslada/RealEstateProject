use house_price_regression;

select * from house_price_data;

# 5 Use the alter table command to drop the column date from the database, select all the data 
#from the table to verify if the command worked. Limit your returned results to 10.

alter table house_price_data
drop column date;

select * from house_price_data
limit 10;

# 6 Use sql query to find how many rows of data you have (21597)
select count(*) from house_price_data;

# 7 Now we will try to find the unique values in some of the categorical columns:
# What are the unique values in the column bedrooms, bathrooms, floors, condition, grade? 
select count(distinct bedrooms) as n_bedrooms, count(distinct bathrooms) as n_bathrooms, count(distinct floors) as n_floors, count(distinct `condition`) as n_condition, count(distinct grade) as n_grade from house_price_data;

# 8 Arrange the data in a decreasing order by the price of the house. 
# Return only the IDs of the top 10 most expensive houses in your data.
select id from house_price_data
order by price DESC
limit 10;

# 9 What is the average price of all the properties in your data?
select avg(price) from house_price_data;

# 10 In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

# What is the average price of the houses grouped by bedrooms? 
#The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
select bedrooms,avg(price) as average_price from house_price_data
group by bedrooms;

# What is the average sqft_living of the houses grouped by bedrooms? 
#The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
select bedrooms, avg(sqft_living) as average_sqft_living from house_price_data
group by bedrooms;

# What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.
select waterfront, avg(price) as average_price_w from house_price_data
group by waterfront;

# Is there any correlation between the columns condition and grade? 
# You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
# Visually check if there is a positive correlation or negative correlation or no correlation between the variables.

select avg(grade), `condition` from house_price_data
group by `condition` 
order by `condition` ASC;

# 11 One of the customers is only interested in the following houses:
#Number of bedrooms either 3 or 4
#Bathrooms more than 3
#One Floor
#No waterfront
#Condition should be 3 at least
#Grade should be 5 at least
#Price less than 300000
select * from house_price_data
where bedrooms in(3,4) and bathrooms>'3' and floors='1' and waterfront='0' and `condition` >= '3' and grade >='5' and price < '300000';

# 12 Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
# Write a query to show them the list of such properties. You might need to use a sub query for this problem.

Select id from house_price_data where price >
(select 2*avg(price) from house_price_data);

# 13 Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW prop_2_time_average_p AS
Select id from house_price_data where price >
(select 2*avg(price) from house_price_data);

select * from prop_2_time_average_p;

# 14 Most customers are interested in properties with three or four bedrooms. 
# What is the difference in average prices of the properties with three and four bedrooms?

SELECT b4.avgprice4 - b3.avgprice3 as diffavgprice from
(SELECT AVG(price) as avgprice3 from house_price_data
WHERE bedrooms ='3'
group by bedrooms) as b3,
(SELECT avg(price) as avgprice4 from house_price_data
WHERE bedrooms ='4'
group by bedrooms) as b4;

# 15 What are the different locations where properties are available in your database? (distinct zip codes)
Select distinct zipcode from house_price_data;

# 16 Show the list of all the properties that were renovated.
Select * from house_price_data
WHERE yr_renovated !='0';

# 17 Provide the details of the property that is the 11th most expensive property in your database.

Select * from house_price_data where id =(Select id from house_price_data
order by price DESC
limit 11);

With ordered as(select row_number() over (order by price DESC) as RowNumber, id, price, zipcode from house_price_data) select * from ordered where RowNumber=11;

#Features of properties above 650000

select avg(bedrooms), avg(bathrooms), avg(sqft_living), avg(`condition`), avg(grade) from house_price_data
where price>650000;

select bedrooms from house_price_data
where price>650000
group by bedrooms
order by count(*) DESC;

select bathrooms from house_price_data
where price>650000
group by bathrooms
order by count(*) DESC;

select sqft_living from house_price_data
where price>650000
group by sqft_living
order by count(*) DESC;

select `condition` from house_price_data
where price>650000
group by `condition`
order by count(*) DESC;

select grade from house_price_data
where price>650000
group by grade
order by count(*) DESC;

select yr_built from house_price_data
where price>650000
group by yr_built
order by count(*) DESC;

select zipcode from house_price_data
where price>650000
group by zipcode
order by count(*) DESC;
