<Header>
  <nav class="navbar has-shadow" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="/">
        <h1>Dashboard</h1>
      </a>
    </div>
    <div class="navbar-menu">
      <div class="navbar-start">
        <virtual each={route in routes}>
          <a class="navbar-item is-tab {is-active: route.active}" href='#{ route.name }'>
            { route.label }
          </a>
        </virtual>
      </div>
      <div class="navbar-end">
        <a class="navbar-item" href="https://github.com/backstopmedia/riot-book-example" target="_blank">
          <span class="icon is-large">
            <i class="fa fa-2x fa-github"></i>
          </span>
        </a>
      </div>
    </div>
  </nav>
  <script type="es6">
    import route from 'riot-route'

    const self = this

    self.routes = [
      {
        name: '',
        label: 'Home',
        active: false
      },
      {
        name: 'about',
        label: 'About',
        active: false
      },
      {
        name: 'help',
        label: 'Help',
        active: false
      }
    ]
    // # router middleware to track active route
    route(function(target, action, params) {
      if (self.routes) {
        let previous = self.routes.find(r => r.active)
        if (previous)
          previous.active = false
        self.routes.find(r => r.name == target).active = true
        self.update()
      }
    })
  </script>
</Header>
