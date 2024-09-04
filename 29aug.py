# ABISHEK R

import pandas as pd
import numpy as np
from datetime import datetime, timedelta

# Create a DataFrame with the following columns: "Product", "Category", "Price", and "Quantity". Use the following data:
data = {
    'Product': ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Phone'],
    'Category': ['Electronics', 'Accessories', 'Electronics', 'Accessories', 'Electronics'],
    'Price': [80000, 1500, 20000, 3000, 40000],
    'Quantity': [10, 100, 50, 75, 30]
    }
df = pd.DataFrame(data)
# 2. Print the DataFrame.
print(df)


# Exercise 2: Basic DataFrame Operations
#  Display the first 3 rows of the DataFrame
print(df.head(3))

# 2. Display the column names and index of the DataFrame.
print("Column names:", df.columns)
print("Index:", df.index)

# 3. Display a summary of statistics (mean, min, max, etc.) for the numeric columns in the DataFrame.

print(df.describe())

# Exercise 3: Selecting Data

# 1. Select and display the "Product" and "Price" columns.
print(df[['Product', 'Price']])

# 2. Select rows where the "Category" is "Electronics" and print them.
print(df[df['Category'] == 'Electronics'])


# Exercise 4: Filtering Data

# 1. Filter the DataFrame to display only the products with a price greater than 10,000.
print(df[df['Price'] > 10000])

# Filter the DataFrame to show only products that belong to the "Accessories" category and have a quantity greater than 50.
print(df[(df['Category'] == 'Accessories') & (df['Quantity'] > 50)])


# Exercise 5: Adding and Removing Columns

# 1. Add a new column "Total Value" which is calculated by multiplying "Price" and "Quantity".
df['Total Value'] = df['Price'] * df['Quantity']
print(df)

# 2. Drop the "Category" column from the DataFrame and print the updated DataFrame.
# df = df.drop('Category', axis=1)
# print(df)


# Exercise 6: Sorting Data

# 1. Sort the DataFrame by "Price" in descending order.
print(df.sort_values('Price', ascending=False))

# 2. Sort the DataFrame by "Quantity" in ascending order, then by "Price" in descending order (multi-level sorting).
print(df.sort_values(['Quantity', 'Price'], ascending=[True, False]))

# Exercise 7: Grouping Data

# 1. Group the DataFrame by "Category" and calculate the total quantity for each category.
print(df.groupby('Category')['Quantity'].sum())

# 2. Group by "Category" and calculate the average price for each category.
print(df.groupby('Category')['Price'].mean())


# Exercise 8: Handling Missing Data

# 1. Introduce some missing values in the "Price" column by assigning None to two rows.
df.loc[1, 'Price'] = None
df.loc[3, 'Price'] = None
print(df)

 # 2. Fill the missing values with the mean price of the available products.
df['Price'] = df['Price'].fillna(df['Price'].mean())
print(df)

# 3. Drop any rows where the "Quantity" is less than 50.
df = df[df['Quantity'] >= 50]
print(df)



# Exercise 9: Apply Custom Functions

# 1. Apply a custom function to the "Price" column that increases all prices by 5%.
df['Price'] = df['Price'].apply(lambda x: x * 1.05)
print(df)

# 2. Create a new column "Discounted Price" that reduces the original price by 10%.
df['Discounted Price'] = df['Price'].apply(lambda x: x * 0.9)
print(df)


# Exercise 10: Merging DataFrames
# 1. Create another DataFrame with columns "Product" and "Supplier", and merge it with the original DataFrame based on the "Product" column.
supplier_data = {
    'Product': ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Phone'],
    'Supplier': ['Dell', 'Logitech', 'Samsung', 'Logitech', 'Apple']
    }
supplier_df = pd.DataFrame(supplier_data)
merged_df = pd.merge(df, supplier_df, on='Product')
print(merged_df)


# Exercise 11: Pivot Tables

#1. Create a pivot table that shows the total quantity of products for each category and product combination.

pivot_table = pd.pivot_table(df, values='Quantity', index=['Category'], columns=['Product'], aggfunc=np.sum,fill_value=0)
print(pivot_table)


# Exercise 12: Concatenating DataFrames
# 1. Create two separate DataFrames for two different stores with the same columns ("Product", "Price", "Quantity").
store1_data = {
    'Product': ['Laptop', 'Mouse', 'Monitor'],
    'Price': [80000, 1500, 20000],
    'Quantity': [10, 100, 50]
    }
