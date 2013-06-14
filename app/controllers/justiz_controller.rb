class JustizController < InheritedResources::Base
  def create
    Court.delete_all

    scraper = Justiz::Scraper::Courts.new
    states = scraper.states
    types = scraper.court_types
    count = 0
    states.keys.each do |state|
      types.keys.each do |type|
        next if type == 'ALL'
        scraper.scrape(type, state).each do |contact|
          hash = {}.merge contact
          Court.create!(state: states[state], category: types[type], name: hash[:court], blob: {justiz: hash})
          count += 1
        end
      end
      break if count > 10
    end
    redirect_to courts_path, notice: "#{count} entries downloaded"
  end
end
