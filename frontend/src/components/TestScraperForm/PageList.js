import React, { Component } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import { Page } from './';

const PageListContainer = styled.div`
	display: flex;
	flex-direction: column;
`;

class PageList extends Component {
	render() {
		console.log('props are:', this.props);
		return (
			<PageListContainer>
				<h1>Your Pages:</h1>
				{this.props.pages.map(page => {
					return (
						<Page page={page} modalPage={this.props.modalPage} key={page.id} />
					);
				})}
			</PageListContainer>
		);
	}
}

PageList.propTypes = {
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
	modalPage: PropTypes.func
};

export default PageList;
