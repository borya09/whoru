'use strict'


# TODO: TEST
angular.module('whoruApp')
  .directive 'body', ($window) ->
    $headerCurrentSectionSpiedElements = []
    $backgroundYPositionSpiedElements = []
    restrict: 'E'
    controller: ['$rootScope', ($rootScope) ->

      $bodyOrHtml = $ "body,html" # selector 'html' is a fix to firefox: http://stackoverflow.com/questions/8149155/animate-scrolltop-not-working-in-firefox

      @addHeaderCurrentSectionSpied = ($element) ->
        $headerCurrentSectionSpiedElements.push $element

      @addBackgroundYPositionScrollSpied = ($element) ->
        $backgroundYPositionSpiedElements.push $element

      $rootScope.smoothScroll = (element) ->
        target = $ '#' + element.id
        if target.length
          $bodyOrHtml.animate
            scrollTop: target.offset().top - 50
          , 1000

        return
        
      return 
    ]
    link: (scope, elem, attrs) ->

      lastCurrentId = undefined
      $html = $ 'html'
      $header = $ '.header-container'
      $intro = $ '.wh-intro'
      $document = $ document
      $$window = $ $window

      $$window.scroll ->

        scrollYPos = $window.scrollY
        windowHeight = $$window.height()
        headerHeight = $header.height()

        # set a dynamic 'background-position-y' to '.background-y-position-scroll' elements when document is scrolled
        documentHeight = $document.height()
        percent = scrollYPos/documentHeight * 100
        for $element in $backgroundYPositionSpiedElements
          $element.css 'background-position-y', percent + '%'



        # Finds elements which should be animated when shown in the screen(with css class '.when-shown'),
        # applying css class '.do'
        $toAnimateElements = $ '.when-shown:not(.do)'
        if $toAnimateElements.length
          $toAnimateElements.each ->
            $this = $ this
            a = $this.offset().top + windowHeight/2
            b = $$window.scrollTop() + windowHeight
            if a < b
              $this.addClass 'do'


        # Finds if the scroll is enough low to set the header as fixed (set a css class 'header-fixed' in the html element)
        if scrollYPos > headerHeight
          $html.addClass 'header-fixed'
        else
          $html.removeClass 'header-fixed'


        #Finds if the #intro section has been scrolled, to set the header a css class 'header-intro-scrolled'
        if scrollYPos > $intro.offset().top + $intro.height()
          $html.addClass 'intro-scrolled'
        else
          $html.removeClass 'intro-scrolled'


        # Finds current section in the browser screen, to set in the header navbar its option as the current one
        # Based on http://alxhill.com/blog/articles/angular-scrollspy/
        $current = null
        for $element in $headerCurrentSectionSpiedElements

          if ($element.length && pos = $element.offset().top) - scrollYPos <= headerHeight
            $element.pos = pos
            $current ?= $element

            if $current.pos < $element.pos
              $current = $element

        if $current
          currentId = $current.attr('id')
          for headerOpt in scope.header.nav.options
            if currentId is headerOpt.id
              if lastCurrentId != currentId

                lastCurrentId = currentId
                scope.setHeaderCurrentOption headerOpt
              break

  .directive 'headerCurrentSection', ->
    restrict: "A"
    require: "^body"
    link: (scope, elem, attrs, affix) ->
      affix.addHeaderCurrentSectionSpied elem

  .directive 'backgroundYPositionScroll', ->
    restrict: "C"
    require: "^body"
    link: (scope, elem, attrs, affix) ->
      affix.addBackgroundYPositionScrollSpied elem

