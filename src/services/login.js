import request from '@/utils/request';
export async function fakeAccountLogin(params) {
  return request('/api/login/account', {
    method: 'POST',
    data: params,
  });
}
export async function getFakeCaptcha(mobile) {
  return request(`/api/login/captcha?mobile=${mobile}`);
}
export async function AccountLogin(params) {
  console.log("Firebase login email: ", params.email, " password: ", params.password)
  let status = 'ok'
  let type = 'account'
  let currentAuthority = 'user'
  var loginstatus = false;
  let loginpromise = firebase.auth().signInWithEmailAndPassword(params.email, params.password)
    .catch(function(error) {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;
    status = 'error'
    console.log("Firebase login failed. error code: ", error.code, " message: ", error.message)
  });
  const ret = await loginpromise
  if(params.email == "liualbert1@gmail.com") currentAuthority = "admin"
  console.log('Complete firebase authentication. ret:', ret)
  return ({status, type, currentAuthority})
}