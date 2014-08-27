" Add support for a few gems
let g:rails_gem_projections = {
  \ "active_model_serializers": {
  \   "app/serializers/*_serializer.rb": {
  \     "command": "serializer",
  \     "affinity": "model"}},
  \ "cucumber": {
  \   "features/*.feature": {
  \     "command": "feature",
  \     "template": ["Feature: %h", "  Scenario:", "    Given"],
  \     "related": "features/step_definitions/%s_steps.rb"},
  \   "features/step_definitions/*_steps.rb": {
  \     "command": "step",
  \     "related": "features/%s.feature"},
  \   "features/support/*.rb": {"command": "support"},
  \   "features/support/env.rb": {"command": "support"}}}

