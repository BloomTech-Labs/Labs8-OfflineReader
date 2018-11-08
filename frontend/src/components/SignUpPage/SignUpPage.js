import React, { Component } from 'react';

class SignUpPage extends Component {
	constructor(props) {
		super(props);
		this.state = {
			email: '',
			username: '',
			password: '',
			password_conf: ''
		};
	}

	handleInput = e => {
		this.setState({
			[e.target.name]: e.target.value
		});
	};

	handleSubmit = e => {
		e.preventDefault();
		const user = this.state.username;
		localStorage.setItem('user', user);
		window.location.reload();
	};

	render() {
		return (
			<div>
				<h2>Sign Up</h2>
				<form onSubmit={this.handleSubmit}>
					<input
						type="text"
						className="input"
						name="email"
						placeholder="email"
						value={this.state.email}
						onChange={this.handleInput}
					/>
					<input
						type="text"
						className="input"
						name="username"
						placeholder="username"
						value={this.state.username}
						onChange={this.handleInput}
					/>
					<input
						type="text"
						className="input"
						name="password"
						placeholder="password"
						value={this.state.password}
						onChange={this.handleInput}
					/>
					<input
						type="text"
						className="input"
						name="password_conf"
						placeholder="password_conf"
						value={this.state.password_conf}
						onChange={this.handleInput}
					/>
					<button>Submit</button>
				</form>
			</div>
		);
	}
}

export default SignUpPage;
