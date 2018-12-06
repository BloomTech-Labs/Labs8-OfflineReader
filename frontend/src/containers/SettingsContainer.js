import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { updateUser } from '../store/actions';

import { Settings } from '../components';

class SettingsContainer extends Component {
	render() {
		return <Settings {...this.props} />;
	}
}

SettingsContainer.propTypes = {
	user: PropTypes.shape({
		username: PropTypes.string,
		email: PropTypes.string,
		firstName: PropTypes.string,
		lastName: PropTypes.string,
		premium: PropTypes.string
	}).isRequired,
	updateUser: PropTypes.func.isRequired
};

const mapStateToProps = state => {
	return {
		user: state.userReducers.user
	};
};

export default connect(
	mapStateToProps,
	{ updateUser }
)(SettingsContainer);
