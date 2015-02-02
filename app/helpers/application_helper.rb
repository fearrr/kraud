module ApplicationHelper
  def phone
    Global.first.phone
  end
  def email
    Global.first.email
  end
  def address
    Global.first.address
  end
  def workStart
    Global.first.workStart
  end
  def workEnd
    Global.first.workEnd
  end
end
