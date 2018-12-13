import React, { Component } from 'react';
import { NavLink, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
// import {} from '../store/actions';

import { Navi } from '../components';

// const NavLinkStyle = styled(NavLink)`
// 	text-decoration: none;
// 	color: #282e40;
// `;

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
					this.props.userSuccess ? (
						<React.Fragment>
							<NavLink
								to="/articles"
								className="baseNav"
								activeClassName="activeLink"
							>
								My Pages
							</NavLink>
							<NavLink
								to="/settings"
								className="baseNav"
								activeClassName="activeLink"
							>
								Settings
							</NavLink>
							<NavLink
								to="/payment"
								className="baseNav"
								activeClassName="activeLink"
							>
								Subscribe
							</NavLink>
							<NavLink
								to="/signout"
								className="baseNav"
								activeClassName="activeLink"
							>
								Sign Out
							</NavLink>
						</React.Fragment>
					) : (
						<React.Fragment>
							<NavLink
								exact
								to="/"
								activeClassName="activeLink"
								className="baseNav"
							>
								Home
							</NavLink>
							<NavLink
								to="/signin"
								activeClassName="activeLink"
								className="baseNav"
							>
								Sign In
							</NavLink>
						</React.Fragment>
					)
				}
			/>
		);
	}
}

NaviContainer.propTypes = {
	userSuccess: PropTypes.bool.isRequired
};

const mapStateToProps = state => {
	return {
		userSuccess: state.userReducers.userStatus.success
	};
};

export default withRouter(
	connect(
		mapStateToProps,
		{}
	)(NaviContainer)
);
