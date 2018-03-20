# Create your own personal website with Git/Github
A one-hour practical where we are going to create a personal website for academics powered by Github. 

## Lesson objectives
At the end of this lesson:
- You will dispose of a personal website online where you can add your CV, talks, presentations, etc.
- You will discover the Github system (no command line involved) to perform file version control. 

### Time and Place
- Where: room B0.203, Science Park 904  
- When:  Tuesday, March 20th, 2018 at 17:00 PM

### Authors
- Carlos Martinez (Software Engineer & Software Carpentry Instructor, eScience Center)
- Mateusz Kuzak (Community Manager, Dutch Techcenter for Life Sciences)
- Marc Galland (Postdoctoral researcher, Plant Physiology@SILS)

### Level
Absolute beginners and begginers.  

# Setup

## Github account
If you don't have an account on [Github](https://github.com/), please make one before the lesson. Other than that, there is no setup required. 

## Softwares used
- __Github:__ [Github](https://github.com/) is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.
- __Jekyll:__ Jekyll is a simple, blog-aware, static site generator. It takes a template directory containing raw text files in various formats, runs it through a converter (like Markdown) and our Liquid renderer, and spits out a complete, ready-to-publish static website suitable for serving with your favorite web server. Jekyll also happens to be the engine behind GitHub Pages, which means you can use Jekyll to host your project’s page, blog, or website from GitHub’s servers for free.https://jekyllrb.com/

# Lesson outline
## Time to Complete
One hour.  
Marc (5min)
Carlos (10min)
Carlos (45min)

## Lesson contents
### Expected output (5min)
1. An example of a [personal website](www.mgalland.info) made with Github and Jekyll.
2. Relevance for academics (research groups, protocols)
3. How do I use Github for my own research

### Website creation part I (10min)
1. Forking the [Jekyll-now](https://github.com/barryclark/jekyll-now) repository on your own Github account
2. Rename your repository with your github user name
  - Click on ``Settings``
  - Change the name in repository name
3. Click on the ``_config.yml`` file and select the pencil :pencil2: button (top right)
4. Edit a few lines in the ``_config.yml``:
  - Line 6: Name
  - Line 9: Description (of your website)
  - Line 43: the link (URL) with your username (http://yourgithubusername.github.io)

### How do I use Github in my own work introduction (10min)
1. First look at Github: what it is. 
2. Why should I use Github for my own research?
3. How do I use it for my Software Engineering work.
(what is a commit?)(commit tree)(collaboration)

### Website creation part II
**Changing your picture on your website**
1. Right-click on your Github picture and select ``Copy this location``. 
2. Click on the ``_config.yml`` file and change line 12 (avatar) and copy the link here 

**Edit the index**
1. Click the ``About.md`` file and select pencil :pencil2: button (top right)
2. Edit the file following [Markdown syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

**Creating a new page called "Publications""**
1. At the root of their personal website repository, create a new file called ``Publications.md`` by clicking on ``Create new file``  
2. Add this content:
```
---
layout: page
title: List of scientific publications
permalink: /Publications/
---

## Peer-reviewed publications
1. Me, Myself and I. (2018). We found life on Mars. *Journal of Planet earth*. In press. [doi:10.3389/fpls.2017.01984](doi:10.3389/fpls.2017.01984)
```
3. Edit `_layouts/default.html` to include a link to your newly created `/Publications/` file.
```
<nav>
  <a href="{{ site.baseurl }}/Publications">Publications</a>
  <a href="{{ site.baseurl }}/">Blog</a>
  <a href="{{ site.baseurl }}/about">About</a>
</nav>
```

**(Optional) Create your own pages following the same method**

# Expected results 
A personal website that you can easily customize!

# Additional Resources 
- Coupling Github and RStudio to keep track of the changes of R scripts.[Link](http://r-pkgs.had.co.nz/git.html)
- The official tutorial for first steps on Github. [Link](https://guides.github.com/activities/hello-world/)

# Further reading
- Interview by the creator of Git, Linus Torvald.[Link](http://www.linuxfoundation.org/blog/10-years-of-git-an-interview-with-git-creator-linus-torvalds/) 

