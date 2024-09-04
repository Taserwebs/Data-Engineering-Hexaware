import pandas as pd
from numpy.core.defchararray import startswith

# Creating a DataFrame from a dictionary with Indian names

data = {
    "Name": ["Amit", "Priya", "Vikram", "Neha", "Ravi"],
    "Age": [25, 30, 35, 40, 45],
    "City": ["Mumbai", "Delhi", "Bangalore", "Chennai", "Pune"]
}

df = pd.DataFrame(data)
# print(df)

# Accessing a single column
# print(df["Name"])

# Accessing Multiple Columns
# print(df[["Name", "Age"]])

# Accessing rows using index
# print(df.iloc[0]) ## First row

# Accessing Multiple rows
# print(df.iloc[0:3])

# Filter row where Age is greater than 30
# filtered_df = df[df["Age"] > 30]
# print(filtered_df)

# Adding a new column salary
df["Salary"] =[50000, 60000, 70000, 80000, 90000]
# print(df)

# Sorting by Age
# sorted_df = df.sort_values(by = "Age", ascending = False)
# print(sorted_df)

# Renaming the Columns
# df_renamed = df.rename(columns={"Name": "Full Name", "Age": "Years"})
# print(df_renamed)

# Drop the city Column
# df_dropped = df.drop(columns=["City"])
# print(df_dropped)


# Drop the rows by index
# df_dropped_row = df.drop(index=2)
# print(df_dropped_row)

# Creating a new column 'Seniority' based on tha Age
# df['Seniority'] = df['Age'].apply(lambda x: 'Senior' if x >= 35 else 'Junior')
# print(df)

# group by-here it groups the salary by city
# d = df.groupby("City")["Salary"], mean()
# print(d)

# Apply a custom function to the 'Salary' column to add a 10% bonus
# def add_bonus(salary):
#    return salary * 1.10

# df['Salary_With_Bonus'] = df['Salary'].apply(add_bonus)
# print(df)


# Creating another DataFrame
df_new = pd.DataFrame({
    "Name": ["Amit", "Priya", "Ravi"],
    "Bonus": [5000, 6000, 7000]
})

# Merge based on the 'Name' column
# df_merged = pd.merge(df, df_new, on="Name", how="left") # on = Name is joining by name, and how is the type of join thats is left join(how is join
# print(df_merged)

# Concatnate na both should have the same structure, for merge they no need to have same structure
# Concatentae
# df_concat = pd.concat([df, df_new], ignore_index = True)
# print(df_concat)

# Filter row where Salary is greater than 50000
filtered_Salary_df = df[df["Salary"] > 50000]
print(filtered_Salary_df)

# Name starts with a
Name_starts_df = df[df["Name"].str.startswith("A")]
print(Name_starts_df)
