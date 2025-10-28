// clinic/src/frontend/Auth.jsx
import React, { useState } from 'react';
import axios from 'axios';
import { Box, Paper, Typography, TextField, Button, Alert, Grid, CircularProgress, InputAdornment, MenuItem, Select, FormControl, InputLabel } from '@mui/material';
import { Login as LoginIcon, AccountCircle, Lock } from '@mui/icons-material';

const ADMIN_API = 'http://localhost/project/clinic/backend/api.php';
const STAFF_API = 'http://localhost/project/clinic/backend/staff_api.php';

const Auth = ({ onLoginSuccess }) => {
    const [formData, setFormData] = useState({ 
        username: '',
        password: '',
        role: 'Staff' // default role
    });
    const [message, setMessage] = useState(null);
    const [isLoading, setIsLoading] = useState(false);

    const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

    const handleSubmit = async (e) => {
        e.preventDefault();
        setMessage(null);
        setIsLoading(true);

        try {
            let res;

            if (formData.role === 'Admin') {
                // Admin login uses api.php which expects form-encoded POST with username/password
                const params = new URLSearchParams();
                params.append('username', formData.username);
                params.append('password', formData.password);
                res = await axios.post(ADMIN_API, params, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });

                if (res.data && res.data.success) {
                    setMessage({ severity: 'success', text: 'Admin login successful' });
                    onLoginSuccess({ role: 'Admin', username: formData.username });
                    return;
                } else {
                    throw new Error(res.data?.message || 'Invalid admin credentials');
                }
            } else {
                // Staff/Doctor/Nurse login uses staff_api.php and expects username/password/role as POST
                const params = new URLSearchParams();
                params.append('username', formData.username);
                params.append('password', formData.password);
                params.append('role', formData.role);

                res = await axios.post(STAFF_API, params, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });

                if (res.data && res.data.success) {
                    setMessage({ severity: 'success', text: `${formData.role} login successful` });
                    // staff_api.php returns user object with id, username, position
                    onLoginSuccess({ role: res.data.user.position, user: res.data.user });
                    return;
                } else {
                    throw new Error(res.data?.message || 'Invalid staff credentials');
                }
            }

        } catch (error) {
            const errorMsg = error.response?.data?.message || error.message || 'Invalid username or password. Please try again.';
            setMessage({ severity: 'error', text: errorMsg });

        } finally {
            setIsLoading(false);
        }
    };

    return (
        <Grid container component="main" sx={{ height: '100vh', backgroundColor: '#f5f5f5' }} justifyContent="center" alignItems="center">
            <Grid item xs={12} sm={8} md={5} component={Paper} elevation={6} square>
                <Box sx={{ my: 8, mx: 4, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                    <Typography component="h1" variant="h4" sx={{ mb: 1, color: '#1976d2' }}>Clinic Management System</Typography>
                    <Typography component="h2" variant="h5" sx={{ mb: 3 }}>User Login</Typography>
                    {message && <Alert severity={message.severity} sx={{ width: '100%', mb: 2 }}>{message.text}</Alert>}
                    <Box component="form" noValidate onSubmit={handleSubmit} sx={{ mt: 1, width: '100%' }}>
                        <TextField
                            margin="normal" required fullWidth label="Username" name="username" autoFocus
                            value={formData.username} onChange={handleChange} disabled={isLoading}
                            InputProps={{ startAdornment: (<InputAdornment position="start"><AccountCircle /></InputAdornment>) }}
                        />
                        <TextField
                            margin="normal" required fullWidth name="password" label="Password" type="password"
                            value={formData.password} onChange={handleChange} disabled={isLoading}
                            InputProps={{ startAdornment: (<InputAdornment position="start"><Lock /></InputAdornment>) }}
                        />

                        <FormControl fullWidth sx={{ mt: 2 }}>
                            <InputLabel id="role-label">Role</InputLabel>
                            <Select
                                labelId="role-label"
                                label="Role"
                                name="role"
                                value={formData.role}
                                onChange={(e) => setFormData({ ...formData, role: e.target.value })}
                                disabled={isLoading}
                            >
                                <MenuItem value="Admin">Admin</MenuItem>
                                <MenuItem value="Staff">Staff</MenuItem>
                                <MenuItem value="Doctor">Doctor</MenuItem>
                                <MenuItem value="Nurse">Nurse</MenuItem>
                            </Select>
                        </FormControl>

                        <Button
                            type="submit" fullWidth variant="contained" sx={{ mt: 3, mb: 2, py: 1.5 }}
                            startIcon={isLoading ? <CircularProgress size={24} color="inherit" /> : <LoginIcon />}
                            disabled={isLoading}
                        >
                            {isLoading ? 'Authenticating...' : 'Sign In'}
                        </Button>
                    </Box>
                </Box>
            </Grid>
        </Grid>
    );
};

export default Auth;
