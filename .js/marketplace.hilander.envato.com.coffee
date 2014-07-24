if (form = $("form.edit_user")).length
  name_input = form.find(":input[name='user[name]']")
  name_p = name_input.parent("p")

  bio_p = $("""<p>""")
  bio_label = $("""<label for="user_name">Bio</label>""").appendTo(bio_p)
  bio_p.append(" ")
  bio_input = $("""<textarea id="user_bio" name="user[bio]"></textarea>""").appendTo(bio_p)

  profile_href = document.location.href.replace(/\/edit$/, "")

  $.get profile_href, (data) ->
    bio = $(".bio", data).text().replace(/^\s+|\s+$/g, "")

    unless /hasn't added a bio yet$/.test bio
      bio_input.val(bio)

    name_p.after(bio_p)
