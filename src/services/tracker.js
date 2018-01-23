export default class Tracker {

  /**
   * Tracker mixin for aggregating service data.
   * @param {riot} riot - Riot reference.
   */
  constructor(riot, services) {
    this.$riot = riot
    this.$riot.observable(this)
    this.update()
  }

  /**
   * Update tracker service data.
   */
  update() {
    this.services = []

    fetch('/api/services')
      .then(response => response.json())
      .catch(error => this.trigger('error'))
      .then(json => {
        this.services = json
        this.trigger('update')
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
   * Search for service by field.
   * @returns {Array}
   */
  search(name) {
    return this.services.filter(service => {
      return service.name.toLowerCase().search(name.toLowerCase()) !== -1
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
