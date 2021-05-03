import request from '@/utils/request';
export async function queryRule(params) {
  return request('/api/rule', {
    params,
  });
}
export async function removeRule(params) {
  return request('/api/rule', {
    method: 'POST',
    data: { ...params, method: 'delete' },
  });
}
export async function addRule(params) {
  return request('/api/rule', {
    method: 'POST',
    data: { ...params, method: 'post' },
  });
}
export async function updateRule(params) {
  return request('/api/rule', {
    method: 'POST',
    data: { ...params, method: 'update' },
  });
}
export async function newReturn(params) {
  return request('http://localhost:3000/api/newreturn', {
    method: 'POST',
    data: params,
  })
}
export async function queryBooks(params) {
  return request('http://localhost:3000/api/books', {
    method: 'GET',
    data: params,
  })
}
export async function updateRental(params){
  // TODO: I am planning to update owners, expected return date
  return request('http://localhost:3000/api/updateRental', {
    method: 'POST', 
    data: params,
  })
}