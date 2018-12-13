import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { colors } from '../../styling';
import moment from 'moment';
import ReactHtmlParser, {
	processNodes,
	convertNodeToElement,
	htmlparser2
} from 'react-html-parser';

const ArticleDiv = styled.div`
	padding: 2rem;
	margin: 8rem 0 4rem 0;
	border-radius: 7px;
	background-color: ${colors.white};
	box-shadow: 0px 0px 10px -3px rgba(0, 0, 0, 0.66);
	max-width: 700px;
	width: 95%;
	img {
		border-radius: 7px;
		width: 100%;
	}
	img,
	h3,
	h4 {
		padding: 0 0 1rem 0;
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
	}
`;

const CloseBtn = styled.h5`
	font-weight: bold;
	cursor: pointer;
	position: relative;
	top: -8px;
	left: -1%;
`;

const TitleHead = styled.h3`
	font-size: 3rem;
`;

const BodyDiv = styled.div`
	font-family: 'Roboto', sans-serif;
	white-space: pre-wrap;
	line-height: 4rem;
	embed,
	img,
	p,
	h1,
	h2,
	h3,
	h4,
	h5,
	h6 {
		padding: 0 0 1rem 0;
	}
	font-size: 2rem;
`;

const ArticleInfo = styled.div`
	display: flex;
	justify-content: space-between;
`;

class ArticleModal extends Component {
	getBaseURL = url => {
		var pathArray = url.split('/');
		var protocol = pathArray[0];
		var host = pathArray[2];
		var newUrl = protocol + '//' + host;
		return newUrl;
	};

	render() {
		return (
			<ArticleDiv>
				<CloseBtn onClick={() => this.props.closeModal()}>X</CloseBtn>
				{/* <img
					src={this.props.page.cover_image}
					alt={`${this.props.page.title} cover`}
				/> */}
				<TitleHead>{this.props.page.title}</TitleHead>
				<ArticleInfo>
					{/* {this.props.page.author === '' ? (
						''
					) : (
						<h4>{`${this.props.page.author}`}</h4>
					)} */}
					<h4>
						<a
							href={this.props.page.normal_url}
							target="_blank"
							rel="noopener noreferrer"
						>
							{this.getBaseURL(this.props.page.normal_url)}
						</a>
					</h4>
					<h4>{`Saved on ${moment(this.props.page.date_saved).format(
						'MMM Do YY'
					)}`}</h4>
				</ArticleInfo>
				<br />
				<BodyDiv>{ReactHtmlParser(this.props.page.html)}</BodyDiv>
			</ArticleDiv>
		);
	}
}

ArticleModal.propTypes = {
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
	}).isRequired,
	closeModal: PropTypes.func.isRequired
};

export default ArticleModal;
