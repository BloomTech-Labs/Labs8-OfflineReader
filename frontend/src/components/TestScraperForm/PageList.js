import React from 'react';
import Page from './Page';

const PageList = props => {
	console.log('props are:', props);
	return (
		<div>
			<h1>Your Pages:</h1>
			{props.pages.map(page => {
				return <Page page={page} key={page.id} />;
			})}
		</div>
	);
};

export default PageList;
