import React from "react";

import { useParams } from "react-router-dom";

export function UserAll() {
  let { userId } = useParams();
  return <div>Now showing post {userId}</div>;
}
