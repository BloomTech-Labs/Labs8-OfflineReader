import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { registerUser, loginUser, logoutUser } from '../store/actions';

import { FBAuth } from '../components';

class FBAuthContainer extends Component {
	render() {
		return <FBAuth {...this.props} />;
	}
}

FBAuthContainer.propTypes = {
	user: PropTypes.shape({
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.string
	}).isRequired,
	auth: PropTypes.shape({
		// googleClientId: PropTypes.string
		// serverToken: PropTypes.object //TODO: flesh out this prop type
	}).isRequired,
	userStatus: PropTypes.shape({
		fetching: PropTypes.bool,
		success: PropTypes.bool,
		newUser: PropTypes.bool,
		message: PropTypes.string,
		error: PropTypes.string
	}).isRequired,
	registerUser: PropTypes.func.isRequired,
	loginUser: PropTypes.func.isRequired,
	logoutUser: PropTypes.func.isRequired
};

const mapStateToProps = state => {
	return {
		user: state.userReducers.user,
		auth: state.userReducers.auth,
		userStatus: state.userReducers.userStatus
	};
};

export default connect(
	mapStateToProps,
	{ registerUser, loginUser, logoutUser }
)(FBAuthContainer);
