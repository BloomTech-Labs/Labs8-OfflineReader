// Based loosly on https://redux.js.org/recipes/configuringyourstore
import { createStore, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import { composeWithDevTools } from 'redux-devtools-extension';

import rootReducer from './reducers';

// A note to future devs that update this. By default, CRA recognizes 3 values for
// process.env.NODE_ENV: development, test, and production. You can read more about
// environment variables with CRA at
// https://medium.com/@tacomanator/environments-with-create-react-app-7b645312c09d

// generates the configuration for and returns a purpose-built store for redux to use
// preloadedState is in place in case we want to feed in test data later.
export default preloadedState => {
	// collect our middleware into a central applyMiddleware redux method
	const middlewares = [thunk];
	if (process.env.NODE_ENV !== 'production') {
		middlewares.push(logger);
	}
	const middlewareEnhancer = applyMiddleware(...middlewares);

	// grab all the middleware and any enhancers for the store
	const enhancers = [middlewareEnhancer];

	// feed all the middleware and enhancers to a store composer based on the environment
	let composedEnhancers;
	if (process.env.NODE_ENV === 'production') {
		composedEnhancers = compose(...enhancers);
	} else {
		composedEnhancers = composeWithDevTools(...enhancers);
	}

	// yay! we have a store!
	return createStore(rootReducer, preloadedState, composedEnhancers);
};
