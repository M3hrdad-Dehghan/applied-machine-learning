<div align="center">
  <h1>
    Customer Return Prediction with Deep Learning (TensorFlow)
  </h1>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Machine%20Learning-Classification-blue?style=flat-square"/>
  <img src="https://img.shields.io/badge/Deep%20Learning-TensorFlow-lightblue?style=flat-square"/> 
  <img src="https://img.shields.io/badge/Domain-Customer%20Retention-success?style=flat-square"/>
</p>

---

## 🧠 Business Problem

In subscription-based digital platforms like **Apple Music**, customer retention is a critical driver of long-term revenue.  
While many users subscribe at least once, only a small portion return to renew their subscription.

Unfocused marketing campaigns targeting low-probability users lead to wasted advertising spend and inefficient resource allocation.

---

## 🎯 Objective 

Build a predictive machine learning model to estimate the likelihood of a customer renewing their subscription and enable targeted retention strategies.

---

## 📊 Data & Inputs

- User listening behavior (total & average listening minutes) </br>
- Purchase features (total & average spending) </br>
- Engagement signals (ratings, reviews, support tickets) </br>
- Customer lifetime (days since first usage) </br>
- Binary target variable indicating subscription renewal

---

## ⚙️ Technical Approach

- Framed the problem as a supervised **binary classification** task </br>
- Data preprocessing with **NumPy** (feature selection, shuffling, label separation) </br>
- Train / validation / test split for robust evaluation </br>
- Feature scaling applied only on training data to prevent data leakage </br>
- Designed a **deep neural network** using TensorFlow: Multiple dense layers / Activation functions / Dropout and L2 regularization </br>
- Handled class imbalance using computed class weights </br>
- Trained with **Adam optimizer** and binary cross-entropy loss </br>
- Early stopping based on validation loss to prevent overfitting </br>
- Final evaluation on unseen test data

---

## 🛠 Key Skills Demonstrated

- Customer retention & churn problem framing </br>
- End-to-end machine learning pipeline development </br>
- Handling imbalanced classification problems </br>
- Deep learning regularization & optimization </br>
- Data leakage prevention & proper evaluation </br>
- Translating ML results into actionable business insights

---

## 🎥 YouTube Walkthrough
 
https://youtu.be/mWAR-6zcoTU
