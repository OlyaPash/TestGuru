class AboutController < ApplicationController
  def about
    @project = "TestGuru"
    @link_school = "https://thinknetica.com/"
  end

  def author
    @name = "Pashkova Olga"
    @link_github = "https://github.com/OlyaPash"
  end
end
