'use strict'

describe 'Service: QuestionsService', () ->

  # load the service's module
  beforeEach module 'whoruApp'

  # instantiate service

  beforeEach inject (_questionsService_) ->
    @questionsService = _questionsService_

  it 'should do something', () ->
    expect(@questionsService).not.toBeUndefined
