<ServicesCPUCard>
  <div class="container">
    <canvas ref="chart" style="max-width: 25rem; max-height: 25rem;"></canvas>
  </div>
  <script type="es6">
    import Chart from 'chart.js'

    const self = this

    function drawChart() {
      const ctx = self.refs.chart.getContext('2d')
      const cpuChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: self.opts.services.map(service => service.name),
          datasets: [{
            label: 'CPU Spikes',
            data: self.opts.services.map(service => {
              return Math.max(...service.metrics.map(metric => metric.cpu))
            }),
            backgroundColor: [],
          }]
        },
        options: {
          responsive: true,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero:true
              }
            }]
          }
        }
      })
      cpuChart.data.datasets[0].data.forEach((data) => {
        let bg = 'green'
        if (data > 50)
          bg = 'orange'
        if (data > 80)
          bg = 'maroon'
        cpuChart.data.datasets[0].backgroundColor.push(bg)
      })
      cpuChart.update()
    }

    self.on('mount', function() {
      drawChart()
    })
    self.on('update', function() {
      drawChart()
    })
  </script>
</ServicesCPUCard>
