import { connect } from 'react-redux';

import LandingPage from '../components/LandingPage';

const mapStateToProps = state => ({
	goog_auth: state.goog_auth
});

export default connect(mapStateToProps)(LandingPage);
