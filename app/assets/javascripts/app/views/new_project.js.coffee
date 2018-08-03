class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['new_project']

  events:
    "click .btn_submit": "saveProject"

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch() unless @model.isNew()


  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model

