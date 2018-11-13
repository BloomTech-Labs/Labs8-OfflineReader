/* eslint-disable prettier/prettier */
import {
	REGISTER_USER,
	LOGIN_USER,
	LOGOUT_USER,
	ADD_ARTICLE,
	DELETE_ARTICLE,
	FETCH_DATA,
	DATA_FETCHED,
	ERROR
} from '../actions';

const initialState = {
	users: [],
	fetching: false,
	success: false,
	error: null
};

export const userReducers = (state = initialState, action) => {
	switch (action.type) {
		case FETCH_DATA:
			return { ...state, fetching: true };
		case ERROR:
			return { ...state, error: 'Error' + action.err };
		case DATA_FETCHED:
			return { ...state, notes: action.payload, fetching: false };
		case REGISTER_USER:
			const newUser = { ...action.payload };
			return {
				// not sure if this should be returned
				users: [
					...state.users,
					{
						...newUser
					}
				],
				fetching: false
			};

		case LOGIN_USER:
			const userLoggingIn = { ...action.payload };
			return {
				// not sure if this should be returned
				users: [
					...state.users,
					{
						...userLoggingIn
					}
				],
				fetching: false
			};

		case LOGOUT_USER:
			const userLoggingOut = { ...action.payload };
			return {
				// not sure if this should be returned
				users: [
					...state.users,
					{
						...userLoggingOut
					}
				],
				fetching: false
			};

		//////
		default:
			return state;
	}
};

export const articleReducers = (state = initialState, action) => {
	switch (action.type) {
		case FETCH_DATA:
			return { ...state, fetching: true };
		case ERROR:
			return { ...state, error: 'Error' + action.err };
		case DATA_FETCHED:
			return { ...state, notes: action.payload, fetching: false };

		case ADD_ARTICLE:
			const articleAdded = { ...action.payload };
			return {
				// not sure if this should be returned
				articles: [
					...state.articles,
					{
						...articleAdded
					}
				],
				fetching: false
			};

		case DELETE_ARTICLE:
			const articleDeleted = { ...action.payload };
			return {
				// not sure if this should be returned
				articles: [
					...state.articles,
					{
						...articleDeleted
					}
				],
				fetching: false
			};
		//////
		default:
			return state;
	}
};
