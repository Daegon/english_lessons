# for more details see: http://emberjs.com/guides/views/

Ela.DataTablesView = Ember.View.extend
  tableId: 'datatable'
  didInsertElement: ->
    _topThis = @
    console.log 'Init datatables in Ela.DataTablesView'
    $dataTable = $('#' + @tableId)
    page = @get('controller.datatables_page') || 0
    dataTable = $dataTable.dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
      bProcessing: true
      bServerSide: true
      sAjaxSource: $dataTable.data('source')
      columnDefs: [
          targets: 1
          render: (data, type, full, meta)->
            '<a href="#' + Ela.Router.router.generate('pages.edit', full[0]) + '">' + data + '</a>'
      ]
      displayStart: page * 10
      fnDrawCallback: (oSettings)->
        page = Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength)
        _topThis.set('controller.datatables_page', page)