import * as React from "react";
import { Paper } from "@mui/material";
import Grid from "@mui/material/Unstable_Grid2";
import TextField from "@mui/material/TextField";
import { Stack } from "@mui/system";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import dayjs from "dayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { DesktopDatePicker } from "@mui/x-date-pickers/DesktopDatePicker";
import { useParams } from "react-router-dom";

export default function Profile() {
  const [birthDate, setBirthDate] = React.useState(dayjs("2022-01-12"));
  const [sex, setSex] = React.useState("");

  let h = window.innerHeight;
  let gridHeight = h - 60;

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

  const handleButtonClick = (event) => {};

  return (
    <Box sx={{ height: gridHeight }}>
      <Grid
        container
        direction="row"
        alignItems="center"
        justifyContent="center"
        sx={{ height: "100%", p: "10px" }}
      >
        <Grid xs={12} md={6} sx={{ height: "100%", p: "10px" }}>
          <Paper
            elevation={3}
            sx={{
              height: "100%",
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            <Stack
              direction="column"
              sx={{
                height: "100%",
                width: "100%",
                p: "20px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              <Grid
                container
                direction="row"
                alignItems="center"
                justifyContent="center"
                sx={{ height: "100%", width: "100%", p: "20px" }}
              >
                <Grid
                  xs={6}
                  sx={{
                    height: "100%",
                    p: "20px",
                    textAlign: "center",
                    display: "flex",
                    flexWrap: "wrap",
                    justifyContent: "center",
                    alignItems: "center",
                  }}
                >
                  <TextField
                    id="outlined-basic"
                    label="Outlined"
                    variant="outlined"
                    fullWidth
                  />
                  <SexSelect />
                  <DatePicker></DatePicker>
                </Grid>
                <Grid
                  xs={6}
                  sx={{
                    height: "100%",
                    p: "20px",
                    textAlign: "center",
                    display: "flex",
                    flexWrap: "wrap",
                    justifyContent: "center",
                    alignItems: "center",
                  }}
                >
                  <div>Это ваши Имя + Фамилия</div>
                  <div>Это ваш пол</div>
                  <div>Это ваша дата рождения</div>
                </Grid>
              </Grid>
              <Button
                variant="contained"
                sx={{ mb: 5 }}
                onClick={handleButtonClick}
              >
                Обновить данные
              </Button>
            </Stack>
          </Paper>
        </Grid>
        <Grid xs={12} md={6} sx={{ height: "100%", p: "10px" }}>
          <Paper elevation={3} sx={{ height: "100%" }}></Paper>
        </Grid>
      </Grid>
    </Box>
  );
}
