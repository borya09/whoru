'use strict'

class IntroService

  constructor:($log, $http, Intro) ->

    urlBase = 'data/intro.json'

    IntroService::get = ->
      $http.get(urlBase)
        .then (response) ->
          new Intro(response.data.intro)



angular.module('whoruApp').service 'IntroService', ['$log', '$http', 'Intro', IntroService]