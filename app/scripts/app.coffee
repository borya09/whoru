'use strict'

angular.module('whoruApp', ['ngRoute'])
  .config(['$compileProvider', ($compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/)
  ])
