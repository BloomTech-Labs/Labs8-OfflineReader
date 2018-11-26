import React, { Component } from 'react';
import { StripeProvider } from 'react-stripe-elements';
import MyStoreCheckout from './MyStoreCheckout';

//StripeProvider gives us access to the Stripe Object
//i.e Stripe.createToken, stripe.elements() etc
//App loads the stripe script asynchronously in CDM

class StripeProviderStub extends Component {
	// constructor(props) {
	// 	super(props);
	// }

	render() {
		return (
			<StripeProvider apiKey="pk_test_2rPuyENL1sfpQAu8wCPX6Fx5">
				<MyStoreCheckout />
			</StripeProvider>
		);
	}
}

export default StripeProviderStub;
