'use strict'

# **Controller _'CvCtrl'_**
angular.module('whoruApp')

  .controller 'CvCtrl', ['$scope', '$rootScope', 'CvService', ($scope, $rootScope, cvService) ->

    navInfoOptions = {}

    # Retrieves and publish in the $scope the cv; and in the $rootScope, info for the header navbar
    get = ->
      cvService.get()
        .then (cv) ->
          $scope.cv = cv

          count = 0

          # Iterates over the parts in the cv to build the header navbar with each part
          for part in cv.parts

            navInfoOpt = navInfoOptions[part.id]

            # Locale change, update the title
            # TODO: Test!
            if navInfoOpt
              navInfoOpt.title = part.header

            # Build the option for the header navbar
            else
              navInfoOpt =
                id : part.id
                order : 2 * 10 + count++
                title : part.header
                href : '#' + part.id
              navInfoOptions[part.id] = navInfoOpt
              $rootScope.header.nav.push navInfoOpt


    # Listens to 'locale_changed' event
    $scope.$on 'locale_changed', ->
      do get

    # Fires initialization (get)
    do get

    return
  ]
