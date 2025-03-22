module RecipesHelper
  # Adds/removes tag_ids for querying
  def toggle_tag_in_params(tag_id)
    current_tags = params[:tag_ids] || []
    current_tags = current_tags.is_a?(String) ? current_tags.split(",") : current_tags.map(&:to_s)

    if current_tags.include?(tag_id.to_s)
      # Removes the tag
      current_tags.delete(tag_id.to_s)
    else
      # Adds the tag
      current_tags << tag_id.to_s
    end

    # Returns the query parameters
    { tag_ids: current_tags.any? ? current_tags.join(",") : nil }
  end
end
