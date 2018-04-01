#lang jsonic

{
  "value": 123,
  "string":
  [
    {
      "array": @$(range 5)$@,
      "object": @$(hash 'k1 "valstring")$@
    }
  ]
  // "bar"
}