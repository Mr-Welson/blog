---
date: 2018-11-22 11:32:07
title: React-Router v4.x API
categories:
  - 笔记
tag:
  - react-router
  - js
---



# react-router v4.x API

[react-router 4.x](https://reacttraining.com/react-router/web/guides/quick-start) WEB 版本官网意译，如有不对的地方，欢迎指正。



<!-- more -->



## BrowserRouter

```
import { BrowserRouter } from 'react-router-dom'

<BrowserRouter
  basename={optionalString}
  forceRefresh={optionalBool}
  getUserConfirmation={optionalFunc}
  keyLength={optionalNumber}
>
  <App/>
</BrowserRouter>
```

### basename: string

> ​	当前位置的基准 URL。如果你的页面部署在服务器的二级（子）目录，你需要将 `basename` 设置到此子目录。 正确的 URL 格式是前面有一个前导斜杠，但不能有尾部斜杠。

### getUserConfirmation: fun

> ​	当导航需要确认时执行的函数

### forceRefresh: bool

> ​	当设置为 true 时，在导航的过程中整个页面将会刷新。 只有当浏览器不支持 HTML5 的 history API 时，才设置为 true。

### keyLength: number

> ​	location.key 的长度。默认是 6

### children: node

> ​	渲染 **<u>单一</u> 子组件（元素）**。



## Link

```javascript
import { Link } from 'react-router-dom'

<Link to="/about">关于</Link>

<Link to={{
  pathname: '/courses',
  search: '?sort=name',
  hash: '#the-hash',
  state: { fromDashboard: true }
}}/>
```



### to:  string/object

> ​	需要跳转到的路径(pathname)或地址（location）。

### replace: bool

> ​	当设置为 true 时，点击链接后将使用新地址替换掉访问历史记录里面的原地址。当设置为 false 时，点击链接后将在原有访问历史记录的基础上添加一个新的纪录。默认为 false。



## NavLink

> ​	一种特殊的<Link>，会给当前的URL匹配到元素加上style属性

> ​	A special version of the  <Link> that will add styling attributes to the rendered element when it matches the current URL.

```
import { NavLink } from 'react-router-dom'

<NavLink to="/about">About</NavLink>
```

### activeClassName: string

> ​	激活时的类名

> ​	The class to give the element when it is active. The default given class is active. This will be joined with the className prop.

### activeStyle: object

> ​	激活的样式

> ​	The styles to apply to the element when it is active.

### exact: bool

> ​	严格匹配location’s pathname

> ​	When true, the active class/style will only be applied if the location is matched exactly.

### strict: bool

> ​	是否考虑 location’s pathname 末尾的斜杠

> ​	When true, the trailing slash on a location’s pathname will be taken into consideration when determining if the location matches the current URL. See the <Route strict> documentation for more information.

### isActive: func

> ​	激活时可选的额外逻辑处理

> ​	A function to add extra logic for determining whether the link is active. This should be used if you want to do more than verify that the link’s pathname matches the current URL’s pathname。

## Redirect

> ​	重定向
>
> ​	Rendering a `<Redirect>` will navigate to a new location. The new location will override the current location in the history stack, like server-side redirects (HTTP 3xx) do.

```
import { Route, Redirect } from 'react-router'

<Route exact path="/" render={() => (
  loggedIn ? (
    <Redirect 
      to={{	
          pathname: '/login',
          search: '?utm=your+face',
          state: { referrer: currentLocation }
      }}
    />
  ) : (
    <PublicHomePage/>
  )
)}/>

<Redirect to="/somewhere/else"/>
```

### to:  string/object

> 需要重定向的路径(pathname)或地址（location）。

> The URL to redirect to / A location to redirect to

### push: bool

> ​	When true, redirecting will push a new entry onto the history instead of replacing the current one.

```
<Redirect push to="/somewhere/else"/>
```

### from: string

> ​	当使用< switch > 时 可以指定需要重定向的页面
>
> ​	A pathname to redirect from. This can be used to match a location when rendering a `<Redirect>` inside of a <Switch>

```
<Switch>
  <Redirect from='/old-path' to='/new-path'/>
  <Route path='/new-path' component={Place}/>
</Switch>
```

## Route 

> ​	The Route component is perhaps the most important component in React Router to understand and learn to use well. Its most basic responsibility is to render some UI when a location matches the route’s path.

```
import { BrowserRouter as Router, Route } from 'react-router-dom'

<Router>
  <div>
    <Route exact path="/" component={Home}/>
    <Route path="/news" component={NewsFeed}/>
  </div>
</Router>

// "/":
<div>
  <Home/>
  <!-- react-empty: 2 -->
</div>

// "/news":
<div>
  <!-- react-empty: 1 -->
  <NewsFeed/>
</div>
```

### Route render methods

> ​	渲染Route组件的三种方式
>
> ​	There are 3 ways to render something with a < Route >,  Each is useful in different circumstances. You should use only one of these props on a given < Route >. See their explanations below to understand why you have 3 options. Most of the time you’ll use component.
>
> - < Route component >
> - < Route render >
> - < Route children >

#### component 

>  	A React component to render only when the location matches. It will be rendered with route props.

> ​	当你使用component方式时，Route组件将使用 React.createElement 创建一个新的组件，这意味着，如果你使用了内联函数，组件将会卸载多次，当然你并不希望这样。因此对于内联组件，使用render属性会更好。

> ​	When you use component (instead of render, below) the router uses React.createElement to create a new React element from the given component. That means if you provide an inline function you will get a lot of undesired remounting. For inline rendering, use the render prop (below).

```
<Route path="/user/:username" component={User}/>

const User = ({ match }) => {
  return <h1>Hello {match.params.username}!</h1>
}
```

#### render: function

> ​	
>
> ​	This allows for convenient inline rendering and wrapping without the undesired remounting explained above.Instead of having a new React element created for you using the component prop, you can pass in a function to be called when the location matches. The render prop receives all the same route props as the component render prop.
>
> **Warning:** < Route component >  takes precendence over  < Route render >  so don’t use both in the same < Route > .

```
// convenient inline rendering
<Route path="/home" render={() => <div>Home</div>}/>

// wrapping/composing
const FadingRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={props => (
    <FadeIn>
      <Component {...props}/>
    </FadeIn>
  )}/>
)

<FadingRoute path="/cool" component={Something}/>
```



#### children: function

> ​	Sometimes you need to render whether the path matches the location or not. In these cases, you can use the function children prop. It works exactly like render except that it gets called whether there is a match or not.	
>
> ​	The children render prop receives all the same route props as the component and render methods, except when a route fails to match the URL, then match is null. This allows you to dynamically adjust your UI based on whether or not the route matches. Here we’re adding an active class if the route matches
>
> **Warning:**  Both <Route component> and <Route render> take precendence over <Route children> so don’t use more than one in the same `<Route>`.

```
<ul>
  <ListItemLink to="/somewhere"/>
  <ListItemLink to="/somewhere-else"/>
</ul>

const ListItemLink = ({ to, ...rest }) => (
  <Route path={to} children={({ match }) => (
    <li className={match ? 'active' : ''}>
      <Link to={to} {...rest}/>
    </li>
  )}/>
)

// This could also be useful for animations:
<Route children={({ match, ...rest }) => (
  {/* Animate will always render, so you can use lifecycles
      to animate its child in and out */}
  <Animate>
    {match && <Something {...rest}/>}
  </Animate>
)}/>
```

### Route props

> 每个组件都会传递三个属性：match、location、history

> All three render methods will be passed the same three route props

> - match
> - location
> - history



### path: string

> ​	Any valid URL path that path-to-regexp understands.

```
<Route path="/users/:id" component={User}/>
```

> ​	Routes without a path always match.

### exact: bool

> ​	When true, will only match if the path matches the location.pathname exactly.

| path   | location.pathname | exact   | matches? |
| ------ | ----------------- | ------- | -------- |
| /one   | `/one/two`        | true    | no       |
| `/one` | `/one/two`        | `false` | yes      |

### strict: bool

> ​	When true, a path that has a trailing slash will only match a location.pathname with a trailing slash. This has no effect when there are additional URL segments in the location.pathname.

> **警告:** strict模式可以辨别 location.pathname 末尾的 '/' ，但是为了确保精确匹配，必须同时使用strict模式和exact模式。

> **Warning:** strict can be used to enforce that a location.pathname has no trailing slash, but in order to do this both strict and exact must be true.

| path    | location.pathname | strict? | matches |
| ------- | ----------------- | ------- | ------- |
| /one/   | /one              | true    | no      |
| `/one/` | `/one/`           | true    | yes     |
| `/one/` | /one/two          | true    | yes     |



## Router

> ​	react-router最基础的使用方式，也是所有路由器的常见的底层接口组件。一般的应用程序将使用一个高层的路由器

> ​	The common low-level interface for all router components. Typically apps will use one of the high-level routers instead

- <BrowserRouter>
- <HashRouter>
- <MemoryRouter>
- <NativeRouter>
- <StaticRouter>

### history: object

> ​	A history object to use for navigation.

```
import createBrowserHistory from 'history/createBrowserHistory'

const customHistory = createBrowserHistory()
<Router history={customHistory}/>
```

### children: node

> ​	A single child element to render.

```
<Router>
  <App/>
</Router>
```



## Switch

> Renders the first child `<Route>` or ``<Redirect>`` that matches the location

> ​	Renders the first child `<Route>` or `<Redirect>` that matches the location.How is this different than just using a bunch of `<Route>`s ? `<Switch>`  is unique in that it renders a route exclusively. In contrast, every `<Route>` that matches the location renders inclusively. Consider this code:

```
<Route path="/about" component={About}/>
<Route path="/:user" component={User}/>
<Route component={NoMatch}/>
```

> ​	If the URL is /about, then `<About>`, `<User>`, and `<NoMatch>` will all render because they all match the path. This is by design, allowing us to compose `<Route>`s into our apps in many ways, like sidebars and breadcrumbs, bootstrap tabs, etc.Occasionally, however, we want to pick only one `<Route>` to render. If we’re at /about we don’t want to also match /:user (or show our “404” page). Here’s how to do it with Switch:

```
import { Switch, Route } from 'react-router'
<Switch>
  <Route exact path="/" component={Home}/>
  <Route path="/about" component={About}/>
  <Route path="/:user" component={User}/>
  <Route component={NoMatch}/>
</Switch>
```


> ​	Now, if we’re at /about, `<Switch>` will start looking for a matching `<Route>`. `<Route path="/about"/>` will match and `<Switch>` will stop looking for matches and render `<About>`. Similarly, if we’re at /michael then `<User>` will render.This is also useful for animated transitions since the matched `<Route>` is rendered in the same position as the previous one.

> ​	This is also useful for animated transitions since the matched `` is rendered in the same position as the previous one.

```
<Fade>
  <Switch>
    {/* there will only ever be one child here */}
    <Route/>
    <Route/>
  </Switch>
</Fade>

<Fade>
  <Route/>
  <Route/>
  {/* there will always be two children here,
      one might render null though, making transitions
      a bit more cumbersome to work out */}
</Fade>
```

### children: node

> ​	All children of a <Switch> should be <Route> or <Redirect> elements. Only the first child to match the current location will be rendered.<Route> elements are matched using their path prop and <Redirect> elements are matched using their from prop. A <Route> with no path prop or a <Redirect> with no from prop will always match the current location.

```
<Switch>
  <Route exact path="/" component={Home}/>

  <Route path="/users" component={Users}/>
  <Redirect from="/accounts" to="/users"/>

  <Route component={NoMatch}/>
</Switch>
```

## history





## location

```
// usually all you need
<Link to="/somewhere"/>

// but you can use a location instead
const location = {
  pathname: '/somewhere',
  search: '?some=search-string',
  state: { fromDashboard: true }
}

<Link to={location}/>
<Redirect to={location}/>
history.push(location)
history.replace(location)
```



## match

## matchPath

> ​	This lets you use the same matching code that <Route> uses except outside of the normal render cycle, like gathering up data dependencies before rendering on the server.

```
import { matchPath } from 'react-router'
const match = matchPath('/users/123', {
  path: '/users/:id'
  exact: true,
  strict: false
})
```

### pathname

> ​	The first argument is the pathname you want to match. If you’re using this on the server with Node.js, it would be req.url.

### props

> ​	The second argument are the props to match against, they are identical to the matching props Route accepts:



## withRouter

> 

> ​	You can get access to the history object’s properties and the closest `<Route>`'s match via the withRouter higher-order component. withRouter will re-render its component every time the route changes with the same props as` <Route>` render props: { match, location, history }.

