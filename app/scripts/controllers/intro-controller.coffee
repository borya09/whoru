'use strict'

angular.module('whoruApp')
  .value 'CV_REQUIRED_FIELDS',
    [
      'name'
      'summary'
    ]

  .controller 'IntroCtrl', ['$scope', 'IntroService', 'CV_REQUIRED_FIELDS', ($scope, introService, requiredFields) ->

    introHasErrors = (intro)->
      error = ''
      for field in requiredFields
        error += if intro[field] is undefined then " - #{field}\n" else ''
      error

    introService.get()
      .then (intro) ->
        if errors = introHasErrors intro
          throw new Error "Required fields:\n #{errors}"
        else
          $scope.intro = intro

    return

  ]
