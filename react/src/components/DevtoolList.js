import React from 'react';
import Devtool from './Devtool';

const DevtoolList = props => {
	  let devtools = props.devtools.map(devtool => {
	    const { id, title } = devtool;
      
	    return (
	      <Devtool
	        key={id}
          id={id}
	        title={title}
	      />
	    );
	  });

	  return (
	    <div className="devtool-list">
	      <ul>
	        {devtools}
	      </ul>
      </div>
	  );
	};

export default DevtoolList;
