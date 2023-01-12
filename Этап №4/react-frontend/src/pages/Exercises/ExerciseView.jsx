import * as React from "react";
import Box from "@mui/material/Box";
import { useParams } from "react-router-dom";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

export default function ExerciseView(props) {
  const { id } = useParams();

  const [name, setName] = React.useState("");
  let [description, setDescription] = React.useState("");
  React.useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const url = "http://localhost:32456/get/exercise/" + id;
    axios({
      method: "get",
      url: url,
    })
      .then(function (response) {
        let temp = response.data.body;
        setName(temp[0].name);
        setDescription(temp[0].description);
      })
      .catch(function (error) {
        if (error.response) {
          navigate("/sportsman/exercises");
        }
      });
    // setTitle(baaList[0].name);
    // setDescription(baaList[0].description);
    // setManufacturer(baaList[0].manufacturer);
    // setUses(baaList[0].uses);
    // setAllTimeRatingDifference(baaList[0].allTimeRatingDifference);
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
          alignItems: "left",
          flexDirection: "column",
          ml: "50px",
          mt: "80px",
        }}
      >
        <img
          src="https://img.freepik.com/free-vector/woman-sport-activities_102902-2337.jpg?w=2000"
          width="400"
          height="300"
          alt="lorem"
        />
        <Box>
          <h1>{name}</h1>
        </Box>
        <Box>
          <h2>Описание упражнения</h2>
        </Box>
        <Box sx={{ width: "700px", wordWrap: "break-word" }}>{description}</Box>
      </Box>
    </Box>
  );
}
