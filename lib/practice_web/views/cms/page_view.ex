defmodule PracticeWeb.CMS.PageView do
  use PracticeWeb, :view

  alias Practice.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end
end
