# Base Class (parent class)
from encodings.punycode import selective_find


class Animal:

    def __init__(self, name):
        self.name = name

    def speak(self):
        pass

# Derived class (child class) inheriting from Animal

class Dog(Animal):

    def speak(self):
        return "Woof!"

class Cat(Animal):
    def speak(self):
      return "Meow!"

# Creating instances of derived classes
dog = Dog("Buddy")
cat = Cat("Whiskers")

# Calling the speak method on instances
print(f"{dog.name} says: {dog.speak()}")
print(f"{cat.name} says: {cat.speak()}")




class Payment:
    def __init__(self, payment_method):
        self.payment_method = payment_method

    def payment(self):
        pass

class GPay(Payment):
    def payment(self):
        return "Speaking to Google Play"

class PhonePay(Payment):
    def payment(self):
        return "Speaking to Phone Pay"

class AmazonPay(Payment):
    def payment(self):
        return "Speaking to Amazon Pay"


gpay = GPay("Payment Processing")
phonepay = PhonePay("Processing Request")
amazonpay = AmazonPay("Initiating Transaction")

print(f"{gpay.payment_method} , {gpay.payment()}")
print(f"{phonepay.payment_method} , {phonepay.payment()}")
print(f"{amazonpay.payment_method} , {amazonpay.payment()}")
