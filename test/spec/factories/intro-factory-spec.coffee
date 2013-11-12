'use strict'

describe 'Factory: Intro', () ->

  intro1 =
    name: "borja"
    surname1: "andres"
    surname2: "marroquín"
    summary: "Geek cule de bilbao"

  intro2 =
    name: "borja"
    surname1: "andres"

  intro3 =
    name: "borja"
    surname2: "marroquín"

  intro4 =
    name: "borja"


  beforeEach module 'whoruApp'

  beforeEach inject (Intro) ->
    @Intro = Intro


  describe '\'constructor\' method, when called', ->

    beforeEach ->
      @intro = new @Intro intro1

    it 'should create an object with correct params', ->

      expect(@intro.name).toBe intro1.name
      expect(@intro.surname1).toBe intro1.surname1
      expect(@intro.surname2).toBe intro1.surname2
      expect(@intro.summary).toBe intro1.summary

  describe '\'fullname\' method, when called', ->

    testFullname = (intro, expectedFullname) ->

      beforeEach ->
        @intro = new @Intro intro

      it 'should return correct string', ->
        expect(@intro.fullname()).toBe expectedFullname



    describe 'if intro has name, surname1 and surname2', ->
      testFullname intro1, "#{intro1.name} #{intro1.surname1} #{intro1.surname2}"

    describe 'if intro has name and surname1', ->
      testFullname intro2, "#{intro1.name} #{intro1.surname1}"

    describe 'if intro has name and surname2', ->
      testFullname intro3, "#{intro1.name} #{intro1.surname2}"

    describe 'if intro has name', ->
      testFullname intro4, "#{intro1.name}"



