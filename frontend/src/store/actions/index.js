/* eslint-disable prettier/prettier */
import axios from 'axios';
export const REGISTER_USER = 'REGISTER_USER';
export const LOGIN_USER = 'LOGIN_USER';
export const LOGOUT_USER = 'LOGOUT_USER';
export const ADD_ARTICLE = 'ADD_ARTICLE';
export const DELETE_ARTICLE = 'DELETE_ARTICLE';
export const FETCH_DATA = 'FETCH_DATA';
export const DATA_FETCHED = 'DATA_FETCHED';
export const ERROR = 'ERROR';

export const registerUser = user => {
	return dispatch => {
		dispatch({ type: FETCH_DATA });
		axios
			.post('https://anywhere-reader-test.herokuapp.com/api/users', user)
			.then(response =>
				dispatch({
					type: REGISTER_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.then(
				// Re-GET all the notes, with the newly added one included
				axios
					.get('https://anywhere-reader-test.herokuapp.com/api/users')
					.then(response =>
						dispatch({ type: DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ERROR, err }));
	};
};

export const loginUser = user => {
	return dispatch => {
		dispatch({ type: FETCH_DATA });
		axios
			.post('https://anywhere-reader-test.herokuapp.com/api/users', user)
			.then(response =>
				dispatch({
					type: LOGIN_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.then(
				// Re-GET all the notes, with the newly added one included
				axios
					.get('https://anywhere-reader-test.herokuapp.com/api/users')
					.then(response =>
						dispatch({ type: DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ERROR, err }));
	};
};

export const logoutUser = user => {
	return dispatch => {
		dispatch({ type: FETCH_DATA });
		axios
			.post('https://anywhere-reader-test.herokuapp.com/api/users', user)
			.then(response =>
				dispatch({
					type: LOGOUT_USER,
					payload: {
						//the payload you're giving the API to populate the new user
					}
				})
			)
			.then(
				// Re-GET all the notes, with the newly added one included
				axios
					.get('https://anywhere-reader-test.herokuapp.com/api/users')
					.then(response =>
						dispatch({ type: DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ERROR, err }));
	};
};

export const addArticle = article => {
	return dispatch => {
		dispatch({ type: FETCH_DATA });
		axios
			.post(
				'https://anywhere-reader-test.herokuapp.com/api/users/{id}/articles',
				article
			)
			.then(response =>
				dispatch({
					type: ADD_ARTICLE,
					payload: {
						//the payload you're giving the API to populate the new article
					}
				})
			)
			.then(
				// Re-GET all the notes, with the newly added one included
				axios
					.get(
						'https://anywhere-reader-test.herokuapp.com/api/users/{id}/articles'
					)
					.then(response =>
						dispatch({ type: DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ERROR, err }));
	};
};
