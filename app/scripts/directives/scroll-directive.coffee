'use strict'


# TODO: TEST
angular.module('whoruApp')
  .directive 'body', () ->
    $currentSectionSpiedElements = []
    $backgroundYPositionSpiedElements = []
    restrict: 'E'
    controller: ['$rootScope', ($rootScope) ->

      $bodyOrHtml = $ "body,html" # selector 'html' is a fix to firefox: http://stackoverflow.com/questions/8149155/animate-scrolltop-not-working-in-firefox

      @addCurrentSectionSpied = ($element) ->
        $currentSectionSpiedElements.push $element

      @addBackgroundYPositionScrollSpied = ($element) ->
        $backgroundYPositionSpiedElements.push $element

      $header = $ '.header-container'
      $rootScope.smoothScroll = (element) ->
        target = $ '#' + element.id
        if target.length
          $bodyOrHtml.animate
            scrollTop: target.offset().top - ($header.height() - 10)
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
      $window = $ window

      $window.scroll ->

        scrollYPos = $window.scrollTop()
        windowHeight = $window.height()
        headerHeight = $header.height()

        # set a dynamic 'background-position-y' to '.background-y-position-scroll' elements when document is scrolled
        for $element in $backgroundYPositionSpiedElements
          cssStyle = ''
          elementTop = $element.position().top
          elementHeight = $element.height()
          elementBottom = elementTop + elementHeight
          # if scroll position is between an element, calculates the progrees
          if elementTop <= scrollYPos and scrollYPos <= elementBottom
            percent = (scrollYPos - elementTop) / elementHeight * 100
            cssStyle = '0 ' + percent + '%'

          $element.css 'background-position', cssStyle


        # Finds elements which should be animated when shown in the screen(with css class '.when-shown'),
        # applying css class '.do'
        $toAnimateElements = $ '.when-shown:not(.do)'
        if $toAnimateElements.length
          $toAnimateElements.each ->
            $this = $ this
            a = $this.offset().top + windowHeight/2
            b = scrollYPos + windowHeight
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


        # Finds current section in the browser screen, to set in the header navbar its option as the current one, and data atributte 'data-wh-current-section' in the html element
        # Based on http://alxhill.com/blog/articles/angular-scrollspy/
        $current = null
        for $element in $currentSectionSpiedElements

          if ($element.length && pos = $element.offset().top) - scrollYPos <= headerHeight
            $element.pos = pos
            $current ?= $element

            if $current.pos < $element.pos
              $current = $element

        $html.attr 'data-wh-current-section', undefined
        if $current
          currentId = $current.attr('id')
          for headerOpt in scope.header.nav.options
            if currentId is headerOpt.id
              if lastCurrentId != currentId
                lastCurrentId = currentId
                scope.setHeaderCurrentOption headerOpt
                $html.attr 'data-wh-current-section', headerOpt.id
              break



  .directive 'spyCurrentSection', ->
    restrict: "A"
    require: "^body"
    link: (scope, elem, attrs, affix) ->
      affix.addCurrentSectionSpied elem

  .directive 'backgroundYPositionScroll', ->
    restrict: "C"
    require: "^body"
    link: (scope, elem, attrs, affix) ->
      affix.addBackgroundYPositionScrollSpied elem

