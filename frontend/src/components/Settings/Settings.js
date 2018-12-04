import React, { Component } from 'react';
import { connect } from 'react-redux';
import styled from 'styled-components';
import { updateUser } from '../../store/actions';

class Settings extends Component {
	constructor(props) {
		super(props);
		this.state = {
			email: '',
			username: '',
			firstName: '',
			lastName: ''
		};
	}

	handleInput = e => {
		this.setState({
			[e.target.name]: e.target.value
		});
	};

	handleSubmit = e => {
		const user = {
			email: this.state.email,
			username: this.state.username,
			firstName: this.state.firstName,
			lastName: this.state.lastName
		};
		updateUser(user);
	};

	render() {
		console.log(updateUser);
		return (
			<div>
				<h2>Profile</h2>
				<Form>
					<Label className="label">Username:</Label>
					<Input
						type="text"
						className="input"
						name="username"
						placeholder="Username"
						value={this.state.username}
						onChange={this.handleInput}
					/>
					<Label className="label">Email:</Label>
					<Input
						type="text"
						className="input"
						name="email"
						placeholder="Email"
						value={this.state.email}
						onChange={this.handleInput}
					/>
					<Label className="label">First name:</Label>
					<Input
						type="text"
						className="input"
						name="firstName"
						placeholder="First name"
						value={this.state.firstName}
						onChange={this.handleInput}
					/>
					<Label className="label">Last name:</Label>
					<Input
						type="text"
						className="input"
						name="lastName"
						placeholder="Last name"
						value={this.state.lastName}
						onChange={this.handleInput}
					/>
					<button type="submit" value="Submit">
						Save
					</button>
				</Form>
			</div>
		);
	}
}

const mapStateToProps = state => {
	return {
		email: state.userReducers.email,
		username: state.userReducers.username,
		firstName: state.userReducers.firstName,
		lastName: state.userReducers.LastName
	};
};

export default connect(
	mapStateToProps,
	{ updateUser }
)(Settings);

const Form = styled.form`
	display: flex;
	flex-direction: column;
	width: 15%;
`;

const Input = styled.input`
	margin-bottom: 20px;
	padding-left: 10px;
	font-size: 1rem;
`;

const Label = styled.label`
	margin-bottom: 10px;
`;
