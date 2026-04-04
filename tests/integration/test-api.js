const axios = require('axios');
const { expect } = require('chai');

const BASE_URL = process.env.BASE_URL || 'http://localhost:8080';

describe('API Integration Tests', function() {
    let token;

    it('should register a user', async function() {
        const res = await axios.post(`${BASE_URL}/api/user/users/add`, {
            customerName: 'Test User',
            email: 'test@example.com',
            phone: '1234567890',
            password: 'password123'
        });
        expect(res.status).to.equal(200);
    });

    it('should login and get a token', async function() {
        const res = await axios.post(`${BASE_URL}/api/user/auth/login`, {
            email: 'test@example.com',
            password: 'password123'
        });
        expect(res.status).to.equal(200);
        expect(res.data.token).to.be.a('string');
        token = res.data.token;
    });

    it('should get displaying movies', async function() {
        const res = await axios.get(`${BASE_URL}/api/movie/movies/displayingMovies`, {
            headers: { Authorization: `Bearer ${token}` }
        });
        expect(res.status).to.equal(200);
        expect(res.data).to.be.an('array');
    });

    // Add more tests: movie details, comment, ticket purchase
});