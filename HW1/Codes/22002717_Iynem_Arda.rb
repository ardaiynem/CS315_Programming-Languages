def main
  operationNumber = 1

  # Operation 1: Declare/create an empty list
  puts "\nOperation " + operationNumber.to_s
  languages = []
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 2: Initialize a list with some values
  puts "\nOperation " + operationNumber.to_s
  languages = %w[Dart Go Javascript Lua Python Ruby Rust]
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 3: Check if the list is empty or not
  puts "\nOperation " + operationNumber.to_s
  isListEmpty(languages)
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 4: Add a new element to a list
  puts "\nOperation " + operationNumber.to_s
  newElement = 'SQL'
  languages.push(newElement)
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 5: Check if a particular element exists in the list
  puts "\nOperation " + operationNumber.to_s
  doesContain(languages, newElement)
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 6: Remove a particular element from the list
  puts "\nOperation " + operationNumber.to_s
  languages.delete(newElement)
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 7: Get the head and the tail of a list
  puts "\nOperation " + operationNumber.to_s
  puts 'Head of the list is: ' + languages.first
  puts 'Tail of the list is: ' + languages.slice(1, languages.length).join(' ')
  printResultingList(languages, operationNumber)
  operationNumber += 1

  # Operation 8: Print all of the elements in the list
  puts "\nOperation " + operationNumber.to_s
  printResultingList(languages, operationNumber)
  operationNumber += 1
end

def isListEmpty(list)
  if list.empty?
    puts 'List is empty'
  else
    puts 'List is not empty'
  end
end

def doesContain(list, object)
  if list.include?(object)
    puts 'List contains ' + object
  else
    puts 'List does not contain ' + object
  end
end

def printResultingList(list, operationNumber)
  puts 'List after Operation ' +
       operationNumber.to_s +
       ': ' +
       list.join(' ')
end

main