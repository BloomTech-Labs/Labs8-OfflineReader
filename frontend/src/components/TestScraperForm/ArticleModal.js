import React, { Component } from 'react';
import PropTypes from 'prop-types';
// import styled from 'styled-components';

class ArticleModal extends Component {
	render() {
		console.log('pages:', this.props.pages);
		return this.props.fetchingPages ? (
			<div>
				<p>Please wait while we retrieve the article. :)</p>
			</div>
		) : this.props.error !== '' ? (
			<div>
				<p>{this.props.error}</p>
			</div>
		) : (
			<div>
				<h4>{this.props.pages.title}</h4>
				<h5>{`Authors: ${this.props.pages.author}`}</h5>
				<p>{`Source: ${this.props.pages.resolved_url}`}</p>
				<p>{`Saved: ${this.props.pages.date_saved}`}</p>
				<br />
				{this.props.pages.text}
				<br />
				<p>{`Tags: ${this.props.pages.tags}`}</p>
			</div>
		);
	}
}

ArticleModal.propTypes = {
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
	),
	pagesFetched: PropTypes.bool,
	fetchingPages: PropTypes.bool,
	error: PropTypes.string
};

export default ArticleModal;
