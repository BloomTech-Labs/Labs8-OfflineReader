import { combineReducers } from 'redux';
import userReducers from './userReducers';
import articleReducers from './articleReducers';
import testScraperFormReducers from './testScraperFormReducers';

export default combineReducers({
	userReducers,
	articleReducers,
	testScraperFormReducers
});
