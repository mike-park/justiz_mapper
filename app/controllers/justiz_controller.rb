class JustizController < InheritedResources::Base
  def create
    Court.delete_all

    scraper = Justiz::Scraper::Courts.new
    states = scraper.states
    types = scraper.court_types
    count = 0
    new_records = []
    states.keys.each do |state|
      next if state == 'ALL'
      type = 'ALL'
      puts "Scraping #{state} #{type}"
      scraper.scrape(type, state).uniq.each do |contact|
        hash = {}.merge contact
        new_records.push({state: states[state], name: hash[:court], blob: {justiz: hash}})
        count += 1
      end
    end
    puts "Saving records #{count}"
    new_records.each do |record|
      Court.create!(record)
    end
    redirect_to courts_path, notice: "#{count} entries downloaded"
  end
end
