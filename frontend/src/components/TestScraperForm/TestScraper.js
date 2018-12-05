import React, { Component } from 'react';
import PropTypes from 'prop-types';

import { ArticleModal, PageList, TestScraperForm } from './';

class TestScraper extends Component {
	state = {
		page: {},
		showingModal: false
	};

	closeModal = () => {
		this.setState({
			...this.state,
			page: {},
			showingModal: false
		});
	};

	modalPage = page => {
		this.setState({
			...this.state,
			page,
			showingModal: true
		});
	};

	render() {
		return this.state.showingModal ? (
			<div>
				<ArticleModal page={this.state.page} closeModal={this.closeModal} />
			</div>
		) : (
			<div>
				<TestScraperForm
					sendUrl={this.props.sendUrl}
					serverToken={this.props.serverToken}
				/>
				<PageList pages={this.props.pages} modalPage={this.modalPage} />
			</div>
		);
	}
}

TestScraper.propTypes = {
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
	sendUrl: PropTypes.func.isRequired
};

export default TestScraper;
