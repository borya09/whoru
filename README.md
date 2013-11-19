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
`grunt server`
Starts development environment:
* Watch changes in coffee, sass, jade -> compile
* live reload browser
* unit testing


`grunt`
Builds the project
* unit/e2e testing
* Unifies js & css

`grunt dist`
Builds the project and uploads it to gh-pages


`grunt docco`
Builds the documentation. Based on http://jashkenas.github.io/docco/


 
config
---------

`config/_config.json`
Config available locales, and the default one

`config/intro_{LOCALE}.json`
** One file per each available locale
Config basic/introductory information about the cv

`config/cv_{LOCALE}.json`
** One file per each available locale
Config parts (groups of information) of the cv

`config/questions_{LOCALE}.json`
** One file per each available locale
Config questions to interview the interviewers

`config/contacts.json`
Config information about contact
* Webs
* RRSS
* Mails
* Phones

TODO: Document font icons 





Available dynamic css classes
------


`html.header-fixed`

**.header-fixed** appears in the **html** element When document is scrolled more than the header navbar height


`li.wh-header-option.current`

**.current** appears when the displayed section in the browser represents that option in the navbar


`li.wh-header-locale.current`

**.current** appears when the displayed language represents that locale in the navbar




about
---------
TODO


license
--------
TODO
