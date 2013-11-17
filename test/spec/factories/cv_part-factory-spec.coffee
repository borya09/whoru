'use strict'


class CvPartFactorySpec extends FactorySpec

  test: ->

    cvPart = @fixtures.cv.part.a

    beforeEach inject (CvPart) ->
      @cvPart = new CvPart cvPart


    describe '\'constructor\' method, when called', ->
      it 'should create an object with correct params', ->
        expect(@cvPart.title).toBe cvPart.title
        expect(@cvPart.cssClass).toBe cvPart.key
        expect(@cvPart.id).toBe cvPart.key
        expect(@cvPart.description).toBe cvPart.description
        expect(@cvPart.content).toBe cvPart.content

describe 'Factory: CvPart', () -> do new CvPartFactorySpec().test
