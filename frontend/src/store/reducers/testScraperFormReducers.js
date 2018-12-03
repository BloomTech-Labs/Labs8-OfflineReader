/*
  Be sure to import in all of the action types from `../actions`
*/
import {
	FETCHING_PAGES,
	PAGES_FETCHED,
	PAGES_FETCH_ERROR,
	INITIALIZE_URL_SUBMIT,
	COMPLETE_URL_SUBMIT,
	SUBMIT_URL_ERROR
} from '../actions';

const initialState = {
	pages: [],
	fetchingPages: false,
	pagesFetched: false,
	scraperResponse: [],
	sendingURL: false,
	error: '',
	showingModal: false
};

export const testScraperFormReducers = (state = initialState, action) => {
	switch (action.type) {
		case FETCHING_PAGES:
			return { ...state, fetchingPages: true };
		case PAGES_FETCHED:
			return {
				...state,
				pages: action.payload.reverse(),
				fetchingPages: false,
				pagesFetched: true
			};
		case PAGES_FETCH_ERROR:
			return {
				...state,
				error: 'Error fetching pages'
			};
		case INITIALIZE_URL_SUBMIT:
			return {
				...state,
				sendingURL: true
			};
		case COMPLETE_URL_SUBMIT:
			return {
				...state,
				sendingURL: false,
				scraperResponse: action.payload
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
