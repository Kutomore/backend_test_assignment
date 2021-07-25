# frozen_string_literal: true

require 'swagger_helper'

describe 'CarRecommendations API', type: :request do
  path '/car_recommendations' do
    get 'Retrieves all car recommendations' do
      tags 'Car recommendations'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :user_id, in: :query, type: :string, description: 'The id of a user', required: true
      parameter name: :query, in: :query, type: :string, description: 'Part or the entirety of the name of a brand'
      parameter name: :price_min, in: :query, type: :string, description: 'The minimal price for the recommendation'
      parameter name: :price_max, in: :query, type: :string, description: 'The maximum price for the recommendation'

      response '200', 'recommendations found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: {
                     type: :integer
                   },
                   brand: {
                     type: :object,
                     properties: {
                       id: {
                         type: :integer
                       },
                       name: {
                         type: :string
                       }
                     }
                   },
                   model: {
                     type: :string
                   },
                   price: {
                     type: :integer
                   },
                   rank_score: {
                     type: :string,
                     nullable: true
                   },
                   label: {
                     type: :string,
                     nullable: true
                   }
                 }
               },
               example: [
                 {
                   id: 5,
                   brand: {
                     id: 2,
                     name: 'Alfa Romeo'
                   },
                   model: 'Arna',
                   price: '39938',
                   rank_score: '0.4552',
                   label: 'perfect_match'
                 },
                 {
                   id: 179,
                   brand: {
                     id: 39,
                     name: 'Volkswagen'
                   },
                   model: 'Derby',
                   price: 37_230,
                   rank_score: '0.945',
                   label: 'perfect_match'
                 },
                 {
                   id: 180,
                   brand: {
                     id: 39,
                     name: 'Volkswagen'
                   },
                   model: 'e-Golf',
                   price: 35_131,
                   rank_score: nil,
                   label: 'perfect_match'
                 },
                 {
                   id: 181,
                   brand: {
                     id: 39,
                     name: 'Volkswagen'
                   },
                   model: 'Amarok',
                   price: 31_743,
                   rank_score: nil,
                   label: 'good_match'
                 },
                 {
                   id: 186,
                   brand: {
                     id: 2,
                     name: 'Alfa Romeo'
                   },
                   model: 'Brera',
                   price: 40_938,
                   rank_score: nil,
                   label: 'good_match'
                 },
                 {
                   id: 13,
                   brand: {
                     id: 3,
                     name: 'Audi'
                   },
                   model: '90',
                   price: 56_959,
                   rank_score: '0.567',
                   label: nil
                 },
                 {
                   id: 97,
                   brand: {
                     id: 20,
                     name: 'Lexus'
                   },
                   model: 'IS 220',
                   price: 39_858,
                   rank_score: 0.9489,
                   label: nil
                 },
                 {
                   id: 113,
                   brand: {
                     id: 24,
                     name: 'Mazda'
                   },
                   model: '3',
                   price: 1542,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 100,
                   brand: {
                     id: 20,
                     name: 'Lexus'
                   },
                   model: 'RX 300',
                   price: 1972,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 184,
                   brand: {
                     id: 40,
                     name: 'Volvo'
                   },
                   model: 610,
                   price: 3560,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 142,
                   brand: {
                     id: 31,
                     name: 'Ram'
                   },
                   model: 'Promaster City',
                   price: 3687,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 120,
                   brand: {
                     id: 26,
                     name: 'Mercury'
                   },
                   model: 'Marauder',
                   price: 3990,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 109,
                   brand: {
                     id: 23,
                     name: 'Maserati'
                   },
                   model: 'Levante',
                   price: 4243,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 89,
                   brand: {
                     id: 16,
                     name: 'Infiniti'
                   },
                   model: 'M25',
                   price: 4372,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 164,
                   brand: {
                     id: 35,
                     name: 'Smart'
                   },
                   model: 'Forfour',
                   price: 4391,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 81,
                   brand: {
                     id: 14,
                     name: 'Honda'
                   },
                   model: 'Pilot',
                   price: 4473,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 182,
                   brand: {
                     id: 40,
                     name: 'Volvo'
                   },
                   model: 265,
                   price: 5208,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 54,
                   brand: {
                     id: 10,
                     name: 'Dodge'
                   },
                   model: 'Ramcharger',
                   price: 5425,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 108,
                   brand: {
                     id: 23,
                     name: 'Maserati'
                   },
                   model: 'Coupe',
                   price: 5508,
                   rank_score: nil,
                   label: nil
                 },
                 {
                   id: 86,
                   brand: {
                     id: 16,
                     name: 'Infiniti'
                   },
                   model: 'M37',
                   price: 5698,
                   rank_score: nil,
                   label: nil
                 }
               ],
               required: %w[id brand model price rank_score label]

        let(:user_id) { FactoryBot.create(:user_with_preferred_brands).id.to_s }
        let(:query) { Brand.first.name }
        let(:price_min) { 0 }
        let(:price_max) { 100_000 }
        run_test!
      end

      response '400', 'missing param' do
        schema type: :object,
               properties: {

               },
               required: %w[error]
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error'],
               example: [
                 {
                   error: 'param is missing or the value is empty: user_id'
                 }
               ]

        let(:user_id) { nil }
        let(:query) { nil }
        let(:price_min) { nil }
        let(:price_max) { nil }
        run_test!
      end
    end
  end
end
