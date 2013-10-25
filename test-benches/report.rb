Dir.glob("*.log") { |fname|
  status = open(fname).grep(/FAIL/)
  status_string = "SUCCESS"
  if(status.length > 0) then
    status_string = "FAIL"
  end
  puts status_string + "\t" + fname.gsub(".log", "")
}
