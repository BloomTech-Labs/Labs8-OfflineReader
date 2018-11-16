import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';

import googleTokenReducer from './googleAuthReducer';
import articleReducer from './articleReducer';

const rootReducer = combineReducers({
	router: routerReducer,
	goog_auth: googleTokenReducer,
	articles: articleReducer
});

export default rootReducer;
