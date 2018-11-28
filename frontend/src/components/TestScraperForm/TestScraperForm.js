import React from 'react';

const TestScraperForm = props => {
	return (
		<form>
			Input Article URL here:
			<input
				type="text"
				name="url"
				placeholder="www.cnn.com"
				value={props.inputData.url}
				onChange={props.handleInput}
			/>
			<button onClick={props.handleURL}>Save Article</button>
		</form>
	);
};

export default TestScraperForm;
