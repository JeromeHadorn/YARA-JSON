# YARA JSON Module
## YARA C Module for finding key and values in JSON files
This module helps to search through JSON files in a structured way, looking for key and values. Given the popularity of JSON as a data format this YARA module combined with other applications can leverage one's analysis.

## Features

#### key_exists(key)
```yara
import json
rule key_exists {
  condition:
    json.key_exists("foo.bar")
}
```
Will match only if the JSON object contains a key named `foo.bar`.
```json
{
    "foo": {
        "bar": "baz" // Will match
    }
}
```

#### value_exists(key, value)
```yara
import json
rule value_exists {
  condition:
    json.value_exists("foo.bar", "baz")
}
```
Will match only if the JSON object contains a key named `foo.bar` with a value of `baz`.

Value can be of type `string`, `integer`, `float` or `regex`.
```json
{
    "foo": {
        "bar": "baz"  // Will match
    }
}
```

Checkout more examples in the [test run file](tests/rules.yara).

## Usage Instructions (when building from source)
1. Clone the [YARA Repository](https://github.com/VirusTotal/yara)
2. Copy the `json.c` file to `yara/libyara/modules/json/json.c`
```sh
mkdir yara/libyara/modules/json/
cp json.c yara/libyara/modules/json/json.c
```
2. Append `Module(json)` to `yara/libyara/modules/module_list` under the `#ifdef CUCKOO_MODULE` block
```
#ifdef CUCKOO_MODULE
MODULE(cuckoo)
MODULE(json)
#endif
```
3. Append `MODULES += modules/json/json.c` to the `yara/libyara/Makefile.am` file.

4. This module requires the C `libjansson` library. For an easier install it is recommended to `--enable-cuckoo` as it also uses the `libjansson` library.

```sh
cd yara/
./bootstrap.sh
./configure --enable-cuckoo
cd yara/libyara/
make
make install
make check
```

## Improvements
Addition of `regex_value_contains` which can iteratate over lists/arrays.
