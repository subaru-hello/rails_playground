import React from "react";

import { useParams } from "react-router-dom";

interface PostProps {
  title: string;
  body: string;
}

function PostAll(props: PostProps) {
  let { postId } = useParams();
  return (
    <React.Fragment>
      <h1>title: {props.title}</h1>
      <p>body: {props.body}</p>
      <p>id: {postId}</p>
    </React.Fragment>
  );
}

export default PostAll;
