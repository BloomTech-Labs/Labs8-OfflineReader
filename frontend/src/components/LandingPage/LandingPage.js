import React from 'react';
import styled from 'styled-components';

import { LandingPageDiv } from '../../styling';

const MarketingBlurb = styled.div`
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	max-width: 550px;
	color: #282e40;
	margin: 12rem 3rem 3rem 3rem;
	padding: 4rem;
	font-size: 3rem;
	background-color: rgba(227, 220, 202, 0.4);
	border-radius: 5px;
`;

const LandingPage = props => {
	return (
		<LandingPageDiv>
			<MarketingBlurb>
				<h2>Save your favorite articles, videos, and more. </h2>
				<br />
				<h2>View them any time, no internet connection needed.</h2>
			</MarketingBlurb>
		</LandingPageDiv>
	);
};
export default LandingPage;
