<ServicesCPUCard>
  <div class="box">
    <canvas ref="chart"></canvas>
  </div>
  <script type="es6">
    import Chart from 'chart.js'
    const self = this

    function drawChart() {
      const ctx = self.refs.chart.getContext('2d')
      const cpuSpikes = self.opts.services.map(service => {
        return Math.max(...service.metrics.map(metric => metric.cpu))
      })
      self.cpuChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: self.opts.services.map(service => service.name),
          datasets: [{
            label: 'CPU Spikes',
            data: cpuSpikes,
            backgroundColor: cpuSpikes.map(value => {
              if (value > 80)
                return 'maroon'
              if (value > 50)
                return 'orange'
              return 'green'
            }),
          }]
        },
        options: {
          responsive: true,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              },
              scaleLabel: {
                display: true,
                labelString: 'usage'
              }
            }]
          }
        }
      })
    }

    self.on('mount', function() {
      drawChart()
    })

    self.on('update', function() {
      if (self.cpuChart)
        self.cpuChart.destroy()
      drawChart()
    })
  </script>
</ServicesCPUCard>
