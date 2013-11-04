'use strict'

angular.module('whoruApp')
  .value 'CV_REQUIRED_FIELDS',
    [
      'name'
      'description'
    ]

  .controller 'CvCtrl', ['$scope', 'cvService', 'CV_REQUIRED_FIELDS', ($scope, cvService, requiredFields) ->

    cvHasErrors = (cv)->
      error = ''
      for field in requiredFields
        error += if cv[field] is undefined then " - #{field}\n" else ''
      error

    cvService.get()
      .then (cv) ->
        if errors = cvHasErrors cv
          throw new Error "Required fields:\n #{errors}"
        else
          $scope.cv = cv

    return

  ]
