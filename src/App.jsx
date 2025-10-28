// src/App.jsx
import React, { useState } from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";

import About from "./frontend/about";        // About / Landing Page
import Login from "./frontend/login";        // Login Page
import Dashboard from "./frontend/Dashboard"; // Admin Dashboard
import StaffDashboard from "./frontend/StaffDashboard"; // Staff Dashboard
import DoctorDashboard from "./frontend/DoctorDashboard"; // Doctor Dashboard
import NurseDashboard from "./frontend/NurseDashboard"; // Nurse Dashboard

// NOTE: Make sure to import PatientDashboard if you have it!

function App() {
  // auth state
  const [isAuthenticated, setIsAuthenticated] = useState(
    localStorage.getItem("isAuthenticated") === "true"
  );

  // 🔑 FIX: Define userId and userRole states
  const [userId, setUserId] = useState(localStorage.getItem("user_id"));
  const [userRole, setUserRole] = useState(localStorage.getItem("user_role"));


  // kapag login success
  const handleLoginSuccess = () => {
    setIsAuthenticated(true);
    localStorage.setItem("isAuthenticated", "true");
    
    // 🔑 FIX: Update state from localStorage after login
    setUserId(localStorage.getItem("user_id"));
    setUserRole(localStorage.getItem("user_role"));
  };

  // kapag logout
  const handleLogout = () => {
    setIsAuthenticated(false);
    localStorage.removeItem("isAuthenticated");
    
    // 🔑 FIX: Clear all user data on logout
    localStorage.removeItem("user_id");
    localStorage.removeItem("user_role");
    setUserId(null); 
    setUserRole(null);
  };

  return (
    <Router>
      <Routes>
        {/* Default route → About page muna */}
        <Route path="/" element={<About />} />

        {/* Login route */}
        <Route
          path="/login"
          element={<Login onLoginSuccess={handleLoginSuccess} />}
        />

        {/* Admin Dashboard */}
        <Route
          path="/dashboard"
          element={
            isAuthenticated && userRole === 'admin' ? (
              <Dashboard onLogout={handleLogout} />
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

       
        {/* Staff Dashboard */}
        <Route
          path="/staff-dashboard"
          element={
            isAuthenticated && userRole === 'staff' ? (
              <StaffDashboard onLogout={handleLogout} />
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />
        
        {/* 🔑 FIX: Doctor Dashboard - Added protection & userId prop */}
        <Route 
          path="/doctor-dashboard" 
          element={
            isAuthenticated && userRole === 'doctor' ? (
              <DoctorDashboard onLogout={handleLogout} userId={userId} />
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />
        
        {/* Nurse Dashboard - Added protection & userId prop */}
        <Route 
          path="/nurse-dashboard" 
          element={
            isAuthenticated && userRole === 'nurse' ? (
              <NurseDashboard onLogout={handleLogout} userId={userId} />
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />

        {/* Patient Dashboard (Assumed Protected Route) */}
        <Route 
          path="/patient-dashboard" 
          element={
            isAuthenticated && userRole === 'patient' ? (
              <NurseDashboard onLogout={handleLogout} userId={userId} /> // Assuming the logic is similar
            ) : (
              <Navigate to="/login" replace />
            )
          }
        />


        {/* Catch-all → redirect sa About */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </Router>
  );
}

export default App;