import React from 'react';
import { Form, Alert, Button, Descriptions, Divider, Statistic, Input, Select } from 'antd';
import { connect } from 'umi';
import styles from './index.less';
const formItemLayout = {
  labelCol: {
    span: 5,
  },
  wrapperCol: {
    span: 19,
  },
};

const Step2 = (props) => {
  const [form] = Form.useForm();
  const { data, dispatch, submitting } = props;

  if (!data) {
    return null;
  }

  const { validateFields, getFieldsValue } = form;

  const onPrev = () => {
    if (dispatch) {
      const values = getFieldsValue();
      dispatch({
        type: 'formAndstepForm/saveStepFormData',
        payload: { ...data, ...values },
      });
      dispatch({
        type: 'formAndstepForm/saveCurrentStep',
        payload: 'newbook',
      });
    }
  };

  const onValidateForm = async () => {
    const values = await validateFields();
    console.log('step 2 onValidateForm get values: ', values)
    if (dispatch) {
      dispatch({
        type: 'formAndstepForm/submitStepForm',
        payload: { ...data, ...values },
      });
    }
  };

  const { payAccount, receiverAccount, receiverName, amount, isbn, bname, copyid, authors, topic } = data;
  return (
    <Form
      {...formItemLayout}
      form={form}
      layout="horizontal"
      className={styles.stepForm}
    >
      <Alert
        closable
        showIcon
        message="Plase double check and verify the above info is correct."
        style={{
          marginBottom: 24,
        }}
      />
      <Descriptions column={1}>
        <Descriptions.Item label="ISBN"> {isbn}</Descriptions.Item>
        <Descriptions.Item label="Book Name"> {bname}</Descriptions.Item>
        <Descriptions.Item label="Topic"> {topic}</Descriptions.Item>
        <Descriptions.Item label="Copy ID"> {copyid}</Descriptions.Item>
      </Descriptions>
      <Form.Item
        style={{
          marginBottom: 8,
        }}
        wrapperCol={{
          xs: {
            span: 24,
            offset: 0,
          },
          sm: {
            span: formItemLayout.wrapperCol.span,
            offset: formItemLayout.labelCol.span,
          },
        }}
      >
        <Button type="primary" onClick={onValidateForm} loading={submitting}>
          Submit
        </Button>
        <Button
          onClick={onPrev}
          style={{
            marginLeft: 8,
          }}
        >
          Back
        </Button>
      </Form.Item>
    </Form>
  );
};

export default connect(({ formAndstepForm, loading }) => ({
  submitting: loading.effects['formAndstepForm/submitStepForm'],
  data: formAndstepForm.step,
}))(Step2);
