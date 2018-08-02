class App.Views.Header extends Backbone.View
  className: "navbar navbar-default"

  template: HandlebarsTemplates['header']

  render: ->
    @$el.html(@template())
    @
