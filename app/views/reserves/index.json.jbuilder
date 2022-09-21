# frozen_string_literal: true

json.array! @reserves, partial: 'reserves/reserve', as: :reserve
