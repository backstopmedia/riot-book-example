import riot from 'riot'
import placeholder from 'riot-placeholder'
// # install placeholder plugin
placeholder(riot)
import 'riot-animore'
// # path for es6 tag router - http://riotjs.com/api/route/#tag-based-routing
import 'riot-route/lib/tag'
// # import application assets
import '@/assets/styles/main.scss'
import '@/components'
import '@/routes'
// # import our mixin services
import Localize from '@/services/localize.js'
import Tracker from '@/services/tracker.js'
// # install localize service as a named global mixin
import localizations from '@/i18n.json'
riot.mixin({
  localize: new Localize(riot, localizations, {
    default: 'en-US',
    locales: ['en-US, es-SP']
  })
})
// # install tracker service as a named global mixin
riot.mixin({ tracker: new Tracker(riot) })
// # initialize application
riot.mount('app')
