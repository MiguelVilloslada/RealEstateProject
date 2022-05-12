# Real Estate Washington State/Case Study: Regression

![Real-Estate-Logo-Vactor](https://user-images.githubusercontent.com/103149782/167866803-2edaf60c-3047-4d7b-952c-9e58bbdd3845.png)

Colaborators [Miguel Villoslada](https://github.com/MiguelVilloslada) and [Andrew Coupe](https://github.com/andy1coupe)

### Index:

* [Scenario](#section1)
* [Objetive](#section2)
* [Approach](#section3)
* [First ideas](#section4)
* [In-Depth Analysis](#section5)
* [Conclusions](#section6)
* [Tableau](githublinktableau)
* [SQL](https://github.com/andy1coupe/RealEstateWashingtonState/blob/main/Midbootproject2.sql)


<a id='section1'></a>
### Scenario

We are working as analysts for a real estate company. Our company wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated.

<a id='section2'></a>
### Objective

Our job is to build a model that will predict the price of a house based on features in the dataset. Our management also wants to explore the characteristics of the houses using some business intelligence tools. One of those parameters includes understanding which factors are responsible for higher property value - $650K and above.

We followed this workflow in Python in order to build the required model:
![Explore the data_using Pandas library.jpg](*********.jpg)


<a id='section3'></a>
### Approach

The dataset we used consists of information on 22,000 properties and contains historic data of houses sold between May 2014 to May 2015.
Our first approach consisted of:

* Importing the data
* Exploring the data (EDA Method)
* Data wrangling
* Data cleaning
* Check for multicolinearity

 <a id='section4'></a>
### First ideas

* The total dataset consited of 21,597 rows.  We did not find and nulls or duplicates, as the project was on Houses we first decided to check if any houses had duplicate geolocations, what we found was that some of the houses were sold more than once during the time period between May 2014 to May 2015. As we wanted to predict the price of houses using different features we will run and model the data with all data points, then run again with just the most recent purchase information.
* We also found a house with 33 rooms, we noticed that the 33 rooms are located on just one floor with around 100 sqm. So each bedroom would be 4.5 meters squared, we assume this is bad data or an error and will remove it. 
* We will look to clarify the definitions of the features: sqft_living15, grade, condition and bathrooms.


<a id='section5'></a>
### In-Depth Analysis

* We proceeded to realize the first iteration of our Machine Learning Model,
and our accuracy score R2 was relatively close to 1, so the model performs well, but we wanted to improved it.
<img src="*********.png"/>
* In the second iteration we did a preprocessing: We went through the standardization using StandardScaler to rescale and OneHotEncoder to process the categoricals. We got a better R2:
<img src="*********.png"/>
* We went through a third iteration, this time we did a rescale using the logarithmic method and we normalized the data using the Dummies Encoder
<img src="**********.png"/>


<a id='section6'></a>
### Tableau
[Link to tableau story](***********.tableau)

* Our assignment deliverables also included visualization with Tableau. We aimed to visualize our findings in a way that a non-technical audience would find simple to understand as well as visually pleasing.

<img src="********.png"/>



### SQL

We used SQL to reach a deeper understanding of our dataset. We used queries to answer the questions set by our real estate company. Follow the [link](https://github.com/andy1coupe/RealEstateWashingtonState/blob/main/Midbootproject2.sql) to dive into our queries. 
