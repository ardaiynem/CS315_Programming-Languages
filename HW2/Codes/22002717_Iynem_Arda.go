package main

import (
	"fmt"
  "strings"
)
var refEnvChecker = "Deep Binding"

func main() {
	operationNumber := 1
  list := []string{}

  // Operation 1: Are formal and actial parameters type checked?
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	typeChecking(1, 2);
  // typeChecking(1, "2.0"); SYNTAX ERROR AT LINE 16
	operationNumber = operationNumber + 1
  
  // Operation 2: Are keyword (named) parameters supported?
  // NO
  fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
  fmt.Println("NOT SUPPORTED")
	operationNumber = operationNumber + 1

  // Operation 3: Are default paremeters supported?
	// NO
  fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	fmt.Println("NOT SUPPORTED")
	operationNumber = operationNumber + 1
  
  // Operation 4: What are the paremeter passing methods provided?
	fmt.Println(fmt.Sprintf("\nOperation %v (Pass-by-value)", operationNumber))
  tmpInt := 300
  
  fmt.Println(fmt.Sprintf("\n-- Before function call --\ntmpInt in main: %v\nlist in main: %s", tmpInt, strings.Join(list, " ")))

  parameterPassByValue(list, tmpInt);

  fmt.Println(fmt.Sprintf("\n-- After function call --\ntmpInt in main: %v\nlist in main: %s", tmpInt, strings.Join(list, " ")))

  	fmt.Println(fmt.Sprintf("\nOperation %v (Pass-by-reference)", operationNumber))
  
  fmt.Println(fmt.Sprintf("\n-- Before function call --\ntmpInt in main: %v\nlist in main: %s", tmpInt, strings.Join(list, " ")))

  parameterPassByReference(&list, &tmpInt);

  fmt.Println(fmt.Sprintf("\n-- After function call --\ntmpInt in main: %v\nlist in main: %s", tmpInt, strings.Join(list, " ")))
  
	operationNumber = operationNumber + 1
  
  // Operation 5: Check if a particular element exists in the list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
  // refEnvChecker := "Ad Hoc Binding" SYNTAX ERROR AT LINE 53 (NOT USED)
  subprogramPass(passedFunction, operationNumber)
	operationNumber = operationNumber + 1
}

func typeChecking(intVariable int, intVariable2 int) {
  fmt.Println(fmt.Sprintf("%v", (intVariable + intVariable2)))
}


// Pass by value
func parameterPassByValue(list []string, intVariable int) {
  intVariable = 15
  list = append(list, "addedElement")
  list = []string{"MutableType_PassByReferenceChecker"}

  fmt.Println(fmt.Sprintf("\n-- In pass-by-value function call --\ntmpInt in main: %v\nlist in main: %s", intVariable, strings.Join(list, " ")))
}

// Pass by reference
func parameterPassByReference(list *[]string, intVariable *int) {
  *intVariable = 15
  *list = append(*list, "addedElement")
  *list = []string{"MutableType_PassByReferenceChecker"}

  fmt.Println(fmt.Sprintf("\n-- In pass-by-reference function call --\ntmpInt in main: %v\nlist in main: %s", *intVariable, strings.Join(*list, " ")))
}

func subprogramPass(function func(intVariable int), intVariable int) {
  // refEnvChecker := "Shallow Binding" SYNTAX ERROR AT LINE 92 (NOT USED)
  function(intVariable)
}

func passedFunction(intVariable int) {
  fmt.Println(fmt.Sprintf("Passed function with int parameter: %v", intVariable))
  fmt.Println(fmt.Sprintf("Binding refEnvChecker: %v", refEnvChecker))
}