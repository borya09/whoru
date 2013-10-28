'use strict'

class QuestionsController
  constructor: ($scope, $log, questionsService) ->
    #console.log questionsService
    setQuestions = =>
      #console.log 'setquestions llamado!'
      questionsService.load().then (questions) =>
        #console.log 'obtenemos las questions:'
        #console.log questions
        $scope.questions = []

        for question, qvalue of questions
          #console.log question + ' title is ' + qvalue.title
          #console.log question + ' multiple is ' + qvalue.multiple
          res =
            question: qvalue.title
            multiple: qvalue.multiple
            options: []
            type: if qvalue.multiple is true then 'checkbox' else 'radio'

          $scope.questions.push res
          nameMultiple = qvalue.title.replace(' ', '');

          for answer, avalue of qvalue.answers
            #console.log res
            #console.log answer + ' are pondered ' + avalue
            #console.log typeof avalue
            # check if is a boolean and then pondered to 100 or 0
            if typeof avalue isnt 'number'
              avalue = if avalue is true then 100 else 0
            #console.log 'qvalue.multiple ' + qvalue.multiple
            ansewrObj =
              id: answer.replace(' ', '')
              name: if qvalue.multiple is false then nameMultiple else answer
              title: answer
              checked: false
              pondered: avalue

            res.options.push ansewrObj

    # question
    $scope.questionsSubmit = ->
      # submit
      console.log $scope.questions
      undefined

    setQuestions()

angular.module('whoruApp').controller 'QuestionsCtrl', ['$scope', '$log', 'questionsService', QuestionsController]