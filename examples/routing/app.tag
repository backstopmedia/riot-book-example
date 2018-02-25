<app>
  <sidebar></sidebar>
  <div class="content">
    Current Route: {currentRoute}
  </div>

  <style scoped>
    sidebar {
      float: left;
      width: 150px;
    }

    .content {
      margin-left: 150px;
    }
  </style>

  <script>
    this.currentRoute = ''

    // when the route changes, change `currentRoute` and rerender
    route(function() {
      this.currentRoute = [].slice.call(arguments).join('/')
      this.update()
    }.bind(this))

    // start handling routes immediately, including whatever
    // is currently in the url bar on page load
    route.start(true)

  </script>
</app>
