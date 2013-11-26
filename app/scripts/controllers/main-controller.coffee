'use strict'


# **Controller _'MainCtrl'_**
angular.module('whoruApp')
  .controller 'MainCtrl', ['$scope', '$rootScope', 'DataTranslatorService', ($scope, $rootScope, dataTranslatorService) ->

    headerCurrentOption = undefined

    $rootScope.header =  {}
    $rootScope.header.nav =  {}
    $rootScope.header.nav.options =  []


    # Publish on the $scope an array of avaiable locales
    dataTranslatorService.getAvailablesLocales()
      .then (locales) ->
        $scope.locales = locales

    # Set current locale and broadcast that event
    $scope.setCurrentLocale = (locale) ->
      dataTranslatorService.setLocale(locale)
      $rootScope.$broadcast 'locale_changed'

    # Set header current option
    $scope.setHeaderCurrentOption = (option) ->

      # Disable previous one
      headerCurrentOption.current = false if headerCurrentOption

      # Establish current one
      headerCurrentOption = option

      # publish to $rootScope
      $rootScope.header.nav.current = option

      # Set 'current' property to true, which will add css class 'current'
      $scope.$apply ->
        headerCurrentOption.current = true
      
      return
    
    return  
  ]

