<Services>
  <div class="container is-fluid">
    <div class="columns is-multiline"
         data-is="animore"
         style="opacity: 0"
         mount={{ duration: 750, translateY: [-10, 0], easing: 'linear', opacity: 0.5 }}
         update={{ duration: 750, scale: [1.5, 1], easing: 'linear' }}>
      <div class="column is-6 animated fadeIn" each={service in services}>
        <ServiceCard service={service} />
      </div>
    </div>
  </div>
  <script>
    this.services = this.opts.services
    this.on('update', function() {
      this.services = this.opts.services
    })
  </script>
</Services>
