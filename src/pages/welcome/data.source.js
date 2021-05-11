import React from 'react';

import logo from './logo.png';

export const Banner01DataSource = {
  wrapper: { className: 'banner0' },
  textWrapper: { className: 'banner0-text-wrapper' },
  title: {
    className: 'banner0-title khxv5mz4h1i-editor_css',
    children: (<img src={logo} alt="logo" width="100%"/>)
  },
  content: {
    className: 'banner0-content',
    children: (
      <span>
        <span>
          <br/>
          <h1>
            Welcome to <br/>
          </h1>
          <h1>
            Read. Think. Learn.
          </h1>
          <p>
           <br />
          </p>
          <p>
          Database Project for CS-GY 6083 - B Spring-2021 
          <br/>
          Made by Albert Liu and Sakshi Mishra
<br />
          </p>
        </span>
      </span>
    ),
  },
  button: {
    className: 'banner0-button',
    children: (
      <span>
        <p>CLICK HERE TO START</p>
      </span>
    ),
    href: '/user/login',
  },
};