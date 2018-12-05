import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import styled from 'styled-components';

import { TestScraperFormContainer } from '../../containers';
import {
	LandingPage,
	Navi,
	Settings,
	// SignedIn,
	SignInPage,
	// SignedUp,
	SignUpPage,
	StripeProviderStub
} from '../';

const AppContainer = styled.div`
	display: flex;
	flex-direction: column;
	align-items: center;
`;

class App extends Component {
	render() {
		return (
			<Router>
				<AppContainer>
					<Navi />

					<Route exact path="/" component={LandingPage} />
					<Route path="/payment" component={StripeProviderStub} />
					<Route path="/signin" component={SignInPage} />
					<Route path="/signup" component={SignUpPage} />
					{/* <Route path="/signedin" component={SignedIn} /> */}
					{/* <Route path="/signedup" component={SignedUp} /> */}
					<Route path="/settings" component={Settings} />
					<Route
						path="/testScraperFormContainer"
						component={TestScraperFormContainer}
					/>
				</AppContainer>
			</Router>
		);
	}
}

export default App;
