riot.tag2('hello-world', '<h1>Hello {opts.name}!</h1> <input type="text" name="name" ref="name"> <button onclick="{updateName}">Update name</button>', '', '', function(opts) {
    this.updateName = () => {
      console.log(this.name)
      this.opts.name = this.refs.name.value
    }
});