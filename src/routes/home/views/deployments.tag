<Deployments>
  <div class="container is-fluid">
    <div class="columns">
      <div class="column is-12">
        <section class="hero">
          <div class="hero-body">
            <div class="container is-fluid">
              <h1 class="title"
                  data-is="localize"
                  item="deployments.title" />
              <hr />
              <div class="box animated fadeIn">
                <DeployTable services={ opts.services } />
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</Deployments>
