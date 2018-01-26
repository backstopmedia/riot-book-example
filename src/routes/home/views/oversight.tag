<Oversight class="animated bounceIn">
  <div class="container is-fluid">
    <!-- can be animated -->
    <div class="tile is-parent" if={ updated }
         data-is="animore"
         mount={{ duration: 1500, translateY: [250, 0] }}>
      <article class="tile is-child notification is-primary">
        <div class="content">
          <p class="title">
            <i class="fa fa-clock-o"></i> Last Updated
          </p>
          <p class="subtitle">{ updated }</p>
        </div>
      </article>
    </div>
    <div class="columns">
      <div class="column is-6">
        <section class="hero">
          <div class="hero-body">
            <h1 class="title">
              Critical Services
            </h1>
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
              <h1 class="title">
                Control Panel
              </h1>
              <h2 class="subtitle">
                Stats
              </h2>
              <div class="box animated">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th><abbr title="Average CPU Usage">CPU</abbr></th>
                      <th>Uptime</th>
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
  </script>
</Oversight>
