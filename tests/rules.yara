import "json"

// rule key_exists {
//     condition:
//         json.key_exists("keykey")
// }

// rule key_exists_multi_level {
//     condition:
//         json.key_exists("foo.bar") and json.key_exists("foo.baz.boo")
// }

// rule string_value_exists {
//     condition:
//         json.value_exists("keykey", "valuevalue") and json.value_exists("foo.bar", "valuevalue")
// }

// rule int_value_exists {
//     condition:
//         json.value_exists("numbers.int", 1)
// }
// rule regex_value_exists {
//     condition:
//         json.value_exists("regex", /[0-9a-zA-Z]{32}/)
// }

// rule float_value_exists {
//     condition:
//         json.value_exists("numbers.float", 1.1)
// }

rule string_array_includes {
    condition:
        json.string_array_includes("strArray", "one") and
        json.string_array_includes("strArray", "two") and
        json.string_array_includes("strArray", "three")
}

rule string_array_includes_nested {
    condition:
        json.string_array_includes("string.strArray", "one") and
        json.string_array_includes("string.strArray", "two") and
        json.string_array_includes("string.strArray", "three")
}

rule integer_array_includes {
    condition:
        json.integer_array_includes("intArray", 1) and
        json.integer_array_includes("intArray", 2) and
        json.integer_array_includes("intArray", 3)
}

rule integer_array_includes_nested {
    condition:
        json.integer_array_includes("integer.intArray", 1) and
        json.integer_array_includes("integer.intArray", 2) and
        json.integer_array_includes("integer.intArray", 3)
}

rule float_array_includes {
    condition:
        json.float_array_includes("floatArray", 1.0) and
        json.float_array_includes("floatArray", 2.0) and
        json.float_array_includes("floatArray", 3.0)
}

rule float_array_includes_nested {
    condition:
        json.float_array_includes("float.floatArray", 1.0) and
        json.float_array_includes("float.floatArray", 2.0) and
        json.float_array_includes("float.floatArray", 3.0)
}