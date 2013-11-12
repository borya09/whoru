'use strict'

describe 'Factory: CvPart', () ->

  cvPart =
    title:'tit'
    key: 'key'
    description:'desc'
    content:[
      a:1
      b:2
    ]


  beforeEach module 'whoruApp'

  beforeEach inject (CvPart) ->
    @cvPart = new CvPart cvPart


  describe '\'constructor\' method, when called', ->

    it 'should create an object with correct params', ->

      expect(@cvPart.title).toBe cvPart.title
      expect(@cvPart.cssClass).toBe cvPart.key
      expect(@cvPart.description).toBe cvPart.description
      expect(@cvPart.content).toBe cvPart.content
