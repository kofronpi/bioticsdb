class StrainPresenter
  attr_reader :strain

  def initialize(strain)
    @strain = strain
  end

  def marketed?
    strain.data['status'] == 'Marketed'
  end

  def researched?
    strain.data['status'] == 'Researched'
  end
end
