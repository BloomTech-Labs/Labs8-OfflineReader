import React from 'react';
import styled from 'styled-components';

import { LandingPageDiv } from '../../styling';

const SignoutDiv = styled.div`
	margin-top: 3rem;
	border-radius: 7px;
	background-color: rgba(227, 220, 202, 0.4);
`;

const SignoutHeader = styled.h4`
	margin: 3rem 2rem 3rem 2rem;
	font-size: 1.8rem;
	text-align: center;
`;

const SignOut = () => {
	return (
		<LandingPageDiv>
			<SignoutDiv>
				<SignoutHeader>~~~ Successfully signed out ~~~</SignoutHeader>
			</SignoutDiv>
		</LandingPageDiv>
	);
};

export default SignOut;
