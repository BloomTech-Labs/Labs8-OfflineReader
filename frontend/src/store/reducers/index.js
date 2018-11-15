import * as combineReducers from 'redux';
import * as userReducers from './userReducers';
import * as articleReducers from './articleReducers';

export default combineReducers({
	userReducers,
	articleReducers
});
