refEnvChecker = "Deep Binding"

def main():
  operationNumber = 1
  list = []

  # Operation 1: Are formal and actial parameters type checked?
  print("\nOperation " + str(operationNumber))
  typeChecking(1, 2)
  # typeChecking(1, "2.0") SYNTAX ERROR AT LINE 46 NOT ON 10 SO NO TYPE CHECKING
  operationNumber = operationNumber + 1

  # Operation 2: Are keyword (named) parameters supported?
  print("\nOperation " + str(operationNumber))
  keywordParameters(1, namedIntVariable=5)
  keywordParameters(namedIntVariable=5, intVariable=1)
  # keywordParameters(namedIntVariable=5, 1) Positional arguements after named, sytnax error
  operationNumber = operationNumber + 1

  # Operation 3: Are default paremeters supported?
  print("\nOperation " + str(operationNumber))
  defaultParameters(1, 3)
  defaultParameters(1)
  operationNumber = operationNumber + 1

  # Operation 4: What are the paremeter passing methods provided?
  print("\nOperation " + str(operationNumber))
  tmpInt = 300

  print("\n-- Before function call --\ntmpInt in main: " + str(tmpInt) +
        "\nlist in main: " + " ".join(list))

  parameterPassByAssignment(list, operationNumber)

  print("\n-- After function call --\ntmpInt in main: " + str(tmpInt) +
        "\nlist in main: " + " ".join(list))

  operationNumber = operationNumber + 1

  # Operation 5: Can subprograms be passed as parameters? If so, how is the referencing environment of the passed subprogram bound?
  print("\nOperation " + str(operationNumber))
  refEnvChecker = "Ad Hoc Binding"
  subprogramPass(passedFunction, operationNumber)
  operationNumber = operationNumber + 1


def typeChecking(intVariable, intVariable2):
  print(str(intVariable + intVariable2))


def keywordParameters(intVariable, namedIntVariable):
  print(str(intVariable + namedIntVariable))


def defaultParameters(intVariable, defaultIntVariable=5):
  print(str(intVariable + defaultIntVariable))


# In python all variables are references to objects so the value of the variables are passed which are references. a.k.a pass-reference-by-value, a.k.a passbyassignment. Immutable types does not change whereas mutable change. pass-by-assignment is in effect pass-by- reference, because the value of all actual parameters are references (IN BOOK)
def parameterPassByAssignment(list, intVariable):
  intVariable = 15
  list.append("addedElement")
  list = ["MutableType_PassByReferenceChecker"]

  print("\n-- In pass-by-assignment function call --\ntmpInt in main: " +
        str(intVariable) + "\nlist in main: " + " ".join(list))

def subprogramPass(function, intVariable):
  refEnvChecker = "Shallow Binding"
  function(intVariable)

def passedFunction(intVariable):
  print("Passed function with a parameter: " + str(intVariable))
  print("Binding refEnvChecker: " + str(refEnvChecker))
  
main()