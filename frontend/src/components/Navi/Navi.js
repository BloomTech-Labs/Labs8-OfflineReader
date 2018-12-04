import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import styled from 'styled-components';

// import { GoogleAuthContainer } from '../../containers';

const NaviContainer = styled.div`
	width: 100%;
	margin-bottom: 2rem;
	box-shadow: 0px 0px 30px -3px rgba(0, 0, 0, 0.75);
	display: flex;
	justify-content: center;
	@media (max-width: 800px) {
		flex-direction: column;
		justify-content: flex-start;
	}
`;

const NaviSubContainer = styled.div`
	width: 80%;
	display: flex;
	justify-content: space-between;
	@media (max-width: 800px) {
		display: none;
	}
`;

const HamburgerContainer = styled.div`
	display: flex;
	flex-direction: column;
`;

const HamburgerButton = styled.a`
	width: 2rem;
	padding: 0.75rem;
	@media (min-width: 800px) {
		display: none;
		width: 100%;
	}
`;

const HamburgerMenu = styled.div`
	display: none;
	width: 20%;
	height: 500px;
	flex-direction: column;
	justify-content: space-between;
	background: white;
	${HamburgerContainer}:hover & {
		display: flex;
	}
`;

class Navi extends Component {
	render() {
		return (
			<NaviContainer>
				<HamburgerContainer>
					<HamburgerButton href="#">
						<img src="https://i.imgur.com/L0Olnc0.png" alt="" width="100%" />
					</HamburgerButton>
					<HamburgerMenu>
						<NavLink exact to="/">
							Home
						</NavLink>
						<NavLink to="/testScraperFormContainer"> My Pages </NavLink>
						<NavLink to="/signIn">Sign In </NavLink>
						<NavLink to="/signUp">Sign Up </NavLink>
						<NavLink to="/payment">Payment </NavLink>
						{/* <GoogleAuthContainer /> */}
					</HamburgerMenu>
				</HamburgerContainer>
				<NaviSubContainer>
					<h3>Anywhere Reader</h3>
					<NavLink exact to="/">
						Home
					</NavLink>
					<NavLink to="/testScraperFormContainer"> My Pages </NavLink>
					<NavLink to="/signIn">Sign In </NavLink>
					<NavLink to="/signUp">Sign Up </NavLink>
					<NavLink to="/payment">Payment </NavLink>
					{/* <GoogleAuthContainer /> */}
				</NaviSubContainer>
			</NaviContainer>
		);
	}
}

export default Navi;
