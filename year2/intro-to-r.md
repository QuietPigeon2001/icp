# Introduction to R by Moreen
## Data types
When it comes to programming language, there are all sorts of data types in different languages. In R, there are 5 basic types:
* `logical`
* `numeric`
* `integer`
* `complex`
* `character`

I will briefly introduce each of them with some examples.
### 1. Logical type 
The logical type only has two values: `TRUE` and `FALSE`. For those who are familiar with programming, it is also known as the `boolean` type. We can also denote the values as `T` and `F` respectively. 

For example,
```
bool1 = TRUE
bool2 = F
print(bool1)
print(bool2)
```
Output:
```
[1] TRUE
[1] FALSE
```
### 2. Numeric type
Unlike traditional programming languages like C or Fortran, we do not have to declare the type of numbers in the programme. The numeric type includes all real numberes, regardless of the number of decimal places. All we have to do is enter the exact number, and the code will determine the type for us. 

For example,
```
a = 1
b = 2.1
c = 1/3
paste(a,",",b,",",c)
```
Output:
```
[1] "1 , 2.1 , 0.333333333333333"
```
### 3. Integer type
Unlike the `numeric` type, the `integer` type only represents integers. To declare an integer, we add a `L` or after the number. Or, we can use the function `as.integer()` to convert a number to an integer as well. 

For example,
```
a = 12L
b = as.integer(5.1)
paste(a, ",", b)
```

Output:
```
[1] "12 , 5"
```
### 4. Complex type
Since R is a language that focuses on calculations and numeric data processing, it also supports complex number calculations as well. To declare a complex number, we can use `i` to denote the imaginary part like we always do.

For example,
```
x = 5 + 2i
print(x)
print(x**2)
```
Output:
```
[1] 5+2i
[1] 21+20i
```
### 5. Character type
The `character` data type supports all alphanumeric and special characters. For those who are familiar with programming, it is also known as a `string`.  To declare a string, `"` is put at the beginning and end of the string. 

For example,
```
string1 = "this"
string2 = "100"
print(string1)
print(string2)
```
Output:
```
[1] "this"
[1] "100"
```
Although a string can be used to represent a number, the number itself **cannot perform any calculations** because it is of the `character` type, not `numeric`. Let's try:
```
a = "100"
b = "2"
c = 5
print(a + b)
print(a + c)
```
Output: 
```
Error in a + b : non-numeric argument to binary operator
Error in a + c : non-numeric argument to binary operator
```
If we want to perform calculations with a string, we can convert the string to an integer by using the `strtoi()` function. 
Syntax:
```
strtoi(x, base=0L)
```
The default value for the base is 0, but we can choose any bases between 2 and 36 if necessary. 
For example, 
```
cc = c("11", "21", "19")
strtoi(cc)
```
Output:
```
[1] 11 21 19
```

## Data structures
We can organise data with data structures. Here are some of the most common data structures used in R:
* Vectors
* Lists
* Dataframes
* Matrices
* Arrays
* Factors

### 1. Vectors
In mathematics, a vector is a value that shows both its magnitude and direction. In R, it is a collection of data types of a given length. **The elements inside the vector must be of the same data type.** 
For example, 
```
v = c(1, 4, 5)
print(v)
```
Output:
```
[1] 1 4 5
```
### 2. Lists
Lists are similar to vectors in a way that they are also collections of data, but they can contain more than one type of data, such as strings and integers. 
For example, 
```
customer_id = c(1, 2, 3, 4)
customer_name = c("Mary", "Joseph", "Peter", "Thomas")
number_of_customers = 4

customer_list = list(customer_id, customer_name, number_of_customers)
print(customer_list)
```
Output:
```
[[1]]
[1] 1 2 3 4

[[2]]
[1] "Mary"   "Joseph" "Peter"  "Thomas"

[[3]]
[1] 4
```
### 3. Dataframes
Dataframes are used to store tabular data. They are very useful because it increases the readability of data. Unlike lists and vectors, dataframes are two-dimensional data structures. In order to create a dataframe, here are a few points to note:
* You must create titles for each column and row
* The number of items in each column must be identical
* All items in the same column must have the same data type
After understanding constraints of dataframes, we can create one by using the function `data.frame()`.
For example, 
```
customer_id = c(1, 2, 3, 4)
customer_name = c("Mary", "Joseph", "Peter", "Thomas")
purchase_history = c("Dress", "Jeans", "Sunglasses", "Bag")
df = data.frame(customer_id, customer_name, purchase_history)
print(df)
```
Output:
```
  customer_id customer_name purchase_history
1           1          Mary            Dress
2           2        Joseph            Jeans
3           3         Peter       Sunglasses
4           4        Thomas              Bag
```

