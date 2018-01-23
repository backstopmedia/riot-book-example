<ServiceCard>
  <div class="box">
    <div class="container is-fluid">
      <h1>{ this.opts.service.name.toUpperCase() }</h1>
      <div class="container is-fluid">
        <canvas ref="chart" style="max-width: 25rem; max-height: 25rem;"></canvas>
      </div>
      <button class="button is-warning" click={ changeMode }>
        { this.mode.name.toUpperCase() }
      </button>
    </div>
  </div>
  <script type="es6">
    import Chart from 'chart.js'
    const self = this

    const modes = [
      {
        name: 'cpu',
        draw: function() {

        }
      },
      {
        name: 'builds',
        draw: function() {

        }
      }
    ]

    self.mode = modes[0]

    self.changeMode = function() {
    }
  </script>
</ServiceCard>
