export const apiBaseUrl =
	process.env.NODE_ENV === 'production'
		? 'https://anywhere-reader-test.herokuapp.com'
		: 'http://localhost:8000';

// export {
// 	ADD_ARTICLE,
// 	DELETE_ARTICLE,
// 	FETCH_ARTICLE_DATA,
// 	ARTICLE_DATA_FETCHED,
// 	ARTICLE_ERROR,
// 	addArticle,
// 	deleteArticle
// } from './articleActions';

export {
	FETCHING_PAGES,
	PAGES_FETCHED,
	PAGES_FETCH_ERROR,
	FETCHING_OFFLINE_PAGES,
	OFFLINE_PAGES_FETCHED,
	OFFLINE_PAGES_FETCH_ERROR,
	FETCHING_SPECIFIC_OFFLINE_PAGE,
	SPECIFIC_OFFLINE_PAGE_FETCHED,
	ERROR_FETCHING_SPECIFIC_OFFLINE_PAGE,
	SAVING_OFFLINE_PAGE,
	OFFLINE_PAGE_SAVED,
	OFFLINE_PAGE_SAVE_ERROR,
	INITIALIZE_URL_SUBMIT,
	COMPLETE_URL_SUBMIT,
	SUBMIT_URL_ERROR,
	CLEAR_PAGES,
	SEARCH_PAGES,
	clearPages,
	fetchPages,
	sendUrl,
	searchPages
} from './testScraperFormActions';

export {
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
	UPDATED_USER,
	registerUser,
	loginUser,
	logoutUser,
	logoutFlag,
	fetchUser,
	premiumUser,
	updateUser
} from './userActions';
