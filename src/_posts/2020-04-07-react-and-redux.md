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

```jsx
import React from 'react';

class MyComponent() extends React.Component{
    render() {
        return (
            <div>
                <h1>Hello World!</h1>
            </div>
        );
    }
}
```

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

### Dynamic Rendering

But this in itself is not a very interesting behavior. After all, if we wanted a simple static website to say "Hello", we could just write our own HTML to do so with less effort. Where React really begins to provide value is when we couple the rendering of particular components with business logic and user-initiated behaviors to dynamically choose _what_ to render, and _when_. Let's take a contrived example:

```jsx
import React from 'react';

class MyComponent() extends React.Component{
    updateGreetee(event) {
        this.setState({
            user: event.target.value
        });
    }

    render() {
        return (
            <div>
                <input
                    type='text'
                    value={this.state.user}
                    onChange={this.updateGreetee}
                />
                <h1>Hello {this.state.user}!</h1>
            </div>
        );
    }
}
```



---

### Additional Resources

* [React.js Homepage](https://reactjs.org/)
* [Redux.js Homepage](https://redux.js.org/)
* [React-Redux.js Homepage](https://react-redux.js.org/)