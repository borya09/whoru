(function(){"use strict";angular.module("whoruApp",["ngRoute","ngSanitize"]).config(["$compileProvider",function(a){return a.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/)}])}).call(this),function(){"use strict";angular.module("whoruApp").controller("MainCtrl",["$scope","$rootScope","DataTranslatorService",function(a,b,c){var d;return d=void 0,b.header={},b.header.nav=[],c.getAvailablesLocales().then(function(b){return a.locales=b}),a.setCurrentLocale=function(a){return c.setLocale(a),b.$broadcast("locale_changed")},a.setHeaderCurrentOption=function(b){return d&&(d.current=!1),d=b,a.$apply(function(){return d.current=!0})}}])}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d){var e,f;f="data",e="config.json",this.init=function(){var a,b=this;return a=d.defer(),c.get(""+f+"/"+e).then(function(c){var d,e,f,g;for(b.config=c.data.config,g=b.config.locales,e=0,f=g.length;f>e;e++)if(d=g[e],d["default"]){b.setLocale(d);break}return a.resolve()}),this.loadingPromise=a.promise},this.init(),this.waitUntilLoaded=function(){return this.loadingPromise},a.prototype.getAvailablesLocales=function(){var a=this;return this.waitUntilLoaded().then(function(){return a.config.locales})},a.prototype.setLocale=function(a){return this.locale&&(this.locale.current=!1),this.locale=a,this.locale.current=!0},a.prototype.getLocale=function(){return this.locale},a.prototype.getDataFilePath=function(a){var b=this;return this.waitUntilLoaded().then(function(){return""+f+"/"+a+"_"+b.locale.key+".json"})}}return a}(),angular.module("whoruApp").service("DataTranslatorService",["$log","$http","$q",a])}.call(this),function(){"use strict";angular.module("whoruApp").directive("scrollSpy",["$window",function(a){var b;return b=[],{restrict:"A",controller:["$rootScope",function(a){var c;return c=$("body"),this.addSpied=function(a){return b.push(a)},a.smoothScroll=function(a){var b;return b=$("#"+a.id),b.length?c.animate({scrollTop:b.offset().top},1e3):void 0}}],link:function(c){var d,e,f;return f=void 0,e=$("html"),d=$(".header-container"),$(a).scroll(function(){var g,h,i,j,k,l,m,n,o,p,q,r,s;for(m=a.scrollY,j=d.height(),m>j?e.addClass("header-fixed"):e.removeClass("header-fixed"),g=null,n=0,p=b.length;p>n;n++)h=b[n],(h.length&&(l=h.offset().top))-m<=0&&(h.pos=l,null==g&&(g=h),g.pos<h.pos&&(g=h));if(g){for(i=g.attr("id"),r=c.header.nav,s=[],o=0,q=r.length;q>o;o++){if(k=r[o],i===k.id){f!==i&&(f=i,c.setHeaderCurrentOption(k));break}s.push(void 0)}return s}})}}}]).directive("spied",function(){return{restrict:"A",require:"^scrollSpy",link:function(a,b,c,d){return d.addSpied(b)}}})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d){var e;e="questions",a.prototype.get=function(){return d.getDataFilePath(e).then(function(a){return c.get(a).then(function(a){return a.data})})}}return a}(),angular.module("whoruApp").service("QuestionsService",["$log","$http","DataTranslatorService",a])}.call(this),function(){"use strict";var a;a=function(){function a(a,b,c,d){var e,f,g;f="questions",e={id:f,order:40,title:"questions",href:"#"+f},c.header.nav.push(e),a.id=f,g=function(){return d.get().then(function(b){var c,d,f,g,h,i,j,k,l;i=b.questions,e.title=b.title,a.title=b.title,a.description=b.description,a.questions=[],l=[];for(h in i)j=i[h],k={question:j.title,multiple:j.multiple,options:[],type:j.multiple===!0?"checkbox":"radio"},a.questions.push(k),g=j.title.replace(" ",""),l.push(function(){var a,b;a=j.answers,b=[];for(d in a)f=a[d],"number"!=typeof f&&(f=f===!0?100:0),c={id:d.replace(" ",""),name:j.multiple===!1?g:d,title:d,checked:!1,pondered:f},b.push(k.options.push(c));return b}());return l})},a.questionsSubmit=function(){return console.log(a.questions),void 0},a.$on("locale_changed",function(){return g()}),g()}return a}(),angular.module("whoruApp").controller("QuestionsCtrl",["$scope","$log","$rootScope","QuestionsService",a])}.call(this),function(){"use strict";var a;a=function(){function a(a){this.title=a.title,this.description=a.description,this.content=a.content,this.id=a.key,this.cssClass=a.key}return a}(),angular.module("whoruApp").factory("CvPart",function(){return a})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d,e){var f;f="cv",a.prototype.get=function(){return e.getDataFilePath(f).then(function(a){return c.get(a).then(function(a){var b,c,e,f,g;for(b={title:a.data.title,parts:[]},g=a.data.parts,e=0,f=g.length;f>e;e++)c=g[e],b.parts.push(new d(c));return b})})}}return a}(),angular.module("whoruApp").service("CvService",["$log","$http","CvPart","DataTranslatorService",a])}.call(this),function(){"use strict";angular.module("whoruApp").controller("CvCtrl",["$scope","$rootScope","CvService",function(a,b,c){var d,e;e={},d=function(){return c.get().then(function(c){var d,f,g,h,i,j,k;for(a.cv=c,d=0,j=c.parts,k=[],h=0,i=j.length;i>h;h++)g=j[h],f=e[g.id],f?k.push(f.title=g.title):(f={id:g.id,order:20+d++,title:g.title,href:"#"+g.id},e[g.id]=f,k.push(b.header.nav.push(f)));return k})},a.$on("locale_changed",function(){return d()}),d()}])}.call(this),function(){"use strict";var a;a=function(){function a(a,b){var c;this.title=b;for(c in a)this[c]=a[c]}return a.prototype.fullname=function(){var a;return a=this.name,this.surname1&&(a+=" "+this.surname1),this.surname2&&(a+=" "+this.surname2),a},a}(),angular.module("whoruApp").factory("Intro",function(){return a})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d,e){var f;f="intro",a.prototype.get=function(){return e.getDataFilePath(f).then(function(a){return c.get(a).then(function(a){return new d(a.data.intro,a.data.title)})})}}return a}(),angular.module("whoruApp").service("IntroService",["$log","$http","Intro","DataTranslatorService",a])}.call(this),function(){"use strict";angular.module("whoruApp").value("CV_REQUIRED_FIELDS",["name","summary"]).controller("IntroCtrl",["$scope","$rootScope","IntroService","CV_REQUIRED_FIELDS",function(a,b,c,d){var e,f,g,h;f=function(a){var b,c,e,f;for(b="",e=0,f=d.length;f>e;e++)c=d[e],b+=void 0===a[c]?" - "+c+"\n":"";return b},h="intro",g={id:h,order:10,title:"intro",href:"#"+h},b.header.nav.push(g),a.id=h,e=function(){return c.get().then(function(c){var d;if(d=f(c))throw new Error("Required fields:\n "+d);return g.title=c.title,a.intro=c,b.header.intro=c})},a.$on("locale_changed",function(){return e()}),e()}])}.call(this),function(){}.call(this),function(){"use strict";var a;a=function(){function a(b,c){var d;d="data/contacts.json",a.prototype.get=function(){return c.get(d).then(function(a){return a.data})}}return a}(),angular.module("whoruApp").service("ContactsService",["$log","$http",a])}.call(this),function(){"use strict";angular.module("whoruApp").controller("ContactsCtrl",["$scope","$rootScope","ContactsService",function(a,b,c){var d,e;e="contacts",d={id:e,order:50,title:"contacts",href:"#"+e},b.header.nav.push(d),a.id=e,c.get().then(function(b){return a.contacts=b.contacts,a.title=b.title,d.title=b.title})}])}.call(this);