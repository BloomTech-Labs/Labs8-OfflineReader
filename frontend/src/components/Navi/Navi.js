import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import styled from 'styled-components';

const LogoDiv = styled.div`
	width: 170px;
	display: flex;
	justify-content: space-between;
	margin-right: 2rem;
	margin-left: 2rem;
`;

const NaviDiv = styled.div`
	width: 100%;
	height: 60px;
	margin-bottom: 2rem;
	display: flex;
	justify-content: center;
	align-items: center;
	@media (max-width: 800px) {
		flex-direction: column;
		justify-content: flex-start;
	}
	z-index: 98;
	position: fixed;
	background-color: rgb(226, 207, 195);
	box-shadow: 0px 3px 21px 0px rgba(0, 0, 0, 0.75);
`;

const NaviSubDiv = styled.div`
	width: 65%;
	display: flex;
	justify-content: space-between;
	h3 {
		color: black;
		font-family: Sans-Serif;
		font-size: 16px;
	}
	a {
		text-decoration: none;
		color: black;
		font-family: Sans-Serif;
		font-size: 16px;
	}
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
					<LogoDiv>
						<img
							src="https://i.imgur.com/b0dD4XV.png"
							alt=""
							height="25px"
							width="25px"
						/>
						<h3>Anywhere Reader</h3>
					</LogoDiv>
					{this.linkGen(navLinks).map(link => link)}
				</NaviSubDiv>
			</NaviDiv>
		);
	}
}

export default Navi;
