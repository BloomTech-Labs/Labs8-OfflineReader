import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Redirect } from 'react-router-dom';

const AuthHOC = Protected => {
	class ProtectedChild extends Component {
		render() {
			return this.props.authStatus === '200' ? (
				<Protected {...this.props} />
			) : (
				<Redirect to="/signin" />
			);
		}
	}
	const mapStateToProps = state => ({
		authStatus: state.userReducers.auth.serverToken.status
	});

	return connect(mapStateToProps)(ProtectedChild);
};

export default AuthHOC;
