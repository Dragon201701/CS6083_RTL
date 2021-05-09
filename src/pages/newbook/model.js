import { fakeSubmitForm } from './service';
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
    },
    newauthor: false,
    newbook: false,
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
  },
  reducers: {
    saveCurrentStep(state, { payload }) {
      return { ...state, current: payload };
    },

    saveStepFormData(state, { payload }) {
      return { ...state, step: { ...state.step, ...payload } };
    },
  },
};
export default Model;
