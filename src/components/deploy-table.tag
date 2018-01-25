<DeployTable>
  <virtual if={ page }>
    <div class="field">
      <label class="label">
        Service
      </label>
      <div class="control has-icons-left">
        <input name="service"
              onkeyup={ edit }
              class="input { searchText.length > 0 && 'is-success' } { page.length == 0 && 'is-danger'}"
              placeholder="Try Media"
              autofocus />
        <span class="icon is-small is-left">
          <i class="fa fa-search"></i>
        </span>
      </div>
    </div>
    <table class="table" style="width: 100%;">
      <thead>
        <tr>
          <th>Name</th>
          <th>Build Time</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr class="animated fadeIn" each="{ item, i in page }" key="{ i }">
          <td>{ item.name }</td>
          <td>{ Math.round(item.builds[0].time / 60) } minutes(s)</td>
          <td>{ item.builds[0].error ? 'Fail' : 'Success' }</td>
          <td><a if={ item.builds[0].error } onclick={ rebuild }>Rebuild</a></td>
        </tr>
        <tr class="animated fadeInUp" if={ page.length == 0}>
          <td colspan="3">No services found.</td>
        </tr>
      </tbody>
    </table>

    <button if={ canPrev() } class="button" onclick={ prev }>Prev</button>
    <button if={ canNext() } class="button" onclick={ next }>Next</button>

  </virtual>

  <script type="es6">
    import paginator from '@/mixins/pagination.js'
    const self = this

    self.on('mount', function() {
      self.searchText = ''
      self.mixin(new paginator(self.opts.services, 4))
      self.update()
    })

    self.on('update', function() {
      self.paginate(self.opts.services)
    })

    self.edit = function(e) {
      self.searchText = e.target.value
      self.paginate(self.tracker.search(self.searchText))
    }

    self.rebuild = function(e) {
      e.item.item.builds[0].error = false
    }

  </script>
</DeployTable>
