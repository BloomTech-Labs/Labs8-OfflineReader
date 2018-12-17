import React, { Component } from 'react';
import { connect } from 'react-redux';
import styled from 'styled-components';
// import PropTypes from 'prop-types';

import { searchPages } from '../../store/actions';

const Container = styled.div`
	// margin-top: 0.3rem;
	text-align: center;
	font-family: 'Roboto', sans-serif;
`;

const Input = styled.input`
	padding: 1rem;
	margin: 0.5em;
	border: 1px solid #efefef;
	border-radius: 30px;
	box-shadow: 0px 0px 7px -3px rgba(0, 0, 0, 0.66);
	font-size: 1.5rem;
	width: 250px;
	&:focus {
		box-shadow: 0 0 3pt 2pt rgba(49, 132, 242, 1);
		outline: none;
	}
`;

class Search extends Component {
	state = {
		inputData: {
			search: ''
		}
	};

	componentDidUpdate() {
		this.props.searchPages(this.state.inputData.search);
	}

	handleInput = event => {
		//Event handler for when you start typing in a form
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				[event.target.name]: event.target.value
			}
		});
	};

	resetForm() {
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				search: ''
			}
		});
	}

	render() {
		return (
			<Container>
				<form>
					<Input
						type="text"
						name="search"
						placeholder="Search"
						value={this.state.inputData.search}
						onChange={this.handleInput}
					/>
				</form>
			</Container>
		);
	}
}

const mapStateToProps = state => {
	return {};
};

export default connect(
	mapStateToProps,
	{
		searchPages
	}
)(Search);
