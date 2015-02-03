#encoding: utf-8
module Concerns::Admins::FindByParams

  def build_query hash
    hash = del_empty_and_redundancy hash
    set_instance_variable hash
    hash
  end

  def set_instance_variable query    
    query.map do |k,v|
      k = k.gsub(".","_")
      self.instance_variable_set("@#{k}", v)
    end
  end

  def del_empty_and_redundancy query
    query.map do |k,v|
      query.delete(k) if query[k].blank?
    end
    ["controller","action","page"].each{|item|query.delete(item)} 
    query
  end
end