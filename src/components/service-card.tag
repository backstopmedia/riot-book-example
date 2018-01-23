<ServiceCard>
  <div class="box">
    <div class="container is-fluid">
      <div class="columns">
        <div class="column is-6">
          <h1>{ this.opts.service.name.toUpperCase() }</h1>
        </div>
        <div class="column is-6 has-text-right">
          <button class="button is-dark is-medium is-centered" click={ changeMode }>
            { this.mode.name.toUpperCase() }
          </button>
        </div>
      </div>
      <hr />
      <div class="container is-fluid has-text-centered">
        <canvas ref="chart" style="max-width: 25rem; max-height: 25rem;"></canvas>
      </div>
    </div>
  </div>
  <script type="es6">
    import Chart from 'chart.js'
    import time from '../mixins/time'
    const self = this

    const modes = [
      {
        name: 'cpu',
        draw: function() {
          const ctx = self.refs.chart.getContext('2d')
          const chart = new Chart(ctx, {
            type: 'scatter',
            data: {
              label: 'CPU',
              datasets: [{
                label: 'CPU Usage',
                data: self.opts.service.metrics.map(metric => {
                  return {
                    x: self.secondsToMinutes(metric.time),
                    y: metric.cpu
                  }
                }),
                backgroundColor: ['orange'],
                pointRadius: 4
              }]
            },
            options: {
              responsive: true,
              scales: {
                xAxes: [{
                  type: 'linear',
                  position: 'bottom',
                  scaleLabel: {
                    display: true,
                    labelString: 'minutes'
                  }
                }],
                yAxes: [{
                  scaleLabel: {
                    display: true,
                    labelString: 'usage'
                  }
                }]
              }
            }
          })
        }
      },
      {
        name: 'builds',
        draw: function() {
          const ctx = self.refs.chart.getContext('2d')
          const chart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: self.opts.service.builds.map(build => build.build),
              datasets: [{
                label: 'Builds',
                data: self.opts.service.builds.map(build => {
                  return {
                    x: build.build,
                    y: self.secondsToMinutes(build.time)
                  }
                }),
                backgroundColor: self.opts.service.builds.map(build => {
                  if (build.time > 15)
                    return 'maroon'
                  if (build.time > 5)
                    return 'orange'
                  return 'green'
                })
              }]
            },
            options: {
              responsive: true,
              scales: {
                xAxes: [{
                  scaleLabel: {
                    display: true,
                    labelString: 'builds'
                  }
                }],
                yAxes: [{
                  scaleLabel: {
                    display: true,
                    labelString: 'minutes'
                  }
                }]
              }
            }
          })
        }
      }
    ]

    self.mode = modes[0]

    self.on('mount', () => {
      self.mode.draw()
    })

    self.on('update', () => {
      self.mode.draw()
    })

    self.changeMode = function() {
      self.mode = self.mode === modes[0] ? modes[1] : modes[0]
      self.update()
    }

    self.mixin(time)
  </script>
</ServiceCard>
