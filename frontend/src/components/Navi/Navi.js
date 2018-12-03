import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import styled from 'styled-components';
import { GoogleAuthContainer } from '../../containers';

const NaviContainer = styled.div`
	width: 100%;
	margin-bottom: 2rem;
	box-shadow: 0px 0px 30px -3px rgba(0, 0, 0, 0.75);
	display: flex;
	justify-content: center;
`;

const NaviSubContainer = styled.div`
	width: 80%;
	display: flex;
	justify-content: space-between;
`;

class Navi extends Component {
	render() {
		return (
			<NaviContainer>
				<NaviSubContainer>
					<h3>Anywhere Reader</h3>
					<NavLink exact to="/">
						Home
					</NavLink>
					<NavLink to="/testScraperFormContainer"> My Pages </NavLink>
					<NavLink to="/signIn">Sign In </NavLink>
					<NavLink to="/signUp">Sign Up </NavLink>
					<NavLink to="/payment">Payment </NavLink>
					<GoogleAuthContainer />
				</NaviSubContainer>
			</NaviContainer>
		);
	}
}

export default Navi;
