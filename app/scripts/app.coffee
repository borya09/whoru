'use strict'

angular.module('whoruApp', ['ngRoute','ngSanitize'])
  .config(['$compileProvider', ($compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/)
  ])
