import { connect } from 'react-redux';

import AuthContainer from '../components/AuthContainer';

const mapStateToProps = state => ({
	goog_auth: state.goog_auth
});

export default connect(mapStateToProps)(AuthContainer);
