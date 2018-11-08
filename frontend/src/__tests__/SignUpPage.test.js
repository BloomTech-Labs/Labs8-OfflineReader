import React from 'react';
import ReactDOM from 'react-dom';
import SignUpPage from '../components/SignUpPage/SignUpPage';

describe('<SignUpPage />', () => {
  it('renders without crashing', () => {
    const div = document.createElement('div');
    ReactDOM.render(<SignUpPage />, div);
  });
   describe('Test default state values', () => {
    it('this.state.username should be blank by default', () => {
      const wrapper = shallow(<SignUpPage />);
      const instance = wrapper.instance();
       expect(instance.state.username).toBe('');
    });
    it('this.state.email should be blank by default', () => {
      const wrapper = shallow(<SignUpPage />);
      const instance = wrapper.instance();
       expect(instance.state.email).toBe('');
    });
     it('this.state.password should be blank by default', () => {
      const wrapper = shallow(<SignUpPage />);
      const instance = wrapper.instance();
       expect(instance.state.password).toBe('');
    });
    it('this.state.password_conf should be blank by default', () => {
      const wrapper = shallow(<SignUpPage />);
      const instance = wrapper.instance();
       expect(instance.state.password_conf).toBe('');
    });
  }); 
});
