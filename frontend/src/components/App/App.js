import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import styled from 'styled-components';

import {
	AuthHOC,
	SignInContainer,
	TestScraperFormContainer
} from '../../containers';
import {
	LandingPage,
	Navi,
	Settings,
	// SignedIn,
	// SignIn,
	// SignedUp,
	// SignUpPage,
	StripeProviderStub
} from '../';

const AppDiv = styled.div`
	display: flex;
	flex-direction: column;
	align-items: center;
`;

class App extends Component {
	render() {
		return (
			<Router>
				<AppDiv>
					<Navi />

					<Route exact path="/" component={LandingPage} />
					<Route
						path="/articles"
						component={AuthHOC(TestScraperFormContainer)}
					/>
					<Route path="/payment" component={AuthHOC(StripeProviderStub)} />
					<Route path="/settings" component={AuthHOC(Settings)} />
					<Route path="/signin" component={SignInContainer} />
					{/* <Route path="/signup" component={SignUpPage} /> */}
					{/* <Route path="/signedin" component={SignedIn} /> */}
					{/* <Route path="/signedup" component={SignedUp} /> */}
				</AppDiv>
			</Router>
		);
	}
}

export default App;
