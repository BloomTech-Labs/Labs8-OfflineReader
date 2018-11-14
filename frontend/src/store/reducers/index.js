import { combineReducers } from 'redux';
import userReducers from './userreducers';
import articleReducers from './articlereducers';

export default combineReducers({
	userReducers,
	articleReducers
});
