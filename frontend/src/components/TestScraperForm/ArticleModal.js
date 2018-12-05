import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const CloseBtn = styled.h5`
	font-weight: bold;
	cursor: pointer;
`;

class ArticleModal extends Component {
	render() {
		return (
			<div>
				<CloseBtn onClick={() => this.props.closeModal()}>X</CloseBtn>
				<img
					src={this.props.page.cover_image}
					alt={`${this.props.page.title} cover`}
				/>
				<h3>{this.props.page.title}</h3>
				<h5>{`Authors: ${this.props.page.author}`}</h5>
				<p>
					{'Source: '}
					<a href={`${this.props.page.normal_url}`}>
						{this.props.page.normal_url}
					</a>
				</p>
				<p>{`Saved: ${this.props.page.date_saved}`}</p>
				<br />
				{this.props.page.text}
				<br />
				<br />
				<p>{`Tags: ${this.props.page.tags}`}</p>
			</div>
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
