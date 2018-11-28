import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { registerUser, loginUser, logoutUser } from '../store/actions';

import { GoogleAuth } from '../components';

class GoogleAuthContainer extends Component {
	render() {
		return <GoogleAuth {...this.props} />;
	}
}

GoogleAuthContainer.propTypes = {
	user: PropTypes.shape({
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.bool
	}).isRequired,
	googleClientId: PropTypes.string.isRequired,
	userStatus: PropTypes.shape({
		fetching: PropTypes.bool,
		success: PropTypes.bool,
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
		googleClientId: state.userReducers.googleClientId,
		userStatus: state.userReducers.userStatus
	};
};

export default connect(
	mapStateToProps,
	{ registerUser, loginUser, logoutUser }
)(GoogleAuthContainer);
