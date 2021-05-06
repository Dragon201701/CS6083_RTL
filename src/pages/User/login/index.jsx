import { AlipayCircleOutlined, TaobaoCircleOutlined, WeiboCircleOutlined } from '@ant-design/icons';
import { Alert, Checkbox } from 'antd';
import React, { useState } from 'react';
import { Link, connect } from 'umi';
import styles from './style.less';
import LoginFrom from './components/Login';
const { Tab, UserName, Password, Mobile, Captcha, Submit } = LoginFrom;

const LoginMessage = ({ content }) => (
  <Alert
    style={{
      marginBottom: 24,
    }}
    message={content}
    type="error"
    showIcon
  />
);

const Login = (props) => {
  const { userAndlogin = {}, submitting } = props;
  const { status, type: loginType } = userAndlogin;
  const [autoLogin, setAutoLogin] = useState(true);
  const [type, setType] = useState('account');

  const handleSubmit = (values) => {
    const { dispatch } = props;
    dispatch({
      type: 'userAndlogin/login',
      payload: { ...values, type },
    });
  };

  return (
    <div className={styles.main}>
      <LoginFrom activeKey={type} onTabChange={setType} onSubmit={handleSubmit}>
        <Tab key="account" tab="email login">
          {status === 'error' && loginType === 'account' && !submitting && (
            <LoginMessage content="email or password error（admin/ant.design）" />
          )}

          <UserName
            name="email"
            placeholder="email: admin or user"
            rules={[
              {
                required: true,
                message: 'Please enter email!',
              },
            ]}
          />
          <Password
            name="password"
            placeholder="Password: ant.design"
            rules={[
              {
                required: true,
                message: 'Please enter password',
              },
            ]}
          />
        </Tab>
        <div>
          <Checkbox checked={autoLogin} onChange={(e) => setAutoLogin(e.target.checked)}>
            Auto Login
          </Checkbox>
          <Link className={styles.register} to="/user/register" style={{
              float: 'right',
            }}>
            Account Register
          </Link>
          <a
            style={{
              float: 'right',
            }}
          >
            Foreget Password?&nbsp;&nbsp;
          </a>
          
        </div>
        <Submit loading={submitting}>Login</Submit>
      </LoginFrom>
    </div>
  );
};

export default connect(({ userAndlogin, loading }) => ({
  userAndlogin,
  submitting: loading.effects['userAndlogin/login'],
}))(Login);
