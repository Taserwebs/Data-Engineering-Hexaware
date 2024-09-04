import pandas as pd

# Creating a DataFrame from a dictionary
data = {'Name': ['John', 'Emma', 'Alex'],
        'Age': [28, 32, 25],
        'City': ['New York', 'London', 'Paris']}
df = pd.DataFrame(data)

# Creating a DataFrame from a list of lists
data = [['John', 28, 'New York'],
        ['Emma', 32, 'London'],
        ['Alex', 25, 'Paris']]
df = pd.DataFrame(data, columns=['Name', 'Age', 'City'])


# Display the first few rows
print(df.head())

# Get basic information about the DataFrame
print(df.info())

# Get statistical summary of numerical columns
print(df.describe())

# Select a single column
ages = df['Age']

# Select multiple columns
subset = df[['Name', 'City']]

# Select rows based on index
first_two = df.loc[0:1]

# Rename columns
df = df.rename(columns={'Name': 'Full Name', 'City': 'Location'})

# Filter rows based on a condition
young_people = df[df['Age'] < 30]

# Multiple conditions
young_new_yorkers = df[(df['Age'] < 30) & (df['City'] == 'New York')]