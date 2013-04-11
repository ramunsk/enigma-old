math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

alert "Three cubed is #{math.cube 3}"