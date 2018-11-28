import {
	REGISTER_USER,
	LOGIN_USER,
	LOGOUT_USER,
	FETCH_USER_DATA,
	USER_DATA_FETCHED,
	USER_ERROR
} from '../actions';

const initialState = {
	user: {
		username: '',
		email: '',
		firstName: '',
		lastName: '',
		premium: false
	},
	googleClientId:
		'213031583666-fcjp2lmnht6pq13loo7ddo4s8r9lhvbr.apps.googleusercontent.com',
	userStatus: {
		fetching: false,
		success: false,
		message: '',
		error: ''
	}
};

export default (state = initialState, action) => {
	switch (action.type) {
		case USER_ERROR:
			return {
				...state,
				userStatus: { ...state.userStatus, error: action.err }
			};

		case FETCH_USER_DATA:
			return { ...state, userStatus: { ...state.userStatus, fetching: true } };

		case USER_DATA_FETCHED:
			return { ...state, userStatus: { ...state.userStatus, fetching: false } };

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
				userStatus: { ...state.userStatus, fetching: false }
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
				userStatus: { ...state.userStatus, fetching: false }
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
				userStatus: { ...state.userStatus, fetching: false }
			};

		default:
			return state;
	}
};
