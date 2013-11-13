'use strict';

class DataTranslatorService
  constructor: ($log, $http, $q) ->

    configFile = 'data/_config.json'

    @init = ->

      deferred = $q.defer()

      $http.get(configFile)
        .then (response) =>
          @config = response.data.config
          @locale = @config.default
          do deferred.resolve

      deferred.promise

    do @init

    DataTranslatorService::getAvailablesLocales = ->
      @init()
        .then =>
          @config


    DataTranslatorService::setLocale = (locale) ->
      @locale = locale
      console.log '->',locale

angular.module('whoruApp').service 'DataTranslatorService', ['$log', '$http', '$q', DataTranslatorService]