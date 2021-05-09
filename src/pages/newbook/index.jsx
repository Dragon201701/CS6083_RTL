import React, { useState, useEffect } from 'react';
import { Card, Steps } from 'antd';
import { PageContainer } from '@ant-design/pro-layout';
import { connect } from 'umi';
import Step1 from './components/Step1';
import Step2 from './components/Step2';
import Step3 from './components/Step3';
import Step4 from './components/Step4';
import styles from './style.less';
const { Step } = Steps;

const getCurrentStepAndComponent = (current) => {
  switch (current) {

    case 'newcopy':
      return {
        step: 0,
        component: <Step1 />,
      }
    case 'newbook':
      return {
        step: 1,
        component: <Step2 />,  
      }
    case 'confirm':
      return {
        step: 2,
        component: <Step3 />,
      };

    case 'result':
      return {
        step: 3,
        component: <Step4 />,
      };

    default:
      return {
        step: 0,
        component: <Step1 />,
      };
  }
};

const NewCopy = ({ current }) => {
  const [stepComponent, setStepComponent] = useState(<Step1 />);
  const [currentStep, setCurrentStep] = useState(0);
  useEffect(() => {
    const { step, component } = getCurrentStepAndComponent(current);
    console.log('New book use effect called. current step: ', step)
    setCurrentStep(step);
    setStepComponent(component);
  }, [current]);
  return (
    <PageContainer content="Add new copy if book exist. Otherwise enter new book inforamtion and author info if needed.">
      <Card bordered={false}>
        <>
          <Steps current={currentStep} className={styles.steps}>
            <Step title="New Copy" />
            <Step title="New Book Info" />
            <Step title="Confirm Copy Info" />
            <Step title="New Copy Added" />
          </Steps>
          {stepComponent}
        </>
      </Card>
    </PageContainer>
  );
};

export default connect(({ newcopy }) => ({
  current: newcopy.current,
}))(NewCopy);
