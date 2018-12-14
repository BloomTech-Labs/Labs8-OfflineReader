import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Redirect } from 'react-router-dom';

const AuthHOC = Protected => {
	class ProtectedChild extends Component {
		render() {
			// Check if the user token from the backend has a status http 200, then return the passed component with props if so
			return this.props.authStatus === 200 ? (
				<Protected {...this.props} />
			) : (
				// Otherwise, redirect to the signin page
				<Redirect to="/signin" />
			);
		}
	}

	const mapStateToProps = state => ({
		// TODO: Update to use state.userReducers.userStatus.success
		authStatus: state.userReducers.auth.serverToken.status || ''
	});

	// returns the constructed component or redirect
	return connect(mapStateToProps)(ProtectedChild);
};

export default AuthHOC;
