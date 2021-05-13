import { fakeSubmitForm, querybook } from './service';
const Model = {
  namespace: 'findbook',
  state: {
    current: 'info',
    step: {
      isbn: '',
      bname: '',
      topicid: '',
    },
    book: null,
  },
  effects: {
    *submitStepForm({ payload }, { call, put }) {
      yield call(fakeSubmitForm, payload);
      yield put({
        type: 'saveStepFormData',
        payload,
      });
      yield put({
        type: 'saveCurrentStep',
        payload: 'result',
      });
    },
    *querybookData({ payload }, { call, put }) {
      console.log('Query Book info: ', payload)
      let result = yield call(querybook, payload);
      console.log('Get book info result: ', result)
      yield put({
        type: 'saveCurrentBookInfo',
        payload: result,
      });
      yield put({
        type: 'saveCurrentStep',
        payload: 'confirm',
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
    saveCurrentBookInfo(state, {payload}){
      console.log('saveCurrentBookInfo payload: ', payload)
      return { ...state, step: {...state.step, bname: payload[0].bname, topicid: payload[0].topicid}};
    }
    
  },
};
export default Model;
