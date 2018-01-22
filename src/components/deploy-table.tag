<DeployTable>

  Service: <input name="service" onkeyup={ edit }
            class="input { txt.length > 0 && 'is-success' } { list.length == 0 && 'is-danger'}"
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
      <tr each="{ item,i in page }" key={ i }>
        <td>{ item.name }</td>
        <td>{ item.minutes } minutes(s)</td>
        <td>{ item.success ? 'Success' : 'Fail' }</td>
      </tr>
      <tr if={ list.length == 0}>
        <td colspan="3">No services found.</td>
      </tr>
    </tbody>
  </table>

  <button if={ index > 0 } class="button" onclick={ prev }>Prev</button>
  <button if={ index+1 < list.length/psize } class="button" onclick={ next }>Next</button>

  <script type="es6">

    this.index = 0
    this.psize = 4
    this.list = this.tracker.services

    console.log(this.list)

    this.page = this.list.slice(0,this.psize)
    this.txt = ''

    this.edit = e => {
      this.index = 0
      this.txt = e.target.value
      this.list = this.tracker.search(this.txt)
    }

    this.next = e => this.index++
    this.prev = e => this.index--

    this.on('update', () => {
      this.page = this.list.slice(this.index*this.psize, this.index*this.psize+this.psize)
    })

  </script>
</DeployTable>
