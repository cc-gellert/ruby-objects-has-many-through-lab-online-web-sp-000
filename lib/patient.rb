class Patient
  attr_accessor :name 
  @@all = [] 
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end 
  def appointments 
    Appointment.all.select do |appt|
      appt.patient == self 
    end 
  end 
  def doctors
    drArr = [] 
    appointments.each do |dr| 
      if !(drArr.include?(dr))
        drArr << dr 
      end 
    end 
    drArr 
  end 
end 