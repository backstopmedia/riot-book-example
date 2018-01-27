export default class Tracker {

  /**
   * Tracker mixin for aggregating service data.
   * @param {riot} riot - Riot reference.
   */
  constructor(riot) {
    this.$riot = riot
    this.$riot.observable(this)
    this._services = []
    this.update()
  }

  /**
   * Overwrite tracker services
   * @param {Array} services - services to overwrite.
   */
  set services(services) {
    this._services = services.map(service => Object.assign({}, service))
  }

  /**
   * Get clean copy of services.
   * @returns {Array}
   */
  get services() {
    return this._services.map(service => Object.assign({}, service))
  }

  /**
   * Update tracker service data.
   */
  update() {
    this.trigger('update')
    fetch('/api/services')
      .then(response => response.json())
      .then(json => {
        this.services = json
        this.trigger('updated')
      })
      .catch(error => this.trigger('error', error))
  }

  /**
   * Find services that have had a cpu spike of less than 30%.
   * @returns {Array}
   */
  healthy() {
    return this.services.filter(service => {
      return service.metrics.find(metric => {
        return metric.cpu <= 30
      })
    })
  }

  /**
   * Find services that had a cpu spike over 30%.
   * @returns {Array}
   */
  alert() {
    return this.services.filter(service => {
      return service.metrics.find(metric => {
        return metric.cpu > 30
      })
    })
  }

  /**
   * Find services that had a cpu spike over 50%.
   * @returns {Array}
   */
  critical() {
    return this.services.filter(service => {
      return service.metrics.find(metric => {
        return metric.cpu > 50
      })
    })
  }

  /**
   * Compose metric and build averages.
   * @param {Object} service - Service to target.
   * @returns {Object}
   */
  average(service) {
    function sum(a, b) { return a + b }
    return {
      cpu: service.metrics.length ? Math.floor(service.metrics.map(metric => {
        return metric.cpu
      }).reduce(sum) / service.metrics.length) : '-',
      buildTime: service.builds.length ? Math.floor(service.builds.map(build => {
        return build.time
      }).reduce(sum) / service.builds.length) : '-'
    }
  }
}
