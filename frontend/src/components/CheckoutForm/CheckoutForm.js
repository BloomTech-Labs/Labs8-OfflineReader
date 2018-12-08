import React, { Component } from 'react';
import { CardElement, injectStripe } from 'react-stripe-elements';
import styled from 'styled-components';

const CardStyle = styled.div`
	max-width: 500px;
	width: 100%;
	display: flex;
	flex-direction: column;
`;

const cardElementStyles = {
	base: {
		color: '#32325d',
		fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
		fontSmoothing: 'antialiased',
		fontSize: '1.6rem',
		'::placeholder': {
			color: '#aab7c4'
		}
	},
	invalid: {
		color: '#fa755a',
		iconColor: '#fa755a'
	}
};

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

	// TODO refactor this mess
	backendUrl = () => {
		if (process.env.NODE_ENV === 'production') {
			return `https://anywhere-reader-test.herokuapp.com/api/payments/create-charge/`;
		} else {
			return `http://127.0.0.1:8000/api/payments/create-charge/`;
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
					const backendApi = this.backendUrl();
					let formData = new FormData();
					formData.append('description', 'My form description');
					formData.append('currency', 'usd');
					formData.append('amount', 999);
					formData.append('source', result.token.id);
					return fetch(backendApi, {
						method: 'POST',
						headers: {
							accept: 'application/json'
						},
						body: formData
					})
						.then(resp => resp.json(), this._element.clear())
						.then(json =>
							this.setState({ ...this.state, resp_message: json.message })
						);
				}
			});
	};

	render() {
		return (
			<CardStyle>
				<h2>Premium Subscription</h2>
				<p>$9.99/year</p>
				{this.state.resp_message && <h2>{this.state.resp_message}</h2>}
				<form onSubmit={this.handleSubmit}>
					<label>
						<h3>Card Details</h3>
						<CardElement
							onChange={this.handleCardErrors}
							onReady={element => (this._element = element)}
							style={cardElementStyles}
						/>
						<div role="alert">
							<h3>{this.state.card_errors}</h3>
						</div>
					</label>
					<button className="form-btn">Confirm order</button>
				</form>
			</CardStyle>
		);
	}
}

export default injectStripe(CheckoutForm);
