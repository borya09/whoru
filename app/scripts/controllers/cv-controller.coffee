'use strict'

angular.module('whoruApp')

  .controller 'CvCtrl', ['$scope', 'CvService', ($scope, cvService) ->
    cvService.get()
      .then (cv) ->
        $scope.cv = cv
    return
  ]
