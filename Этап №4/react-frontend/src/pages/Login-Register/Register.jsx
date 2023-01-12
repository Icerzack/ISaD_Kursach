import * as React from "react";
import { Paper } from "@mui/material";
import Grid from "@mui/material/Unstable_Grid2";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import { Stack } from "@mui/system";
import Button from "@mui/material/Button";
import Logo from "../../components/logo";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import dayjs from "dayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { DesktopDatePicker } from "@mui/x-date-pickers/DesktopDatePicker";

export default function Login() {
  const [birthDate, setBirthDate] = React.useState(dayjs("2022-01-12"));
  const [sex, setSex] = React.useState("");
  const [login, setLogin] = React.useState("");
  const [password, setPassword] = React.useState("");
  const [username, setUsername] = React.useState("");

  const navigate = useNavigate();

  function DatePicker() {
    const handleChange = (newValue) => {
      setBirthDate(newValue);
    };

    return (
      <LocalizationProvider dateAdapter={AdapterDayjs}>
        <DesktopDatePicker
          label="Date desktop"
          inputFormat="MM/DD/YYYY"
          value={birthDate}
          onChange={handleChange}
          renderInput={(params) => <TextField {...params} />}
        />
      </LocalizationProvider>
    );
  }

  function SexSelect() {
    const handleChange = (event) => {
      setSex(event.target.value);
    };

    return (
      <Box minWidth="200px">
        <FormControl fullWidth>
          <InputLabel id="demo-simple-select-label">Sex</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={sex}
            label="Age"
            onChange={handleChange}
          >
            <MenuItem value={"Male"}>Male</MenuItem>
            <MenuItem value={"Female"}>Female</MenuItem>
          </Select>
        </FormControl>
      </Box>
    );
  }

  const handleUsernameInput = (event) => {
    setUsername(event.currentTarget.value);
  };

  const handleLoginInput = (event) => {
    setLogin(event.currentTarget.value);
  };

  const handlePasswordInput = (event) => {
    setPassword(event.currentTarget.value);
  };

  const handleLoginButtonClick = (event) => {
    navigate("/login");
  };

  const handleButtonClick = (event) => {
    const url =
      "http://localhost:32456/login?username=" +
      login +
      "&password=" +
      password +
      "&password=" +
      password;
    axios({
      method: "get",
      url: url,
    }).then(function (response) {
      if (response.status === 200) {
        localStorage.setItem("id", response.data[0].id);
        localStorage.setItem("login", login);
        localStorage.setItem("password", password);
      }
    });
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
              label="Имя + Фамилия"
              variant="outlined"
              onChange={handleUsernameInput}
            />
            <SexSelect></SexSelect>
            <DatePicker></DatePicker>
            <TextField
              label="Login"
              variant="outlined"
              onChange={handleLoginInput}
            />
            <TextField
              label="Password"
              type="password"
              variant="outlined"
              onChange={handlePasswordInput}
            />
            <Button variant="contained" onClick={handleButtonClick}>
              Зарегистрироваться!
            </Button>
            <Button variant="text" onClick={handleLoginButtonClick}>
              Уже есть аккаунт? Войти
            </Button>
          </Stack>
        </Paper>
      </Grid>
    </Grid>
  );
}
