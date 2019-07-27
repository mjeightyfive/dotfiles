import React from 'react';
import Enzyme, { shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ComponentName from './ComponentName.jsx';

Enzyme.configure({ adapter: new Adapter() });

describe('ComponentName', () => {
    let component;
    let props;

    beforeEach(() => {
        props = {};
        component = shallow(<ComponentName {...props} />);
    });

    it('renders', () => {
        expect(component).toMatchSnapshot();
    });
});
