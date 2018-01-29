import riot from 'riot'
import 'riot-animore'
// # import application components
import '@/components'
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

export default riot
