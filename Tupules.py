# tuples are immutable  cant delete but add elements in it
# Creating a tuple of colors
colors = ("red", "green", "blue")

# Accessing elements of the tuples
print("First color:", colors[0])
print("Last color:", colors[-1])

# Length of the tuple
tuple_length = len(colors)
print("Length of the tuple:", tuple_length)

# Looping through the tuple
print("Tuple elements:")
for color in colors:
    print(color)