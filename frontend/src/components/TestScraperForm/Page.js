import React from 'react';
// import PropTypes from 'prop-types';
import styled from 'styled-components';

// import { ArticleModal } from './';

const PageCardContainer = styled.div`
	border-radius: 5px;
	margin: 3rem;
	padding: 0.2rem;
	width: 300px;
	box-shadow: 0px 0px 30px -3px rgba(0, 0, 0, 0.75);
`;

const Page = props => {
	return (
		<PageCardContainer>
			<img src={props.page.cover_image} width="100%" alt="" />
			<h2>{props.page.title}</h2>
		</PageCardContainer>
	);
};

export default Page;
