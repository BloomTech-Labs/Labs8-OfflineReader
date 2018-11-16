const initialState = {
	articleData: [],
	err: null,
	isFetching: false
};

function articleReducer(state = initialState, action) {
	switch (action.type) {
		case 'SENDING_ARTICLE_DATA':
			return { ...state, err: null, isFetching: true };
		case 'RECEIVE_RESPONSE_ARTICLE':
			return { ...state, articleData: action.resp, isFetching: false };
		case 'RECEIVE_ERROR_ARTICLE':
			return { ...state, err: action.err, isFetching: false };
		default:
			return state;
	}
}

export default articleReducer;
