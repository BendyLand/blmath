package errors

Error :: struct {
    kind: Error_Kind,
    text: string
}

Error_Kind :: enum {
    Operation_Error,
    Nil
}

new_error :: proc(kind: Error_Kind, text: string) -> Error {
    return Error{kind, text}
}
