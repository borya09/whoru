'use strict';

class QuestionsService
  constructor: ($log, $http) ->

    urlBase = 'data/questions.json'

    QuestionsService::get = ->
      $http.get(urlBase)
        .then (response) ->
          response.data

angular.module('whoruApp').service 'QuestionsService', ['$log', '$http', QuestionsService]