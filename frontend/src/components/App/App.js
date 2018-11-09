import React, { Component } from 'react';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom';
import { SignInPage, SignUpPage, SignedIn, SignedUp } from '../';
// import { SignedIn } from '../SignInPage';
// import { SignedUp } from '../SignUpPage';

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
					<Route path="/signedIn" component={SignedIn} />
					<Route path="/signedUp" component={SignedUp} />
				</div>
			</Router>
		);
	}
}

export default App;
