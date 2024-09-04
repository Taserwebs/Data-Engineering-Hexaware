# Creating dictonaries
empty_dict = {}
person = {
    "name": "Mark",
    "age": 30,
    "email": "mark@gmail.com"
}

print(empty_dict)
print(person)

# accessing values
name = person["name"]
age = person["age"]

print("Name:", name)
print("Age:", age)


# Modifying values
person["age"] = 31
person["email"] = "mark_new@excample.com"

print(person)

# Adding a new key-value pair
person["address"] = "123 Main St"

# Removing a key-value pair
del person["email"]

print(person)


# Using dictonary methods
keys = person.keys() # print keys
values = person.values() # print values
items = person.items() # Print both keys and values

print("Keys:", Keys)
print("Values:", values)
print("Items:", items)

# Iterating over keys
for key in person:
    print(key)

# Iterating over values
for value in person.values():
    print(value)

# Iterating over key-value pairs
for key, value in person.items():
    print(key, ":", value)

