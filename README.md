# App Store Data Analysis Project

## Scenario

An aspiring app developer would like to create an app and needs data-driven insights to decide what type of app to build. The stakeholder/client needs answers to the following questions:

- What app categories are most popular among users?
- What price should I set?
- How can I maximize user ratings?

## Business Task

**Create an app for the App Store that is user-friendly, meets consumer needs and is popular among consumers.** 

## Dataset Description

The dataset being assessed was originally uploaded to Kaggle.com under a General Public License, version 2 (GPL2) [[See Link]](https://www.kaggle.com/datasets/ramamet4/app-store-apple-data-set-10k-apps). Due to SQLite having a max allowable file size of 4MBs, the dataset was split into 5 .csv files. These files are named as follows:

- AppleStore.csv
- appleStore_description1.csv
- appleStore_description2.csv
- appleStore_description3.csv
- appleStore_description4.csv

After loading the data into SQLite, I utilized the Union All function to combine 'appleStore_description.csv', 'appleStore2_description.csv', 'appleStore_description3.csv' and 'appleStore_description4.csv' into a singular table named 'appleStore_description_combined'. The combined dataset contains 7,197 unique values.

## Exploratory Data Analysis (EDA)

The Exploratory Data Analysis (EDA) process involves processing the raw data into a clean format as well as gaining pertinent insights from the data prior to using it for further analysis. Here are some of the insights I found: 

- There were no missing/null values in either the 'AppleStore' or the 'appleStore_description_combined' tables, so the data was kept relatively clean
- The **Games** genre represented the highest number of apps in the App Store with a total of 3,862 apps. 
- On a scale of 0-5 stars, the average rating across the genres was ~3.5 stars
- The majority of apps within the App Store were free (4,056 apps)

Through further analysis of the data, I gained some more useful insights:

- On average, paid apps are typically rated higher than free apps
- Apps that support between 10-30 languages are rated higher than apps with either less than 10 or greater than 30 supported languages
- On average, the lowest rated apps are contained within the Finance and Book categories
- Apps with longer, more thorough descriptions were more likely to have a higher rating

## Recommendations

**1. Paid apps have better ratings**

Users who pay for/have a subscription to an app are more likely to be a highly engaged user of that app. If the client/stakeholder perceives their app to be of high quality consider making a free app with in-app purchases or 

**2. Apps supporting between 10 and 30 languages have better ratings**

Supporting a high quantity of languages isn't necessarily important; focus on your target audience when choosing which languages you choose to support in your app. 

**3. Finance and book genres are among the lowest rated apps**

This represents a great opportunity for the stakeholder as there is a lower barrier to entry in these markets. Creating a high-quality app in either of these categories that addresses user needs better than apps currently being offered means there is potential for higher user ratings.

**4. Apps with longer/more thorough descriptions have better ratings**

his shows that users prefer to know the uses and capabilities of an app prior to downloading it. A detailed app description sets clear expectations of the app being chosen and increases user confidence and satisfaction.

**5. A new app should aim for an average rating above 3.5 stars**

**6. Games and entertainment are among the highest rated app genres**

The games and entertainment genres are highly competitive; there is likely to be a higher barrier to entry as the market is more saturated in these categories.
