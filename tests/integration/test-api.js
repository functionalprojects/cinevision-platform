const axios = require('axios');
const { expect } = require('chai');

const BASE_URL = process.env.BASE_URL || 'http://localhost:8080';

describe('CineVision Smoke Tests', () => {
    it('should return frontend homepage', async () => {
        const res = await axios.get(`${BASE_URL}/`);
        expect(res.status).to.equal(200);
    });
});