describe('given a service-card tag', function() {

  beforeEach(function() {
    document.body.appendChild(document.createElement('service-card'))
    riot.mount('service-card', 'servicecard', {
      service: MOCKS.services[0]
    })
  })

  afterEach(function() {
    document.querySelector('service-card')._tag.unmount()
  })

  it('should properly display service name', function() {
    var serviceName = document.querySelector('h1')
    expect(serviceName.textContent).to.equal(MOCKS.services[0].name.toUpperCase())
  })

  it('should properly draw a chart on mount and update', function(done) {
    setInterval(function() {
      if (document.querySelector('.chartjs-size-monitor'))
        done()
    }, 250)
  })

  it('should properly change build mode', function(done) {
    var viewButton = document.querySelector('button')
    expect(viewButton.innerText).to.equal('CPU')
    viewButton.dispatchEvent(new MouseEvent('click'))
    expect(viewButton.innerText).to.equal('BUILDS')
    setInterval(function() {
      if (document.querySelector('.chartjs-size-monitor'))
        done()
    }, 250)
  })

})
