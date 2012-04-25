class SearchController < ApplicationController
  def do
    if params[:q].blank?
      params[:q] = "xxxzxzxzzzxzxzxzxz"
    end
    q = "%#{params[:q]}%"
    @results = []
    Person.where('last_name LIKE ? OR first_name LIKE ?', q, q).all.each do |person|
      @results << person
    end
    Store.where('name LIKE ?', q).all.each do |store|
      @results << store
    end
    Appraisal.where('name LIKE ?', q).all.each do |appraisal|
      @results << appraisal
    end
    respond_to do |format|
      format.js
    end
  end
end
