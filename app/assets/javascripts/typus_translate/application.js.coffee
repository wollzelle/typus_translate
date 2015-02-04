#= require underscore
#= require backbone
#= require jquery.cookie
#= require_self
#= require_tree ./templates
#= require_tree ./views

window.Typus = Typus or {}

Typus.Translate =
  Views: {}

$.fn.typusTranslate = (options = {}) ->
  @each (idx, el) -> new Typus.Translate.Views.Tabs _.extend options, {el}

$.fn.typusTextLimit = (options = {}) ->
  @each (idx, el) -> new Typus.Translate.Views.TextLimit _.extend options, {el}
