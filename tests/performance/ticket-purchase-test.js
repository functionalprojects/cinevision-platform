import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
    stages: [
        { duration: '2m', target: 50 },   // ramp up to 50 users
        { duration: '5m', target: 50 },   // stay at 50
        { duration: '2m', target: 0 },    // ramp down
    ],
};

const BASE_URL = __ENV.BASE_URL || 'http://localhost:8080';

export default function () {
    // Simulate user flow: register, login,  buy ticket
    let registerRes = http.post(`${BASE_URL}/api/user/users/add`, JSON.stringify({
        customerName: `User${__VU}`,
        email: `user${__VU}@example.com`,
        phone: '1234567890',
        password: 'password123'
    }), { headers: { 'Content-Type': 'application/json' } });
    check(registerRes, { 'register status 200': (r) => r.status === 200 });

    let loginRes = http.post(`${BASE_URL}/api/user/auth/login`, JSON.stringify({
        email: `user${__VU}@example.com`,
        password: 'password123'
    }), { headers: { 'Content-Type': 'application/json' } });
    check(loginRes, { 'login status 200': (r) => r.status === 200 });
    let token = loginRes.json('token');

    let ticketRes = http.post(`${BASE_URL}/api/movie/payments/sendTicketDetail`, JSON.stringify({
        fullName: `User${__VU}`,
        email: `user${__VU}@example.com`,
        movieName: 'Test Movie',
        movieDay: '2025-01-01',
        movieStartTime: '19:00',
        saloonName: 'Saloon A',
        chairNumbers: 'A1'
    }), { headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${token}` } });
    check(ticketRes, { 'ticket purchase status 200': (r) => r.status === 200 });

    sleep(1);
}