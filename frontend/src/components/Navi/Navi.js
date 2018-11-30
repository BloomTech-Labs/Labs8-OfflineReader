import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
// import styled from 'styled-components';

import { GoogleAuthContainer } from '../../containers';

class Navi extends Component {
	render() {
		return (
			<div>
				<h3>Anywhere Reader</h3>
				<NavLink exact to="/landingpage">
					Home
				</NavLink>
				<NavLink to="/testScraperFormContainer"> My Pages </NavLink>
				<NavLink to="/signIn">Sign In </NavLink>
				<NavLink to="/signUp">Sign Up </NavLink>
				<NavLink to="/payment">Payment </NavLink>
				<GoogleAuthContainer />
			</div>
		);
	}
}

export default Navi;
