# Stock-Returns-Predictions-with-Tweets
Population of Interest:   Tweets tagging 100 different large companies between 2017- 2018   Quantity of Interest:  Predicting Stock Returns (1 day, 2 day, 3 day and 7 day) 

# Predicting stock return with Twitter tweets in R 
Data from kaggle : [https://www.kaggle.com/datasets/omermetinn/tweets-about-the-top-companies-from-2015-to-2020](https://www.kaggle.com/datasets/thedevastator/tweet-sentiment-s-impact-on-stock-returns)

## Idea 
The initial idea is to simplified the returns to binary outcomes : 1 for positive return and 0 otherwise. 
The concept is to try and predict the daily return. 

### FAANG companies 
Since FAANG has a huge weight on the market (S&P 500) 

## Pre-processing
1. Replacing HTML 
2. Replacing URL 
3. Replacing Emoji 
4. Removing missing values
5. Created binary indicator (made_money) based on stock return
6. Generated DFM to identify common bigrams and unigrams, excluding company names using a custom stop list to avoid bias

## Models 
1. N-gram LASSO
2. Vector Embedding
3. N-gram LASSO combined with Vector Embedding
4. Positive Sentiment and Uncertainty sentiment with Loughran-McDonald dictionary

## Files 
"TMEF Project.pdf" - Final presentation: Winning best returns based analysis for Text Mining for Economics and Finance (Imperial College Business School MSc Class)

"binary_prediction (1).Rmd" - Main RMD file which produced binary predicitons for company returns (1 or 0 == positive or negative)

"TMEF_dfm.R" - Document Feature Matrix function (leveraged in "binary_prediction.rmd")

"vectorFunctions (1).R" - Useful functions for handling word vectors

"Industry_prediction.Rmd" - Prediction of company industries based upon tweets (done to test benchmark models)

"industries.csv" - List of industries used for model training

	TWEET	STOCK	DATE	LAST_PRICE	1_DAY_RETURN	2_DAY_RETURN	3_DAY_RETURN	7_DAY_RETURN	PX_VOLUME	VOLATILITY_10D	VOLATILITY_30D	LSTM_POLARITY	TEXTBLOB_POLARITY
 ![image](https://github.com/pakwule/Stock-Returns-Predictions-with-Tweets/assets/25259384/f4dc03fb-e5f6-45ec-a70d-c6b16a561977)
