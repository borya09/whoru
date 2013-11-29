
'use strict'

angular.module('whoruApp')
  .directive('whSliderSelector', ->
    {
      restrict: 'C',
      replace: false
      scope:{
        list:'='
      },
      controller: ['$scope', ($scope) ->

        list = $scope.list
        currentPos = 0

        $scope.morePrev = false
        $scope.moreNext = true

        setCurrent = ->
          item = list[currentPos]
          item.current = true if item

        removeCurrent = ->
          item = list[currentPos]
          item.current = false if item


        setIfMore = ->

          $scope.morePrev = currentPos > 0
          $scope.moreNext = currentPos < (list.length - 1)



        $scope.previous = ->
          do removeCurrent
          currentPos-- if currentPos > 0
          do setIfMore
          do setCurrent


        $scope.next = ->
          do removeCurrent
          currentPos++ if currentPos < (list.length - 1)
          do setIfMore
          do setCurrent


        do setCurrent
        do setIfMore
      ]
      template: '''
         <button class="previous" ng-class="morePrev? 'more' : 'no-more' " ng-click="previous()">
            <span><</span>
         </button>
         <button class="next" ng-class="moreNext? 'more' : 'no-more' " ng-click="next()">
            <span>></span>
         </button>
      '''
    }
  )