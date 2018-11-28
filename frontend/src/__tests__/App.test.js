import React from 'react';
import ReactDOM from 'react-dom';
import App from '../components/App/App';

describe('<App />', () => {
	// TODO: Update to work with redux store https://redux.js.org/recipes/writingtests
	it('renders without crashing', () => {
		const div = document.createElement('div');
		ReactDOM.render(<App />, div);
	});
});
