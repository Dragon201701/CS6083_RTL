import React from 'react';
import { Form, Alert, Button, Descriptions, Divider, Statistic, Input } from 'antd';
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
  console.log(props)
  if (!data) {
    return null;
  }

  const { validateFields, getFieldsValue } = form;

  const onPrev = () => {
    if (dispatch) {
      const values = getFieldsValue();
      dispatch({
        type: 'findbook/saveStepFormData',
        payload: { ...data, ...values },
      });
      dispatch({
        type: 'findbook/saveCurrentStep',
        payload: 'info',
      });
    }
  };

  const onValidateForm = async () => {
    const values = await validateFields();

    if (dispatch) {
      dispatch({
        type: 'findbook/submitStepForm',
        payload: { ...data, ...values },
      });
    }
  };
  const topic = {
    1024: 'Children', 
    1234: 'Fiction', 
    2048: 'Science', 
    5643: 'Travel',
    6578: 'History',
    7866: 'Adventure',
    9087: 'Arts',
    9090: 'Drama',
  }
  const { isbn, bname, topicid} = data;
  return (
    <Form
      {...formItemLayout}
      form={form}
      layout="horizontal"
      className={styles.stepForm}
      initialValues={{
        password: '123456',
      }}
    >
      <Alert
        closable
        showIcon
        message="确认转账后，资金将直接打入对方账户，无法退回。"
        style={{
          marginBottom: 24,
        }}
      />
      <Descriptions column={1}>
        <Descriptions.Item label="ISBN"> {isbn}</Descriptions.Item>
        <Descriptions.Item label="Book Name"> {bname}</Descriptions.Item>
        <Descriptions.Item label="Topic"> {topic[topicid]}</Descriptions.Item>
      </Descriptions>
      <Divider
        style={{
          margin: '24px 0',
        }}
      />
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
          Reserve Book
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

export default connect(({ findbook, loading }) => ({
  submitting: loading.effects['findbook/submitStepForm'],
  data: findbook.step,
}))(Step2);
