refEnvChecker = "Deep Binding"

function main()
  local operationNumber = 1
  local list = {}

  -- Operation 1: Are formal and actial parameters type checked?
  print("\nOperation " .. operationNumber)
  typeChecking(1, 2)
  typeChecking(1, "2.0") -- NO TYPE CHECKING
  operationNumber = operationNumber + 1

  -- Operation 2: Are keyword (named) parameters supported?
  -- NO
  print("\nOperation " .. operationNumber)
  print("NOT SUPPORTED")
  operationNumber = operationNumber + 1

  -- Operation 3: Are default paremeters supported?
  -- NO
  print("\nOperation " .. operationNumber)
  print("NOT SUPPORTED")
  operationNumber = operationNumber + 1

  -- Operation 4: What are the paremeter passing methods provided?
  print("\nOperation " .. operationNumber)
  local tmpInt = 300

  print("\n-- Before function call --\ntmpInt in main: " ..
    tmpInt .. "\nlist in main: " ..
    table.concat(list, " "))

  parameterPassByValue(list, tmpInt)

  print("\n-- After function call --\ntmpInt in main: " ..
    tmpInt .. "\nlist in main: " ..
    table.concat(list, " "))

  operationNumber = operationNumber + 1

  -- Operation 5: Can subprograms be passed as parameters? If so, how is the referencing environment of the passed subprogram bound?
  print("\nOperation " .. operationNumber)
  local refEnvChecker = "Ad Hoc Binding"
  functionVariable = passedFunction
  subprogramPass(functionVariable, operationNumber)
  operationNumber = operationNumber + 1

end

function typeChecking(intVariable, intVariable2)
  print(intVariable + intVariable2)
end

-- all types are passed by value, but function, table, userdata and thread are reference (coroutine) types and are (imitating) passed by reference (shallow copied passed by value).
function parameterPassByValue(list, intVariable)
  intVariable = 15
  table.insert(list, "addedElement")
  list = {"MutableType_PassByReferenceChecker"}

  print("\n-- In pass-by-value function call --\ntmpInt in main: " ..
    intVariable .. "\nlist in main: " ..
    table.concat(list, " "))
end

function subprogramPass(functionVariable, intVariable)
  local refEnvChecker = "Shallow Binding"
  functionVariable(intVariable)
end

function passedFunction(intVariable)
  print("Passed function with a parameter: " .. intVariable)
  print("Binding refEnvChecker: " .. refEnvChecker)
end

main()