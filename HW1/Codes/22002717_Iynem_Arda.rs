fn main() {
    let mut operationNumber = 1;

    // Operation 1: Declare/create an empty list
    println!("\nOperation {}", operationNumber);
    let mut languages = vec![];
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 2: Initialize a list with some values
    println!("\nOperation {}", operationNumber);
    languages = vec![
        "Dart".to_string(),
        "Go".to_string(),
        "Javascript".to_string(),
        "Lua".to_string(),
        "Python".to_string(),
        "Ruby".to_string(),
        "Rust".to_string(),
    ];
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 3: Check if the list is empty or not
    println!("\nOperation {}", operationNumber);
    isListEmpty(&languages);
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 4: Add a new element to a list
    println!("\nOperation {}", operationNumber);
    let newElement = String::from("SQL");
    languages.push(newElement.clone());
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 5: Check if a particular element exists in the list
    println!("\nOperation {}", operationNumber);
    doesContain(&languages, &newElement);
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 6: Remove a particular element from the list
    println!("\nOperation {}", operationNumber);
    languages.retain(|item| *item != newElement);
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 7: Get the head and the tail of a list
    println!("\nOperation {}", operationNumber);
    println!("Head of the list is: {}", languages[0]);
    println!("Tail of the list is: {}", &languages[1..].join(" "));
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;

    // Operation 8: Print all of the elements in the list
    println!("\nOperation {}", operationNumber);
    printResultingList(&languages, operationNumber);
    operationNumber = operationNumber + 1;
}

fn isListEmpty(list: &[String]) {
    if list.is_empty() {
        println!("List is empty");
    } else {
        println!("List is not empty");
    }
}

fn doesContain(list: &[String], object: &String) {
    if list.contains(object) {
        println!("List contains {}", object);
    } else {
        println!("List does not contain {}", object);
    }
}

fn printResultingList(list: &[String], operationNumber: i32) {
    println!(
        "List after Operation {}: {}",
        operationNumber,
        list.join(" ")
    );
}