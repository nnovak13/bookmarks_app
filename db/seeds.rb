Bookmark.delete_all


bookmark_count = 10

bookmark_count.times do |i|
  Bookmark.create!(
    id: "#{i}",
    title: "Title #{i}",
    url: "Url #{i}",
    category: "Category #{i}",
    comment: "Comment #{i}",
    is_favorite: "Favorite #{i}"
    )
end
