compile: ImmutableList.java Cons.java Nil.java ImmutableListTest.java
	javac -cp .:hamcrest-2.2.jar:junit-4.13.jar -Xlint:all ImmutableList.java Cons.java Nil.java ImmutableListTest.java

test: compile
	java -cp .:hamcrest-2.2.jar:junit-4.13.jar org.junit.runner.JUnitCore ImmutableListTest
