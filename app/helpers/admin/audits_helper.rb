module Admin::AuditsHelper
  def record_name(audit)
    record = audit.auditable_type.constantize.where(:id => audit.auditable_id).first
    case record.class.name
    when "Person"
      record.full_name
    when "Employment"
      record.position_and_store
    when "Store"
      record.name
    when "User"
      record.login
    when "Position"
      record.name
    when "Appraisal"
      record.name
    when "Comment"
      record.reference
    when "Response"
      record.reference
    end
  end
end
