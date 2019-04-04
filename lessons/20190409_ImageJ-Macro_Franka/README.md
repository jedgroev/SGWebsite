# Building macro’s in ImageJ

- **Authors**: Franka van der Linden (PhD Molecular Cytology)
- **Lesson Topic**: How to write your own macro's in ImageJ
- **When and Where**: 
- **Preparation**: Bring your laptop, download the ZIP ....NAAM.... to your computer.

**Required knowledge**:
We will assume that you   
- have ImageJ or FIJI up and running on you laptop
- know how to open images in ImageJ (or FIJI when using FIJI)
- and know how to do some basic manual image analysis

## Description
This lesson will cover basic principles on how to write your own macro in ImageJ. We will first introduce you to macro's and how to use  the macro recorder. Then you'll learn the basic structure of loops. Finally you will write a bigger macro using everything you learned previously.

## Why do we need Macro's? (5 min)
- automate repetitive tasks, eg save time
- document what you did
- share common procedures
- add tools to the toolbar
- add keyboard shortcuts

Macro's can be very simple to very complex. Everything you do by hand repeatedly causes you to loose time and should be avoided. Examples of simple macro's:   
- rearrange the order of images in a stack
- save a stack in a different type (8 bit instead of 16, gif instead of tiff)
- semi-automatically crop images, while you manually place the crop box over an image
- determine values from multiple regions of a hyperstack and save these
- ... your 'favorite' repetitive task ...

There are many languages that can be used to write a script in ImageJ, we will only work with the most simple one, which can be saved as an .txt file. If you want to write your own plugins, you will need more advanced programming and I recommend you to go to the ImageJ intro to programming link at the bottom of this page.

## Very basic commands (5 min)
First open a new macro: _Plugins > New > Macro_.

Let's see how ImageJ reacts to some basic commands.
```
//You can copy these lines to the macro
//Text after "//" will not be executed, you can use this to make commands
//To run a specific part of the script, select the lines and hit Ctrl+R, or go to _Macro > Run Macro_
//To run the whole script, don't select anything
print("Hello world!"); //the string is printed in the Log
print(5+3); //the calculation in executed, the result is printed in the Log
print("5+3"); //the string "5+3" is printed.
print("5" + "3"); //the string "5+3" is printed. This way you can concenate string in the print statement! (remember for later)
print(5*3);
print(5-3);
print(5/3);
```
Nothing strange going on here. ImageJ can calculate as you expect and print the result. Now unlike R or Python, in this basic scripting language variables are not stored. See what happens if you run:
```
x=3;
y=5;
print(x+y);
```
now only run:
```
print(x+y);
```
This should give you an error, stating that you have an undefined variable <x>, because ImageJ doesn't remember x=3 and y=5 from before. ImageJ will stop directly after encountering a problem in your code, so it won't complain about the missing <y> variable. So if you want to test a specific part of you code later on, make sure to include the part where you assign the necessary variables.


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



opties: filter, crop, LUT, scalebar, timestamp, you favorite bewerking.




