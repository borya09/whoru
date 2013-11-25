who R U
=======

[![Build Status](https://travis-ci.org/borya09/whoru.png)](https://travis-ci.org/borya09/whoru)

who R U (whoru) is a tool that will allow you to build a web cv to introduce yourself to visitors & companies; 
and interview these ones to discover what they can offer you, their technologies & metodologies,...


 
demo
-------
http://borya09.github.io/whoru/



installation from this repo
------------

Clone this repo and install the dependencies:


* [nodejs](http://nodejs.org/)
* [yeoman](http://yeoman.io/index.html) **Optional
* [Angular generator for yeoman](https://github.com/yeoman/generator-angular) **Optional
* [Compass Core](http://compass-style.org/install/)
* Install node dependencies -- `npm install`
* Install project dependencies -- `bower install`

scripts
-----------
`grunt server`: 
Starts development environment:
* Watch changes in coffee, sass, jade -> compile
* live reload browser
* unit testing


`grunt`: 
Builds the project
* unit/e2e testing
* Unifies js & css

`grunt dist`: 
Builds the project and uploads it to gh-pages


`grunt docco`: 
Builds the documentation. Based on http://jashkenas.github.io/docco/


 
config
---------

### Main config

`config/_config.json`: 

Config available locales, and the default one


### Introduction

`config/intro_{LOCALE}.json`: 

** One file per each available locale

Config basic/introductory information about the cv


### CV

`config/cv_{LOCALE}.json`: 

** One file per each available locale

Config parts (groups of information) of the cv


### Questions

`config/questions_{LOCALE}.json`: 

** One file per each available locale

Config questions to interview the interviewers



### Contacts

`config/contacts.json`: 

Config information about contact
* Webs
* RRSS
* Mails
* Phones

TODO: Document font icons 





Available dynamic css classes / data-attributes
------


`html.header-fixed`: 

**.header-fixed** appears in the **html** element When document is scrolled more than the header navbar height



`html.intro-scrolled`: 

**.intro-scrolled** appears in the **html** element When intro section has been scrolled and is not visible, and disappears when intro is visible



`html.when-shown.do`: 

**.do** appears in elements with css class **when-shown** When the document is scrolled to that element
To spy an element:
* assign it css class 'when-shown'


`.background-y-position-scroll`: 
Sets a dynamic 'background-position-y' to elements with css class 'background-y-position-scroll' when document is scrolled


`li.wh-header-option.current`: 

**.current** appears when the displayed section in the browser represents that option in the navbar. 
To spy a section:
* assign it data-attribute 'header-current-section'
* add to the array $rootScope.header.nav.options next info:
  + id : {string} id of the section
  + order: {number} order in the header
  + title : {string} visible title in the header
  + href : link to the section



`li.wh-header-locale.current`: 

**.current** appears when the displayed language represents that locale in the navbar




about
---------
TODO


license
--------
TODO
