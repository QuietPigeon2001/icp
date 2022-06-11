# Introduction to R
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
///
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


## Functions
### How to make a function
