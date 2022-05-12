# Real Estate Seattle, WA/Case Study: Regression

![Real-Estate-Logo-Vactor](https://user-images.githubusercontent.com/103149782/167866803-2edaf60c-3047-4d7b-952c-9e58bbdd3845.png)

Colaborators [Miguel Villoslada](https://github.com/MiguelVilloslada) and [Andrew Coupe](https://github.com/andy1coupe)

### Index:

* [Scenario](#section1)
* [Objetive](#section2)
* [Approach](#section3)
* [First ideas](#section4)
* [In-Depth Analysis](#section5)
* [Conclusions](#section6)
* [Tableau](#section7)
* [SQL](#section8)
* [Presentation](#section9)


<a id='section1'></a>
### Scenario

We are working as analysts for a real estate company. Our company wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated.

<a id='section2'></a>
### Objective

Our job is to build a model that will predict the price of a house based on features in the dataset. Our management also wants to explore the characteristics of the houses using some business intelligence tools. One of those parameters includes understanding which factors are responsible for higher property value - $650K and above.

We followed this workflow in Python in order to build the required model.  Explore our Python Notebook on the following [link.](https://github.com/andy1coupe/RealEstateProject/blob/ae4614cd45aaaa26068f3d4b698e380c3f765e24/Python/Project%20Real%20Estate%20Final.ipynb)


<a id='section3'></a>
### Approach

The dataset we used consists of information on 22,000 properties and contains historic data of houses sold between May 2014 to May 2015.
Our first approach consisted of:

* Importing the data
* Exploring the data (EDA Method)
* Data wrangling
* Data cleaning

 <a id='section4'></a>
### First ideas

* The total dataset consited of 21,597 rows.  We did not find and nulls or duplicates, as the project was on Houses we first decided to check if any houses had duplicate geolocations, what we found was that some of the houses were sold more than once during the time period between May 2014 to May 2015. As we wanted to predict the price of houses using different features we will run and model the data with all data points, then run again with just the most recent purchase information.
* We also found a house with 33 rooms, we noticed that the 33 rooms are located on just one floor with around 100 sqm. So each bedroom would be 4.5 meters squared, we assume this is bad data or an error and will remove it. 
* We will look to clarify the definitions of the features: sqft_living15, grade, condition and bathrooms.


<a id='section5'></a>
### In-Depth Analysis

* We proceeded to realize the first iteration of linear regression using our Machine Learning Model only dropping the columns id and date.  Our accuracy score R2 was 0.7068, so the model performs well, but we wanted to improved it.

* In the second iteration linear regression we dropped id duplicates for houses sold several times only keeping the last sale, changing the year of renovation to binary 0 and 1, an removing the outlier of the bad data 33 bedroom property. We rescaled the data using MinMaxScaler.  Our R2 went down to 0.6914.

* In our third iteration we used KNN model with K=4, our r2 model result was 0.7864 which we were very pleased with considering our previous results.


<a id='section6'></a>
### Conclusions 

After running three versions of regression models we came to the conclusion that our best price prediction model was using the KNN (K-Nearest Neighbour) model, using K=4 which gave us a satisfying r2 result of 0.7864.

Generally speaking we came to the conclusion that dropping multiple features did not improve the accuracy of our models and that when predicitng the value of a property all the features are relevant in our machine learning model. 

To understand which factors are responsible for a property value of over $650,000 we used SQL to calculate the Mode on the main factors 
* Bedrooms 4  
* Bathrooms 2.5
* Sqft Living 2,440
* Condition 3
* Grade 9
* Year Built 2014 
* Most Expensive Zip codes of the data set were  Bellevue 98004, Medina 98039 and Mercer Island 98040. 

Seattle is home to more billionaires that any other city in the USA, a total of 8 billionaires live there with a combined net worth of $252B. Neighbours include Bill Gates, Jeff Bezos and Colleen Willoughby. 

<a id='section7'></a>
### Tableau

Our assignment deliverables also included visualization with Tableau. We aimed to visualize our findings in a way that a non-technical audience would find simple to understand as well as visually pleasing. To view our story follow the [link.](https://public.tableau.com/app/profile/miguel.angel1252/viz/ProjectRealEstate/Story1)


<a id='section8'></a>
### SQL

We used SQL to reach a deeper understanding of our dataset. We used queries to answer the questions set by our real estate company. Follow the [link](https://github.com/andy1coupe/RealEstateProject/blob/ae4614cd45aaaa26068f3d4b698e380c3f765e24/SQL/Project_Real_State.sql) to dive into our queries. 

<a id='section9'></a>
### Presentation

We used Powerpoint to make our presentation in the most visually appealing and simple way to present to stakeholders.  To view our presentation follow the [link.](https://ironhackus-my.sharepoint.com/:p:/g/personal/andrew_coupe_ironhackus_onmicrosoft_com/ERXzhC8nTqFGj4SUWIwhxUEBi7BMXTOVtpMA_OpGISjXhA?e=lcQWNb)
