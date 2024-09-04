import pandas as pd

# Load the CSV file into a DataFrame
df = pd.read_csv('D:/Desktop/employee.csv')

# Print the DataFrame
print(df)

# Display the first three rows
print(df.head(3))

# Show summary information about DataFrame
print(df.info())

# Display summary stastics of numeric columns
print(df.describe())

# Filter rows where Salary is greater than 80000
high_salary_df = df[df['Salary'] > 80000]
print(high_salary_df)

# Sort by Age in descending order
sorted_df = df.sort_values(by='Age', ascending = False)
print(sorted_df)