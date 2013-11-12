'use strict'

describe 'Factory: CvSection', () ->

  section =
    title:'tit'
    key: 'key'
    description:'desc'
    content:[
      a:1
      b:2
    ]


  beforeEach module 'whoruApp'

  beforeEach inject (CvSection) ->
    @cvSection = new CvSection section


  describe '\'constructor\' method, when called', ->

    it 'should create an object with correct params', ->

      expect(@cvSection.title).toBe section.title
      expect(@cvSection.cssClass).toBe section.key
      expect(@cvSection.description).toBe section.description
      expect(@cvSection.content).toBe section.content
