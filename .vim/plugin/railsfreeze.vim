" Default templates with added frozen_string_literal: treu
let g:rails_projections = {
      \  "app/channels/*_channel.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons}Channel < ActionCable::Channel",
      \      "end",
      \    ],
      \  },
      \  "app/controllers/*_controller.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons}Controller < ApplicationController",
      \      "end",
      \    ],
      \  },
      \  "app/controllers/concerns/*.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "module {camelcase|capitalize|colons}",
      \      "\tinclude ActiveSupport::Concern",
      \      "end",
      \    ],
      \  },
      \  "app/helpers/*_helper.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "module {camelcase|capitalize|colons}Helper",
      \      "end",
      \    ],
      \  },
      \  "app/jobs/*_job.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons}Job < ActiveJob::Base",
      \      "end",
      \    ],
      \  },
      \  "app/mailers/*.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons} < ActionMailer::Base",
      \      "end",
      \    ],
      \  },
      \  "app/models/*.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons}",
      \      "end",
      \    ],
      \  },
      \  "app/serializers/*_serializer.rb": {
      \    "template": [
      \      "# frozen_string_literal: true",
      \      "",
      \      "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer",
      \      "end",
      \    ],
      \  },
      \}
