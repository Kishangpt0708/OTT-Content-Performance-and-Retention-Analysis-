# 📊 Data Analytics Project OTT-Content-Performance-and-Retention-Analysis


### 📌 Project Overview

This project analyzes viewer engagement and retention patterns across OTT platforms using a dataset of **33,171 records**. The primary objective is to identify behavioral factors leading to viewer drop-off—specifically **cognitive load, pacing, and opening hook strength**—and evaluate content performance across genres and platforms. These insights support data-driven decisions for content acquisition, production, and optimization.

### 📁 Dataset Summary

* **Records:** 33,171 entries with 23 features.
* **Key Attributes:** Platform, Genre, Pacing Score, Hook Strength, Dialogue Density, Visual Intensity, Average Watch Percentage, Cognitive Load, and Retention Risk.
* **Data Quality:** Standardized formats with minimal missing values and consistent data types.

### 🛠 Tools & Technologies

* **Python:** Environment setup using Pandas, NumPy, and SQLAlchemy for ingestion and exploratory analysis.
* **SQL (PostgreSQL):** Identifying successful platforms and high-risk genres through structured queries.
* **Power BI:** Interactive dashboarding to visualize KPIs like **Retention Risk Score** and **Cognitive Load Index**.
* **Gamma:** Professional presentation creation to summarize analytical findings.

---

### 🔍 Key Analytics Insights

#### 1. The "First Impression" Rule

Data indicates that the highest viewer drop-off occurs within the **first 10 minutes** of a series. Shows with strong "opening hooks" (rated above 7) increase overall season completion rates by **12–15%**.

#### 2. The Goldilocks Pacing Effect

Viewers prefer "balanced" pacing. A **pacing score of 8** yields the highest average watch percentage (**72.63%**), while extremely fast pacing causes confusion and slow pacing leads to boredom.

#### 3. Cognitive Load: The Brain Tax

High dialogue density and complex storytelling significantly increase cognitive load, which is a primary driver of drop-off in high-quality drama content. Excessive rewinding behavior serves as a strong indicator of this viewer fatigue.

#### 4. The Skip-Intro Paradox

Users who **do not skip intros** actually show a higher average completion rate (**62.80%**) compared to those who do (**50.65%**).

---

### 📈 Content Performance Grading System

Shows were categorized based on a weighted combination of watch percentage and retention risk.

| Grade | Meaning | Recommended Business Action |
| --- | --- | --- |
| **A** | Top Performers | Renew show and increase marketing spend to maximize ROI. |
| **B** | Solid Performer | Improve pacing, editing, or episode length to boost completion. |
| **C** | Needs Improvement | Simplify scripts and reduce cognitive load to prevent fatigue. |
| **D** | Danger Zone | Consider cancellation, reboot, or major restructuring. |

---

### 💰 ROI Estimation

ROI is calculated using a retention-based approach:


* **Example Calculation:** Retaining 10,000 users at an ARPU of ₹300 with an improvement cost of ₹20,00,000 results in a **50% ROI**.

  

## 📊 Dashboard

* Built using **Power BI**
* Includes:

  * Key performance indicators (KPIs)
  * Designed for easy interpretation by non-technical users

## PAGE 1
<img width="1315" height="732" alt="Screenshot 2025-12-29 140252" src="https://github.com/user-attachments/assets/b16403b6-82d9-4eab-8d69-6c60bcb92fad" />


## PAGE 2
   
<img width="1334" height="740" alt="Screenshot 2025-12-29 140335" src="https://github.com/user-attachments/assets/c19524fa-be72-4e17-80e4-eff098dbb712" />

    

### 📌 Final Business Recommendations

* **Hook Optimization:** Prioritize strengthening opening hooks, especially for shows currently rated below 7.
* **Complexity Management:** Reduce dialogue density in early episodes of high-risk dramas to lower cognitive load.
* **Re-engagement:** Use SQL-derived lists of at-risk shows to trigger personalized promotions or recap content.
