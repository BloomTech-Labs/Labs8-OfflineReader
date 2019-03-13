import React, { Component } from 'react';
import styled from 'styled-components';
import { colors } from '../../styling';

const Wrapper = styled.div`
	display: none;
	justify-content: space-around;
	align-items: center;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	border-radius: 5px;
`;

const ButtonContainer = styled.div`
	background: white;
	border-radius: 5px;
	width: 80%;
	height: 100px;
	z-index: 91;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	border-color: ${colors.mineShaft};
	border-width: 2px;
	border-style: solid;
`;

const Button = styled.button`
	border-radius: 5px;
	height: 40px;
	width: 100px;
	opacity: 1;
	z-index: 92;
	font-size: 1.8rem;
	color: ${colors.white};
	border-width: 1px;
	border-color: ${colors.mineShaft};
	opacity: 0.9;
	cursor: pointer;
`;

const BG = styled.div`
	background: ${colors.mineShaft};
	z-index: 90;
	display: flex;
	justify-content: space-around;
	align-items: center;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	border-radius: 5px;
	opacity: 0.8;
`;

const DeleteButton = styled(Button)`
	background: #e51414;
`;
const CancelButton = styled(Button)`
	background: white;
	color: black;
`;

class DeleteModal extends Component {
	render() {
		return (
			<Wrapper
				style={
					this.props.showingModal ? { display: 'flex' } : { display: 'none' }
				}
			>
				<ButtonContainer>
					<h2>Are you sure you want to delete?</h2>
					<CancelButton onClick={this.props.handleModal}>Keep</CancelButton>
					<DeleteButton>Delete</DeleteButton>
				</ButtonContainer>
				<BG />
			</Wrapper>
		);
	}
}

export default DeleteModal;
