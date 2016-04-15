class Family < ActiveRecord::Base
  validates :name, :presence => true
  has_many :comments, :dependent => :destroy
  
  def self.stu
        status = Array.new
        i = 0
        self.select(:status).each do |stu|
            status[i] = stu.status
            i += 1;
        end
        puts "=================== #{status} ============"
        return status.sort
  end
  def self.all_status
        ["New","Longtime","Non","Prospective","Friend of BE","Ex","Deceased"]
  end
end
