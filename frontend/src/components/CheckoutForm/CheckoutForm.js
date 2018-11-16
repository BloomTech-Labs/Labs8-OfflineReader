import React, { Component } from 'react';
import { CardElement, injectStripe } from 'react-stripe-elements';

class CheckoutForm extends Component {
	constructor(props) {
		super(props);
		this.state = {
			resp_message: '',
			card_errors: '',
			username: 'joebob',
			complete: false
		};
	}

	handleCardErrors = card_dets => {
		// console.log("Card Section dets", card_dets);
		if (card_dets.error) {
			this.setState({ ...this.state, card_errors: card_dets.error.message });
		} else {
			this.setState({ ...this.state, card_errors: '' });
		}
	};

	handleSubmit = e => {
		e.preventDefault();
		this.setState({ ...this.state, card_errors: '', resp_message: '' });
		/*
    Within the context of Elements, this call to createToken knows which
    Element to tokenize, since there's only one in this group.
    */
		return this.props.stripe
			.createToken({ type: 'card', name: 'Borislav Hadzhiev' })
			.then(result => {
				if (result.error) {
					// console.log('THERE IS AN ERROR IN YOUR FORM', result.error);
					return this.setState({
						...this.state,
						card_errors: result.error.message
					});
				} else {
					// console.log(
					// 	'Received Stripe token ---> SENDING TO SERVER: ',
					// 	result.token
					// );
					let formData = new FormData();
					formData.append('description', 'My form description');
					formData.append('currency', 'usd');
					formData.append('amount', 999);
					formData.append('source', result.token.id);
					return fetch(`http://127.0.0.1:8000/api/create-charge/`, {
						method: 'POST',
						headers: {
							accept: 'application/json'
						},
						body: formData
					})
						.then(resp => resp.json())
						.then(json =>
							this.setState({ ...this.state, resp_message: json.message })
						);
				}
			});
	};

	render() {
		return (
			<div>
				{this.state.resp_message && <h1>{this.state.resp_message}</h1>}
				<form onSubmit={this.handleSubmit}>
					<label>
						<h2>Card Details</h2>
						<CardElement
							style={{
								base: {
									color: '#32325d',

									fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
									fontSmoothing: 'antialiased',
									fontSize: '16px',
									'::placeholder': {
										color: '#aab7c4'
									}
								},
								invalid: {
									color: '#fa755a',
									iconColor: '#fa755a'
								}
							}}
							onChange={this.handleCardErrors}
						/>
						<div role="alert">
							<h2>{this.state.card_errors}</h2>
						</div>
					</label>
					<button className="form-btn">Confirm order</button>
				</form>
			</div>
		);
	}
}

export default injectStripe(CheckoutForm);
