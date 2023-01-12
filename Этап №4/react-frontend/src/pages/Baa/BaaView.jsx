import * as React from "react";
import { Paper } from "@mui/material";
import Box from "@mui/material/Box";
import { Stack } from "@mui/system";
import { useParams } from "react-router-dom";
import { baaList } from "../../helpers/baa";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";


export default function BaaView(props) {
  const { id } = useParams();

  const [title, setTitle] = React.useState("");
  let [manufacturer, setManufacturer] = React.useState("");
  let [description, setDescription] = React.useState("");
  let [uses, setUses] = React.useState("");
  let [allTimeRatingDifference, setAllTimeRatingDifference] = React.useState("");
  const navigate = useNavigate();

  const list = baaList;

  useEffect(() => {
    const url = "http://localhost:32456/get/baa/"+id;
    axios({
      method: "get",
      url: url,
    }).then(function (response) {
      let temp = response.data.body
      setTitle(temp[0].name)
      setDescription(temp[0].description)
      setManufacturer(temp[0].manufacturer)
      setUses(temp[0].uses)
      setAllTimeRatingDifference(temp[0].all_time_rating_difference)
    }).catch(function (error) {
      if (error.response) {
        navigate("/sportsman/baa")
      }
    });


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
            <h3>{uses}</h3>
            <h6>{allTimeRatingDifference}</h6>
          </Stack>
        </Paper>
      </Box>
    </Box>
  );
}
