<About>
  <section class="hero is-primary animated fadeInRight">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          <small><i class="fa fa-info-circle"></i></small> About
        </h1>
        <p data-is="ph" size="lg"></p>
      </div>
    </div>
  </section>
  <section class="hero has-text-centered animated fadeInLeft">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          Maintainers
        </h1>
        <div class="container is-fluid">
          <div class="columns is-multiline">
            <div class="column" each={maintainer in maintainers}>
              <img src={ placeholderImg } width="120">
              <h1><strong>{ maintainer.name }</strong></h1>
              <h1><small>{ maintainer.field }</small></h1>
              <h5>
                <a href={ maintainer.github }>
                  <i class="fa fa-github"></i> Github
                </a>
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="hero is-primary animated fadeInRight">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          <small><i class="fa fa-shopping-cart"></i></small> Buy The Book!
        </h1>
        <p data-is="ph"></p>
      </div>
    </div>
  </section>
  <script type="es6">
    this.maintainers = [
      {
        name: 'John Nolette',
        github: 'https://github.com/neetjn',
        field: 'Full Stack Developer'
      },
      {
        name: 'Jim Sparkman',
        github: 'https://github.com/jimsparkman',
        field: 'Web Developer'
      },
      {
        name: 'Ryan Lee',
        github: 'https://github.com/captchadex',
        field: 'Web Developer'
      },
      {
        name: 'Joseph A. Szczesniak',
        github: 'https://github.com/nukapunk',
        field: 'CTO and Co-Founder of Aurelius Lab, LLC'
      },
      {
        name: 'Collin Green',
        github: 'https://github.com/keeyai',
        field: 'Full Stack Web Developer'
      }
    ]

    this.placeholderImg = require('../assets/images/user.svg')
  </script>
</About>
