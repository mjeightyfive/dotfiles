import React from 'react';
import { render } from 'react-dom';

import './App.scss';

const App = () => {
    return <h1>Hello World</h1>;
};
export default App;

render(<App />, document.getElementById('app'));
