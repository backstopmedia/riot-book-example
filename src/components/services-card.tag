<ServicesCard>
  <div class="container">
    <canvas ref="chart" style="max-width: 25rem; max-height: 25rem;"></canvas>
  </div>
  <script>
    import Chart from 'chart.js'
    this.on('mount', function() {
      var ctx = this.refs.chart.getContext('2d');
      var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: this.opts.services.map(service => service.name),
          datasets: [{
            label: 'CPU Spikes',
            data: this.opts.services.map(service => {
              return Math.max(...service.metrics.map(metric => metric.cpu))
            }),
            backgroundColor: 'orange',
            borderColor: 'orange',
            borderWidth: 1
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
    })
  </script>
</ServicesCard>
