'use strict';

class QuestionsService
        constructor: ($log, $http) ->
                urlBase = '/data/questions.json'

                QuestionsService::load = ->
                    #console.log 'entramos en load de questionsservice'   
                    $http.get(urlBase).then (results) ->
                        #console.log 'mostramos los resultados: '
                        #console.log results
                        results.data.questions
                                
angular.module('whoruApp').service 'questionsService', ['$log', '$http', QuestionsService]