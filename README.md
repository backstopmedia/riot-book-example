# riot-book-example

A sample DevOps dashboard application for Riot.js.

> **Note**: There are additional examples within the examples directory by [John Nolette](https://github.com/neetjn) and [Joseph A. Szczesniak](https://github.com/nukapunk).
> - [**Server Sided Rendering**](https://github.com/backstopmedia/riot-book-example/tree/master/examples/ssr-example)
> - [**SVG**](https://github.com/backstopmedia/riot-book-example/tree/master/examples/svg-example)

## Technologies

* Riot 3
* riot-animore (official anime.js bindings for Riot)
* Webpack (for bundling)
* Express (for serving application)
* Karma / Mocha (testing components)
* Bulma, Fontawesome, Anime.css (css frameworks for styling)

## Setting Up

Use the following command to install this project's dependencies:

```bash
npm install
```

## Running Application

To simply serve the application:

```bash
npm start
```

To build, test, and serve the application:

```bash
npm run build
```

The application is served on port 8080.

### Docker

```bash
docker build . -t dashboard
docker run --rm -p 8080:8080 dashboard
```

## Running Tests

We use Karma, Mocha, and Electron for testing our components.

To lint our code:

```bash
npm run lint
```

To unit test our components:

```bash
npm run test:unit
```

To run all tests:

```bash
npm test
```

---

Copyright (c) 2017 John Nolette, Bleeding Edge Press Licensed under the MIT license.
