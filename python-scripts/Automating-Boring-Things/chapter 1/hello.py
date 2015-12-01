__author__ = 'dank'

# This program says hello and asks for my name.

print('Hello world!')
print('What is your name?') # ask for their name
myName = input() # User input
print('It is good to meet you, ' + myName)
print('The length of your name is:')
print(len(myName)) # Prints length of name
print('What is your age?') # ask for their age
myAge = input()
print('You will be ' + str(int(myAge) + 1) + ' in a year.')

