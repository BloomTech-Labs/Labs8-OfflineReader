import React, { Component } from 'react';

class ArticleList extends Component {
	componentDidMount() {
		this.props.requestarticles();
	}
	render() {
		return (
			<div>
				<h1>Only Authenticated users can see this page</h1>
				{this.props.articles.articleData.map((article, index) => {
					return (
						<li key={index}>
							Name: {article.name} Age:===={article.age}=====Breed:{' '}
							{article.breed}
						</li>
					);
				})}
				<button
					onClick={() => this.props.requestarticles()}
					className="btn btn-success"
				>
					Load articles
				</button>
			</div>
		);
	}
}

export default ArticleList;
