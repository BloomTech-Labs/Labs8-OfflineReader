import React, { Component } from 'react';
import { connect } from 'react-redux';
import { sendURL, fetchPages } from '../store/actions';

import { TestScraper } from '../components';

class TestScraperFormContainer extends Component {
	componentDidMount() {
		this.props.fetchPages(this.props.serverToken);
	}

	render() {
		return (
			<div>
				<br />
				<br />
				<TestScraper {...this.props} />
			</div>
		);
	}
}

const mapStateToProps = state => {
	return {
		//Mps actions and reducers to the state
		// fetchingPages: state.testScraperFormReducers.fetchingPages,
		// pagesFetched: state.testScraperFormReducers.pagesFetched,
		// sendingURL: state.testScraperFormReducers.sendingURL,
		// urlSent: state.testScraperFormReducers.urlSent,
		pages: state.testScraperFormReducers.pages,
		// error: state.testScraperFormReducers.error,
		showingModal: state.testScraperFormReducers.showingModal,
		serverToken: state.userReducers.auth.serverToken
	};
};

export default connect(
	mapStateToProps,
	{
		fetchPages,
		sendURL
	}
)(TestScraperFormContainer);
