# Specify the file path and name
file_path = "D:/Desktop/EndGame.txt"

# Open the file in write mode and write content
# with open(file_path, "w") as file:
#   file.write("Avengers      Assemble, ...Haaarraahhhhh")

# print("File created and content written successfully.")


# with open(file_path, "r") as file:
#    for line in file:
#        print(line.strip()) # Remove newLine characters /n


# Open a file in append mode and add new content


# with open("D:/Desktop/EndGame.txt", "a") as file:
#     file.write("\n Iam IronMan Snapp")


# Read the entire file as a string and print it
# with open(file_path,"r") as file:
#    content = file.read()

# print(content)


# import csv
# Writing data to a CSV file
# data = [["Name", "Age"], ["Alice", 25], ["Bob", 30]]
# with open("D:/Desktop/data.csv", "r") as file:
#    reader = csv.reader(file)
#    for row in reader:
#        print(row)


import json

# Writing data to a JSON file
data = {"name": "Alice", "age": 30, "city": "New York"}
with open("C:/Users/Abdullah Khan/Documents/data.json", "w") as file:
    json.dump(data, file)

# Reading data from a JSON file
with open("C:/Users/Abdullah Khan/Documents/data.json", "r") as file:
    loaded_data = json.load(file)
print(loaded_data)
