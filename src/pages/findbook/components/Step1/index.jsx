import React from 'react';
import { Form, Button, Divider, Input, Select } from 'antd';
import { connect } from 'umi';
import styles from './index.less';
const { Option } = Select;
const formItemLayout = {
  labelCol: {
    span: 5,
  },
  wrapperCol: {
    span: 19,
  },
};

const Step1 = (props) => {
  const { dispatch, data } = props;
  const [form] = Form.useForm();

  if (!data) {
    return null;
  }

  const { validateFields, getFieldValue } = form;

  const onValidateForm = async () => {
    //const values = await validateFields();
    const values = await getFieldValue();
    if (dispatch) {
      dispatch({
        type: 'findbook/querybookData',
        payload: values,
      });
      dispatch({
        type: 'findbook/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'findbook/saveCurrentStep',
        payload: 'confirm',
      });
    }
  };

  return (
    <>
      <Form
        {...formItemLayout}
        form={form}
        layout="horizontal"
        className={styles.stepForm}
        hideRequiredMark
        initialValues={data}
      >
        <Form.Item
          label="ISBN"
          name="isbn"
        >
          <Input placeholder="search by 10-digit ISBN" />
        </Form.Item>
        <Form.Item
          label="Book Name"
          name="bname"
        >
          <Input placeholder="Search by book name" />
        </Form.Item>
        <Form.Item
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
          <Button type="primary" onClick={onValidateForm}>
            Find Book
          </Button>
        </Form.Item>
      </Form>
      <Divider
        style={{
          margin: '40px 0 24px',
        }}
      />
      <div className={styles.desc}>
        <h3>Description</h3>
        <h4>Search book</h4>
        <p>
          You can search the book using ISBN or Book Name. If the book exist, will show if copy is available or not. 
          If the copy is not available, will show the earliest expected return date.
        </p>
      </div>
    </>
  );
};

export default connect(({ findbook }) => ({
  data: findbook.step,
}))(Step1);
