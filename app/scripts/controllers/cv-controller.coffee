'use strict'

angular.module('whoruApp')
  .controller 'CvCtrl', ['$scope', 'cvService', ($scope, cvService) ->

    cvService.get()
      .then (cv) ->
        $scope.cv = cv
        return

    return

  ]
