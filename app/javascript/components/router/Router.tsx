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
import PostNew from "components/templates/posts/PostNew";
//TODO
// move all paths and elements  to Route.tsx
const routings = [
  {
    path: "login",
    element: "<Login />",
  },
  {
    path: "/",
    element: "<Hello hello='おはようございます' />",
  },
  {
    path: "users",
    element: "<UserAll />",
  },
  {
    path: ":userId",
    element: "<UserShow />",
  },
  {
    ipath: "posts",
    element: '<PostAll title="タイトル！" body="コンテンツ！" />',
  },
  {
    ipath: "posts/new",
    element: "<PostNew />",
  },
];
//共通する項目
//pathの中身とelementの中身をeachでレンダリングさせる
function Router() {
  return (
    <BrowserRouter>
      <GlobalNav />
      {routings.map((routing, index) => (
        <Routes>
          console.log(index)
          <Route key={index} path={routing.path} element={routing.element} />
        </Routes>
      ))}
      <Footer />
    </BrowserRouter>
  );
}
export default Router;

// const settings = ['Profile', 'Account', 'Dashboard', 'Logout'];

// {settings.map((setting) => (
//   <MenuItem key={setting} onClick={handleCloseUserMenu}>
//     <Typography textAlign="center">{setting}</Typography>
//   </MenuItem>
// ))}
