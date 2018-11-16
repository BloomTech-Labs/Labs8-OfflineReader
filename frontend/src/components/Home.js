import React from 'react';
import LoadingSpinner from '../utils_materialui/LoadingSpinner';

const Home = ({ goog_auth }) => {
	return (
		<div>
			{goog_auth.isAuthenticating && <LoadingSpinner />}
			<h1>Anywhere Reader</h1>
		</div>
	);
};

export default Home;
