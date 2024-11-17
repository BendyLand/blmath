package blmath

import "core:fmt"
import "core:os"
import "core:slice"
import "core:strings"
import "core:math"
import "errors"
import "operations"
import "utils"

main :: proc() {
    op, err := operations.get_operation(os.args)
    using errors
    if err.kind != Error_Kind.Nil {
        fmt.println("Error:", err.text)
        utils.print_help()
        return
    }
    result: string; result, err = perform_operation(op, os.args[1:])
    if err.kind != Error_Kind.Nil && err.kind != Error_Kind.Help_Error {
        fmt.println("Error:", err.text)
        utils.print_help()
        return
    }
    else if err.kind == Error_Kind.Help_Error do return
    title := operations.get_operation_total(op)
    fmt.printf("%s: %s\n", title, result)
}

perform_operation :: proc(
    op: operations.Operation,
    args: []string
) -> (string, errors.Error) {
    result: string
    switch op {
    case operations.Operation.Additon:
        result = add(args)
    case operations.Operation.Subtraction:
        result = subtract(args)
    case operations.Operation.Multiplication:
        result = multiply(args)
    case operations.Operation.Division:
        result = divide(args)
    case operations.Operation.Modulo:
        result = remainder(args)
    case operations.Operation.Mean:
        result = mean(args)
    case operations.Operation.Median:
        result = median(args)
    case operations.Operation.Range:
        result = range(args)
    case operations.Operation.Sort:
        result = sort(args)
    case operations.Operation.Rsort:
        result = rsort(args)
    case operations.Operation.Help:
        utils.print_help()
        return "", errors.new_error(errors.Error_Kind.Help_Error, "")
    case operations.Operation.Unknown:
        text := "Cannot perform unknown operation."
        return "", errors.new_error(errors.Error_Kind.Operation_Error, text)
    }
    return result, errors.new_error(errors.Error_Kind.Nil, "")
}

add :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    result := math.sum(nums)
    return utils.to_string(result)
}

subtract :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    result := nums[0]
    for num in nums[1:] {
        result -= num
    }
    return utils.to_string(result)
}

multiply :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    result := math.prod(nums)
    return utils.to_string(result)
}

divide :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    result := nums[0]
    for num in nums[1:] {
        if num != 0 do result /= num
    }
    return utils.to_string(result)
}

remainder :: proc(args: []string) -> string {
    nums := utils.convert_args(0, args[1:])
    result := nums[0]
    for num in nums[1:] {
        if num != 0 do result %= num
    }
    return utils.to_string(result)
}

mean :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    length := f64(len(nums))
    total := math.sum(nums)
    total /= length
    return utils.to_string(total)
}

median :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args[1:])
    utils.sort(&nums)
    length := len(nums)
    result: string
    if length % 2 == 0 {
        mid := length / 2 - 1
        temp := (f64(nums[mid]) + f64(nums[mid+1])) / 2
        result = utils.to_string(temp)
    }
    else {
        mid := length / 2
        temp := nums[mid]
        result = utils.to_string(temp)
    }
    return result
}

range :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args)
    min := slice.min(nums)
    max := slice.max(nums)
    diff := max - min
    result := utils.to_string(diff)
    return result
}

sort :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args)
    utils.sort(&nums)
    result := utils.to_string(nums)
    return result
}

rsort :: proc(args: []string) -> string {
    nums := utils.convert_args(1.0, args)
    utils.sort(&nums)
    utils.reverse(&nums)
    result := utils.to_string(nums)
    return result
}
