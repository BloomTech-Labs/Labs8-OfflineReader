import React from 'react';
import { NavLink, withRouter } from 'react-router-dom';
import '../index.css';
import styled from 'styled-components';

const NavBarContainer = styled.div`
	display: flex;
	flex-direction: column;
`;

function Navbar(props) {
	return (
		<NavBarContainer>
			<ul className="">
				<li className="">
					<NavLink className="" to="/">
						Home
					</NavLink>
				</li>
			</ul>
		</NavBarContainer>
	);
}

export default withRouter(Navbar);
