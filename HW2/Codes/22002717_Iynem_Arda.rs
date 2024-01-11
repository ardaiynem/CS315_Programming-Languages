static refEnvChecker: &'static str = "Deep Binding";

fn main() {
    let mut operation_number: i32 = 1;
    let mut list: Vec<String> = vec![];

    // Operation 1: Are formal and actual parameters type checked?
    println!("\nOperation {}", operation_number);
    type_checking(1, 2);
    // type_checking(1, "2.0"); SYNTAX ERROR AT LINE 10
    operation_number += 1;

    // Operation 2: Are keyword (named) parameters supported?
    // No
    println!("\nOperation {}", operation_number);
    println!("Not Supported");
    operation_number += 1;

    // Operation 3: Are default parameters supported?
    // No
    println!("\nOperation {}", operation_number);
    println!("Not Supported");
    operation_number += 1;

    // Operation 4: What are the parameter passing methods provided?
    println!("\nOperation {} (Pass by Move)", operation_number);

    let mut tmp_int = 300;

    println!(
        "\n-- Before function call --\ntmp_int in main: {}\nlist in main: {}",
        tmp_int,
        list.join(" ")
    );

    // parameter_pass_by_value(list, tmp_int); passes the ownership which is moved to function back to the list variable to make it accessible again
    list = parameter_pass_move(list, tmp_int);

    println!(
        "\n-- After function call --\ntmp_int in main: {}\nlist in main: {}",
        tmp_int,
        list.join(" ")
    );

    println!("\nOperation {} (Pass by Borrow)", operation_number);

    println!(
        "\n-- Before function call --\ntmp_int in main: {}\nlist in main: {}",
        tmp_int,
        list.join(" ")
    );

    parameter_pass_borrow(&mut list, &mut tmp_int);

    println!(
        "\n-- After function call --\ntmp_int in main: {}\nlist in main: {}",
        tmp_int,
        list.join(" ")
    );

    operation_number += 1;

    // Operation 5: Can subprograms be passed as parameters? If so, how is the referencing environment of the passed subprogram bound?
    println!("\nOperation {}", operation_number);
    // let refEnvChecker: &str = "Ad Hoc Binding"; SYNTAX ERROR WHEN GLOBAL REFENVCHECKER IS COMMENTED OUT
    subprogramPass(passedFunction, operation_number);
    operation_number += 1;
}

fn type_checking(int_variable: i32, int_variable2: i32) {
    println!("{}", int_variable + int_variable2);
}

fn parameter_pass_move(mut list: Vec<String>, mut int_variable: i32) -> Vec<String> {
    int_variable = 15;
    list.push(String::from("addedElement"));
    list = vec!["MutableType_MoveChecker".to_string()];
    // LIST VARIABLE CAN NOT BE USED FOR PASS BY VALUE AS IT DOES NOT HAVE A BUILT IN COPY TRAIT

    println!(
        "\n-- In pass-move function call --\ntmp_int in main: {}\nlist in main: {}",
        int_variable,
        list.join(" ")
    );

    list
}

fn parameter_pass_borrow(list: &mut Vec<String>, int_variable: &mut i32) {
    *int_variable = 15;
    (*list).push(String::from("addedElement"));

    *list = vec!["MutableType_BorrowChecker".to_string()];

    println!(
        "\n-- In pass-borrow function call --\ntmp_int in main: {}\nlist in main: {}",
        int_variable,
        list.join(" ")
    );
}

fn subprogramPass(function: fn(i32), int_variable: i32) {
    // let refEnvChecker: &str = "Ad Hoc Binding"; SYNTAX ERROR WHEN GLOBAL REFENVCHECKER IS COMMENTED OUT
    function(int_variable);
}

fn passedFunction(int_variable: i32) {
    println!("Passed function with a parameter: {}", int_variable);
    println!("Binding refEnvChecker: {}", refEnvChecker);
}