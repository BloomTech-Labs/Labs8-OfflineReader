import React, { Component } from 'react';
import { StripeProvider } from 'react-stripe-elements';
import MyStoreCheckout from './MyStoreCheckout';

//StripeProvider gives us access to the Stripe Object
//i.e Stripe.createToken, stripe.elements() etc
//App loads the stripe script asynchronously in CDM

class StripeProviderStub extends Component {
	constructor(props) {
		super(props);
		this.state = { stripe: '' };
	}
	componentDidMount() {
		const stripePubKey = 'pk_test_2rPuyENL1sfpQAu8wCPX6Fx5';
		if (window.Stripe) {
			this.setState({
				stripe: window.Stripe(stripePubKey)
			});
		} else {
			document.querySelector('#stripe-js').addEventListener('load', () => {
				//Create Stripe instance once Stripe.js loads
				this.setState({
					stripe: window.Stripe(stripePubKey)
				});
			});
		}
	}

	render() {
		return (
			this.state.stripe && (
				<StripeProvider stripe={this.state.stripe}>
					<MyStoreCheckout />
				</StripeProvider>
			)
		);
	}
}

export default StripeProviderStub;
