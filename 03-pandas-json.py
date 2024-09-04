import pandas as pd


path = "C:/Hexaware/Phase-2/DE/Notes/Python/sample/employees.json"

df = pd.read_json(path)

df['Bonus'] = df['Salary'] * 0.10
print(df)

# Saving the updated df to a new JSON file
df.to_json('C:/Hexaware/Phase-2/DE/Notes/Python/sample/employees_with_bonus.json', orient='records', lines=True)