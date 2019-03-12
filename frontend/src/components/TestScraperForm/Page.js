import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { colors } from '../../styling';
import DeleteModal from './DeleteModal';

// TODO: Padding
const PageCardDiv = styled.div`
	display: flex;
	position: relative;
	flex-direction: column;
	justify-content: space-between;
	border-radius: 5px;
	padding: 1rem;
	margin: 2rem 2%;
	width: 21%;
	box-shadow: 0px 0px 10px -3px rgba(0, 0, 0, 0.75);
	background: ${colors.white};
	img {
		border-radius: 5px 5px 0 0;
		padding: 0 0 5px 0;
	}
	h2 {
		font-size: 2rem;
		margin-top: 1rem;
	}
	a:link,
	a:visited {
		color: ${colors.secondaryText};
		text-decoration: none;
	}
	a:link:active,
	a:visited:active {
		color: ${colors.secondaryText};
	}
	h4 {
		color: ${colors.secondaryText};
		font-size: 1.6rem;
		margin-top: 1rem;
	}
	@media (max-width: 900px) {
		width: 25%;
	}
	@media (max-width: 600px) {
		width: 100%;
	}
`;

const Preview = styled.div`
	height: 100%;
`;

const DeleteButton = styled.button`
	cursor: pointer;
	font-size: 1.2rem;
	color: ${colors.secondaryText};
	border: none;
`;

const Info = styled.div`
	display: flex;
	justify-content: space-between;
`;

class Page extends Component {
	clickPreview = () => {
		this.props.modalPage(this.props.page);
	};

	getBaseURL = url => {
		var pathArray = url.split('/');
		var protocol = pathArray[0];
		var host = pathArray[2];
		var newUrl = protocol + '//' + host;
		return newUrl;
	};

	render() {
		return (
			<PageCardDiv>
				<Preview onClick={this.clickPreview}>
					<img
						src={this.props.page.cover_image}
						width="100%"
						alt={this.props.page.title}
					/>
					<h2>{this.props.page.title}</h2>
				</Preview>
				<Info>
					<h4>
						<a
							href={this.props.page.normal_url}
							target="_blank"
							rel="noopener noreferrer"
						>
							{this.getBaseURL(this.props.page.normal_url)}
						</a>
					</h4>
					<h4>
						<DeleteButton>Delete</DeleteButton>
					</h4>
				</Info>
				<DeleteModal />
			</PageCardDiv>
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
