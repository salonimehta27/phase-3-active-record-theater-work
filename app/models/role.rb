class Role <ActiveRecord::Base
has_many :auditions

def actors
    self.auditions.map do |aud|
        aud.actor
    end
end

def locations
    self.auditions.map do |aud|
        aud.location
    end
end

def lead
   hired_inst= self.auditions.find do |aud|
        aud.hired
    end
    if(hired_inst.nil?)    
    "no actor has been hired for this role"
    else 
        hired_inst
    end
end

def understudy
    sec_hired=self.auditions.each do |aud|
        aud.hired==true
    end.second
    if(sec_hired.nil?)
        'no actor has been hired for understudy for this role'
    else
        sec_hired
    end
end
end