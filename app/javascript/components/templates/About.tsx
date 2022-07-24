import React from "react";

interface Props {
  title: string;
}
//下記記述が不要になった
// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };

function About(props: Props) {
  return (
    <React.Fragment>
      <h1>About this application</h1>
      <div>finding new journey from here!</div>
    </React.Fragment>
  );
}

export default About;
