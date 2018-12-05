import React, { Component } from 'react';
import styled from 'styled-components';

import { FBAuthContainer } from '../../containers';
import { LandingPageDiv } from '../../styling';

const LoginDiv = styled.div`
	margin: 3rem;
	text-align: center;
	width: 200px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 5px 4px 25px 0px rgba(0, 0, 0, 0.75);
	font-family: 'Roboto', sans-serif;
	img {
		border-radius: 10px 10px 0 0;
	}
`;

class SignIn extends Component {
	constructor(props) {
		super(props);
		this.state = {
			username: '',
			password: ''
		};
	}

	handleInput = e => {
		this.setState({ ...this.state, [e.target.name]: e.target.value });
	};

	handleSubmit = e => {
		e.preventDefault();
		// TODO: Trigger a related action if we ever implement the backend as an OAuth2 provider
	};

	render() {
		return (
			// <div>
			// 	<h2>Sign In</h2>
			// 	<form className="signin" onSubmit={this.handleSubmit}>
			// 		<label className="label">Username: </label>
			// 		<input
			// 			type="text"
			// 			className="input"
			// 			name="username"
			// 			placeholder="username"
			// 			value={this.state.username}
			// 			onChange={this.handleInput}
			// 		/>
			// 		<label className="label">Password: </label>
			// 		<input
			// 			type="password"
			// 			className="input"
			// 			name="password"
			// 			placeholder="password"
			// 			value={this.state.password}
			// 			onChange={this.handleInput}
			// 		/>
			// 		<button>Enter</button>
			// 	</form>
			// </div>

			<LandingPageDiv>
				<LoginDiv>
					<img src="https://i.imgur.com/b0dD4XV.png" alt="" width="200px" />
					<h1>Anywhere Reader</h1>
					<form>
						Email
						<input type="text" name="username" />
						Password
						<input type="password" name="password" />
						<input type="submit" value="Sign in" />
					</form>
					<br />
					<FBAuthContainer />
					<br />
					{/* <div>
                        Don't have an account yet? <a href="/SignUpPage">Sign Up</a>
                    </div> */}
					<br />
					{/* <hr /> */}
				</LoginDiv>
			</LandingPageDiv>
		);
	}
}

export default SignIn;
