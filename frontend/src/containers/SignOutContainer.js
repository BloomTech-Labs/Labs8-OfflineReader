import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { clearPages, logoutFlag, logoutUser } from '../store/actions';

import { SignOut } from '../components';

class SignOutContainer extends Component {
	componentDidMount = () => {
		this.props.logoutFlag();
	};

	componentWillUnmount = () => {
		this.props.logoutUser(this.props.accessToken);
		this.props.clearPages();
	};

	render() {
		return <SignOut />;
	}
}

SignOutContainer.propTypes = {
	clearPages: PropTypes.func.isRequired,
	logoutFlag: PropTypes.func.isRequired,
	logoutUser: PropTypes.func.isRequired
};

const mapStateToProps = state => {
	// The value of accessToken is set as such due to the possibility that the end-user could potentially hard-refresh
	// while still on the Sign Out page, causing it to flush the state in the process, after which serverToken would
	// just be an empty object. With that in mind, we first check if there's a data property on serverToken, and if so
	// we set accessToken to state.userReducers.auth.serverToken.data.access_token because there's always one with the
	// other. Failing the existence of state.userReducers.auth.serverToken.data, we set accessToken to an empty string,
	// giving the SignOut container *something* to pass to logoutUser() rather than leaving it undefined.
	return {
		accessToken:
			(state.userReducers.auth.serverToken.data &&
				state.userReducers.auth.serverToken.data.access_token) ||
			''
	};
};

export default connect(
	mapStateToProps,
	{ clearPages, logoutFlag, logoutUser }
)(SignOutContainer);
