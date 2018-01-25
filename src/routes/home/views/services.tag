<Services>
  <div class="container is-fluid">
    <div class="columns is-multiline">
      <div class="column is-6 animated zoomIn" each={service in services}>
        <ServiceCard service={service} />
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
</Services>
