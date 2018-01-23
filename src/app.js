import riot from 'riot'
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
// # install tracker service as global mixin
riot.mixin({ tracker: new tracker(riot) })
// # initialize application
riot.mount('app')
