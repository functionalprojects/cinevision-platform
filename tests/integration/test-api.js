const axios = require('axios');
const { expect } = require('chai');

const BASE_URL = process.env.BASE_URL || 'http://localhost:8080';

describe('CineVision API Smoke Tests', () => {
    it('should return health status UP', async () => {
        const res = await axios.get(`${BASE_URL}/actuator/health`);
        expect(res.status).to.equal(200);
        expect(res.data.status).to.equal('UP');
    });
});