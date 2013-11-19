
'use strict'

# Directive based from http://alxhill.com/blog/articles/angular-scrollspy/

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

      lastActualId = undefined

      $($window).scroll ->
        $actual = null

        for $spied in $spies

          if ($spied.length && pos = $spied.offset().top) - $window.scrollY <= 0
            $spied.pos = pos
            $actual ?= $spied
            if $actual.pos < $spied.pos
              $actual = $spied

        if $actual
          actualId = $actual.attr('id')
          for headerOpt in scope.header.nav
            if actualId is headerOpt.id
              if lastActualId != actualId
                lastActualId = actualId
                scope.setHeaderActualOption headerOpt
              break

  .directive 'spied', ->
    restrict: "A"
    require: "^scrollSpy"
    link: (scope, elem, attrs, affix) ->
      affix.addSpied elem

