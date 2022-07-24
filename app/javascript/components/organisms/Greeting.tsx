import React from "react";

interface GreetingProps {
  hi: string;
}
//下記記述が不要になった
// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };

class HelloWorld extends React.Component<GreetingProps> {
  render() {
    return <React.Fragment>Greeting: {this.props.hi}</React.Fragment>;
  }
}

export default HelloWorld;
