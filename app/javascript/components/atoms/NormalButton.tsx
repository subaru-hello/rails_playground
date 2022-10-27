import React from "react";
import Button from "@mui/material/Button";
import { ButtonState } from "components/types/types";

export default function NormalButton(props: ButtonState) {
  return <Button variant="contained">{props.button}</Button>;
}
