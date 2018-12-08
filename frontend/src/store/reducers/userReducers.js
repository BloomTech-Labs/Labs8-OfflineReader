import {
	REGISTER_USER,
	LOGGING_IN_USER,
	LOGGED_IN_USER,
	LOGOUT_USER,
	PREMIUM_USER,
	FETCH_USER_DATA,
	USER_DATA_FETCHED,
	USER_ERROR,
	UPDATING_USER,
	UPDATED_USER
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
		// googleClientId:
		// 	'213031583666-fcjp2lmnht6pq13loo7ddo4s8r9lhvbr.apps.googleusercontent.com',
		// serverToken: 'e4d06c221480448a274af99806a6176e9bfd32a3'
		serverToken: {}
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
					error: action.err.message
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
				auth: { ...state.auth, serverToken: '' },
				userStatus: { ...state.userStatus, success: false }
			};

		case LOGGED_IN_USER:
			return {
				...state,
				auth: { ...state.auth, serverToken: action.payload },
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
				auth: { ...state.auth, serverToken: '' },
				userStatus: { ...state.userStatus, success: false }
			};

		case PREMIUM_USER:
			return { ...state, userStatus: { ...state.userStatus, premium: true } };

		case UPDATING_USER:
			return {
				...state
			};

		case UPDATED_USER:
			return {
				...state,
				username: action.payload.username,
				email: action.payload.email,
				firstName: action.payload.firstName,
				lastName: action.payload.lastName
			};

		default:
			return state;
	}
};
