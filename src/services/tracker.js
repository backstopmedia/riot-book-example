export default class Tracker {

  /**
   * Tracker mixin for aggregating service data.
   * @param {riot} riot - Riot reference.
   * @param {Array} services - Collection of services for data aggregration.
   */
  constructor(riot, services) {
    this.$riot = riot
    this.$riot.observable(this)
    this.update(services)
  }

  /**
   * Update tracker service data.
   * @param {Array} services - Services
   */
  update(services) {
    this.services = services
    this.trigger('update')
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

}
