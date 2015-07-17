class PagesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Page.count,
        iTotalDisplayRecords: pages.total_entries,
        aaData: data
    }
  end

  private

  def data
    pages.map do |page|
      [
          page.id,
          page.name,
      ]
    end
  end

  def pages
    @pages ||= fetch_pages
  end

  def fetch_pages
    pages = Page.joins(:translations).group('pages.id').order("#{sort_column} #{sort_direction}")
    pages = pages.page(page).per_page(per_page)
    if params[:sSearch].present?
      pages = pages.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    pages
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
