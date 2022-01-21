#Definition of operators
def add(n1, n2):
    return n1 + n2

def subtract(n1, n2):
    return n1 - n2

def multiply(n1, n2):
    return n1 * n2

def divide(n1, n2):
    return n1 / n2

#Dictionary of operations
operations = {
    "+": add,
    "-": subtract,
    "*": multiply,
    "/": divide,
}

#Input numbers
number1 = int(input("What is your first number?: "))
for symbol in operations:
    print(symbol)

operationSymbol = input("Pick an operation: ")
number2 = int(input("What is your second number?: "))
calcFunct = operations[operationSymbol]
firstAnswer = calcFunct(number1, number2)

print(f"{number1} {operationSymbol} {number2} = {firstAnswer}")

