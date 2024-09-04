# mymodule.py

def greet(name):
    return f"Hello, {name}!"

# Code to execute when the module is run as a script
if __name__ == "__main__":
    # This block will only run if this file is executed directly
    print("Executing mymodule as a script.")
    name = "World"
    print(greet(name))