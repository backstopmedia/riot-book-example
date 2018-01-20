<app>
  <Header />
  <div class="wrapper">
    <div class="columns">
      <div class="column is-2">
        <Sidebar />
      </div>
      <div class="column is-10">
        <router>
          <route path="">
            <Home />
          </route>
          <route path="oversight">
            <Oversight />
          </route>
          <route path="services">
            <Services />
          </route>
          <route path="deployments">
            <Deployments />
          </route>
          <route path="about">
            <About />
          </route>
          <route path="help">
            <Help />
          </route>
        </router>
      </div>
    </div>
  </div>
  <Bottom />

  <script type="es6">
  </script>
</app>
