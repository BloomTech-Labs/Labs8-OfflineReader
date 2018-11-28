import React, { Component } from 'react';
import { GoogleLogin, GoogleLogout } from 'react-google-login';
import PropTypes from 'prop-types';
// import styled from 'styled-components';

class GoogleAuth extends Component {
	constructor(props) {
		super(props);
		this.state = { googClientResp: '' };
	}

	responseGoogle = response => {
		console.log(response);
		// this.setState({ ...this.state, googClientResp: response });
		this.props.loginUser();
	};

	logoutGoogle = () => {
		// this.setState({ ...this.state, googClientResp: '' });
		this.props.logoutUser();
	};

	/* https://github.com/anthonyjgrove/react-google-login/issues/62#issuecomment-315660505
    When working with/testing locally, the "Authorized Javascript Origins" setting in the Google dashboard
    needs to have both "localhost:port" AND "localhost", otherwise Google throws back an error about
    the auth window being closed by the user.*/
	render() {
		let authBtn;
		if (this.state.googClientResp === '' || this.state.googClientResp.error) {
			authBtn = (
				<GoogleLogin
					clientId={this.props.googleClientId}
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
	googleClientId: PropTypes.string.isRequired,
	userStatus: PropTypes.shape({
		fetching: PropTypes.bool,
		success: PropTypes.bool,
		message: PropTypes.string,
		error: PropTypes.string
	}).isRequired,
	registerUser: PropTypes.func.isRequired,
	loginUser: PropTypes.func.isRequired,
	logoutUser: PropTypes.func.isRequired
};

export default GoogleAuth;
