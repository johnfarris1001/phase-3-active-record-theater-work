clase Role < ActiveRecord::Base
    has_many :auditions

    def actors
        list = []
        self.auditions.each do |aud|
            list << aud.actor
        end
        list
    end

    def locations
        list = []
        self.auditions.each do |aud|
            list << aud.location
        end
        list
    end

    def lead
        self.auditions.each do |aud|
            if aud.hired
                return aud
            end
        end
        "no actor has been hired for this role"
    end

    def second
        lead = 0
        self.auditions.each do |aud|
            if aud.hired
                lead += 1
                if lead == 2 && aud.hired
                    return aud
                end
            end
        end
        "no actor has been hired for this role"
    end
end