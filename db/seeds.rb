# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'smarter_csv'
ActiveRecord::Base.transaction do
  SmarterCSV.process(Rails.root.join('db', 'seeds', 'human_data_.csv'), { col_sep: ';',  keep_original_headers: true, convert_values_to_numeric: false } ) do |chunk|
    chunk.each do |data|
      probiotic = Probiotic.find_or_create_by(name: data['probiotic_name'])
      strain = Strain.new(probiotic: probiotic, strain_id: data['strain_id'],
       strain_name: data['strain_name'], data: data.to_json)
      data['effect'].split("; ").each do |effect|
        eff = Effect.find_or_create_by(name: effect)
        strain.effects << eff
      end
      data['class'].split("; ").each do |illness|
        ill = Illness.find_or_create_by(name: illness)
        strain.illnesses << ill
      end
      strain.save!
    end
  end
end
