class Preference < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '大好き' },
    { id: 3, name: '好き' },
    { id: 4, name: '普通' },
    { id: 5, name: '別に' }
  ]
  include ActiveHash::Associations
  has_many :items
  end