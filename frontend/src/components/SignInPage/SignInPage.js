import React, { Component } from 'react';
import { Link, Redirect } from 'react-router-dom';
import { auth } from '../../store/actions';
import { connect } from 'react-redux';

class Login extends Component {
	onSubmit = e => {
		e.preventDefault();
		this.props.login(this.state.username, this.state.password);
	};

	render() {
		if (this.props.isAuthenticated) {
			return <Redirect to="/" />;
		}
		return (
			<form onSubmit={this.onSubmit}>
				<fieldset>
					<legend>Login</legend>
					{this.props.errors.length > 0 && (
						<ul>
							{this.props.errors.map(error => (
								<li key={error.field}>{error.message}</li>
							))}
						</ul>
					)}
					{/*KEEP THE OTHER ELEMENTS*/}
				</fieldset>
			</form>
		);
	}
}

const mapStateToProps = state => {
	let errors = [];
	if (state.auth.errors) {
		errors = Object.keys(state.auth.errors).map(field => {
			return { field, message: state.auth.errors[field] };
		});
	}
	return {
		errors,
		isAuthenticated: state.auth.isAuthenticated
	};
};

const mapDispatchToProps = dispatch => {
	return {
		login: (username, password) => {
			return dispatch(auth.login(username, password));
		}
	};
};

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(Login);
