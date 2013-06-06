module ReceipesHelper

  # Return mark if the given bundle_forms bundle should marked as changed
  def mark_as_changed(receipe, bundle_form)
    do_mark = receipe.errors[:aroma_percentage].present?
    do_mark &&= bundle_form.object.id == receipe.highest_aroma_percentage_bundle.id
    return do_mark ? '<b>>>>>>>></b>'.html_safe : ''
  end
end
