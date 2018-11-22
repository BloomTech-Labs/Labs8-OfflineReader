import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import { Provider } from 'react-redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import { Route, Switch } from 'react-router-dom';
import LandingPage from './containers/HomeContainer';
import Navbar from './containers/NavbarContainer';
import ArticleList from './containers/Secret/ArticleListContainer';
import { PrivateRoute } from './customRoutes/ProtectedRoutes';
import rootReducer from './reducers';
import auth_tokens_mw from './customMiddleware/auth_tokens_mw';

/* Adding React-Router-Redux so I can use dispatch(push('/'))
    in the middleware
*/
import createHistory from 'history/createBrowserHistory';
import { ConnectedRouter, routerMiddleware } from 'react-router-redux';

// import styled from 'styled-components';

// Create a history of your choosing (we're using a browser history in this case)
const history = createHistory();
const routMiddleware = routerMiddleware(history);

let store = createStore(
	rootReducer,
	composeWithDevTools(
		applyMiddleware(routMiddleware, auth_tokens_mw, thunk, logger)
	)
);

if (localStorage.getItem('goog_access_token_conv')) {
	store.dispatch({ type: 'GOOG_AUTHENTICATE_ACTION' });
}

ReactDOM.render(
	<Provider store={store}>
		<ConnectedRouter history={history}>
			<div>
				<Navbar />
				<Switch>
					{/* Go to landing page if not logged in */}
					<Route exact path="/" component={LandingPage} />
					{/* Go to article list if logged in */}
					<PrivateRoute exact path="/secret" component={ArticleList} />
				</Switch>
			</div>
		</ConnectedRouter>
	</Provider>,
	document.getElementById('root')
);