store2_data = {
    'Product': ['Keyboard', 'Phone'],
    'Price': [3000, 40000],
    'Quantity': [75, 30]
    }
df1 = pd.DataFrame(store1_data)
df2 = pd.DataFrame(store2_data)

# 2. Concatenate these DataFrames to create a combined inventory list.
combined_df = pd.concat([df1, df2], ignore_index=True)
print(combined_df)


# Exercise 13: Working with Dates
# 1. Create a DataFrame with a "Date" column that contains the last 5 days starting from today.
end_date = datetime.now().date()
start_date = end_date - timedelta(days=4)

# 2. Add a column "Sales" with random values for each day.
date_range = pd.date_range(start_date, end_date)
sales_data = {
    'Date': date_range,
    'Sales': np.random.randint(1000, 5000, size=5)
    }
df = pd.DataFrame(sales_data)
print(df)

# 3. Find the total sales for all days combined.
print("\nTotal sales:", df['Sales'].sum())


# Exercise 14: Reshaping Data with Melt

# 1. Create a DataFrame with columns "Product", "Region", "Q1_Sales", "Q2_Sales".

data = {
    'Product': ['A', 'B', 'C'],
    'Region': ['North', 'South', 'East'],
    'Q1_Sales': [100, 200, 300],
    'Q2_Sales': [150, 250, 350]
    }

df = pd.DataFrame(data)

# 2. Use pd.melt() to reshape the DataFrame so that it has columns "Product", "Region", "Quarter", and "Sales".
melted_df = pd.melt(df, id_vars=['Product', 'Region'], var_name='Quarter', value_name='Sales')
print(melted_df)





# ### *Exercise 16: Renaming Columns*

# 1. Given a DataFrame with columns "Prod", "Cat", "Price", "Qty", rename the columns to "Product", "Category", "Price", and "Quantity".

df = pd.DataFrame({
    'Prod': ['Laptop', 'Mouse', 'Keyboard'],
    'Cat': ['Electronics', 'Accessories', 'Accessories'],
    'Price': [1000, 25, 45],
    'Qty': [10, 50, 30]
})
df = df.rename(columns={'Prod': 'Product', 'Cat': 'Category', 'Qty': 'Quantity'})

# 2. Print the renamed DataFrame.
print(df)

# ### *Exercise 17: Creating a MultiIndex DataFrame*

# 1. Create a DataFrame using a MultiIndex (hierarchical index) with two levels: "Store" and "Product". The DataFrame should have columns "Price" and "Quantity", representing the price and quantity of products in different stores.

multi_index = pd.MultiIndex.from_product([['Store1', 'Store2'], ['Laptop', 'Mouse', 'Keyboard']], names=['Store', 'Product'])
df = pd.DataFrame({
    'Price': [1000, 25, 45, 1100, 30, 50],
    'Quantity': [10, 50, 30, 8, 40, 25]
}, index=multi_index)

# 2. Print the MultiIndex DataFrame.

print(df)

# ### *Exercise 18: Resample Time-Series Data*

# 1. Create a DataFrame with a "Date" column containing a range of dates for the past 30 days and a "Sales" column with random values.

date_range = pd.date_range(end=datetime.now(), periods=30)
df = pd.DataFrame({
    'Date': date_range,
    'Sales': np.random.randint(100, 1000, size=30)
})

# 2. Resample the data to show the total sales by week.

df.set_index('Date', inplace=True)
weekly_sales = df.resample('W').sum()
print(weekly_sales)

# ### *Exercise 19: Handling Duplicates*

# 1. Given a DataFrame with duplicate rows, identify and remove the duplicate rows.


df = pd.DataFrame({
    'Name': ['John', 'Jane', 'John', 'Mike', 'Jane'],
    'Age': [25, 30, 25, 35, 30]
})
df_cleaned = df.drop_duplicates()

# 2. Print the cleaned DataFrame.

print(df_cleaned)

# ### *Exercise 20: Correlation Matrix*

# 1. Create a DataFrame with numeric data representing different features (e.g., "Height", "Weight", "Age", "Income").


