" Update rspec templates in projections
" let g:rails_projections = {
"   \   "spec/models/*_spec.rb": {
"   \     "affinity": "model",
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %S do', 'end']
"   \   },
"   \
"   \   "spec/helpers/*_spec.rb": {
"   \     "command": "spec",
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %S do', 'end']
"   \   },
"   \   "spec/helpers/*_helper_spec.rb": {
"   \     "command": "spec",
"   \     "affinity": "controller",
"   \     "complete": 0,
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %SHelper do', 'end']
"   \   },
"   \
"   \   "spec/controllers/*_spec.rb": {
"   \     "command": "spec",
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %S do', 'end']
"   \   },
"   \   "spec/controllers/*_controller_spec.rb": {
"   \     "command": "spec",
"   \     "affinity": "controller",
"   \     "complete": 0,
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %SController do', 'end']
"   \   },
"   \
"   \   "spec/mailers/*_spec.rb": {
"   \     "command": "spec",
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %S do', 'end']
"   \   },
"   \   "spec/mailers/*_mailer_spec.rb": {
"   \     "command": "spec",
"   \     "affinity": "controller",
"   \     "complete": 0,
"   \     "template": ['require "rails_helper"', '', 'RSpec.describe %SMailer do', 'end']
"   \   }
"   \ }

" Add support for a few gems
let g:rails_gem_projections = {
  \ "active_model_serializers": {
  \   "app/serializers/*_serializer.rb": {
  \     "command": "serializer",
  \     "affinity": "model"}},
  \ "cucumber": {
  \   "features/*.feature": {
  \     "command": "feature",
  \     "template": ["Feature: {underscore|capitalize|blank}", "  Scenario:", "    Given"],
  \     "related": "features/step_definitions/{}_steps.rb"},
  \   "features/step_definitions/*_steps.rb": {
  \     "command": "step",
  \     "related": "features/{}.feature"},
  \   "features/support/*.rb": {"command": "support"},
  \   "features/support/env.rb": {"command": "support"}},
  \ "simple_form": {
  \   "app/inputs/*_input.rb": {
  \     "command": "input",
  \     "template": ["class {camelcase|capitalize|colons}Input < SimpleForm::Inputs::Base", "end"],
  \     "test": ["test/unit/{}_input_test.rb", "spec/inputs/{}_input_spec.rb"]}}}

autocmd User Rails silent! Lcd
autocmd User Rails map <buffer> <F9> :Rake<CR>
