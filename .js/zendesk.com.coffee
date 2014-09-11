jQuery(document).on "keydown", "textarea", (e) ->
  if e.metaKey and e.which is 13
    e.preventDefault()
    e.currentTarget.form.submit()
