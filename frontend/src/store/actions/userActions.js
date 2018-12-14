import axios from 'axios';

import { apiBaseUrl } from './';

export const REGISTER_USER = 'REGISTER_USER';
export const LOGGING_IN_USER = 'LOGGING_IN_USER';
export const LOGGED_IN_USER = 'LOGGED_IN_USER';
export const LOGGING_OUT_USER = 'LOGGING_OUT_USER';
export const LOGGED_OUT_USER = 'LOGGED_OUT_USER';
export const LOGOUT_FLAG = 'LOGOUT_FLAG';
export const PREMIUM_USER = 'PREMIUM_USER';
export const FETCH_USER_DATA = 'FETCH_USER_DATA';
export const USER_DATA_FETCHED = 'USER_DATA_FETCHED';
export const USER_MESSAGE = 'USER_MESSAGE';
export const USER_ERROR = 'USER_ERROR';
export const UPDATING_USER = 'UPDATING_USER';
export const UPDATED_USER = 'UPDATED_USER';

// TODO: If the backend is set up to act as an OAuth2 provider, configure this to register a user.
export const registerUser = newUser => {
	return dispatch => {
		dispatch({ type: REGISTER_USER });
		axios
			.post(apiBaseUrl + '/rest-auth/register/', newUser)
			.then(response =>
				dispatch({
					type: REGISTER_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const loginUser = token => {
	return dispatch => {
		// console.log('login action token:', token);
		dispatch({ type: LOGGING_IN_USER });
		axios
			.post(`${apiBaseUrl}/auth/convert_token/`, { token })
			.then(response =>
				dispatch({
					type: LOGGED_IN_USER,
					payload: response
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const logoutUser = token => {
	return dispatch => {
		dispatch({ type: LOGGING_OUT_USER });
		axios
			.post(`${apiBaseUrl}/auth/revoke_token/`, { token })
			.then(response =>
				dispatch({
					type: LOGGED_OUT_USER,
					payload: response.status
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const logoutFlag = () => {
	return dispatch => {
		dispatch({ type: LOGOUT_FLAG });
	};
};

export const fetchUser = token => {
	return dispatch => {
		dispatch({ type: FETCH_USER_DATA });
		axios({
			method: 'get',
			url: apiBaseUrl + '/auth/rest/user/',
			headers: { Authorization: `Bearer ${token.data.access_token}` }
		})
			.then(response =>
				dispatch({
					type: USER_DATA_FETCHED,
					payload: response.data
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const premiumUser = (user, chargeToken) => {
	return dispatch => {
		dispatch({ type: PREMIUM_USER });
		// axios
		// 	.post(apiBaseUrl + '/something/', chargeToken)
		// 	.then(response =>
		// 		//the payload you're giving the API to populate the new user
		// 		console.log(response)
		// 	)
		// 	.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const updateUser = (user, accessToken) => {
	return dispatch => {
		dispatch({ type: UPDATING_USER });
		let headers = {
			'Content-Type': 'application/json',
			Authorization: `Bearer ${accessToken}`
		};
		axios
			.put(apiBaseUrl + '/auth/rest/user/', user, {
				headers: headers
			})
			.then(response => {
				console.log(response);
				dispatch({ type: UPDATED_USER, payload: response.data });
			})
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};
