# Building macro’s in ImageJ

- **Authors**: Franka van der Linden (PhD Molecular Cytology)
- **Lesson Topic**: How to write your own macro's in ImageJ
- **When and Where**: April 9th, 16-17h, B0.207
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
- document what you did, share common procedures -> data management
- add functionalities: tools to the toolbar, keyboard shortcuts

Macro's can be very simple to very complex. Everything you do by hand repeatedly causes you to loose time and should be avoided. Examples of simple macro's:   
- rearrange the order of images in a stack
- save lots of images in a different type
- semi-automatically crop images, while you manually place the crop box over an image
- determine values from multiple regions of a hyperstack and save these
- make a nice ratio FRET image
- save the ROIs (regions of interest) you have analysed
- ... your 'favorite' repetitive task ...

There are many languages that can be used to write a script in ImageJ, we will only work with the most simple one, which can be saved as an .txt file. If you want to write your own plugins, you will need more advanced programming and I recommend you to go to the ImageJ intro to programming link at the bottom of this page.

## Very basic commands (5 min)
First open a new macro: _Plugins > New > Macro_.

Let's see how ImageJ reacts to some basic commands.
```
//You can copy these lines to the macro
//Text after "//" will not be executed, you can use this to make commands
//To run a specific part of the script, select the lines and hit Ctrl+R, or go to Macro > Run Macro
//To run the whole script, don't select anything
print("Hello world!"); //the string is printed in the Log
print(5+3); //the calculation in executed, the result is printed in the Log
print("5+3"); //the string "5+3" is printed.
print("5" + " plus " + "3"); //the string "5 plus 3" is printed. This way you can concatenate strings in the print statement! (remember for later)
print(5*3);
print(5-3);
print(5/3);
```
Nothing strange going on here. ImageJ can calculate as you expect and print the result. It can also print strings and concatenate strings. Now unlike R or Python, in this basic scripting language variables are not stored. See what happens if you run:
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


## Simple exercises (10min)
The easiest way to write macros is by using the _Recorder_ in ImageJ and copy the commands to a new macro.

Open the _Recorder_: _Plugins > Macros > Record..._
Open a new macro: _Plugins > New > Macro_

**First perform the actions below and see what happens in the _Recorder_.**
- Open file "mTq2_RFP_Maturation.tif"
- Zoom in trice: _Image > Zoom > In [+]_
- Look throug the slices in the different channels and play with the Brightness and Contrast. (_Image > Adjust > Brightness/Contrast_) Some actions will result in a command in the recorder. Find out which, some are usefull when writing macro's
- The first channel contains cyan fluorescent signal and the second red fluorecence. Set the LUT (lookup table) appropriately: _Image > Lookup Tables > ....make a choice_
- Duplicate the part of the stack with the brightest cells. _Draw a box, right mouse button.._
- Select the first image
- Close the first image.
- Rename the duplicated image. _right mouse button_
- Open the ROI Manager _Analyze > Tools > ROI Manager_
- Draw an oval shape on a cell you like, add to ROI Manager
- Set what you want to measure. _Analyze > Set Measurements...
- Measure the mean intensity, median, max, area.. (_ROI manager > Measure_)
- Measure the mean intensity of all slices (_More > Multi Measure_)


Now you have seen some commands in the _Recorder_, it is time to do some writing in a macro. You may of course first find the right commands by doing these actions manually and then copy them to the macro..

**Perform the following actions by typing and running the commands.**
- Split the channels (manually under _Image > Color_)
- Select the first channel
- Add timestamp on the bottom right corner (manually via _Image > Stacks > Label..._). A frame was taken every 15 minutes. Choose the layout you like.
- Add a scalebar. The current dimensions of this image are 168.00x168.00 microns, as displayed directly above the image. Make a scalebar of 40 um, on the lower left corner, label all slices. Choose other settings as you wish. (manually under _Analyze > Tools_)
- Close all open images

