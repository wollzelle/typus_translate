class Typus.Translate.Views.TextLimit extends Backbone.View

  events:
    'keyup textarea': 'updateLimit'
    'blur textarea': 'updateLimit'
    'focus textarea': 'updateLimit'
    'keyup input': 'updateLimit'
    'blur input': 'updateLimit'
    'focus input': 'updateLimit'

  initialize: (options) ->
    @textarea =  @$(':input')
    @label = @$('label').text()
    @limit = parseInt(@$el.attr('data-limit'))
    @length = @textarea.val().length
    @textarea.attr('rows', Math.ceil(@limit/80))
    @render()

  render: ->
    className = ""
    if @length > @limit then className = "warn"

    text = "#{@label} <span class='#{className}'>#{@length}/#{@limit}</span>"
    @$('label').html(text)

  updateLimit: (e) =>
    @length = @textarea.val().length
    @render()
