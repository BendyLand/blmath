package operations

import "core:strings"
import "../errors"

Operation :: enum {
    Additon,
    Subtraction,
    Multiplication,
    Division,
    Modulo,
    Mean,
    Median,
    Range,
    Sort,
    Rsort,
    Help,
    Unknown,
}

get_operation :: proc(args: []string) -> (Operation, errors.Error) {
    result: Operation
    if len(args) > 1 {
        op := strings.to_lower(args[1])
        switch op {
        case "add":     result = Operation.Additon
        case "sub":     result = Operation.Subtraction
        case "mult":    result = Operation.Multiplication
        case "div":     result = Operation.Division
        case "mod":     result = Operation.Modulo
        case "mean":    result = Operation.Mean
        case "median":  result = Operation.Median
        case "range":   result = Operation.Range
        case "sort":    result = Operation.Sort
        case "rsort":   result = Operation.Rsort
        case "help":    result = Operation.Help
        case:           
            result = Operation.Unknown
            text := "Unknown operation."
            err := errors.new_error(errors.Error_Kind.Operation_Error, text)
            return result, err
        }
    }
    else {
        text := "Not enough arguments."
        return Operation.Unknown, errors.new_error(errors.Error_Kind.Operation_Error, text)
    }
    return result, errors.new_error(errors.Error_Kind.Nil, "")
}

get_operation_total :: proc(op: Operation) -> string {
    result: string
    #partial switch op {
    case Operation.Additon:           result = "Sum"
    case Operation.Subtraction:       result = "Difference"
    case Operation.Multiplication:    result = "Product"
    case Operation.Division:          result = "Quotient"
    case Operation.Modulo:            result = "Remainder"
    case Operation.Mean:              result = "Mean"
    case Operation.Median:            result = "Median"
    case Operation.Range:             result = "Range"
    case Operation.Sort:              result = "Sorted"
    case Operation.Rsort:             result = "Reverse Sorted"
    case Operation.Unknown:           result = "Result"
    // case Help: is not needed
    }
    return result
}