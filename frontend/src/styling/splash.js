import styled from 'styled-components';

import coffeeBg from '../assets/pexels-photo-904616.jpg';

export const LandingPageDiv = styled.div`
	background: url(${coffeeBg}) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	min-height: 100%;
	min-width: 100%;
	position: absolute;
	display: flex;
	flex-direction: column;
	align-items: center;
	@media (max-width: 500px) {
		width: 100%;
	}
`;
