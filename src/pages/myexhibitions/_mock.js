// eslint-disable-next-line import/no-extraneous-dependencies
const titles = [
  'Lit Fest',
  'Book Fest',
  'Rhymes',
  'Conrad Fest',
  'Harry Potter',
  'Poem Discussion',
];
const avatars = [
  'https://image.freepik.com/free-vector/powder-pastel-background-design_23-2148580875.jpg', // Alipay
  'https://static.vecteezy.com/system/resources/previews/000/277/973/original/vector-pastel-background.jpg', // Angular
  'https://images.pexels.com/photos/4016659/pexels-photo-4016659.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', // Ant Design
  'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1519652819000/photosp/5934e760-691d-40aa-8e32-def8b8ab6ecd/stock-photo-brick-wall-pastel-background-pastels-pastel-colors-pastel-color-pastel-colours-pastel-tones-pastel-pink-5934e760-691d-40aa-8e32-def8b8ab6ecd.jpg', // Ant Design Pro
  'https://image.shutterstock.com/image-vector/harry-potter-glasses-vector-icon-260nw-1528216298.jpg', // Bootstrap
  'https://www.freevector.com/uploads/vector/preview/30275/Geometric_Shapes_Pastel_Background.jpg', // React
  'https://images.unsplash.com/photo-1529702825578-c7fed05d18a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80', // Vue
  'https://images.pexels.com/photos/450066/pexels-photo-450066.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', // Webpack
];
const covers = [
  'https://gw.alipayobjects.com/zos/rmsportal/uMfMFlvUuceEyPpotzlq.png',
  'https://gw.alipayobjects.com/zos/rmsportal/iZBVOIhGJiAnhplqjvZW.png',
  'https://gw.alipayobjects.com/zos/rmsportal/iXjVmWVHbCJAyqvDxdtx.png',
  'https://gw.alipayobjects.com/zos/rmsportal/gLaIAoVWTtLbBWZNYEMg.png',
];
const desc = [
  'Fan of Literature? Then sign up for LIT FEST!',
  'Exhibition held for all you vintage book collectors! Join Now!',
  'Fun event for children to experience their favourite rhymes. 123.. Let kids joy in glee!',
  'We are hosting the famous Conrad Festival! Register Now to meet your favourite authors!',
  'All you wizards and witches are invited! Register here to experience the magic. Accio!',
  'Experience your favourite writers recite their poems! Register now!',
];
const user = [
  '付小小',
  '曲丽丽',
  '林东东',
  '周星星',
  '吴加好',
  '朱偏右',
  '鱼酱',
  '乐哥',
  '谭小仪',
  '仲尼',
];

function fakeList(count) {
  const list = [];

  for (let i = 0; i < 6; i += 1) {
    list.push({
      id: `fake-list-${i}`,
      owner: user[i % 10],
      title: titles[i % 6],
      avatar: avatars[i % 6],
      cover: parseInt(`${i / 4}`, 10) % 2 === 0 ? covers[i % 4] : covers[3 - (i % 4)],
      status: ['active', 'exception', 'normal'][i % 3],
      percent: Math.ceil(Math.random() * 50) + 50,
      logo: avatars[i % 8],
      href: 'https://ant.design',
      updatedAt: new Date(new Date().getTime() - 1000 * 60 * 60 * 2 * i).getTime(),
      createdAt: new Date(new Date().getTime() - 1000 * 60 * 60 * 2 * i).getTime(),
      subDescription: desc[i % 5],
      description: desc[i%6],
      activeUser: Math.ceil(Math.random() * 100000) + 100000,
      newUser: Math.ceil(Math.random() * 1000) + 1000,
      star: Math.ceil(Math.random() * 100) + 100,
      like: Math.ceil(Math.random() * 100) + 100,
      message: Math.ceil(Math.random() * 10) + 10,
      content:
        '段落示意：蚂蚁金服设计平台 ant.design，用最小的工作量，无缝接入蚂蚁金服生态，提供跨越设计与开发的体验解决方案。蚂蚁金服设计平台 ant.design，用最小的工作量，无缝接入蚂蚁金服生态，提供跨越设计与开发的体验解决方案。',
      members: [
        {
          avatar: 'https://i.pinimg.com/originals/99/00/79/990079817f68d54fb6410f94f9093310.jpg',
          name: '曲丽丽',
          id: 'member1',
        },
        {
          avatar: 'https://gw.alipayobjects.com/zos/rmsportal/tBOxZPlITHqwlGjsJWaF.png',
          name: '王昭君',
          id: 'member2',
        },
        {
          avatar: 'https://gw.alipayobjects.com/zos/rmsportal/sBxjgqiuHMGRkIjqlQCd.png',
          name: '董娜娜',
          id: 'member3',
        },
      ],
    });
  }

  return list;
}

function getFakeList(req, res) {
  const params = req.query;
  const count = params.count * 1 || 20;
  const result = fakeList(count);
  return res.json(result);
}

export default {
  'GET  /api/fake_list': getFakeList,
};
