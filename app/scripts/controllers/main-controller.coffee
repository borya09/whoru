'use strict'


# **Controller _'MainCtrl'_**
angular.module('whoruApp')
  .controller 'MainCtrl', ['$scope', '$rootScope', 'DataTranslatorService', ($scope, $rootScope, dataTranslatorService) ->

    $rootScope.nav =  []

    # Publish on the $scope an array of avaiable locales
    dataTranslatorService.getAvailablesLocales()
      .then (locales) ->
        $scope.locales = locales

    # Set locale and broadcast that event
    $scope.setLocale = (locale) ->
      dataTranslatorService.setLocale(locale)
      $rootScope.$broadcast 'locale_changed'

  ]

