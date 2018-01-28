<DeployTable>
  <div class="field">
    <label class="label" data-is="localize" item="deployTable.service" />
    <div class="control has-icons-left">
      <input name="service"
            onkeyup={ edit }
            class="input { searchText.length > 0 && 'is-success' } { pagination.page.length == 0 && 'is-danger'}"
            placeholder="Try Media"
            autofocus />
      <span class="icon is-small is-left">
        <i class="fa fa-search"></i>
      </span>
    </div>
  </div>
  <table class="table" style="width: 100%">
    <thead>
      <tr>
        <th data-is="localize" item="deployTable.name" />
        <th data-is="localize" item="deployTable.buildTime" />
        <th data-is="localize" item="deployTable.status" />
        <th data-is="localize" item="deployTable.action" />
      </tr>
    </thead>
    <tbody>
      <tr class="animated fadeIn" each="{ item, i in pagination.page }" key="{ i }">
        <td>{ item.name }</td>
        <td>{ Math.round(item.builds[0].time / 60) } minutes(s)</td>
        <td>{ item.builds[0].error ? localize.localize('deployTable.tableCell.fail') : localize.localize('deployTable.tableCell.success') }</td>
        <td>
          <a if={ item.builds[0].error }
             onclick={ rebuild }
             data-is="localize"
             item="deployTable.tableCell.rebuild" />
        </td>
      </tr>
      <tr class="animated fadeInUp" if={ pagination.page.length == 0 }>
        <td colspan="3">No services found.</td>
      </tr>
    </tbody>
  </table>

  <button if={ pagination.canPrev() } class="button" onclick={ prevPage }>Prev</button>
  <button if={ pagination.canNext() } class="button" onclick={ nextPage }>Next</button>

  <script type="es6">
    import Pagination from '@/mixins/pagination.js'
    const self = this

    self.searchText = ''
    self.mixin({ pagination: new Pagination(self.opts.services, 4) })

    /**
     * Search for service by name.
     * @param {String} substring - Substring to search service by.
     * @returns {Array}
     */
    function search(substring) {
      return self.opts.services.filter(service => {
        return service.name.toLowerCase().search(substring.toLowerCase()) !== -1
      })
    }

    self.on('update', function(fromEdit) {
      if (!fromEdit)
        self.pagination.data = self.opts.services
      self.pagination.paginate(self.searchText ? search(self.searchText) : null)
    })

    self.edit = function(e) {
      // # prevent initial update so we don't update data from opts
      e.preventUpdate = true
      // # paginate over provided data set
      // # search given services by name
      self.searchText = e.target.value
      self.pagination.paginate(search(self.searchText))
      // # update component without overriding service data
      self.update(true)
    }

    self.rebuild = function(e) {
      e.item.item.builds[0].error = false
    }

    self.nextPage = function() {
      self.pagination.next()
      self.update(true)
    }

    self.prevPage = function() {
      self.pagination.prev()
      self.update(true)
    }
  </script>
</DeployTable>
