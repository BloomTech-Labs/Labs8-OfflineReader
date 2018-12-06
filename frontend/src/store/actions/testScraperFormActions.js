import axios from 'axios';
import { apiBaseUrl } from './';
import localforage from 'localforage';
export const FETCHING_PAGES = 'FETCHING_PAGES';
export const PAGES_FETCHED = 'PAGES_FETCHED';
export const PAGES_FETCH_ERROR = 'PAGES_FETCH_ERROR';

export const FETCHING_OFFLINE_PAGES = 'FETCHING_OFFLINE_PAGES';
export const OFFLINE_PAGES_FETCHED = 'OFFLINE_PAGES_FETCHED';
export const OFFLINE_PAGES_FETCH_ERROR = 'OFFLINE_PAGES_FETCH_ERROR';

export const SAVING_OFFLINE_PAGE = 'SAVING_OFFLINE_PAGE';
export const OFFLINE_PAGE_SAVED = 'OFFLINE_PAGE_SAVED';
export const OFFLINE_PAGE_SAVE_ERROR = 'OFFLINE_PAGE_SAVE_ERROR';

export const INITIALIZE_URL_SUBMIT = 'INITIALIZE_URL_SUBMIT';
export const COMPLETE_URL_SUBMIT = 'COMPLETE_URL_SUBMIT';
export const SUBMIT_URL_ERROR = 'SUBMIT_URL_ERROR';

export const fetchPages = serverToken => {
	return dispatch => {
		//Action that indicates data is being fetched
		dispatch({ type: FETCHING_PAGES });
		let headers = {
			'Content-Type': 'application/json',
			Authorization: `Bearer ${serverToken.data.access_token}`
		};
		axios
			.get(`${apiBaseUrl}/pages/`, {
				headers: headers
			})
			.then(response => {
				dispatch({
					type: PAGES_FETCHED,
					payload: response.data
				});
			})
			.catch(err => {
				// If statement to determine if the error code was for offline situations

				//placeholder "if statement"
				let isOffline = false;
				//// If determined that user is offline:
				if (isOffline) {
					dispatch({ type: FETCHING_OFFLINE_PAGES });

					localforage
						.iterate(function(value, key, iterationNumber) {
							let offlinePageArray = [];
							offlinePageArray.push([key, value]);
							// Resulting key/value pair -- this callback
							// will be executed for every item in the
							// database.
							console.log([key, value]);
						})
						.then(response => {
							dispatch({
								type: OFFLINE_PAGES_FETCHED,
								payload: response.data
							});
							console.log('Iteration has completed');
						})
						.catch(function(err) {
							// This code runs if there were any errors
							dispatch({ type: OFFLINE_PAGES_FETCH_ERROR });
							console.log(err);
						});
					/////
				}

				console.error(err);
				dispatch({ type: PAGES_FETCH_ERROR });
			});
	};
};

export const sendUrl = (newURL, serverToken) => {
	return dispatch => {
		//Again, action to indicate an API call is about to be made, this time for a POST
		dispatch({ type: INITIALIZE_URL_SUBMIT });
		//Below, you're making the POST call to the API, with newURL as the object youre sending.
		let headers = {
			'Content-Type': 'application/json',
			Authorization: `Bearer ${serverToken.data.access_token}`
		};
		axios
			.post(`${apiBaseUrl}/api/scrape/`, newURL, {
				headers: headers
			})
			.then(response => {
				//When POST is successful, the dispatch then sends an action (COMPLETE_URL_SUBMIT, and associated data, which in this case is the payload with response.data that includes the new url added)
				dispatch({ type: COMPLETE_URL_SUBMIT, payload: response.data });

				axios
					.get(`${apiBaseUrl}/pages/`, {
						headers: headers
					})
					.then(response => {
						//// offline storage logic
						console.log(response.data[0]);
						let offlinePage = response.data[0];
						localforage
							.setItem(offlinePage.id, offlinePage)
							.then(function(value) {
								dispatch({ type: OFFLINE_PAGE_SAVED, payload: response.data });
								// Do other things once the value has been saved.
								console.log('offlinePage just created:', value);
							})
							.catch(function(err) {
								// This code runs if there were any errors
								console.log(err);
							});
						/////////

						dispatch({
							type: PAGES_FETCHED,
							payload: response.data
						});
					});
			})
			.catch(err => {
				////
				console.error(err);
				dispatch({ type: SUBMIT_URL_ERROR });
			});
	};
};
