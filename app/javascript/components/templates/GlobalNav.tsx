import React from "react";
import { Link } from "react-router-dom";

function GlobalNav() {
  return (
    <>
      <nav>
        <Link to="/">Home</Link> | <Link to="games">Gomoku Narabe</Link>|{" "}
        <Link to="login">Login</Link>
      </nav>
    </>
  );
}
export default GlobalNav;
