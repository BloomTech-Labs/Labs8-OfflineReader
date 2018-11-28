import React, { Component } from 'react';
import './App.css';
import { connect } from 'react-redux';
import { sendURL } from '../../store/actions';
import TestScraperForm from './TestScraperForm';

class App extends Component {
	state = {
		inputData: {
			url: ''
		}
	};

	componentDidMount() {
		//When mounted, run the sendURL action which calls the API
		this.props.sendURL();
	}

	handleInput = event => {
		//Event handler for when you start typing in a form
		this.setState({
			inputData: {
				...this.state.inputData,
				[event.target.name]: event.target.value
			}
		});
	};

	handleURL = event => {
		//Event handler for when you click a button that you want to trigger info added
		event.preventDefault();
		this.props.sendURL(this.state.inputData);
		this.resetForm();
	};

	resetForm() {
		this.setState({
			inputData: {
				url: ''
			}
		});
	}

	render() {
		return (
			<div className="App">
				<TestScraperForm
					inputData={this.state.inputData}
					handleInput={this.handleInput}
					handleURL={this.handleURL}
				/>
			</div>
		);
	}
}

const mapStateToProps = state => {
	return {
		//Mps actions and reducers to the state
		sendingURL: state.sendingURL,
		urlSent: state.urlSent,
		error: state.error
	};
};

export default connect(
	mapStateToProps,
	{
		sendURL
	}
)(App);
