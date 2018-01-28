<localize>
  <script type="es6">
    const self = this

    self.localization = function() {
      if (!self.opts.attr)
        self.root.innerHTML = self.localize.localize(self.opts.item)
      else
        self.root.setAttribute(self.opts.attr, self.localize.localize(self.opts.item))
    }

    self.on('mount', self.localization)
    self.localize.on('updated', self.localization)
  </script>
</localize>
