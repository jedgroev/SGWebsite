# Building macro’s in ImageJ

- **Authors**: Franka van der Linden (PhD Molecular Cytology)
- **Lesson Topic**: How to write your own macro's in ImageJ
- **When and Where**:
- **Preparation**: Bring your laptop, download the ZIP ....NAAM.... to your computer.

**Required knowledge**:
We will assue that you
- have ImageJ or FIJI up and running on you laptop
- know how to open images in ImageJ (or FIJI when using FIJI)
- and know how to do some basic manual image analysis

## Description
This lesson will cover basic principles on how to write your own macro in ImageJ. We will first introduce you to macro's and how to use  the macro recorder. Later you will write your own more complex macro …for the provided example… 

## Why do we need Macro's? (5 min)
- automate repetitive tasks, eg save time
- document what you did
- share common procedures
- add tools to the toolbar
- add keyboard shortcuts

Macro's can be very simple to very complex. Everything you do by hand repeatedly causes you to loose time and should be avoided.
Examples of simple macro's
- rearrange the order of images in a stack
- save a stack in a different type (8 bit instead of 16, gif instead of tiff)
- semi-automatically crop images, while you manually place the crop box over an image
- determine values from multiple regions of a hyperstack and save these
- ... 

There are many languages that can be used to write a script in ImageJ, we will only work with the most simple one, which can be saved as an .txt file. If you want to write your own plugins, you will need more advanced programming and I recommend you to go to the ImageJ intro to programming link at the bottom of this page.

## Very basic commands (5 min)
First open a new macro: _Plugins > New > Macro_
Let's see how ImageJ reacts to some basic commands.
```
//You can copy these lines to the macro
//Text after "//" will not be executed, you can use this to make commands
//To run a specific part of the script, select the lines and hit Ctrl+R, or go to _Macro > Run Macro_
//To run the whole script, don't select anything
print("Hello world!"); //the string is printed in the Log
print(5+3); //the calculation in executed, the result is printed in the Log
print("5+3"); //the string "5+3" is printed.
print(5*3);
print(5-3);
print(5/3);
```
Nothing strange going on here. ImageJ can calculate as you expect and print the result.
Now unlike R or Python, in this basic scripting language variables are not stored. See what happens if you run:
```
x=3;
y=5;
print(x+y);
```
now only run:
```
print(x+y);
```
This should give you an error, stating that you have an undefined variable. ImageJ doesn't remember x=3 and y=5 from before.
So if you want to test a specific part of you code later on, make sure to include the part where you assign the necessary variables.


# BELOW IS UNFINISHED
## Simple exercises (10min)
Now we are going to work on some pictures. Open...... in ImageJ

The easiest way to write macros is by using the Recorder in ImageJ and copy the commands to a new macro.

open recorder...
open new macro

Open in ImageJ  ....een plaatje.... 


See what happens in the recorder when you do the following things
some actions... (in elk geval rename, split channels, image multiplication/ math, contrast change, )

copy the commands from the Recorder to the new macro and try to run them on a fresh image

now try the following actions on ....plaatje.... by writing the commands in the new macro. 
[On this website](https://imagej.nih.gov/ij/developer/macro/functions.html) you can find a list of build-in functions in ImageJ. 




## Exercises with loops (10 min)
Sometimes you might want to repeat a certain action for all slices in a stack or for all open images. _for_ loops and _while_ loops are handy. 
a for loop/while loop (5min)

SLuit alle plaatjes (while)
verander lut van alle plaatjes(for loop)

iets op een stack doen, semi automatisch. opslaan plaatje


It is also possible to write functions in ImageJ, but we won't cover that in this lesson. 

## Bigger exercise (25 min)
Let's combine everything in a bigger macro that works as follows:
- closes all open images, if any are open
- ask user to select an image in a directory. 
- set luts of all channels properly
- removes ROI's from the ROI manager, if there are any
- makes a mask from one of the channels, using user input
- uses the mask to make from the second and third channel a false coloured image
- save these images(with name...)
- ask user to define multiple regions of interest in the origional first channel
- calculate the average gray value of all channels
- save this in a csv file
- do the same for all files in the directory where you selected the first image.
Or something like that.

Make your own bigger one. My example. break down in steps. 
including saving data to cvs. and stack as gif.

**Debugging**
Often you'll find that the command you wrote is not executed the way you wanted. There are a few way to find out where your mistake is. 
When using loops, first test the commands without the loop
The "print()" statement can be very usefull
Using the debugger: _Debug > Debug Macro_ followed by _Debug > Step_ or Ctrl+D and Ctrl+E


## notes voor mij:
Werkt het op ImageJ en FIJI hetzelfde???


## Further reading
Intro to Macro’s: https://imagej.net/Introduction_into_Macro_Programming

All kind of info on making macro’s: https://imagej.net/developer/index.html
- including a list of built-in functions in ImageJ: https://imagej.nih.gov/ij/developer/macro/functions.html
Een link over gebruiken van functies
