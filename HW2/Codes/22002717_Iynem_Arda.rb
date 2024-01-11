refEnvChecker = "Deep Binding"

def main
  operationNumber = 1
  list = []

  # Operation 1: Are formal and actial parameters type checked?
  puts "\nOperation " + operationNumber.to_s
  typeChecking(1, 2)
  # typeChecking(1, "2.0") SYNTAX ERROR AT LINE 51 NOT ON 10 SO NO TYPE CHECKING
  operationNumber += 1

  # Operation 2: Are keyword (named) parameters supported?
  puts "\nOperation " + operationNumber.to_s
  keywordParameters(1, namedIntVariable:5)
  # keywordParameters(namedIntVariable:5, 1) SYNTAX ERROR POSITIONAL PARAMETERS AFTER NAMED
  operationNumber += 1

  # Operation 3: Are default paremeters supported?
  puts "\nOperation " + operationNumber.to_s
  defaultParameters(1, 3)
  defaultParameters(1)
  operationNumber += 1

  # Operation 4: What are the paremeter passing methods provided?
  puts "\nOperation " + operationNumber.to_s
  tmpInt = 300

  puts "\n-- Before function call function call --\nintVariable in function: " +
       tmpInt.to_s +
       "\nlist in function: " +
       list.join(' ')

  parameterPassByValue(list, operationNumber)
  
  puts "\n-- After function call --\nintVariable in function: " +
       tmpInt.to_s +
       "\nlist in function: " +
       list.join(' ')

  operationNumber += 1

  # Operation 5: Can subprograms be passed as parameters? If so, how is the referencing environment of the passed subprogram bound?
  puts "\nOperation " + operationNumber.to_s
  refEnvChecker = "Ad Hoc Binding"
  subprogramPass(method(:passedFunction), operationNumber)
  operationNumber += 1
end

def typeChecking(intVariable, intVariable2)
  puts (intVariable + intVariable2).to_s
end

def keywordParameters(intVariable, namedIntVariable:)
  puts (intVariable + namedIntVariable).to_s
end

def defaultParameters(intVariable, defaultIntVariable = 5)
  puts (intVariable + defaultIntVariable).to_s
end

# Ruby uses only pass-by-value however all variables are references so this pass-by-value works like a pass-reference-by-value. Immutable types don't change like int, double pass-by-assignment
def parameterPassByValue(list, intVariable)
  intVariable = 15
  list.push("addedElement")
  list = ["MutableType_PassByReferenceChecker"]
  
  puts "\n-- In pass-by-value function call --\nintVariable in function: " +
       intVariable.to_s +
       "\nlist in function: " +
       list.join(' ')
end

def subprogramPass(callback, intVariable)
  refEnvChecker = "Shallow Binding"
  callback.call(intVariable)
end

def passedFunction(intVariable)
  puts "Passed function with a parameter: " + (intVariable).to_s
  # puts "Binding refEnvChecker: " + (refEnvChecker).to_s SYNTAX ERROR undefined local variable or method `refEnvChecker'
end

main