# PREDICTIVE MODELING OF HEART DISEASE PERCENTAGE FOR A GIVEN CITY

**Introduction:**
In statistics, linear regression is used to model the relationship between a continuous dependent variable and one or more independent variables. The independent variable can be categorical or numeric. When we have only one independent variable, it's called simple linear regression. If we have more than one independent variable, it's called multivariate or multiple regression. A mathematical representation of a multiple linear regression model is as follows: 

In the equation above, the coefficient β0 represents the intercept, and the coefficient βi represents the slope.

**Database:**
- **data.heart.csv:** This dataset contains information about heart disease, provided by the well-known website KAGGLE. It includes two variables: smoking and biking. This dataset can be used to study heart disease and understand the factors that influence this variable. It can be utilized by researchers, data scientists, and anyone interested in health data analysis.

**Motivation:**
The dataset aims to address the following key questions:
1. Do the initially chosen predictive factors truly have an impact on heart disease? What are the predictive variables that actually affect heart disease?
2. Does heart disease have a positive or negative correlation with smoking and biking?

**Variables:**
Two quantitative explanatory variables:
- **Biking:** The percentage of people commuting to work by bike each day.
- **Smoking:** The percentage of smokers.
And the response variable:
- **Heart Disease:** The percentage of people suffering from heart diseases.

**Conclusion:**
Using the R software, we were able to implement descriptive statistics, hypothesis tests, and data analysis techniques covered in the course. We discovered which variables are significant in our dataset through the modeling process.
Based on the findings, we validate our model and deduce a decrease of 0.2% (± 0.0013) in the frequency of heart diseases for every 1% increase in biking practice and an increase of 0.177% (± 0.0033) in the frequency of heart diseases for every 1% increase in smoking.
