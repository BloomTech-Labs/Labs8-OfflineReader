import React, { Component } from 'react';
import ExploreCards from './ExploreCards';
import { exploreData } from '../../data';

export default class ExploreContent extends Component {
	constructor(props) {
		super(props);
		this.state = {
			exploreCards: []
		};
	}

	componentDidMount() {
		// Once the component has mounted, get the data and reflect that data on the state.
		this.setState({ exploreCards: exploreData });
	}

	render() {
		return (
			<div>
				<ExploreCards exploreCards={exploreCards} />
			</div>
		);
	}
}
