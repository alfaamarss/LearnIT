
import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import "../css/auth.css";

import { RouterProvider } from "react-router";
import { router } from "./app/router";
import AppErrorBoundary from "./app/AppErrorBoundary";
import { AuthProvider } from "./features/auth/authContext";
import { GoogleOAuthProvider } from "@react-oauth/google";

const googleClientId = import.meta.env.VITE_GOOGLE_CLIENT_ID;

const App = (
  <AuthProvider>
    <RouterProvider router={router} />
  </AuthProvider>
);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <AppErrorBoundary>
      {googleClientId ? (
        <GoogleOAuthProvider clientId={googleClientId}>
          {App}
        </GoogleOAuthProvider>
      ) : (
        App
      )}
    </AppErrorBoundary>
  </React.StrictMode>
);
