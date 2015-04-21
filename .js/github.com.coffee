if (actions = $(".repohead .pagehead-actions")).length
  [_, username, repo] = document.location.pathname.split("/", 3)
  actions.prepend("""<li><a href="http://rubygems.org/gems/#{repo}" class="btn btn-sm"><span>Rubygems</span></a></li>""")
  actions.prepend("""<li><a href="http://rdoc.info/github/#{username}/#{repo}/frames" class="btn btn-sm"><span>Rubydoc</span></a></li>""")
