import axios from 'axios';
import { apiBaseUrl } from './';
import localforage from 'localforage';
export const FETCHING_PAGES = 'FETCHING_PAGES';
export const PAGES_FETCHED = 'PAGES_FETCHED';
export const PAGES_FETCH_ERROR = 'PAGES_FETCH_ERROR';

export const FETCHING_OFFLINE_PAGES = 'FETCHING_OFFLINE_PAGES';
export const OFFLINE_PAGES_FETCHED = 'OFFLINE_PAGES_FETCHED';
export const OFFLINE_PAGES_FETCH_ERROR = 'OFFLINE_PAGES_FETCH_ERROR';

export const FETCHING_SPECIFIC_OFFLINE_PAGE = 'FETCHING_SPECIFIC_OFFLINE_PAGE';
export const SPECIFIC_OFFLINE_PAGE_FETCHED = 'SPECIFIC_OFFLINE_PAGE_FETCHED';
export const ERROR_FETCHING_SPECIFIC_OFFLINE_PAGE =
	'ERROR_FETCHING_SPECIFIC_OFFLINE_PAGE';

export const SAVING_OFFLINE_PAGE = 'SAVING_OFFLINE_PAGE';
export const OFFLINE_PAGE_SAVED = 'OFFLINE_PAGE_SAVED';
export const OFFLINE_PAGE_SAVE_ERROR = 'OFFLINE_PAGE_SAVE_ERROR';

export const INITIALIZE_URL_SUBMIT = 'INITIALIZE_URL_SUBMIT';
export const COMPLETE_URL_SUBMIT = 'COMPLETE_URL_SUBMIT';
export const SUBMIT_URL_ERROR = 'SUBMIT_URL_ERROR';
export const CLEAR_PAGES = 'CLEAR_PAGES';

export const fetchPages = serverToken => {
	return dispatch => {
		//Action that indicates data is being fetched
		dispatch({ type: FETCHING_PAGES });
		let headers = {
			'Content-Type': 'application/json',
			Authorization: `Bearer ${serverToken.data.access_token}`
			// TODO: switch back after show and tell
			// Authorization: `Token e5f6efffdaf49d83381c94a7a322266e77013428` Production
			// Authorization: `Token b4d264e2006c6e3b64fddd764c75eb6646b8dc8b` Localhost
		};
		axios
			.get(`${apiBaseUrl}/api/pages/`, {
				headers: headers
			})
			.then(response => {
				dispatch({
					type: PAGES_FETCHED,
					payload: response.data
				});
			})
			.catch(err => {
				// //Determine user is offline, fetch stored offline pages
				dispatch({ type: FETCHING_OFFLINE_PAGES });
				let offlinePageArray = [];
				localforage
					.iterate(function(value, key, iterationNumber) {
						console.log('offlinepage value is:' + value);

						offlinePageArray.push(value);
						console.log('offlinePageArray is:' + offlinePageArray);
						// Resulting key/value pair -- this callback
						// will be executed for every item in the
						// database.
					})
					.then(offlinePageArray => {
						dispatch({
							type: OFFLINE_PAGES_FETCHED,
							payload: offlinePageArray
						});
						console.log('Iteration has completed');
					})
					.catch(function(err) {
						// This code runs if there were any errors
						dispatch({ type: OFFLINE_PAGES_FETCH_ERROR });
						console.log(err);
					});
				// 	localforage
				// 		.iterate(function(value, key, iterationNumber) {
				// 			let offlinePageArray = [];
				// 			offlinePageArray.push([key, value]);
				// 			// Resulting key/value pair -- this callback
				// 			// will be executed for every item in the
				// 			// database.
				// 			console.log([key, value]);
				// 		})
				// 		.then(offlinePageArray => {
				// 			dispatch({
				// 				type: OFFLINE_PAGES_FETCHED,
				// 				payload: offlinePageArray
				// 			});
				// 			console.log('Iteration has completed');
				// 		})
				// 		.catch(function(err) {
				// 			// This code runs if there were any errors
				// 			dispatch({ type: OFFLINE_PAGES_FETCH_ERROR });
				// 			console.log(err);
				// 		});

				console.error(err);
				dispatch({ type: PAGES_FETCH_ERROR });
			});
	};
};

