const data = {
  categories: [ 'Cà phê', 'Nước giải khát', 'Trà', 'Sữa chua' ],
  volumes: [ '500', '330', '600', '20' ],
  products: [
    {
      name: 'Cà phê muối',
      category: 'Cà phê',
      description: 'Cà phê muối (Salted coffee)'
    },
    {
      name: 'Cà phê dừa',
      category: 'Cà phê',
      description: 'Cà phê dừa (Coconut coffee)'
    },
    {
      name: 'Sữa tươi cà phê',
      category: 'Cà phê',
      description: 'Sữa tươi cà phê (Fresh milk coffee)'
    },
    {
      name: 'Bạc sỉu',
      category: 'Cà phê',
      description: 'Bạc sỉu (White coffee)'
    },
    {
      name: 'Cà phê kem phô mai',
      category: 'Cà phê',
      description: 'Cà phê kem phô mai'
    },
    {
      name: 'Cà phê sữa',
      category: 'Cà phê',
      description: 'Cà phê sữa (Milk coffee)'
    },
    {
      name: 'Cà phê đen',
      category: 'Cà phê',
      description: 'Cà phê đen (Black coffee)'
    },
    {
      name: 'Cà phê muối chai',
      category: 'Cà phê',
      description: 'Cà phê muối chai (Coffee bottle)'
    },
    {
      name: 'Ca cao sữa',
      category: 'Nước giải khát',
      description: 'Ca cao sữa (Milk cocoa)'
    },
    {
      name: 'Trà đác thơm',
      category: 'Trà',
      description: 'Trà đác thơm'
    },
    {
      name: 'Trà tắc xi muối',
      category: 'Trà',
      description: 'Trà tắc xi muối'
    },
    {
      name: 'Trà me',
      category: 'Trà',
      description: 'Trà me (Tamarind tea)'
    },
    {
      name: 'Sữa chua chanh dây',
      category: 'Sữa chua',
      description: 'Sữa chua chanh dây (Passion fruit yogurt)'
    },
    {
      name: 'Chanh dây',
      category: 'Nước giải khát',
      description: 'Chanh dây (Passion juice)'
    },
    {
      name: 'Sữa chua đá',
      category: 'Sữa chua',
      description: 'Sữa chua đá'
    }
  ],
  variants: [
    { product: 'Cà phê muối', volume: '330', name: 'Thường' },
    { product: 'Cà phê muối', volume: '600', name: 'Lớn' },
    { product: 'Cà phê dừa', volume: '330', name: 'Thường' },
    { product: 'Cà phê dừa', volume: '600', name: 'Lớn' },
    { product: 'Sữa tươi cà phê', volume: '330', name: 'Thường' },
    { product: 'Sữa tươi cà phê', volume: '600', name: 'Lớn' },
    { product: 'Bạc sỉu', volume: '330', name: 'Thường' },
    { product: 'Bạc sỉu', volume: '600', name: 'Lớn' },
    { product: 'Cà phê kem phô mai', volume: '330', name: 'Thường' },
    { product: 'Cà phê kem phô mai', volume: '600', name: 'Lớn' },
    { product: 'Cà phê sữa', volume: '330', name: 'Thường' },
    { product: 'Cà phê sữa', volume: '600', name: 'Lớn' },
    { product: 'Cà phê đen', volume: '330', name: 'Thường' },
    { product: 'Cà phê đen', volume: '600', name: 'Lớn' },
    { product: 'Cà phê muối chai', volume: '330', name: 'Thường'[39m },
    { product: 'Ca cao sữa', volume: '500', name: 'Lớn' },
    { product: 'Trà đác thơm', volume: '500', name: 'Lớn' },
    { product: 'Trà tắc xi muối', volume: '500', name: 'Lớn' },
    { product: 'Trà me', volume: '500', name: 'Lớn' },
    { product: 'Sữa chua chanh dây', volume: '500', name: 'Lớn' },
    { product: 'Chanh dây', volume: '500', name: 'Lớn' },
    { product: 'Sữa chua đá', volume: '500', name: 'Lớn' }
  ],
  prices: [
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 18000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 60000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 65000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 65000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 65000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 65000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Lớn',
      amount: 65000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 20000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Shopee'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 20000,
      branch: '',
      salesChannel: 'VILL'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 20000,
      branch: '',
      salesChannel: 'RIO'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 20000,
      branch: '',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Grab'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Be'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: '',
      salesChannel: 'Shopee'
    },
  ],
  branches: [ '' ],
  salesChannels: [ 'Tại quán', 'Grab', 'Be', 'Shopee', 'VILL', 'RIO' ]
}