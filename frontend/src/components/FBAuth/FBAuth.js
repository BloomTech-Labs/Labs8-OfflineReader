import React, { Component } from 'react';
import FacebookProvider, { Login } from 'react-facebook-sdk';
import styled from 'styled-components';

const FBClick = styled.span`
	cursor: pointer;
`;

class FBAuth extends Component {
	state = {
		// TODO: Set this in the userReducers state, then pass it down. This will make sure values are easy to locate going forward.
		fbAppId:
			process.env.NODE_ENV === 'production'
				? '719662021765780'
				: '196409721290076',
		error: ''
	};

	handleResponse = data => {
		console.log(data);
		this.props.loginUser(data.tokenDetail.accessToken);
	};

	handleError = error => {
		this.setState({ error });
		// TODO: use the error dispatch from the login action instead of local state
	};

	render() {
		return (
			<FacebookProvider appId={this.state.fbAppId}>
				<Login
					scope="email"
					onResponse={this.handleResponse}
					onError={this.handleError}
				>
					<FBClick>Login via Facebook</FBClick>
					{/* {this.state.error !== '' ? <span>{this.state.error}</span> : null} */}
				</Login>
			</FacebookProvider>
		);
	}
}

export default FBAuth;
