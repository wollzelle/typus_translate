class Typus.Translate.Views.Tabs extends Backbone.View

  events:
    'click a': 'activateTab'

  template: JST['typus_translate/templates/tabs']
  
  initialize: (options) ->
    { @locales, @fallback } = options
    @form = $(@el).find('.inputs ol')
    $(window, @form).bind('translate:refresh', (event, lang) => @onRefresh(lang))
    @render()
    
  render: ->
    @form.prepend(@template({ @locales }))
    @tabs = $('#translate-tabs')
    @form.trigger('translate:refresh')

  onRefresh: (lang) ->
    @lang = lang || @getCookie() || @fallback
    @setCookie()
    @showTab()

  showTab: ->
    className = ".lang-#{@lang}"
    @tabs.find('a').removeClass('active')
    @form.css({ 'min-height': @form.height() }) # prevents jumping
    @form.find('.translation').hide().removeClass('active')
    @form.find(className).addClass('active').show()
    @form.css({ 'min-height': '' })
    $(window).trigger('translate:activated', [@lang])

  activateTab: (e) ->
    lang = $(e.target).data('lang')
    @form.trigger('translate:refresh', [lang])
    e.preventDefault()
    
  getCookie: ->
    $.cookie('translate_active_lang')
  
  setCookie: ->
    $.cookie('translate_active_lang', @lang, { path: '/' } ) 

