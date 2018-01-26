<Services>
  <div class="container is-fluid">
    <div class="columns is-multiline">
      <div class="column is-6 animated zoomIn" each={service in opts.services}>
        <ServiceCard service={service} />
      </div>
    </div>
  </div>
</Services>
