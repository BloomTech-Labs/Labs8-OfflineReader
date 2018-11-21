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
	LOGIN_USER,
	LOGOUT_USER,
	FETCH_USER_DATA,
	USER_DATA_FETCHED,
	USER_ERROR,
	registerUser,
	loginUser,
	logoutUser
} from './userActions';

export const apiBaseURL = 'https://anywhere-reader-test.herokuapp.com/api';
