import React from 'react';
import styled from 'styled-components';

import { LandingPageDiv } from '../../styling';
import { colors } from '../../styling';

const SignoutDiv = styled.div`
	margin-top: 12rem;
	border-radius: 7px;
	background-color: rgba(227, 220, 202, 0.4);
`;

const SignoutHeader = styled.h4`
	margin: 3rem 2rem 3rem 2rem;
	font-size: 2.4rem;
	text-align: center;
	color: ${colors.font};
	border-radius: 5px;
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
