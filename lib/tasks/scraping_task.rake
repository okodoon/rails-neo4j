namespace :scraping_task do
  top_level = self

  using Module.new {
    refine(top_level.singleton_class) do
      def create_player_elemental(class_name, property, comparison)
        instance = eval('#{class_name}.new("#{property}": comparison)')
        byebug
        puts instance
      end
    end
  }
  desc 'はい'
  task :hi do
    create_player_elemental("Player", "name", "大河戸裕一")
  end

  desc 'Load the seed data from db/seeds.rb'
  task :scraping => :environment do
    puts "start scraping"

    kyudan_hash = {
                    "ヤクルト": 'http://baseball-data.com/player/s/',
                    "巨人": 'http://baseball-data.com/player/g/', 
                    "広島": 'http://baseball-data.com/player/c/',
                    "DeNA": 'http://baseball-data.com/player/yb/',
                    "中日": 'http://baseball-data.com/player/d/',
                    "阪神": 'http://baseball-data.com/player/t/',
                    "西武": 'http://baseball-data.com/player/l/',
                    "ソフトバンク": 'http://baseball-data.com/player/h/',
                    "日本ハム": 'http://baseball-data.com/player/f/',
                    "オリックス": 'http://baseball-data.com/player/bs/',
                    "ロッテ": 'http://baseball-data.com/player/m/',
                    "楽天": 'http://baseball-data.com/player/e/',
                  }
    
    kyudan_hash.each do |team, url|

      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      team = Team.create(name: team)
      now_player_id = ""
    
      document = Nokogiri::HTML.parse(html, nil, charset)
    
      document.search("table tbody tr").each do |doc|
        print "."
        baseball_hash = {player_name: "", position: "", birthday: "", age: "", career: "", tall: "", weight: "", blood_type: "", thrower_striker_type: "", birth_place: "", salary: ""}
        doc.search("td").each_with_index do |td, index|
          case index
          when 1
            baseball_hash[:player_name] = td.inner_text
          when 2
            baseball_hash[:position] = td.inner_text
          when 3
            baseball_hash[:birthday] = td.inner_text
          when 4
            baseball_hash[:age] = td.inner_text
          when 5
            baseball_hash[:career] = td.inner_text
          when 6
            baseball_hash[:tall] = td.inner_text
          when 7
            baseball_hash[:weight] = td.inner_text
          when 8
            baseball_hash[:blood_type] = td.inner_text
          when 9
            baseball_hash[:thrower_striker_type] = td.inner_text
          when 10
            baseball_hash[:birth_place] = td.inner_text
          when 11
            baseball_hash[:salary] = td.inner_text
          end
        end
        player = Player.create(name: baseball_hash[:player_name], birthday: baseball_hash[:birthday], salary: baseball_hash[:salary])
        team.players << player

        position = Position.find_by(position: baseball_hash[:position]).present? ? Position.find_by(position: baseball_hash[:position]) : Position.create(position: baseball_hash[:position])
        position.players << player

        age = Age.find_by(age: baseball_hash[:age]).present? ? Age.find_by(age: baseball_hash[:age]) : Age.create(age: baseball_hash[:age])
        age.players << player

        career = Career.find_by(year: baseball_hash[:career]).present? ? Career.find_by(year: baseball_hash[:career]) : Career.create(year: baseball_hash[:career])
        career.players << player

        tall = Tall.find_by(cm: baseball_hash[:tall]).present? ? Tall.find_by(cm: baseball_hash[:tall]) : Tall.create(cm: baseball_hash[:tall])
        tall.players << player

        weight = Weight.find_by(kg: baseball_hash[:weight]).present? ?  Weight.find_by(kg: baseball_hash[:weight]) : Weight.create(kg: baseball_hash[:weight])
        weight.players << player

        blood_type = BloodType.find_by(type: baseball_hash[:blood_type]).present? ? BloodType.find_by(type: baseball_hash[:blood_type]) : BloodType.create(type: baseball_hash[:blood_type])
        blood_type.players << player

        thrower_striker_type = ThrowerStrikerType.find_by(type: baseball_hash[:thrower_striker_type]).present? ? ThrowerStrikerType.find_by(type: baseball_hash[:thrower_striker_type]) : ThrowerStrikerType.create(type: baseball_hash[:thrower_striker_type])
        thrower_striker_type.players << player

        birth_place = BirthPlace.find_by(name: baseball_hash[:birth_place]).present? ? BirthPlace.find_by(name: baseball_hash[:birth_place]) : BirthPlace.create(name: baseball_hash[:birth_place])
        birth_place.players << player
      end
    end
  end
end
