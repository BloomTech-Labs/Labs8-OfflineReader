import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import TestScraperFormContainer from '../../containers/TestScraperFormContainer';
import {
	SignInPage,
	SignUpPage,
	SignedIn,
	SignedUp,
	Navi,
	StripeProviderStub,
	Settings
} from '../';

class App extends Component {
	render() {
		return (
			<Router>
				<div>
					<Navi />
					<TestScraperFormContainer />
					{/* <Route exact to="/" component={} /> */}
					{/* <Route
						path="/testScraperFormContainer"
						component={TestScraperFormContainer}
					/> */}
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
					<Route path="/signedIn" component={SignedIn} />
					<Route path="/signedUp" component={SignedUp} />
					<Route path="/payment" component={StripeProviderStub} />
					<Route path="/settings" component={Settings} />
				</div>
			</Router>
		);
	}
}

export default App;
