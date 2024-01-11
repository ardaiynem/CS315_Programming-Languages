def main():
  operationNumber = 1

  # Operation 1: Declare/create an empty list
  print("\nOperation " + str(operationNumber))
  languages = []
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 2: Initialize a list with some values 
  print("\nOperation " + str(operationNumber))
  languages = ["Dart", "Go", "Javascript", "Lua", "Python", "Ruby", "Rust"]
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1
  
  # Operation 3: Check if the list is empty or not
  print("\nOperation " + str(operationNumber))
  isListEmpty(languages)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 4: Add a new element to a list
  print("\nOperation " + str(operationNumber))
  newElement = "SQL"
  languages.append(newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 5: Check if a particular element exists in the list
  print("\nOperation " + str(operationNumber))
  doesContain(languages, newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 6: Remove a particular element from the list
  print("\nOperation " + str(operationNumber))
  languages.remove(newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 7: Get the head and the tail of a list
  print("\nOperation " + str(operationNumber))
  print("Head of the list is: " + languages[0])
  print("Tail of the list is: " + " ".join(languages[1:]))
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  # Operation 8: Print all of the elements in the list
  print("\nOperation " + str(operationNumber))
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1


def isListEmpty(list):
  if list:
    print("List is not empty")
  else:
    print("List is empty")


def doesContain(list, object):
  if object in list:
    print("List contains " + object)
  else:
    print("List does not contain " + object)


def printResultingList(list, operationNumber):
  print("List after Operation " + str(operationNumber) + ": " + " ".join(list))


main()