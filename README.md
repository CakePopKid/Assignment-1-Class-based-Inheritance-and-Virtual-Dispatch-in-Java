# Assignment-1-Class-based-Inheritance-and-Virtual-Dispatch-in-Java
**Assignment 1: Class-based Inheritance and Virtual Dispatch in Java
**Due Friday, September 18 at 11:59 PM

**Goals for This Assignment**
By the time you have completed this work, you should be able to:

   -Use class-based inheritance to implement different behaviors for the same method
   -Implement an immutable list
   -Use recursion to implement basic list operations

*Provided files:*
 ImmutableList.java  
  
 ImmutableListTest.java
 
 Cons.java
 
 Nil.java
 
 hamcrest-2.2.jar
 
 junit-4.13.jar
 
 makefile
  
Step-by-Step Instructions

**Step 1: Download Needed Code**
Download everything from the links above into a single directory.

**Step 2: Read and Understand Provided Code**
For this assignment, you'll be working with an immutable linked list implementation, a type of persistent data structure. While you (hopefully!) are familiar with linked lists, this implementation is likely very different from the one you're used to. Notably:

  Existing lists cannot be modified (the immutable/persistant part). Operations which would normally modify the list (like append) instead return a new list, reflecting the result of the operation. For example, [1, 2].append([3, 4, 5]) returns the list [1, 2, 3, 4, 5], leaving the original lists [1, 2] and [3, 4, 5] unmodified.
Instead of using null to represent the end of a list, we instead use an instance of class Nil.
Class Cons corresponds to the normal Node class, with the caveat that tail (representing the rest of the list) cannot be null. Per the prior bullet, if we want to represent a list where tail is empty, then we should have an instance of Nil there.
There is no special class holding the head of a list. Instead, Cons and Nil are both fully-featured lists in and of themselves. This is one of the reasons we use Nil instead of null, as we can meaningfully call methods on Nil (unlike null).
Cons and Nil both implement the ImmutableList interface. If something wants to take a list as a parameter, it should take an ImmutableList; which could be either an empty list (Nil) or a non-empty list (Cons).
In addition to the above bullets, there is a provided JUnit 4 test suite in ImmutableListTest.java. There is also a makefile (makefile), which can be used to make it easier to compile and run the code on a system with make installed (easy on Linux and Mac, not so easy on Windows).

**Step 3: (Try to) Compile and Run the Tests**
If you have make installed, you can compile the code and subsequently run the test suite with:

make
make test
If you don't have make installed, you can directly run the commands on a UNIX-based system (e.g., Macs, Linux) with:

javac -cp .:hamcrest-2.2.jar:junit-4.13.jar -Xlint:all ImmutableList.java Cons.java Nil.java ImmutableListTest.java
java -cp .:hamcrest-2.2.jar:junit-4.13.jar org.junit.runner.JUnitCore ImmutableListTest
If you're on Windows command prompt, the above commands need to be tweaked to use semicolons instead of the colons, like so:

javac -cp .;hamcrest-2.2.jar;junit-4.13.jar -Xlint:all ImmutableList.java Cons.java Nil.java ImmutableListTest.java
java -cp .;hamcrest-2.2.jar;junit-4.13.jar org.junit.runner.JUnitCore ImmutableListTest
If you're on Windows Powershell, the commands need another tweak:

javac -cp '.;hamcrest-2.2.jar;junit-4.13.jar' -Xlint:all ImmutableList.java Cons.java Nil.java ImmutableListTest.java
java -cp '.;hamcrest-2.2.jar;junit-4.13.jar' org.junit.runner.JUnitCore ImmutableListTest
If all tests are passing, you'll see output like the following:

JUnit version 4.13
....................................
Time: 0.053

OK (36 tests)
If tests are failing, the output will instead show which tests are failing. From there, you can look to see what those tests are doing in the test suite (ImmutableList.java), which will inform you of what needs to be modified.

Note that the provided code will not compile as provided. It's missing the implementations of multiple methods which are needed to make the tests compile.

Step 4: Implement Missing Code, with Restrictions
Add code to Cons.java and Nil.java to get it to compile and pass the tests. Specifically, you need to implement the following methods for each:

length: returns the length of a list. As a hint, empty lists (Nil) have length 0.
sum: returns the sum of all the elements of the list. For our purposes, empty lists (Nil) have a sum of 0.
append: appends two lists together, returning a new list.
contains: returns true if the given list contains the given element, else false.
Example calls to these methods are in ImmutableList.java.

Restrictions

**For full credit, your code:**

Can only modify Cons.java and Nil.java; I'll only look at these two files.
CANNOT use loops (no for, foreach, while, or do-while). Any provided code that uses loops is ok.
CANNOT use conditionals (no if, switch, or ternary ((...) ? ... : ...)). Any provided code that uses conditionals is ok.
These restrictions will force you to use recursion for a correct solution, and will also force you to fully exploit virtual dispatch (also known as dynamic dispatch, polymorphism, and ad-hoc polymorphism). While these restrictions will likely be annoying, it will force you to use a key object-oriented feature (virtual dispatch), as well as serve as good practice for later in the course (recursion).

**Hints**
It's recommended to first write method stubs for all the methods you need to implement. This will get all the code compiling, but the tests won't pass. This is still progress, and this way you can focus on getting one set of tests (or even just one test) to pass at a time.
Mentally, whenever you think something like:
if (list is empty) {
  do empty thing
} else {
  do non-empty thing
}
...you must instead use virtual dispatch. For this example, do empty thing would go into the corresponding method definition in Nil, and do non-empty thing would go into the corresponding method definition in Cons.
While you only have to implement 4 operations, each of these has a different implementation for Cons and Nil, so you really have to implement 8 methods. That said, the body of each of these methods need only be a single line of code. If you need much more than a single line for any method, you are likely making this more difficult than it needs to be. If you're stuck, talk to me.
Once you think you have an operation working, run the tests again using the instructions in step 3. It's probably best to focus on getting one set of tests (or even just one test) passing at a time.
Specific to contains, you do not need to use if, though you'll need to use the short-circuiting nature of ||. Specifically you can implement this using something like the following:
  return head == value || <<recursive call>>;
Step 5: Turn in Your Code Using Canvas
Log into Canvas, and go to the COMP 333 class. Click “Assignments” on the left pane, then click “Assignment 1”. From here, you need to upload the following files:

Cons.java
Nil.java
In addition, if you collaborated with anyone else, be sure to download collaborators.txt and write the names of the people you collaborated with in the file, one per line. Please submit this file along with the other files.

You can turn in the assignment multiple times, but only the last version you submitted will be graded.
