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
export async function newauthor(params) {
  console.log('New Author with params: ', params)
  return request('http://localhost:3000/api/newauthor', {
    method: 'POST', 
    data: params
  })
}
export async function getallauthors(){
  var result = []
  console.log('Service Get all authors')
  return request('http://localhost:3000/api/allauthors', {
      method: 'GET',
      data: {},
    })
}

