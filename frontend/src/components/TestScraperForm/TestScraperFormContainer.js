import React, { Component } from 'react';
import { connect } from 'react-redux';
import {
	sendURL,
	fetchPages
} from '../../store/actions/testScraperFormActions';
import PageList from './PageList';
import TestScraperForm from './TestScraperForm';

class TestScraperFormContainer extends Component {
	state = {
		inputData: {
			url: ''
		}
	};

	componentDidMount() {
		this.props.fetchPages();
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
		console.log('inputData:' + this.state.inputData);
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
			<div>
				{/* {!this.props.pagesFetched ? (
					<h1>Loading Articles Please Wait...</h1>
				) : (
					<React.Fragment> */}
				<br />
				<br />
				<TestScraperForm
					inputData={this.state.inputData}
					handleInput={this.handleInput}
					handleURL={this.handleURL}
				/>
				<PageList pages={this.props.pages} />
				{/* </React.Fragment>
				)} */}
			</div>
		);
	}
}

const mapStateToProps = state => {
	return {
		//Mps actions and reducers to the state
		fetchingPages: state.testScraperFormReducers.fetchingPages,
		pagesFetched: state.testScraperFormReducers.pagesFetched,
		sendingURL: state.testScraperFormReducers.sendingURL,
		urlSent: state.testScraperFormReducers.urlSent,
		pages: state.testScraperFormReducers.pages,
		error: state.testScraperFormReducers.error
	};
};

export default connect(
	mapStateToProps,
	{
		fetchPages,
		sendURL
	}
)(TestScraperFormContainer);
