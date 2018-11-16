import { requestArticles } from '../../actions/articleActions';
import ArticleList from '../../components/Secret/ArticleList';

import { connect } from 'react-redux';

function mapStateToProps(state) {
	return {
		articles: state.articles
	};
}

function mapDispatchToProps(dispatch) {
	return {
		requestArticles: () => dispatch(requestArticles())
	};
}

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(ArticleList);
