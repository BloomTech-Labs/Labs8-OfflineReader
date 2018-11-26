import React from 'react';
import LoadingSpinner from '../utils_materialui/LoadingSpinner';
import styled from 'styled-components';
import { NavLink } from 'react-router-dom';
import GoogleLogin from 'react-google-login';

import GoogleLoginButton from '../containers/GoogleAuth/GoogleLoginButtonContainer.js';
import GoogleLogoutButton from '../containers/GoogleAuth/GoogleLogoutButtonContainer.js';
import { google_client_id } from './GoogleAuth/GoogleLoginButton';

const LoginBox = styled.div`
	text-align: center;
	width: 200px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 5px 4px 25px 0px rgba(0, 0, 0, 0.75);
	font-family: 'Roboto', sans-serif;
`;

const LandingPageContainer = styled.div`
	display: flex;
	flex-direction: column;
	align-items: center;
`;

const LoginButtonContainer = styled.div`
	padding: 0.2rem;
`;

const LogoContainer = styled.div`
	width: 200px;
`;

const MarketingBlurb = styled.div`
	display: flex;
	flex-direction: row;
	justify-content: center;
	color: white;
	text-shadow: 0px 0px 9px #000000;
	margin: 3rem;
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

	const responseGoogle = response => {
		console.log(response);
	};

	return (
		<LandingPageContainer>
			{goog_auth.isAuthenticating && <LoadingSpinner />}
			<LoginBox>
				<img src="https://i.imgur.com/b0dD4XV.png" alt="" width="200px" />
				<h1>Anywhere Reader</h1>
				<form>
					Email
					<input type="text" name="email" />
					<br />
					<br />
					Password
					<input type="text" name="password" />
					<br />
					<br />
					<input type="submit" value="Sign in" />
				</form>
				<br />
				<div>
					Don't have an account yet? <a href="/SignUpPage">Sign Up</a>
				</div>
				<br />
				<hr />
				<GoogleLogin
					clientId={google_client_id}
					buttonText="Login"
					onSuccess={responseGoogle}
					onFailure={responseGoogle}
				/>
				{userIsAuthenticatedGoogle()}
				{userIsNotAuthenticated()}
				{userIsAuthenticated()}
			</LoginBox>
			<MarketingBlurb>
				<h2>
					Save your favorite articles, videos, and more. View them any time, no
					internet connection needed.
				</h2>
			</MarketingBlurb>
		</LandingPageContainer>
	);
};

export default LandingPage;
