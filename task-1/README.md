# Task 1: Data Cleaning and Preprocessing

## 📌 Objective
Clean and prepare a raw dataset by handling missing values, removing duplicates, standardizing data formats, and ensuring consistency and usability for downstream analysis.

## 🛠 Tools Used
- Python 3
- Pandas
- Jupyter Notebook / VS Code / Any IDE
- Excel (optional for manual inspection)

## 📂 Dataset
You can use any raw dataset with quality issues. Suggested examples from Kaggle:
- Customer Personality Analysis
- Medical Appointment No Shows
- Mall Customer Segmentation Data
- Netflix Movies and TV Shows
- Sales Data

## ✅ Cleaning Steps

1. **Load Data**
   - Imported dataset using `pandas.read_csv()`.

2. **Initial Inspection**
   - Used `.info()`, `.describe()`, and `.head()` to understand data structure.

3. **Handle Missing Values**
   - Identified with `.isnull().sum()`.
   - Dropped or imputed missing values depending on the column.

4. **Remove Duplicates**
   - Used `.drop_duplicates()` to ensure unique rows.

5. **Standardize Text Columns**
   - Converted inconsistent values in categorical columns (e.g., gender: `F`, `f`, `Female` → `female`).

6. **Fix Date Formats**
   - Converted date strings to standard `datetime` format (`dd-mm-yyyy`) using `pd.to_datetime()`.

7. **Rename Columns**
   - Applied consistent naming: lowercase, no spaces, used underscores (`_`) instead.

8. **Correct Data Types**
   - Converted columns to appropriate types (e.g., `age` to `int`, `income` to `float`, `date` to `datetime`).

9. **Export Cleaned Dataset**
   - Saved cleaned data as `cleaned_dataset.csv` for further analysis.

## 📄 Summary of Changes
- Removed X duplicate rows.
- Filled/Dropped missing values in columns: [...].
- Standardized formats in text fields (e.g., gender, country names).
- Ensured column names are clean and uniform.
- Converted data types to appropriate formats.

## 📁 Output Files
- `cleaned_dataset.csv`: Final cleaned dataset ready for analysis.
- `data_cleaning_script.ipynb`: Jupyter notebook or script used for cleaning.
- `README.md`: Documentation of the process.

## 👩‍💻 How to Run
1. Clone this repo or download the files.
2. Install required libraries:
   ```bash
   pip install pandas
