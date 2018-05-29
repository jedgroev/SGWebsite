# Machine Learning applications in Biology

# Lesson description
A lesson on how to apply a Machine Learning method (Random Forest) to a cancer biological dataset. We are going to find the most relevant attributes to classify two cancer types (begign & malignant). 

## Lesson objectives
At the end of this lesson:
- You will know more about Machine Learning: what it is and how it can be applied to your research.
- You will learn about a particular type of Machine Learning method called Random Forest. 
- You will be able to run a Jupyter Notebook to execute the popular Machine Learning [scikit](http://scikit-learn.org/stable/index.html)
- You will better understand how to apply it to a biological research question. 

## Time and Place
- Where: room B0.203, Science Park 904  
- When:  Tuesday, May 29th, 2018 at 17:00 PM

## Authors
- Zsofia Koma (PhD student, UvA-IBED)
- Stefania Astrologo (PhD student, UvA-SILS)
- Marc Galland (Postdoctoral researcher, UvA-SILS)

## Level
Begginers and advanced beginners.  

# Setup
There is no setup required as the Jupyter notebook will run online in the **mybinder** cloud. 

## Tools used
- Python, a modern and popular programming language. 
- mybinder: a tool to run Jupyter notebooks in the cloud online. You don't need to install anything.

## Lesson outline
This lesson is strongly inspired from the [Data Aspirant lesson](https://dataaspirant.com/2017/06/26/random-forest-classifier-python-scikit-learn/) on Random Forest.

### Applications in biology (Stefania, 10min)
Stefania will introduce different biological contexts in which you can apply the Machine Learning Random Forest approach. 
1. Breast cancer: datasets from the [University of Wisconsin](https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(original))    
2. Prediction of age: [Naue et al., 2017](https://www.ncbi.nlm.nih.gov/pubmed/29175600). 


### Machine Learning & Random Forest definitions (Zsofia, 10min)
Some useful definitions:
- Regression (continuous variable) and classification (category)
- Decision tree
- Bagging: taking repeated samples from the same dataset
- Out-of-Bag observations: samples left out during 
- Training a model and testing it
- Random Forest: multiple decision trees + decorrelation between trees


### Hands-on (Zsofia/Marc, 40min)
We will start the hands-on session. 
1. Right-click on the badge [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/ScienceParkStudyGroup/studyGroup/gh-pages) and select "open in new tab". This will create an environment that you can work in.
2. Go to "lessons/20180529_Machine_Learning_Zsofia_Stefania_Marc/" and click on "Preview_ML_Lesson.ipynb" to start the Jupyter notebook.

# Useful links
- [Building Random Forest Classifier with Python Scikit learn](https://dataaspirant.com/2017/06/26/random-forest-classifier-python-scikit-learn/)    
- [Mybinder](https://mybinder.org/): Binder allows you to create custom computing environments that can be shared and used by many remote users. It is powered by BinderHub, which is an open-source tool that deploys the Binder service in the cloud. One-such deployment lives here, at mybinder.org, and is free to use.    
- [Data Aspirant lesson](https://dataaspirant.com/2017/06/26/random-forest-classifier-python-scikit-learn/)  
[Random Forest intro on the breast cancer dataset from datascience.com](https://www.datascience.com/resources/notebooks/random-forest-intro)  
- [Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/). Good intro on Random Forests (chapter 8)  
