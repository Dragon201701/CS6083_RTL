import request from 'umi-request';
export async function queryFakeList(params) {
  return request('/api/fake_list', {
    params,
  });
}

export async function fakeSubmitForm(params) {
  return request('/api/forms', {
    method: 'POST',
    data: params,
  });
}