import React from 'react';
import { Modal } from 'antd';
import {
  ProFormSelect,
  ProFormText,
  ProFormTextArea,
  StepsForm,
  ProFormRadio,
  ProFormDateTimePicker,
} from '@ant-design/pro-form';
import { useIntl, FormattedMessage } from 'umi';

const RentalForm = (props) => {
  console.log('Rental form props: ', props)
  const intl = useIntl();
  return (
    <StepsForm
      stepsProps={{
        size: 'small',
      }}
      stepsFormRender={(dom, submitter) => {
        return (
          <Modal
            width={640}
            bodyStyle={{
              padding: '32px 40px 48px',
            }}
            destroyOnClose
            title="New Rental"
            visible={props.updateModalVisible}
            footer={submitter}
            onCancel={() => {
              props.onCancel();
            }}
          >
            {dom}
          </Modal>
        );
      }}
      onFinish={props.onSubmit}
    >
      <StepsForm.StepForm title="Basic Info">
        <ProFormText
          name="isbn"
          label="ISBN"
          width="md"
          rules={[
            {
              required: true,
              message: "Please enter ISBN"
            },
          ]}
        />
        <ProFormTextArea
          name="copyid"
          width="md"
          label="Copy ID"
          placeholder="Copy ID"
          rules={[
            {
              required: true,
              message: "Please enter copy ID."
            },
          ]}
        />
        <ProFormTextArea
          name="custid"
          width="md"
          label="Customer ID"
          placeholder="Customer ID"
          rules={[
            {
              required: true,
              message: "Please enter customer ID."
            },
          ]}
        />
      </StepsForm.StepForm>
      <StepsForm.StepForm title="Confirm Info">
        <Descriptions column={1}>
          <Descriptions.Item label="ISBN"> {props.value}</Descriptions.Item>
        </Descriptions>
        <ProFormSelect
          name="target"
          width="md"
          label={intl.formatMessage({
            id: 'pages.searchTable.updateForm.object',
            defaultMessage: '????????????',
          })}
          valueEnum={{
            0: '??????',
            1: '??????',
          }}
        />
        <ProFormSelect
          name="template"
          width="md"
          label={intl.formatMessage({
            id: 'pages.searchTable.updateForm.ruleProps.templateLabel',
            defaultMessage: '????????????',
          })}
          valueEnum={{
            0: '???????????????',
            1: '???????????????',
          }}
        />
        <ProFormRadio.Group
          name="type"
          label={intl.formatMessage({
            id: 'pages.searchTable.updateForm.ruleProps.typeLabel',
            defaultMessage: '????????????',
          })}
          options={[
            {
              value: '0',
              label: '???',
            },
            {
              value: '1',
              label: '???',
            },
          ]}
        />
      </StepsForm.StepForm>
      <StepsForm.StepForm
        initialValues={{
          type: '1',
          frequency: 'month',
        }}
        title={intl.formatMessage({
          id: 'pages.searchTable.updateForm.schedulingPeriod.title',
          defaultMessage: '??????????????????',
        })}
      >
        <ProFormDateTimePicker
          name="time"
          width="md"
          label={intl.formatMessage({
            id: 'pages.searchTable.updateForm.schedulingPeriod.timeLabel',
            defaultMessage: '????????????',
          })}
          rules={[
            {
              required: true,
              message: (
                <FormattedMessage
                  id="pages.searchTable.updateForm.schedulingPeriod.timeRules"
                  defaultMessage="????????????????????????"
                />
              ),
            },
          ]}
        />
        <ProFormSelect
          name="frequency"
          label={intl.formatMessage({
            id: 'pages.searchTable.updateForm.object',
            defaultMessage: '????????????',
          })}
          width="md"
          valueEnum={{
            month: '???',
            week: '???',
          }}
        />
      </StepsForm.StepForm>
    </StepsForm>
  );
};

export default RentalForm;
