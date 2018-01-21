import riot from 'riot'
import 'riot-route/lib/tag'

import './assets/styles/main.scss'
import './components/app.tag'
import './components/service-card.tag'
import './components/header.tag'
import './components/bottom.tag'
import './routes/home.tag'
import './routes/oversight.tag'
import './routes/services.tag'
import './routes/deployments.tag'
import './routes/about.tag'
import './routes/help.tag'

import mock from './services/mock.js'
import Tracker from './services/tracker.js'

riot.mixin('tracker', Tracker(riot, mock()))
riot.mount('app')
