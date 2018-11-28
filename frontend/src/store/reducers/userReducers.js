import {
	REGISTER_USER,
	LOGGING_IN_USER,
	LOGGED_IN_USER,
	LOGOUT_USER,
	PREMIUM_USER,
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
	auth: {
		googleClientId:
			'213031583666-fcjp2lmnht6pq13loo7ddo4s8r9lhvbr.apps.googleusercontent.com',
		googleServerToken: ''
	},
	userStatus: {
		fetching: false,
		success: false,
		newUser: true,
		message: '',
		error: ''
	}
};

export default (state = initialState, action) => {
	switch (action.type) {
		case USER_ERROR:
			return {
				...state,
				userStatus: {
					...state.userStatus,
					error: action.err
				}
			};

		case FETCH_USER_DATA:
			return { ...state, userStatus: { ...state.userStatus, fetching: true } };

		case USER_DATA_FETCHED:
			return {
				...state,
				user: action.payload,
				userStatus: { ...state.userStatus, fetching: false }
			};

		case REGISTER_USER:
			return { ...state, userStatus: { ...state.userStatus, newUser: true } };

		case LOGGING_IN_USER:
			return {
				...state,
				auth: { ...state.auth, googleServerToken: '' },
				userStatus: { ...state.userStatus, success: false }
			};

		case LOGGED_IN_USER:
			return {
				...state,
				auth: { ...state.auth, googleServerToken: action.payload },
				userStatus: { ...state.userStatus, success: true }
			};

		case LOGOUT_USER:
			return {
				...state,
				user: {
					username: '',
					email: '',
					firstName: '',
					lastName: '',
					premium: false
				},
				auth: { ...state.auth, googleServerToken: '' },
				userStatus: { ...state.userStatus, success: false }
			};

		case PREMIUM_USER:
			return { ...state, userStatus: { ...state.userStatus, premium: true } };

		default:
			return state;
	}
};
