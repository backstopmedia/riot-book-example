<DeployTable>
  <table class="table">
    <thead>
      <tr>
        <th>Name</th>
        <th>Build Time</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr each="{ deploy in opts.deploys }">
        <td>{ deploy.service }</td>
        <td>{ deploy.minutes } minutes(s)</td>
        <td>{ deploy.success ? 'Success' : 'Fail' }</td>
      </tr>
    </tbody>
  </table>
  <script type="es6">
  </script>
</DeployTable>
