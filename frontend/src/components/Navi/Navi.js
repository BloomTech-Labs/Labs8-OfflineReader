import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
// import styled from 'styled-components';

import { GoogleAuthContainer } from '../../containers';

class Navi extends Component {
	render() {
		return (
			<div>
				<h3>Anywhere Reader</h3>
				{/* <NavLink exact to="/">Home</NavLink> */}
				<NavLink to="/testScraperFormContainer">Add a new article</NavLink>
				<NavLink to="/signIn">Sign In</NavLink>
				<NavLink to="/signUp">Sign Up</NavLink>
				<NavLink to="/payment">Payment</NavLink>
				<NavLink to="/settings">Settings</NavLink>
				<GoogleAuthContainer />
			</div>
		);
	}
}

export default Navi;
