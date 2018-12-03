import React, { Component } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const Container = styled.div`
	text-align: center;
	font-family: 'Roboto', sans-serif;
`;

const Input = styled.input`
	padding: 1em;
	margin: 0.5em;
	border: 1px solid #efefef;
	border-radius: 30px;
	box-shadow: 0px 5px 17px -3px rgba(0, 0, 0, 0.75);
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
						placeholder="input article url here"
						value={this.state.inputData.url}
						onChange={this.handleInput}
					/>
					<button onClick={this.handleURL}>Save Article</button>
				</form>
			</Container>
		);
	}
}

TestScraperForm.propTypes = {
	serverToken: PropTypes.string.isRequired,
	sendUrl: PropTypes.func.isRequired
};

export default TestScraperForm;
