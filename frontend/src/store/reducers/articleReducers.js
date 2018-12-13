// TODO: Move content to testScraperFormReducers
import {
	ADD_ARTICLE,
	DELETE_ARTICLE,
	FETCH_ARTICLE_DATA,
	ARTICLE_DATA_FETCHED,
	ARTICLE_ERROR
} from '../actions';

const initialState = {
	articles: [],
	articleStatus: {
		fetching: false,
		success: false,
		error: ''
	}
};

export default (state = initialState, action) => {
	switch (action.type) {
		case ARTICLE_ERROR:
			return {
				...state,
				articleStatus: { ...state.articleStatus, error: action.err }
			};

		case FETCH_ARTICLE_DATA:
			return {
				...state,
				articleStatus: { ...state.articleStatus, fetching: true }
			};

		case ARTICLE_DATA_FETCHED:
			return { ...state, articles: action.payload, fetching: false };

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
				articleStatus: { ...state.articleStatus, fetching: false }
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
				articleStatus: { ...state.articleStatus, fetching: false }
			};
		//////
		default:
			return state;
	}
};
