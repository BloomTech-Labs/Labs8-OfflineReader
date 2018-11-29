import React from 'react';
import styled from 'styled-components';
const Container = styled.div`
	text-align: center;
	font-family: 'Roboto', sans-serif;
`;

const Form = styled.form`
	border-radius: 40px;
`;

const TestScraperForm = props => {
	return (
		<Container>
			<Form>
				Input Article URL here:
				<input
					type="text"
					name="url"
					placeholder="www.cnn.com"
					value={props.inputData.url}
					onChange={props.handleInput}
				/>
				<button onClick={props.handleURL}>Save Article</button>
			</Form>
		</Container>
	);
};

export default TestScraperForm;
