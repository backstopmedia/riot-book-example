# Building Apps with Riot

![Riot](https://images-na.ssl-images-amazon.com/images/I/514REfwoOmL.jpg)

This repo contains sample code for the book, "Building Apps with Riot," by [Bleeding Edge Press](https://bleedingedgepress.com). This book provides an outlook on developing websites, web applications, and web components with the Riot framework. Throughout the course of this book you will learn all of the essential aspects of Riot necessary to start hacking away. The book can be purchased [here](https://bleedingedgepress.com/building-apps-with-riot/).

## riot-book-example

A sample DevOps dashboard application for Riot.js.

> **Note**: There are additional examples within the examples directory by [John Nolette](https://github.com/neetjn), [Joseph A. Szczesniak](https://github.com/nukapunk), and [Collin Green](https://github.com/collingreen).

## Technologies

* Riot 3
* riot-animore (official anime.js bindings for Riot)
* Webpack (for bundling)
* Express (for serving application)
* Karma / Mocha (testing components)
* Bulma, Fontawesome, Anime.css (css frameworks for styling)

## Setting Up

> **Warning**: This project was built with Node.js 8 & 10, installing dependencies and or building any bundles may fail using unsupported versions.

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

Copyright (c) 2019 John Nolette, Bleeding Edge Press Licensed under the MIT license.
