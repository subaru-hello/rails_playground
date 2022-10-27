import NormalButton from "components/atoms/NormalButton";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import * as React from "react";
import { Formik, Field, Form, FormikHelpers } from "formik";

interface Values {
  firstName: string;
  lastName: string;
  email: string;
}

// import SideBar from 'components/templates/SideBar'

export const Login = () => {
  return (
    <>
      <p>Loginページです</p>
      <Formik
        initialValues={{
          firstName: "",
          lastName: "",
          email: "",
        }}
        onSubmit={(
          values: Values,
          { setSubmitting }: FormikHelpers<Values>
        ) => {
          setTimeout(() => {
            alert(JSON.stringify(values, null, 2));
            setSubmitting(false);
          }, 500);
        }}
      >
        <Grid container spacing={2}>
          <Grid item xs={12}>
            <Box sx={{ justifyContent: "center" }}>
              <Form>
                <label htmlFor="firstName">First Name</label>
                <Field id="firstName" name="firstName" placeholder="John" />

                <label htmlFor="lastName">Last Name</label>
                <Field id="lastName" name="lastName" placeholder="Doe" />

                <label htmlFor="email">Email</label>
                <Field
                  id="email"
                  name="email"
                  placeholder="john@acme.com"
                  type="email"
                />

                <NormalButton button="Submit" type="submit" />
              </Form>
            </Box>
          </Grid>
        </Grid>
      </Formik>
    </>
  );
};
