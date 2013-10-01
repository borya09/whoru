'use strict'

describe 'SmokeTest', () ->

  it 'should check if login page is working', () ->
    browser().navigateTo("/")
    expect(element('h3').html()).toEqual("Enjoy coding! - Yeoman")

