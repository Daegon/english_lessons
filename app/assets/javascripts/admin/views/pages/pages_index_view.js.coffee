# for more details see: http://emberjs.com/guides/views/

Ela.PagesIndexView = Ember.View.extend
  tableId: 'ProductsDatatable'
  didInsertElement: ->
    _topThis = @
    console.log 'Init datatables in Ela.PagesIndexView'
    $dataTable = $('#' + @tableId)
    dataTable = $dataTable.dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
      bProcessing: true
      bServerSide: true
      sAjaxSource: $dataTable.data('source')
      stateSave: true
      columnDefs: [
        {
          targets: 1
          render: (data, type, full, meta)->
            view = Ember.View.extend
              template: Ember.Handlebars.compile('{{#link-to "pages.edit" ' + full[0] + '}}' + data + '{{/link-to}}')
              container: _topThis.container
            view = view.create()
            $el = $('<div>')
            Ember.run ->
              view.appendTo($el)
            $el.html()
        }, {
          targets: 2
          render: (data, type, full, meta)->
            view = Ember.View.extend
              template: Ember.Handlebars.compile('<a href="#" {{action "remove" ' + full[0] + ' target=view}}>{{i18n "labels.delete"}}</a>')
              container: _topThis.container
              controller: _topThis.controller
              actions:
                remove: (id)->
                  console.log id
                  @get("controller").send("remove", id)
                  @remove()
            view = view.create()
            $el = $('<div>')
            Ember.run ->
              view.appendTo($el)
            $el.html()
        }
      ]
