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
		if (window.Stripe) {
			this.setState({
				stripe: window.Stripe(process.env.REACT_APP_stripe_pub)
			});
		} else {
			document.querySelector('#stripe-js').addEventListener('load', () => {
				//Create Stripe instance once Stripe.js loads
				this.setState({
					stripe: window.Stripe(process.env.REACT_APP_stripe_pub)
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
