# Pacmann-Data-Wrangling-and-SQL

Olist is an ecommerce platform that integrate sellers and marketplaces. 
Olist provided sellers with tools to manage products, make sales, customer service, and receive payments in a single place.

In this project, I try to analize Olist dataset, to know:

1. Relation between order and customers growth
2. Customer satisfaction, the cause and the effect 
3. Top ten most ordered product category
4. Customer’s state ranked in term of number and total value order
5. Trend of payment type for order

Before analizing, I did data checking such as NaN identification, Data inconsistency (Field value, Table record relation) and Other checking. 
I used sql syntax in <b>data checking.sql</b> file to  do it, and update the dataset if needed <b>(data updating.sql)</b>. 
Summary of the updates made, can be seen in the table below.

![image](https://user-images.githubusercontent.com/116284597/216281775-0bacbc14-1af2-4525-8224-26e9cac17ca3.png)

After data checking, I create view to generate data for analizing to achieve the objectives 
and create index to accelerate query in sqlite database <b>(view creation.sql and index creation.sql)</b>. 
To visualize, I create python code to access olist dataset and create graph refer to the data <b>(datawranglingsqlproject.py)</b>

if you are interested to read the results of the analysis, please <a href="https://medium.com/@mohamad.baidowi/pacmann-data-wrangling-sql-project-181643a96476" >click here</a>
