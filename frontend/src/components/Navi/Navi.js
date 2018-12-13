import React, { Component } from 'react';
import { NavLink } from 'react-router-dom';
import styled from 'styled-components';

const NaviDiv = styled.div`
	width: 100%;
	height: 6.4rem;
	margin-bottom: 2rem;
	border-bottom: 1px solid #404040;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 2rem;
	@media (max-width: 800px) {
		flex-direction: column;
		justify-content: flex-start;
	}
	z-index: 98;
	position: fixed;
	background-color: rgba(245, 243, 237, 0.85);
`;

const NaviSubDiv = styled.div`
	width: 80%;
	display: flex;
	justify-content: space-between;
	letter-spacing: 0.5px;
	@media (max-width: 800px) {
		display: none;
	}
`;

// Active tab styling
// https://spectrum.chat/styled-components/help/how-to-use-sc-with-nav-activeclassname~8f753cea-75c3-4524-8207-fd0216026665
// const activeLink = 'active';
// const NavLinkStyle = styled(NavLink).attrs({
// 	activeClassName: activeLink
// })`
// 	text-decoration: none;
// 	color: #282e40;
// 	&.${activeLink} {
// 		text-decoration: underline;
// 		font-weight: 600;
// 	}
// `;

// const NavLinkStyle = styled(NavLink)`
// 	text-decoration: none;
// 	color: #282e40;
// `;

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
	// { to: '/signup', exact: false, text: 'Sign Up' },
	{ to: '/signin', exact: false, text: 'Sign In' },
	{ to: '/payment', exact: false, text: 'Payment' }
];

class Navi extends Component {
	// linkGen = linkList => {
	// 	let count = -1;
	// 	return linkList.map(link => {
	// 		count++;
	// 		return (
	// 			<NavLink
	// 				exact={link.exact}
	// 				to={link.to}
	// 				activeClassName="activeLink"
	// 				key={count}
	// 				className="baseNav"
	// 			>
	// 				{link.text}
	// 			</NavLink>
	// 		);
	// 	});
	// };

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
						{/* {this.linkGen(navLinks).map(link => link)} */}
						{this.props.signedIn}
					</HamburgerMenu>
				</HamburgerDiv>
				<NaviSubDiv>
					<h3>Anywhere Reader</h3>
					{/* {this.linkGen(navLinks).map(link => link)} */}
					{this.props.signedIn}
				</NaviSubDiv>
			</NaviDiv>
		);
	}
}

export default Navi;
