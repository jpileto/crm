require 'pry'

class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id) ##loop it through the @@contact class
    @@contacts.each do |contact|
    if id == contact.id
      return contact
    end
  end
end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attr_to_change, new_value)
    if attr_to_change == "first_name"
      self.first_name = new_value
    elsif attr_to_change == "last_name"
      self.last_name = new_value
    elsif attr_to_change == "email"
      self.email = new_value
    elsif attr_to_change == "note"
      self.note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      # binding.pry
      if attribute == "first_name" && value == contact.first_name
        return contact
      elsif attribute == "last_name" && value == contact.last_name
        return contact
      elsif attribute == "email" && value == contact.email
        return contact
      elsif attribute == "note" && value == contact.note
        return contact
      end
    end
  end

    # puts "Select a number to search by specific attribute:"
    # puts "Type '1' by first name"
    # puts "Type '2' by last name"
    # puts "Type '3' by email"
    # puts "Type '4' by note"
    # choice = gets.chomp
    # case choice
    # when '1'
    #   puts "Enter the first name"
    #   first_name = gets.chomp
    #   @@contacts.find { |contact| first_name == contact.first_name }
    # when '2'
    #   puts "Enter the last name"
    #   last_name = gets.chomp
    #   @@contacts.find { |contact| last_name == contact.last_name }
    # when '3'
    #   puts "Enter the email address"
    #   email = gets.chomp
    #   @@contacts.find { |contact| email == contact.email }
    # when '4'
    #   puts "Enter note"
    #   note = gets.chomp
    #   @@contacts.find { |contact| note == contact.note }
    # end


  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end


# j = Contact.create("jp", "ileto", "jp@jp.com", "person")
# m = Contact.create("mickey", "mouse", "mickey@disney.com", "mascot")
