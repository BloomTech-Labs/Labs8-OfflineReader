import React from 'react';
import LoadingSpinner from '../utils_materialui/LoadingSpinner';
import styled from 'styled-components';
import { NavLink } from 'react-router-dom';
import GoogleLoginButton from '../containers/GoogleAuth/GoogleLoginButtonContainer.js';
import GoogleLogoutButton from '../containers/GoogleAuth/GoogleLogoutButtonContainer.js';

const LoginBox = styled.div`
	text-align: center;
	width: 200px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 5px 4px 25px 0px rgba(0, 0, 0, 0.75);
	font-family: 'Roboto', sans-serif;
`;

const LoginContainer = styled.div`
	display: flex;
	flex-direction: row;
	justify-content: center;
`;

const LoginButtonContainer = styled.div`
	padding: 0.2rem;
`;

const LogoContainer = styled.div`
	width: 200px;
`;

const LandingPage = (props, goog_auth) => {
	function userIsAuthenticatedGoogle() {
		if (props.goog_auth.isAuthenticated) {
			return [
				<div className="nav-item" key="goog-logout-btn">
					<GoogleLogoutButton history={props.history} />
				</div>
			];
		}
	}
	function userIsNotAuthenticated() {
		if (!props.goog_auth.isAuthenticated) {
			return [
				<LoginButtonContainer className="nav-item" key="goog-login-btn">
					<GoogleLoginButton history={props.history} />
				</LoginButtonContainer>
			];
		}
	}
	function userIsAuthenticated() {
		if (props.goog_auth.isAuthenticated) {
			return [
				<div className="nav-item" key="secret">
					<NavLink to="/secret/" exact className="nav-link">
						Secret
					</NavLink>
				</div>
			];
		}
	}

	return (
		<LoginContainer>
			{goog_auth.isAuthenticating && <LoadingSpinner />}
			<LoginBox>
				<img src="https://i.imgur.com/b0dD4XV.png" alt="" width="200px" />
				<h1>Anywhere Reader</h1>
				<form>
					Email
					<input type="text" name="firstname" />
					Password
					<input type="text" name="firstname" />
					<input type="submit" value="Submit" />
				</form>
				<br />
				<hr />
				{userIsAuthenticatedGoogle()}
				{userIsNotAuthenticated()}
				{userIsAuthenticated()}
			</LoginBox>
		</LoginContainer>
	);
};

export default LandingPage;
