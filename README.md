# 📊 Fintech Customer Transaction And Risk Analytics Project  
*(SQL & Power BI | End-to-End Business Analysis)*

---

## 🔹 Business Problem

A fintech platform was facing **uneven customer activity and unclear visibility into customer value and risk**.  
Although transaction data was available, the business struggled to answer key questions:

- How is customer transaction behavior changing over time?
- Which customers generate the most value?
- Which customers are becoming inactive or risky?
- Where should the business focus its retention and growth efforts?

The core challenge was to convert **raw transaction data into actionable, decision-ready insights**.

---

## 🔹 Objective

The objective of this project was to:

1. Analyze overall **customer transaction behavior**
2. Segment customers based on **value and risk**
3. Support **data-driven retention, reactivation, and growth decisions**

---

## 🔹 Data Overview

The analysis was performed on structured CSV datasets containing:

- Customer transaction details  
- Customer profile information  
- A date dimension for time-based analysis  

Data quality checks confirmed the datasets were clean, consistent, and suitable for analytics.

---

## 🔹 Data Modeling & Analytics Approach

A layered, industry-style analytics approach was followed:

### 1️⃣ Raw Data Validation  
- Raw tables were validated for null values, duplicates, and data consistency  
- As the data was already clean, no unnecessary transformations were applied  

### 2️⃣ SQL Views for Analytics  
SQL was used to define analytical logic through views:
- Raw views to isolate source data  
- Aggregated views to analyze customer transaction behavior  
- Segmentation views to classify customers by value and risk  

This ensured consistent business logic and a clean data model for Power BI.

---

## 🔹 Dashboard Design (Power BI)

Two focused dashboards were designed to answer distinct business questions:

### 📄 Page 1: Customer Transaction & Behavior Overview  
**Question answered:** *What is happening in the business?*

This dashboard provides insights into:
- Total transactions and transaction value  
- Active customer count  
- Transaction trends over time  
- Payment method usage  
- City-wise transaction activity  

---

### 📄 Page 2: Customer Value & Risk Segmentation  
**Question answered:** *Who matters most and what actions should be taken?*

This dashboard focuses on:
- Customer value segmentation (High / Medium / Low)  
- Customer risk status (Active / At Risk / Dormant)  
- Identification of high-value but at-risk customers  
- City-level concentration of risky customers  

---

## 🔹 Key Insights

### 🔍 What Happened
- Transaction activity showed noticeable variation over time, indicating clear peak and low-activity periods  
- A relatively small group of customers contributed a large share of total transaction value  
- Customer activity was concentrated in specific cities rather than evenly distributed  

### 🔍 Why It Happened
- High-value customers displayed higher transaction frequency and recent activity  
- At-risk and dormant customers showed declining engagement over time  
- Regional differences reflected varying levels of platform adoption and usage  

### 🔍 So What (Business Impact)
- Heavy reliance on a limited high-value segment increases revenue risk  
- Dormant customers represent missed opportunities for reactivation  
- City-level concentration highlights where targeted growth and retention efforts can have the highest impact  

---

## 🔹 Recommendations (Now What)

Based on the analysis, the following actions are recommended:

1. **Retention Strategy**  
   - Proactively retain high-value customers showing early risk signals  

2. **Customer Reactivation**  
   - Launch targeted campaigns to re-engage dormant and at-risk customers  

3. **Regional Focus**  
   - Invest in high-performing cities while improving adoption in lower-activity regions  

4. **Ongoing Monitoring**  
   - Continuously track customer value and risk segments to prevent churn  

---

## 🔹 Tools & Technologies

- **SQL** – Data validation, aggregation, and customer segmentation  
- **Power BI** – Data modeling, visualization, and dashboard development  

---

## 🔹 Outcome

This project demonstrates the ability to:
- Translate raw data into meaningful business insights  
- Use SQL for analytical reasoning rather than basic querying  
- Build decision-focused dashboards aligned with real-world business questions  

The final solution enables stakeholders to **understand customer behavior, identify risk early, and take informed business actions**.

---

## 🔹 Portfolio Note

This project was intentionally rebuilt and refined to follow **industry-standard analytics practices**, including clean data modeling, purposeful SQL usage, and business-driven dashboard design.

