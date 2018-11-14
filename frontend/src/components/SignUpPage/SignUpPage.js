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
		window.location.reload(this.props.history.push('/signedUp'));
	};

	render() {
		return (
			<div>
				<h2>Sign Up</h2>
				<form onSubmit={this.handleSubmit}>
					<label className="label">Email: </label>
					<input
						type="text"
						className="input"
						name="email"
						placeholder="email"
						value={this.state.email}
						onChange={this.handleInput}
					/>
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
						type="password"
						className="input"
						name="password"
						placeholder="password"
						value={this.state.password}
						onChange={this.handleInput}
					/>
					<label className="label">Comfirm password: </label>
					<input
						type="password"
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
