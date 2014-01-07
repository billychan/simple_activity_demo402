class Activity < SimpleActivity::Activity
  # no longer needed in newer version of simple_activity
  default_scope order('created_at DESC')
end
