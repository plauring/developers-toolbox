import React from 'react';

const Devtool = props => {

  return (
    <li className="devtool">
      <a href= {"/devtools/" + props.id} >{props.title}</a>
    </li>
  );
}

export default Devtool;
