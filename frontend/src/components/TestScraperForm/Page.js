import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const PageCardContainer = styled.div`
	border-radius: 5px;
	margin: 0.5rem;
	width: 20%;
	box-shadow: 0px 0px 30px -3px rgba(0, 0, 0, 0.75);
	@media (max-width: 900px) {
		width: 25%;
	}
	@media (max-width: 600px) {
		width: 100%;
	}
`;

class Page extends Component {
	clickPreview = () => {
		this.props.modalPage(this.props.page);
	};

	render() {
		return (
			<PageCardContainer onClick={this.clickPreview}>
				<img src={this.props.page.cover_image} width="100%" alt="" />
				<h2>{this.props.page.title}</h2>
			</PageCardContainer>
		);
	}
}

Page.propTypes = {
	page: PropTypes.shape({
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
	}),
	modalPage: PropTypes.func
};

export default Page;