Open manually "RhoA Sensor HeLa.tif"  
**Perform the following actions by typing and running the commands.** 
- Split the channels
- Divide the second channel by the first channel with the _Image Calculator_.
- Rename the result
- Set the LUT to fire
- Set the Brightness/Contrast to a minimum value of 0 and a maximum of 1.
- Look at the result. This experiment shows a change in ratio between the two measured channels. For the biologists: this is a FRET experiment. It is possible to remove the background and make a very pretty movie, or to remove noise by applying filters, but we will not focus on that. 
-If you have a certain short action you use yourself often, try if you can get it to work by using the macro! 


When you will write your own macro, [on this website](https://imagej.nih.gov/ij/developer/macro/functions.html) you can find a list of build-in functions in ImageJ. 

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
_Try if you can get a for loop to print out the table of three like this._
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
You'll need the print() command. Remember:
```
print("5" + " plus "  "3"); //the string "5 plus 3" is printed.
```

**Debugging tips!**
Often you'll find that the command you wrote is not executed the way you wanted. There are a few ways to find out where your mistake is.   
- When using loops, first test the commands without the loop.   
- The "print()" statement can be very usefull to check if some variable is assigned correctly.   
- Using the debugger might help: _Debug > Debug Macro_ (Ctrl+D) followed by _Debug > Step_ (Ctrl+E).

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
- "nImages", which returns the number of images open.
- "selectImage(n)", which selects the nth image
- "close()", which closes the selected image_  
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

If you want to use this function reagularly, you can add a keyboard shortcut to the code that will start the script. _Look at the added lines below and try to understand what is happening._ The shortcut is the F2-key.

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

You can now install the code above as a plugin by going to _Macros > Install Macros_. The shortcut works!
If you save the macro in the Plugins folder of ImageJ (and restart ImageJ), you can in another macro use the CloseAllWindows macro by typing run("CloseAllWindows");

## Bigger exercise (25 min)
**Write A macro that writes a .csv file with the mean gray value of several regions of interest in a timeserie with multiple channels.**
We will work with the file "RhoA Sensor HeLa.tif", which contains a timeserie of HeLa cells with a RhoA sensor. The three channels represent the different microscope settings for excitation and emission of fluorescent proteins. For those of you familiar with FRET, Channel 1 = donor exitation, donor emission; Channel 2 = donor exitation, acceptor emission (FRET); Channel 3 = acceptor exitation, acceptor emission (total amount of sensor).

You can use the _Recorder_, the [website](https://imagej.nih.gov/ij/developer/macro/functions.html) and a search engine for finding the commands you need. Try out all your commands and remember the debugging tips!


1) First let the macro ask you to select the file you want to open. 

<details><summary>Click for answer</summary>
<p>
   
```
path = File.openDialog("Select a File"); //"Select a File" will be displayed in the dialog that opens. You can write whatever you like.
open(path); // opens the file
```
</p>
</details>

2) Retrieve the name of the file and the dir where the file is saved. You'll need this for saving you data later.
<details><summary>Click for answer</summary>
<p>

```
dir = File.getParent(path);
name = File.getName(path);
//print(dir);
//print(name);
```
</p>
</details>

3) Retrieve the dimensions of the opened stack.
<details><summary>Click for answer</summary>
<p>
   
```
Stack.getDimensions(width, height, channels, slices, frames); //we need the slices and frames. 
```
</p>
</details>

4) Change the LUT to grayscale and enchance contrast on the first channel.
<details><summary>Click for answer</summary>
<p>
 
```
run("Grays");
run("Enhance Contrast", "saturated=0.35");
```
</p>
</details>

5) Open ROI manager and ask the user to draw the ROIs manually. (When finished, click OK to continue)
<details><summary>Click for answer</summary>
<p>
 
```
run("ROI Manager...");
roiManager("Show All with labels");
waitForUser("Draw all ROIs and add to ROI manager [t]. Click OK when finished"); //You can write any instructions in this appearing dialog!
```
</p>
</details>

