import {
	REGISTER_USER,
	LOGIN_USER,
	LOGOUT_USER,
	FETCH_USER_DATA,
	USER_DATA_FETCHED,
	USER_ERROR
} from '../actions';

const initialState = {
	users: [],
	userStatus: {
		fetching: false,
		success: false,
		error: ''
	}
};

const userReducers = (state = initialState, action) => {
	switch (action.type) {
		case FETCH_USER_DATA:
			return { ...state, fetching: true };
		case USER_ERROR:
			return { ...state, error: 'Error' + action.err };
		case USER_DATA_FETCHED:
			return { ...state, articles: action.payload, fetching: false };
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

export default userReducers;
