import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import TestScraperFormContainer from '../TestScraperForm/TestScraperFormContainer';
import {
	SignInPage,
	SignUpPage,
	SignedIn,
	SignedUp,
	Navi,
	StripeProviderStub
} from '../';

class App extends Component {
	render() {
		return (
			<Router>
				<div>
					<Navi />
					<TestScraperFormContainer />
					{/* <Route exact to="/" component={} /> */}
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
					<Route path="/signedIn" component={SignedIn} />
					<Route path="/signedUp" component={SignedUp} />
					<Route path="/payment" component={StripeProviderStub} />
				</div>
			</Router>
		);
	}
}

export default App;
