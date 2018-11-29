import React from 'react';

const Page = props => {
	return (
		<div>
			<h1>{props.page.title}</h1>
			{props.page.img}
		</div>
	);
};

export default Page;
