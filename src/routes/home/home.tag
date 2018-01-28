<Home>
  <div class="columns">
    <div class="column is-2 is-hidden-mobile">
      <sidebar class="animated slideInLeft">
        <aside class="menu">
          <p class="menu-label">
            Admin
          </p>
          <ul class="menu-list">
            <li>
              <a class={ is-active: isView('oversight') }
                 click={ () => setView('oversight') }>
                 Oversight</a>
            </li>
            <li>
              <a class={ is-active: isView('services') }
                 click={ () => setView('services') }>
                 Services</a>
            </li>
            <li>
              <a class={ is-active: isView('deployments') }
                 click={ () => setView('deployments') }>
                 Deployments</a>
            </li>
            <p class="menu-label">
              Language
            </p>
            <ul class="menu-list">
              <li each={ language in languages }>
                <<a class={ is-active: localize.locale == language.localeKey }
                    data-is="localize"
                    item={ language.localeLabel }
                    click={ () => changeLanguage(language.localeKey) }></a>
              </li>
            </ul>
            <p class="menu-label">
              Tools
            </p>
            <ul class="menu-list">
              <li>
                <a>Development</a>
                <ul>
                  <li>
                    <button class="button is-primary" click={ updateServices }>Randomize</button>
                  </li>
                </ul>
              </li>
            </ul>
          </ul>
        </aside>
      </sidebar>
    </div>
    <div class="column is-9">
      <Oversight if={ isView('oversight') } services={ services } critical={ critical } />
      <Services if={ isView('services') } services={ services } />
      <Deployments if={ isView('deployments') } services={ services } />
    </div>
  </div>
  <script type="es6">
    const self = this

    self.languages = [
      {
        'localeKey': 'en-US',
        'localeLabel': 'locale.languages.english'
      },
      {
        'localeKey': 'es-SP',
        'localeLabel': 'locale.languages.spanish'
      }
    ]

    self.services = self.tracker.services
    self.critical = self.tracker.critical()

    self.isView = function(view) {
      return (self.view || 'oversight') == view
    }
    self.setView = function(view) {
      self.view = view
    }
    self.changeLanguage = function(locale) {
      self.localize.locale = locale
    }
    self.updateServices = function(e) {
      // # prevent automatic update
      e.preventUpdate = true
      // # update services
      self.tracker.update()
      // # manually update home component
      self.update()
    }
    // # update service data on update
    self.on('update', function() {
      self.services = self.tracker.services
      self.critical = self.tracker.critical()
    })
    self.on('mount', function() {
      // # if no data is initially found, assume first load
      // # add listener for tracker observable updated
      if (!self.services.length)
        self.tracker.one('updated', function() {
          self.update()
        })
    })
  </script>
</Home>
