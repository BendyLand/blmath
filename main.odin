package blmath

import "core:fmt"
import "core:os"
import "core:strings"
import "core:math"
import "errors"
import "operations"
import "utils"

main :: proc() {
    op, err := operations.get_operation(os.args)
    if err.kind != errors.Error_Kind.Nil {
        fmt.println("Error:", err.text)
        return
    }
    result: string
    switch op {
    case operations.Operation.Additon:
        result = add(os.args[1:])
    case operations.Operation.Subtraction:
        result = subtract(os.args)
    case operations.Operation.Multiplication:
        result = multiply(os.args)
    case operations.Operation.Division:
        result = divide(os.args)
    case operations.Operation.Modulo:
        result = remainder(os.args)
    case operations.Operation.Mean:
        result = mean(os.args)
    case operations.Operation.Median:
        result = median(os.args)
    case operations.Operation.Range:
        result = range(os.args)
    case operations.Operation.Sort:
        result = sort(os.args)
    case operations.Operation.Rsort:
        result = rsort(os.args)
    case operations.Operation.Help:
        utils.print_help()
    case operations.Operation.Unknown:
        fmt.println("Unknown operation.")
        return
    }
    title := operations.get_operation_total(op)
    fmt.printf("%s: %s\n", title, result)
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
