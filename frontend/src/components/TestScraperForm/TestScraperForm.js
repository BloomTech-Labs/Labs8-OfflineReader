import React, { Component } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const Container = styled.div`
	margin-top: 0.3rem;
	text-align: center;
	font-family: 'Roboto', sans-serif;
	z-index: 100;
`;

const Input = styled.input`
	padding: 1rem;
	margin: 0.5em;
	border: 1px solid #efefef;
	border-radius: 30px;
	box-shadow: 0px 0px 7px -3px rgba(0, 0, 0, 0.66);
	font-size: 1.5rem;
	width: 250px;
	&:focus {
		box-shadow: 0 0 3pt 2pt rgba(49, 132, 242, 1);
		outline: none;
	}
`;

class TestScraperForm extends Component {
	state = {
		inputData: {
			url: ''
		}
	};

	handleInput = event => {
		//Event handler for when you start typing in a form
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				[event.target.name]: event.target.value
			}
		});
	};

	handleURL = event => {
		//Event handler for when you click a button that you want to trigger info added
		event.preventDefault();
		this.props.sendUrl(this.state.inputData, this.props.serverToken);
		console.log('inputData:', this.state.inputData);
		this.resetForm();
	};

	resetForm() {
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				url: ''
			}
		});
	}

	render() {
		return (
			<Container>
				<form>
					<Input
						type="text"
						name="url"
						placeholder="http://..."
						value={this.state.inputData.url}
						onChange={this.handleInput}
					/>
					<button onClick={this.handleURL}>Save</button>
				</form>
			</Container>
		);
	}
}

TestScraperForm.propTypes = {
	serverToken: PropTypes.object.isRequired,
	sendUrl: PropTypes.func.isRequired
};

export default TestScraperForm;
