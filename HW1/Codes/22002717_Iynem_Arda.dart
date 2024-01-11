void main() {
  var operationNumber = 1;

  // Operation 1: Declare/create an empty list
  print("\nOperation " + operationNumber.toString());
  var languages = [];
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 2: Initialize a list with some values
  print("\nOperation " + operationNumber.toString());
  languages = ["Dart", "Go", "Javascript", "Lua", "Python", "Ruby", "Rust"];
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 3: Check if the list is empty or not
  print("\nOperation " + operationNumber.toString());
  isListEmpty(languages);
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 4: Add a new element to a list
  print("\nOperation " + operationNumber.toString());
  var newElement = "SQL";
  languages.add(newElement);
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 5: Check if a particular element exists in the list
  print("\nOperation " + operationNumber.toString());
  doesContain(languages, newElement);
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 6: Remove a particular element from the list
  print("\nOperation " + operationNumber.toString());
  languages.remove(newElement);
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 7: Get the head and the tail of a list
  print("\nOperation " + operationNumber.toString());
  print("Head of the list is: " + languages.first);
  print("Tail of the list is: " + languages.sublist(1).join(" "));
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;

  // Operation 8: Print all of the elements in the list
  print("\nOperation " + operationNumber.toString());
  printResultingList(languages, operationNumber);
  operationNumber = operationNumber + 1;
}

void isListEmpty(var list) {
  if (list.isEmpty) {
    print("List is empty");
  } else {
    print("List is not empty");
  }
}

void doesContain(var list, var object) {
  if (list.contains(object)) {
    print("List contains " + object);
  } else {
    print("List does not contain " + object);
  }
}

void printResultingList(var list, var operationNumber) {
  print("List after Operation " +
      operationNumber.toString() +
      ": " +
      list.join(" "));
}