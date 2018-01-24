<DeployTable>
  <div class="field">
    <label class="label">
      Service
    </label>
    <div class="control has-icons-left">
      <input name="service"
             onkeyup={ edit }
             class="input { txt.length > 0 && 'is-success' } { page.length == 0 && 'is-danger'}"
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
      <tr each="{ item,i in page }" key="{ i }">
        <td>{ item.name }</td>
        <td>{ Math.round(item.builds[0].time / 60) } minutes(s)</td>
        <td>{ item.builds[0].error ? 'Fail' : 'Success' }</td>
        <td><a if={ item.builds[0].error } onclick={ rebuild }>Rebuild</a></td>
      </tr>
      <tr if={ page.length == 0}>
        <td colspan="3">No services found.</td>
      </tr>
    </tbody>
  </table>

  <button if={ canPrev() } class="button" onclick={ prev }>Prev</button>
  <button if={ canNext() } class="button" onclick={ next }>Next</button>

  <script type="es6">
    import paginator from '@/mixins/pagination.js'
    this.mixin(new paginator(this.tracker.services, 4))

    this.txt = ''

    this.edit = e => {
      this.txt = e.target.value
      this.paginate(this.tracker.search(this.txt))
    }

    this.rebuild = e => {
      e.item.item.builds[0].error = false
    }

    this.on('update', () => {
      this.paginate()
    })

    this.tracker.on('update', () => {
      this.paginate(this.tracker.services)
      this.update()
    })

  </script>
</DeployTable>
