import { fakeSubmitForm,  getallauthors} from './service';
const Model = {
  namespace: 'newcopy',
  state: {
    current: 'info',
    step: {
      payAccount: 'ant-design@alipay.com',
      receiverAccount: 'test@example.com',
      receiverName: 'Alex',
      amount: '500',
      bname: '',
      isbn: '',
      copyid: 0,
      authors: [],
      newtopic: '',
      allauthors: [],
    },
    allauthors: [],
  },
  effects: {
    *submitStepForm({ payload }, { call, put }) {
      yield call(fakeSubmitForm, payload); // TODO: replace fakeSubmitForm with newcopy
      yield put({
        type: 'saveStepFormData',
        payload,
      });
      yield put({
        type: 'saveCurrentStep',
        payload: 'result',
      });
    },
    *queryallauthors({ payload }, { call, put }){
      const authorlist = yield call(getallauthors);
      console.log('effect queryallauthors yield get: ', authorlist)
      yield put({
        type: 'updateallauthors',
        payload: Array.isArray(authorlist) ? authorlist : [],
      })
    }
  },
  reducers: {
    saveCurrentStep(state, { payload }) {
      return { ...state, current: payload };
    },

    saveStepFormData(state, { payload }) {
      console.log('model saveStepFormData payload: ', payload)
      return { ...state, step: { ...state.step, ...payload } };
    },
    updateallauthors(state, { payload }) {
      console.log('getallauthors reducers payload: ', payload)
      return { ...state, step: { ...state.step, allauthors: payload } };
    },
  },
};
export default Model;
