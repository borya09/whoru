'use strict'


class CvPart
  constructor: (part) ->
    @title = part.title
    @header = part.header
    @description = part.description
    @content = part.content
    @id = part.key
    @cssClass = part.key


angular.module('whoruApp').factory "CvPart", -> CvPart

