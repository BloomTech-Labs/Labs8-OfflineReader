import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import styled, { createGlobalStyle } from 'styled-components';

import {
	AuthHOC,
	SettingsContainer,
	SignInContainer,
	TestScraperFormContainer
} from '../../containers';
import {
	LandingPage,
	Navi,
	// SignedUp,
	// SignUpPage,
	StripeProviderStub // TODO: Create StripeProviderStubContainer for StripeProviderStub component
} from '../';
import { GlobalResets, SiteResets } from '../../styling';

// Only *one* createGlobalStyle per project.
// Having multiple can cause potential inheritance issues,
// and no one wants to deal with that.
const CssResets = createGlobalStyle`
    ${GlobalResets}
    ${SiteResets}
`;

const AppDiv = styled.div`
	/* display: flex;
	flex-direction: column;
	align-items: center; */
`;

class App extends Component {
	render() {
		return (
			<Router>
				<AppDiv>
					<CssResets />
					<Navi />
					<Route exact path="/" component={LandingPage} />
					<Route
						path="/articles"
						component={AuthHOC(TestScraperFormContainer)}
					/>
					<Route path="/payment" component={AuthHOC(StripeProviderStub)} />
					<Route path="/settings" component={AuthHOC(SettingsContainer)} />
					<Route path="/signin" component={SignInContainer} />
					{/* <Route path="/signup" component={SignUpPage} /> */}
					{/* <Route path="/signedup" component={SignedUp} /> */}
				</AppDiv>
			</Router>
		);
	}
}

export default App;
