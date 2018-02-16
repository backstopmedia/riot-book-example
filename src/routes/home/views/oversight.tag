<Oversight class="animated fadeIn">
  <div class="container is-fluid">
    <!-- can be animated -->
    <div class="tile is-parent" if={ updated }
         data-is="animore"
         mount={{ duration: 450, translateY: [-15, 0], easing: 'linear' }}>
      <article class="tile is-child notification is-primary">
        <div class="content">
          <p class="title">
            <i class="fa fa-clock-o"></i> <localize item="oversight.updated" />
          </p>
          <p class="subtitle">{ updated }</p>
        </div>
      </article>
    </div>
    <div class="columns">
      <div class="column is-6">
        <section class="hero">
          <div class="hero-body">
            <h1 class="title"
                data-is="localize"
                item="oversight.criticalServices" />
            <hr />
            <div class="container is-fluid">
              <ServicesCPUCard services={ opts.critical } />
            </div>
          </div>
        </section>
      </div>
      <div class="column is-6">
        <section class="hero">
          <div class="hero-body">
            <div class="container is-fluid">
              <h1 class="title"
                  data-is="localize"
                  item="oversight.controlPanel.title" />
              <h2 class="subtitle"
                  data-is="localize"
                  item="oversight.controlPanel.subtitle" />
              <div class="box animated">
                <table class="table">
                  <thead>
                    <tr>
                      <th data-is="localize"
                          item="oversight.controlPanel.table.name" />
                      <th><abbr title="Avg. CPU Usage">CPU</abbr></th>
                      <th data-is="localize"
                          item="oversight.controlPanel.table.uptime" />
                  </thead>
                  <tbody>
                    <tr each={service in opts.critical}>
                      <td>{ service.name }</td>
                      <td>{ this.tracker.average(service).cpu } %</td>
                      <td>{ this.secondsToMinutes(this.service.uptime) } min</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
  <script type="es6">
    import time from '@/mixins/time'
    // # local mixin example
    this.mixin(time)
    this.on('update', function() {
      this.updated = new Date().toLocaleString()
    })
  </script>
</Oversight>
