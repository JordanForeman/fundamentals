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

Let's break down what we've added to accomplish this:

#### Initializing State in the Constructor

We'll talk shortly about tooling for more advanced state management, however, React components are capable of maintaining their own internal [component state](https://reactjs.org/docs/faq-state.html) that, for simple use-cases like the ones we're working through should suffice. 

Since everything in JavaScript is, at its core, an object we can think of our component state in much the same way. By initializing an instance property `state` on our component during as part of its `constructor`, we tell React that this component is _stateful_, and that it should respond to changes to its state. You can think of `state` as a kind-of _reserved_ term in React components.

#### Modifying State

The React `Component` superclass exposes behaviors for modifying and accessing state that can and should be used to keep state updated in response to events occurring. In the example above, we create an instance method, `updateGreetee` that uses the `Component` superclass' `setState` method to update the value of `state.user` to whatever the value of a given DOM event is. 

We're then able to use our `updateGreetee` event handler as the `onChange` prop for a generic HTML text input. Now, whenever the `input` would fire a `change` event, our component will be able to parse that event and modify its own state accordingly. 

#### Rendering Based on State

Just like when rendering based on `this.props`, components can also render values from `this.state` and will automatically be re-rendered when the React engine sees a change. By setting our `Hello` component's `user` prop to `this.state.user`, we ensure that the text printed in our `<h1>` is always whatever is in our state (which itself will always match what is in our text box). 

### Conclusion: React

By combining just a few core concepts of the React ecosystem, we're able to create highly composable and dynamic component trees and easily swap them in and out of our rendered DOM. State management and (perhaps more importantly) composability are two essentail concepts to working with React and are significant factors in its popularity as a framework for building web applications. 

By enabling us to separate concerns of various nodes of the render tree, React empowers developers to design and maintain highly scalable codebases and work far more effectively over time and with others. Its ability to rerender any individual branch of the DOM node tree in response to changes in things such as `props` or `state` make it possible to create highly interactive application experiences in the browser.

## Redux

Now that we have a basic understanding of React's rendering and reactivity, its important to talk in more detail about state management.

We've already seen how React components themselves are capable of managing their own state objects and using those as part of their render logic. However, as your application grows in scope and size, you'll likely find yourself needing to access the state of one component from another that is much further above in the DOM tree than its direct parent (as seen above) or even completely unrelated. 

While its possible to work around these limitations with React alone, the cost of moving state management further and further up the component tree every time access patterns need to change is seldom one that a team of developers working on a large application would want to pay. Its for this reason that tools like Redux exist.

### Do One Thing, and Do It Well

React's greatest strength is its reactive rendering engine. By removing the burden of state management from our React components and moving that responsibility elsewhere, we can keep our React components clean and responsible for what they're good at - rendering DOM nodes. Because our application itself still needs some sort of stateful awareness, we can use a tool like Redux (or MobX, or ReactiveX, or...) to handle that.

By taking these two interrelated (but distinct) concerns - state management and render - and using a dedicated tool for each, we remove any need to sacrifice efficacy in addressing one concerns for the shortcomings of the library used to implement the other.

### Managing a Redux Store

Again, Redux takes the concept of state management and removes it from the shackles of our component hierarchy. Rather than having small pockets of state scattered throughout a few React components, we instead manage state independently as one single isolated entity - in the case of Redux, our Redux store.

