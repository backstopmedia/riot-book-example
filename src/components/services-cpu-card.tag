<ServicesCPUCard>
  <div class="container">
    <canvas ref="chart" style="max-width: 25rem; max-height: 25rem;"></canvas>
  </div>
  <script type="es6">
    import Chart from 'chart.js'

    this.on('mount', function() {
      const ctx = this.refs.chart.getContext('2d')
      const cpuChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: this.opts.services.map(service => service.name),
          datasets: [{
            label: 'CPU Spikes',
            data: this.opts.services.map(service => {
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
    })
  </script>
</ServicesCPUCard>
