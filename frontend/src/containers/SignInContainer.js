import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { Redirect } from 'react-router-dom';
// import { registerUser, loginUser, logoutUser } from '../store/actions';

import { SignIn } from '../components';

class SignInContainer extends Component {
	render() {
		if (this.props.userSuccess) {
			return <Redirect to="/articles" />;
		} else {
			return <SignIn {...this.props} />;
		}
	}
}

SignInContainer.propTypes = {
	// user: PropTypes.shape({
	// 	username: PropTypes.string,
	// 	email: PropTypes.string,
	// 	firstName: PropTypes.string,
	// 	lastName: PropTypes.string,
	// 	premium: PropTypes.bool
	// }).isRequired,
	// auth: PropTypes.shape({
	// 	// serverToken: PropTypes.object
	// }).isRequired,
	// userStatus: PropTypes.shape({
	// 	fetching: PropTypes.bool,
	// 	success: PropTypes.bool,
	// 	newUser: PropTypes.bool,
	// 	message: PropTypes.string,
	// 	error: PropTypes.string
	// }).isRequired,
	// registerUser: PropTypes.func.isRequired,
	// loginUser: PropTypes.func.isRequired,
	// logoutUser: PropTypes.func.isRequired,
	userSuccess: PropTypes.bool.isRequired
};

const mapStateToProps = state => {
	return {
		userSuccess: state.userReducers.userStatus.success
	};
};

export default connect(
	mapStateToProps,
	{}
)(SignInContainer);
