'use strict';


# **DataTranslatorService:**
# Service responsible for the internationalization of all the user data.

#TODO: TEST
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


    # Set actual locale
    DataTranslatorService::setLocale = (locale) ->
      if @locale
        @locale.actual = false
      @locale = locale
      @locale.actual = true

    # Depending on current locale, returns a promise with suitable file path
    DataTranslatorService::getDataFilePath = (file) ->
      @waitUntilLoaded()
        .then =>
          "#{dataBasePath}/#{file}_#{@locale.key}.json"

angular.module('whoruApp').service 'DataTranslatorService', ['$log', '$http', '$q', DataTranslatorService]