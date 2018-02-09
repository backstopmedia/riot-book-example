<hello-world>
  <h1>Hello {opts.name}!</h1>

  <input type="text" name="name" ref="name" />
  <button onclick={updateName}>Update name</button>

  <script>
    this.updateName = () => {
      this.opts.name = this.refs.name.value
    }
  </script>
</hello-world>