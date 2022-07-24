import React, { memo } from "react";

import { BrowserRouter, Routes, Route, useParams } from "react-router-dom";
import Hello from "components/atoms/Hello";
import GlobalNav from "components/templates/GlobalNav";
import Footer from "components/templates/Footer";
function UserProfile() {
  return <div>Its UserAll page</div>;
}

export const Login = memo(() => {
  return <p>Loginページです</p>;
});

function UserAll() {
  let { userId } = useParams();
  return <div>Now showing post {userId}</div>;
}

function Router() {
  return (
    <>
      <GlobalNav />
      <Routes>
        {/* <Route path="games" element={<Game />} /> */}
        <Route path="login" element={<Login />} />
        <Route path="/" element={<Hello hello="おはようございます！" />} />
        <Route path="users" element={<UserAll />}>
          <Route path=":userId" element={<UserProfile />} />
        </Route>
        <Route path="posts" element={<UserAll />}>
          <Route path=":postId" element={<UserProfile />} />
        </Route>
      </Routes>
      <Footer />
    </>
  );
}
export default Router;
