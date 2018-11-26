import axios from 'axios';

import { apiBaseUrl } from './';

export const REGISTER_USER = 'REGISTER_USER';
export const LOGIN_USER = 'LOGIN_USER';
export const LOGOUT_USER = 'LOGOUT_USER';
export const FETCH_USER_DATA = 'FETCH_USER_DATA';
export const USER_DATA_FETCHED = 'USER_DATA_FETCHED';
export const USER_ERROR = 'USER_ERROR';

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
		dispatch({ type: LOGIN_USER });
		axios
			.post(apiBaseUrl + '/rest-auth/register/', user)
			.then(response =>
				dispatch({
					type: LOGIN_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.catch(err => dispatch({ type: USER_ERROR, err }));
	};
};

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
