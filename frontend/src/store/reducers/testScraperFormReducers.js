/*
  Be sure to import in all of the action types from `../actions`
*/
import {
	INITIALIZE_URL_SUBMIT,
	COMPLETE_URL_SUBMIT,
	SUBMIT_URL_ERROR
} from '../actions/testScraperFormActions';

const initialState = {
	smurfs: [],
	sendingURL: false,
	error: ''
};

export const testScraperFormReducers = (state = initialState, action) => {
	switch (action.type) {
		case INITIALIZE_URL_SUBMIT:
			return {
				...state,
				sendingURL: true
			};
		case COMPLETE_URL_SUBMIT:
			return {
				...state,
				sendingURL: false,
				smurfs: action.payload
			};
		case SUBMIT_URL_ERROR:
			return {
				...state,
				error: 'Error sending URL',
				sendingURL: false
			};
		default:
			return state;
	}
};
