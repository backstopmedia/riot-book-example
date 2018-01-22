export default class Deployments {

  /**
   * Deployment mixin for aggregating deploy data.
   * @param {riot} riot - Riot reference.
   */
  constructor(riot) {
    this.$riot = riot
    this.$riot.observable(this)
    this.update()
  }

  /**
   * Update deploy data.
   */
  update() {
    this.list = []

    fetch('/api/deployments').then(response => response.json()).then(json => {
      this.list = json
      this.trigger('update')
    })

  }

  search(txt) {
    return this.list.filter(item => item.service.toLowerCase().search(txt.toLowerCase()) != -1)
  }
}

