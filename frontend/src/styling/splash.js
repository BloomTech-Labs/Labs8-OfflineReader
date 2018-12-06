import styled from 'styled-components';

import coffeeBg from '../assets/pexels-photo-904616.jpg';

export const LandingPageDiv = styled.div`
	display: flex;
	flex-direction: column;
	align-items: center;
	background: url(${coffeeBg}) no-repeat center center fixed;
	min-width: 600px;
	min-height: 600px;
	border-radius: 15px;
`;
