/*
  Be sure to import in all of the action types from `../actions`
*/
import {
	FETCHING_PAGES,
	PAGES_FETCHED,
	PAGES_FETCH_ERROR,
	//
	SAVING_OFFLINE_PAGE,
	OFFLINE_PAGE_SAVED,
	OFFLINE_PAGE_SAVE_ERROR,
	//
	FETCHING_OFFLINE_PAGES,
	OFFLINE_PAGES_FETCHED,
	OFFLINE_PAGES_FETCH_ERROR,
	//
	INITIALIZE_URL_SUBMIT,
	COMPLETE_URL_SUBMIT,
	SUBMIT_URL_ERROR,
	CLEAR_PAGES
} from '../actions';

const initialState = {
	pages: [],
	offlinePages: [],
	fetchingPages: false,
	pagesFetched: false,
	scraperResponse: [],
	sendingURL: false,
	savingOfflinePage: false,
	fetchingOfflinePages: false,
	error: ''
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

		case FETCHING_OFFLINE_PAGES:
			return { ...state, fetchingOfflinePages: true };

		case OFFLINE_PAGES_FETCHED:
			return {
				...state,
				offlinePages: action.payload.reverse(),
				fetchingOfflinePages: false,
				offlinePagesFetched: true
			};

		case OFFLINE_PAGES_FETCH_ERROR:
			return {
				...state,
				error: 'Error fetching offline pages'
			};

		///

		case SAVING_OFFLINE_PAGE:
			return { ...state, savingOfflinePage: true };

		case OFFLINE_PAGE_SAVED:
			return {
				...state,
				savingOfflinePage: false
			};

		case OFFLINE_PAGE_SAVE_ERROR:
			return {
				...state,
				error: 'Error saving offline pages'
			};

		//

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

		case CLEAR_PAGES:
			return {
				pages: [],
				fetchingPages: false,
				pagesFetched: false,
				scraperResponse: [],
				sendingURL: false,
				error: ''
			};

		default:
			return state;
	}
};
