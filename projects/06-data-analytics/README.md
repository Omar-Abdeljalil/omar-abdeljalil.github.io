# Customer Sales & Marketing Analytics

**Multi-tool analytics pipeline — SQL Server → Python → Power BI**

| | |
|---|---|
| **Course** | Data Analytics |
| **Instructor** | Dr. Saleem Ramadan |
| **Institution** | Al-Hussein Technical University (HTU), Jordan |
| **Type** | Individual project |

---

## The project

End-to-end analytics pipeline exploring how **customer demographics (age, income, gender, region)** drive **total sales** and how **marketing campaigns** affect product-level revenue. Combines database design, data cleaning across SQL and Python, statistical modeling, and BI dashboarding.

## Pipeline

### 1. Database design (MS SQL Server)

Four-table relational schema in a database named `Data Project`:

- **Customers** — CustomerID (PK), Name, Age, Gender, Income, Region
- **Products** — ProductID (PK), ProductName, Category, Price, StockQuantity
- **Sales** — SaleID (PK), CustomerID (FK), ProductID (FK), SaleDate, Quantity, TotalAmount
- **Marketing_Campaigns** — CampaignID (PK), CampaignName, StartDate, EndDate, Budget, ProductID (FK)

### 2. Data cleaning

**SQL side:**
- Outlier removal (unrealistic ages < 10 or > 100)
- Gender standardization (F/M → Female/Male, whitespace trimming)
- Region label normalization (N/S/E/W → North/South/East/West)
- Duplicate removal via `ROW_NUMBER() OVER (PARTITION BY ...)`
- Name formatting (proper case)

**Python side:**
- Regex-based income cleaning (strip special chars, convert to numeric)
- Random-sample imputation for missing income
- Median imputation for missing age

### 3. Business queries

Wrote analytical queries covering top regions, low-stock products, monthly product sales, income-group segmentation, sales by category × region, and average purchase by age group — using `GROUP BY`, `JOIN`, `CASE`, `SUM/AVG/COUNT`, and `DATEPART/YEAR/MONTH`.

### 4. Regression analysis

**Multivariate linear regression:** `TotalSales ~ Income + Age` using scikit-learn.

```
R² (model accuracy)       : 0.318
Intercept                 : −5,532.95
Coefficient — Income      :   +0.1497
Coefficient — Age         : +277.19
```

**Interpretation:** ~32% of the variance in total sales is explained by age and income together. Age is the stronger driver — each additional year adds ~277 units of spending, suggesting older customers spend more.

### 5. Power BI dashboard

7 interactive visuals covering:
1. Total Amount by Year (line chart)
2. Marketing Campaign Budget by Product (treemap)
3. Customer Demographics vs Spending (stacked bar, Gender × Age)
4. Sales Over Time (line chart)
5. TotalAmount by ProductName and Region (stacked column)
6. Total Sales Before / During / After Campaigns (clustered column)
7. Product Name Filter (slicer) — interactive filtering across all visuals

## Key insights

- **Peak sales in 2022** (1.64 M) with a dip in 2023 and partial recovery in 2024
- **Electronics category** dominates in the East region
- **Post-campaign sales lift** clearly visible for Laptops and Smartphones (validates campaign effectiveness)
- **Age > 50** customer group had the highest average purchase amount

## Tools & methods

- **MS SQL Server** — schema design, cleaning, analytical queries
- **Python** — `pandas`, `numpy`, `sklearn.linear_model`, `matplotlib`
- **Power BI** — dashboard design, visual selection, slicer interactivity

## Files in this folder

- `report.docx` — Full report with all SQL queries, Python code, chart explanations
- *(Add:* raw CSVs, `.pbix` dashboard file, cleaned Python scripts *)*

## Read the full report

📄 [**report.docx**](./report.docx)
