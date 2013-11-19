'use strict'


# **Controller _'MainCtrl'_**
angular.module('whoruApp')
  .controller 'MainCtrl', ['$scope', '$rootScope', 'DataTranslatorService', ($scope, $rootScope, dataTranslatorService) ->

    headerActualOption = undefined

    $rootScope.header =  {}
    $rootScope.header.nav =  []

    # Publish on the $scope an array of avaiable locales
    dataTranslatorService.getAvailablesLocales()
      .then (locales) ->
        $scope.locales = locales

    # Set actual locale and broadcast that event
    $scope.setActualLocale = (locale) ->
      dataTranslatorService.setLocale(locale)
      $rootScope.$broadcast 'locale_changed'

    # Set header actual option
    $scope.setHeaderActualOption = (option) ->
      # Disable previous one
      headerActualOption.actual = false if headerActualOption
      # Establish actual one
      headerActualOption = option


      # Function that set 'actual' property to true, which will add css class 'actual'



      # Workaround to fix error 'Error: $digest already in progress'
      $scope.$apply ->
        headerActualOption.actual = true
  ]

