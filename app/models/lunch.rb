# encoding: UTF-8

require "open-uri"
require "date"
class Lunch < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :meals

  def self.fetch_week
    doc = Nokogiri::HTML(open("http://www.studentenwerk-dresden.de/mensen/speiseplan/mensa-reichenbachstrasse.html"))
    days = doc.css("table.speiseplan")
    meals = days.css("tr")
    start_of_week = Date.parse(doc.css("#spalterechtsnebenmenue h1 a").inner_text.gsub(/.*vom (.*) bis.*/,'\1'))

    days.each_with_index do |day,i|
      lunch_name = day.css("thead tr .text").inner_text
      lunch_date = start_of_week.next_day i
      lunch = Lunch.create(:name => lunch_name, :date => lunch_date)

        day.css("tbody tr").each do |meal|
          name = meal.css("td.text").inner_text
          price_student = meal.css("td.preise").inner_text.split("/")[0].gsub(" € ","").gsub(",",".") rescue 0 #wenn ausverkauft...
          price_worker = meal.css("td.preise").inner_text.split("/")[1].gsub(" €","").gsub(",",".").strip rescue 0

          Meal.create(:name => name, :price_student => price_student, :price_worker => price_worker, :lunch_id => lunch.id)
        end
    break if i == 4
    end
  end
end
