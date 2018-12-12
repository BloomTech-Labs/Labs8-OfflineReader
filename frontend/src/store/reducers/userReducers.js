import {
	REGISTER_USER,
	LOGGING_IN_USER,
	LOGGED_IN_USER,
	LOGGING_OUT_USER,
	LOGGED_OUT_USER,
	LOGOUT_FLAG,
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
		premium: false,
		// TODO: When the user logs in, set loginTime to the login time, that way we can do
		// the math between this and auth.serverToken.data.expires_in to get refresh tokens, etc
		loginTime: ''
	},
	auth: {
		// TODO: Uncomment this if we implement Google OAuth2 as a provider on the backend.
		// Other work will need to be done with the SignIn workflow, but a semi-functioning
		// GoogleAuth component is implemented. It would just need to be updated to send the
		// proper token to the backend for processing to get an access token in return.
		// googleClientId:
		// 	'213031583666-fcjp2lmnht6pq13loo7ddo4s8r9lhvbr.apps.googleusercontent.com',
		serverToken: {}
	},
	userStatus: {
		fetching: false,
		success: false,
		// TODO: implement to redirect to a NewsAPI page if we end up using the NewsAPI that Andrew discovered
		// newUser: true,
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
				user: {
					...state.user,
					username: action.payload.username,
					email: action.payload.email,
					firstName: action.payload.first_name,
					lastName: action.payload.last_name
				},
				userStatus: { ...state.userStatus, fetching: false }
			};

		case REGISTER_USER:
			return { ...state, userStatus: { ...state.userStatus, newUser: true } };

		case LOGGING_IN_USER:
			return {
				...state,
				auth: { ...state.auth, serverToken: {} },
				userStatus: { ...state.userStatus, success: false }
			};

		case LOGGED_IN_USER:
			return {
				...state,
				auth: { ...state.auth, serverToken: { ...action.payload } },
				userStatus: { ...state.userStatus, success: true }
			};

		case LOGGING_OUT_USER:
			return {
				...state,
				userStatus: {
					...state.userStatus,
					fetching: false,
					success: false,
					// Uncomment for NewsAPI workflow mentioned above
					// newUser: true,
					error: '',
					message: ''
				}
			};

		case LOGGED_OUT_USER:
			return {
				...state,
				user: {
					...state.user,
					username: '',
					email: '',
					firstName: '',
					lastName: '',
					premium: false
				},
				auth: { ...state.auth, serverToken: {} },
				userStatus: {
					...state.userStatus,
					message: action.payload
				}
			};

		case LOGOUT_FLAG:
			return { ...state, userStatus: { ...state.userStatus, success: false } };

		case PREMIUM_USER:
			return { ...state, userStatus: { ...state.userStatus, premium: true } };

		case UPDATING_USER:
			return {
				...state
			};

		case UPDATED_USER:
			return {
				...state,
				user: {
					...state.user,
					username: action.payload.username,
					email: action.payload.email,
					firstName: action.payload.firstName,
					lastName: action.payload.lastName
				}
			};

		default:
			return state;
	}
};
