# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/reserves').to route_to('reserves#index')
    end

    it 'routes to #new' do
      expect(get: '/reserves/new').to route_to('reserves#new')
    end

    it 'routes to #show' do
      expect(get: '/reserves/1').to route_to('reserves#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/reserves/1/edit').to route_to('reserves#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/reserves').to route_to('reserves#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/reserves/1').to route_to('reserves#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/reserves/1').to route_to('reserves#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/reserves/1').to route_to('reserves#destroy', id: '1')
    end
  end
end
