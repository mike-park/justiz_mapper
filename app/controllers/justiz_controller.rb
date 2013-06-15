class JustizController < InheritedResources::Base
  def create
    Court.delete_all

    new_records = scrape('ALL', 'NRW')
    puts "Saving records #{new_records.length}"
    new_records.each do |record|
      Court.create!(record)
    end
    redirect_to courts_path, notice: "#{new_records.length} entries downloaded"
  end
  
  private
  
  def scrape(category, state)
    scraper = Justiz::Scraper::Courts.new
    states = scraper.states
    puts "Scraping #{state} #{category}"
    scraper.scrape(category, state).uniq.map do |contact|
      hash = {}.merge contact
      {state: states[state], name: hash[:court], blob: {justiz: hash}}
    end    
  end
end
