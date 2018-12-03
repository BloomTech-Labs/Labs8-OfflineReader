import React, { Component } from 'react';
import styled from 'styled-components';

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
					return <Page page={page} key={page.id} />;
				})}
			</PageListContainer>
		);
	}
}

export default PageList;
