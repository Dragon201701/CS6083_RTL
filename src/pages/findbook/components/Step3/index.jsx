import { Button, Result, Descriptions, Statistic } from 'antd';
import React from 'react';
import { connect } from 'umi';
import styles from './index.less';

const Step3 = (props) => {
  const { data, dispatch } = props;

  if (!data) {
    return null;
  }

  const { isbn, bname, topicid} = data;

  const onFinish = () => {
    if (dispatch) {
      dispatch({
        type: 'findbook/saveCurrentStep',
        payload: 'info',
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
  const information = (
    <div className={styles.information}>
      <Descriptions column={1}>
        <Descriptions.Item label="ISBN"> {isbn}</Descriptions.Item>
        <Descriptions.Item label="Book Name"> {bname}</Descriptions.Item>
        <Descriptions.Item label="Topic"> {topic[topicid]}</Descriptions.Item>
      </Descriptions>
    </div>
  );
  const extra = (
    <>
      <Button type="primary" onClick={onFinish}>
        Find Another Book
      </Button>
      <Button>Check My Rental</Button>
    </>
  );
  return (
    <Result
      status="success"
      title="Reservation Success"
      subTitle="Pick them up ASAP."
      extra={extra}
      className={styles.result}
    >
      {information}
    </Result>
  );
};

export default connect(({ findbook }) => ({
  data: findbook.step,
}))(Step3);
