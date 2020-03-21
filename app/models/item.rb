class Item < ApplicationRecord
  belongs_to :institution

  enum kind: { request: 0, offer: 1 }
  enum status: { open: 0, in_progress: 1, solved: 2 }

  before_save :set_project_identifier

  def set_project_identifier
    if self.identifier.nil?
      new_identifier = Item.create_identifier
      while Item.where(identifier: new_identifier).any? do
        new_identifier = Item.create_identifier
      end
      self.identifier = new_identifier
      self.save
    end
  end

  def self.create_identifier
    ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
  end


end
