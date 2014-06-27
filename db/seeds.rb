Bookmark.delete_all


bookmark_count = 5

bookmark_count.times do |i|
  Bookmark.create!(
    id: "# #{}"
    title: "Title #{i}",
    url: "url #{i}",
    category: "Category #{i}",
    comment: "Comment #{i}",
    is_favorite: "Favorite #{i}"
    )
end
