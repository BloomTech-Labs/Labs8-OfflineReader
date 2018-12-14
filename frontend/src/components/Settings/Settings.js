import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const SetDiv = styled.div`
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	padding-top: 100px;
	h2 {
		font-size: 2.8rem;
	}
`;

const SetForm = styled.form`
	display: flex;
	flex-direction: column;
	input {
		width: 400px;
	}
`;

// username and email value are set to read only.
const ReadOnlyInput = styled.input`
	margin-bottom: 20px;
	padding-left: 1%;
	font-size: 1.4rem;
	color: #756f79;
`;

const SetInput = styled.input`
	margin-bottom: 20px;
	padding-left: 1%;
	font-size: 1.6rem;
	color: #282e40;
`;

const SetLabel = styled.label`
	margin-bottom: 10px;
	font-size: 1.6rem;
`;

const SubBnt = styled.button`
	width: 100px;
	height: 2.2rem;
	margin-top: 2rem;
	font-size: 1.4rem;
	border-radius: 2px;
`;

class Settings extends Component {
	constructor(props) {
		super(props);
		this.state = {
			pk: -1,
			username: '',
			email: '',
			firstName: '',
			lastName: ''
		};
	}

	componentDidMount = () => {
		if (
			this.state.firstName !== this.props.firstName ||
			this.state.lastName !== this.props.lastName
		) {
			this.setState({
				...this.state,
				pk: this.props.user.pk,
				username: this.props.user.username,
				email: this.props.user.email,
				firstName: this.props.user.firstName,
				lastName: this.props.user.lastName
			});
		}
	};

	componentDidUpdate(prevProps) {
		if (prevProps.user !== this.props.user) {
			this.setState({
				...this.state,
				pk: this.props.user.pk,
				username: this.props.user.username,
				email: this.props.user.email,
				firstName: this.props.user.firstName,
				lastName: this.props.user.lastName
			});
		}
	}

	handleInput = e => {
		this.setState({
			...this.state,
			[e.target.name]: e.target.value
		});
	};

	handleSubmit = e => {
		e.preventDefault();
		const user = {
			pk: this.state.pk,
			username: this.state.username,
			email: this.state.email,
			first_name: this.state.firstName,
			last_name: this.state.lastName
		};
		this.props.updateUser(user, this.props.accessToken);
	};

	render() {
		return (
			<SetDiv>
				<h2>Profile</h2>
				<br />
				<SetForm onSubmit={this.handleSubmit}>
					<br />
					<SetLabel className="label">Username:</SetLabel>
					<ReadOnlyInput
						type="text"
						className="input"
						name="username"
						// placeholder="Username"
						value={this.state.username}
						// onChange={this.handleInput}
						readOnly
					/>
					<SetLabel className="label">Email:</SetLabel>
					<ReadOnlyInput
						type="text"
						className="input"
						name="email"
						// placeholder="Email"
						value={this.state.email}
						// onChange={this.handleInput}
						readOnly
					/>
					<SetLabel className="label">First name:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="firstName"
						placeholder="First name"
						value={this.state.firstName}
						onChange={this.handleInput}
					/>
					<SetLabel className="label">Last name:</SetLabel>
					<SetInput
						type="text"
						className="input"
						name="lastName"
						placeholder="Last name"
						value={this.state.lastName}
						onChange={this.handleInput}
					/>
					{this.props.updateMessage === '200' ? (
						<p>Info updated successfully!</p>
					) : null}
					<SubBnt>Save</SubBnt>
				</SetForm>
			</SetDiv>
		);
	}
}

Settings.propTypes = {
	user: PropTypes.shape({
		pk: PropTypes.number,
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.bool
	}).isRequired,
	accessToken: PropTypes.string.isRequired,
	updateMessage: PropTypes.string.isRequired,
	updateUser: PropTypes.func.isRequired
};

export default Settings;
