import { combineReducers } from 'redux';
import userReducers from './userReducers';
import articleReducers from './articleReducers';

export default combineReducers({
	userReducers,
	articleReducers
});
