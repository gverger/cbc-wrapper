require 'mkmf'
ROOT_DIR = File.dirname(File.absolute_path(__FILE__))

## Rerun this if updated cbc version
#  swig_cmd = find_executable "swig"
#  current_path = File.expand_path('../', __FILE__)
#  %x{#{swig_cmd} -ruby -I#{current_path}/install/include/coin #{current_path}/cbc.i }

libs = %w[
  Cbc
  CbcSolver
  Cgl
  Clp
  ClpSolver
  CoinUtils
  Osi
  OsiCbc
  OsiClp
  OsiCommonTests
]

libs.each do |lib|
  find_library(lib, nil)
end

headers = Dir['coin/*.h'].map { |h| h.split('/').last }
headers.each do |header|
  puts find_header(header, 'coin/')
end

dir_config('cbc-wrapper')
RPATHFLAG << " -Wl,-rpath,'$$ORIGIN/install/lib'"
create_makefile('cbc_wrapper')
