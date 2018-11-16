import React, { Component } from 'react';
import { BrowserRouter, Route, NavLink } from 'react-router-dom';
import { SignInPage, SignUpPage } from '../';

import { Switch, Redirect } from 'react-router-dom';
import { Provider, connect } from 'react-redux';
import combineReducers from '../../store/reducers';
import thunk from 'redux-thunk';
import { auth } from '../../store/actions';

import ArticlesWrapper from '../Articles/ArticlesWrapper';
// import { SignedIn } from '../SignInPage';
// import { SignedUp } from '../SignUpPage';

class App extends Component {
	componentDidMount() {
		this.props.loadUser();
	}

	PrivateRoute = ({ component: ChildComponent, ...rest }) => {
		return (
			<Route
				{...rest}
				render={props => {
					if (this.props.auth.isLoading) {
						return <em>Loading...</em>;
					} else if (!this.props.auth.isAuthenticated) {
						return <Redirect to="/signin" />;
					} else {
						return <ChildComponent {...props} />;
					}
				}}
			/>
		);
	};

	render() {
		let { PrivateRoute } = this;
		return (
			<BrowserRouter>
				<Switch>
					<PrivateRoute exact path="/" component={ArticlesWrapper} />
					<Route exact path="/signup" component={SignUpPage} />
					<Route exact path="/signin" component={SignInPage} />
				</Switch>
			</BrowserRouter>
		);
	}
}

const mapStateToProps = state => {
	return {
		auth: state.auth
	};
};

const mapDispatchToProps = dispatch => {
	return {
		loadUser: () => {
			return dispatch(auth.loadUser());
		}
	};
};

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(App);
