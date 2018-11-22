import { connect } from 'react-redux';

import App from '../components/App';

const mapStateToProps = state => ({
	goog_auth: state.goog_auth
});

export default connect(mapStateToProps)(App);
