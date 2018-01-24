<Services>
  <div class="container is-fluid">
    <div class="columns is-multiline">
      <div class="column is-6" each={service in tracker.services}>
        <ServiceCard service={service} />
      </div>
    </div>
  </div>
  <script type="es6">
    const self = this
    this.tracker.on('updated', function() {
      if (self.isMounted)
         self.update()
    })
  </script>
</Services>
