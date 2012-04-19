module UsersHelper
  def person_indicator(user)
    if user.person
      result = user.person.id_and_full_name
    else
      result = "<span class='label label-important'>No Person!</span>"
    end
    result.html_safe
  end
end
