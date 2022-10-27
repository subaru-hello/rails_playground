import React, { memo } from "react";
import TextField from "@mui/material/TextField";
import { TextFieldState } from "components/types/types";
export default function NormalTextField(props: TextFieldState) {
  return (
    <React.Fragment>
      <TextField
        id="standard-basic"
        label={props.text_field}
        variant="standard"
      />
    </React.Fragment>
  );
}
