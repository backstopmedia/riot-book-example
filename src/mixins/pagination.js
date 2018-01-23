export default class Paginator {
  constructor(dataRef, pageSize) {
    this.data = dataRef
    this.pageIndex = 0
    this.pageSize = pageSize
    this.paginate(this.pageIndex)
  }
  paginate(dataRef) {
    if (dataRef)
      this.data = dataRef

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
