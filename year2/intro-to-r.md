# Introduction to R
## Data types
When it comes to programming language, there are all sorts of data types in different languages. In R, there are 6 basic types:
* `logical`
* `numeric`
* <code>integer</code>
* <code>complex</code>
* <code>character</code>
* <code>raw</code>

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
### 2. Numerica type
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
The `character` data type supports all alphanumeric and special characters. For those who are familiar with programming, it is also known as a `string`.  

### 6. Raw type


###
## Data structures
## Functions
### How to make a function
