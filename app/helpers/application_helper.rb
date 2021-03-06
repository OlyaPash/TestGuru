module ApplicationHelper
  def current_year
    Date.current.year
  end
  
  def github_url(author, repo)
    link_to "Project Test Guru", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(type)
    if flash[type]
      content_tag :p, flash[type], class:'flash #{type}'
    end
  end

end
