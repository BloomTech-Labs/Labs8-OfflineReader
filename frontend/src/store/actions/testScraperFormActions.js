import axios from 'axios';
import { apiBaseUrl } from './';

export const FETCHING_PAGES = 'FETCHING_PAGES';
export const PAGES_FETCHED = 'PAGES_FETCHED';
export const PAGES_FETCH_ERROR = 'PAGES_FETCH_ERROR';
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
				// console.log('response:', JSON.stringify(response.data));

				dispatch({
					type: PAGES_FETCHED,
					payload: response.data
				});
			})
			.catch(err => {
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
						// console.log('response:', JSON.stringify(response.data));

						dispatch({
							type: PAGES_FETCHED,
							payload: response.data
						});
					});
			})
			.catch(err => {
				console.error(err);
				dispatch({ type: SUBMIT_URL_ERROR });
			});
	};
};
