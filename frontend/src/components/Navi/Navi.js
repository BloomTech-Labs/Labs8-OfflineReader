import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
// import styled from 'styled-components';

// TODO: Write up Navi test cases after routing has been suitably refactored and no longer throws Route and withRouter errors when doing a Navi render test.
class Navi extends Component {
	render() {
		return (
			<div>
				<h3>Anywhere Reader</h3>
				{/* <NavLink exact to="/">Home</NavLink> */}
				<NavLink to="/signIn">Sign In</NavLink>
				<NavLink to="/signUp">Sign Up</NavLink>
			</div>
		);
	}
}

export default Navi;
