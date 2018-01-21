<Home>
  <div class="columns">
    <div class="column is-2">
      <sidebar>
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
          </ul>
        </aside>
      </sidebar>
    </div>
    <div class="column is-9">
      <div class="container">
        <Oversight if={ isView('oversight') } />
        <Services if={ isView('services') } />
        <Deployments if={ isView('deployments') } />
      </div>
    </div>
  </div>
  <script type="es6">
    isView = function(view) {
      return (this.view || 'oversight') == view
    }

    setView = function(view) {
      this.view = view
    }
  </script>
</Home>