6) Multimeasure the choosen ROIs
<details><summary>Click for answer</summary>
<p>
 
```
roiManager("multi-measure measure_all");
```
</p>
</details>

7) Set _newname_ to save the Results to. Use the print statement to see if your name is correct.
Suggestion: use the original name but change to "original name + mean intensity" or something similar. This way your cvs file will contain the name of the raw data and you'll never be lost.   
Tricky part: the name also contains a extension. See if you can remove this by finding the location of the dot (use indexOf) and subsetting (subtring). Also don't forget to add the extention ".csv" at the end.
<details><summary>Click for answer</summary>
<p>
 
```
dot_index = indexOf(name, ".");
sname = substring(name, 0, dot_index);
newname = sname + "_mean_intensity.csv";
```
</p>
</details>

8) Now save the Results.
<details><summary>Click for answer</summary>
<p>
 
```
saveAs("Results", dir + "/" + newname);
//"Results" refers to the Results window. You need to add a "/" (mac) or a "\" (windows) between the path and the name of the file.
```
</p>
</details>

9) Now checkout the csv fill! You will notice that the top of the csv file looks like this:

|  | Mean | Ch | Frame|
|:---|:------- |:------|:-----|
| 1 | 422.46 | 1 | 1 |
| 2 | 322.055 | 1 | 1 |
| 3 | 98.091 | 2 | 1 |
| 4 | 66.106 | 2 | 1 |
| 5 | 43.131 | 3 | 1 |
| 6 | 27.182 | 3 | 1|

In this example with two ROIs, the first line corresponds to the first ROI channel1 frame1, the second to the second ROI channel1 frame1, the third to the first ROI channel2 frame1, etc. So the ROIs are alternating. Changing the settings of _Multi Measure_ will change the output, however either the channels or the ROIs will be alternated in the rows. If you would like to have one file with only one channel, and for each ROI a separate column, you'll need to: 1) split the channels, 2) loop trough the images (the old channels), 3) _Multi Measure_ each 4) save each _Results_ window separately. You can try this now if you want to. Channels or ROIs can also be easily separated in R for example, if you were planning on using R anyways.

10) It is good practice to save the ROIs in a ROIset, so you'll be able to trace back where you took your data from. There is a little more writing left to accomplish this! Try to automatically save the ROI's. For manual saving, go in the ROI Manager to _More>> Save..._.
<details><summary>Click for answer</summary>
<p>
 
```
roiname = sname + "RoiSet.zip";
roiManager("Save", dir + "/" + roiname);
```
</p>
</details>

It would also be nice if you saved an image with the ROIs on top, so you can for example put this next to a graph on a poster.
11) Duplicate only the first slice of a choosen channel. Make sure to set a box covering the complete picture (manual Ctrl+A).   
12) Set the LUT and the Brightness/Contrast to whatever you like  
<details><summary>Click for answer</summary>
<p>
 
```
selectImage(1);
run("Select All");
run("Duplicate...", "title=ROIs");
run("Grays");
run("Enhance Contrast", "saturated=0.35");
```
</p>
</details>
13) Rename the ROIs to Cell-1, Cell-2 etc. in a for loop. Make sure to first count the number of ROIs you have added to the roiManager. Then in the loop, select the i-th ROI and rename it. Make sure the ROIs are displayed.

<details><summary>Click for answer</summary>
<p>
 
```
n = roiManager("count");
for (i=0; i<n; i+=1) {
   roiManager("Select", i)
   roiManager("Rename", "Cell-"+ i+1);
}
roiManager("Show All with labels");
```
</p>
</details>
14) You know that later in you analysis you will have more than 9 regions, and you want to name them Cell-01.. Cell-09, but Cell-10, Cell-11 etc (not Cell-010). In that case you need an if/else statement within the loop! _if_ i < 9, the name would be "Cell0"+ i+1, _else_ the name would be "Cell"+ i+1. Adjust your code to include these cases. Lookup the general structure of if and else statements yourself.
15) Make sure the ROIs are displayed.