df = pd.DataFrame({
    'Height': np.random.normal(170, 10, 100),
    'Weight': np.random.normal(70, 5, 100),
    'Age': np.random.randint(20, 60, 100),
    'Income': np.random.normal(50000, 10000, 100)
})
# 2. Compute the correlation matrix for the DataFrame.
correlation_matrix = df.corr()
# 3. Print the correlation matrix.
print(correlation_matrix)

# ### *Exercise 21: Cumulative Sum and Rolling Windows*

# 1. Create a DataFrame with random sales data for each day over the last 30 days.

date_range = pd.date_range(end=datetime.now(), periods=30)
df = pd.DataFrame({
    'Date': date_range,
    'Sales': np.random.randint(1000, 5000, size=30)
})
df.set_index('Date', inplace=True)
# 2. Calculate the cumulative sum of the sales and add it as a new column "Cumulative Sales".
df['Cumulative Sales'] = df['Sales'].cumsum()
# 3. Calculate the rolling average of sales over the past 7 days and add it as a new column "Rolling Avg".
df['Rolling Avg'] = df['Sales'].rolling(window=7).mean()
print(df)


# ### *Exercise 22: String Operations*

# 1. Create a DataFrame with a column "Names" containing values like "John Doe", "Jane Smith", "Sam Brown".

df = pd.DataFrame({'Names': ['John Doe', 'Jane Smith', 'Sam Brown']})
# 2. Split the "Names" column into two separate columns: "First Name" and "Last Name".
df[['First Name', 'Last Name']] = df['Names'].str.split(expand=True)
# 3. Convert the "First Name" column to uppercase.
df['First Name'] = df['First Name'].str.upper()

print(df)

# ### **Exercise 23: Conditional Selections with np.where**

# 1. Create a DataFrame with columns "Employee", "Age", and "Department"

df = pd.DataFrame({
    'Employee': ['Alice', 'Bob', 'Charlie', 'David'],
    'Age': [35, 42, 28, 55],
    'Department': ['HR', 'Sales', 'IT', 'Finance']
})
#  2. Create a new column "Status" that assigns "Senior" to employees aged 40 or above and "Junior" to employees below 40 using np.where().
df['Status'] = np.where(df['Age'] >= 40, 'Senior', 'Junior')
#
print(df)

# ### *Exercise 24: Slicing DataFrames*

# 1. Given a DataFrame with data on "Products", "Category", "Sales", and "Profit", slice the DataFrame to display:
#    - The first 10 rows.
#    - All rows where the "Category" is "Electronics".
#    - Only the "Sales" and "Profit" columns for products with sales greater than 50,000.

df = pd.DataFrame({
    'Products': [f'Product_{i}' for i in range(20)],
    'Category': np.random.choice(['Electronics', 'Clothing', 'Food'], 20),
    'Sales': np.random.randint(10000, 100000, 20),
    'Profit': np.random.randint(1000, 10000, 20)
})
print(df.head(10))
print(df[df['Category'] == 'Electronics'])
print(df.loc[df['Sales'] > 50000, ['Sales', 'Profit']])

# ### *Exercise 25: Concatenating DataFrames Vertically and Horizontally*

# 1. Create two DataFrames with identical columns "Employee", "Age", "Salary", but different rows (e.g., one for employees in "Store A" and one for employees in "Store B").

df1 = pd.DataFrame({
    'Employee': ['Alice', 'Bob', 'Charlie'],
    'Age': [30, 35, 40],
    'Salary': [50000, 60000, 70000]
})
df2 = pd.DataFrame({
    'Employee': ['David', 'Eve', 'Frank'],
    'Age': [45, 28, 33],
    'Salary': [80000, 55000, 65000]
})
# 2. Concatenate the DataFrames vertically to create a combined DataFrame.
df_vertical = pd.concat([df1, df2], axis=0)
print(df_vertical)
# 3. Now create two DataFrames with different columns (e.g., "Employee", "Department" and "Employee", "Salary") and concatenate them horizontally based on the common "Employee" column.
df3 = pd.DataFrame({
    'Employee': ['Alice', 'Bob', 'Charlie', 'David'],
    'Department': ['HR', 'Sales', 'IT', 'Finance']
})
df4 = pd.DataFrame({
    'Employee': ['Alice', 'Bob', 'Charlie', 'David'],
    'Salary': [50000, 60000, 70000, 80000]
})
df_horizontal = pd.merge(df3, df4, on='Employee')
print(df_horizontal)

