import React from 'react';
import ReactDOM from 'react-dom';
import SignInPage from '../components/SignInPage/SignInPage';

describe('<SignInPage />', () => {
  it('renders without crashing', () => {
    const div = document.createElement('div');
    ReactDOM.render(<SignInPage />, div);
  });
   describe('Test default state values', () => {
    it('this.state.username should be blank by default', () => {
      const wrapper = shallow(<SignInPage />);
      const instance = wrapper.instance();
       expect(instance.state.username).toBe('');
    });
     it('this.state.password should be blank by default', () => {
      const wrapper = shallow(<SignInPage />);
      const instance = wrapper.instance();
       expect(instance.state.password).toBe('');
    });
  }); 
});
