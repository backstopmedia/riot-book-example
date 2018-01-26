export default class Paginator {

  /**
   * Pagination mixin.
   * @param {Array} data - Data set to target for pagination.
   * @param {Int} pageSize - Page size for pagination pages.
   */
  constructor(data, pageSize = 5) {
    this.pageSize = pageSize
    this.pageIndex = 0
    this.data = data
    this.paginate()
  }

  /** Get pagination data set. */
  get data() {
    return this._data
  }

  /**
   * Update pagintion data set.
   * @param {Array} data - Data set for pagination processor.
   */
  set data(data) {
    this._data = data
  }

  /**
   * Process pagination.
   * @param {Array} data - Optional data for overriding data set.
   */
  paginate(data = null) {
    if (data) this.data = data
    this.pageCount = this.data.length / this.pageSize - 1
    this.page = this.data.slice(this.pageIndex*this.pageSize).slice(0, this.pageSize)
  }

  /**
   * Check if processor can yield next page.
   * @returns {Bool}
   */
  canNext() {
    return (this.pageIndex < this.pageCount)
  }

  /** Process next page. */
  next() {
    this.pageIndex++
  }

  /**
   * Check if processor can yield previous page.
   * @returns {Bool}
   */
  canPrev() {
    return (this.pageIndex > 0)
  }

  /** Process previous page. */
  prev() {
    this.pageIndex--
  }

}
