import React from 'react';
import { Form, Button, Divider, Input, Select } from 'antd';
import { connect } from 'umi';
import styles from './index.less';
import { ConsoleSqlOutlined } from '@ant-design/icons';
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

  const { validateFields } = form;

  const onValidateForm = async () => {
    const values = await validateFields(); 
    console.log('step 1 onValidateForm get values: ', values)
    console.log('Props: ', props)
    var exist = false
    // TODO: implement check isbn if exist.
    /*const exist = request('http://localhost:3000/api/newbook/isbn', {
      method: 'POST',
      data: values
    })*/
    console.log('Dispatch: ', dispatch)
    console.log('Exist: ', exist)
    if(exist){
      console.log('Step 1 book info exist.')
      dispatch({
        type: 'newcopy/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'newcopy/saveCurrentStep',
        payload: 'confirm',
      });
    } else {
      // ISBN not exist, 
      console.log('Step 1 book info not exist.')
      dispatch({
        type: 'newcopy/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'newcopy/saveCurrentStep',
        payload: 'newbook',
      });
    }
    /*if (dispatch) {
      dispatch({
        type: 'formAndstepForm/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'formAndstepForm/saveCurrentStep',
        payload: 'confirm',
      });
    }*/
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
          rules={[
            {
              required: true,
              len: 10,
              message: 'Please enter 10-digit ISBN',
            },
          ]}
        >
          <Input placeholder="10-digit ISBN" />
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
            Next
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
        <p>
          First check if the book is in the system by isbn. if book exist, than add a new copy and go to step 3 to verify the information.
        </p>
        <p>
          If the book does not exist, go to step 2 to fill in the information. Liberian can search for authors using first name and last name or authorid. If no author exists, can add new author in a pop up(Modal) form.
        </p>
      </div>
    </>
  );
};

export default connect(({ newcopy }) => ({
  data: newcopy.step,
}))(Step1);
