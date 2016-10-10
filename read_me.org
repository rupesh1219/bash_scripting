* Fundamentals of bash scripting
  Shell scripts are widely used in the UNIX world. They are good at repeating task and simplifying complex execution logic.

** shebang
   It refers to combination of # and !, the program will look at the first line of the  script and use the interpreter specified in the script.

   for example, if you are running a python script using bash, you should be using /usr/bin/python to mention the bash script to use the python interpreter

 #!/usr/bin/python
print('hello world')

for bash scripts - #!/usr/bin/bash

** Outputting text
   We can use "echo" to output the text from the bash script on to the console or save it to a text file.

#!/usr/bin/bash
echo "hello world"

rupesh$ ./helloworld.sh
hello world

** Introducing varibales
   Just like other programming languages, we can use varibles in bash scripts.

#!/usr/bin/bash
message = "hello world"
echo $message

prepending a $ to the variable's name will return its value.
