import "json"

rule key_exists {
    condition:
        json.key_exists("keykey")
}

rule key_exists_multi_level {
    condition:
        json.key_exists("foo.bar") and json.key_exists("foo.baz.boo")
}

rule string_value_exists {
    condition:
        json.value_exists("keykey", "valuevalue") and json.value_exists("foo.bar", "valuevalue")
}

rule int_value_exists {
    condition:
        json.value_exists("numbers.int", 1)
}
rule regex_value_exists {
    condition:
        json.value_exists("regex", /[0-9a-zA-Z]{32}/)
}

rule float_value_exists {
    condition:
        json.value_exists("numbers.float", 1.1)
}