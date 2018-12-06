import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const ArticleDiv = styled.div`
	white-space: pre-wrap;
	line-height: 2.2rem;
	padding: 2rem;
	margin: 0 0 4rem 0;
	border-radius: 7px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px -3px rgba(0, 0, 0, 0.66);
	img {
		border-radius: 7px;
		width: 100%;
	}
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
`;

const TitleHead = styled.h3`
	font-size: 2.4rem;
`;

const BodyDiv = styled.div`
	font-family: 'Roboto', sans-serif;
`;

const CloseBtn = styled.h5`
	font-weight: bold;
	cursor: pointer;
`;

class ArticleModal extends Component {
	render() {
		return (
			<ArticleDiv>
				<CloseBtn onClick={() => this.props.closeModal()}>X</CloseBtn>
				<img
					src={this.props.page.cover_image}
					alt={`${this.props.page.title} cover`}
				/>
				<TitleHead>{this.props.page.title}</TitleHead>
				<h5>{`Authors: ${this.props.page.author}`}</h5>
				<p>
					{'Source: '}
					<a href={`${this.props.page.normal_url}`}>
						{this.props.page.normal_url}
					</a>
				</p>
				<p>{`Saved: ${this.props.page.date_saved}`}</p>
				<br />
				<BodyDiv>{this.props.page.text}</BodyDiv>
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
