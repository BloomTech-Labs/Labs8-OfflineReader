import React from 'react';
import LoadingSpinner from '../utils_materialui/LoadingSpinner';
import styled from 'styled-components';
import { NavLink, withRouter } from 'react-router-dom';
import GoogleLoginButton from '../containers/GoogleAuth/GoogleLoginButtonContainer.js';
import GoogleLogoutButton from '../containers/GoogleAuth/GoogleLogoutButtonContainer.js';

const LoginBox = styled.div`
	text-align: center;
	width: 200px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 5px 4px 25px 0px rgba(0, 0, 0, 0.75);
`;

const LoginContainer = styled.div`
	display: flex;
	flex-direction: row;
	justify-content: center;
`;

const LandingPage = (props, goog_auth) => {
	function userIsAuthenticatedGoogle() {
		if (props.goog_auth.isAuthenticated) {
			return [
				<li className="nav-item" key="goog-logout-btn">
					<GoogleLogoutButton history={props.history} />
				</li>
			];
		}
	}
	function userIsNotAuthenticated() {
		if (!props.goog_auth.isAuthenticated) {
			return [
				<li className="nav-item" key="goog-login-btn">
					<GoogleLoginButton history={props.history} />
				</li>
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
				<h1>Email</h1>
				<h1>Password</h1>
				{userIsAuthenticatedGoogle()}
				{userIsNotAuthenticated()}
				{userIsAuthenticated()}
			</LoginBox>
		</LoginContainer>
	);
};

export default LandingPage;
