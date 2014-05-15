module ReportsHelper
  def escape_commas(string)
    string ||= ""
    string.gsub(",", '+')
  end
end
