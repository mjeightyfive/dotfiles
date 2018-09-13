import React, { PureComponent } from 'react';
import { render } from 'react-dom';

import './App.scss';

class App extends PureComponent {
    render() {
        return <h1>Hello World</h1>;
    }
}

export default App;

render(<App />, document.getElementById('app'));
