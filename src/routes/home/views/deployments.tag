<Deployments>
  <div class="container is-fluid">
    <div class="columns">
      <div class="column is-12">
        <section class="hero">
          <div class="hero-body">
            <div class="container is-fluid">
              <h1 class="title">
                Deployments
              </h1>
              <hr />
              <div class="box animated fadeIn">
                <DeployTable services={ services } />
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
  <script type="es6">
    const self = this
    function compose() {
      self.services = self.tracker.services
      self.update()
    }
    self.on('mount', compose)
    self.tracker.on('updated', function() {
      if (self.isMounted)
        compose()
    })
  </script>
</Deployments>
