import React, { Component } from 'react';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom';
import { SignInPage, SignUpPage } from '../';

class App extends Component {
	render() {
		return (
			<Router>
				<div className="App">
					<h1>Anywhere Reader</h1>
					<NavLink to="/signIn">Sign In</NavLink>
					<NavLink to="/signUp">Sign Up</NavLink>
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
				</div>
			</Router>
		);
	}
}

export default App;
