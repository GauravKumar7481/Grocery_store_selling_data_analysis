# 🛒 Kirana Store Data Analysis

This project provides a SQL and python-based analysis of a small Kirana (retail) store's sales and customer data. It includes a normalized database schema, sample data, and insightful queries to explore daily transactions, revenue, profitability, and customer behavior.

---

## 📁 Folder Structure


---

## 🧱 Database Schema Overview


### `product_selling`
- `Date`
- `Product_ID` (PK)
- `Units_Sold`
- `Unit_Price`
- `Cost_Price`

### `customer`
- `Customer_ID`
- `Customer_Name`
- `Product_ID` (FK)
- `Units_Purchased`
- `Payment`

---

## 🔍 Sample Business Questions Answered

- 💰 What is the total revenue on a given day?
- 📦 Which product generated the highest revenue?
- 🛑 Which products are selling at cost (no profit)?
- 🧍‍♂️ What are the purchase patterns of customers?
- 📊 What products are sold most often?
- Here are several questions that can be asked based on the given MySQL product_selling table and data:

---

### 🔍 *Basic Data Understanding*

1. *How many products were sold on 2025-06-01?*
   *(Count of rows where Units_Sold > 0)*

2. *What are the distinct product names sold?*

3. *Which product had zero units sold?*

---

### 📊 *Sales and Revenue Insights*

4. *What is the total revenue generated on 2025-06-01?*
   *(Sum of Units_Sold * Unit_Price)*

5. *Which product generated the highest revenue?*
   *(Product with the highest Units_Sold * Unit_Price)*

6. *What is the total profit made on 2025-06-01?*
   *(Sum of (Unit_Price - Cost_Price) * Units_Sold)*

7. *Which product was the most profitable?*

8. *Which product had the highest profit margin?*
   *(Use formula: (Unit_Price - Cost_Price)/Cost_Price)*

---

### 📦 *Inventory and Product Analysis*

9. *How many different products were sold?*
   *(Use DISTINCT Product_ID)*

10. *Which products have duplicate entries (e.g., same name but different IDs or prices)?*

11. *Which product had the highest number of units sold?*

12. *Which products are priced the same as their cost price (i.e., no profit)?*

---

### 🧮 *Comparative & Logical Questions*

13. *How many products had a selling price higher than their cost price?*

14. *How many products had a selling price less than or equal to the cost price?*

15. *What is the average selling price of products?*

16. *Which products sold more than 5 units?*

17. *List all products whose unit price is greater than ₹100.*

---

Through python bar chart and pie chart are drawn..

