package utils

import "core:fmt"
import "core:strconv"
import "core:strings"
import "base:runtime"

print_help :: proc() {
    fmt.println(
`
Welcome to the blmath help menu!

Usage:
blmath <operation> <arguments>

Valid operations are:
add, sub, mult, div, mod, mean, median, range, sort, rsort

Arguments should be numbers separated by spaces.

Examples:
blmath add 1 2 3 4 5    -> 15
blmath sub 10 5         -> 5
blmath sort 3 1 10 2 7  -> 1 2 3 7 10
blmath rsort 3 1 10 2 7 -> 10 7 3 2 1 
`
    )
}

append :: proc{append_int, append_f64}

append_int :: proc(collection: []int, element: int) -> []int {
    result := make([]int, len(collection)+1)
    for item, i in collection {
        result[i] = item
    }
    result[len(collection)] = element
    return result
}

append_f64 :: proc(collection: []f64, element: f64) -> []f64 {
    result := make([]f64, len(collection)+1)
    for item, i in collection {
        result[i] = item
    }
    result[len(collection)] = element
    return result
}

// Call `convert_args` with 0 for int and 1.0 for f64.
convert_args :: proc{
    convert_args_int, 
    convert_args_f64
}

convert_args_int :: proc(_: int, args: []string) -> []int {
    result := make([]int, 0)
    for arg in args {
        num, ok := strconv.parse_int(arg) 
        if !ok do continue
        result = append(result, num)
    }
    return result
}

convert_args_f64 :: proc(_: f64, args: []string) -> []f64 {
    result := make([]f64, 0)
    for arg in args {
        num, ok := strconv.parse_f64(arg) 
        if !ok do continue
        result = append(result, num)
    }
    return result
}

to_string :: proc{int_to_string, f64_to_string}

int_to_string :: proc(value: int) -> string {
    builder: strings.Builder
    defer strings.builder_destroy(&builder)
    temp := fmt.sbprintf(&builder, "%d", value) 
    result := strings.clone(temp)
    return result
}

f64_to_string :: proc(value: f64) -> string {
    builder: strings.Builder
    defer strings.builder_destroy(&builder)
    temp := fmt.sbprintf(&builder, "%f", value) 
    result := strings.clone(temp)
    return result
}