# ### *Exercise 26: Exploding Lists in DataFrame Columns*

# 1. Create a DataFrame with a column "Product" and a column "Features" where each feature is a list (e.g., ["Feature1", "Feature2"]).

df = pd.DataFrame({
    'Product': ['Laptop', 'Phone', 'Tablet'],
    'Features': [['Fast', 'Lightweight'], ['Camera', 'Long Battery'], ['Portable', 'Touchscreen']]
})
# 2. Use the explode() method to create a new row for each feature in the list, so each product-feature pair has its own row.
df_exploded = df.explode('Features')
print(df_exploded)

# ### **Exercise 27: Using .map() and .applymap()**

# 1. Given a DataFrame with columns "Product", "Price", and "Quantity", use .map() to apply a custom function to increase "Price" by 10% for each row.

df = pd.DataFrame({
    'Product': ['A', 'B', 'C'],
    'Price': [100, 200, 300],
    'Quantity': [10, 20, 30]
})
df['Price'] = df['Price'].map(lambda x: x * 1.1)
# 2. Use .applymap() to format the numeric values in the DataFrame to two decimal places.
df = df.applymap(lambda x: f"{x:.2f}" if isinstance(x, (int, float)) else x)
print(df)

# ### **Exercise 28: Combining groupby() with apply()**
df = pd.DataFrame({
    'City': ['New York', 'London', 'Paris', 'New York', 'London'],
    'Product': ['A', 'B', 'C', 'B', 'A'],
    'Sales': [1000, 1500, 1200, 1800, 2000],
    'Profit': [200, 300, 250, 350, 400]
})
# 1. Create a DataFrame with "City", "Product", "Sales", and "Profit".
def profit_margin(group):
    return group['Profit'].sum() / group['Sales'].sum()
# 2. Group by "City" and apply a custom function to calculate the profit margin (Profit/Sales) for each city.
city_profit_margins = df.groupby('City').apply(profit_margin)
print(city_profit_margins)

# ### *Exercise 29: Creating a DataFrame from Multiple Sources*
# 1. Create three different DataFrames from different sources (e.g., CSV, JSON, and a Python dictionary).
df_csv = pd.DataFrame({
    'ID': [1, 2, 3],
    'Name': ['John', 'Jane', 'Mike']
})
df_json = pd.DataFrame({
    'ID': [1, 2, 3],
    'Age': [25, 30, 35]
})
df_dict = pd.DataFrame({
    'ID': [1, 2, 3],
    'Salary': [50000, 60000, 70000]
})
# 2. Merge the DataFrames based on a common column and create a consolidated report.

df_consolidated = pd.merge(df_csv, df_json, on='ID')
df_consolidated = pd.merge(df_consolidated, df_dict, on='ID')
print(df_consolidated)

# ### *Exercise 30: Dealing with Large Datasets*

# 1. Create a large DataFrame with 1 million rows

np.random.seed(42)
num_rows = 1_000_000

data = {
    'Transaction ID': range(1, num_rows + 1),
    'Customer': np.random.randint(1, 10001, num_rows),
    'Product': np.random.choice(['A', 'B', 'C', 'D', 'E'], num_rows),
    'Amount': np.random.uniform(10, 1000, num_rows).round(2),
    'Date': [datetime(2023, 1, 1) + timedelta(days=i) for i in range(num_rows)]
}

df = pd.DataFrame(data)
print(len(df))

# 2. Split the DataFrame into smaller chunks (e.g., 100,000 rows each), perform a simple analysis on each chunk (e.g., total sales), and combine the results.
chunk_size = 100_000
results = []
num_chunks = len(df) // chunk_size + (1 if len(df) % chunk_size != 0 else 0)

for i in range(num_chunks):
    start_idx = i * chunk_size
    end_idx = min((i + 1) * chunk_size, len(df))
    chunk = df.iloc[start_idx:end_idx]

    # Perform a simple analysis (total sales) on each chunk
    chunk_total_sales = chunk['Amount'].sum()
    results.append(chunk_total_sales)

    print(i + 1/num_chunks.chunk_total_sales)

# Combine the results
total_sales = sum(results)
print(total_sales)
print(total_sales / len(df))

