import * as React from "react";
import { Paper } from "@mui/material";
import Grid from "@mui/material/Unstable_Grid2";
import TextField from "@mui/material/TextField";
import { Stack } from "@mui/system";
import Button from "@mui/material/Button";
import Logo from "../../components/logo";

export default function Profile() {
  const [login, setLogin] = React.useState("");
  const [password, setPassword] = React.useState("");

  const handleLoginInput = (event) => {
    setLogin(event.currentTarget.value);
  };

  const handlePasswordInput = (event) => {
    setPassword(event.currentTarget.value);
  };

  const handleButtonClick = (event) => {
    //TODO: Делаем запрос
  };

  return (
    <Grid
      container
      spacing={0}
      direction="column"
      alignItems="center"
      justifyContent="center"
      textAlign="center"
      style={{ minHeight: "100vh" }}
    >
      <Grid item xs={3}>
        <Paper elevation={4}>
          <Stack
            sx={{
              p: 5,
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
            direction="column"
            spacing={2}
          >
            <Logo />
            <TextField
              id="outlined-basic"
              label="Login"
              variant="outlined"
              onChange={handleLoginInput}
            />
            <TextField
              id="outlined-basic"
              label="Password"
              variant="outlined"
              onChange={handlePasswordInput}
            />
            <Button variant="contained" onClick={handleButtonClick}>
              Войти!
            </Button>
            <Button variant="text" onClick={handleButtonClick} size="small">
              Зарегистрироваться
            </Button>
          </Stack>
        </Paper>
      </Grid>
    </Grid>
  );
}
