import pandas as pd

# Load the JSON file into a DataFrame
df = pd.read_json('D:/Desktop/employees.json')

# Add a new column 'Bonus' which is 10% of the Salary
df['Bonus'] = df['Salary'] * 0.10
print(df)