### 4. Matrices
Matrices are collections of data in two dimensions, consisting of rows and columns. They are also homogenous, meaning that it can only contain one data type. To declare a matrix, we can use the function `matrix()`, and inside we have to specify the elements, the number of rows and the number of columns. 
For example,
```
matA = matrix(c(1,3,2,4), nrow = 2, ncol = 2)
matB = matrix(c(1,3,2,4), nrow = 2, ncol = 2, byrow = T)

print(matA)
print(matB)
```
Output:
```
     [,1] [,2]
[1,]    1    2
[2,]    3    4

     [,1] [,2]
[1,]    1    3
[2,]    2    4
```
_Do you notice what is the difference between `matA` and `matB`?_
### 5. Arrays
Arrays are similar to matrices but unlike matrices, they can store more than two dimensions. We use the function `array()` to store the elements inside the array, and `dim()` to specify the numbers of rows, columns, and matrices respectively. 
For example,
```
arr = array(c(1,2,3,4,5,6,7,8), dim = c(2,3,3))
print(arr)
```
Output:
```
, , 1

     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

, , 2

     [,1] [,2] [,3]
[1,]    7    1    3
[2,]    8    2    4

, , 3

     [,1] [,2] [,3]
[1,]    5    7    1
[2,]    6    8    2
```
### 6. Factors
Factors might be a foreign term in programming but they are very useful in data analysis for statistical modelling. We can use the function `factor()` and use a vector as an argument to the function. 
For example, 
```
f = factor(c("Good", "Bad", "Good", "Good", "Bad"))
print(f)
```
Output:
```
[1] Good Bad  Good Good Bad 
Levels: Bad Good
```
## Functions
In the above, you may have noticed that I have mentioned the term _function_ several times. But what exactly is a function in R? According to [tutorialspoint](https://www.tutorialspoint.com/r/r_functions.htm), 
> A function is a set of statements organized together to perform a specific task. R has a large number of in-built functions and the user can create their own functions.
In R, a function is an object so the R interpreter is able to pass control to the function, along with arguments that may be necessary for the function to accomplish the actions.

There are four main parts in a function, they are:
1. Function name: name of the function stored as an object in the code 
2. Arguments: parameters passed into the function, but they are optional 
3. Function body: the code that defines what the function does
4. Return value: the result of the code in the function

The aforementioned functions are built-in, meaning that you can just call them directly. Now, I am going to show you how to make your own function. 
### How to make a function
To declare a function, we first have to specify the function name and its arguments (if there is any), such as:
```
my_function <- function(arg1, arg2, ...) {
  # Body
}
```
Let's say we want to calculate the squared sum of two numbers. Since we will be needing the values of the two numbers, we can pass them into the function as arguments. Our function will be returning the result of the squared sum of those two arguments. 
```
squared_sum <- function(x, y) {
  res = (x + y)**2
  print(res)
}
```
After creating the function, we will need to call it. 
```
squared_sum(4, 9)
```
Output: 
```
[1] 169
```
Hence, the overall code will look like this: 
```
squared_sum <- function(x, y) {
  res = (x + y)**2
  print(res)
}
squared_sum(4, 9)
```
Functions are extremely important in programming. Other than allowing us to run the same code repeatedly with different arguments, it also helps us to organise our code and make it easier for other people to understand. The above is just a simple example of a function. If you get the basics right, you will be able to create many useful functions such as integrating for-loops and if-statements. Enjoy!

## References
https://www.w3schools.com/r/default.asp

https://www.tutorialspoint.com/r/index.htm

https://www.geeksforgeeks.org/r-tutorial/?ref=lbp
