import axios from 'axios';

const api = axios.create({ baseURL: 'http://hunt-api.vssdev.com.br/api' });

export default api;