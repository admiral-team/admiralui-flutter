def extract_issue_name(branch_name:)
  branch_array = branch_name.split("/")
  issue_name = branch_array.last.split("-").first
  issue_name
end