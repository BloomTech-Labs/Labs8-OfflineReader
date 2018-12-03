import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import styled from 'styled-components';

import { TestScraperFormContainer } from '../../containers';
import {
	SignInPage,
	SignUpPage,
	SignedIn,
	SignedUp,
	Navi,
	StripeProviderStub,
	Settings,
	LandingPage
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
					<Route
						path="/testScraperFormContainer"
						component={TestScraperFormContainer}
					/>
					<Route exact path="/" component={LandingPage} />
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
					<Route path="/signedIn" component={SignedIn} />
					<Route path="/signedUp" component={SignedUp} />
					<Route path="/payment" component={StripeProviderStub} />
					<Route path="/settings" component={Settings} />
				</AppContainer>
			</Router>
		);
	}
}

export default App;
