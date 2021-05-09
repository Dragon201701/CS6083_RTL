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
        component: './User/register',
      },
      {
        name: 'register-result',
        path: '/user/register-result',
        component: './User/register-result',
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
        authority: ['admin', 'employee'],
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
            authority: ['admin'],
            routes: [
              {
                name: 'Manage Copies',
                icon: 'book',
                path: '/admin/rentbook',
                component: './TableList',
              },
              {
                name: 'newbook',
                icon: 'book',
                path: '/admin/newbook',
                component: './newbook',
              },
              {
                name: 'Event Management',
                icon: 'smile',
                path: '/admin/allevents',
                component: './allevents',
              },
            ],
          },
          {
            name: 'findbook',
            icon: 'book',
            path: '/findbook',
            component: './findbook'
          },
          {
            name: 'invoice', 
            icon: 'MoneyCollectOutlined',
            path: '/invoice',
            component: './invoice',
          },
          {
            name: 'Exhibitions', 
            icon: 'Smile',
            path: '/exhibitions',
            component: './myexhibitions',
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
