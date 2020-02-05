class Baby < ApplicationRecord
    has_many :breastfeedings, dependent: :destroy

    def total_breastfeedings
        feed_today.count
    end

    def total_feed_volume
        breastfeedings.sum(:volume)
    end

    # Cuanta cantidad ha tomado hoy
    def today_feed_volume
        feed_today.sum(:volume)
    end

    # Cuánto tiempo ha tomado este día
    def today_feed_time
        feed_today.sum(:feeding_time)
    end

    # Cuantas veces a tomado pecho hoy ese niño
    def today_feed_times
        feed_today.count
    end

    def last_time
        breastfeedings.last.created_at
    end 


    private

    def feed_today
        breastfeedings.where('created_at > ?', Date.today)
    end

end