'use strict'

angular.module('whoruApp')
  .controller 'MainCtrl', ['$scope', 'DataTranslatorService', ($scope, dataTranslatorService) ->

    dataTranslatorService.getAvailablesLocales()
      .then (config) ->
        $scope.locales = config.locales

    $scope.setLocale = (locale) ->
      dataTranslatorService.setLocale(locale)
  ]

