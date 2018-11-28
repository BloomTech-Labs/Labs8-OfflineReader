import React, { Component } from 'react';
import { GoogleLogin, GoogleLogout } from 'react-google-login';
import PropTypes from 'prop-types';
// import styled from 'styled-components';

class GoogleAuth extends Component {
	responseGoogle = response => {
		// TODO: Remove this console.log() once we figure out the correct portion(s) of the returned response to work with
		console.log(response);
		// TODO: update this to the actual prop for the appropriate token when we figure out which the backend needs
		const token = response;
		this.props.loginUser(token);
	};

	logoutGoogle = () => {
		this.props.logoutUser();
	};

	/* https://github.com/anthonyjgrove/react-google-login/issues/62#issuecomment-315660505
    When working with/testing locally, the "Authorized Javascript Origins" setting in the Google dashboard
    needs to have both "localhost:port" AND "localhost", otherwise Google throws back an error about
    the auth window being closed by the user.*/
	render() {
		let authBtn;
		if (this.props.userStatus.success === false) {
			authBtn = (
				<GoogleLogin
					clientId={this.props.auth.googleClientId}
					buttonText="Login"
					responseType="id_token permission"
					onSuccess={this.responseGoogle}
					onFailure={this.responseGoogle}
				/>
			);
		} else {
			authBtn = (
				<GoogleLogout buttonText="Logout" onLogoutSuccess={this.logoutGoogle} />
			);
		}
		return authBtn;
	}
}

GoogleAuth.propTypes = {
	user: PropTypes.shape({
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.bool
	}).isRequired,
	auth: PropTypes.shape({
		googleClientId: PropTypes.string,
		googleServerToken: PropTypes.string
	}).isRequired,
	userStatus: PropTypes.shape({
		fetching: PropTypes.bool,
		success: PropTypes.bool,
		newUser: PropTypes.bool,
		message: PropTypes.string,
		error: PropTypes.string
	}).isRequired,
	registerUser: PropTypes.func.isRequired,
	loginUser: PropTypes.func.isRequired,
	logoutUser: PropTypes.func.isRequired
};

export default GoogleAuth;
