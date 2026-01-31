# 🌟 Apple Music Subscription Renewal Prediction

<p align="center">
  <img src="https://img.shields.io/badge/Machine%20Learning-Classification-blue?style=flat-square"/>
  <img src="https://img.shields.io/badge/Deep%20Learning-TensorFlow-lightblue?style=flat-square"/>
  <img src="https://img.shields.io/badge/Domain-Customer%20Retention-success?style=flat-square"/>
</p>

---

## 🧠 Business Problem & Objective

In subscription-based digital platforms like **Apple Music**, customer retention is a critical driver of long-term revenue.  
While many users subscribe at least once, only a small portion return to renew their subscription.

Unfocused marketing campaigns targeting low-probability users lead to wasted advertising spend and inefficient resource allocation.

🎯 **Objective:**  
Build a predictive machine learning model to estimate the likelihood of a customer renewing their subscription and enable targeted retention strategies.

---

## 📊 Data & Inputs

- 🎧 User listening behavior (total & average listening minutes)
- 💳 Purchase features (total & average spending)
- ⭐ Engagement signals (ratings, reviews, support tickets)
- ⏱ Customer lifetime (days since first usage)
- 🎯 Binary target variable indicating subscription renewal

---

## ⚙️ Technical Approach

- ◻ Framed the problem as a supervised **binary classification** task
- ◻ Data preprocessing with **NumPy** (feature selection, shuffling, label separation)
- ◻ Train / validation / test split for robust evaluation
- ◻ Feature scaling applied only on training data to prevent data leakage
- ◻ Designed a **deep neural network** using TensorFlow:
  - Multiple dense layers
  - Activation functions
  - Dropout and L2 regularization
- ◻ Handled class imbalance using computed class weights
- ◻ Trained with **Adam optimizer** and binary cross-entropy loss
- ◻ Early stopping based on validation loss to prevent overfitting
- ◻ Final evaluation on unseen test data

---

## 🛠 Key Skills Demonstrated

✅ Customer retention & churn problem framing </br>
✅ End-to-end machine learning pipeline development </br>
✅ Handling imbalanced classification problems </br>
✅ Deep learning regularization & optimization </br>
✅ Data leakage prevention & proper evaluation </br>
✅ Translating ML results into actionable business insights

---

## 🎥 YouTube Walkthrough
 
  https://youtu.be/mWAR-6zcoTU
