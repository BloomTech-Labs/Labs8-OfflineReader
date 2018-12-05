import React from 'react';
import styled from 'styled-components';

import { LandingPageDiv } from '../../styling';

const MarketingBlurb = styled.div`
	display: flex;
	flex-direction: row;
	justify-content: center;
	color: black;
	margin: 3rem;
`;

const LandingPage = props => {
	return (
		<LandingPageDiv>
			<MarketingBlurb>
				<h2>
					Save your favorite articles, videos, and more. View them any time, no
					internet connection needed.
				</h2>
			</MarketingBlurb>
		</LandingPageDiv>
	);
};
export default LandingPage;
