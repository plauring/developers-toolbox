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
  }


  componentDidMount() {
	  $.ajax({
	    url: '/api/devtools',
      contentType: 'application/json'
    })
	  .done(data => {
	    this.setState({ devtools: data.devtools })
    })
    var intervalID = setInterval(this.timer, 1000);
    this.setState({ intervalID: intervalID });
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
