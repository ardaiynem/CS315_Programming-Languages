function main()
  local operationNumber = 1

  -- Operation 1: Declare/create an empty list
  print("\nOperation " .. operationNumber)
  local languages = {}
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 2: Initialize a list with some values
  print("\nOperation " .. operationNumber)
  languages = { "Dart", "Go", "Javascript", "Lua", "Python", "Ruby", "Rust" }
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 3: Check if the list is empty or not
  print("\nOperation " .. operationNumber)
  isListEmpty(languages)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 4: Add a new element to a list
  print("\nOperation " .. operationNumber)
  local newElement = "SQL"
  table.insert(languages, newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 5: Check if a particular element exists in the list
  print("\nOperation " .. operationNumber)
  doesContain(languages, newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 6: Remove a particular element from the list
  print("\nOperation " .. operationNumber)
  removeFromList(languages, newElement)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 7: Get the head and the tail of a list
  print("\nOperation " .. operationNumber)
  local first = languages[1]
  local tail = { unpack(languages, 2) }
  print("Head of the list is: " .. first)
  print("Tail of the list is: " .. table.concat(tail, " "))
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1

  -- Operation 8: Print all of the elements in the list
  print("\nOperation " .. operationNumber)
  printResultingList(languages, operationNumber)
  operationNumber = operationNumber + 1
end

function isListEmpty(list)
  if next(list) == nil then
    print("List is empty")
  else
    print("List is not empty")
  end
end

function doesContain(list, object)
  for _, value in pairs(list) do
    if value == object then
      print("List contains " .. object)
      return
    end
  end
  print("List does not contain " .. object)
end

function removeFromList(list, object)
  for index, value in pairs(list) do
    if value == object then
      table.remove(list, index)
      return
    end
  end
end

function printResultingList(list, operationNumber)
  print("List after Operation " .. operationNumber .. ": " .. table.concat(list, " "))
end

main()