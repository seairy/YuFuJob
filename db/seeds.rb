# -*- encoding : utf-8 -*-
Administrator.create!(account: 'admin', password: '123456', password_confirmation: '123456', name: '管理员', available: true)
City.create!([
  { name: '北京', position: 1, featured: true },
  { name: '上海', position: 1, featured: true },
  { name: '广州', position: 1, featured: true },
  { name: '成都', position: 1, featured: true },
  { name: '青岛', position: 1, featured: true },
  { name: '南京', position: 1, featured: true },
  { name: '济南', position: 1, featured: true },
  { name: '贵阳', position: 1, featured: true },
  { name: '郑州', position: 1, featured: true },
  { name: '徐州', featured: false },
  { name: '呼和浩特', featured: false },
  { name: '深圳', featured: false },
  { name: '南昌', featured: false }
])
