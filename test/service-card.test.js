describe('service-card tag', function() {
  beforeEach(function() {
    // # karma won't restart browser between tests
    // # riot stores tags in some global
    // # clean up previous test and bootstrap environment
    riot.util.vdom.forEach(v => v.unmount())
    const card = document.querySelector('service-card')
    if (card)
      card.remove()
    document.body.appendChild(document.createElement('service-card'))
    riot.mount('service-card')
  })
  it('should contain header', function() {
    expect(document.querySelector('h1')).not.to.be.null
  })
})
