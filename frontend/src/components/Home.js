import React from 'react';
import LoadingSpinner from '../utils_materialui/LoadingSpinner';
import styled from 'styled-components';

const LoginContainer = styled.div`
	text-align: center;
	border: 1px black solid;
`;

const Home = ({ goog_auth }) => {
	return (
		<div>
			{goog_auth.isAuthenticating && <LoadingSpinner />}
			<LoginContainer>
				<h1>Anywhere Reader</h1>
			</LoginContainer>
		</div>
	);
};

export default Home;
