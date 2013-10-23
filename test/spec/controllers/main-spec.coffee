###
'use strict'

describe 'Controller: MainCtrl', () ->

  beforeEach module 'whoruApp'

  MainCtrl = {}
  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

###
