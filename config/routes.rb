Rails.application.routes.draw do
  root 'home#welcome'

  concern :has_related_strain do
    resources :strains, only: :show
  end

  resources :probiotics, only: [:show, :index], concerns: :has_related_strain
  resources :illnesses, as: 'classes', only: [:show, :index], concerns: :has_related_strain
  resources :effects, only: [:show, :index], concerns: :has_related_strain
end
