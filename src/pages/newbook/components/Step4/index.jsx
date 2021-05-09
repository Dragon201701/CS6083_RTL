import { Button, Result, Descriptions, Statistic } from 'antd';
import React from 'react';
import { connect } from 'umi';
import styles from './index.less';

const Step3 = (props) => {
  const { data, dispatch } = props;

  if (!data) {
    return null;
  }

  const { payAccount, receiverAccount, receiverName, amount, isbn, bname, copyid, authors, topic} = data;

  const onFinish = () => {
    if (dispatch) {
      dispatch({
        type: 'newcopy/saveCurrentStep',
        payload: 'info',
      });
    }
  };

  const information = (
    <div className={styles.information}>
      <Descriptions column={1}>
      <Descriptions.Item label="ISBN"> {isbn}</Descriptions.Item>
      <Descriptions.Item label="Book Name"> {bname}</Descriptions.Item>
      <Descriptions.Item label="Topic"> {topic}</Descriptions.Item>
      <Descriptions.Item label="Copy ID"> {copyid}</Descriptions.Item>
      
      </Descriptions>
    </div>
  );
  const extra = (
    <>
      <Button type="primary" onClick={onFinish}>
        Add another copy
      </Button>
      <Button>See Result</Button>
    </>
  );
  return (
    <Result
      status="success"
      title="New copy is now in system."
      subTitle="Grab the sticker and stick them to the back of the book."
      extra={extra}
      className={styles.result}
    >
      {information}
    </Result>
  );
};

export default connect(({ newcopy }) => ({
  data: newcopy.step,
}))(Step3);
