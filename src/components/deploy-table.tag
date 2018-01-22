<DeployTable>

  Service: <input name="service" onkeyup={ edit } placeholder="Try Media"/>
  <table class="table">
    <thead>
      <tr>
        <th>Name</th>
        <th>Build Time</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr each="{ item,i in list }" key={ i }>
        <td>{ item.service }</td>
        <td>{ item.minutes } minutes(s)</td>
        <td>{ item.success ? 'Success' : 'Fail' }</td>
      </tr>
    </tbody>
  </table>

  <script type="es6">

    this.list = this.deploys.list

    this.edit = e => {
      this.list = this.deploys.search(e.target.value)
    }

  </script>
</DeployTable>