now try the following actions on ....plaatje.... by writing the commands in the new macro. 
[On this website](https://imagej.nih.gov/ij/developer/macro/functions.html) you can find a list of build-in functions in ImageJ. 



## Exercises with loops (10 min)
Sometimes you might want to repeat a certain action for all slices in a stack or for all open images. _for_ loops and _while_ loops are handy. 

**general structure of for loop**
```
for (initialization; condition; increment) {
   statement(s)
}
```
In this example, a for loop is used to print the values 0, 10, 20...90. The loop repeats the body for i=1, i=2, ..., i=9, but stops at i=10, because there the condition i<10 is not met.

```
for (i=0; i<10; i++) {
   j = 10*i;
   print(j);
}
```
_Try if you can get a for loop to print out the table of three like this./
```
1 times 3 is 3
2 times 3 is 6
3 times 3 is 9
4 times 3 is 12
5 times 3 is 15
6 times 3 is 18
7 times 3 is 21
8 times 3 is 24
9 times 3 is 27
10 times 3 is 30
```
You'll need the print() command. Remember:_
```
print("5" + "3"); //the string "5+3" is printed.
```
<details><summary>Click for answer</summary>
<p>

```
for (i=1; i<=10; i++) {
   outcome = i*3; 
   print (i + " times 3 is " + outcome);
}
```
</p>
</details>

**general structure of while loop**
```
while (condition) {
   statement(s)
}
```      
A while loops repeats the body _while_ a condition is true. In this example, a while loop is used to print the values 0, 10, 20...90.
```
i = 0;
while (i<=90) {
      print(i);
      i = i + 10;
   }
```

_You will write a macro to close all images using a while loop. You'll need the commands:_   
- _"nImages", which returns the number of images open._
- _"selectImage(n)", which selects the nth image_
- _"close()", which closes the selected image_   
_Outline of macro: While the number of open images is bigger than 0, select an image, and close it.
Make sure you have opened several images before you test the macro!_

<details><summary>answer</summary>
<p>

```
while (nImages>0) { 
   selectImage(nImages); 
   close(); 
} 
```
</p>
</details>

If you want to use this function reagularly, you can add a keyboard shortcut to the code that will start the script. Look at the added lines below and try to understand what is happening. The shortcut is the F2-key.

<details><summary>answer</summary>
<p>
  
``` 
macro "CloseAllWindows [F2]" { 
      while (nImages>0) { 
          selectImage(nImages); 
          close(); 
      } 
  } 
```
</p>
</details>

You can now install the code above as a plugin by 1) saving the macro somewhere and 2) going to _Macros > Install Macros_ you should find CloseAllWindows under Plugins now.   
You can even turn this into a permanent plugin, by saving the macro as a .ijm file in the plugins folder of your installed ImageJ/FIJI. After restarting the programm, you should find CloseAllWindows under Plugins forever, including the keyboard-shortcut. Check if this works for you

It is also possible to write your own functions in ImageJ, but we won't cover that in this lesson. 

## Bigger exercise (25 min)
Let's combine everything you have learned in a bigger macro. We have two exercises, choose with which you want to start.
For both options, you can use the _Recorder_ and the [website](https://imagej.nih.gov/ij/developer/macro/functions.html) for finding the commands you need.

**Debugging**
Often you'll find that the command you wrote is not executed the way you wanted. There are a few way to find out where your mistake is.   
- When using loops, first test the commands without the loop.   
- The "print()" statement can be very usefull to check if a loop is running smoothly.   
Using the debugger: _Debug > Debug Macro_ (Ctrl+D) followed by _Debug > Step_ (Ctrl+E)

### Option 1: a macro that crops image (with userinput), adds a scalebar, adds a timestamp and saves the new image

You'll need the file ..... ... .. . .. Open it. It countains a timeserie or several cells, each group of cells has his own channel. Include the following steps in the macro. Please try everything yourself first before showing the hidden answers!
1) Draw a squared box automatically of size......
3) Ask for user input: let the user move the box to its desired location.
3) Add this box to the ROI manager
2) Duplicate the region of only this channel, but for all timepoints
3) Rename it to something unique
3) Add scalebar
3) Add timestamp (you can find this function manually....)
4) Change the choose LUT to 
BLAHBLAHBLAH 
### Option 2: A macro that write a csv file with the mean gray value of several regions of interest in a timeserie.

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


## notes voor mij:
Werkt het op ImageJ en FIJI hetzelfde???

## Some examples and wrapping up (5 min)
Lut change RGB picture (Marten)
Masking and making a FRET ratio movie (Franka)

## Further reading
Introduction to Macro’s: https://imagej.net/Introduction_into_Macro_Programming
(includes information about writing functions)

All kind of info on making macro’s: https://imagej.net/developer/index.html
(including a list of built-in functions in ImageJ: https://imagej.nih.gov/ij/developer/macro/functions.html)

Course on image analysis using imageJ on Edx website: https://www.edx.org/course/image-processing-and-analysis-for-life-scientists
(this course is closed, but you can still do plenty of exercises for free!)
