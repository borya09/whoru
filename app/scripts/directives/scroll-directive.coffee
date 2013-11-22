
'use strict'

# Directive based from http://alxhill.com/blog/articles/angular-scrollspy/
# TODO: TEST
angular.module('whoruApp')
  .directive 'scrollSpy', ($window) ->
    $spies = []
    restrict: 'A'
    controller: ['$rootScope', ($rootScope) ->

      $body = $ "body"

      @addSpied = ($spied) ->
        $spies.push $spied

      $rootScope.smoothScroll = (element) ->
        target = $ '#' + element.id
        if target.length
          $body.animate
            scrollTop: target.offset().top
          , 1000
    ]
    link: (scope, elem, attrs) ->

      lastCurrentId = undefined
      $html = $ 'html'
      $header = $ '.header-container'
      $$window = $($window)

      $$window.scroll ->

        scrollYPos = $window.scrollY
        windowHeight = $$window.height()

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
        headerHeight = $header.height()

        if scrollYPos > headerHeight
          $html.addClass 'header-fixed'
        else
          $html.removeClass 'header-fixed'


        # Finds current section in the browser screen, to set in the header navbar its option as the current one
        $current = null
        for $spied in $spies

          if ($spied.length && pos = $spied.offset().top) - scrollYPos <= windowHeight/2
            $spied.pos = pos
            $current ?= $spied

            if $current.pos < $spied.pos
              $current = $spied

        if $current
          currentId = $current.attr('id')
          for headerOpt in scope.header.nav
            if currentId is headerOpt.id
              if lastCurrentId != currentId

                lastCurrentId = currentId
                scope.setHeaderCurrentOption headerOpt
              break

  .directive 'spied', ->
    restrict: "A"
    require: "^scrollSpy"
    link: (scope, elem, attrs, affix) ->
      affix.addSpied elem

