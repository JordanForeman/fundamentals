---
published: true
layout: post
title:  React and Redux 101
subtitle: Dynamic Front-End Web Applications
date:   2020-04-06 21:55:28 -0500
category: client
---

![React and Redux](/assets/images/react-and-redux.png)

### Prerequisites

* HTML + CSS
* JavaScript Basics

---

Over the years, the web has evolved from a medium used solely to transmit documents into a fully fledged application platform in its own right. One of the today's most popular tools for building the featureful and dynamic Web Applications (as opposed to web _sites_) is [React.js](https://reactjs.org/). 

However, React is but one tool in our toolbox, and while it is great at managing the rendering and composition of HTML-like UI elements it doesn't solve the other crucial problem of scalable management of application _state_. To solve this different yet related problem, tools like [Redux.js Homepage](https://redux.js.org/) have stepped in to fill the void. Because React and Redux are two distinct tools each in their own right, we'll also need the aptly-named [React + Redux](https://react-redux.js.org/).

This session will aim to be a crash course in understanding and working with these three tools to build a very basic web application. 

## React

[React](https://reactjs.org/) is a JavaScript library primarily (although not exclusively) concerned with creating and maintaining dynamic user interfaces. Whereas traditional websites are typically comprised of static assets (think images, text, and video) modern Web Applications take the medium to the next level by incorporating visual behaviors in reaction to user interactions. React is one of the latest (and most popular) tools used to create these applications. In this section, we'll discuss the basics of creating React applications.

### JSX for Rendering

JSX is a "syntax extension" for the JavaScript language. What this means is that it is not JavaScript _per se_, but rather a superset of the language that incorporates non-standard (but useful) features to enable particular kinds of development. [React embraces JSX](https://reactjs.org/docs/introducing-jsx.html) at the core of its ability to tie application logic to DOM-like element rendering.

What does this mean? In layman's term, it means that we can include HTML-like syntax directly within our JavaScript, and it works!

<p class="codepen" data-height="265" data-theme-id="dark" data-default-tab="js,result" data-user="JordanForeman" data-slug-hash="rNOBRpe" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="React - Basic Rendering Demo">
  <span>See the Pen <a href="https://codepen.io/JordanForeman/pen/rNOBRpe">
  React - Basic Rendering Demo</a> by Jordan Foreman (<a href="https://codepen.io/JordanForeman">@JordanForeman</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

The above code-block is the most basic example of a [React component](https://reactjs.org/docs/react-component.html) that you'll see. At its core, React is simply a mechanism for organizing and composing many different components, each of which result in the rendering of a DOM node and its children (which could, in turn, also be React components).

If we were to render the above React component in a live webpage environment, you'd see embedded in your `<body>` somewhere the JSX markup above, but as pure HTML:

```html
<body>
    <div id='my-react-app'>
        <div>
            <h1>Hello World!</h1>
        </div>
    </div>
</body>
```

### Composition

Let's say that, for whatever reason, we wanted to separate the rendering of our `<h1>` from the rest of our _"application"_. Perhaps we're wanting to separate these two concerns for better code organization, or we plan to reuse the `<h1>` somewhere else. React's leveraging of JSX allows us to use our own components as markup elements, and render them just like any old HTML entity, like so:

<p class="codepen" data-height="435" data-theme-id="dark" data-default-tab="js,result" data-user="JordanForeman" data-slug-hash="ExVYMdW" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="React - Basic Composition Demo">
  <span>See the Pen <a href="https://codepen.io/JordanForeman/pen/ExVYMdW">
  React - Basic Composition Demo</a> by Jordan Foreman (<a href="https://codepen.io/JordanForeman">@JordanForeman</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

Along with allowing us to define our own "custom" elements (which are themselves just nodes of further elements, both custom and classic), we can also provide "child" components with any number of [component props](https://reactjs.org/docs/components-and-props.html) (short for "properties") that can influence the way they render. For example:

<p class="codepen" data-height="480" data-theme-id="dark" data-default-tab="js,result" data-user="JordanForeman" data-slug-hash="YzyKgBv" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="React - Basic Props Demo">
  <span>See the Pen <a href="https://codepen.io/JordanForeman/pen/YzyKgBv">
  React - Basic Props Demo</a> by Jordan Foreman (<a href="https://codepen.io/JordanForeman">@JordanForeman</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

See how our parent `MyComponent` provides its child `Hello` component with a prop called `user` with a value of `'World'`. By changing our `Hello` component ever so slightly, we're able to change the way it renders. We can even render it several times with different values, without having to rewrite much code.

But even this in itself is not a very interesting behavior. After all, if we wanted a simple static website to say "Hello", we could just write our own HTML to do so with less effort.

### Dynamic Rendering

Where React really begins to provide value is when we couple the rendering of particular components with business logic and user-initiated behaviors to dynamically choose _what_ to render, and _when_. Let's take a contrived example:

<p class="codepen" data-height="500" data-theme-id="dark" data-default-tab="js,result" data-user="JordanForeman" data-slug-hash="BaoBbzO" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="React - Basic State Demo">
  <span>See the Pen <a href="https://codepen.io/JordanForeman/pen/BaoBbzO">
  React - Basic State Demo</a> by Jordan Foreman (<a href="https://codepen.io/JordanForeman">@JordanForeman</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

You can edit the text field in the demo above, and see the text change from `Hello World!` to `Hello X!` where `X` is whatever you have currently typed into the text field above it. This is a very simple example of the sort of dynamic value binding that makes React rendering so powerful. 

Let's break down 

---

### Additional Resources

* [React.js Homepage](https://reactjs.org/)
* [Redux.js Homepage](https://redux.js.org/)
* [React-Redux.js Homepage](https://react-redux.js.org/)