import * as React from "react";
import { Paper } from "@mui/material";
import Box from "@mui/material/Box";
import { Stack } from "@mui/system";
import { useParams } from "react-router-dom";
import { baaList } from "../../helpers/baa";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

export default function BaaView(props) {
  const { id } = useParams();

  const [title, setTitle] = React.useState("");
  let [manufacturer, setManufacturer] = React.useState("");
  let [description, setDescription] = React.useState("");
  const navigate = useNavigate();

  const list = baaList;

  useEffect(() => {
    let found = false;
    for (let i = 0; i < list.length; i++) {
      let el = list[i];
      if (el.id === Number(id)) {
        found = true;
        setTitle(el.name);
        setManufacturer(el.manufacturer);
        setDescription(el.description);
      }
    }
    if (!found) {
      navigate("/sportsman/baa");
    }
  }, []);

  let h = window.innerHeight;
  let gridHeight = h - 60;

  return (
    <Box
      sx={{
        height: gridHeight,
      }}
    >
      <Box
        sx={{
          height: "100%",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <Paper height="100%" elevation={3}>
          <Stack
            direction="column"
            sx={{
              p: "50px",
              px: "200px",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
            }}
          >
            <img
              src="https://avatars.mds.yandex.net/get-mpic/4905155/img_id3164344516613040350.jpeg/orig"
              width="100"
              height="150"
              alt="lorem"
            />
            <h1>{title}</h1>
            <h3>{manufacturer}</h3>
            <h6>{description}</h6>
          </Stack>
        </Paper>
      </Box>
    </Box>
  );
}
