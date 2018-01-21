import riot from 'riot'
import 'riot-route/lib/tag'
// # could do a regular import but would have to use expose loader on riot
import 'riot-tag-loader!riot-placeholder/riot-placeholder.tag'

import './assets/styles/main.scss'
import './components/app.tag'
import './components/service-card.tag'
import './components/services-cpu-card.tag'
import './components/header.tag'
import './components/bottom.tag'
import './components/deploy-table.tag'
import './routes/home.tag'
import './routes/oversight.tag'
import './routes/services.tag'
import './routes/deployments.tag'
import './routes/about.tag'
import './routes/help.tag'

import Tracker from './services/tracker.js'
import Deployments from './services/deployments.js'

riot.mixin({ tracker: new Tracker(riot) })
riot.mixin({ deploys: new Deployments(riot) })
riot.mount('app')

window.riot = riot
