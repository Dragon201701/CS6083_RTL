import request from 'umi-request';
export async function fakeSubmitForm(params) {
  return request('/api/forms', {
    method: 'POST',
    data: params,
  });
}
export async function querybook(params) {
  return request('http://localhost:3000/api/findbook', {
    method: 'POST',
    data: params
  })
}
