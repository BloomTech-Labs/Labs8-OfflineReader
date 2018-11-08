import React from 'react';
import ReactDOM from 'react-dom';
import App from '../components/App/App';

describe('<App />', () => {
  it('renders without crashing', () => {
    const div = document.createElement('div');
    ReactDOM.render(<App />, div);
  });
   describe('Test default state values', () => {
    it('this.state.total should be 0 by default', () => {
      const wrapper = shallow(<App />);
      const instance = wrapper.instance();
       expect(instance.state.total).toBe('0');
    });
     it('this.state.next should be null', () => {
      const wrapper = shallow(<App />);
      const instance = wrapper.instance();
       expect(instance.state.next).toBe(null);
    });
     it('this.state.operation should be null', () => {
      const wrapper = shallow(<App />);
      const instance = wrapper.instance();
       expect(instance.state.operation).toBe(null);
    });
  }); 
});
