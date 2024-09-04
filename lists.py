# Creating Lists
empty_list = []
numbers = [1, 2, 3, 4, 5] # Collection of data
mixed_list = [1, 'Hello', 3.14, True]

print(empty_list)
print(numbers)
print(mixed_list)

first_element = numbers[0]
third_element = numbers[2]
last_element = numbers[-1]

print("First element:", first_element)
print("Third element:",third_element)
print("Last element:",last_element)

#Modifying elements
numbers[0] = 10
numbers[2] = 30
print(numbers)

# add items to the list
numbers.append(6) # Adds the element in the end of the list

numbers.insert(2, 2.5) # Inserting the element at the exact position

numbers.extend([7, 8, 4])  # Insert multiple elements in the list


print(numbers)

#remove specific element
numbers.remove(2)  # by element
popped_element = numbers.pop(2) # by index

print(numbers)

# Slicing a list

first_therr = numbers[:3]
middle_two = numbers[1:3]
last_two = numbers[-2:]

print("First three elements:", first_therr)
print("Middle two elements:", middle_two)
print("Last two elements:", last_two)

# Iterating over a list
for num in numbers:
    print(num)

# Creating a list of aquares using a list comphrension

squares = [x**2 for x in range(6)] # List comphrension mentioning it in single line of code, mostly used by dev's

print(squares)