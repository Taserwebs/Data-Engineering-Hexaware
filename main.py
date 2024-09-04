import mymodule
import math_operations
import pandas as pd
import string_utils
import numpy as np

# Importing the arithmetic module from my_package
from mypackage import arthimetic,geometry

# using functions from arthimetic module
print("Addition:", arthimetic.add(10, 5))
print("Division:", arthimetic.divide(10, 2))

# Using functions from geometry module
print("Area of Circle:", geometry.area_of_circle(5))
print("Perimeter of rectangle:", geometry.perimeter_of_rectangle(10, 5))


print(mymodule.greet("Abishek"))
#print("Hello World !!")

#single_quote_str = 'This is single quote String - "Hey"'
#double_quote_str = "it's raining outside"
#print(single_quote_str)
#print(double_quote_str)

#next_string = '''This is a
#Multiple line string'''

#print(next_string)

result_add = math_operations.add(5 , 3)
print(result_add)

result_subract = math_operations.subract(5 , 3)
print(result_subract)

result_divide = math_operations.divide(20 , 5)
print(result_divide)

result_multiply = math_operations.multiply(5 , 3)
print(result_multiply)



sentence = "hello world, how are you?"
print(string_utils.capitalize_words(sentence))
print()

# Test reverse_string
text = "Python is awesome!"
print(string_utils.reverse_string(text))
print()

# Test count_vowels
vowel_text = "The quick brown fox jumps over the lazy dog"
print(string_utils.count_vowels(vowel_text))
print()

# Test is_palindrome
palindrome1 = "A man, a plan, a canal: Panama"
palindrome2 = "race a car"
print(string_utils.is_palindrome(palindrome1))
print(string_utils.is_palindrome(palindrome2))


def describe_pet(pet_name, animal_type="dog"):
    print(f"I have a {animal_type} named {pet_name}.")

describe_pet(animal_type="cat", pet_name="Whiskers")
describe_pet(pet_name="Rover")


# arbitary argument
def make_pizza(size, *toppings):
    print(f"Making a {size}-inch pizza with the following toppings:")
    for topping in toppings:
        print(f"- {topping}")

# Calling with arbitary positional arguments
make_pizza(12, "pepperoni", "mushrooms", "green peppers")

def build_profile(first, last, **user_info):
    return {"first_name": first, "last_name": last, **user_info}
# Calling with arbitary keyword arguments
user_profile = build_profile("John", "Doe", location="New York", field="Engineering")
print(user_profile)


# Load the CSV file
df = pd.read_csv('D:/Desktop/sample_data.csv')

# Display the Dataframe
print(df)


# Check for missing values in each column
print(df.isnull().sum())

# Display rows with missing data
print(df[df.isnull().any(axis=1)])


# Replace empty string and strings with only spaces with NaN
df.replace( r'^\s*$', np.nan, regex=True, inplace=True)

# Check for missing values in each column
print(df.isnull().sum())

# Display rows with missing data
print(df[df.isnull().any(axis=1)])


# drop rows with any missing values
df_cleaned = df.dropna()

# Display the cleaned DataFrame
print(df_cleaned)

# Load the CSV file
# df = pd.read_csv('D:/Desktop/sample_data.csv')

# print("Before Transformation")
# print(df)

# Ensure there are no leading/trailing spaces in column names
# df.columns = df.columns.str.strip()

# Strip spaces from the 'City' column and replace empty strings with NaN
# df['City'] = df['City'].str.strip().replace('', np.nan)

# Fill missing values in the 'City' column with 'Unknown'
# df['City'] = df['City'].fillna('Unknown')

# Fill missing values in the 'Age' column with the median age
# df['Age'] = pd.to_numeric(df['Age'].str.strip(), errors='coerce')
# df['Age'] = df['Age'].fillna(df['Age'].median())

# Fill missing values in the 'Salary' column with the median salary
# df['Salary'] = df['Salary'].fillna(df['Salary'].median())

# Display the DataFrame after filling missing values
# print(df)

df1 = pd.DataFrame({
    'employee_id': [1, 2, 3, 4],
    'employee_name': ['John Doe', 'Jane Smith', 'Sam Brown', 'Emily Davis']
})

df2 = pd.DataFrame({
    'employee_id': [3, 4, 5, 6],
    'department': ['Finance', 'HR', 'IT', 'Marketing']
})

# Merge the DataFrames on 'employee_id'
merged_df = pd.merge(df1, df2, on='employee_id', how='inner')
print(merged_df)


df = pd.DataFrame({
    'employee_id': [1, 2, 2, 3, 3, 3],
    'department': ['HR', 'IT', 'IT', 'Finance', 'Finance', 'Finance'],
    'salary': [50000, 60000, 62000, 55000, 58000, 60000]
})

# Group by department and calculate mean salary
grouped_df = df.groupby('department')['salary'].mean().reset_index()
print(grouped_df)



