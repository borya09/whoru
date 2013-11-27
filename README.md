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

Configuration of available locales, and the default one:

* version: {String} version of the file
* config: {Object}
	* locales {Array}
		* key: {String} key of the locale, used to identify other files of data. key: 'es' -> files: intro_es.json, cv_es.json
		* image: {String} url of an icon to identify the locale
		* text: {String} description of the locale
		* default: {true|false}


Ex.:

    {
    	"version": "0.0.1",
    	"config": {
    		"locales": [
    			{

    				"key": "es",
    				"image": "http://your.image.url",
    				"text": "ES"
    			},
    			{
    				"default": true,
    				"key": "en",
    				"image": "http://your.image.url",
    				"text": "EN"
    			}
    		]
    	}
    }


### Introduction

`config/intro_{LOCALE}.json`: 

** One file per each available locale

Configuration of basic/introductory information about the owner of the cv

* version: {String} version of the file
* header: {String} name of the section to be linked from the header navbar
* intro {Object}
	* name {String}
	* surname1: {String|undefined}
	* surname2: {String|undefined}
	* summary: {String} short description
	* image: {String|undefined}
	* description: {String|undefined} long description

Ex.:

    {
	    "version": "0.0.1",
	    "header":"Intro",
	    "intro":{
	      "name": "John",
	      "surname1": "Doe",
	      "surname2": "II",
	      "summary": "Nameless Dev",
	      "image": "http://huelva24.com/upload/img/periodico/img_68805.jpg",
	      "description": "Developer Developer Developer"
	    }
	  }


### CV

`config/cv_{LOCALE}.json`: 

** One file per each available locale

Configuration of the parts (groups of information) of the cv

* version: {String} version of the file
* parts {Array}
	* header: {String} name of the cv-part to be linked from the header navbar
	* title: {String} name of the cv-part to be shown as the title of the section
	* key: {String} identification of the cv-part to be used as the id and css class of the section
	* content: {Array}
    * title: {String|undefined}
    * description: {String|undefined}
    * from: {String|undefined}
    * until: {String|undefined}
    * when: {String|undefined}
    * image: {Object|undefined}
      * link: {String}
      * src: {String}
    * description: {String|undefined}
    * content: {Array|undefined}


Ex.:

    {
      "version": "0.0.1",
      "parts": [
	      {
	        "header": "Career",
	        "title": "Professional Career",
	        "key":"career",
	        "content": [
	          {
	            "title": "Project manager",
	            "description":"Planning and execution of any kind of project in <b>Google</b>",
	            "from":"2005",
	            "until":"currently",
	            "image":{
	              "link":"http://www.google.es",
	              "src":"http://www.seomofo.com/downloads/new-google-logo-official.png"
	            },
	            "content":[
	              "Planning",
	              "Management"
	            ]
	          },
	          {
	            "title": "Junior Developer",
	            "description":"Developer at <b>Yahoo</b>",
	            "from":"1999",
	            "until":"2004",
	            "image":{
	              "link":"http://www.yahoo.com",
	              "src":"http://www.omicrono.com/wp-content/uploads/2012/03/yahoo-logo.jpg"
	            }
	          }
	        ]
	      }

### Questions

`config/questions_{LOCALE}.json`: 

** One file per each available locale

Configuration of questions to interview the interviewers

* version: {String} version of the file
* parts {Array}
	* header: {String} name of section to be linked from the header navbar
	* title: {String} name of section to be shown as the title of the questions
	* description: {String|optional} summary of the objective of the questions
	* questions: {Array}
		* title: {String} Questions
		* multiple: {true|false} indicates if the visitant can choose only one answer or several
		* answers: {Array}
			* key-value: {String}-{Number} Answer and weight of that answer to measure the visitant

Ex.:

    {
    	"version": "0.0.1",
      "header": "Questions",
      "title": "Questions",
      "description": "Ey!, Who Are You? Let's see it",
      "questions": [
        {
          "title": "Technologies",
          "multiple": true,
          "answers": {
            "javascript": 100,
            "java": 0,
            "C": 20,
            "python": 0
          }
        },
        {
          "title": "Do you consider yourself as a good place to work?",
          "multiple": false,
          "answers":{
            "yes": true,
            "no": false,
            "maybe":false
          }
        },




### Contacts

`config/contacts.json`: 

Configuration of the information to contact the owner of the cv

* version: {String} version of the file
* header: {String} name of section to be linked from the header navbar
* contacts: {Array}
	* type: {'web'|'phone'|'mail'}
	* value: {String} link
	* icon: {String} character which represents the icon in the file of fonts (icomoon session in: 'app/fonts/whoru-icons/icomoon-selections.json') TODO: Document font icons

Ex.:

    {
    	"version": "0.0.1",
    	"header":"Contact",
    	"contacts": [
    		{
    			"type": "web",
    			"value": "http://www.JohnDoe.com",
    			"icon": "Z"
    		},
        {
          "type": "phone",
          "value": "666999666",
          "icon": "U"
        }



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
Javier Arnáiz González
Borja Andrés Marroquín



license
--------
TODO
