<Home class="animated fadeIn">
  <div class="columns">
    <div class="column is-2 is-hidden-mobile">
      <sidebar class="animated slideInLeft">
        <aside class="menu">
          <p class="menu-label">
            Admin
          </p>
          <ul class="menu-list">
            <li>
              <a class="{is-active: isView('oversight')}"
                 click={ () => setView('oversight') }>
                 Oversight</a>
            </li>
            <li>
              <a class="{is-active: isView('services')}"
                 click={ () => setView('services') }>
                 Services</a>
            </li>
            <li>
              <a class="{is-active: isView('deployments')}"
                 click={ () => setView('deployments') }>
                 Deployments</a>
            </li>
            <p class="menu-label">
              Tools
            </p>
            <ul class="menu-list">
              <li>
                <a class="">Development</a>
                <ul>
                  <li>
                    <button class="button is-primary"
                            click={ updateServices }>Randomize</button>
                  </li>
                </ul>
              </li>
            </ul>
          </ul>
        </aside>
      </sidebar>
    </div>
    <div class="column is-9">
      <Oversight if={ isView('oversight') } />
      <Services if={ isView('services') } />
      <Deployments if={ isView('deployments') } />
    </div>
  </div>
  <script type="es6">
    this.isView = function(view) {
      return (this.view || 'oversight') == view
    }
    this.setView = function(view) {
      this.view = view
    }
    this.updateServices = function(e) {
      e.preventUpdate = true
      this.tracker.update()
    }
  </script>
</Home>