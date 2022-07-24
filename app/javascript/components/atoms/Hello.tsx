import React from "react";
import { HomeState } from "components/types/types";

function Hello(props: HomeState) {
  return <div className="home">{props.hello}</div>;
}
export default Hello;
