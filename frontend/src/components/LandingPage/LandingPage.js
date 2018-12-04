import React from 'react';
import styled from 'styled-components';
import { NavLink } from 'react-router-dom';

// import GoogleLoginButton from '../containers/GoogleAuth/GoogleLoginButtonContainer.js';
// import GoogleLogoutButton from '../containers/GoogleAuth/GoogleLogoutButtonContainer.js';
import { FBAuthContainer } from '../../containers';

const LoginBox = styled.div`
	margin: 3rem;
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
	background: url(https://images.pexels.com/photos/904616/pexels-photo-904616.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260)
		no-repeat center center fixed;
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
	color: black;
	margin: 3rem;
`;
const LandingPage = props => {
	// function userIsAuthenticatedGoogle() {
	// 	if (props.goog_auth.isAuthenticated) {
	// 		return [
	// 			<div className="nav-item" key="goog-logout-btn">
	// 				<GoogleLogoutButton history={props.history} />
	// 			</div>
	// 		];
	// 	}
	// }
	// function userIsNotAuthenticated() {
	// 	if (!props.goog_auth.isAuthenticated) {
	// 		return [
	// 			<LoginButtonContainer className="nav-item" key="goog-login-btn">
	// 				<GoogleLoginButton history={props.history} />
	// 			</LoginButtonContainer>
	// 		];
	// 	}
	// }
	// function userIsAuthenticated() {
	// 	if (props.goog_auth.isAuthenticated) {
	// 		return [
	// 			<div className="nav-item" key="secret">
	// 				<NavLink to="/secret/" exact className="nav-link">
	// 					Secret
	// 				</NavLink>
	// 			</div>
	// 		];
	// 	}
	// }
	return (
		<LandingPageContainer>
			{/* {goog_auth.isAuthenticating && <LoadingSpinner />} */}
			<LoginBox>
				<img src="https://i.imgur.com/b0dD4XV.png" alt="" width="200px" />
				<h1>Anywhere Reader</h1>
				<form>
					Email
					<input type="text" name="firstname" />
					Password
					<input type="text" name="firstname" />
					<input type="submit" value="Sign in" />
				</form>
				<br />
				<FBAuthContainer />
				<br />
				<div>
					Don't have an account yet? <a href="/SignUpPage">Sign Up</a>
				</div>
				<br />
				<hr />
				{/* {userIsAuthenticatedGoogle()}
				{userIsNotAuthenticated()}
				{userIsAuthenticated()} */}
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
