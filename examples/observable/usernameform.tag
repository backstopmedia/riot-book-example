<usernameform>
  <form if={isLoggedIn}>
    <label>Username</label>
    <input ref="username" type="text" value={username}/>
    <button type="button" click={changeUsername}>Change Username</button>
  </form>
  <div if={!isLoggedIn}>You are not currently logged in</div>

  <script>
    this.username = ''
    this.isLoggedIn = false

    this.on('mount', function() {
      this.username = opts.api.getUsername()
      this.isLoggedIn = opts.api.isLoggedIn()
      this.update()
    }.bind(this))

    // listen for username changes and re-render
    opts.api.on('username-updated', function(newUsername) {
      this.username = newUsername
      this.update()
    }.bind(this))

    opts.api.on('logged-out', function() {
      this.isLoggedIn = false
      this.update()
    }.bind(this))

    changeUsername() {
      opts.api.changeUsername(this.refs.username.value)
    }.bind(this)
  </script>
</usernameform>
