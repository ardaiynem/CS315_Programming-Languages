package main

import (
	"fmt"
	"strings"
)

func main() {
	operationNumber := 1

  // Operation 1: Declare/create an empty list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	languages := []string{}
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 2: Initialize a list with some values
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	languages = []string{"Dart", "Go", "Javascript", "Lua", "Python", "Ruby", "Rust"}
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1

  // Operation 3: Check if the list is empty or not
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	isListEmpty(languages)
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 4: Add a new element to a list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	newElement := "SQL"
	languages = append(languages, newElement)
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 5: Check if a particular element exists in the list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	doesContain(languages, newElement)
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 6: Remove a particular element from the list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	languages = removeFromList(languages, newElement)
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 7: Get the head and the tail of a list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	first := languages[0]
	last := languages[1:len(languages)]
	fmt.Println("Head of the list is: " + first)
	fmt.Println("Tail of the list is: " + strings.Join(last, " "))
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
  
  // Operation 8: Print all of the elements in the list
	fmt.Println(fmt.Sprintf("\nOperation %v", operationNumber))
	printResultingList(languages, operationNumber)
	operationNumber = operationNumber + 1
}

func isListEmpty(list []string) {
	if len(list) > 0 {
		fmt.Println("List is not empty")
	} else {
		fmt.Println("List is empty")
	}
}

func doesContain(list []string, object string) int {
	for i, value := range list {
		if value == object {
			fmt.Println("List contains " + object)
			return i
		}
	}

	fmt.Println("List does not contain " + object)
	return 0
}

func removeFromList(list []string, object string) []string {
	for index, value := range list {
		if value == object {
			return append(list[:index], list[index+1:]...)
		}
	}
	return list
}

func printResultingList(list []string, operationNumber int) {
	fmt.Println(fmt.Sprintf("List after Operation %v: %s", operationNumber, strings.Join(list, " ")))
}