<header>
  <h4>You are logged in as {username}</h4>
  <script>
    this.username = ''

    this.on('mount', function() {
      this.username = opts.api.getUsername()
      this.update()
    }.bind(this))

    // listen for username changes and re-render
    opts.api.on('username-updated', function(newUsername) {
      this.username = newUsername
      this.update()
    }.bind(this))
  </script>
</header>
