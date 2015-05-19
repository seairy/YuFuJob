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
    bench = Benchmark.measure do
      500.times do
        Job.create!(city: City.all.sample,
          title: Faker::Company.catch_phrase,
          content: Faker::Lorem.paragraph(10),
          visible: true,
          started_at: Faker::Date.backward(100),
        )
      end
    end
    p "finished in #{bench.real} second(s)"
  end
end