# Convert string to integer
num_str = "100"
num_int = int(num_str)

#Convert float to integer
num_float = 12.34
num_int_float = int(num_float)
print("String to Integer:", num_int)
print("Float to Integer:",num_int)

# Convert integer to boolean
bool_from_int = bool(1) #True

#Convert zero to boolean
bool_from_zero = bool(0) #False

#Convert String to boolean
bool_from_str = bool("Hello") #True

#Convert empty string to boolean
bool_from_empty_str = bool("") # False

print("Boolean from integer 1:",bool_from_int)
print("Boolean from integer o:", bool_from_zero)
print("Boolean from non-empty-string:", bool_from_str)
print("Boolean from empty string:",bool_from_empty_str)