export const fetchSpecificOfflinePage = (serverToken, pageId) => {
	return dispatch => {
		dispatch({
			type: FETCHING_SPECIFIC_OFFLINE_PAGE
		});

		localforage
			.getItem(pageId)
			.then(function(value) {
				// This code runs once the value has been loaded
				// from the offline store.
				dispatch({
					type: SPECIFIC_OFFLINE_PAGE_FETCHED,
					payload: value
				});
				console.log(value);
			})
			.catch(function(err) {
				dispatch({
					type: ERROR_FETCHING_SPECIFIC_OFFLINE_PAGE
				});
				// This code runs if there were any errors
				console.log(err);
			});
	};
};

export const sendUrl = (newURL, serverToken) => {
	return dispatch => {
		dispatch({ type: INITIALIZE_URL_SUBMIT });
		//Below, you're making the POST call to the API, with newURL as the object you're sending.
		let headers = {
			'Content-Type': 'application/json',
			Authorization: `Bearer ${serverToken.data.access_token}`
			// TODO: switch back after show and tell
			// Authorization: `Token b4d264e2006c6e3b64fddd764c75eb6646b8dc8b`
		};
		axios
			.post(`${apiBaseUrl}/api/scrape/`, newURL, {
				headers: headers
			})
			.then(response => {
				//When POST is successful, the dispatch then sends an action (COMPLETE_URL_SUBMIT, and associated data, which in this case is the payload with response.data that includes the new url added)
				dispatch({ type: COMPLETE_URL_SUBMIT, payload: response.data });
				axios
					.get(`${apiBaseUrl}/api/pages/`, {
						headers: headers
					})
					.then(response => {
						dispatch({
							type: PAGES_FETCHED,
							payload: response.data
						});

						console.log('completed url submit and moving on');
						// const saveOfflinePage = function() {
						// 	console.log('response.data[0] is:', response.data[0]);
						// 	let offlinePage = response.data[0];
						// 	localforage
						// 		.setItem(offlinePage.id, offlinePage)
						// 		.then(function(value) {
						// 			dispatch({ type: OFFLINE_PAGE_SAVED, payload: value });
						// 			// Do other things once the value has been saved.
						// 			console.log('offlinePage just created:', value);
						// 		})
						// 		.catch(function(err) {
						// 			console.log(err);
						// 		});
						// 	/////////
						// };
						console.log('defined saveOfflinePage fxn');
						console.log('new url is:' + newURL.url);
						//if the url being saved is youtube or vimeo//
						// offline storage logic for non video websites
						if (newURL.url.includes('youtube')) {
							console.log('saving offline media');
							let offlineMedia = response.data.reverse()[0];
							axios
								.get(
									`https://www.saveoffline.com/process/?url=${
										newURL.url
									}&type=json`
								)
								.then(response => {
									//create an offlinePage object of the video/audio
									let offlineMediaStream = response.data.urls[0].id;
									console.log('offlineMediaStream is:' + offlineMediaStream);
									localforage
										.setItem(offlineMedia.id.toString(), offlineMediaStream)
										.then(function(value) {
											dispatch({ type: OFFLINE_PAGE_SAVED, payload: value });
											// Do other things once the value has been saved.
											console.log('offlinePage just created:', value);
										})
										.catch(function(err) {
											console.log(err);
										});
								});
						} else {
							console.log('saving offline page');

							console.log('response.data[0] is:', response.data.reverse()[0]);
							let offlinePage = response.data.reverse()[0];
							localforage
								.setItem(offlinePage.id, offlinePage)
								.then(function(value) {
									dispatch({ type: OFFLINE_PAGE_SAVED, payload: value });
									// Do other things once the value has been saved.
									console.log('offlinePage just created:', value);
								})
								.catch(function(err) {
									console.log(err);
								});
							///////
						}
					});
			})
			.catch(err => {
				////
				console.error(err);
				dispatch({ type: SUBMIT_URL_ERROR });
			});
	};
};

// Cleans up the testScraperFormReducers state when logging out
export const clearPages = () => {
	return dispatch => dispatch({ type: CLEAR_PAGES });
};
