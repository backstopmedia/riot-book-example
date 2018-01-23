<DeployTable>

  Service: <input name="service" onkeyup={ edit }
            class="input { txt.length > 0 && 'is-success' } { page.length == 0 && 'is-danger'}"
            placeholder="Try Media"/>
  <table class="table">
    <thead>
      <tr>
        <th>Name</th>
        <th>Build Time</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr each="{ item,i in page }" key="{ i }">
        <td>{ item.name }</td>
        <td>{ Math.round(item.builds[0].time / 60) } minutes(s)</td>
        <td>{ item.builds[0].error ? 'Success' : 'Fail' }</td>
      </tr>
      <tr if={ page.length == 0}>
        <td colspan="3">No services found.</td>
      </tr>
    </tbody>
  </table>

  <button if={ canPrev() } class="button" onclick={ prev }>Prev</button>
  <button if={ canNext() } class="button" onclick={ next }>Next</button>

  <script type="es6">

    import paginator from '../mixins/pagination.js'
    this.mixin(new paginator(this.tracker.services, 4))

    this.txt = ''

    this.edit = e => {
      this.txt = e.target.value
      this.paginate(this.tracker.search(this.txt))
    }

    this.on('update', () => {
      this.paginate()
    })

  </script>
</DeployTable>
