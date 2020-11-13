
1. Writing and Running Ruby Programs {#_idParaDest-8}
====================================

::: {#_idContainer010 .Content}
:::

::: {#_idContainer058 .Content}
Overview

By the end of this chapter, you will be able to use the Interactive Ruby
Shell (IRB) to write Ruby programs; execute Ruby code with a Ruby
interpreter using Ruby (.rb) files; implement variables, literals, and
constants in Ruby programs; use standard data types, such as numbers,
Booleans, and strings, in Ruby programs; execute basic arithmetic
operations on integer and floating-point numbers, implement string
concatenation and interpolation in Ruby programs.

This chapter introduces the basics of Ruby and serves as a firm
foundation to build the complex code that you will encounter later in
the book.


Introduction {#_idParaDest-9}
============

::: {#_idContainer058 .Content}
Ruby is a dynamic, interpreted, object-oriented programming language
developed by Yukihiro (\"Matz\") Matsumoto at some point in the
mid-1990s, with its first stable release in 1995. According to the
creator of Ruby, it is highly influenced by Perl, Smalltalk, Ada, and
Lisp. The influence of these languages on Ruby allows it to embrace
various programming paradigms, such as functional, object-oriented, and
imperative, with dynamic typing (referred to as **duck typing** in
popular culture) and automatic memory management.

Being an interpreted scripting language, Ruby has the ability to make
system calls directly, and has a long list of useful string operations
where variable declaration and variable type are not required. Ruby
wholly embraces object-oriented programming because everything in Ruby
is an object. Ruby has a long list of keywords that make many operations
a piece of cake. This means you can do more with less code.

Whether you are a newbie to the world of programming, or an experienced
developer in other languages who is tired of the compilation processes,
extra declarations, and the keywords of other languages, Ruby will be a
revelation from the point of view of your productivity.

With all these characteristics, Ruby gives developers an enriching
experience, making programming productive and fun. In addition to Ruby
being a fantastic programming language, the Ruby community is also very
friendly and supportive.

[]{#_idTextAnchor011}

Key Features of Ruby {#_idParaDest-10}
--------------------

A number of key features of the Ruby language make it really unique in
terms of working with it. It has very neatly assimilated the best
features of many programming languages. Here are a few features of Ruby
that make it a delight to program with:

-   Object-oriented
-   Interpreted language
-   Duck typing and dynamic typing
-   Multi-paradigm language
-   Reflection
-   Metaprogramming
    ::: {#_idContainer011 .IMG---Figure}
    ![Figure 1.1: Key features of Ruby ](2_files/C14197_01_01.jpg)
    :::

Figure 1.1: Key features of Ruby

[]{#_idTextAnchor012}

### Object-Oriented {#_idParaDest-11}

Ruby is thoroughly object-oriented, and objects are the basic building
block of a Ruby program. Every value in Ruby is an object, even data
types such as strings, numbers, and Booleans: everything is an object.
This means that every object is part of a class that gives access to a
wide range of methods to do incredible things. Each class is also an
object in Ruby. Here\'s an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
class Fruit
 #code
end
```
:::

The preceding code defines the `Fruit`{.literal} class. The following
code shows that two new objects, `fruit1`{.literal} and
`fruit2`{.literal}, are derived from the `Fruit`{.literal} class:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
fruit1 = Fruit.new
fruit2 = Fruit.new
```
:::

[]{#_idTextAnchor013}

### Interpreted Language {#_idParaDest-12}

Ruby is an interpreted language, meaning that it\'s ready to run the
program as soon as you finish typing. Unlike programming languages such
as **C++**, **Java**, and **Objective-C**, which require code to be
compiled before running, this is not the case with Ruby. Look at this
example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
print "Hello World"
```
:::

This code will immediately print `Hello World`{.literal}, as follows:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
Hello World
```
:::

[]{#_idTextAnchor014}

### Duck Typing and Dynamic Typing {#_idParaDest-13}

Dynamic typing means a variable can refer to objects of various types
when the program is executed. There is no type checking in Ruby. Duck
typing is a principle that denotes that an object is based on the value
assigned to it rather than the type of variable. The underlying rule
here is: \"If it walks like a duck and quacks like a duck, then it must
be a duck.\" Here\'s an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
x= [:a, :b, :c]
x.map(&:to_s) # => ['a', 'b', 'c']
```
:::

The preceding example illustrates how the `x`{.literal} variable
responds to `map`{.literal} and returns the expected object. This means
that the `x`{.literal} variable here is considered an **array**.

[]{#_idTextAnchor015}

### Multi-paradigm Language {#_idParaDest-14}

While languages are focused on one type of programming paradigm, besides
being object-oriented, Ruby also allows procedural and functional styles
of programming. The procedural paradigm refers to an instance where
procedure calls are interpreted as function calls. However, functions do
not exist in Ruby, and, therefore, methods can be created outside
classes. Look at this example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
self # => main
def method1
  "John is developing a program."
end
def method2
  "Jane is developing another program."
end
method1 # => "John is developing a program."
method2 # => "Jane is developing another program."
```
:::

Here, `method1`{.literal} and `method2`{.literal} are defined outside
the classes; however, they are still a part of the `main`{.literal}
object.

Additionally, Ruby also features the functional style of programming,
meaning it largely revolves around functions. Consider the following
example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def ruby_method(obj)
  obj - 1
end
print ruby_method(5)
=> 4
```
:::

Here, the `ruby_method`{.literal} always stores the result of the object
passed as an argument, subtracting 1.

[]{#_idTextAnchor016}

### Reflection {#_idParaDest-15}

Reflection in Ruby makes it very easy to understand what\'s happening at
runtime because you can get a lot of information, such as class methods,
inheritance hierarchies, and all the living objects in your running
program. Here\'s an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
class Box
  def hello
    "hello"
  end
end
# without reflection
obj = Box.new
obj.hello
# with reflection
class_name = "Box"
method_name = :hello
obj = Object.const_get(class_name).new
obj.send method_name
```
:::

This shows that we can inspect every element of the code.

[]{#_idTextAnchor017}

### Metaprogramming {#_idParaDest-16}

Ruby supports metaprogramming, which is a technique that helps you to
write code that creates code on its own. This means it is able to create
methods and classes dynamically. With metaprogramming, you can write
methods and classes at runtime, which helps us to maintain a **Don\'t**
**Repeat** **Yourself** (**DRY**) and maintainable code base. Here\'s an
example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
['one', 'two', 'three'].each do |num|
  define_method(num) do
    num.upcase
  end
end
one # => "ONE"
two # => "TWO"
three # => "THREE"
```
:::

The preceding code shows that we can make changes to the core
`Array`{.literal} class at runtime and modify it as required.


Interactive Ruby Shell (IRB) {#_idParaDest-17}
============================

::: {#_idContainer058 .Content}
The easiest way to start playing around with Ruby is by using **IRB**,
where **I** stands for **Interactive** and **RB** stand for the **.rb**
extension of the Ruby programming files. IRB is a command-line
interpreter and is also known as a **REPL** tool in Ruby, which means
**Read**, **Eval**, **Print**, and **Loop**, and was inspired by
Smalltalk. IRB is very useful for quick experiments, exploring Ruby, and
testing fragments of code quickly.

IRB comes out of the box with Ruby, and you can access it using the
`irb`{.literal} command from the Terminal:

1.  Go to the Terminal (or Command Prompt) and type the following
    command:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    $ irb 
    >_ 
    ```
    :::

2.  Once the shell is open, you can type commands and get instant
    results. Try a simple `puts`{.literal} command in Ruby using IRB:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts "Hello World"
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer012 .IMG---Figure}
![Figure 1.2: Output for \"Hello World\" ](3_files/C14197_01_02.jpg)
:::

</div>

Figure 1.2: Output for \"Hello World\"

Note

`puts`{.literal} or `p`{.literal} is used to print any string or value
of a variable that follows `puts`{.literal} or `p`{.literal}.

Let\'s do some addition with the Interactive Ruby Shell:

1.  Go to the IRB shell.

2.  Type the following command:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    17 + 13
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer013 .IMG---Figure}
![Figure 1.3: Addition output on irb ](3_files/C14197_01_03.jpg)
:::

</div>

Figure 1.3: Addition output on irb

Note

You can use IRB or any IDE to complete the exercises/activities in this
book.

[]{#_idTextAnchor019}

Exercise 1.01: Creating and Assigning Variables {#_idParaDest-18}
-----------------------------------------------

In this exercise, we will create a variable, assign an operation to it,
and print it. Let\'s assign the calculation in the previous example to a
variable, such as the number of students, and print it in IRB:

1.  Go to the IRB shell or the IDE of your choice.

2.  Type the following code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    number_of_students = 17 + 13
    ```
    :::

    You should get the sum of 17 and 13 in the output.

3.  Next, we print the value carried by the
    `number_of_students`{.literal} variable:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts number_of_students
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer014 .IMG---Figure}
![Figure 1.4: Output for assigning variables ](3_files/C14197_01_04.jpg)
:::

</div>

Figure 1.4: Output for assigning variables

Note

The Ruby variable stores the value assigned to a variable in one IRB
session, as seen here with `number_of_students`{.literal}.

Before we start the next exercise, please note that data types in Ruby
symbolize various types of data, such as strings, numbers, decimal
numbers, and text. All of these data types are based on classes; for
example, `string`{.literal} is an object of the `String`{.literal}
class, since Ruby is an object-oriented language. We will discuss a
variety of data types in Ruby later in this chapter.

[]{#_idTextAnchor020}

Exercise 1.02: Assigning a Variable of One Data Type to a Different Type {#_idParaDest-19}
------------------------------------------------------------------------

In this exercise, we will assign a string value to a variable of the
integer data type. It is not necessary that a variable, once assigned,
stays the same type forever. Let\'s assign a variable that holds an
integer and another variable that has a string value:

1.  Continue from the previous example (if you are starting here, please
    complete *Exercise 1.01, Creating and Assigning Variables*).

2.  Type the following code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    number_of_students
    ```
    :::

    This should give you an output of `30`{.literal} as this was the
    value assigned in the previous exercise.

    Next, we assign a different value to the
    `number_of_students`{.literal} variable:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    number_of_students = "not enough for a session"
    => "not enough for a session"
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer015 .IMG---Figure}
![Figure 1.5: The output for variables assigned to a different data type
](3_files/C14197_01_05.jpg)
:::

</div>

Figure 1.5: The output for variables assigned to a different data type

We can simply change the data type of a variable with the inbuilt Ruby
methods. For example, to convert an integer to a string, we can use
**.to\_s**, and we can convert a string to an integer with **.to\_i**.

We will study Ruby methods in detail in the later sections of this
chapter.

[]{#_idTextAnchor021}

Exercise 1.03: Getting the Type of a Variable {#_idParaDest-20}
---------------------------------------------

In this exercise, we will get information about the data type of a
variable. Continuing on from the previous exercise, we can get a lot of
information about the variable. First, let\'s see from which class the
variable is derived. This can be achieved using the dot (`.`{.literal})
operator on the variable itself.

1.  Continue from the previous example (if you are starting here, please
    complete *Exercises 1.01, Creating and Assigning Variables* and
    *1.02, Assigning a Variable of One Data Type to a Different Type*).

2.  Now, we will try to identify the data type of our
    `number_of_students`{.literal} variable using `.class`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    number_of_students.class
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer016 .IMG---Figure}
    ![Figure 1.6: Output of the data type of a variable
    ](3_files/C14197_01_06.jpg)
    :::

    Figure 1.6: Output of the data type of a variable

    `.class`{.literal} tells us about the class that the variable
    belongs to.

3.  The same can be achieved using the `::`{.literal} operator:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    number_of_students::class
    ```
    :::

In Ruby, the `.`{.literal} and `::`{.literal} operators almost work in
the same way. There is no major difference between `::`{.literal} and
`.`{.literal} when calling static methods. However, you may use the
`::`{.literal} operator to access constants and other name-spaced
things, where using the dot (`.`{.literal}) operator is not possible.
Aesthetically, `.`{.literal} operator is preferable to `::`{.literal}
operator.

[]{#_idTextAnchor022}

Getting the Details of the Public Methods of an Object {#_idParaDest-21}
------------------------------------------------------

We will now see various public methods that are available for an object
by default from Ruby. Everything in Ruby is an object; the **class**
itself is an object of **Class**. We can then check what interfaces are
available for an object. Let\'s now see what public methods are
associated with this object:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
number_of_students.public_methods
```
:::

The output should be as follows:

<div>

::: {#_idContainer017 .IMG---Figure}
![Figure 1.7: Output for public methods ](3_files/C14197_01_07.jpg)
:::

</div>

Figure 1.7: Output for public methods

You can use all of the preceding public methods on this object to
execute various operations and manipulate the value set in the object.
If you look closely, some of the methods are self-explanatory, such as
`upcase`{.literal}, and `downcase`{.literal} (we will discuss individual
data types and their **class** later in this chapter).

[]{#_idTextAnchor023}

Running Ruby Code from Ruby Files {#_idParaDest-22}
---------------------------------

In the previous section, we used **IRB** to execute some code snippets
from the Terminal. But that\'s not usually the case when you write Ruby
code. Whether you use a framework or run a standalone Ruby code, you
would keep your code inside a Ruby file, which, in layman\'s terms, is a
file with the `.rb`{.literal} extension.

Let\'s try creating a `hello_world.rb`{.literal} file and place some
Ruby code in it. You can use your choice of IDE or simply use the
Terminal.

1.  Create a new file and add the following code to it:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts "***"
    puts  "*****"
    puts  "*******"
    puts  "Hello World"
    puts  "*******"
    puts  "*****"
    puts  "***"
    ```
    :::

2.  Save this file in the desired location with the `.rb`{.literal}
    extension. For example, save it as `hello_world.rb`{.literal}.

3.  To execute this code, fire up your Terminal.

4.  Run the following command from root where your Ruby file is saved:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    $ ruby hello_world.rb
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer018 .IMG---Figure}
![Figure 1.8: Output of the hello world program
](3_files/C14197_01_08.jpg)
:::

</div>

Figure 1.8: Output of the hello world program

So far, we have learned how to print any value from a variable. Now that
we know how to write and execute a code from a Ruby file, let\'s up the
ante a bit by getting user input.

[]{#_idTextAnchor024}

Exercise 1.04: Getting User Input in a Ruby Program {#_idParaDest-23}
---------------------------------------------------

In this exercise, we will get the user to input some numerical data and
perform a simple addition. To do so, follow these steps:

1.  Open your choice of IDE or the Terminal application.

2.  Create a new file.

3.  Add the following code to it. We use `puts`{.literal} to print a
    string. The `gets`{.literal} function is used to allow the input
    data to be stored in the `num`{.literal} variable:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts  "Please enter a number to added to 5"
    num = gets
    sum = 5 + num.to_i
    puts  "The result is"
    puts sum
    ```
    :::

    We have converted the `num`{.literal} variable explicitly to an
    integer using the built-in `to_i`{.literal} method.

4.  Save the file as `sum.rb`{.literal}.

5.  Open the Terminal and execute the following code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    $ ruby sum.rb
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer019 .IMG---Figure}
![Figure 1.9: Output for user input in Ruby ](3_files/C14197_01_09.jpg)
:::

</div>

Figure 1.9: Output for user input in Ruby

By using the `gets`{.literal} method, we were able to capture input from
the user. When you executed the Ruby file, the cursor stopped for the
input. The same input, as captured by the `gets `{.literal}method, was
used and added to `5`{.literal}.

Alternatively, there is a method called `gets.chomp`{.literal} that
removes the trailing line character from a string. Typically, the
`gets`{.literal} method will input the entire string, including the line
break character. `gets.chomp`{.literal} will remove line break
characters from strings.

::: {.cc-window .cc-banner .cc-type-info .cc-theme-classic .cc-bottom .cc-color-override-637850434 .cc-invisible role="dialog" aria-live="polite" aria-label="cookieconsent" aria-describedby="cookieconsent:desc" style="display: none;"}
[This website uses cookies and other tracking technology to analyse
traffic, personalise ads and learn how we can improve the experience for
our visitors and customers. We may also share information with trusted
third-party providers. For an optimal-browsing experience please click
\'Accept\'. [Learn
more](https://www.packtpub.com/about/cookie-policy){.cc-link}]{#cookieconsent:desc
.cc-message}

::: {.cc-compliance}
[Accept]{.cc-btn .cc-dismiss}
:::
:::

![](https://www.facebook.com/tr?id=445429252334850&ev=PageView&noscript=1){width="1"
height="1"}

::: {.container}
::: {.navbar-header}
[Toggle navigation]{.sr-only} MENU

[Toggle account]{.sr-only}

[Toggle search]{.sr-only}

Search

::: {.navbar-brand .ng-scope ng-if="!$ctrl.canGoBack()"}
![](4_files/e402412b40b3af8e306f122a9f53ea5d.png)
:::
:::

::: {#main-nav .main-nav .dropdown-closed ng-class="{
                'dropdown-closed': !$ctrl.isOpen.hamburger,
                'dropdown-open': $ctrl.isOpen.hamburger,
            }" ng-show="!$root.inCheckout"}
::: {.form-group .relative-parent}
Search
:::

[ Browse []{.caret} ]{.dropdown-toggle
ng-click="$ctrl.toggleMenu($event, 'browse', true)" role="button"
aria-haspopup="true" aria-expanded="false"}

Web Development

::: {.navbar__browse-submenu .open ng-class="{
                            'open': technologyName !== 'View All Technologies'
                                && $ctrl.submenus[technologyName].open
                            }"}
-   Books
-   [JavaScript](https://subscription.packtpub.com/search?query=JavaScript&products=Book&category=Web%20Development){.ng-binding}
-   [Angular](https://subscription.packtpub.com/search?query=Angular&products=Book&category=Web%20Development){.ng-binding}
-   [React](https://subscription.packtpub.com/search?query=React&products=Book&category=Web%20Development){.ng-binding}
-   [Node.js](https://subscription.packtpub.com/search?query=Node.js&products=Book&category=Web%20Development){.ng-binding}
-   [Django](https://subscription.packtpub.com/search?query=Django&products=Book){.ng-binding}
-   [View all
    Books \>](https://subscription.packtpub.com/search?products=Book&category=Web%20Development){.link
    .link-primary .ng-binding .ng-scope}

```{=html}
<!-- -->
```
-   Videos
-   [React](https://subscription.packtpub.com/search?query=React&products=Video&category=Web%20Development){.ng-binding}
-   [Angular](https://subscription.packtpub.com/search?query=Angular&products=Video&category=Web%20Development){.ng-binding}
-   [Vue](https://subscription.packtpub.com/search?query=Vue&products=Video&category=Web%20Development){.ng-binding}
-   [Flask](https://subscription.packtpub.com/search?query=Flask&products=Video&category=Web%20Development){.ng-binding}
-   [Node.js](https://subscription.packtpub.com/search?query=Node.js&products=Video&category=Web%20Development){.ng-binding}
-   [View all
    Videos \>](https://subscription.packtpub.com/search?products=Video&category=Web%20Development){.link
    .link-primary .ng-binding .ng-scope}

```{=html}
<!-- -->
```
-   Paths
Standard Data Types {#_idParaDest-24}
===================

::: {#_idContainer058 .Content}
The three major data types used in Ruby are as follows:

-   Number
-   String
-   Boolean

We shall look at each of these data types in detail in this section.

[]{#_idTextAnchor026}

Number {#_idParaDest-25}
------

Numbers in Ruby are objects that derive from the **Numeric** class.
Let\'s look at the class hierarchy for various number types:

<div>

::: {#_idContainer020 .IMG---Figure}
![Figure 1.10: Number class hierarchy ](4_files/C14197_01_10.jpg)
:::

</div>

Figure 1.10: Number class hierarchy

Of all of these, two of the most commonly used number types are
**integer** and **float**, and there are a number of methods associated
with both integer and floating-point numbers. Let\'s take a look at them
one by one.

In Ruby, integers are represented by two classes: **Fixnum** and
**Bignum**:

<div>

::: {#_idContainer021 .IMG---Figure}
![Figure 1.11: Integer types ](4_files/C14197_01_11.jpg)
:::

</div>

Figure 1.11: Integer types

Both of them are inherited by the **Integer** class. As the name
suggests, the **Bignum** class represents big numbers, and **Fixnum** is
used to represent small numbers. Ruby manages the conversion between the
two automatically. For example, if the result of an operation of two
**Fixnum** numbers is outside the **Fixnum** range, it\'s converted to
**Bignum**. From Ruby 2.4 onward, Ruby has unified these classes and
automatically uses the **Fixnum** class for small numbers and **Bignum**
for large numbers.

[]{#_idTextAnchor027}

Exercise 1.05: Performing Common Integer Operations {#_idParaDest-26}
---------------------------------------------------

In this exercise, we will perform common mathematical operations such as
addition (`+`{.literal}), subtraction (`-`{.literal}), multiplication
(`*`{.literal}), and division (`/`{.literal}) in Ruby:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Type the following code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    1 + 2
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer022 .IMG---Figure}
    ![Figure 1.12: Output for the addition operator
    ](4_files/C14197_01_12.jpg)
    :::

    Figure 1.12: Output for the addition operator

4.  Perform subtraction using the `-`{.literal} operator:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    3 - 1
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer023 .IMG---Figure}
    ![Figure 1.13: Output for the subtraction operator
    ](4_files/C14197_01_13.jpg)
    :::

    Figure 1.13: Output for the subtraction operator

5.  Perform multiplication using the `*`{.literal} operator:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    3 * 3
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer024 .IMG---Figure}
    ![Figure 1.14: Output for the multiplication operator
    ](4_files/C14197_01_14.jpg)
    :::

    Figure 1.14: Output for the multiplication operator

6.  Perform division using the `/`{.literal} operator:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    10 / 2
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer025 .IMG---Figure}
![Figure 1.15: Output for the division operator
](4_files/C14197_01_15.jpg)
:::

</div>

Figure 1.15: Output for the division operator

You may ask yourself how is the principle of BODMAS (Bracket, Open,
Division, Multiplication, Addition, and Subtraction) managed by Ruby
automatically. Ruby follows an order of precedence for operators, which
defines the order in which the operators will take priority in any
equation. We will learn about precedence in *Chapter 3, Program
Workflow.*

Note

You can also divide up long integers by separating them with an
underscore. For example, 121\_334 will be read in Ruby as 121334

[]{#_idTextAnchor028}

Exercise 1.06: Using Common Integer Methods to Perform Complex Arithmetic {#_idParaDest-27}
-------------------------------------------------------------------------

In this exercise, we will try some common integer methods to make
complex operations trivial. We will perform operations to calculate the
next and previous numbers and calculate the Least Common Multiple (LCM)
and Greatest Common Denominator (GCD) using built-in methods.

LCM is a method that finds the smallest multiple common to any two or
more numbers, whereas GCD finds the largest divisor common to two or
more numbers.

The following steps should help you with the solution:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Type the following code. `.next`{.literal} will provide the next
    number:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    2.next
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer026 .IMG---Figure}
    ![Figure 1.16: Output for the next number
    ](4_files/C14197_01_16.jpg)
    :::

    Figure 1.16: Output for the next number

4.  Next, we will calculate the previous number using `.pred`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    2.pred
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer027 .IMG---Figure}
    ![](4_files/C14197_01_17.jpg)
    :::

    Figure 1.17: Output for the previous number

5.  Then we calculate the LCM of 2 and 3 using `.lcm`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    2.lcm(3)
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer028 .IMG---Figure}
    ![](4_files/C14197_01_18.jpg)
    :::

    Figure 1.18: Output for the LCM of 2 and 3

6.  We also calculate the GCD of 2 and 3 using `.gcd`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    2.gcd(3)
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer029 .IMG---Figure}
![](4_files/C14197_01_19.jpg)
:::

</div>

Figure 1.19: Output for the GCD of 2 and 3

Most of these methods are self-explanatory, but let\'s go through each
of them:

-   `.next`{.literal} provides the next integer value.
-   `.pred`{.literal} provides the preceding integer value.
-   `.lcm`{.literal} gives us the least common multiple of the integer
    to which the method is applied and the value passed.
-   `.gcd`{.literal} provides the greatest common divisor of the integer
    to which the method is applied and the value passed.

There are a number of methods available for the integer class, which you
can play around with. Simply check them by using `.methods`{.literal} on
the integer.

Go to the Terminal. Type `irb`{.literal} to enter the IRB and type the
following code:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
2.methods
```
:::

The output should be as follows:

<div>

::: {#_idContainer030 .IMG---Figure}
![](4_files/C14197_01_20.jpg)
:::

</div>

Figure 1.20: Available methods in Ruby

Note

To know more about all the methods and operations they can perform,
refer to the official documentation at <https://packt.live/2nc962i>.

[]{#_idTextAnchor029}

Floating-Point Numbers {#_idParaDest-28}
----------------------

Next, let\'s look into floating-point numbers. Floats are essentially
imprecise decimal numbers in Ruby; we use the **Float** class with 15
digits of precision.

There are two ways to write floating-point numbers:

-   1.121 -- with a decimal point
-   1.0e3 -- adding an exponent provided there is one number before and
    after the decimal point

[]{#_idTextAnchor030}

Exercise 1.07: Performing Common Operations for Floating-Point Numbers {#_idParaDest-29}
----------------------------------------------------------------------

In this exercise, we will try some common floating-point methods to make
complex operations easy. We will also learn how to calculate the
previous and next decimal number, as well as how to round off a decimal
number completely or up to a certain decimal point:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Type the following code. Firstly, we have assigned our
    floating-point value to a `num`{.literal} variable and applied
    various methods to it:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    num = 2.339
    num.ceil
    num.floor
    ```
    :::

    `.ceil`{.literal} returns the closest next integer, and
    `.floor`{.literal} returns the closest previous integer.

4.  Then we have `.next_float`{.literal}. This returns the next
    floating-point value, which is an increment in the last digit of the
    number to 15 decimal places. Similarly, `.prev_float`{.literal}
    returns the previous floating point value to 15 decimal places:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    num.next_float
    num.prev_float
    ```
    :::

5.  Next, we have `.round`{.literal}, which removes the values after the
    decimal. If the value after the decimal point is less than 5, you
    get the previous integer, and if it is over 5, you get the next
    integer. When we pass a number to `.round(2)`{.literal}, we get a
    floating-point value to two decimal places:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    num.round
    num.round(2)
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer031 .IMG---Figure}
![Figure 1.21: Output for floating-point number operations
](4_files/C14197_01_21.jpg)
:::

</div>

Figure 1.21: Output for floating-point number operations

There are a number of methods available for the `Float`{.literal} class,
which you can play around with. Simply check them against
`.methods`{.literal} on any integer:

1.  Go to the Terminal.
2.  Type `irb`{.literal} to enter the IRB.
3.  Type the following Ruby code:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    2.15.methods
    ```
    :::

The output should be as follows:

<div>

::: {#_idContainer032 .IMG---Figure}
![Figure 1.22: Methods for the Float class ](4_files/C14197_01_22.jpg)
:::

</div>

Figure 1.22: Methods for the Float class

Note

To find out more about all the methods and the operations they can
perform, refer to the official documentation at
<https://packt.live/2o7rYzS>.

[]{#_idTextAnchor031}

String {#_idParaDest-30}
------

Strings in Ruby are derived from the **String** class, and there are
over 100 methods to manipulate and operate on strings. This is perhaps
because, in programming, a lot revolves around strings, and Ruby reduces
the headache by managing a lot out of the box.

By default, Ruby comes with UTF-8 encoding, but this can be changed by
placing a special comment at the top of a file:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
# encoding: us-ascii
puts "Hello".encoding
output:
ruby strings.rb
#<Encoding:US-ASCII>
```
:::

Note

If you remove the comment, by default, it will be UTF-8.

There are various ways to write strings in Ruby. These are some of the
most common ones:

-   We can simply place anything between single quotes (`''`{.literal})
    and it becomes a string:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    'Ruby Fundamentals'
     => "Ruby Fundamentals"
    ```
    :::

-   In order to keep the single quote with the letters, we can escape it
    using the backslash character (`\`{.literal}):
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    '\'Ruby Fundamentals\''
     => "'Ruby Fundamentals'"
    ```
    :::

-   We can also use `%q`{.literal}, as shown in the following examples,
    and place the required string in a delimiter, which can be a
    bracket, curly brackets, or something else:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    %q('Ruby' Fundamentals)
     => "'Ruby' Fundamentals"
    %q['Ruby' Fundamentals]
     => "'Ruby' Fundamentals"
    %q{'Ruby' Fundamentals}
     => "'Ruby' Fundamentals"
    %q<'Ruby' Fundamentals>
     => "'Ruby' Fundamentals"
    ```
    :::

-   We can also use double quotes (`""`{.literal}), which is the
    cleanest way to define a string.

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    "'Ruby' Fundamentals"
     => "'Ruby' Fundamentals"
    ```
    :::

    The output of all the preceding code should be as follows:

<div>

::: {#_idContainer033 .IMG---Figure}
![Figure 1.23: Ways to write strings in Ruby ](4_files/C14197_01_23.jpg)
:::

</div>

Figure 1.23: Ways to write strings in Ruby

[]{#_idTextAnchor032}

Exercise 1.08: Using Common String Methods {#_idParaDest-31}
------------------------------------------

In this exercise, we will perform a number of common operations on a
string. We will first assign a string to a variable, then find its size
and length, and then change the case of the String value. We will then
capitalize the string. All this will be done using the **String**
class\' built-in methods. Lastly, we will discuss the bang
(`!`{.literal}) operator and see how adding it impacts the results:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Enter the following code to define the string:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = "ruby fundamentals"
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer034 .IMG---Figure}
    ![Figure 1.24: Output for string definition
    ](4_files/C14197_01_24.jpg)
    :::

    Figure 1.24: Output for string definition

    Here, we are using the `ruby fundamentals`{.literal} value for the
    title variable on which all the following operations will be
    executed.

4.  Next, we check the number of characters in this string, including
    white spaces, using `.size`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.size
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer035 .IMG---Figure}
    ![Figure 1.25: Character count of a string
    ](4_files/C14197_01_25.jpg)
    :::

    Figure 1.25: Character count of a string

5.  Then, we also check the number of characters in this string,
    including white spaces, using `.length`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.length
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer036 .IMG---Figure}
    ![Figure 1.26: String length calculation ](4_files/C14197_01_26.jpg)
    :::

    Figure 1.26: String length calculation

    `.length`{.literal} is the same as size, but it is more meaningful
    in certain situations. Mostly, it is a matter of preference. Some
    developers prefer using `.size`{.literal} for large collections of
    data, such as arrays, and hashes, and `.length`{.literal} for
    smaller collections of data, such as strings.

6.  Next, we change the case of the string characters to uppercase using
    `.upcase`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.upcase
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer037 .IMG---Figure}
    ![Figure 1.27: Uppercase string characters
    ](4_files/C14197_01_27.jpg)
    :::

    Figure 1.27: Uppercase string characters

7.  Similarly, we can change the casing to lowercase using
    `.downcase`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.downcase
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer038 .IMG---Figure}
    ![Figure 1.28: Lowercase string characters
    ](4_files/C14197_01_28.jpg)
    :::

    Figure 1.28: Lowercase string characters

8.  We can also capitalize the first character of the string using
    `.capitalize`{.literal}:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.capitalize
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer039 .IMG---Figure}
    ![Figure 1.29: Capitalized string characters
    ](4_files/C14197_01_29.jpg)
    :::

    Figure 1.29: Capitalized string characters

    Note that even after the operations are applied on the string, the
    original string object remains the same:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer040 .IMG---Figure}
    ![Figure 1.30: Original string object ](4_files/C14197_01_30.jpg)
    :::

    Figure 1.30: Original string object

9.  Let\'s now try the **bang** method. **Bang** methods end with an
    exclamation mark (`!`{.literal}), and we can use them to modify the
    original object with the result of the operation. Since the **bang**
    method can permanently modify the receiver (the original value), it
    should be used carefully:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title.capitalize!
    title
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer041 .IMG---Figure}
![Figure 1.31: Bang operation on a string ](4_files/C14197_01_31.jpg)
:::

</div>

Figure 1.31: Bang operation on a string

There are other operations as well that we can perform on strings, a
common one being concatenation.

[]{#_idTextAnchor033}

Exercise 1.09: Performing String Concatenation {#_idParaDest-32}
----------------------------------------------

In this exercise, we will be concatenating two string values that are
assigned to different variables. We will solve the same problem in three
ways:

-   Using the `+`{.literal} operator
-   Using the `.concat`{.literal} method
-   Using the `<<`{.literal} operator

The following steps will help you to perform the exercise:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Enter the following code. We first define the strings as
    `var1`{.literal} and `var2`{.literal}:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    var1 = "Ruby"
    var2 = "Fundamentals"
    ```
    :::

4.  Next, we concatenate the two strings using whitespace:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = var1 + ' ' + var2
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer042 .IMG---Figure}
    ![Figure 1.32: Output using whitespace ](4_files/C14197_01_32.jpg)
    :::

    Figure 1.32: Output using whitespace

    To add a space between `var1`{.literal} and `var2`{.literal} in the
    final result, you can do this by chain two `+`{.literal} operators
    with a whitespace in-between.

5.  We can also do the same with the `.concat`{.literal} method and
    modify the Ruby code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = var1.concat(var2)
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer043 .IMG---Figure}
    ![Figure 1.33: Output using the .concat method
    ](4_files/C14197_01_33.jpg)
    :::

    Figure 1.33: Output using the .concat method

6.  We can also concatenate the strings using the `<<`{.literal}
    operator:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = ""
    var1 = "Ruby"
    title << var1
    title << " "
    var2 = "Fundamentals"
    title << var2
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer044 .IMG---Figure}
![Figure 1.34: Concatenation using the \<\< operator
](4_files/C14197_01_34.jpg)
:::

</div>

Figure 1.34: Concatenation using the \<\< operator

Another way of accomplishing string manipulation is by using a technique
called string interpolation. This works much more elegantly than the
previous methods and allows you to combine the elements of different
types together in a string. With string interpolation, we can combine
strings and embed Ruby expressions in a string.

[]{#_idTextAnchor034}

Exercise 1.10: Performing String Interpolation {#_idParaDest-33}
----------------------------------------------

In this exercise, we will use the title variable that contains a value
for Ruby Fundamentals and interpolate it in a sentence:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Define the string:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = "Ruby Fundamentals"
    puts "My Favorite Ruby book is #{title}"
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer045 .IMG---Figure}
    ![Figure 1.35: String interpolation ](4_files/C14197_01_35.jpg)
    :::

    Figure 1.35: String interpolation

4.  We can also perform operations with string interpolation, for
    example, addition within a string:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts "My Favorite Ruby book is #{title} and I am using it for last #{10+30} days"
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer046 .IMG---Figure}
![Figure 1.36: Addition operation in string interpolation
](4_files/C14197_01_36.jpg)
:::

</div>

Figure 1.36: Addition operation in string interpolation

This is how we carry out addition operations with string interpolation.

[]{#_idTextAnchor035}

Exercise 1.11: Extracting and Searching a Substring from a String {#_idParaDest-34}
-----------------------------------------------------------------

To extract certain characters from a string, follow these steps:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Define the string and then extract the characters, starting from the
    eighth position in an index to the second position from it:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    quote = "Just Do IT"
    quote[8,2]
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer047 .IMG---Figure}
    ![Figure 1.37: Extracting characters from a string
    ](4_files/C14197_01_37.jpg)
    :::

    Figure 1.37: Extracting characters from a string

    Thus, we have extracted characters, starting from the eighth
    position in an index to the second position from it, and hence get
    the characters `IT`{.literal}.

4.  Now, we will use string methods that can check whether a certain
    character, or group of characters, exists in a string object:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    quote = "Just Do IT"
    quote.include?("Just")
    quote.include?("just")
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer048 .IMG---Figure}
![](4_files/C14197_01_38.jpg)
:::

</div>

Figure 1.38: Searching a substring from a string

Here, the characters must be together and in exactly the same order.

[]{#_idTextAnchor036}

Exercise 1.12: Replacing Part of a String with Another String {#_idParaDest-35}
-------------------------------------------------------------

In this exercise, we will replace the word `Java`{.literal} in the
sentence \"My favorite book is Java Fundamentals\" with the word
`Ruby`{.literal}. To do so, follow these steps:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Store the sentence `My favorite book is Java Fundamentals`{.literal}
    in `title`{.literal}:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = "My favorite book is Java Fundamentals"
    ```
    :::

4.  Type the following code, which replaces the word `Java`{.literal}
    with `Ruby`{.literal} in `title`{.literal}:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title["Java"] = "Ruby"
    ```
    :::

5.  Print `title`{.literal} to confirm the change:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer049 .IMG---Figure}
![Figure 1.39: Replacing string characters ](4_files/C14197_01_39.jpg)
:::

</div>

Figure 1.39: Replacing string characters

We have now easily updated the specific value of the string object in
the `title`{.literal} variable.

If the original title was
`My favorite Java book is Java Fundamentals`{.literal}, we have Java
repeated twice. In this case, only the first instance of Java would be
replaced. The output would be
`My Favorite Ruby book is Java Fundamentals`{.literal}. This is where
the `gsub`{.literal} method comes into play. It is used to globally
substitute a character, or set of characters, with another.

[]{#_idTextAnchor037}

Exercise 1.13: Replacing All the Values inside a String Using gsub {#_idParaDest-36}
------------------------------------------------------------------

In this exercise, we will use the `gsub`{.literal} method to replace all
the instances of Java with Ruby in a sentence:

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Define the string value and apply the `gsub`{.literal} method as
    follows:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = "My Favorite Java book is Java Fundamentals"
    title.gsub("Java", "Ruby")
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer050 .IMG---Figure}
![Figure 1.40: Using the gsub method to replace characters in a string
](4_files/C14197_01_40.jpg)
:::

</div>

Figure 1.40: Using the gsub method to replace characters in a string

This way, we can easily replace the same values across the object using
`gsub`{.literal}. This is very handy when we have to replace one
character that is repeated and acts as noise in data with something
meaningful.

[]{#_idTextAnchor038}

Exercise 1.14: Splitting a String and Joining a String {#_idParaDest-37}
------------------------------------------------------

In Ruby, we can split a string, which gives the result in an array (we
will learn about arrays in the next chapter). In this exercise, we are
going to split a string of words into an array of words.

1.  Go to the Terminal.

2.  Type `irb`{.literal} to enter the IRB.

3.  Define the string and use the `.split`{.literal} method to divide
    the string into an array of words:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    title = "My Favorite book is Ruby Fundamentals"
    title.split
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer051 .IMG---Figure}
    ![Figure 1.41: Splitting a string ](4_files/C14197_01_41.jpg)
    :::

    Figure 1.41: Splitting a string

4.  Use the `split`{.literal} method to separate values in a string:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    months = "Jan; Feb; Mar"
    months.split(';')
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer052 .IMG---Figure}
    ![Figure 1.42: Splitting a string using a unique character
    ](4_files/C14197_01_42.jpg)
    :::

    Figure 1.42: Splitting a string using a unique character

5.  Join the array values in a string:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    data = ["My", "Favorite", "book", "is", "Ruby", "Fundamentals"]
    data.join
    ```
    :::

    The output should be as follows:

<div>

::: {#_idContainer053 .IMG---Figure}
![Figure 1.43: Joining arrays to form a string
](4_files/C14197_01_43.jpg)
:::

</div>

Figure 1.43: Joining arrays to form a string

Thus, we have successfully used `data.join`{.literal} to bring together
values in a string.

The `string`{.literal} class has several methods. You can use the
following code to check the methods available in the string class:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
"abc".methods
```
:::

It lists all the methods tha[]{#_idTextAnchor039}t are present in the
string class:

<div>

::: {#_idContainer054 .IMG---Figure}
![Figure 1.44: String methods ](4_files/C14197_01_44.jpg)
:::

</div>

Figure 1.44: String methods

Note

To find out more about all the methods and the operations they can
perform, refer to the official documentation at
<https://packt.live/2pDVtK5>.

[]{#_idTextAnchor040}

Activity 1.01: Generating Email Addresses Using Ruby {#_idParaDest-38}
----------------------------------------------------

Imagine you have to write a Ruby program for a company (with the
**rubyprograms.com** domain), which will generate a roster of email IDs
of the company\'s employees. For this, we just need to accept user input
in the form of the first name and last name of each employee and place
them in an email format, which means adding an `@`{.literal} symbol
between the two.

Observe the following steps to complete the activity:

1.  Create variables to accept the first names and last names of the
    individuals.

2.  Use `gets.chomp`{.literal} to accept string input from users.

3.  Combine the first name and last name with the domain name and print
    the result.

    The expected output is as follows:

<div>

::: {#_idContainer055 .IMG---Figure}
![Figure 1.45: Output for email address generation
](4_files/C14197_01_45.jpg)
:::

</div>

Figure 1.45: Output for email address generation

Note

The solution to the activity can be found on page 458.

[]{#_idTextAnchor041}

Boolean {#_idParaDest-39}
-------

Unlike other languages, Ruby does not have a Boolean type, but it has
true and false Boolean values, which are essentially instances of the
**TrueClass** and the **FalseClass**, respectively. These are singleton
instances, which means that you can\'t create other instances of these
classes.

Let\'s test this with an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
a = nil
 => nil
a.nil?
 => true
```
:::

The output should be as follows:

<div>

::: {#_idContainer056 .IMG---Figure}
![Figure 1.46: True and false classes ](4_files/C14197_01_46.jpg)
:::

</div>

Figure 1.46: True and false classes

You get Boolean values when you check whether the `a`{.literal} variable
is `nil`{.literal}.

We will learn more about the Boolean data type in *Chapter* *3*,
*Controlling* *Program* *Flow.*

[]{#_idTextAnchor042}

Activity 1.02: Calculating the Area and Perimeter of a Candy Manufacturing Plant {#_idParaDest-40}
--------------------------------------------------------------------------------

In this activity, we will be using radius as the input to calculate the
area and perimeter of a candy manufacturing plant.

Follow these steps to complete the activity:

1.  Go to the Terminal and use `irb`{.literal} to enter the IRB.

2.  Define the variables for `radius`{.literal}, `perimeter`{.literal},
    and `area`{.literal}.

3.  Calculate the value received from user input stored in the radius
    variable and print the results for `area`{.literal} and
    `perimeter`{.literal}.

    The expected output is as follows:

<div>

::: {#_idContainer057 .IMG---Figure}
![Figure 1.47: Output for area and perimeter ](4_files/C14197_01_47.jpg)
:::

</div>

Figure 1.47: Output for area and perimeter

Note

The solution to the activity can be found on page 459.


Summary {#_idParaDest-41}
=======

::: {#_idContainer058 .Content}
In this chapter, we learned about the fundamentals of Ruby and its key
features. We started with the history of Ruby and the key programming
paradigms the language supports that make it unique and powerful at the
same time. We then learned about using Ruby code with the IRB and also
learned how to write code in Ruby files and execute it. Next, we delved
into the standard data types in Ruby, which are number, Boolean, and
string. Here, we implemented various operations on variables along with
commonly used string operations, such as string concatenation and
interpolation.

In the next chapter, we will learn how to work with data structures such
as arrays and hashes. We will explore the details of the various
powerful methods associated with them, and we will also learn how to
create our own Ruby methods and call them, which is the bedrock of
day-to-day programming with Ruby.
