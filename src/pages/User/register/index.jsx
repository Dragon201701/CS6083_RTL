import { Form, Button, Col, Input, Popover, Progress, Row, Select, message, Radio } from 'antd';
import React, { useState, useEffect } from 'react';
import { Link, connect, history, FormattedMessage, formatMessage } from 'umi';
import styles from './style.less';
const FormItem = Form.Item;
const { Option } = Select;
const InputGroup = Input.Group;
const passwordStatusMap = {
  ok: (
    <div className={styles.success}>
      <FormattedMessage id="userandregister.strength.strong" />
    </div>
  ),
  pass: (
    <div className={styles.warning}>
      <FormattedMessage id="userandregister.strength.medium" />
    </div>
  ),
  poor: (
    <div className={styles.error}>
      <FormattedMessage id="userandregister.strength.short" />
    </div>
  ),
};
const passwordProgressMap = {
  ok: 'success',
  pass: 'normal',
  poor: 'exception',
};

const Register = ({ submitting, dispatch, userAndregister }) => {
  const [count, setcount] = useState(0);
  const [visible, setvisible] = useState(false);
  const [prefix, setprefix] = useState('86');
  const [popover, setpopover] = useState(false);
  const [custid_type, setcustid_type] = useState(0);
  const confirmDirty = false;
  let interval;
  const [form] = Form.useForm();
  useEffect(() => {
    if (!userAndregister) {
      return;
    }

    const account = form.getFieldValue('mail');

    if (userAndregister.status === 'ok') {
      message.success('注册成功！');
      history.push({
        pathname: '/user/register-result',
        state: {
          account,
        },
      });
    }
  }, [userAndregister]);
  useEffect(
    () => () => {
      clearInterval(interval);
    },
    [],
  );

  const onGetCaptcha = () => {
    let counts = 59;
    setcount(counts);
    interval = window.setInterval(() => {
      counts -= 1;
      setcount(counts);

      if (counts === 0) {
        clearInterval(interval);
      }
    }, 1000);
  };

  const getPasswordStatus = () => {
    const value = form.getFieldValue('password');

    if (value && value.length > 9) {
      return 'ok';
    }

    if (value && value.length > 5) {
      return 'pass';
    }

    return 'poor';
  };

  const onFinish = (values) => {
    dispatch({
      type: 'userAndregister/submit',
      payload: { ...values, prefix },
    });
  };

  const checkConfirm = (_, value) => {
    const promise = Promise;

    if (value && value !== form.getFieldValue('password')) {
      return promise.reject(
        formatMessage({
          id: 'userandregister.password.twice',
        }),
      );
    }

    return promise.resolve();
  };

  const checkPassword = (_, value) => {
    const promise = Promise; // 没有值的情况

    if (!value) {
      setvisible(!!value);
      return promise.reject(
        formatMessage({
          id: 'userandregister.password.required',
        }),
      );
    } // 有值的情况

    if (!visible) {
      setvisible(!!value);
    }

    setpopover(!popover);

    if (value.length < 6) {
      return promise.reject('');
    }

    if (value && confirmDirty) {
      form.validateFields(['confirm']);
    }

    return promise.resolve();
  };

  const changePrefix = (value) => {
    setprefix(value);
  };

  const custid_type_options = [
    { label: 'Driver License', value: 'DL'}, {label: 'SSN', value: 'SSN'},  {label: 'Passport', value: 'PASSPORT'}
  ]
  const custid_type_onChange = e => {
    console.log('radio4 checked', e.target.value);
    setcustid_type(e.target.value)
  };

  const renderPasswordProgress = () => {
    const value = form.getFieldValue('password');
    const passwordStatus = getPasswordStatus();
    return value && value.length ? (
      <div className={styles[`progress-${passwordStatus}`]}>
        <Progress
          status={passwordProgressMap[passwordStatus]}
          className={styles.progress}
          strokeWidth={6}
          percent={value.length * 10 > 100 ? 100 : value.length * 10}
          showInfo={false}
        />
      </div>
    ) : null;
  };

  return (
    <div className={styles.main}>
      <h3>
        <FormattedMessage id="userandregister.register.register" />
      </h3>
      <Form form={form} name="UserRegister" onFinish={onFinish}>
        <FormItem
          name="mail"
          rules={[
            {
              required: true,
              message: formatMessage({
                id: 'userandregister.email.required',
              }),
            },
            {
              type: 'email',
              message: formatMessage({
                id: 'userandregister.email.wrong-format',
              }),
            },
          ]}
        >
          <Input
            size="large"
            placeholder={formatMessage({
              id: 'userandregister.email.placeholder',
            })}
          />
        </FormItem>
        <Popover
          getPopupContainer={(node) => {
            if (node && node.parentNode) {
              return node.parentNode;
            }

            return node;
          }}
          content={
            visible && (
              <div
                style={{
                  padding: '4px 0',
                }}
              >
                {passwordStatusMap[getPasswordStatus()]}
                {renderPasswordProgress()}
                <div
                  style={{
                    marginTop: 10,
                  }}
                >
                  <FormattedMessage id="userandregister.strength.msg" />
                </div>
              </div>
            )
          }
          overlayStyle={{
            width: 240,
          }}
          placement="right"
          visible={visible}
        >
          <FormItem
            name="password"
            className={
              form.getFieldValue('password') &&
              form.getFieldValue('password').length > 0 &&
              styles.password
            }
            rules={[
              {
                validator: checkPassword,
              },
            ]}
          >
            <Input
              size="large"
              type="password"
              placeholder={formatMessage({
                id: 'userandregister.password.placeholder',
              })}
            />
          </FormItem>
        </Popover>
        <FormItem
          name="confirm"
          rules={[
            {
              required: true,
              message: formatMessage({
                id: 'userandregister.confirm-password.required',
              }),
            },
            {
              validator: checkConfirm,
            },
          ]}
        >
          <Input
            size="large"
            type="password"
            placeholder={formatMessage({
              id: 'userandregister.confirm-password.placeholder',
            })}
          />
        </FormItem>

        <FormItem
          name="cfname"
        >
          <Input
            size="large"
            placeholder={formatMessage({
              id: 'userandregister.fname.placeholder',
            })}
          />
        </FormItem>
        <FormItem
          name="clname"
        >
          <Input
            size="large"
            placeholder={formatMessage({
              id: 'userandregister.lname.placeholder',
            })}
          />
        </FormItem>
        <FormItem
          name="cphone"
        >
          <Input
            size="large"
            placeholder={formatMessage({
              id: 'userandregister.phone-number.placeholder',
            })}
          />
        </FormItem>
        <FormItem
          name="custid_type"
        >
          <Radio.Group
            options={custid_type_options}
            onChange={custid_type_onChange}
            value={custid_type}
            optionType="button"
            buttonStyle="solid"
          />
        </FormItem>
        

        <FormItem
          name="custid_num"
        >
          <Input
            size="large"
            placeholder={"ID number"}
          />
        </FormItem>
        
        
        <FormItem>
          <Button
            size="large"
            loading={submitting}
            className={styles.submit}
            type="primary"
            htmlType="submit"
          >
            <FormattedMessage id="userandregister.register.register" />
          </Button>
          <Link className={styles.login} to="/user/login">
            <FormattedMessage id="userandregister.register.sign-in" />
          </Link>
        </FormItem>
      </Form>
    </div>
  );
};

export default connect(({ userAndregister, loading }) => ({
  userAndregister,
  submitting: loading.effects['userAndregister/submit'],
}))(Register);
