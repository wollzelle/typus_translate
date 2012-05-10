#= require underscore
#= require backbone
#= require jquery-ui
#= require jquery.cookie

#= require_self
#= require_tree ./templates
#= require_tree ./views

window.Typus = Typus or {}

Typus.Translate =
  Views: {}

Typus.Translator = (options, el) ->
  { locales, fallback } = options
  new Typus.Translate.Views.Tabs({ el, locales, fallback })

$.widget.bridge('typusTranslate', Typus.Translator);

Typus.TextLimit = (options, el) ->
  new Typus.Translate.Views.TextLimit({ el })

$.widget.bridge('typusTextLimit', Typus.TextLimit);