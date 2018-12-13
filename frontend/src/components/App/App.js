import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import styled, { createGlobalStyle } from 'styled-components';

import {
	AuthHOC,
	NaviContainer,
	SettingsContainer,
	SignInContainer,
	SignOutContainer,
	TestScraperFormContainer
} from '../../containers';
import {
	LandingPage,
	// SignedUp,
	// SignUp,
	StripeProviderStub // TODO: Create StripeProviderStubContainer for StripeProviderStub component
} from '../';
import { GlobalResets, SiteResets } from '../../styling';
import { colors } from '../../styling';

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
	height: 100%;
`;

const Background = styled.div`
	background: ${colors.background};
	position: fixed;
	height: 100vh;
	width: 100%;
	z-index: -1;
	top: 0;
`;

class App extends Component {
	render() {
		return (
			<Router>
				<React.Fragment>
					<AppDiv>
						<CssResets />
						<NaviContainer />
						<Route exact path="/" component={LandingPage} />
						<Route
							path="/articles"
							component={AuthHOC(TestScraperFormContainer)}
						/>
						<Route path="/payment" component={AuthHOC(StripeProviderStub)} />
						<Route path="/settings" component={AuthHOC(SettingsContainer)} />
						<Route path="/signin" component={SignInContainer} />
						<Route path="/signout" component={SignOutContainer} />
						{/* <Route path="/signup" component={SignUp} /> */}
						{/* <Route path="/signedup" component={SignedUp} /> */}
					</AppDiv>
					<Background />
				</React.Fragment>
			</Router>
		);
	}
}

export default App;
