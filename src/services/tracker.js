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

  alert() {
    return this.service.find(service => {

    })
  }

  critical() {
    return this.services.find(service => {
      let found =
    })
  }

}
