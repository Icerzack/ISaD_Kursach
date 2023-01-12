import * as React from "react";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";
import Star from "@mui/icons-material/Star";

export default function Logo() {
  return (
    <Stack
      direction="row"
      spacing={2}
      sx={{
        display: "flex",
        mr: 1,
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <Typography
        variant="h6"
        sx={{
          mr: 2,
          display: "flex",
          fontFamily: "monospace",
          fontWeight: 700,
          letterSpacing: ".3rem",
          color: "inherit",
          textDecoration: "none",
        }}
      >
        MegaSport
      </Typography>
    </Stack>
  );
}
