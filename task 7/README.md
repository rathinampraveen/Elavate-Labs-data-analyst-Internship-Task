#  Sales Summary with Python & SQLite

A beginner-friendly project that connects Python to a tiny SQLite database to calculate and visualize basic sales metrics — total quantity sold and total revenue — using SQL, pandas, and matplotlib.

---

##  Features

- Creates a local SQLite database (`sales_data.db`)
- Executes SQL queries inside Python
- Generates a product-wise sales summary
- Visualizes total revenue by product with a bar chart
- Saves the chart as `sales_chart.png`

---

##  Files

| File | Description |
|------|-------------|
| `create_sales_db.py` | Creates & populates the `sales` table in `sales_data.db` |
| `sales_summary.py`  | Runs SQL queries, prints summary, and plots revenue chart |
| `sales_data.db`     | SQLite database (auto-created) |
| `sales_chart.png`   | Output revenue chart |

---

##  Setup Instructions

```bash
# Clone the repo

git clone https://github.com/yourusername/sales-summary-sqlite.git
cd sales-summary-sqlite

# Install dependencies

pip install pandas matplotlib

# Create the SQLite database with sample data

python create_sales_db.py

# Run the summary script

python sales_summary.py

#Example Output


 ##Basic Sales Summary:


   product  total_qty  revenue
0  Widget A         17   101.83
1  Widget B          7    69.93
2  Widget C          9   134.91


# Skills Practiced

SQL querying in Python

Data manipulation with pandas

Basic data visualization

SQLite basics
