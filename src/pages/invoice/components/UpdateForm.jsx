import React, { useState } from 'react';
import { Form, Button, DatePicker, Input, Modal, Radio, Select, Steps, Descriptions } from 'antd';
import ProDescriptions from '@ant-design/pro-descriptions';
const FormItem = Form.Item;
const { Step } = Steps;
const { TextArea } = Input;
const { Option } = Select;
const RadioGroup = Radio.Group;
const formLayout = {
  labelCol: {
    span: 7,
  },
  wrapperCol: {
    span: 13,
  },
};

const UpdateForm = (props) => {
  const [formVals, setFormVals] = useState({
    bname: props.values.bname,
    isbn: props.values.isbn,
    cfname: props.values.cfname,
    clname: props.values.clname,
    cid: props.values.cid,
    amount: props.values.amount,
    balance: props.values.balance,
    status: props.values.status,
    copyid: props.values.copyid,

    name: props.values.name,
    desc: props.values.desc,
    key: props.values.key,
    target: '0',
    template: '0',
    type: '1',
    time: '',
    frequency: 'month',
  });
  const [currentStep, setCurrentStep] = useState(0);
  const [form] = Form.useForm();
  const {
    onSubmit: handleUpdate,
    onCancel: handleUpdateModalVisible,
    updateModalVisible,
    values,
  } = props;

  const forward = () => setCurrentStep(currentStep + 1);

  const backward = () => setCurrentStep(currentStep - 1);

  const handleNext = async () => {
    const fieldsValue = await form.validateFields();
    setFormVals({ ...formVals, ...fieldsValue });

    if (currentStep < 2) {
      forward();
    } else {
      handleUpdate({ ...formVals, ...fieldsValue });
    }
  };

  const renderContent = () => {
    if (currentStep === 1) {
      return (
        <>
          <FormItem name="target" label="监控对象">
            <Select
              style={{
                width: '100%',
              }}
            >
              <Option value="0">表一</Option>
              <Option value="1">表二</Option>
            </Select>
          </FormItem>
          <FormItem name="template" label="规则模板">
            <Select
              style={{
                width: '100%',
              }}
            >
              <Option value="0">规则模板一</Option>
              <Option value="1">规则模板二</Option>
            </Select>
          </FormItem>
          <FormItem name="type" label="规则类型">
            <RadioGroup>
              <Radio value="0">强</Radio>
              <Radio value="1">弱</Radio>
            </RadioGroup>
          </FormItem>
        </>
      );
    }

    if (currentStep === 2) {
      return (
        <>
          <FormItem
            name="time"
            label="开始时间"
            rules={[
              {
                required: true,
                message: '请选择开始时间！',
              },
            ]}
          >
            <DatePicker
              style={{
                width: '100%',
              }}
              showTime
              format="YYYY-MM-DD HH:mm:ss"
              placeholder="选择开始时间"
            />
          </FormItem>
          <FormItem name="frequency" label="调度周期">
            <Select
              style={{
                width: '100%',
              }}
            >
              <Option value="month">月</Option>
              <Option value="week">周</Option>
            </Select>
          </FormItem>
        </>
      );
    }

    return (
      <>
        <ProDescriptions column={2}>
          <ProDescriptions.Item span={2} label="Book Name">{formVals.bname}</ProDescriptions.Item>
          <ProDescriptions.Item label="ISBN" valueType="number"> {formVals.isbn}</ProDescriptions.Item>
          <ProDescriptions.Item label="Copy ID" valueType="number"> {formVals.copyid}</ProDescriptions.Item>
          <ProDescriptions.Item label="Customer Name"> {formVals.cfname.concat(" ", formVals.clname)}</ProDescriptions.Item>
          <ProDescriptions.Item label="Customer ID" valueType="number"> {formVals.cid}</ProDescriptions.Item>
          <ProDescriptions.Item label="Invoice Amount"> $ {formVals.amount}</ProDescriptions.Item>
          <ProDescriptions.Item label="Remaining Balance"> $ {formVals.balance}</ProDescriptions.Item>
      
        </ProDescriptions>
        <Form.Item label="Payment Amount">
          <Input.Group compact>
            <Select
              defaultValue="cash"
              style={{
                width: 100,
              }}
            >
              <Option value="cash">Cash</Option>
              <Option value="card">Credit Card</Option>
              <Option value="paypal">Paypal</Option>
              <Option value="alipay">Alipay</Option>
            </Select>
            <Form.Item
              
              name="amount"
              rules={[
                {
                  required: true,
                  message: 'Please enter amount',
                },
                {
                  pattern: /^(\d+)((?:\.\d+)?)$/,
                  message: 'Input is not number',
                },
              ]}
            >
              <Input prefix="$" placeholder={formVals.balance} />
            </Form.Item>
          </Input.Group>
        </Form.Item>
      </>
    );
  };

  const renderFooter = () => {
    if (currentStep === 1) {
      return (
        <>
          <Button
            style={{
              float: 'left',
            }}
            onClick={backward}
          >
            Back
          </Button>
          <Button onClick={() => handleUpdateModalVisible(false, values)}>Cancel</Button>
          <Button type="primary" onClick={() => handleNext()}>
            Next
          </Button>
        </>
      );
    }

    if (currentStep === 2) {
      return (
        <>
          <Button
            style={{
              float: 'left',
            }}
            onClick={backward}
          >
            Back
          </Button>
          <Button onClick={() => handleUpdateModalVisible(false, values)}>Cancel</Button>
          <Button type="primary" onClick={() => handleNext()}>
            Complete
          </Button>
        </>
      );
    }

    return (
      <>
        <Button onClick={() => handleUpdateModalVisible(false, values)}>Cancel</Button>
        <Button type="primary" onClick={() => handleNext()}>
          Next
        </Button>
      </>
    );
  };

  return (
    <Modal
      width={640}
      bodyStyle={{
        padding: '32px 40px 48px',
      }}
      destroyOnClose
      title="New Payment"
      visible={updateModalVisible}
      footer={renderFooter()}
      onCancel={() => handleUpdateModalVisible()}
    >
      <Steps
        style={{
          marginBottom: 28,
        }}
        size="small"
        current={currentStep}
      >
        <Step title="Copy and Customer Info" />
        <Step title="Verify" />
        <Step title="Payment Complete" />
      </Steps>
      <Form
        {...formLayout}
        form={form}
        initialValues={{
          target: formVals.target,
          template: formVals.template,
          type: formVals.type,
          frequency: formVals.frequency,
          name: formVals.name,
          desc: formVals.desc,
          bname: formVals.bname,
          isbn: formVals.isbn,
          amount: formVals.amount,
          balance: formVals.balance,
          cfname: formVals.cfname,
          clname: formVals.clname,
          cid: formVals.cid,
          copyid: formVals.copyid,
        }}
      >
        {renderContent()}
      </Form>
    </Modal>
  );
};

export default UpdateForm;
