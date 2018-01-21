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
    this.deploys = []

    $.getJSON('/api/deployments').done(function (data) {
      this.list = data
      console.log(data)
      this.trigger('update')
    }.bind(this));
  }

}

