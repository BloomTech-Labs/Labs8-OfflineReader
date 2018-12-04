import React, { Component } from 'react';
import FacebookProvider, { Login } from 'react-facebook-sdk';
// import styled from 'styled-components';

// const FBClick = styled.span`
// 	cursor: pointer;
// `;

class FBAuth extends Component {
	state = {
		error: ''
	};

	handleResponse = data => {
		console.log(data);
		this.props.loginUser(data.tokenDetail.accessToken);
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
					{/* {this.state.error !== '' ? <span>{this.state.error}</span> : null} */}
				</Login>
			</FacebookProvider>
		);
	}
}

export default FBAuth;
