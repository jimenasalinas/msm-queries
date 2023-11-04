

class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def index_youngest
    matching_young = Director.where.not(dob: nil)
    youngest_director = matching_young.order(dob: :asc).last
    @youngest_director = youngest_director
    render(template: "director_templates/list_young")
  end

  def index_eldest
    matching_young = Director.where.not(dob: nil)
    eldest_director = matching_young.order(dob: :asc).first
    @eldest_director = eldest_director
    render(template: "director_templates/list_eldest")
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id })
    @the_director = matching_records.at(0)
    render({:template => "director_templates/details"})
  end
end
