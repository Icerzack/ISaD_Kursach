import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import reportWebVitals from "./reportWebVitals";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import ErrorPage from "./pages/ErrorPage";
import Profile from "./pages/Profile/Profile";
import Baa from "./pages/Baa/Baa";
import BaaView from "./pages/Baa/BaaView";
import Login from "./pages/Login-Register/Login";
import Trainings from "./pages/Trainings/Trainings";
import Exercises from "./pages/Exercises/Exercises";
import Preparations from "./pages/Preparations/Preparations";

const router = createBrowserRouter([
  {
    path: "/sportsman",
    element: <App></App>,
    errorElement: <ErrorPage />,
    children: [
      {
        path: "baa",
        element: <Baa></Baa>,
      },
      {
        path: "baa/:id",
        element: <BaaView></BaaView>,
      },
      {
        path: ":id",
        element: <Profile></Profile>,
      },
      {
        path: "trainings",
        element: <Trainings></Trainings>,
      },
      {
        path: "exercises",
        element: <Exercises></Exercises>,
      },
      {
        path: "preparations",
        element: <Preparations></Preparations>,
      },
    ],
  },
  {
    path: "/login",
    element: <Login></Login>,
  },
]);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
