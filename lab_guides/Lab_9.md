
9. Ruby Beyond the Basics l {#_idParaDest-268}
===========================

::: {#_idContainer347 .Content}
:::

::: {#_idContainer368 .Content}
Overview

By the end of this chapter, you will be able to use blocks to improve
code reusability; implement yield with blocks to maintain control over
program flows; implement procs and lambdas with blocks and compare procs
and lambdas.

This chapter aims to give you a general overview of metaprogramming.


Introduction {#_idParaDest-269}
============

::: {#_idContainer368 .Content}
In the previous chapters, we learned how to debug Ruby programs using
the `logger`{.literal} class. In this chapter, we will learn about some
of the advanced topics of the Ruby programming language, such as
`blocks`{.literal}, `procs`{.literal}, and `lambdas`{.literal}. By now,
you must have realized that it\'s really easy to start writing Ruby
code, create sample apps, and get instant gratification; however, every
new Ruby developer (and sometimes the experienced ones too) will have a
question buzzing in their mind about how it actually works.

We can safely call it the Ruby magic, and that\'s what we are planning
to crack in this chapter. We are going to learn about advanced
programming techniques that are present in other languages, but this
time the Ruby-specific implementation is our focus. We will tear down
the curtain from the syntactic sugar and take a look under the hood to
reveal what metaprogramming is. Additionally, we will lay a strong
foundation that will allow you to reuse these techniques and enable you
to utilize the libraries provided by Ruby. Later, when we learn about
Ruby on Rails in the upcoming chapters, it will be easier to comprehend
various features and how they operate behind the scenes.


Metaprogramming {#_idParaDest-270}
===============

::: {#_idContainer368 .Content}
You might be wondering what **metaprogramming** actually is. Well, it is
utilized by most programming languages. Technically, it\'s a piece of
code that writes code by itself dynamically. With metaprogramming, you
can create methods and classes at runtime. It allows you to reopen or
even modify classes, as well as add methods to classes on the fly. It
helps to maintain the **Don\'t Repeat Yourself** (**DRY**) principle in
programming; however, it is a hard concept to grasp and get right.

Let\'s imagine the scenario of a chef in a restaurant. This chef needs
to know many recipes and be able to put together food for their
customers. Each food item requires different steps for preparation.
There are some steps that need to be done before, during, and after the
food is prepared. In order to create a simulation for these steps to be
performed by an automated system, you might consider using the
metaprogramming feature provided by the Ruby language.

Metaprogramming makes use of multiple elements available within the Ruby
language. Let\'s take a look at the first building block, which is
called `blocks`{.literal} in Ruby.

[]{#_idTextAnchor278}

Blocks {#_idParaDest-271}
------

Blocks are like anonymous functions -- `lambdas`{.literal} -- that can
be passed into a method. You may also refer to the use of a block as
passing a method into a method. The slight difference in blocks and
methods is that they do not belong to an object. In other languages,
such as C\#, Java, or Python, this concept is called
`closures`{.literal}. Blocks are just the Ruby way of implementing
closures. Blocks are typically used when we would like to encapsulate
functionality that is made up of a sequence of statements. For example,
we could encapsulate an \"Introduction Letter\" email when new people
arrive at a company, where we just have to pass a template to a block
and it automatically generates and sends the email. The only variable
here is the detailed information of the new colleague in the template.

[]{#_idTextAnchor279}

Syntax for Blocks {#_idParaDest-272}
-----------------

There are two ways to write blocks: they can be either enclosed in
`do`{.literal}/`end`{.literal} or within curly brackets
(`{}`{.literal}). Let\'s examine a simple example showing how to write
them.

[]{#_idTextAnchor280}

### With do/end {#_idParaDest-273}

Consider the following example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
(1..5).each do
  puts "I am inside the block"
end
```
:::

The output would be as follows:

<div>

::: {#_idContainer348 .IMG---Figure}
![Figure 9.1: Output using do/end ](3_files/C14197_09_01.jpg)
:::

</div>

Figure 9.1: Output using do/end

[]{#_idTextAnchor281}

### With curly brackets ({}) {#_idParaDest-274}

Consider the following example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
5.times {puts "I am inside the block"}
```
:::

The output would be as follows:

<div>

::: {#_idContainer349 .IMG---Figure}
![Figure 9.2: Output using curly brackets ](3_files/C14197_09_02.jpg)
:::

</div>

Figure 9.2: Output using curly brackets

Besides this, we can also use the `yield`{.literal} keyword to write
blocks, which we will discuss shortly.

In Ruby, many built-in `class`{.literal} methods allow you to pass
blocks. This helps in enhancing the feature set provided by the built-in
methods.

The preceding examples are pretty basic for understanding block syntax.
Let\'s try and understand this with another example of using a block as
an iterator variable in order to print something:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def star_tree number 
  1.upto(number).each do |i|
    puts "*" * i 
  end
end
star_tree 30
```
:::

Fire up your Terminal and run this Ruby file:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
$ ruby block-iterator.rb
```
:::

The output would be as follows:

<div>

::: {#_idContainer350 .IMG---Figure}
![Figure 9.3: Using a block as an iterator ](3_files/C14197_09_03.jpg)
:::

</div>

Figure 9.3: Using a block as an iterator

Let\'s understand what we have done here. We are calling a
`star_tree`{.literal} method and passing a value of `30`{.literal} to
it, which is then used by the block as an iterator variable number,
which helps to create a behavior inside each method. This was a very
simple implementation of blocks that is used quite often in real-world
programming. Let\'s learn about `yield`{.literal} and how to use it with
blocks to make really powerful programs.

Blocks can be passed to methods just like any other parameter. We have
been using blocks all along without realizing it. Take a look at the
preceding code with `.each`{.literal}. What is running inside a
`.each`{.literal} method is a block, and we define what needs to be
implemented in that `.each`{.literal} method.

The ability of blocks to be passed as parameters makes them a great
candidate for applying abstraction, which is a very important concept of
object-oriented programming (OOP).

[]{#_idTextAnchor282}

yield with Blocks {#_idParaDest-275}
-----------------

The `yield`{.literal} construct in Ruby is essentially a way to call a
block. Wherever you use this keyword, the block code will be executed
there. If there is code before the `yield`{.literal} construct, it will
be executed first and then the rest of the code is executed. Other
programming languages, such as Python and JavaScript, also utilize the
`yield`{.literal} construct. You can `yield`{.literal} an empty block;
however, nothing will happen as there is nothing to execute.

Let\'s understand this with an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def my_method(&block)
  puts "Part one of my_method code"
  yield
  puts "Part two of my_method code"
end
my_method {puts "Yield code from the Block"}
```
:::

The `&block`{.literal} argument expects a block that will be executed
when the control reaches the `yield`{.literal} line.

The output would be like the following:

<div>

::: {#_idContainer351 .IMG---Figure}
![Figure 9.4: Output for yield with blocks ](3_files/C14197_09_04.jpg)
:::

</div>

Figure 9.4: Output for yield with blocks

Let\'s understand this program. We pass a block of code to the
`my_method`{.literal} function which executes the block when the control
reaches the `yield`{.literal} statement. Now, imagine the possibility of
using the `yield`{.literal} keyword to pass a block of code with some
operations. With `yield`{.literal}, you can do all the behind-the-scenes
magic we generally associate Ruby methods with.

If we try printing `yield`{.literal} twice, or maybe after the second
`puts`{.literal} statement in `my_method`{.literal}, the
`yield`{.literal} construct will call each line of the block that you
pass to the program. If you pass two statements, each statement will be
executed as many times as there are `yield`{.literal} statements in the
code.

Consider the following example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def my_method(&block)
  puts " Before first yield"
  yield
  puts " After first yield"
  yield
end
my_method {puts "What happens with two yields?"}
```
:::

The output of the first `yield`{.literal} call with one statement will
be as follows:

<div>

::: {#_idContainer352 .IMG---Figure}
![Figure 9.5: Output for yield with one statement
](3_files/C14197_09_05.jpg)
:::

</div>

Figure 9.5: Output for yield with one statement

Now let\'s take a look at the output for multiple statements:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
my_method do
puts "First statement"
puts "Second statement"
end
```
:::

The output should be as follows:

<div>

::: {#_idContainer353 .IMG---Figure}
![Figure 9.6: Output for yield with multiple statements
](3_files/C14197_09_06.jpg)
:::

</div>

Figure 9.6: Output for yield with multiple statements

[]{#_idTextAnchor283}

Exercise 9.01: Building a Simple Calculator {#_idParaDest-276}
-------------------------------------------

In this exercise, we will be creating a simple calculator that performs
basic arithmetic operations such as addition, subtraction,
multiplication, and division. We will be using Ruby blocks and
`yield`{.literal} to create reusable code. The following steps will help
you complete the exercise:

1.  Create a Ruby `block-yield.rb`{.literal} file.

2.  Define our `calculator`{.literal} block. We use the
    `yield`{.literal} keyword, which will use the block of code passed
    along with the `a`{.literal} and `b`{.literal} variables, which are
    used in the arithmetic operations:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    def calculator(a, b)
      yield(a, b)
    end
    ```
    :::

3.  Next, we add the calls for addition, subtraction, multiplication,
    and division:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    #Addition
    puts calculator(8, 2) { |a, b| a + b }
    #Multiplication 
    puts calculator(8, 2) { |a, b| a * b } 
    #Subtraction
    puts calculator(8, 2) { |a, b| a - b }
    #Division
    puts calculator(8, 2) { |a, b| a / b }
    ```
    :::

    Save the file.

4.  Open up the Terminal and execute the following code:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    ruby block-yield.rb
    ```
    :::

    The output should be as follows:

    ::: {#_idContainer354 .IMG---Figure}
    ![Figure 9.7: Output for the arithmetic operation using yield with a
    block ](3_files/C14197_09_07.jpg)
    :::

Figure 9.7: Output for the arithmetic operation using yield with a block

The beauty of this program is that we can add n number of operations
using the combination of a block and `yield`{.literal} in our code.

[]{#_idTextAnchor284}

block\_given? with Blocks {#_idParaDest-277}
-------------------------

The `block_given?`{.literal} method is something we use in tandem with
blocks and the `yield`{.literal} keyword. As the name suggests, it
checks whether or not a block for triggering a method or operation has
been provided. Let\'s take a look at its syntax:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def my_method(&block)
  puts "Part one of my_method code"
  yield if block_given?
  puts "Part two of my_method code"
end
my_method {puts "Yield code from the Block if block is given"}
my_method {puts "Yield code from the &block if it was passed as argument"}
```
:::

If you execute this code from the Terminal, you will get the following
output:

<div>

::: {#_idContainer355 .IMG---Figure}
![Figure 9.8: Output for the block\_given? method
](3_files/C14197_09_08.jpg)
:::

</div>

Figure 9.8: Output for the block\_given? method

If we don\'t pass anything to the `&block`{.literal} method, we get the
following output:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
my_method
```
:::

The output would be as follows:

<div>

::: {#_idContainer356 .IMG---Figure}
![Figure 9.9: Output with an empty block ](3_files/C14197_09_09.jpg)
:::

</div>

Figure 9.9: Output with an empty block

In this example, we have passed a block of code to
`my_method`{.literal}, which is a print statement, and have also
attached `block_given?`{.literal} to the `yield`{.literal} keyword. Note
that if you remove the block of code and call the method, it will still
work and print only two other statements from the method, as seen in the
previous example.

If we remove the block of code and also `block_given?`{.literal} from
`my_method`{.literal}, it will throw us an error as shown in the
following figure. This is due to the fact that `&block`{.literal} is
still expecting a block as an argument:

<div>

::: {#_idContainer357 .IMG---Figure}
![Figure 9.10: Output for my\_method without the block\_given? method
and an empty block ](3_files/C14197_09_10.jpg)
:::

</div>

Figure 9.10: Output for my\_method without the block\_given? method and
an empty block

[]{#_idTextAnchor285}

Exercise 9.02: Building a Flight Status Display System {#_idParaDest-278}
------------------------------------------------------

In this exercise, we will create a method that accepts blocks. If a
block is passed, it should call the `logger`{.literal} function, which
is defined in another method. If no block is passed, it will simply
print the statements. We call the method twice: once with a block, and
then once without a block. This will visualize the updates in the flight
status.

The following steps will help you complete the exercise:

1.  Create a `basic-logger.rb`{.literal} file.

2.  First, we define the `basic_logger`{.literal} method, where we are
    printing display messages that are to be displayed after gaps of 3
    seconds:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    def basic_logger
      sleep 3
      puts "****"
      puts "Changing flight status…"
      sleep 3
      puts "Flight status was changed!"
      sleep 3
      puts "****"
    end
    ```
    :::

3.  Next, we need to handle a situation in which the program will not
    fail if no block of code is passed, using the
    `block_given?`{.literal} method. We create a method that accepts a
    block and, inside the block, we have two print statements from the
    method itself and one `yield`{.literal} statement, which calls
    another method. There is a `block_given?`{.literal} method such that
    the `basic_logger`{.literal} method will only be called if a block
    is passed; otherwise, the code in this method will continue:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    def my_method(&block)
      puts "Flight Status changer starting"
      yield basic_logger if block_given? 
      puts "Flight Status changer ended"
      puts "****"
    end
    ```
    :::

4.  Finally, let\'s take a look at how these methods are called:

    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    my_method
    my_method {puts " Changed Flight status to Departure "}
    ```
    :::

    Here, we have called our `my_method`{.literal} method, once without
    a block of code and once with it. In both cases, we get the
    appropriate result.

    The output, when we call the method without any argument, would be
    as follows:

    ::: {#_idContainer358 .IMG---Figure}
    ![Figure 9.11: Output for my\_method with an empty block
    ](3_files/C14197_09_11.jpg)
    :::

Figure 9.11: Output for my\_method with an empty block

The output, when we call the method with an argument, would be as
follows:

<div>

::: {#_idContainer359 .IMG---Figure}
![Figure 9.12: Output for my\_method with an argument
](3_files/C14197_09_12.jpg)
:::

</div>

Figure 9.12: Output for my\_method with an argument

If we remove `block_given?`{.literal} from `my_method`{.literal}, the
`basic_logger`{.literal} method will be called to check whether we
passed a block or not.

[]{#_idTextAnchor286}

The proc Object {#_idParaDest-279}
---------------

The `proc`{.literal} object is an object of the Ruby class and is used
to store a process that can be used later on. `proc`{.literal} objects
are blocks of code that can be set to local variables. Once set, this
code can be called in different contexts and can access those variables.

Let\'s take a simple example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
t = Proc.new { |x,y| puts "A very simple proc example" }
t.call
```
:::

The output would be as follows:

<div>

::: {#_idContainer360 .IMG---Figure}
![Figure 9.13: Output for proc ](3_files/C14197_09_13.jpg)
:::

</div>

Figure 9.13: Output for proc

Another key feature of `proc`{.literal} is that it can accept arguments.
Ruby supports the functional programming paradigm and the
`proc`{.literal} object is one example of this. There are two distinct
features that separate blocks from `proc`{.literal} objects. Firstly,
and most importantly, `proc`{.literal} objects are objects, while blocks
are not. Secondly, you can have only one block passed as an argument to
functions, but `proc`{.literal} objects do not have such restrictions.

In other languages, such as Python and JavaScript, `proc`{.literal}
objects are referred to as closures; many languages have their own
paradigm for the function of `proc`{.literal} objects in Ruby. Let\'s
take a look at the syntax of `proc`{.literal}:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def proc_method
    Proc.new
end
simple_proc = proc_method { "Hello World" }
simple_proc.call 
```
:::

Here, we first initiate a `proc`{.literal} object with
`Proc.new`{.literal} inside our `proc`{.literal} method. This is then
called by using `.call`{.literal} and passing a block of code to it:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
p = Proc.new { puts "Hello World" }
p.call
```
:::

The output would be as follows:

<div>

::: {#_idContainer361 .IMG---Figure}
![Figure 9.14: Output for Proc.new ](3_files/C14197_09_14.jpg)
:::

</div>

Figure 9.14: Output for Proc.new

Until the `.call`{.literal} method is invoked, the `proc`{.literal}
object lies dormant; nothing happens.

Note

Remember that you must always pass a block of code to `procs`{.literal},
as only then will a `proc`{.literal} object be instantiated.

In the following exercise, we will discover how to implement
`proc`{.literal} objects in a program.

[]{#_idTextAnchor287}

Exercise 9.03: Performing the sum Function on a Range of Numbers {#_idParaDest-280}
----------------------------------------------------------------

In this exercise, we will be writing a program to find the sum of a
range of numbers. For example, if the start and end of the range are 1
and 6, then the final sum total will be 21.

The following steps will help you with the solution:

1.  Create a `proc-sum-range.rb`{.literal} file.
2.  We define a `sum_of_range`{.literal} variable, which is assigned a
    value from the output of the block, which is passed to the
    `Proc.new`{.literal} construct. Here, the arguments received are
    used to operate on the numbers, to get the sum of all the numbers
    between the start and end of a range:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    sum_of_range = Proc.new do |first, last| 
        result = 0
        (first..last).each do |i|
            result += i
        end
        result
    end
    ```
    :::
3.  Next, the variable that is assigned to the `proc`{.literal} object
    is called using `.call`{.literal} and the arguments are passed to
    `proc`{.literal}:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts sum_of_range.call(1,6)
    ```
    :::
4.  Open the Terminal and traverse to this file. Run the following
    command to see the output:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    ruby proc-sum-range.rb
    ```
    :::

<div>

::: {#_idContainer362 .IMG---Figure}
![Figure 9.15: Output for the sum function using proc
](3_files/C14197_09_15.jpg)
:::

</div>

Figure 9.15: Output for the sum function using proc

If you have ever wondered how the `inject`{.literal} method works, then
this is a very simple implementation of the same thing, and we achieved
it with a few lines of code.

The difference between methods and `proc`{.literal}, even if they look
quite similar, is that while both methods and `proc`{.literal} are
blocks of code, methods are bound to objects while `proc`{.literal} is
bound to the variable it is assigned to. Methods represent the
object-oriented part of Ruby, while `proc`{.literal} represents the
functional programming side of Ruby.

[]{#_idTextAnchor288}

Exercise 9.04: Calculating Profit Using proc on an Input Price List {#_idParaDest-281}
-------------------------------------------------------------------

In this exercise, we will create a `proc`{.literal} object that takes as
input a list of prices and returns the new list with a 25% profit.

The following steps will help you to complete the exercise:

1.  Open up the `Stocker.rb`{.literal} file.

2.  Create the original price list:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    original_price = [100,200,300,400,999]
    puts "The original price for the stocks: #{original_price}"
    ```
    :::

3.  Define the dormant `proc`{.literal} object:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    price_profit = Proc.new do |price_list| 
        result = Array.new
        price_list.each do |i|        
            result << i * 1.25
        end
        result
    end
    ```
    :::

4.  Create the new list by calling the `proc`{.literal} object and
    output the list:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    new_price_with_profit = price_profit.call(original_price)
    puts "The new price for the stocks #{new_price_with_profit}"
    ```
    :::

5.  Invoke the script with `ruby Stocker.rb`{.literal} and inspect the
    result.

    The output should be as follows:

    ::: {#_idContainer363 .IMG---Figure}
    ![Figure 9.16: Output with profit-inclusive prices
    ](3_files/C14197_09_16.jpg)
    :::

Figure 9.16: Output with profit-inclusive prices

[]{#_idTextAnchor289}

Lambdas {#_idParaDest-282}
-------

Just like `proc`{.literal} objects, lambdas are also examples of closure
in Ruby. Lambdas, just like `proc`{.literal}, are simply a function with
a name. Additionally, just like `proc`{.literal}, they are objects too.
We will be looking at the specific differences between `proc`{.literal}
and lambdas later on in the chapter.

Let\'s now look at the following syntax to learn more about lambdas:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
hello = lambda {puts "Hello World"}
hello.call
```
:::

That\'s really simple. We use the `lambda`{.literal} keyword to pass a
block of code. To call a `lambda`{.literal} function, we simply use
`.call`{.literal}, in our case, on the variable assigned to it.

There is another very cool and commonly used syntax of lambdas called
`stabby lambda`{.literal}, which is represented as `->`{.literal}; it
was first introduced in *version 1.9*.

The preceding code snippet will change to the following when stabby
lambda is used:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
hello = -> {puts "Hello World"}
hello.call
```
:::

Let\'s implement lambdas in an exercise. Since `proc`{.literal} and
lambdas are quite close in terms of implementation, to understand them
well, let\'s implement the same problem using lambdas instead of
`proc`{.literal}.

[]{#_idTextAnchor290}

Exercise 9.05: Creating a Program to Sum a Range of Numbers Using Lambdas {#_idParaDest-283}
-------------------------------------------------------------------------

In this exercise, we will write a program to sum a range of numbers
using lambdas. The following steps will help you to complete the
exercise:

1.  Create a `lambdas-sum-range.rb`{.literal} file.
2.  Next, we create a lambda using the `stabby lambda`{.literal} syntax
    (`->`{.literal}) and assign it to a variable. If you look at the
    following code, the arguments that will be passed to
    `lambda`{.literal} are next to the stabby lambda syntax and before
    the `do`{.literal} keyword. If we had used the classic
    `lambda`{.literal} syntax, we would have had to place them
    otherwise:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    sum_of_range = ->(first, last) do
        result = 0
        (first..last).each do |i|
            result += i   
        end
        result
    end
    ```
    :::
3.  Let\'s now call the `lambda`{.literal} method using square brackets
    to pass the argument:
    ::: {.informalexample}
    ::: {.toolbar .clearfix}
    Copy
    :::

    ``` {.language-markup}
    puts sum_of_range[1,6]
    ```
    :::
4.  Open the Terminal and traverse to this file. Run the following
    command to see the output:

<div>

::: {#_idContainer364 .IMG---Figure}
![](3_files/C14197_09_17.jpg)
:::

</div>

Figure 9.17: Output for sum using lambdas

We have successfully used `lambda`{.literal} to create a `sum`{.literal}
function.

Note

We can use the square brackets with `proc`{.literal} too, that is,
instead of using .`call`{.literal} when passing arguments to both
`proc`{.literal} and `lambda`{.literal}.

[]{#_idTextAnchor291}

proc versus lambda {#_idParaDest-284}
------------------

The key difference between procs and lambdas is the way the
`return`{.literal} statement works for both of them. While
`proc`{.literal} ignores the container method, `lambda`{.literal} does
not override it.

A `return`{.literal} statement in a block of code created using lambda
behaves similarly to how a method uses `return`{.literal}: that is, it
simply exits the block handling the control back to the original method.
However, in the case of a block of code created using
`proc.new`{.literal}, when the `return`{.literal} statement is used, it
returns from both the blocks of code and the method.

Let\'s understand this with an example:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
def my_lambda_method
    lambda { return "Statement from the block" }.call
    return "Statement from the method"
end
   
   puts my_lambda_method
   def my_proc_method
    Proc.new { return "Statement from the block" }.call
    return "Statement from the method"
   end
   
   puts my_proc_method
```
:::

The output would be as follows:

<div>

::: {#_idContainer365 .IMG---Figure}
![Figure 9.18: Output for proc versus lambda ](3_files/C14197_09_18.jpg)
:::

</div>

Figure 9.18: Output for proc versus lambda

If you take a look at the first method of this file,
`my_lambda_method`{.literal}, you will see that it works in a very
similar way to any Ruby method, returning the final statement of the
method, which even has a lambda with a `return`{.literal} statement in
it.

In the `my_proc_method`{.literal} method, you can see something
different happening. The code is exited altogether after seeing the
first `return`{.literal} statement from `proc`{.literal}.

This is a very subtle difference between the two methods, but the
difference is usually encountered when you are stuck in a bug.
Therefore, we need to understand the internal workings of procs and
lambdas and how they react to a `return`{.literal} statement.

[]{#_idTextAnchor292}

The Story of the Chef and the Restaurant {#_idParaDest-285}
----------------------------------------

This section will round up metaprogramming with a live example as to how
procs and lambdas work in real life. We will define three distinct parts
of the operation. The main part of the magic happens in
`Chef.rb`{.literal}, the components are defined in
`Recipes.rb`{.literal}, and we will also have `Order.rb`{.literal}.

Let\'s define `Chef.rb`{.literal}. We will have a list of recipes and
some filters. We will have `cook`{.literal}, the `before`{.literal} and
`after`{.literal} functions to put together the food, and the
`run`{.literal} function, which will be an abstraction that is used to
put together the parts:

Chef.rb

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
1  module Chef
2      def self.included(klass)
3          puts "The Chef is ready for service!"
4      end
5      def recipes
6          @recipes ||= {}
7      end
8      def before_filter
9          @before_filter ||= {}
10     end
11     def after_filter
12         @after_filter ||= {}
13     end
```
:::

<https://packt.live/35zkd6X>

The entire preceding code should be saved as `Chef.rb`{.literal} in a
directory. This is an abstraction, which is what metaprogramming
is[]{#_idTextAnchor293} all about; we don\'t know what will be ordered
or how to cook the orders. We just want a chef who knows how to fulfill
customer requirements.

Now it is time to create `Recipes.rb`{.literal}; we will define what
happens before, after, and during a chicken soup order:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
require './Chef.rb'
cook "chickensoup" do
  puts "Adding spices"
  puts "Adding water if necessary"
  puts "Waiting for the food to be ready"
end
before "chickensoup" do 
  puts "Preparing to cook chicken soup!"
  puts "Preparing bowls, slicing and dicing."
end
after "chickensoup" do
  puts "Cleaning dishes"
  puts "Serving customer"
end
puts "End of chickensoup!"
```
:::

This file can be further extended with more recipes and allows you to
customize the orders. This also allows us to detach the functionality of
the chef and the orders from the recipes. This makes for a good modular
application.

Finally, we can define our `Orders.rb`{.literal} file, which will be an
interface to call the chef to fulfill the orders based on the recipes:

::: {.informalexample}
::: {.toolbar .clearfix}
Copy
:::

``` {.language-markup}
require './Recipes.rb'
run('chickensoup')
```
:::

This is it. Save all three files in the same folder and you should be
able to invoke the `ruby Orders.rb`{.literal} command and see the
following output:

<div>

::: {#_idContainer366 .IMG---Figure}
![Figure 9.19 Output for recipe preparation ](3_files/C14197_09_19.jpg)
:::

</div>

Figure 9.19 Output for recipe preparation

Let\'s now solve an activity, where we will be implementing every topic
we have learned about in this chapter.

[]{#_idTextAnchor294}

Activity 9.01: Invoice Generator {#_idParaDest-286}
--------------------------------

In this activity, we will be creating an invoice generator program that
will take the customer name, ID, and the amount for two products, then
generate an invoice.

The variable names to be used are `cust_name`{.literal},
`cust_id`{.literal}, `product1`{.literal} `p1`{.literal}, and
`product2`{.literal} `p2`{.literal}. Our example will have three
functions: `invoice_generator`{.literal}, `calc_discount`{.literal}, and
`details`{.literal}.

The following steps will help you with the solution:

1.  Create a new Ruby file.
2.  Define the `invoice_generator`{.literal} method and the
    `p1`{.literal} and `p2`{.literal} variables to be used in the
    method. Implement `&block`{.literal} and `block_given?`{.literal} to
    pass blocks of code for the product prices and customer details.
3.  Use the `yield`{.literal} keyword to pass a block of code only if
    the first block is passed, and then call the method that will
    calculate a discount.
4.  Define a method to calculate the discount on the product prices and
    print the final prices. Make sure that you give a flat 20% discount
    on the sum of the final product prices.
5.  Build a method to retrieve and print the customer details and the
    final product prices with discounts.
6.  Implement all the elements together to print an invoice.

The output would be as follows:

<div>

::: {#_idContainer367 .IMG---Figure}
![Figure 9.20: The invoice generator output ](3_files/C14197_09_20.jpg)
:::

</div>

Figure 9.20: The invoice generator output

Note

The solution for the activity can be found on page 484.


Summary {#_idParaDest-287}
=======

::: {#_idContainer368 .Content}
In this chapter, we learned about the key concepts of metaprogramming.
We learned about concepts such as blocks and how to use
`yield`{.literal} and `block_given?`{.literal} to make our blocks of
code powerful. We then learned about `proc`{.literal} and
`lambda`{.literal} and the differences between `proc`{.literal} and
`lambda`{.literal}, and we also discovered how a subtle difference can
help avoid confusion and bugs.

In the next chapter, we will be learning more about metaprogramming in
Ruby.
