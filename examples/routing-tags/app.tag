<app>
  <router>
    <route path="foo..">
      <foobar route="foo"/>
    </route>
    <route path="bar..">
      <foobar route="bar"/>
    </route>
    <route path="..">
      <h2>Route not found!</h2>
    </route>
  </router>
  <ul>
    <li><a href="#foo">Foo</a></li>
    <li><a href="#bar">Bar</a></li>
    <li><a href="#baz">Baz (not found)</a></li>
  </ul>
</app>
