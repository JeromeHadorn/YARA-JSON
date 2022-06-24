#!/bin/bash

echo "Tests below are failing:"
yara --fail-on-warnings -n tests/rules.yara tests/tests.json