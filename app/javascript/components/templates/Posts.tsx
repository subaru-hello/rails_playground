import React from "react";

interface PostProps {
  title: string;
  body: string;
}
//下記記述が不要になった
// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };

function Post(props: PostProps) {
  return (
    <React.Fragment>
      <h1>title: {props.title}</h1>
      <p>body: {props.body}</p>
    </React.Fragment>
  );
}

export default Post;
