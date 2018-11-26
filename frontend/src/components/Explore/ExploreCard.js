import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const ExploreCard = props => {
	return (
		<div>
			<div className="headline">{props.exploreCard.headline}</div>
			<div className="img-container">
				<img src={props.exploreCard.img} />
			</div>
		</div>
	);
};

ExploreCard.propTypes = {
	headline: PropTypes.string,
	img: PropTypes.img,
	author: PropTypes.string
};

export default ExploreCard;
