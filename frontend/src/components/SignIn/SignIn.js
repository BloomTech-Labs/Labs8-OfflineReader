import React, { Component } from 'react';
import styled from 'styled-components';

import { FBAuthContainer } from '../../containers';
import { LandingPageDiv } from '../../styling';
import { colors } from '../../styling';

const LoginDiv = styled.div`
	margin: 12rem 3rem 3rem 3rem;
	text-align: center;
	width: 200px;
	background-color: ${colors.white};
	border-radius: 5px;
	/* box-shadow: 5px 4px 25px 0px rgba(0, 0, 0, 0.75); */
	font-family: 'Roboto', sans-serif;
	img {
		border-radius: 10px 10px 0 0;
	}
`;

class SignIn extends Component {
	// Uncomment when implementing the backend as an OAuth2 provider
	// constructor(props) {
	// 	super(props);
	// 	this.state = {
	// 		username: '',
	// 		password: ''
	// 	};
	// }

	// Uncomment when implementing the backend as an OAuth2 provider
	// handleInput = e => {
	// 	this.setState({ ...this.state, [e.target.name]: e.target.value });
	// };

	// Uncomment when implementing the backend as an OAuth2 provider
	// handleSubmit = e => {
	// 	e.preventDefault();
	// 	// TODO: Trigger a related action if we ever implement the backend as an OAuth2 provider
	// };

	render() {
		return (
			<LandingPageDiv>
				<LoginDiv>
					<img src="https://i.imgur.com/b0dD4XV.png" alt="" width="200px" />
					{/* <h1>Anywhere Reader</h1> */}
					{/* Uncomment when implementing the backend as an OAuth2 provider */}
					{/* <form onSubmit={this.handleSubmit}>
						Email
						<input type="text" name="username" placeholder="username" value={this.state.username} onChange={this.handleInput} />
						Password
						<input type="password" name="password" placeholder="password" value={this.state.password} onChange={this.handleInput} />
						<input type="submit" value="Sign in" />
					</form> */}
					<br />
					<FBAuthContainer {...this.props} />
					<br />
					{/* Uncomment when implementing signup as part of implementing the backend as an OAuth2 provider */}
					{/* <div>
                        Don't have an account yet? <a href="/SignUpPage">Sign Up</a>
                    </div>
                    <br /> */}
					<br />
				</LoginDiv>
			</LandingPageDiv>
		);
	}
}

export default SignIn;
