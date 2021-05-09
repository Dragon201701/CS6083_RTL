import React, {useState} from 'react';
import { PlusOutlined } from '@ant-design/icons';
import { ModalForm, ProFormText, ProFormTextArea } from '@ant-design/pro-form';
import { Form, Button, Divider, Input, Select } from 'antd';
import { connect, useIntl, FormattedMessage } from 'umi';
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
  const [isModalVisible, setIsModalVisible] = useState(false);
  const intl = useIntl();
  const showModal = () => {
    setIsModalVisible(true);
  };
  const handleOk = () => {
    setIsModalVisible(false);
  };

  const handleCancel = () => {
    setIsModalVisible(false);
  };
  if (!data) {
    return null;
  }
  const { validateFields, getFieldsValue } = form;
  const onPrev = () => {
    if (dispatch) {
      const values = getFieldsValue();
      dispatch({
        type: 'newcopy/saveStepFormData',
        payload: { ...data, ...values},
      });
      dispatch({
        type: 'newcopy/saveCurrentStep',
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
        type: 'newcopy/saveStepFormData',
        payload: values,
      });
      dispatch({
        type: 'newcopy/saveCurrentStep',
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
              width: 'calc(125% - 100px)',
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
              len: 10,
              message: 'Please enter 10-digit ISBN',
            },
          ]}
        >
          <Input placeholder="10-digit ISBN" />
        </Form.Item>
        <Form.Item label="Topic" name="topic">
          <Select
            showSearch
            style={{ width: 'calc(125% - 100px)' }}
            placeholder="type here to search"
            optionFilterProp="children"
            filterOption={(input, option) =>
              option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
            }
          >
            <Option value="1">History</Option>
            <Option value="2">Geography</Option>
            <Option value="3">Economy</Option>
          </Select>
        </Form.Item>
        <Form.Item label="Authors" name="authors">
          <Input.Group compact>
            <Select
              mode="multiple"
              style={{ width: '65%' }}
              placeholder="select authors"
              defaultValue={['china']}
              optionLabelProp="label"
            >
              <Option value="china" label="China">
                <div className="demo-option-label-item">
                  <span role="img" aria-label="China">
                    🇨🇳
                  </span>
                  China (中国)
                </div>
              </Option>
              <Option value="usa" label="USA">
                <div className="demo-option-label-item">
                  <span role="img" aria-label="USA">
                    🇺🇸
                  </span>
                  USA (美国)
                </div>
              </Option>
            </Select>
            <Button
              type="primary"
              key="primary"
              style={{ width: '35%' }}
              onClick={() => {
                setIsModalVisible(true);
              }}
            >
              <PlusOutlined /> <FormattedMessage id="pages.newcopy.newauthor.button" defaultMessage="New Author" />
            </Button>,
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
      <ModalForm
        title={intl.formatMessage({
          id: 'pages.newcopy.newauthor.button',
          defaultMessage: 'New Author',
        })}
        width="400px"
        visible={isModalVisible}
        onVisibleChange={setIsModalVisible}
        onFinish={async (value) => {
          const success = await handleAdd(value);

          if (success) {
            setIsModalVisible(false);


            if (actionRef.current) {
              actionRef.current.reload();
            }
          }
        }}
      >
        <ProFormText
          rules={[
            {
              required: true,
              message: (
                "New author's first name required"
              ),
            },
          ]}
          label="Author's First Name"
          placeholder="First Name"
          width="md"
          name="afname"
        />
        <ProFormText
          rules={[
            {
              required: true,
              message: (
                "New author's last name required"
              ),
            },
          ]}
          label="Author's Lirst Name"
          placeholder="Last Name"
          width="md"
          name="alname"
        />
         <ProFormText
          rules={[
            {
              required: true,
              message: (
                "Email required"
              ),
            },
          ]}
          label="Author's Email"
          placeholder="Email Address"
          width="md"
          name="email"
        />
        <ProFormText
          rules={[
            {
              required: true,
              message: (
                "Street Required"
              ),
            },
          ]}
          label="Street"
          placeholder="Street Name"
          width="md"
          name="street"
        />
        <ProFormText
          rules={[
            {required: false},
          ]}
          label="House"
          placeholder="House/Apartment Number"
          width="md"
          name="house"
        />
        <ProFormText
          rules={[
            {
              required: true,
              message: (
                "City Required"
              ),
            },
          ]}
          label="City"
          placeholder="City"
          width="md"
          name="city"
        />
        <ProFormText
          rules={[
            {
              required: true,
              message: (
                "State Required"
              ),
            },
          ]}
          label="State"
          placeholder="State"
          width="md"
          name="state"
        />

      </ModalForm>
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
}))(Step2);
