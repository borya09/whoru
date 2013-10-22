'use strict'

angular.module('whoruApp', ['ngRoute'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/questions',
        templateUrl: 'views/questions.html',
        controller: 'QuestionsCtrl'
      .otherwise
        redirectTo: '/'
  ]
