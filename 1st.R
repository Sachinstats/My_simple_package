install.packages("devtools")
# Load devtools
library(devtools)

# Create a new package in a specified directory
create("MySimplePackage")
# Inside MySimplePackage/R/functions.R
#' Square a Number
#'
#' @param x A numeric value to square
#' @return The square of `x`
#' @export
square <- function(x) {
  return(x * x)
}

#' Cube a Number
#'
#' @param x A numeric value to cube
#' @return The cube of `x`
#' @export
cube <- function(x) {
  return(x * x * x)
}
# Regenerate documentation and update NAMESPACE
document()
# Add testthat support
use_testthat()

# Create a test script for the square function
writeLines("
test_that('Square Function Works', {
  expect_equal(square(2), 4)
  expect_equal(square(3), 9)
})
", "tests/testthat/test_square.R")

# Create a test script for the cube function
writeLines("
test_that('Cube Function Works', {
  expect_equal(cube(2), 8)
  expect_equal(cube(3), 27)
})
", "tests/testthat/test_cube.R")

# Run all tests
test()
# Build the package
build()
# Install the package
install("MySimplePackage")

# Load the package
library(MySimplePackage)

# Test the functions
square(100)# Should return 16
cube(3)    # Should return 27


