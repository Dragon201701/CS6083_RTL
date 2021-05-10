import React, { useEffect, useState } from 'react';
import moment from 'moment';
import { Modal, Result, Button, Form, DatePicker, Input, Select, Tabs } from 'antd';
import styles from '../style.less';
const { TextArea } = Input;
const { TabPane } = Tabs;
const formLayout = {
  labelCol: {
    span: 7,
  },
  wrapperCol: {
    span: 13,
  },
};


const OperationModal = (props) => {
  const [eventtype, seteventtype] = useState(0);
  //var eventtype = 'Exhibitons'
  const [form] = Form.useForm();
  const { done, visible, current, onDone, onCancel, onSubmit } = props;
  useEffect(() => {
    if (form && !visible) {
      form.resetFields();
    }
  }, [props.visible]);
  useEffect(() => {
    if (current) {
      form.setFieldsValue({
        ...current,
        createdAt: current.createdAt ? moment(current.createdAt) : null,
        eventtype: eventtype,
      });
    }
  }, [props.current]);

  const handleSubmit = () => {
    if (!form) return;
    form.submit();
  };

  const handleFinish = (values) => {
    console.log('Form value: ', values)
    if (onSubmit) {
      onSubmit(values);
    }
  };

  const modalFooter = done
    ? {
        footer: null,
        onCancel: onDone,
      }
    : {
        okText: 'Save',
        onOk: handleSubmit,
        onCancel,
      };

  const getModalContent = () => {
    if (done) {
      return (
        <Result
          status="success"
          title="Success!"
          subTitle="New event added to the database!"
          extra={
            <Button type="primary" onClick={onDone}>
              Acknowledge
            </Button>
          }
          className={styles.formResult}
        />
      );
    }

    return (
      <Form {...formLayout} form={form} onFinish={handleFinish}>
        <Form.Item
          name="title"
          label="Event Name"
          rules={[
            {
              required: true,
              message: 'Please enter event name',
            },
          ]}
        >
          <Input placeholder="Please enter..." />
        </Form.Item>
        <Form.Item
          name="createdAt"
          label="Start Time"
          rules={[
            {
              required: true,
              message: 'Please enter event start time',
            },
          ]}
        >
          <DatePicker
            showTime
            placeholder="Please select"
            format="YYYY-MM-DD HH:mm:ss"
            style={{
              width: '100%',
            }}
          />
        </Form.Item>
        <Form.Item
          name="owner"
          label="Sponsors"
          rules={[
            {
              required: true,
              message: 'Please enter sponsors',
            },
          ]}
        >
          <Select placeholder="Please select">
            <Select.Option value="CSE">CSE</Select.Option>
            <Select.Option value="ECE">ECE</Select.Option>
          </Select>
        </Form.Item>
        <Form.Item
          name="subDescription"
          label="Event Descritpion"
          rules={[
            {
              message: 'Please enter event description. Minimum of 5 characters.',
              min: 5,
            },
          ]}
        >
          <TextArea rows={4} placeholder="Please enter description no less than 5 characters." />
        </Form.Item>
        <Form.Item
          name="eventt"
          label="Select Event Type"
        >
          <Tabs defaultActiveKey="1" onChange={seteventtype}>
            <TabPane tab="Tab 1" key="1">
              Content of Tab Pane 1
            </TabPane>
            <TabPane tab="Tab 2" key="2">
              Content of Tab Pane 2
            </TabPane>
          </Tabs>
        </Form.Item>
      </Form>
    );
  };

  return (
    <Modal
      title={done ? null : `Event${current ? 'Edit' : 'Add'}`}
      className={styles.standardListForm}
      width={640}
      bodyStyle={
        done
          ? {
              padding: '72px 0',
            }
          : {
              padding: '28px 0 0',
            }
      }
      destroyOnClose
      visible={visible}
      {...modalFooter}
    >
      {getModalContent()}
    </Modal>
  );
};

export default OperationModal;
