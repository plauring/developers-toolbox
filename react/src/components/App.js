import React, { Component } from 'react';
import DevtoolList from './DevtoolList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      devtools: [],
      title: '',
      intervalID: ''
     };
     this.getDevtools = this.getDevtools.bind(this);
  }

  getDevtools() {
    $.ajax({
	    url: '/api/devtools',
      contentType: 'application/json'
    })
	  .done(data => {
	    this.setState({ devtools: data.devtools })
    })
  }

  componentWillMount() {
    this.getDevtools();
    setInterval(this.getDevtools, 10000);
  }

  render() {

    return (
      <div>
      <h1>Devtools</h1>
      <DevtoolList
      devtools={this.state.devtools}
      />
      </div>

    );
  }
}

export default App;
