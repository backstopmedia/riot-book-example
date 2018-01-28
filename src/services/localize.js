export default class Localize {

  /**
   * Localization mixin for i18n implementation.
   * @param {riot} instance - Riot reference.
   * @param {Object} localizations - Dictionary of localizations.
   * @param {Object} options - Options for mixin.
   */
  constructor(instance, localizations, options) {
    this.$riot = instance
    this.$riot.observable(this)
    this.localizations = localizations
    this.options = options || { }
    if (!this.options.default || !this.options.locales)
      throw new Error(
        'Expected options to include a default locale and list of available locales')
    this.options.fallback = this.options.fallback || '-'
    this._locale = window.localStorage.getItem('localization') || this.options.default
  }

  /**
   * Get or set current locale.
   * @param {String} locale - Locale to use.
   * @returns {String}
   */
  locale(locale = null) {
    if (locale) {
      if (this.options.locales.find(l => l == locale)) {
        self.trigger('error', {
          message: `Locale "${ locale }" not recognized`
        })
        return
      }
      this.trigger('update')
      window.localStorage.setItem('localization', locale)
      this._locale = locale
      this.trigger('updated')
    }

    return this._locale
  }

  /**
   * Find localized item.
   * @param {String} item - Item key to localize.
   * @param {String} locale - Optional locale, otherwise will use current.
   */
  localize(item, locale = null) {
    const self = this
    let stub = self.localizations[locale || self._locale]
    if (locale && this.options.locales.find(l => l == locale))
      throw new Error(`Locale "${ locale }" not recognized`)
    item.split('.').forEach(key => {
      if (stub[key])
        stub = stub[key]
      else
        throw new Error(
          `Provided item "${ item }" could not be localized in locale "${ locale || self._locale }".`)
    })
    self.trigger('localize', { item, locale: locale || self._locale })
    return stub
  }

}
