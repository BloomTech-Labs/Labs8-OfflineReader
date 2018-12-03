import React, { Component } from 'react';
import FacebookProvider, { Login } from 'react-facebook-sdk';

export default class FBLogin extends Component {
	handleResponse = data => {
		console.log(data);
	};

	handleError = error => {
		this.setState({ error });
	};

	render() {
		return (
			<FacebookProvider appId="196409721290076">
				<Login
					scope="email"
					onResponse={this.handleResponse}
					onError={this.handleError}
				>
					<span>Login via Facebook</span>
				</Login>
			</FacebookProvider>
		);
	}
}
