import axios from 'axios';

import { apiBaseUrl } from './';

export const ADD_ARTICLE = 'ADD_ARTICLE';
export const DELETE_ARTICLE = 'DELETE_ARTICLE';
export const FETCH_ARTICLE_DATA = 'FETCH_ARTICLE_DATA';
export const ARTICLE_DATA_FETCHED = 'ARTICLE_DATA_FETCHED';
export const ARTICLE_ERROR = 'ARTICLE_ERROR';

export const addArticle = article => {
	return dispatch => {
		dispatch({ type: FETCH_ARTICLE_DATA });
		axios
			.post(`${apiBaseUrl}/api/scrape/`, article)
			.then(response =>
				dispatch({
					type: ADD_ARTICLE,
					payload: {
						//the payload you're giving the API to populate the new article, will likely just be the article url that's fed to the scraper
					}
				})
			)
			.then(
				// Re-GET all the articles, with the newly added one included
				axios
					.get(`${apiBaseUrl}/api/pages/`)
					.then(response =>
						dispatch({ type: ARTICLE_DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ARTICLE_ERROR, err }));
	};
};

export const deleteArticle = article => {
	return dispatch => {
		dispatch({ type: FETCH_ARTICLE_DATA });
		axios
			.delete(`${apiBaseUrl}/api/pages/${id}`, article)
			.then(response =>
				dispatch({
					type: DELETE_ARTICLE,
					payload: {
						//the payload you're giving the API to delete the article
					}
				})
			)
			.then(
				// Re-GET all the articles of that user to confirm the deleted article isnt there
				axios
					.get(`${apiBaseUrl}/api/pages/`)
					.then(response =>
						dispatch({ type: ARTICLE_DATA_FETCHED, payload: response.data })
					)
			)
			.catch(err => dispatch({ type: ARTICLE_ERROR, err }));
	};
};
