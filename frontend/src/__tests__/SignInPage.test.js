import React from 'react';
import ReactDOM from 'react-dom';
import SignInPage from '../components/SignInPage/SignInPage';

describe('<SignInPage />', () => {
	it('renders without crashing', () => {
		const div = document.createElement('div');
		ReactDOM.render(<SignInPage />, div);
	});
});
