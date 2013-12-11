(function(){"use strict";angular.module("whoruApp",["ngRoute","ngSanitize"]).config(["$compileProvider",function(a){return a.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/)}])}).call(this),function(){"use strict";angular.module("whoruApp").controller("MainCtrl",["$scope","$rootScope","DataTranslatorService",function(a,b,c){var d;d=void 0,b.header={},b.header.nav={},b.header.nav.options=[],c.getAvailablesLocales().then(function(b){return a.locales=b}),a.setCurrentLocale=function(a){return c.setLocale(a),b.$broadcast("locale_changed")},a.setHeaderCurrentOption=function(c){d&&(d.current=!1),d=c,b.header.nav.current=c,a.$apply(function(){return d.current=!0})}}])}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d){var e,f;f="data",e="config.json",this.init=function(){var a,b,g=this;return a=d.defer(),b=""+f+"/"+e,c.get(b).then(function(b){var c,d,e,f;for(g.config=b.data.config,f=g.config.locales,d=0,e=f.length;e>d;d++)if(c=f[d],c["default"]){g.setLocale(c);break}return a.resolve()},function(){return console.error("create '"+b+"' file !!!"),a.reject("config file not found")}),this.loadingPromise=a.promise},this.init(),this.waitUntilLoaded=function(){return this.loadingPromise},a.prototype.getAvailablesLocales=function(){var a=this;return this.waitUntilLoaded().then(function(){return a.config.locales})},a.prototype.setLocale=function(a){return this.locale&&(this.locale.current=!1),this.locale=a,this.locale.current=!0},a.prototype.getLocale=function(){return this.locale},a.prototype.getDataFilePath=function(a){var b=this;return this.waitUntilLoaded().then(function(){return""+f+"/"+a+"_"+b.locale.key+".json"})}}return a}(),angular.module("whoruApp").service("DataTranslatorService",["$log","$http","$q",a])}.call(this),function(){"use strict";angular.module("whoruApp").directive("body",function(){var a,b;return b=[],a=[],{restrict:"E",controller:["$rootScope",function(c){var d;d=$("body,html"),this.addHeaderCurrentSectionSpied=function(a){return b.push(a)},this.addBackgroundYPositionScrollSpied=function(b){return a.push(b)},c.smoothScroll=function(a){var b;b=$("#"+a.id),b.length&&d.animate({scrollTop:b.offset().top-50},1e3)}}],link:function(c){var d,e,f,g,h,i;return i=void 0,f=$("html"),e=$(".header-container"),g=$(".wh-intro"),d=$(document),h=$(window),h.scroll(function(){var d,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D;for(u=h.scrollTop(),v=h.height(),q=e.height(),w=0,z=a.length;z>w;w++)j=a[w],l="",p=j.position().top,o=j.height(),n=p+o,u>=p&&n>=u&&(s=100*((u-p)/o),l="0 "+s+"%"),j.css("background-position",l);for(k=$(".when-shown:not(.do)"),k.length&&k.each(function(){var a,b,c;return a=$(this),b=a.offset().top+v/2,c=u+v,c>b?a.addClass("do"):void 0}),u>q?f.addClass("header-fixed"):f.removeClass("header-fixed"),u>g.offset().top+g.height()?f.addClass("intro-scrolled"):f.removeClass("intro-scrolled"),d=null,x=0,A=b.length;A>x;x++)j=b[x],(j.length&&(t=j.offset().top))-u<=q&&(j.pos=t,null==d&&(d=j),d.pos<j.pos&&(d=j));if(d){for(m=d.attr("id"),C=c.header.nav.options,D=[],y=0,B=C.length;B>y;y++){if(r=C[y],m===r.id){i!==m&&(i=m,c.setHeaderCurrentOption(r));break}D.push(void 0)}return D}})}}}).directive("headerCurrentSection",function(){return{restrict:"A",require:"^body",link:function(a,b,c,d){return d.addHeaderCurrentSectionSpied(b)}}}).directive("backgroundYPositionScroll",function(){return{restrict:"C",require:"^body",link:function(a,b,c,d){return d.addBackgroundYPositionScrollSpied(b)}}})}.call(this),function(){"use strict";angular.module("whoruApp").directive("heightAsWindow",["$window",function(a){return{restrict:"A",link:function(b,c,d){var e,f,g,h;return e=$(a),f=$(".header-container"),g="header"===d.heightAsWindow,h=function(){var a;return a=e.height(),g&&(a-=f.height()-10),c.css("min-height",a)},e.resize(function(){return h()}),h()}}}])}.call(this),function(){"use strict";angular.module("whoruApp").directive("whSliderSelector",function(){return{restrict:"C",replace:!1,scope:{list:"="},controller:["$scope",function(a){var b,c,d,e,f;return c=a.list,b=0,a.morePrev=!1,a.moreNext=!0,e=function(){var a;return a=c[b],a?a.current=!0:void 0},d=function(){var a;return a=c[b],a?a.current=!1:void 0},f=function(){return a.morePrev=b>0,a.moreNext=b<c.length-1},a.previous=function(){return d(),b>0&&b--,f(),e()},a.next=function(){return d(),b<c.length-1&&b++,f(),e()},e(),f()}],template:'<button class="previous" ng-class="morePrev? \'more\' : \'no-more\' " ng-click="previous()">\n   <span><</span>\n</button>\n<button class="next" ng-class="moreNext? \'more\' : \'no-more\' " ng-click="next()">\n   <span>></span>\n</button>'}})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d){var e;e="questions",a.prototype.get=function(){return d.getDataFilePath(e).then(function(a){return c.get(a).then(function(a){return a.data},function(){return console.error("create '"+a+"' file !!!")})},function(){return console.error("without config, questions can not be loaded")})}}return a}(),angular.module("whoruApp").service("QuestionsService",["$log","$http","DataTranslatorService",a])}.call(this),function(){"use strict";var a;a=function(){function a(a,b,c,d){var e,f,g;f="questions",e={id:f,order:40,title:"questions",href:"#"+f,hidden:!0},c.header.nav.options.push(e),g=function(){return d.get().then(function(b){var c,d,g,h,i,j,k,l,m;if(a.questions=[],e.hidden=!0,b&&(j=b.questions,j&&j.length)){e.title=b.header,e.hidden=!1,a.id=f,a.title=b.title,a.description=b.description,m=[];for(i in j)k=j[i],l={question:k.title,multiple:k.multiple,options:[],type:k.multiple===!0?"checkbox":"radio"},a.questions.push(l),h=k.title.replace(" ",""),m.push(function(){var a,b;a=k.answers,b=[];for(d in a)g=a[d],"number"!=typeof g&&(g=g===!0?100:0),c={id:d.replace(" ",""),name:k.multiple===!1?h:d,title:d,checked:!1,pondered:g},b.push(l.options.push(c));return b}());return m}})},a.questionsSubmit=function(){return console.log(a.questions),void 0},a.$on("locale_changed",function(){return g()}),g()}return a}(),angular.module("whoruApp").controller("QuestionsCtrl",["$scope","$log","$rootScope","QuestionsService",a])}.call(this),function(){"use strict";var a;a=function(){function a(a){this.title=a.title,this.header=a.header,this.description=a.description,this.content=a.content,this.id=a.key,this.cssClass=a.key}return a}(),angular.module("whoruApp").factory("CvPart",function(){return a})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d,e){var f;f="cv",a.prototype.get=function(){return e.getDataFilePath(f).then(function(a){return c.get(a).then(function(a){var b,c,e,f,g;for(b={parts:[]},g=a.data.parts,e=0,f=g.length;f>e;e++)c=g[e],b.parts.push(new d(c));return b},function(){return console.error("create '"+a+"' file !!!")})},function(){return console.error("without config, cv can not be loaded")})}}return a}(),angular.module("whoruApp").service("CvService",["$log","$http","CvPart","DataTranslatorService",a])}.call(this),function(){"use strict";angular.module("whoruApp").controller("CvCtrl",["$scope","$rootScope","CvService",function(a,b,c){var d,e;e={},d=function(){return c.get().then(function(c){var d,f,g,h,i,j,k;if(c){for(a.cv=c,d=0,j=c.parts,k=[],h=0,i=j.length;i>h;h++)g=j[h],f=e[g.id],f?k.push(f.title=g.header):(f={id:g.id,order:20+d++,title:g.header,href:"#"+g.id,hidden:!1},e[g.id]=f,k.push(b.header.nav.options.push(f)));return k}})},a.$on("locale_changed",function(){return d()}),d()}])}.call(this),function(){"use strict";var a;a=function(){function a(a,b,c){var d;this.header=b,this.title=c;for(d in a)this[d]=a[d]}return a.prototype.fullname=function(){var a;return a=this.name,this.surname1&&(a+=" "+this.surname1),this.surname2&&(a+=" "+this.surname2),a},a}(),angular.module("whoruApp").factory("Intro",function(){return a})}.call(this),function(){"use strict";var a;a=function(){function a(b,c,d,e){var f;f="intro",a.prototype.get=function(){return e.getDataFilePath(f).then(function(a){return c.get(a).then(function(a){return new d(a.data.intro,a.data.header,a.data.title)},function(){return console.error("create '"+a+"' file !!!")})},function(){return console.error("without config, intro can not be loaded")})}}return a}(),angular.module("whoruApp").service("IntroService",["$log","$http","Intro","DataTranslatorService",a])}.call(this),function(){"use strict";angular.module("whoruApp").controller("IntroCtrl",["$scope","$rootScope","IntroService",function(a,b,c){var d,e,f;f="intro",e={id:f,order:10,title:"intro",href:"#"+f,hidden:!1},b.header.nav.init=e,b.header.nav.options.push(e),a.id=f,d=function(){return c.get().then(function(c){return c?(e.title=c.header,a.intro=c,b.header.intro=c,b.title=c.title):void 0})},a.$on("locale_changed",function(){return d()}),d()}])}.call(this),function(){"use strict";var a;a=function(){function a(b,c){var d;d="data/contacts.json",a.prototype.get=function(){return c.get(d).then(function(a){return a.data},function(){return console.error("create '"+d+"' file !!!")})}}return a}(),angular.module("whoruApp").service("ContactsService",["$log","$http",a])}.call(this),function(){"use strict";angular.module("whoruApp").controller("ContactsCtrl",["$scope","$rootScope","ContactsService",function(a,b,c){var d,e;e="contacts",d={id:e,order:50,title:"contacts",href:"#"+e,hidden:!1},b.header.nav.options.push(d),a.id=e,c.get().then(function(b){return b?(a.contacts=b.contacts,d.title=b.header):void 0})}])}.call(this);