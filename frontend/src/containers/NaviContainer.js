import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
// import {} from '../store/actions';

import { Navi } from '../components';

class NaviContainer extends Component {
	render() {
		// The property state.userReducers.auth.serverToken.data is only ever set if the user successfully
		// authenticates with Facebook, and then authrorizes with the backend server, allowing us to use
		// the existence of the property as an indicator of whether we show the "Sign In" or "Sign Out"
		// link in the navigation
		return (
			<Navi
				{...this.props}
				signedIn={
					this.props.serverToken.data ? (
						<NavLink to="/signout">Sign Out</NavLink>
					) : (
						<NavLink to="/signin">Sign In</NavLink>
					)
				}
			/>
		);
	}
}

NaviContainer.propTypes = {
	serverToken: PropTypes.object.isRequired
};

const mapStateToProps = state => {
	return {
		serverToken: state.userReducers.auth.serverToken
	};
};

export default connect(
	mapStateToProps,
	{}
)(NaviContainer);