A [Redux Store](https://redux.js.org/basics/store) at its most basic can be understood as a mechanism for managing state. A store will have two features that we'll use for the sake of this lesson:

* `state` - an object that represents our current state. Can be as complex or simple as you'd like
* `dispatch` - an interface for applying [`actions`](https://redux.js.org/basics/actions) to our `state` that change it over time

#### Actions

For example, let's say our Redux store manages a person's name. It might have a `state` object that looks like so:

```json
{
    "firstName": "Jordan",
    "lastName": "Foreman"
}
```

And let's say that I decide I don't really like my last name and want to change it. I might want to `dispatch` an `action` to my store that tells its that my `lastName` is now `Escobar` (no relation). We might see something like:

```js
const action = {
    type: 'Update Last Name',
    lastName: 'Escobar'
};

store.dispatch(action);
```

In the snippet above, we've "dispatched" an action object to our store with a distinct `type` and the `lastName` value that we'd like our state updated to reflect. At the moment, nothing would happen. We're still missing one crucial ingredient:

#### Reducers

Because our state is likely far more complicated than our contrived example above, we can't just make actions and assume that Redux can know what to do with them. We need to create [`reducers`](https://redux.js.org/basics/reducers) that interpret the `actions` that have been dispatched and respond accordingly. For example:

```js
function myReducer(state, action) {
    if (action.type === 'Update Last Name') {
        return {
            ...state,
            lastName: action.lastName
        };
    }

    return state;
}
```

We now have a `reducer` that knows how to respond when it receives an action with a type of `Update Last Name`, and returns an object that mirrors the current `state`, but with the `lastName` updated to reflect what the `action` says it should. This is how we update our store's state.

You might notice that we've not actually defined the shape that our state takes. Redux does this inherently by executing all reducers that have been associated to a store at startup, and using the output object as the basis for the rest of our application. At startup, our reducer above will be run, and because `state` is initially `undefined`, it will continue to be so until our reducer is dispatched an action with a matching type.

<p align='center'>
    <strong>:exclamation: important :exclamation:</strong>
</p>

You'll notice that our reducer doesn't actually _modify_ the state that it receives, but rather returns an entirely new object each time that it's executed. This is a core tenant of functional programming, and one that we won't dive into here. Suffice to say that our reducers never actually change anything - they always create a new repesentation of what our state should look like and `return` it.

#### Action Creators

A common pattern for `action` objects is to write are referred to as `Action Creators`. These are dedicated functions that are responsible for constructing `action` objects on-the-fly and can be used as a simple utility for when the same action is dispatched from various parts of our code:

```js
function changeLastName(lastName) {
    return {
        type: 'Update Last Name',
        lastName
    };
}

dispatch(changeLastName('Escobar'));
```

### The Dux Pattern

Another pattern that I'm particularly partial to is called [`Ducks`](https://github.com/erikras/ducks-modular-redux) (or, the Dux pattern). It aims to consolidate actions and reducers into a single place so as to reason about individual pieces of state on their own. By leveraging Redux's `combineReducers` method, we can then merge multiple "Dux" into on giant Redux store. 

To take our "name" example and overcomplicate it just a bit, let's do this:

```
/state
| - index.js
| - firstName.js
| - lastName.js
```

Where our `state` will represent our original object (`{firstName, lastName}`) and be a collection of two reducers: one for each name. We compose the two like so:

```js
// state/index.js
import {combineReducers} from 'redux';
import firstName from './firstName.js';
import lastName from './lastName.js';

export default combineReducers({
    firstName,
    lastName
});
```

We'll use `state/index.js` when initializing our Redux store. This will result in reducers defined in both `firstName.js` and `lastName.js` to be executed, and result in an initial state object that looks like so:

```json
{
    "firstName": "whatever is output from firstName.js reducer by default",
    "lastName": "whatever is output from lastName.js reducer by default"
}
```

Now let's take a look at what our `firstName.js` file might look like:

```js
const UPDATE_FIRST_NAME = 'Update First Name';
const DEFAULT_FIRST_NAME = 'Jordan';

export const actions = {
    update: (firstName) => ({
        type: UPDATE_FIRST_NAME,
        firstName
    })
};

export default function (state = DEFAULT_FIRST_NAME, action) {
    if (action.type === UPDATE_FIRST_NAME) {
        return action.firstName;
    }

    return state;
}

export const selectors = {
    getFirstName: state => state.firstName
};
```

Let's break this down:

* Actions
    * Our Dux (duck?) will export an object whose properties are all Action Creators as defined above. 
* Default Export (our reducer)
    * Our reducer will either return something new based on the action, or it will return the current state. If current state is `undefined`, it'll default to `Jordan`.
* Selectors
    * We'll also export a utility method for accessing the `firstName` on our state. Note that the state passed to our selectors is the entire top-level state, whereas our reducer is only concerned with its own "slice" of state.

`lastName.js` should look nearly identical, but with a few more specific implementation details. 

### Conclusion: Redux

This may all seem overly complex for our use case, but remember that is incredibly contrived. Most modern web applications are going to be dealing with much more complex state trees and will need far more complex actions, reducers, and even selectors. Redux (and the dux pattern) provides a strong foundation for implementing these behaviors in a consistent and understandable fashion, albeit with some amount of boilerplate code.

## React-Redux - Putting the Pieces Together

```js
// TODO:
```

---

### Additional Resources

* [React.js Homepage](https://reactjs.org/)
* [Redux.js Homepage](https://redux.js.org/)
* [React-Redux.js Homepage](https://react-redux.js.org/)