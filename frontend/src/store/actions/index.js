export {
	ADD_ARTICLE,
	DELETE_ARTICLE,
	FETCH_ARTICLE_DATA,
	ARTICLE_DATA_FETCHED,
	ARTICLE_ERROR,
	addArticle,
	deleteArticle
} from './articleActions';
export {
	REGISTER_USER,
	LOGGING_IN_USER,
	LOGGED_IN_USER,
	LOGOUT_USER,
	PREMIUM_USER,
	FETCH_USER_DATA,
	USER_DATA_FETCHED,
	USER_ERROR,
	registerUser,
	loginUser,
	logoutUser,
	fetchUser,
	premiumUser
} from './userActions';

export const apiBaseUrl =
	process.env.NODE_ENV === 'production'
		? 'https://anywhere-reader-test.herokuapp.com/api'
		: 'http://localhost:8000/api';
