import axios from 'axios';

import { apiBaseUrl } from './';

export const REGISTER_USER = 'REGISTER_USER';
export const LOGGING_IN_USER = 'LOGGING_IN_USER';
export const LOGGED_IN_USER = 'LOGGED_IN_USER';
export const LOGOUT_USER = 'LOGOUT_USER';
export const PREMIUM_USER = 'PREMIUM_USER';
export const FETCH_USER_DATA = 'FETCH_USER_DATA';
export const USER_DATA_FETCHED = 'USER_DATA_FETCHED';
export const USER_MESSAGE = 'USER_MESSAGE';
export const USER_ERROR = 'USER_ERROR';
export const UPDATING_USER = 'UPDATING_USER';
export const UPDATED_USER = 'UPDATED_USER';

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

export const loginUser = user => {
	return dispatch => {
		dispatch({ type: LOGGING_IN_USER });
		axios
			.post(apiBaseUrl + '/rest-auth/login/', user)
			.then(response =>
				dispatch({
					type: LOGGED_IN_USER,
					payload: response
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

// TODO: Update logoutUser function once there's a better understanding of how the backend will respond
export const logoutUser = user => {
	return dispatch => {
		dispatch({ type: LOGOUT_USER });
		axios
			.post(apiBaseUrl + '/rest-auth/logout/', user)
			.then(response =>
				dispatch({
					type: LOGOUT_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

export const fetchUser = token => {
	return dispatch => {
		dispatch({ type: FETCH_USER_DATA });
		axios({
			method: 'get',
			url: apiBaseUrl + '/rest-auth/user/',
			headers: { Authorization: 'Token ' + token }
		})
			.then(response =>
				dispatch({
					type: USER_DATA_FETCHED,
					payload: response
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

export const updateUser = user => dispatch => {
	dispatch({ type: UPDATING_USER });
	axios
		.put(apiBaseUrl + '/user/')
		.then(response => dispatch({ UPDATED_USER, payload: response.data }))
		.catch(err => dispatch({ type: USER_ERROR, err }));
};
