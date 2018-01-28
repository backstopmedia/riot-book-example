import riot from 'riot'
import 'riot-animore'
// # path for es6 tag router - http://riotjs.com/api/route/#tag-based-routing
import 'riot-route/lib/tag'
// # could do a regular import but would have to use expose loader on riot
import 'riot-tag-loader!riot-placeholder/riot-placeholder.tag'
// # import application assets
import './assets/styles/main.scss'
import './components'
import './routes'
// # import our mixin services
import Localize from './services/localize.js'
import Tracker from './services/tracker.js'
// # install localize service as a global mixin
import localizations from './i18n.json'
riot.mixin(new Localize(riot, localizations, {
  default: 'en-US',
  locales: ['en-US, es-SP']
}))
// # install tracker service as global mixin by name
riot.mixin({ tracker: new Tracker(riot) })
// # initialize application
riot.mount('app')
