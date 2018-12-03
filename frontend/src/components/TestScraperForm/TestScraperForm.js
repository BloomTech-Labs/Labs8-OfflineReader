import React, { Component } from 'react';
import styled from 'styled-components';
// import PropTypes from 'prop-types';

const Container = styled.div`
	text-align: center;
	font-family: 'Roboto', sans-serif;
`;

const Form = styled.form`
	border-radius: 40px;
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
		this.props.sendURL(this.state.inputData, this.props.serverToken);
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
				<Form>
					Input Article URL here:
					<input
						type="text"
						name="url"
						placeholder="www.cnn.com"
						value={this.state.inputData.url}
						onChange={this.handleInput}
					/>
					<button onClick={this.handleURL}>Save Article</button>
				</Form>
			</Container>
		);
	}
}

// TestScraperForm.propTypes = {};

export default TestScraperForm;
