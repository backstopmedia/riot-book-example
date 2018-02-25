<sidebar>
  <ul>
    <li><a click={changeRoute} path="foo">Foo</a></li>
    <li><a click={changeRoute} path="bar">Bar</a></li>
    <li><a click={changeRoute} path="foo/bar">Foo/Bar</a></li>
  </ul>

  <style scoped>
    a {
      cursor: pointer;
      text-decoration: underline;
    }
  </style>
  <script>
    changeRoute(e) {
      // change the url to whatever is in the 'path' attribute on the anchor
      route(e.target.getAttribute('path'))
    }
  </script>
</sidebar>
