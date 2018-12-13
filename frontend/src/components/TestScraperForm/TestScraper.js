import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

import { ArticleModal, PageList, TestScraperForm } from './';
import { colors } from '../../styling';

const ScraperDiv = styled.div`
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
`;

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
			<ScraperDiv>
				{/* TODO: Make the wrapping div close the modal when clicked */}
				<ArticleModal page={this.state.page} closeModal={this.closeModal} />
			</ScraperDiv>
		) : (
			<ScraperDiv>
				<TestScraperForm
					sendUrl={this.props.sendUrl}
					serverToken={this.props.serverToken}
				/>
				<PageList pages={this.props.pages} modalPage={this.modalPage} />
			</ScraperDiv>
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
