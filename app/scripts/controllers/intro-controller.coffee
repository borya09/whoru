'use strict'


angular.module('whoruApp')

# Requiered fields of 'intro'
  .value 'CV_REQUIRED_FIELDS',
    [
      'name'
      'summary'
    ]

# **Controller _'IntroCtrl'_**
  .controller 'IntroCtrl', ['$scope', '$rootScope', 'IntroService', 'CV_REQUIRED_FIELDS', ($scope, $rootScope, introService, requiredFields) ->


    #Checks if there is any required field
    introHasErrors = (intro)->
      error = ''
      for field in requiredFields
        error += if intro[field] is undefined then " - #{field}\n" else ''
      error


    #publish in the $rootScope, info for the header navbar
    sectionId = 'intro'

    navInfo =
      id : sectionId
      order: 10
      title : 'intro'
      href : '#' + sectionId


    $rootScope.header.nav.push navInfo
    $scope.id = sectionId

    # Retrieves and publish in the $scope the intro
    get = ->
      introService.get()
        .then (intro) ->
          if errors = introHasErrors intro
            throw new Error "Required fields:\n #{errors}"
          else
            navInfo.title = intro.header
            $scope.intro = intro
            $rootScope.header.intro = intro

    # Listens to 'locale_changed' event
    $scope.$on 'locale_changed', ->
      do get

    # Fires initialization (get)
    do get

    return

  ]
