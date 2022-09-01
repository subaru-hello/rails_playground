import React from "react";

import { Routes, Route, BrowserRouter } from "react-router-dom";
import Hello from "components/atoms/Hello";
import GlobalNav from "components/templates/GlobalNav";
import Footer from "components/templates/Footer";
import { Login } from "components/templates/Login";
import { UserShow } from "components/templates/users/UserShow";
import { UserAll } from "components/templates/users/UserAll";
import PostAll from "components/templates/posts/PostAll";
import { PostShow } from "components/templates/posts/PostShow";

function Router() {
  return (
    <BrowserRouter>
      <GlobalNav />
      <Routes>
        {/* <Route path="games" element={<Game />} /> */}
        <Route path="login" element={<Login />} />
        <Route path="/" element={<Hello hello="おはようございます！" />} />
        <Route path="users" element={<UserAll />}>
          <Route path=":userId" element={<UserShow />} />
        </Route>
        <Route
          path="posts"
          element={<PostAll title="タイトル！" body="コンテンツ！" />}
        >
          <Route path=":postId" element={<PostShow />} />
        </Route>
      </Routes>
      <Footer />
    </BrowserRouter>
  );
}
export default Router;
