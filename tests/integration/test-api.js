const axios = require('axios');
const { expect } = require('chai');

// Use the frontend service URL (accessible from within the cluster)
const BASE_URL = 'http://frontend.cinevision.svc.cluster.local';

describe('CineVision Smoke Tests', () => {
    it('should return frontend homepage', async () => {
        const res = await axios.get(`${BASE_URL}/`);
        expect(res.status).to.equal(200);
    });
});