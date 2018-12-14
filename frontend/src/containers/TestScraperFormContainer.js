import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { fetchPages, fetchUser, sendUrl } from '../store/actions';

import { TestScraper } from '../components';

class TestScraperFormContainer extends Component {
	componentDidMount() {
		this.props.fetchPages(this.props.serverToken);
	}

	render() {
		return <TestScraper {...this.props} />;
	}
}

TestScraperFormContainer.propTypes = {
	pages: PropTypes.arrayOf(
		PropTypes.shape({
			id: PropTypes.number,
			title: PropTypes.string,
			author: PropTypes.string,
			normal_url: PropTypes.string,
			resolved_url: PropTypes.string,
			date_saved: PropTypes.string,
			date_published: PropTypes.string,
			excerpt: PropTypes.string,
			cover_image: PropTypes.string,
			tags: PropTypes.string,
			text: PropTypes.string
		})
	).isRequired,
	serverToken: PropTypes.object.isRequired,
	fetchPages: PropTypes.func.isRequired,
	sendUrl: PropTypes.func.isRequired
};

const mapStateToProps = state => {
	return {
		//Mps actions and reducers to the state
		// fetchingPages: state.testScraperFormReducers.fetchingPages,
		// pagesFetched: state.testScraperFormReducers.pagesFetched,
		// sendingURL: state.testScraperFormReducers.sendingURL,
		// urlSent: state.testScraperFormReducers.urlSent,
		pages: state.testScraperFormReducers.pages,
		// error: state.testScraperFormReducers.error,
		serverToken: state.userReducers.auth.serverToken,
		filteredPages: state.testScraperFormReducers.filteredPages
	};
};

export default connect(
	mapStateToProps,
	{
		fetchPages,
		fetchUser,
		sendUrl
	}
)(TestScraperFormContainer);
