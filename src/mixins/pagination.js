export default class Paginator {
  constructor(dataRef, pageSize) {
    this.pageSize = pageSize
    this.paginate(dataRef)
  }
  paginate(dataRef) {
    if (dataRef) {
      this.data = dataRef
      this.pageIndex = 0
    }

    this.pageCount = this.data.length / this.pageSize - 1
    this.page = this.data.slice(this.pageIndex*this.pageSize).slice(0, this.pageSize)
  }
  canNext() {
    return (this.pageIndex < this.pageCount)
  }
  next() {
    this.pageIndex++
  }
  canPrev() {
    return (this.pageIndex > 0)
  }
  prev() {
    this.pageIndex--
  }
}
