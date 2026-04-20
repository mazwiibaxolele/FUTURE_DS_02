CREATE DATABASE churn_analysis;
USE churn_analysis;

USE churn_analysis;

CREATE TABLE customers (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen VARCHAR(5),
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(30),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(5)
);

USE churn_analysis;

SELECT COUNT(*) FROM customers;
SELECT 
    Churn,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Churn;

SELECT 
    Contract,
    Churn,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract;

SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customers
GROUP BY Churn;

SELECT 
    SeniorCitizen,
    COUNT(*) AS total_customers,
    
    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers
GROUP BY SeniorCitizen;

SELECT 

    PaymentMethod,

    COUNT(*) AS total_customers,

    SUM(CASE 

        WHEN Churn = 'Yes' THEN 1 

        ELSE 0 

    END) AS churned_customers,

    ROUND(

        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),

        2

    ) AS churn_rate_percentage

FROM customers

GROUP BY PaymentMethod

ORDER BY churn_rate_percentage DESC;SELECT 

    PaymentMethod,

    COUNT(*) AS total_customers,

    SUM(CASE 

        WHEN Churn = 'Yes' THEN 1 

        ELSE 0 

    END) AS churned_customers,

    ROUND(

        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),

        2

    ) AS churn_rate_percentage

FROM customers

GROUP BY PaymentMethod

ORDER BY churn_rate_percentage DESC;