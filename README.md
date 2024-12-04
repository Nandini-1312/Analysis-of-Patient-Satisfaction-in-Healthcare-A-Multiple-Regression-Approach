# Analysis-of-Patient-Satisfaction-in-Healthcare-A-Multiple-Regression-Approach


This project analyzes patient satisfaction in a healthcare setting based on a sample of 55 patients, using variables such as age, length of stay, the number of nurses stationed on the same floor, and the average number of visits per day made by medical staff. The goal is to identify the factors that contribute to patient satisfaction and predict future satisfaction scores based on patient-specific data. Using a multiple regression model implemented in SAS, we assess the impact of these predictors and interpret the results in the context of healthcare administration.

**Objectives:**
  
    • Identify Predictors: Understand how factors like age, length of stay, nurse-to-patient ratio, and medical staff visits influence patient satisfaction.
    
    • Regression Analysis: Build a multiple regression model to predict patient satisfaction.
    
    • Model Evaluation: Evaluate the explanatory power of the model using R² and assess statistical assumptions.
    
    • Healthcare Recommendations: Provide actionable insights for healthcare administrators to improve patient care based on model findings.



**Data Extraction:**

  Data is extracted from a dataset (patient_satisfaction.txt) containing 55 observations of the following variables:
  
    • Sat_score: Patient satisfaction score (0–100)
    
    • Age: Patient age
    
    • LOS: Length of stay (days)
    
    • Num_nurse: Number of nurses on the patient's floor
    
    • Num_visits: Average number of visits by medical staff per day

**Data Analysis Methodology:**

 
To address the study’s question, the following statistical methods were used:

  • Descriptive Statistics: To understand the basic distributions of the data, including mean, median, and standard deviation.
  
  • Pearson Correlation: To measure the linear relationships between the satisfaction score and the predictors.
  
  • Multiple Linear Regression: To model patient satisfaction based on the predictor variables.
  
  • Confidence Intervals & Predictions: To quantify the uncertainty in the correlations and predictions made by the model.
  
  • Hypothesis Testing: To assess the impact of individual predictors on the outcome.


**SAS Implementation & Results**

The following SAS code and outputs were used to analyze the data:

• Pearson Correlation
      The correlation matrix was computed to understand the strength of relationships between the satisfaction score and other variables. 
      Here's a snippet of the correlation output:

      ![image](https://github.com/user-attachments/assets/b91d39eb-a24c-4780-a3bf-1bd2ba25486b)



**Confidence Interval for Pearson Correlation**

The 95% confidence interval for the correlation between satisfaction score and average number of staff visits is between 0.434957 and 0.765593. This suggests a significant positive relationship.

**Multiple Linear Regression**

The model fit was conducted with the satisfaction score as the dependent variable and the remaining four variables as predictors. 

The following output was obtained from the ANOVA table:

    F-value: 557.02
    
    p-value: < 0.05 (indicating significant relationship)
    
The regression equation was derived as:

    Satisfaction Score = 𝛽0+𝛽1(Age)+𝛽2(LOS)+𝛽3(Num_nurse)+𝛽4(Num_visits)
    
    Satisfaction Score=β0​ +β1 (Age)+β2 (LOS)+β3 (Num_nurse)+β4​ (Num_visits)





**Hypothesis Test for Dropping Variables**

  A general linear hypothesis test was performed to assess if the number of nurses and average daily visits could be removed from the model. Based on the ANOVA output, we concluded that both variables significantly contribute to predicting satisfaction scores, so they should not be removed from the model.

**Assumptions and Model Evaluation**

The model was evaluated based on the following assumptions:

    **Linearity:** A linear relationship between predictors and satisfaction score was assumed.
    
    **Independence:** Residuals were assessed for independence.
    
    **Homoscedasticity:** Residuals were checked for constant variance.
    
    **Normality:** The Shapiro-Wilk test on residuals showed p = 0.0259, indicating deviations from normality.
        
    The model explains 97.81% of the variation in satisfaction scores, with an R-squared value of 0.9781. 
    
    All predictors (age, length of stay, number of nurses, and staff visits) have p-values less than 0.05, indicating their significant contribution. While the assumptions of linearity, homoscedasticity, and normality generally hold, slight deviations suggest potential for model refinement.
    
**Prediction for New Observations**

    For a patient aged 50, staying for 3 days with 10 nurses and 5 visits per day, the estimated satisfaction score is 37.7064, with a 95% prediction interval of 34.1277 to 41.2850.

**Hypothesis Test for Dropping Variables:**
    
    A general linear hypothesis test was performed to assess if the number of nurses and average daily visits could be removed from the model. Based on the ANOVA output, we concluded that both variables significantly contribute to predicting satisfaction scores, so they should not be removed from the model.


**Conclusion:**
  The analysis identified key factors influencing patient satisfaction, highlighting areas where improvements can be made:
  
    • Average Number of Staff Visits: This variable showed the strongest positive correlation with patient satisfaction, explaining about 40% of the variation in satisfaction scores. Increasing the frequency of staff visits is a key area for improvement, and the hospital can optimize staff schedules to provide more attention to patients.
    
    • Number of Nurses on the Same Floor: While the relationship is weaker, with only 7% of satisfaction variation explained, increasing the number of nurses on the same floor can contribute to better care and modestly improve satisfaction scores.
    
    • Patient’s Age: Older patients tend to report lower satisfaction scores. Though age cannot be controlled, providing more personalized care, addressing specific needs, and offering comfort measures can enhance satisfaction for older patients.
    
    • Length of Stay: This variable has minimal impact on satisfaction scores. The hospital should focus more on improving treatment quality and reducing delays, rather than emphasizing length of stay.
