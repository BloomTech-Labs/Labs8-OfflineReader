import React, { Component } from 'react';
import { Elements } from 'react-stripe-elements';
import InjectedCheckoutForm from './CheckoutForm';

// <Eliments /> grouping Stripe elements together.

class MyStoreCheckout extends Component {
	render() {
		return (
			<Elements>
				<InjectedCheckoutForm />
			</Elements>
		);
	}
}

export default MyStoreCheckout;
