<parent>
  <h4>Parent Tag</h4>

  <child ref='girl' name='alice'></child>
  <child ref='boy' name='bob'></child>
  <child ref='girl' name='carol'></child>

  <div>
    <button click={listChildren}>Click To Log Info</button>
  </div>

  <script>
    listChildren() {
      console.log('child tags')
      var childTags = this.tags.child
      for (var i = 0; i < childTags.length; i++) {
        console.log('- ' + childTags[i].opts.name)
      }

      console.log('girls')
      var girlRefs = this.refs.girl
      for (var i = 0; i < girlRefs.length; i++) {
        console.log('- ' + girlRefs[i].opts.name)
      }
    }
  </script>
</parent>
