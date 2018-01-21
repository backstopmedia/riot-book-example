import riot from 'riot'
import 'riot-route/lib/tag'
import 'riot-tag-loader!riot-placeholder/riot-placeholder.tag'

import './assets/styles/main.scss'
import './components/app.tag'
import './components/service-card.tag'
import './components/services-cpu-card.tag'
import './components/header.tag'
import './components/bottom.tag'
import './routes/home.tag'
import './routes/oversight.tag'
import './routes/services.tag'
import './routes/deployments.tag'
import './routes/about.tag'
import './routes/help.tag'

import Tracker from './services/tracker.js'

riot.mixin({ tracker: new Tracker(riot) })
riot.mount('app')

window.riot = riot
