require 'mkmf'

## Rerun this if updated cbc version
#  swig_cmd = find_executable "swig"
#  current_path = File.expand_path('../', __FILE__)
#  %x{#{swig_cmd} -ruby -I#{current_path}/coin #{current_path}/cbc.i }

dir_config('cbc-wrapper')
dir_config('cbc')

succeed = true

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
  unless find_library(lib, nil)
    succeed = false
  end
end

headers = ["coin/Cbc_C_Interface.h", "coin/Coin_C_defines.h"]

headers.each do |header|
  unless find_header(header)
    succeed = false
  end
end

if succeed
  create_makefile('cbc_wrapper')
else
  abort "Missing some libraries or headers"
end
