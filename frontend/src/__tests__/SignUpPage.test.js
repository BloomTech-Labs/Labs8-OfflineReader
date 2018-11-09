import React from 'react';
import ReactDOM from 'react-dom';
import SignUpPage from '../components/SignUpPage/SignUpPage';

describe('<SignUpPage />', () => {
	it('renders without crashing', () => {
		const div = document.createElement('div');
		ReactDOM.render(<SignUpPage />, div);
	});
});
