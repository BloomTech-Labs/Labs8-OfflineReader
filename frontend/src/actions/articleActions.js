const url = 'http://127.0.0.1:8000';

const requestingArticleData = () => ({ type: 'SENDING_ARTICLE_DATA' });
const receiveResponseArticle = resp => ({
	type: 'RECEIVE_RESPONSE_ARTICLE',
	resp
});
const receiveErrorArticle = err => ({ type: 'RECEIVE_ERROR_ARTICLE', err });

function requestArticles() {
	return async function(dispatch) {
		dispatch(requestingArticleData());
		try {
			let token_conv =
				(await localStorage.getItem('goog_access_token_conv')) ||
				localStorage.getItem('github_access_token_conv');
			let response = await fetch(`${url}/dogs/`, {
				method: 'GET',
				headers: {
					Accept: 'application/json',
					Authorization: `Bearer ${token_conv}`
				}
			});
			if (!response.ok) {
				throw new Error('Authorized Request Failed');
			}
			let responseJson = await response.json();
			return dispatch(receiveResponseArticle(responseJson));
		} catch (err) {
			dispatch(receiveErrorArticle(err));
		}
	};
}

export { requestArticles };
