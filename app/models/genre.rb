class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '学園・青春' },
    { id: 3, name: 'ギャグ・コメディ' },
    { id: 4, name: 'ヒューマン' },
    { id: 5, name: '格闘・バトル' },
    { id: 6, name: '異世界・ファンタジー' },
    { id: 7, name: 'SF' },
    { id: 8, name: 'ホラー' },
    { id: 9, name: '恋愛' },
    { id: 10, name: 'スポーツ' },
    { id: 11, name: '音楽' },
    { id: 12, name: '料理・グルメ' },
    { id: 13, name: '推理・ミステリー' },
    { id: 14, name: 'ギャンブル' },
    { id: 15, name: 'ヤンキー' },
    { id: 16, name: '冒険' },
    { id: 17, name: '歴史・時代劇' }
  ]
  include ActiveHash::Associations
  has_many :items
  end