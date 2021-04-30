export default [
  // {
  //   path: '/welcome',
  //   layout: '../layouts/BlankLayout',
  //   name: 'welcome',
  //   component: './welcome'
  // },
  {
    path: '/welcome',
    component: '../layouts/BlankLayout',
    routes: [
      {
        path: '/welcome',
        name: 'welcome',
        component: './welcome',
      }
    ]
  },
  {
    path: '/user',
    component: '../layouts/UserLayout',
    routes: [
      {
        name: 'login',
        path: '/user/login',
        component: './User/login',
      },
      {
        name: 'register',
        path: '/user/register',
        component: './user/register',
      },
      {
        name: 'register-result',
        path: '/user/register-result',
        component: './user/register-result',
      },
      {
        component: '404',
      },
    ],
  },
  {
    path: '/',
    component: '../layouts/SecurityLayout',
    routes: [
      {
        path: '/',
        component: '../layouts/BasicLayout',
        authority: ['admin', 'user'],
        routes: [
          {
            path: '/',
            redirect: '/index',
          },
          {
            path: '/index',
            name: 'index',
            icon: 'smile',
            component: './index',
          },
          {
            path: '/admin',
            name: 'admin',
            icon: 'crown',
            component: './Admin',
            authority: ['admin'],
            routes: [
              {
                path: '/admin/sub-page',
                name: 'sub-page',
                icon: 'smile',
                component: './index',
                authority: ['admin'],
              },
            ],
          },
          {
            name: 'list.table-list',
            icon: 'table',
            path: '/list',
            component: './TableList',
          },
          {
            component: './404',
          },
        ],
      },
      {
        component: './404',
      },
    ],
  },
    
  {
    component: './404',
  },
];
