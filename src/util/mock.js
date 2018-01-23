function randomInt(max) {
  return Math.floor(Math.random() * max + 1)
}

function randomBool() {
  return Math.floor(Math.random() * 10) > 5
}

const services = [
  {
    name: 'users',
    tier: 'data',
    metrics: [],
    uptime: 0,
    builds: []
  },
  {
    name: 'media',
    tier: 'application',
    metrics: [],
    uptime: 0,
    builds: []
  },
  {
    name: 'profile',
    tier: 'application',
    metrics: [],
    uptime: 0,
    builds: []
  },
  {
    name: 'database',
    tier: 'application',
    metrics: [],
    uptime: 0,
    builds: []
  },
  {
    name: 'staging',
    tier: 'application',
    metrics: [],
    uptime: 0,
    builds: []
  },
  {
    name: 'qa-test',
    tier: 'application',
    metrics: [],
    uptime: 0,
    builds: []
  },
]

/**
 * Mock micro service data in the form:

    {
      name: String,
      tier: String,
      metrics: [
        {
          uptime: Int,
          cpu: Int // # no greater than 100
        }, ...
      ],
      uptime: Int // # time in seconds up to 1 day,
      builds: [
        {
          build: Int, // # build number
          time: Int, // # total time in seconds for build
          error: bool
        }, ...
      ]
    }

 */
function generate() {
  const hour = 36e2
  const day = hour * 24

  const _services = services.map(service => Object.assign({}, service))
  _services.forEach(service => {
    // # generate random uptime up to a single day
    service.uptime = randomInt(day)
    // # get number of hours in uptime
    const numOfChecks = Math.floor(service.uptime / hour)
    if (numOfChecks) {
      // # normalize uptime so we get the very last full hour
      let uptime = Math.floor(service.uptime / hour) * hour
      // # generate up to 10 previous hours of cpu usage
      service.metrics = [... Array(numOfChecks > 10 ? 10 : numOfChecks)].map(() => {
        const metric = {
          time: uptime,
          cpu: randomInt(100)
        }
        uptime -= hour
        return metric
      }).reverse() // # order from earliest to latest
    }
    // # generate random builds
    let builds = 0
    service.builds = [... Array(randomInt(5))].map(() => {
      return {
        build: ++builds,
        time: randomInt(hour),
        error: randomBool()
      }
    }).sort((a, b) => b.build - a.build)
  })

  return _services
}

if (module)
  module.exports = generate
else
  exports = generate
