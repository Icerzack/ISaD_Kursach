import logo from "./logo.svg";
import "./App.css";
import TopAppBar from "./components/top-bar";
import { Outlet } from "react-router-dom";
import axios from "axios";
import { useEffect } from "react";

const temp = () => {
  // GET request for remote image in node.js
  axios({
    method: "get",
    url: "http://localhost:32456/get",
  }).then(function (response) {
    console.log(response);
  });
};

function App() {
  useEffect(() => {
    temp();
  }, []);
  return (
    <div>
      <div className="App">
        <TopAppBar></TopAppBar>
      </div>
      <div className="Content">
        <Outlet></Outlet>
      </div>
    </div>
  );
}

export default App;
