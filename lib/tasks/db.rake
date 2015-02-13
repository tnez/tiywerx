namespace :db do
  desc "Populate database with data from CSV files"
  task load_csv_data: :environment do
    require 'csv'
    fakedata_dir = Rails.root.join("app/assets/fakedata")
    csvfiles = [
      {filename: 'locations.csv', model: Location},
      {filename: 'courses.csv', model: Course},
      {filename: 'cohorts.csv', model: Cohort}
    ]
    csvfiles.each do |csv|
      raw = File.read(fakedata_dir.join(csv[:filename]))
      parsed = CSV.parse(raw, :headers => true)
      parsed.each do |row|
        csv[:model].create!(row.to_hash)
      end
    end
  end

  desc "TODO"
  task initialize: :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["db:load_csv_data"].execute
  end

end
