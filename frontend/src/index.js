import React from 'react';
import ReactDOM from 'react-dom';
import { App } from './components/index';
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
// import { BrowserRouter as Router } from 'react-router-dom';
import { combineReducers } from './store/reducers';

// import * as serviceWorker from './serviceWorker';

const store = createStore(combineReducers, applyMiddleware(thunk, logger));
ReactDOM.render(
	<Provider store={store}>
		<App />
	</Provider>,
	document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
// serviceWorker.unregister();
