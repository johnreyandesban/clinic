// Flow Validation Tests
import { test, expect } from 'vitest';
import axios from 'axios';

const API_URL = 'http://localhost/project/clinic/backend/api_all.php?route=';

// Mock data
const testPatient = {
    first_name: 'Test',
    last_name: 'Patient',
    birth_date: '2000-01-01',
    gender: 'Male',
    contact_number: '1234567890',
    address: 'Test Address',
    hmo_id: 'TEST123'
};

const testVitals = {
    blood_pressure: '120/80',
    temperature: 36.6,
    weight: 70,
    height: 170,
    nurse_notes: 'Test notes'
};

const testMedicalRecord = {
    diagnosis: 'Test diagnosis',
    treatment_plan: 'Test treatment',
    prescription: 'Test prescription',
    follow_up_date: '2025-11-01'
};

describe('Patient Flow Tests', () => {
    let patientId, appointmentId, doctorId, nurseId;

    test('1. Staff can register patient', async () => {
        const response = await axios.post(API_URL + 'patients/register', testPatient);
        expect(response.status).toBe(201);
        expect(response.data.message).toContain('success');
        patientId = response.data.id;
    });

    test('2. Staff can schedule appointment', async () => {
        const appointment = {
            patient_id: patientId,
            doctor_id: doctorId,
            appointment_date: '2025-10-28',
            appointment_time: '09:00',
            reason_for_visit: 'Test visit'
        };
        const response = await axios.post(API_URL + 'appointments/schedule', appointment);
        expect(response.status).toBe(201);
        appointmentId = response.data.id;
    });

    test('3. Nurse can add vitals', async () => {
        const vitals = {
            ...testVitals,
            appointment_id: appointmentId,
            nurse_id: nurseId
        };
        const response = await axios.post(API_URL + 'nurse/vitals', vitals);
        expect(response.status).toBe(200);
        expect(response.data.message).toContain('Vitals Done');
    });

    test('4. Doctor can view vitals', async () => {
        const response = await axios.get(API_URL + `doctor/appointments&doctor_id=${doctorId}`);
        expect(response.status).toBe(200);
        const appointment = response.data.find(a => a.appointment_id === appointmentId);
        expect(appointment.vitals).toBeDefined();
        expect(appointment.status).toBe('Vitals Done');
    });

    test('5. Doctor can create medical record', async () => {
        const record = {
            ...testMedicalRecord,
            patient_id: patientId,
            doctor_id: doctorId,
            appointment_id: appointmentId
        };
        const response = await axios.post(API_URL + 'records/create', record);
        expect(response.status).toBe(201);
        expect(response.data.message).toContain('completed');
    });

    test('6. Status transitions are enforced', async () => {
        // Try to complete appointment without vitals (should fail)
        const response1 = await axios.put(API_URL + `appointments/status&id=${appointmentId}`, {
            status: 'Completed'
        }).catch(e => e.response);
        expect(response1.status).toBe(400);

        // Try to add vitals after completion (should fail)
        const response2 = await axios.post(API_URL + 'nurse/vitals', {
            appointment_id: appointmentId,
            ...testVitals
        }).catch(e => e.response);
        expect(response2.status).toBe(400);
    });
});