import React, { Component } from 'react';

class SignInPage extends Component {
	constructor(props) {
		super(props);
		this.state = {
			username: '',
			password: ''
		};
	}

	handleInput = e => {
		this.setState({ [e.target.name]: e.target.value });
	};

	handleSubmit = e => {
		e.preventDefault();
		window.location.reload(this.props.history.push('/signedIn'));
	};

	render() {
		return (
			<div>
				<h2>Sign In</h2>
				<form className="signin" onSubmit={this.handleSubmit}>
					<label className="label">Username: </label>
					<input
						type="text"
						className="input"
						name="username"
						placeholder="username"
						value={this.state.username}
						onChange={this.handleInput}
					/>
					<label className="label">Password: </label>
					<input
						type="text"
						className="input"
						name="password"
						placeholder="password"
						value={this.state.password}
						onChange={this.handleInput}
					/>
					<button>Enter</button>
				</form>
			</div>
		);
	}
}

export default SignInPage;
