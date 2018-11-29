import React from 'react';

const Page = props => {
	return (
		<div>
			<img src={props.page.cover_image} />
			<h1>{props.page.title}</h1>
		</div>
	);
};

export default Page;
