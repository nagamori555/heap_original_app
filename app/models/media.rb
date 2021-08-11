class Media < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '漫画' },
    { id: 3, name: 'アニメ' },
    { id: 4, name: 'ドラマ' },
    { id: 5, name: '映画' },
    { id: 6, name: '小説' }
  ]
  include ActiveHash::Associations
  has_many :items
  end