import React, { Component } from 'react';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom';
import { SignInPage, SignUpPage, SignedIn, SignedUp } from '../';
import { Elements, StripeProvider } from 'react-stripe-elements';
import { CheckoutForm } from '../CheckoutForm';

class App extends Component {
	render() {
		return (
			<Router>
				<div className="App">
					<h1>Anywhere Reader</h1>
					<NavLink to="/signIn">Sign In</NavLink>
					<NavLink to="/signUp">Sign Up</NavLink>
					<NavLink to="/payment">Payment</NavLink>
					<Route path="/signIn" component={SignInPage} />
					<Route path="/signUp" component={SignUpPage} />
					<Route path="/signedIn" component={SignedIn} />
					<Route path="/signedUp" component={SignedUp} />
					<StripeProvider apiKey="pk_test_2rPuyENL1sfpQAu8wCPX6Fx5">
						<Elements>
							<Route path="/payment" component={CheckoutForm} />
						</Elements>
					</StripeProvider>
					{/* <StripeProvider apiKey="pk_test_12345">
						<MyStoreCheckout />
					</StripeProvider> */}
				</div>
			</Router>
		);
	}
}

export default App;
