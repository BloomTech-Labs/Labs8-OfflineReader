import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const SetDiv = styled.div`
	padding: 0 0 0 2.4rem;
`;

const SetForm = styled.form`
	/* display: flex;
	flex-direction: column; */
	max-width: 170px;
	margin-right: auto;
`;

const SetInput = styled.input`
	margin-bottom: 20px;
	padding-left: 10px;
	font-size: 1rem;
`;

const SetLabel = styled.label`
	margin-bottom: 10px;
`;

class Settings extends Component {
	constructor(props) {
		super(props);
		this.state = {
			username: '',
			email: '',
			firstName: '',
			lastName: ''
		};
	}

	componentDidMount = () => {
		this.setState({
			...this.state,
			username: this.props.user.username,
			email: this.props.user.email,
			firstName: this.props.user.firstName,
			lastName: this.props.user.lastName
		});
	};

	handleInput = e => {
		this.setState({
			...this.state,
			[e.target.name]: e.target.value
		});
	};

	handleSubmit = e => {
		const user = {
			username: this.state.username,
			email: this.state.email,
			firstName: this.state.firstName,
			lastName: this.state.lastName
		};
		this.props.updateUser(user);
	};

	render() {
		return (
			<SetDiv>
				<h2>Profile</h2>
				<br />
				<SetForm>
					<SetLabel className="label">Username:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="username"
						placeholder="Username"
						value={this.state.username}
						onChange={this.handleInput}
					/>
					<br />
					<SetLabel className="label">Email:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="email"
						placeholder="Email"
						value={this.state.email}
						onChange={this.handleInput}
					/>
					<br />
					<SetLabel className="label">First name:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="firstName"
						placeholder="First name"
						value={this.state.firstName}
						onChange={this.handleInput}
					/>
					<br />
					<SetLabel className="label">Last name:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="lastName"
						placeholder="Last name"
						value={this.state.lastName}
						onChange={this.handleInput}
					/>
					<br />
					<input type="submit" value="Save" />
				</SetForm>
			</SetDiv>
		);
	}
}

Settings.propTypes = {
	user: PropTypes.shape({
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.string
	}).isRequired,
	updateUser: PropTypes.func.isRequired
};

export default Settings;
