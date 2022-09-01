import React from "react";
import { Link } from "react-router-dom";

function GlobalNav() {
  return (
    <>
      <nav>
        <Link to="/">Home</Link> | <Link to="posts">投稿一覧</Link>|{" "}
        <Link to="login">Login</Link>| <Link to="users">ユーザー一覧</Link>
      </nav>
    </>
  );
}
export default GlobalNav;
