import React, { Component } from 'react';
import ExploreCard from './ExploreCard';
import PropTypes from 'prop-types';

const ExploreCards = props => {
	return (
		<div>
			{/* Using the cards prop, map over the list creating a 
          new Card component for each passing the card as the only prop*/}
			{props.exploreCards.map((exploreCard, i) => (
				<ExploreCard exploreCard={exploreCard} />
			))}
		</div>
	);
};

ExploreCards.propTypes = {
	exploreCard: PropTypes.object
};

export default ExploreCards;
