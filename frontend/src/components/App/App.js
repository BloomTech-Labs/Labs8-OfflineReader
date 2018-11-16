import React, { Component } from 'react';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom';
import { SignInPage, SignUpPage, SignedIn, SignedUp } from '../';
import { MyStoreCheckout } from '../CheckoutForm';
import { StripeProvider } from 'react-stripe-elements';

class App extends Component {
	constructor(props) {
		super(props);
		this.state = { stripe: '' };
	}

	componentDidMount() {
		if (window.Stripe) {
			this.setState({
				stripe: window.Stripe(process.env.REACT_APP_publishable)
			});
		} else {
			document.querySelector('#stripe-js').addEventListener('load', () => {
				//Create Stripe instance once Stripe.js loads
				this.setState({
					stripe: window.Stripe(process.env.REACT_APP_publishable)
				});
			});
		}
	}

	render() {
		return (
			this.state.stripe && (
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
						<Route
							path="/payment"
							render={props => (
								<StripeProvider stripe={this.state.stripe}>
									<MyStoreCheckout {...props} />
								</StripeProvider>
							)}
						/>
					</div>
				</Router>
			)
		);
	}
}

export default App;
