# -*- encoding : utf-8 -*-
require 'faker'

namespace :db do
  desc 'Reset the database structure then rebuild and load the seed data'
  task :rebuild do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:clone'].invoke
    Rake::Task['db:seed'].invoke
  end

  desc 'Fill database with fake data'
  task :populate => :environment do |t, args|
    job_titles = %w{初级产品经理 中级产品经理 高级产品经理 产品总监 财务总监 总会计师 董事长助理/秘书 客服专员 福卡柜员 内部审计师 审计经理 应用运维工程师 资金经理 战略发展部总监/经理 互联网金融产品经理 总监助理 Java初级工程师 Java中级工程师 Java高级工程师 高级工程师 QA初级工程师（应届生） iOS初级工程师 iOS中级工程师 iOS高级工程师 UI初级设计师 UI中级设计师 UI高级设计师}
    bench = Benchmark.measure do
      500.times do
        Job.create!(city: City.all.sample,
          title: job_titles.sample,
          content: Faker::Lorem.paragraph(100),
          visible: true,
          started_at: Faker::Date.backward(100),
        )
      end
    end
    p "finished in #{bench.real} second(s)"
  end
end