import React from "react"

interface Props {
  greeting: string
}
//下記記述が不要になった
// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };

class HelloWorld extends React.Component<Props> {

  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

export default HelloWorld
