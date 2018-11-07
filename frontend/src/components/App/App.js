import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { SignInPage, SignUpPage } from '../';

class App extends Component {
	render() {
		return (
			<Router>
				<div className="App">
					<h1>Anywhere Reader</h1>
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
				</div>
			</Router>
		);
	}
}

export default App;
