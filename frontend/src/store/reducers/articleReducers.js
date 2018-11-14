import {
	ADD_ARTICLE,
	DELETE_ARTICLE,
	FETCH_ARTICLE_DATA,
	ARTICLE_DATA_FETCHED,
	ERROR
} from '../actions';

const initialState = {
	articles: [],
	fetching: false,
	success: false,
	error: null
};

export const articleReducers = (state = initialState, action) => {
	switch (action.type) {
		case FETCH_ARTICLE_DATA:
			return { ...state, fetching: true };
		case ERROR:
			return { ...state, error: 'Error' + action.err };
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
