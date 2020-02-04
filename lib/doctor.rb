class Doctor 
  attr_accessor :name 
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  @@all = [] 
  def self.all 
    @@all 
  end 
  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end 
  def appointments 
    Appointment.all.select do |appt|
      appt.doctor == self 
    end 
  end 
  def patients 
    patients = [] 
    appointments.each do |appt|
      if !(patients.include?(appt.patient))
        patients << appt.patient 
      end 
    end 
    patients 
  end 
end 