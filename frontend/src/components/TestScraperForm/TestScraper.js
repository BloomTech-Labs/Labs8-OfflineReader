import React, { Component } from 'react';

import { PageList, TestScraperForm } from './';

class TestScraper extends Component {
	render() {
		return (
			<div>
				<TestScraperForm
					inputData={this.props.inputData}
					handleInput={this.props.handleInput}
					handleURL={this.props.handleURL}
				/>
				<PageList
					pages={this.props.pages}
					showingModal={this.props.showingModal}
				/>
			</div>
		);
	}
}

export default TestScraper;
