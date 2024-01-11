String refEnvChecker = "Deep Binding";

void main() {
  int operationNumber = 1;
  var list = [];

  // Operation 1: Are formal and actial parameters type checked?
  print("\nOperation " + operationNumber.toString());
  typeChecking(1, 2);
  // typeChecking(1, "2.0"); SYNTAX ERROR AT LINE 10
  operationNumber = operationNumber + 1;

  // Operation 2: Are keyword (named) parameters supported?
  print("\nOperation " + operationNumber.toString());
  keywordParameters(1, namedIntVariable: 5);
  keywordParameters(namedIntVariable: 5, 1);
  operationNumber = operationNumber + 1;

  // Operation 3: Are default paremeters supported?
  print("\nOperation " + operationNumber.toString());
  defaultParameters(1, 3);
  defaultParameters(1);
  operationNumber = operationNumber + 1;

  // Operation 4: What are the paremeter passing methods provided?
  print("\nOperation " + operationNumber.toString());
  int tmpInt = 300;
  
  print("\n-- Before function call --\ntmpInt in main: " +
      tmpInt.toString() +
      "\nlist in main: " +
      list.join(" "));
  
  parameterPassByValue(list, tmpInt);
  
  print("\n-- After function call --\ntmpInt in main: " +
      tmpInt.toString() +
      "\nlist in main: " +
      list.join(" "));
  operationNumber = operationNumber + 1;

  // Operation 5: Can subprograms be passed as parameters? If so, how is the referencing environment of the passed subprogram bound?
  print("\nOperation " + operationNumber.toString());
  String refEnvChecker = "Ad Hoc Binding";
  subprogramPass(passedFunction, operationNumber);
  operationNumber = operationNumber + 1;
}

void typeChecking(int intVariable, int intVariable2) {
  print((intVariable + intVariable2).toString());
}

void keywordParameters(int intVariable, {required int namedIntVariable}) {
  print((intVariable + namedIntVariable).toString());
}

void defaultParameters(int intVariable, [int defaultIntVariable = 5]) {
  print((intVariable + defaultIntVariable).toString());
}

// Pass-by-value. All variables are reference String, int, double et. immutable pass-by-assignment. so pass reference by value
void parameterPassByValue(var list, int intVariable) {
  intVariable = 15;
  list.add("addedElement");
  list = ["MutableType_PassByReferenceChecker"];

  print("\n-- In pass-by-value function call --\ntmpInt in function: " +
      intVariable.toString() +
      "\nlist in function: " +
      list.join(" "));
}

void subprogramPass(Function function, int intVariable) {
  String refEnvChecker = "Shallow Binding";
  function(intVariable);
}

void passedFunction(int intVariable) {
  print("Passed function with a parameter: " + intVariable.toString());
  print("Binding refEnvChecker: " + refEnvChecker.toString());
}