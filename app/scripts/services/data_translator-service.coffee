'use strict';


# **DataTranslatorService:**
class DataTranslatorService
  constructor: ($log, $http, $q) ->

    # base path
    dataBasePath = 'data'
    # user data config file
    configFile = 'config.json'


    # Initializes this service, and resolves a promise(loadingPromise) when done, so consumers have to wait until it
    @init = ->
      deferred = $q.defer()
      $http.get("#{dataBasePath}/#{configFile}")
        .then (response) =>
          @config = response.data.config
          for locale in @config.locales
            if locale.default
              @setLocale(locale)
              break
          do deferred.resolve

      @loadingPromise = deferred.promise


    # Fires initialization
    do @init


    # Returns the loadingPromise which will be fullfilled when service is successfully loaded
    @waitUntilLoaded = ->
      @loadingPromise


    # Returns a promise with an array of available locales
    DataTranslatorService::getAvailablesLocales = ->
      @waitUntilLoaded()
        .then =>
          @config.locales


    # Set current locale
    DataTranslatorService::setLocale = (locale) ->
      if @locale
        @locale.current = false
      @locale = locale
      @locale.current = true

    # Get current locale
    DataTranslatorService::getLocale = () ->
      @locale

    # Depending on current locale, returns a promise with suitable file path
    DataTranslatorService::getDataFilePath = (file) ->
      @waitUntilLoaded()
        .then =>
          "#{dataBasePath}/#{file}_#{@locale.key}.json"

angular.module('whoruApp').service 'DataTranslatorService', ['$log', '$http', '$q', DataTranslatorService]