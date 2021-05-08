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

function gettopics(){
  topic = request("http://localhost")
  return topic
}
const Step2 = (props) => {
  const { dispatch, data } = props;
  const [form] = Form.useForm();

  if (!data) {
    return null;
  }
  const { validateFields, getFieldsValue } = form;
  const onPrev = () => {
    if (dispatch) {
      const values = getFieldsValue();
      dispatch({
        type: 'formAndstepForm/saveStepFormData',
        payload: { ...data, ...values},
      });
      dispatch({
        type: 'formAndstepForm/saveCurrentStep',
        payload: 'newcopy',
      });
    }
  };
  const onValidateForm = async () => {
    const values = await validateFields(); 
    console.log('step 1 onValidateForm get values: ', values)
    console.log('Props: ', props)
    if (dispatch) {
      dispatch({
        type: 'formAndstepForm/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'formAndstepForm/saveCurrentStep',
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
          name="bname"
          label="Book Name"
        >
          <Input
            style={{
              width: 'calc(100% - 120px)',
            }}
            placeholder="Book Name"
          />
        </Form.Item>
        <Form.Item
          label="ISBN"
          name="isbn"
          rules={[
            {
              required: true,
              message: 'Please enter 10-digit ISBN',
            },
          ]}
        >
          <Input placeholder="10-digit ISBN" />
        </Form.Item>
         <Form.Item label="Topic">
          <Input.Group compact>
            <Select
              name="topic"
              defaultValue="history"
              style={{
                width: 100,
              }}
            >
              <Option value="history">History</Option>
              <Option value="finance">Finance</Option>
            </Select>
            <Form.Item
              noStyle
              name="newTopic"
            >
              <Input
                style={{
                  width: 'calc(100% - 100px)',
                }}
                placeholder="other topic"
              />
            </Form.Item>
          </Input.Group>
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
          <Button onClick={onPrev}>
            Back
          </Button>
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

export default connect(({ formAndstepForm }) => ({
  data: formAndstepForm.step,
}))(Step2);