<details><summary>Click for answer</summary>
<p>
 
```
n = roiManager("count");
for (i=0; i<n; i+=1) {
   roiManager("Select", i);
        if (i<9) {
            roiManager("Rename", "Cell-0"+ i+1);
         } else {
            roiManager("Rename", "Cell-"+ i+1);
         }
}
roiManager("Show All with labels");

```
</p>
</details>
16) Flatten the image (under _Image > Overlay_)  
17) Save the image as .png
18) Close all images using the macro from earlier, if you have it saved in the plugins folder.

<details><summary>Click for answer</summary>
<p>
 
```
roiManager("Show All with labels");
run("Flatten");
saveAs("PNG", dir + "/" + sname + "_ROIs.png");
run("CloseAllWindows");
```
</p>
</details>


<details><summary>Click for full macro</summary>
<p>
 
```
//let the macro ask you to select the file you want to open 
path = File.openDialog("Select a File");
open(path); // opens the file

//retrieve the name of the file and the path of the file
dir = File.getParent(path);
name = File.getName(path);

//retrieve the dimensions of the opened stack
Stack.getDimensions(width, height, channels, slices, frames);

//change the LUT to grayscale and enchance contrast on the first channel
run("Grays");
run("Enhance Contrast", "saturated=0.35");

//Open ROI manager and ask the user to draw the ROIs manually. (When finished, click OK to continue)
run("ROI Manager...");
roiManager("Show All with labels");
waitForUser("Draw all ROIs and add to ROI manager [t]. Click OK when finished");

//multimeasure the choosen ROIs
roiManager("multi-measure measure_all");

//set newpath to save the Results to. 'path' includes the directory the filename.
//Suggestion, use the original name but change to "original name + mean intensity"
//don't forget to add the extention ".csv" as well.
//Tricky part: the name also contains a extension.
//See if you can remove this by finding the location of the dot (use indexOf) and subsetting (subtring)
dot_index = indexOf(name, ".");
sname = substring(name, 0, dot_index);
newname = sname + "_mean_intensity.csv";

//now save the Results
saveAs("Results", dir + "/" + newname); 

//save the ROIs in ZIP that you can later reopen in ImageJ.
//choose a name first
roiname = sname + "RoiSet.zip";
roiManager("Save", dir + "/" + roiname);

//Make an png image that displays the ROIs
selectImage(1);
run("Select All");
run("Duplicate...", "title=ROIs");
//run("Grays");
run("Enhance Contrast", "saturated=0.35");

//Rename the ROIs to something nice
n = roiManager("count");
for (i=0; i<n; i+=1) {
   roiManager("Select", i);
        if (i<9) {
            roiManager("Rename", "Cell-0"+ i+1);
         } else {
            roiManager("Rename", "Cell-"+ i+1);
         }
}
roiManager("Show All with labels");

//Save it.
run("Flatten");
saveAs("PNG", dir + "/" + sname + "_ROIs.png");
// Close all windows (using the macro you installed earlier!)
run("CloseAllWindows");
```
</p>
</details>


## notes voor mij:
Werkt het op ImageJ en FIJI hetzelfde???

## Some examples and wrapping up (5 min)
- Lut change RGB picture (Marten)
- Masking and making a FRET ratio movie (Franka)

## Further reading
Introduction to Macro’s, includes information about writing functions: https://imagej.net/Introduction_into_Macro_Programming

All kind of info on making macro’s: https://imagej.net/developer/index.html   
It includes a [list of built-in functions in ImageJ](https://imagej.nih.gov/ij/developer/macro/functions.html)

Course on image analysis using imageJ on Edx website. This course is closed, but you can still do plenty of exercises for free! https://www.edx.org/course/image-processing-and-analysis-for-life-scientists
