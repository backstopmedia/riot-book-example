<localize>
  <script type="es6">
    if (!this.opts.attr)
      this.root.innerHTML = this.localize(this.opts.item)
    else
      this.root.setAttribute(this.opts.attr, this.localize(this.opts.item))
  </script>
</localize>
