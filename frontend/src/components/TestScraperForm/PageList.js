import React from 'react';
import Page from './Page';

import styled from 'styled-components';

const PageListContainer = styled.div`
	display: flex;
	flex-direction: column;
`;

const PageList = props => {
	console.log('props are:', props);
	return (
		<PageListContainer>
			<h1>Your Pages:</h1>
			{props.pages.map(page => {
				return <Page page={page} key={page.id} />;
			})}
		</PageListContainer>
	);
};

export default PageList;
