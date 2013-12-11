'use strict'


angular.module('whoruApp')


# **Controller _'IntroCtrl'_**
  .controller 'IntroCtrl', ['$scope', '$rootScope', 'IntroService',  ($scope, $rootScope, introService) ->



    #publish in the $rootScope, info for the header navbar
    sectionId = 'intro'

    navInfo =
      id : sectionId
      order: 10
      title : 'intro'
      href : '#' + sectionId
      hidden : false


    $rootScope.header.nav.init = navInfo
    $rootScope.header.nav.options.push navInfo
    $scope.id = sectionId

    # Retrieves and publish in the $scope the intro
    get = ->
      introService.get()
        .then (intro) ->
            if intro
              navInfo.title = intro.header
              $scope.intro = intro
              $rootScope.header.intro = intro
              $rootScope.title = intro.title

    # Listens to 'locale_changed' event
    $scope.$on 'locale_changed', ->
      do get

    # Fires initialization (get)
    do get

    return

  ]
