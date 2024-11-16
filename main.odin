package blmath

import "core:fmt"
import "core:os"
import "core:strings"
import "errors"

main :: proc() {
    fmt.println("Hello blmath!")
    op, err := get_operation(os.args)
    if err.kind != errors.Error_Kind.Nil {
        fmt.println("Error:", err.text)
        return
    }
    result: string
    switch op {
    case Operation.Additon:
        result = add(os.args)
    case Operation.Subtraction:
        result = subtract(os.args)
    case Operation.Multiplication:
        result = multiply(os.args)
    case Operation.Division:
        result = divide(os.args)
    case Operation.Modulo:
        result = remainder(os.args)
    case Operation.Mean:
        result = mean(os.args)
    case Operation.Median:
        result = median(os.args)
    case Operation.Range:
        result = range(os.args)
    case Operation.Sort:
        result = sort(os.args)
    case Operation.Rsort:
        result = rsort(os.args)
    case Operation.Unknown:
        fmt.println("Unknown operation.")
        return
    }
    fmt.println("Result:", result)
}

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
    Unknown
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



add :: proc(args: []string) -> string {
    return ""
}

subtract :: proc(args: []string) -> string {
    return ""
}

multiply :: proc(args: []string) -> string {
    return ""
}

divide :: proc(args: []string) -> string {
    return ""
}

remainder :: proc(args: []string) -> string {
    return ""
}

mean :: proc(args: []string) -> string {
    return ""
}

median :: proc(args: []string) -> string {
    return ""
}

range :: proc(args: []string) -> string {
    return ""
}

sort :: proc(args: []string) -> string {
    return ""
}

rsort :: proc(args: []string) -> string {
    return ""
}
