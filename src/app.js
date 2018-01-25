import riot from 'riot'
import 'riot-animore'
// # path for es6 tag router - http://riotjs.com/api/route/#tag-based-routing
import 'riot-route/lib/tag'
// # could do a regular import but would have to use expose loader on riot
import 'riot-tag-loader!riot-placeholder/riot-placeholder.tag'
// # import our tracker service
import tracker from './services/tracker.js'
// # import application assets
import './assets/styles/main.scss'
import './components'
import './routes'
// # set localization
import i18n from 'riot-i18n'
import locales from './i18n.json'
i18n.dictionary(locales)
i18n.setLanguage('en-US')
riot.mixin(i18n)
// # install tracker service as global mixin
riot.mixin({ tracker: new tracker(riot) })
// # initialize application
riot.mount('app')
