import request from 'umi-request';
export async function fakeSubmitForm(params) {
  return request('/api/forms', {
    method: 'POST',
    data: params,
  });
}
export async function newcopy(params) {
  return request('http://localhost:3000/api/newbook/newcopy', {
    method: 'POST',
    data: params
  })
}
