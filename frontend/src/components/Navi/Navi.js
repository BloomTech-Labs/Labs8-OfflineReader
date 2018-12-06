import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import styled from 'styled-components';

const NaviDiv = styled.div`
	width: 100%;
	height: 40px;
	margin-bottom: 2rem;
	box-shadow: 0px 0px 30px -3px rgba(0, 0, 0, 0.75);
	display: flex;
	justify-content: center;
	@media (max-width: 800px) {
		flex-direction: column;
		justify-content: flex-start;
	}
`;

const NaviSubDiv = styled.div`
	width: 80%;
	display: flex;
	justify-content: space-between;
	@media (max-width: 800px) {
		display: none;
	}
`;

const HamburgerDiv = styled.div`
	display: flex;
	flex-direction: column;
`;

const HamburgerButton = styled.a`
	width: 2rem;
	padding: 0.75rem;
	img {
		width: 24px;
	}
	@media (min-width: 800px) {
		display: none;
		width: 100%;
	}
`;

const HamburgerMenu = styled.div`
	margin: 41px 0 0 0;
	z-index: 98;
	position: absolute;
	display: none;
	width: 20%;
	height: 500px;
	flex-direction: column;
	justify-content: space-between;
	background: white;
	${HamburgerDiv}:hover & {
		display: flex;
	}
`;

const navLinks = [
	{ to: '/', exact: true, text: 'Home' },
	{ to: '/articles', exact: false, text: 'My Pages' },
	{ to: '/settings', exact: false, text: 'Settings' },
	{ to: '/signin', exact: false, text: 'Sign In' },
	// { to: '/signout', exact: false, text: 'Sign Out' },
	// { to: '/signup', exact: false, text: 'Sign Up' },
	{ to: '/payment', exact: false, text: 'Payment' }
];

class Navi extends Component {
	linkGen = linkList => {
		let count = -1;
		return linkList.map(link => {
			count++;
			return (
				<NavLink exact={link.exact} to={link.to} key={count}>
					{link.text}
				</NavLink>
			);
		});
	};

	render() {
		return (
			<NaviDiv>
				<HamburgerDiv>
					<HamburgerButton href="#">
						<img
							src="https://i.imgur.com/L0Olnc0.png"
							alt="Menu button"
							width="100%"
						/>
					</HamburgerButton>
					<HamburgerMenu>
						{this.linkGen(navLinks).map(link => link)}
					</HamburgerMenu>
				</HamburgerDiv>
				<NaviSubDiv>
					<h3>Anywhere Reader</h3>
					{this.linkGen(navLinks).map(link => link)}
				</NaviSubDiv>
			</NaviDiv>
		);
	}
}

export default Navi;
