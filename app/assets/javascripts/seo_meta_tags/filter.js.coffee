class SeoSetFilter
  constructor: (@cont, @options) ->
    @options.$applyEl.on 'click', (event) =>
      event.preventDefault()
      @applyFilter()

  applyFilter: ->
    window.location.replace(@options.$applyEl.attr('href') + '?' + $('input', @cont).serialize())

$.fn.SeoSetFilter = (options) ->
  @each ->
    $this = $(this)
    $this.data "SeoSetFilter", new SeoSetFilter($this, options)  unless $this.data("SeoSetFilter")


